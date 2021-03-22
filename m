Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DAEA344998
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 16:47:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbhCVPrb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 11:47:31 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:57339 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230056AbhCVPrF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 11:47:05 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id OMlelxHbZ4XAGOMlilYPSm; Mon, 22 Mar 2021 16:47:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616428023; bh=W/GLCTo+BZgqUavN9aVljNL0vwFlM4ZY4Ee0rCBizeY=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=tyjyLH352r7TNWuS42SaPV4+H91+bsNh9Y7NABtPIr5ebBCXN/uAIHhO6QMb9f2Vx
         n8k504UWpKWnJ9AS2cdR+oy5qhRcLinklfq6h86Ek+L4KFJ30p8a3zSzZX1cPFr5+r
         yFUn6eLOJ9hpWmeLEAzRVCAtH5DYwS6ew+2Hy49tHFPOqSVqI0VSpfNH4bzGbyauaR
         kfSwltWX97n03ihEmCMpnbZ8s1j2MPbV9LBn6WJNuN5TVamvUCuNs9UtU3WDMZNAPQ
         6s+jqiTNbxtenvYETmwhMNG3d+k7YvXnE5hbrxqCZ/wsO2EqCkCrn5QlBW7gZtItis
         n3efaJfqSqUhQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Edgar Thier <info@edgarthier.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 3/3] uvc: don't set description in ENUM_FMT
Date:   Mon, 22 Mar 2021 16:46:58 +0100
Message-Id: <20210322154658.1409391-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210322154658.1409391-1-hverkuil-cisco@xs4all.nl>
References: <20210322154658.1409391-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfPcgbjJzaf+GKc4Ch6G9kBMchkYEymJde8v7Q8oyW2pYWSwFen1vcNA0NfQfvL75offDHfUKJNTuD7cP5FzGUEhX7vdf/kyM3xlkBvuStKgsd2yEEdEF
 odwt4OV9hMkEvrVNuYf3Z8HwPOwf0jeKKPEC1Y31pcR/cCZMm6b6hrLU23NJO2tjfmGOfiY68YdwFL9QE8RozceRTEJuL3e3HjkSrtGCZu6VoB4Uvrlf6WCA
 05WfaDCZiMW8YxD93CdqX+hjZitlsklKOc0nvWfW9y81hyYgODpalSVooNVD8p6ychiW72qnLAAlG5HuxawlEvWd02HQk2OWpJD9BcVFFGc=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Leave it to the V4L2 core to set the description. In fact, that was
already the case for a long time since v4l_fill_fmtdesc() overwrites
the description.

So remove all description strings from the driver.

