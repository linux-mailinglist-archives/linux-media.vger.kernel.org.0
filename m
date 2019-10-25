Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66F40E4C99
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2019 15:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504874AbfJYNqP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Oct 2019 09:46:15 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:46077 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504878AbfJYNqO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Oct 2019 09:46:14 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1iNzuu-00050C-Ca; Fri, 25 Oct 2019 13:46:12 +0000
From:   Colin King <colin.king@canonical.com>
To:     Antoine Jacquet <royale@zerezo.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: zr364xx: remove redundant assigmnent to idx, clean up code
Date:   Fri, 25 Oct 2019 14:46:12 +0100
Message-Id: <20191025134612.30703-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable cable_type is being initialized with a value that
is never read and is being re-assigned a little later on. Replace
the redundant initializtion with the assignment that occurs a little
later. Also initialize frm too rather than have a later assignment.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/zr364xx/zr364xx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/zr364xx/zr364xx.c b/drivers/media/usb/zr364xx/zr364xx.c
index aff78d63b869..57dbcc8083bf 100644
--- a/drivers/media/usb/zr364xx/zr364xx.c
+++ b/drivers/media/usb/zr364xx/zr364xx.c
@@ -555,14 +555,12 @@ static int zr364xx_read_video_callback(struct zr364xx_camera *cam,
 {
 	unsigned char *pdest;
 	unsigned char *psrc;
-	s32 idx = -1;
-	struct zr364xx_framei *frm;
+	s32 idx = cam->cur_frame;
+	struct zr364xx_framei *frm = &cam->buffer.frame[idx];
 	int i = 0;
 	unsigned char *ptr = NULL;
 
 	_DBG("buffer to user\n");
-	idx = cam->cur_frame;
-	frm = &cam->buffer.frame[idx];
 
 	/* swap bytes if camera needs it */
 	if (cam->method == METHOD0) {
-- 
2.20.1

