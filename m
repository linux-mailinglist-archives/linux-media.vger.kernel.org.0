Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CAAD72707
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 06:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbfGXE5L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 00:57:11 -0400
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:23277 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726007AbfGXE5L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 00:57:11 -0400
Received: from localhost.localdomain ([92.140.204.221])
        by mwinf5d09 with ME
        id gUx6200044n7eLC03Ux6ZL; Wed, 24 Jul 2019 06:57:08 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 24 Jul 2019 06:57:08 +0200
X-ME-IP: 92.140.204.221
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: uvcvideo: Fix a typo in UVC_METATADA_BUF_SIZE
Date:   Wed, 24 Jul 2019 06:56:12 +0200
Message-Id: <20190724045612.29870-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It is likely that it should be UVC_METADATA_BUF_SIZE instead.
Fix it and use it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/usb/uvc/uvc_metadata.c | 4 ++--
 drivers/media/usb/uvc/uvc_queue.c    | 2 +-
 drivers/media/usb/uvc/uvcvideo.h     | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index 99bb71b47117..b6279ad7ac84 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -51,7 +51,7 @@ static int uvc_meta_v4l2_get_format(struct file *file, void *fh,
 	memset(fmt, 0, sizeof(*fmt));
 
 	fmt->dataformat = stream->meta.format;
-	fmt->buffersize = UVC_METATADA_BUF_SIZE;
+	fmt->buffersize = UVC_METADATA_BUF_SIZE;
 
 	return 0;
 }
@@ -72,7 +72,7 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *fh,
 
 	fmt->dataformat = fmeta == dev->info->meta_format
 			? fmeta : V4L2_META_FMT_UVC;
-	fmt->buffersize = UVC_METATADA_BUF_SIZE;
+	fmt->buffersize = UVC_METADATA_BUF_SIZE;
 
 	return 0;
 }
diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index da72577c2998..cd60c6c1749e 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -79,7 +79,7 @@ static int uvc_queue_setup(struct vb2_queue *vq,
 
 	switch (vq->type) {
 	case V4L2_BUF_TYPE_META_CAPTURE:
-		size = UVC_METATADA_BUF_SIZE;
+		size = UVC_METADATA_BUF_SIZE;
 		break;
 
 	default:
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index c7c1baa90dea..f773dc5d802c 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -491,7 +491,7 @@ struct uvc_stats_stream {
 	unsigned int max_sof;		/* Maximum STC.SOF value */
 };
 
-#define UVC_METATADA_BUF_SIZE 1024
+#define UVC_METADATA_BUF_SIZE 1024
 
 /**
  * struct uvc_copy_op: Context structure to schedule asynchronous memcpy
-- 
2.20.1

