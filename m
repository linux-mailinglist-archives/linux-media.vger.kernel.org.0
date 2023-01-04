Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 862ED65D143
	for <lists+linux-media@lfdr.de>; Wed,  4 Jan 2023 12:19:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238951AbjADLTy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Jan 2023 06:19:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234873AbjADLTw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Jan 2023 06:19:52 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 700C51A806
        for <linux-media@vger.kernel.org>; Wed,  4 Jan 2023 03:19:51 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 814696F0;
        Wed,  4 Jan 2023 12:19:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672831189;
        bh=+xt20DB4mJrF4APLuLFckx62vK4LVD/2TvWH/yhlUdc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=O/mRGAElL6NtOEq44t2rLTPT+JLfSqQfsDKW+DF9BKqffa0nmZ49/QyBaA32RWIWH
         R7XWowX2fauBYwwdjnHKrlkjdrWvlK7sCd1O0Dq3J4a6Ckj1yrVqqfm3d+Gltzfn2p
         yQlJXlmtp4b31ga2XtvChIr4Thx685e6VNSH20Ak=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 1/2] media: uvcvideo: Remove format descriptions
Date:   Wed,  4 Jan 2023 13:19:43 +0200
Message-Id: <20230104111944.962-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20230104111944.962-1-laurent.pinchart@ideasonboard.com>
References: <20230104111944.962-1-laurent.pinchart@ideasonboard.com>
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
Changes since v1:

- Don't replace %pUl with %p4cc when the format is unknown
---
 drivers/media/usb/uvc/uvc_driver.c | 25 ++++++++++++-------------
 drivers/media/usb/uvc/uvc_v4l2.c   |  2 --
 drivers/media/usb/uvc/uvcvideo.h   |  2 --
 3 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 72c025d8e20b..9852d6f63ae8 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -228,6 +228,7 @@ static int uvc_parse_format(struct uvc_device *dev,
 	struct uvc_format_desc *fmtdesc;
 	struct uvc_frame *frame;
 	const unsigned char *start = buffer;
+	char fmtname[12] = { 0, };
 	unsigned int width_multiplier = 1;
 	unsigned int interval;
 	unsigned int i, n;
@@ -252,14 +253,10 @@ static int uvc_parse_format(struct uvc_device *dev,
 		fmtdesc = uvc_format_by_guid(&buffer[5]);
 
 		if (fmtdesc != NULL) {
-			strscpy(format->name, fmtdesc->name,
-				sizeof(format->name));
 			format->fcc = fmtdesc->fcc;
 		} else {
 			dev_info(&streaming->intf->dev,
 				 "Unknown video format %pUl\n", &buffer[5]);
-			snprintf(format->name, sizeof(format->name), "%pUl\n",
-				&buffer[5]);
 			format->fcc = 0;
 		}
 
@@ -271,8 +268,6 @@ static int uvc_parse_format(struct uvc_device *dev,
 		 */
 		if (dev->quirks & UVC_QUIRK_FORCE_Y8) {
 			if (format->fcc == V4L2_PIX_FMT_YUYV) {
-				strscpy(format->name, "Greyscale 8-bit (Y8  )",
-					sizeof(format->name));
 				format->fcc = V4L2_PIX_FMT_GREY;
 				format->bpp = 8;
 				width_multiplier = 2;
@@ -313,7 +308,6 @@ static int uvc_parse_format(struct uvc_device *dev,
 			return -EINVAL;
 		}
 
-		strscpy(format->name, "MJPEG", sizeof(format->name));
 		format->fcc = V4L2_PIX_FMT_MJPEG;
 		format->flags = UVC_FMT_FLAG_COMPRESSED;
 		format->bpp = 0;
@@ -331,13 +325,13 @@ static int uvc_parse_format(struct uvc_device *dev,
 
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
@@ -347,8 +341,8 @@ static int uvc_parse_format(struct uvc_device *dev,
 			return -EINVAL;
 		}
 
-		strlcat(format->name, buffer[8] & (1 << 7) ? " 60Hz" : " 50Hz",
-			sizeof(format->name));
+		strlcat(fmtname, buffer[8] & (1 << 7) ? " 60Hz" : " 50Hz",
+			sizeof(fmtname));
 
 		format->fcc = V4L2_PIX_FMT_DV;
 		format->flags = UVC_FMT_FLAG_COMPRESSED | UVC_FMT_FLAG_STREAM;
@@ -376,7 +370,12 @@ static int uvc_parse_format(struct uvc_device *dev,
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
index ed2525e7e2a5..727fafb47c1f 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -661,8 +661,6 @@ static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
 	fmt->flags = 0;
 	if (format->flags & UVC_FMT_FLAG_COMPRESSED)
 		fmt->flags |= V4L2_FMT_FLAG_COMPRESSED;
-	strscpy(fmt->description, format->name, sizeof(fmt->description));
-	fmt->description[sizeof(fmt->description) - 1] = 0;
 	fmt->pixelformat = format->fcc;
 	return 0;
 }
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index ae0066eceffd..cb504b9d7ec9 100644
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

