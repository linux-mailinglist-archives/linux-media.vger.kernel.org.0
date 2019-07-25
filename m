Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE1575181
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 16:43:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388497AbfGYOnf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 10:43:35 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:47785 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388188AbfGYOnf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 10:43:35 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id qexthB49geD5bqexwhiJsu; Thu, 25 Jul 2019 16:43:32 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] uvc: don't set description in ENUM_FMT
Message-ID: <6e8bde09-7b47-5dec-6f21-c5156fbc9b10@xs4all.nl>
Date:   Thu, 25 Jul 2019 16:43:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHvU8mQDYqr3DV0qgESAn1GvPzxvnxfj03c2CM9RhEXIQyW9y8mYwKIbvYh5UIeuz8Sqn07MHQzcD5WqMhqWhF6Bz3iyArb+Lm7DkZ+Frl6vHSbL++1B
 BCD4gaG6zdgWJxJY6Pwc7fcz5N2WjiUXXa0W0gVuR0jC30cO+2GMjOm9XAPVPdtAnDGcCWyShN2sw89WqtW1/SnryY3qcei7r9LdEt0ncPBVbwQ2T1q2E19X
Sender: linux-media-owner@vger.kernel.org
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
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 66ee168ddc7e..88d75d90c5bf 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -40,177 +40,142 @@ unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;

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
@@ -471,14 +436,10 @@ static int uvc_parse_format(struct uvc_device *dev,
 		fmtdesc = uvc_format_by_guid(&buffer[5]);

 		if (fmtdesc != NULL) {
-			strscpy(format->name, fmtdesc->name,
-				sizeof(format->name));
 			format->fcc = fmtdesc->fcc;
 		} else {
 			uvc_printk(KERN_INFO, "Unknown video format %pUl\n",
 				&buffer[5]);
-			snprintf(format->name, sizeof(format->name), "%pUl\n",
-				&buffer[5]);
 			format->fcc = 0;
 		}

@@ -489,8 +450,6 @@ static int uvc_parse_format(struct uvc_device *dev,
 		 */
 		if (dev->quirks & UVC_QUIRK_FORCE_Y8) {
 			if (format->fcc == V4L2_PIX_FMT_YUYV) {
-				strscpy(format->name, "Greyscale 8-bit (Y8  )",
-					sizeof(format->name));
 				format->fcc = V4L2_PIX_FMT_GREY;
 				format->bpp = 8;
 				width_multiplier = 2;
@@ -515,7 +474,6 @@ static int uvc_parse_format(struct uvc_device *dev,
 			return -EINVAL;
 		}

-		strscpy(format->name, "MJPEG", sizeof(format->name));
 		format->fcc = V4L2_PIX_FMT_MJPEG;
 		format->flags = UVC_FMT_FLAG_COMPRESSED;
 		format->bpp = 0;
@@ -533,13 +491,8 @@ static int uvc_parse_format(struct uvc_device *dev,

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
 			uvc_trace(UVC_TRACE_DESCR, "device %d videostreaming "
@@ -549,9 +502,6 @@ static int uvc_parse_format(struct uvc_device *dev,
 			return -EINVAL;
 		}

-		strlcat(format->name, buffer[8] & (1 << 7) ? " 60Hz" : " 50Hz",
-			sizeof(format->name));
-
 		format->fcc = V4L2_PIX_FMT_DV;
 		format->flags = UVC_FMT_FLAG_COMPRESSED | UVC_FMT_FLAG_STREAM;
 		format->bpp = 0;
@@ -578,7 +528,13 @@ static int uvc_parse_format(struct uvc_device *dev,
 		return -EINVAL;
 	}

-	uvc_trace(UVC_TRACE_DESCR, "Found format %s.\n", format->name);
+	uvc_trace(UVC_TRACE_DESCR, "Found format %pUl '%c%c%c%c%s'\n",
+		  &buffer[5],
+		  (char)(format->fcc & 0x7f),
+		  (char)((format->fcc >> 8) & 0x7f),
+		  (char)((format->fcc >> 16) & 0x7f),
+		  (char)((format->fcc >> 24) & 0x7f),
+		  (format->fcc & (1 << 31)) ? "-BE" : "");

 	buflen -= buffer[0];
 	buffer += buffer[0];
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 0335e69b70ab..6c466e3207bc 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -597,22 +597,13 @@ static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
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
index c7c1baa90dea..e21e782c7e29 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -268,7 +268,6 @@ struct uvc_control {
 };

 struct uvc_format_desc {
-	char *name;
 	u8 guid[16];
 	u32 fcc;
 };
@@ -373,8 +372,6 @@ struct uvc_format {
 	u32 fcc;
 	u32 flags;

-	char name[32];
-
 	unsigned int nframes;
 	struct uvc_frame *frame;
 };
