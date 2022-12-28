Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D41646571AC
	for <lists+linux-media@lfdr.de>; Wed, 28 Dec 2022 02:42:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231162AbiL1BmI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Dec 2022 20:42:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiL1BmH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Dec 2022 20:42:07 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C521B85B
        for <linux-media@vger.kernel.org>; Tue, 27 Dec 2022 17:42:06 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C523A25B;
        Wed, 28 Dec 2022 02:42:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672191724;
        bh=9i3R6hV6OWmslwSp+MrBV/9HfXelCFuw6ixzGFxEJHs=;
        h=From:To:Cc:Subject:Date:From;
        b=P1EV4n0X4x2DRc1yJ2rjDW8wHuHsmg5UAQT9i6KWIRaAEKg6PlnXTxYEg0wb4PF63
         DoG560MhcZDppNxiemL9n/d5npqUxZwrDv4cUCTbU1iLsj170Qj0033e7MdSI/ywUM
         pQBxZ5bCoEV+bOyccTsRv8a9xw7qPF9KqiIWB4gY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>
Subject: [PATCH v1] media: uvcvideo: Remove format descriptions
Date:   Wed, 28 Dec 2022 03:42:00 +0200
Message-Id: <20221228014200.20462-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The V4L2 core fills format description on its own in v4l_fill_fmtdesc(),
there's no need to manually set the descriptions in the driver. This
prepares for removal of the format descriptions from the uvc_fmts table.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---

Michael, I'd like to merge this before the "[PATCH v2 5/5] usb: uvc: use
v4l2_fill_fmtdesc instead of open coded format name" patch you have
submitted, if that's OK with you. It removes the need to call
v4l2_fill_fmtdesc() in that patch, which will also allow dropping
"[PATCH v2 4/5] media: v4l2: move v4l_fill_fmtdesc to common
v4l2_fill_fmtdesc function" in that series. I think we can schedule all
of that for v6.3.

---
 drivers/media/usb/uvc/uvc_driver.c | 27 +++++++++++++--------------
 drivers/media/usb/uvc/uvc_v4l2.c   |  2 --
 drivers/media/usb/uvc/uvcvideo.h   |  2 --
 3 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 8132a5c3bc33..6de3d55daf36 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -227,6 +227,7 @@ static int uvc_parse_format(struct uvc_device *dev,
 	struct uvc_format_desc *fmtdesc;
 	struct uvc_frame *frame;
 	const unsigned char *start = buffer;
+	char fmtname[12] = { 0, };
 	unsigned int width_multiplier = 1;
 	unsigned int interval;
 	unsigned int i, n;
@@ -251,14 +252,10 @@ static int uvc_parse_format(struct uvc_device *dev,
 		fmtdesc = uvc_format_by_guid(&buffer[5]);
 
 		if (fmtdesc != NULL) {
-			strscpy(format->name, fmtdesc->name,
-				sizeof(format->name));
 			format->fcc = fmtdesc->fcc;
 		} else {
 			dev_info(&streaming->intf->dev,
-				 "Unknown video format %pUl\n", &buffer[5]);
-			snprintf(format->name, sizeof(format->name), "%pUl\n",
-				&buffer[5]);
+				 "Unknown video format %p4cc\n", &buffer[5]);
 			format->fcc = 0;
 		}
 
@@ -270,8 +267,6 @@ static int uvc_parse_format(struct uvc_device *dev,
 		 */
 		if (dev->quirks & UVC_QUIRK_FORCE_Y8) {
 			if (format->fcc == V4L2_PIX_FMT_YUYV) {
-				strscpy(format->name, "Greyscale 8-bit (Y8  )",
-					sizeof(format->name));
 				format->fcc = V4L2_PIX_FMT_GREY;
 				format->bpp = 8;
 				width_multiplier = 2;
@@ -312,7 +307,6 @@ static int uvc_parse_format(struct uvc_device *dev,
 			return -EINVAL;
 		}
 
-		strscpy(format->name, "MJPEG", sizeof(format->name));
 		format->fcc = V4L2_PIX_FMT_MJPEG;
 		format->flags = UVC_FMT_FLAG_COMPRESSED;
 		format->bpp = 0;
@@ -330,13 +324,13 @@ static int uvc_parse_format(struct uvc_device *dev,
 
 		switch (buffer[8] & 0x7f) {
 		case 0:
-			strscpy(format->name, "SD-DV", sizeof(format->name));
+			strscpy(fmtname, "SD-DV", sizeof(fmtname));
 			break;
 		case 1:
-			strscpy(format->name, "SDL-DV", sizeof(format->name));
+			strscpy(fmtname, "SDL-DV", sizeof(fmtname));
 			break;
 		case 2:
-			strscpy(format->name, "HD-DV", sizeof(format->name));
+			strscpy(fmtname, "HD-DV", sizeof(fmtname));
 			break;
 		default:
 			uvc_dbg(dev, DESCR,
@@ -346,8 +340,8 @@ static int uvc_parse_format(struct uvc_device *dev,
 			return -EINVAL;
 		}
 
-		strlcat(format->name, buffer[8] & (1 << 7) ? " 60Hz" : " 50Hz",
-			sizeof(format->name));
+		strlcat(fmtname, buffer[8] & (1 << 7) ? " 60Hz" : " 50Hz",
+			sizeof(fmtname));
 
 		format->fcc = V4L2_PIX_FMT_DV;
 		format->flags = UVC_FMT_FLAG_COMPRESSED | UVC_FMT_FLAG_STREAM;
@@ -375,7 +369,12 @@ static int uvc_parse_format(struct uvc_device *dev,
 		return -EINVAL;
 	}
 
-	uvc_dbg(dev, DESCR, "Found format %s\n", format->name);
+	if (format->fcc) {
+		if (fmtname[0])
+			uvc_dbg(dev, DESCR, "Found format %s\n", fmtname);
+		else
+			uvc_dbg(dev, DESCR, "Found format %p4cc", &format->fcc);
+	}
 
 	buflen -= buffer[0];
 	buffer += buffer[0];
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index f4d4c33b6dfb..dcd178d249b6 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -660,8 +660,6 @@ static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
 	fmt->flags = 0;
 	if (format->flags & UVC_FMT_FLAG_COMPRESSED)
 		fmt->flags |= V4L2_FMT_FLAG_COMPRESSED;
-	strscpy(fmt->description, format->name, sizeof(fmt->description));
-	fmt->description[sizeof(fmt->description) - 1] = 0;
 	fmt->pixelformat = format->fcc;
 	return 0;
 }
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 84326991ec36..cd5861cae3b0 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -262,8 +262,6 @@ struct uvc_format {
 	u32 fcc;
 	u32 flags;
 
-	char name[32];
-
 	unsigned int nframes;
 	struct uvc_frame *frame;
 };
-- 
Regards,

Laurent Pinchart