uvc_ioctl_enum_fmt() was also cleaned up a bit since zeroed the
v4l2_fmtdesc struct, when all fields after 'type' are already zeroed
by the V4L2 core.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/uvc/uvc_driver.c | 57 ------------------------------
 drivers/media/usb/uvc/uvc_v4l2.c   |  9 -----
 drivers/media/usb/uvc/uvcvideo.h   |  3 --
 3 files changed, 69 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 7ecd26be6353..9bf066460699 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -41,202 +41,162 @@ unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;
 
 static struct uvc_format_desc uvc_fmts[] = {
 	{
-		.name		= "YUV 4:2:2 (YUYV)",
 		.guid		= UVC_GUID_FORMAT_YUY2,
 		.fcc		= V4L2_PIX_FMT_YUYV,
 	},
 	{
-		.name		= "YUV 4:2:2 (YUYV)",
 		.guid		= UVC_GUID_FORMAT_YUY2_ISIGHT,
 		.fcc		= V4L2_PIX_FMT_YUYV,
 	},
 	{
-		.name		= "YUV 4:2:0 (NV12)",
 		.guid		= UVC_GUID_FORMAT_NV12,
 		.fcc		= V4L2_PIX_FMT_NV12,
 	},
 	{
-		.name		= "MJPEG",
 		.guid		= UVC_GUID_FORMAT_MJPEG,
 		.fcc		= V4L2_PIX_FMT_MJPEG,
 	},
 	{
-		.name		= "YVU 4:2:0 (YV12)",
 		.guid		= UVC_GUID_FORMAT_YV12,
 		.fcc		= V4L2_PIX_FMT_YVU420,
 	},
 	{
-		.name		= "YUV 4:2:0 (I420)",
 		.guid		= UVC_GUID_FORMAT_I420,
 		.fcc		= V4L2_PIX_FMT_YUV420,
 	},
 	{
-		.name		= "YUV 4:2:0 (M420)",
 		.guid		= UVC_GUID_FORMAT_M420,
 		.fcc		= V4L2_PIX_FMT_M420,
 	},
 	{
-		.name		= "YUV 4:2:2 (UYVY)",
 		.guid		= UVC_GUID_FORMAT_UYVY,
 		.fcc		= V4L2_PIX_FMT_UYVY,
 	},
 	{
-		.name		= "Greyscale 8-bit (Y800)",
 		.guid		= UVC_GUID_FORMAT_Y800,
 		.fcc		= V4L2_PIX_FMT_GREY,
 	},
 	{
-		.name		= "Greyscale 8-bit (Y8  )",
 		.guid		= UVC_GUID_FORMAT_Y8,
 		.fcc		= V4L2_PIX_FMT_GREY,
 	},
 	{
-		.name		= "Greyscale 8-bit (D3DFMT_L8)",
 		.guid		= UVC_GUID_FORMAT_D3DFMT_L8,
 		.fcc		= V4L2_PIX_FMT_GREY,
 	},
 	{
-		.name		= "IR 8-bit (L8_IR)",
 		.guid		= UVC_GUID_FORMAT_KSMEDIA_L8_IR,
 		.fcc		= V4L2_PIX_FMT_GREY,
 	},
 	{
-		.name		= "Greyscale 10-bit (Y10 )",
 		.guid		= UVC_GUID_FORMAT_Y10,
 		.fcc		= V4L2_PIX_FMT_Y10,
 	},
 	{
-		.name		= "Greyscale 12-bit (Y12 )",
 		.guid		= UVC_GUID_FORMAT_Y12,
 		.fcc		= V4L2_PIX_FMT_Y12,
 	},
 	{
-		.name		= "Greyscale 16-bit (Y16 )",
 		.guid		= UVC_GUID_FORMAT_Y16,
 		.fcc		= V4L2_PIX_FMT_Y16,
 	},
 	{
-		.name		= "BGGR Bayer (BY8 )",
 		.guid		= UVC_GUID_FORMAT_BY8,
 		.fcc		= V4L2_PIX_FMT_SBGGR8,
 	},
 	{
-		.name		= "BGGR Bayer (BA81)",
 		.guid		= UVC_GUID_FORMAT_BA81,
 		.fcc		= V4L2_PIX_FMT_SBGGR8,
 	},
 	{
-		.name		= "GBRG Bayer (GBRG)",
 		.guid		= UVC_GUID_FORMAT_GBRG,
 		.fcc		= V4L2_PIX_FMT_SGBRG8,
 	},
 	{
-		.name		= "GRBG Bayer (GRBG)",
 		.guid		= UVC_GUID_FORMAT_GRBG,
 		.fcc		= V4L2_PIX_FMT_SGRBG8,
 	},
 	{
-		.name		= "RGGB Bayer (RGGB)",
 		.guid		= UVC_GUID_FORMAT_RGGB,
 		.fcc		= V4L2_PIX_FMT_SRGGB8,
 	},
 	{
-		.name		= "RGB565",
 		.guid		= UVC_GUID_FORMAT_RGBP,
 		.fcc		= V4L2_PIX_FMT_RGB565,
 	},
 	{
-		.name		= "BGR 8:8:8 (BGR3)",
 		.guid		= UVC_GUID_FORMAT_BGR3,
 		.fcc		= V4L2_PIX_FMT_BGR24,
 	},
 	{
-		.name		= "H.264",
 		.guid		= UVC_GUID_FORMAT_H264,
 		.fcc		= V4L2_PIX_FMT_H264,
 	},
 	{
-		.name		= "Greyscale 8 L/R (Y8I)",
 		.guid		= UVC_GUID_FORMAT_Y8I,
 		.fcc		= V4L2_PIX_FMT_Y8I,
 	},
 	{
-		.name		= "Greyscale 12 L/R (Y12I)",
 		.guid		= UVC_GUID_FORMAT_Y12I,
 		.fcc		= V4L2_PIX_FMT_Y12I,
 	},
 	{
-		.name		= "Depth data 16-bit (Z16)",
 		.guid		= UVC_GUID_FORMAT_Z16,
 		.fcc		= V4L2_PIX_FMT_Z16,
 	},
 	{
-		.name		= "Bayer 10-bit (SRGGB10P)",
 		.guid		= UVC_GUID_FORMAT_RW10,
 		.fcc		= V4L2_PIX_FMT_SRGGB10P,
 	},
 	{
-		.name		= "Bayer 12-bit linear packed (SBGGR12LP)",
 		.guid		= UVC_GUID_FORMAT_BGCP,
 		.fcc		= V4L2_PIX_FMT_SBGGR12LP,
 	},
 	{
-		.name		= "Bayer 12-bit linear packed (SGBRG12LP)",
 		.guid		= UVC_GUID_FORMAT_GBCP,
 		.fcc		= V4L2_PIX_FMT_SGBRG12LP,
 	},
 	{
-		.name		= "Bayer 12-bit linear packed (SRGGB12LP)",
 		.guid		= UVC_GUID_FORMAT_RGCP,
 		.fcc		= V4L2_PIX_FMT_SRGGB12LP,
 	},
 	{
-		.name		= "Bayer 12-bit linear packed (SGRBG12LP)",
 		.guid		= UVC_GUID_FORMAT_GRCP,
 		.fcc		= V4L2_PIX_FMT_SGRBG12LP,
 	},
 	{
-		.name		= "Bayer 16-bit (SBGGR16)",
 		.guid		= UVC_GUID_FORMAT_BG16,
 		.fcc		= V4L2_PIX_FMT_SBGGR16,
 	},
 	{
-		.name		= "Bayer 16-bit (SGBRG16)",
 		.guid		= UVC_GUID_FORMAT_GB16,
 		.fcc		= V4L2_PIX_FMT_SGBRG16,
 	},
 	{
-		.name		= "Bayer 16-bit (SRGGB16)",
 		.guid		= UVC_GUID_FORMAT_RG16,
 		.fcc		= V4L2_PIX_FMT_SRGGB16,
 	},
 	{
-		.name		= "Bayer 16-bit (SGRBG16)",
 		.guid		= UVC_GUID_FORMAT_GR16,
 		.fcc		= V4L2_PIX_FMT_SGRBG16,
 	},
 	{
-		.name		= "Depth data 16-bit (Z16)",
 		.guid		= UVC_GUID_FORMAT_INVZ,
 		.fcc		= V4L2_PIX_FMT_Z16,
 	},
 	{
-		.name		= "Greyscale 10-bit (Y10 )",
 		.guid		= UVC_GUID_FORMAT_INVI,
 		.fcc		= V4L2_PIX_FMT_Y10,
 	},
 	{
-		.name		= "IR:Depth 26-bit (INZI)",
 		.guid		= UVC_GUID_FORMAT_INZI,
 		.fcc		= V4L2_PIX_FMT_INZI,
 	},
 	{
-		.name		= "4-bit Depth Confidence (Packed)",
 		.guid		= UVC_GUID_FORMAT_CNF4,
 		.fcc		= V4L2_PIX_FMT_CNF4,
 	},
 	{
-		.name		= "HEVC",
 		.guid		= UVC_GUID_FORMAT_HEVC,
 		.fcc		= V4L2_PIX_FMT_HEVC,
 	},
@@ -551,14 +511,10 @@ static int uvc_parse_format(struct uvc_device *dev,
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
 
@@ -569,8 +525,6 @@ static int uvc_parse_format(struct uvc_device *dev,
 		 */
 		if (dev->quirks & UVC_QUIRK_FORCE_Y8) {
 			if (format->fcc == V4L2_PIX_FMT_YUYV) {
-				strscpy(format->name, "Greyscale 8-bit (Y8  )",
-					sizeof(format->name));
 				format->fcc = V4L2_PIX_FMT_GREY;
 				format->bpp = 8;
 				width_multiplier = 2;
@@ -611,7 +565,6 @@ static int uvc_parse_format(struct uvc_device *dev,
 			return -EINVAL;
 		}
 
-		strscpy(format->name, "MJPEG", sizeof(format->name));
 		format->fcc = V4L2_PIX_FMT_MJPEG;
 		format->flags = UVC_FMT_FLAG_COMPRESSED;
 		format->bpp = 0;
@@ -629,13 +582,8 @@ static int uvc_parse_format(struct uvc_device *dev,
 
 		switch (buffer[8] & 0x7f) {
 		case 0:
-			strscpy(format->name, "SD-DV", sizeof(format->name));
-			break;
 		case 1:
-			strscpy(format->name, "SDL-DV", sizeof(format->name));
-			break;
 		case 2:
-			strscpy(format->name, "HD-DV", sizeof(format->name));
 			break;
 		default:
 			uvc_dbg(dev, DESCR,
@@ -645,9 +593,6 @@ static int uvc_parse_format(struct uvc_device *dev,
 			return -EINVAL;
 		}
 
-		strlcat(format->name, buffer[8] & (1 << 7) ? " 60Hz" : " 50Hz",
-			sizeof(format->name));
-
 		format->fcc = V4L2_PIX_FMT_DV;
 		format->flags = UVC_FMT_FLAG_COMPRESSED | UVC_FMT_FLAG_STREAM;
 		format->bpp = 0;
@@ -674,8 +619,6 @@ static int uvc_parse_format(struct uvc_device *dev,
 		return -EINVAL;
 	}
 
-	uvc_dbg(dev, DESCR, "Found format %s\n", format->name);
-
 	buflen -= buffer[0];
 	buffer += buffer[0];
 
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 252136cc885c..1cfd081c2004 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -632,22 +632,13 @@ static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
 			      struct v4l2_fmtdesc *fmt)
 {
 	struct uvc_format *format;
-	enum v4l2_buf_type type = fmt->type;
-	u32 index = fmt->index;
 
 	if (fmt->type != stream->type || fmt->index >= stream->nformats)
 		return -EINVAL;
 
-	memset(fmt, 0, sizeof(*fmt));
-	fmt->index = index;
-	fmt->type = type;
-
 	format = &stream->format[fmt->index];
-	fmt->flags = 0;
 	if (format->flags & UVC_FMT_FLAG_COMPRESSED)
 		fmt->flags |= V4L2_FMT_FLAG_COMPRESSED;
-	strscpy(fmt->description, format->name, sizeof(fmt->description));
-	fmt->description[sizeof(fmt->description) - 1] = 0;
 	fmt->pixelformat = format->fcc;
 	return 0;
 }
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 51cda67946d5..8fff8b93def2 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -292,7 +292,6 @@ struct uvc_control {
 };
 
 struct uvc_format_desc {
-	char *name;
 	u8 guid[16];
 	u32 fcc;
 };
@@ -416,8 +415,6 @@ struct uvc_format {
 	u32 fcc;
 	u32 flags;
 
-	char name[32];
-
 	unsigned int nframes;
 	struct uvc_frame *frame;
 };
-- 
2.30.1

