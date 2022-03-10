Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BF484D47FB
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 14:24:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242373AbiCJNY6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 08:24:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236943AbiCJNY5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 08:24:57 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1DE09A4DC;
        Thu, 10 Mar 2022 05:23:52 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id D40B310001B; Thu, 10 Mar 2022 13:23:50 +0000 (UTC)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Dan Carpenter <dan.carpenter@oracle.com>, smatch@vger.kernel.org
Subject: [PATCH] media: lirc: suppress false positive smatch warning
Date:   Thu, 10 Mar 2022 13:23:50 +0000
Message-Id: <20220310132350.78729-1-sean@mess.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The latest smatch says:

drivers/media/rc/lirc_dev.c:632 lirc_read_mode2() error: uninitialized symbol 'copied'.
drivers/media/rc/lirc_dev.c:671 lirc_read_scancode() error: uninitialized symbol 'copied'.

This is a false positive since in all reaching code paths, copied will
be set. Work around this by providing a zero initializer for copied.

Cc: Dan Carpenter <dan.carpenter@oracle.com>
Cc: smatch@vger.kernel.org
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/lirc_dev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/lirc_dev.c b/drivers/media/rc/lirc_dev.c
index 765375bda0c6..efa09beae6a7 100644
--- a/drivers/media/rc/lirc_dev.c
+++ b/drivers/media/rc/lirc_dev.c
@@ -601,7 +601,7 @@ static ssize_t lirc_read_mode2(struct file *file, char __user *buffer,
 {
 	struct lirc_fh *fh = file->private_data;
 	struct rc_dev *rcdev = fh->rc;
-	unsigned int copied;
+	unsigned int copied = 0;
 	int ret;
 
 	if (length < sizeof(unsigned int) || length % sizeof(unsigned int))
@@ -639,7 +639,7 @@ static ssize_t lirc_read_scancode(struct file *file, char __user *buffer,
 {
 	struct lirc_fh *fh = file->private_data;
 	struct rc_dev *rcdev = fh->rc;
-	unsigned int copied;
+	unsigned int copied = 0;
 	int ret;
 
 	if (length < sizeof(struct lirc_scancode) ||
-- 
2.35.1

