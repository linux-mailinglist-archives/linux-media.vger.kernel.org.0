Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB7376933F0
	for <lists+linux-media@lfdr.de>; Sat, 11 Feb 2023 22:08:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbjBKVIs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Feb 2023 16:08:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbjBKVIr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Feb 2023 16:08:47 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC0F913DD3
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 13:08:44 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A029A6CF;
        Sat, 11 Feb 2023 22:08:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676149722;
        bh=MupIIkgdoaKxK5yfBaBOHP7Ex7VJDLYz9J5OapxxbCs=;
        h=From:To:Cc:Subject:Date:From;
        b=Kx/rKU1QxMq5fpB/ifzrsPHaIbOFWbzvadQCxXDMhCwWh7xB5Wx0waclj5V4gRROy
         iHW2BSePUHhe/xCE2FjUvnGJz635eaA7jYP7QGWxq0TBgS6AyWmgbs7uWDwkU4QlT6
         JM9YCkK+tI+dvtULImYGiXw61zssQhNfVfKYghss=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Gregor Jasny <gjasny@googlemail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] libv4lconvert: Don't ignore return value of ftruncate()
Date:   Sat, 11 Feb 2023 23:08:41 +0200
Message-Id: <20230211210841.20163-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ftruncate() function is declared with the warn_unused_result
attribute, which generates a warning when compiling libv4lconvert:

[60/340] Compiling C object lib/libv4lconvert/libv4lconvert.so.0.0.0.p/control_libv4lcontrol.c.o
../lib/libv4lconvert/control/libv4lcontrol.c: In function ‘v4lcontrol_create’:
../lib/libv4lconvert/control/libv4lcontrol.c:728:17: warning: ignoring return value of ‘ftruncate’ declared with attribute ‘warn_unused_result’ [-Wunused-result]
  728 |                 ftruncate(shm_fd, V4LCONTROL_SHM_SIZE);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fix it by checking the return value and falling back to malloc-ed memory
for controls, as done when mmap() fails.

While at it, fix a typo in a comment, and drop an unneeded "error" word
from an error message.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 lib/libv4lconvert/control/libv4lcontrol.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/lib/libv4lconvert/control/libv4lcontrol.c b/lib/libv4lconvert/control/libv4lcontrol.c
index 7296de1d0fcb..676719372bb7 100644
--- a/lib/libv4lconvert/control/libv4lcontrol.c
+++ b/lib/libv4lconvert/control/libv4lcontrol.c
@@ -725,16 +725,21 @@ struct v4lcontrol_data *v4lcontrol_create(int fd, void *dev_ops_priv,
 
 	if (shm_fd >= 0) {
 		/* Set the shared memory size */
-		ftruncate(shm_fd, V4LCONTROL_SHM_SIZE);
+		int ret = ftruncate(shm_fd, V4LCONTROL_SHM_SIZE);
+		if (ret) {
+			perror("libv4lcontrol: shm ftruncate failed");
+			close(shm_fd);
+		} else {
+			/* Retrieve a pointer to the shm object */
+			data->shm_values = mmap(NULL, V4LCONTROL_SHM_SIZE,
+						PROT_READ | PROT_WRITE,
+						MAP_SHARED, shm_fd, 0);
+			close(shm_fd);
 
-		/* Retreive a pointer to the shm object */
-		data->shm_values = mmap(NULL, V4LCONTROL_SHM_SIZE, (PROT_READ | PROT_WRITE),
-				MAP_SHARED, shm_fd, 0);
-		close(shm_fd);
-
-		if (data->shm_values == MAP_FAILED) {
-			perror("libv4lcontrol: error shm mmap failed");
-			data->shm_values = NULL;
+			if (data->shm_values == MAP_FAILED) {
+				perror("libv4lcontrol: shm mmap failed");
+				data->shm_values = NULL;
+			}
 		}
 	} else
 		perror("libv4lcontrol: error creating shm segment failed");
-- 
Regards,

Laurent Pinchart

