Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1315C9AC4
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 11:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728850AbfJCJbq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 05:31:46 -0400
Received: from [68.65.227.210] ([68.65.227.210]:62024 "EHLO
        lan.digital-loggers.com" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1728766AbfJCJbp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Oct 2019 05:31:45 -0400
From:   Sergey Zakharchenko <szakharchenko@digital-loggers.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Martin Bodo <martin@digital-loggers.com>,
        "Logan, Peter" <peter.logan@intel.com>,
        Auke Kok <auke-jan.h.kok@intel.com>,
        Sergey Zakharchenko <doublef.mobile@gmail.com>,
        Sergey Zakharchenko <szakharchenko@digital-loggers.com>
Subject: [PATCH v3] media: uvcvideo: Add a quirk to force GEO GC6500 Camera bits-per-pixel value
Date:   Thu,  3 Oct 2019 09:31:23 +0000
Message-Id: <20191003093123.3407-1-szakharchenko@digital-loggers.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <CADYCxoMAD_scAwGE89oULPgOWOjji6ADTXkG30oRwNLjPdAJrw@mail.gmail.com>
References: <CADYCxoMAD_scAwGE89oULPgOWOjji6ADTXkG30oRwNLjPdAJrw@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This device does not function correctly in raw mode in kernel
versions validating buffer sizes in bulk mode. It erroneously
announces 16 bits per pixel instead of 12 for NV12 format, so it
needs this quirk to fix computed frame size and avoid legitimate
frames getting discarded.

Signed-off-by: Sergey Zakharchenko <szakharchenko@digital-loggers.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 23 +++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 66ee168ddc7e..d63db65ef8b2 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -446,10 +446,12 @@ static int uvc_parse_format(struct uvc_device *dev,
 	struct usb_host_interface *alts = intf->cur_altsetting;
 	struct uvc_format_desc *fmtdesc;
 	struct uvc_frame *frame;
+	const struct v4l2_format_info *info;
 	const unsigned char *start = buffer;
 	unsigned int width_multiplier = 1;
 	unsigned int interval;
 	unsigned int i, n;
+	unsigned int div;
 	u8 ftype;
 
 	format->type = buffer[2];
@@ -497,6 +499,18 @@ static int uvc_parse_format(struct uvc_device *dev,
 			}
 		}
 
+		/* Some devices report bpp that doesn't match the format. */
+		if (dev->quirks & UVC_QUIRK_FORCE_BPP) {
+			info = v4l2_format_info(format->fcc);
+			if (info) {
+				div = info->hdiv * info->vdiv;
+				n = info->bpp[0] * div;
+				for (i = 1; i < info->comp_planes; i++)
+					n += info->bpp[i];
+				format->bpp = DIV_ROUND_UP(8 * n, div);
+			}
+		}
+
 		if (buffer[2] == UVC_VS_FORMAT_UNCOMPRESSED) {
 			ftype = UVC_VS_FRAME_UNCOMPRESSED;
 		} else {
@@ -2860,6 +2874,15 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_force_y8 },
+	/* GEO Semiconductor GC6500 */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x29fe,
+	  .idProduct		= 0x4d53,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_FORCE_BPP) },
 	/* Intel RealSense D4M */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index c7c1baa90dea..24e3d8c647e7 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -198,6 +198,7 @@
 #define UVC_QUIRK_RESTRICT_FRAME_RATE	0x00000200
 #define UVC_QUIRK_RESTORE_CTRLS_ON_INIT	0x00000400
 #define UVC_QUIRK_FORCE_Y8		0x00000800
+#define UVC_QUIRK_FORCE_BPP		0x00001000
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001

base-commit: 20a438d53fd9d12a894161bc56cbeab7a9993c39
prerequisite-patch-id: 521eb9602d395ea667eecc75cd2273b59cd3ed76
-- 
2.23.0

