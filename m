Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0351956793
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 13:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727317AbfFZL14 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 07:27:56 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:53861 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727185AbfFZL1z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 07:27:55 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id g65chWtPYSfvXg65ghKPMB; Wed, 26 Jun 2019 13:27:52 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Antti Palosaari <crope@iki.fi>
Subject: [PATCH 2/5] media/usb: don't set description in ENUM_FMT
Date:   Wed, 26 Jun 2019 13:27:45 +0200
Message-Id: <20190626112748.31730-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626112748.31730-1-hverkuil-cisco@xs4all.nl>
References: <20190626112748.31730-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfMKOgTtT8UA5CseeUhsW7bKYG0DGOBH9K5CcM7QLizq6uJ/XU75aFy1DzPREDKwcsgFfkazqGuvsJOfxRAPoXpKBK8awLab+V5+cZ7pAT4MnL5xnr04n
 3sMz5rdinuE6eUGKTiXf/pa0IA+JehRaOrlAMZhmQfxsN5jNuakXNe19TGLqY0Cc8skN06IeufISuCai/XsMVtXdypMZJBGRPzP6w/imc2wy6kOqr1zORexW
 0xYp7hIpsKTfzPfW/iHDQA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The V4L2 core sets the description for the driver in order to ensure
consistent naming.

So drop the strscpy of the description in drivers. Also remove any
description strings in driver-internal structures since those are
no longer needed.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Antti Palosaari <crope@iki.fi>
---
 drivers/media/dvb-frontends/rtl2832_sdr.c     |  3 ---
 drivers/media/usb/airspy/airspy.c             |  3 ---
 drivers/media/usb/au0828/au0828-video.c       |  4 ----
 drivers/media/usb/cpia2/cpia2_v4l.c           | 23 ++++---------------
 drivers/media/usb/cx231xx/cx231xx-417.c       |  1 -
 drivers/media/usb/cx231xx/cx231xx-video.c     |  2 --
 drivers/media/usb/cx231xx/cx231xx.h           |  1 -
 drivers/media/usb/em28xx/em28xx-video.c       |  8 -------
 drivers/media/usb/em28xx/em28xx.h             |  2 --
 drivers/media/usb/go7007/go7007-v4l2.c        | 11 ---------
 drivers/media/usb/gspca/gspca.c               |  9 --------
 drivers/media/usb/hdpvr/hdpvr-video.c         |  3 ---
 drivers/media/usb/msi2500/msi2500.c           |  8 -------
 drivers/media/usb/pwc/pwc-v4l.c               |  5 ----
 drivers/media/usb/s2255/s2255drv.c            |  8 -------
 drivers/media/usb/stk1160/stk1160-v4l.c       |  2 --
 drivers/media/usb/stk1160/stk1160.h           |  1 -
 drivers/media/usb/stkwebcam/stk-webcam.c      |  5 ----
 drivers/media/usb/tm6000/tm6000-video.c       |  4 ----
 drivers/media/usb/tm6000/tm6000.h             |  1 -
 drivers/media/usb/usbtv/usbtv-video.c         |  2 --
 drivers/media/usb/usbvision/usbvision-video.c | 18 +++++++--------
 drivers/media/usb/usbvision/usbvision.h       |  1 -
 drivers/media/usb/zr364xx/zr364xx.c           |  7 +-----
 24 files changed, 13 insertions(+), 119 deletions(-)

diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dvb-frontends/rtl2832_sdr.c
index e05c21d35dc8..60d1e59d2292 100644
--- a/drivers/media/dvb-frontends/rtl2832_sdr.c
+++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
@@ -81,11 +81,9 @@ struct rtl2832_sdr_format {
 
 static struct rtl2832_sdr_format formats[] = {
 	{
-		.name		= "Complex U8",
 		.pixelformat	= V4L2_SDR_FMT_CU8,
 		.buffersize	= BULK_BUFFER_SIZE,
 	}, {
-		.name		= "Complex U16LE (emulated)",
 		.pixelformat	= V4L2_SDR_FMT_CU16LE,
 		.buffersize	= BULK_BUFFER_SIZE * 2,
 	},
@@ -1116,7 +1114,6 @@ static int rtl2832_sdr_enum_fmt_sdr_cap(struct file *file, void *priv,
 	if (f->index >= dev->num_formats)
 		return -EINVAL;
 
-	strscpy(f->description, formats[f->index].name, sizeof(f->description));
 	f->pixelformat = formats[f->index].pixelformat;
 
 	return 0;
diff --git a/drivers/media/usb/airspy/airspy.c b/drivers/media/usb/airspy/airspy.c
index b35231ffe503..751703db06f5 100644
--- a/drivers/media/usb/airspy/airspy.c
+++ b/drivers/media/usb/airspy/airspy.c
@@ -71,7 +71,6 @@ static const struct v4l2_frequency_band bands_rf[] = {
 
 /* stream formats */
 struct airspy_format {
-	char	*name;
 	u32	pixelformat;
 	u32	buffersize;
 };
@@ -79,7 +78,6 @@ struct airspy_format {
 /* format descriptions for capture and preview */
 static struct airspy_format formats[] = {
 	{
-		.name		= "Real U12LE",
 		.pixelformat	= V4L2_SDR_FMT_RU12LE,
 		.buffersize	= BULK_BUFFER_SIZE,
 	},
@@ -622,7 +620,6 @@ static int airspy_enum_fmt_sdr_cap(struct file *file, void *priv,
 	if (f->index >= NUM_FORMATS)
 		return -EINVAL;
 
-	strscpy(f->description, formats[f->index].name, sizeof(f->description));
 	f->pixelformat = formats[f->index].pixelformat;
 
 	return 0;
diff --git a/drivers/media/usb/au0828/au0828-video.c b/drivers/media/usb/au0828/au0828-video.c
index 5e00019bce8a..e390ca57520a 100644
--- a/drivers/media/usb/au0828/au0828-video.c
+++ b/drivers/media/usb/au0828/au0828-video.c
@@ -1207,10 +1207,6 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
 
 	dprintk(1, "%s called\n", __func__);
 
-	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	strscpy(f->description, "Packed YUV2", sizeof(f->description));
-
-	f->flags = 0;
 	f->pixelformat = V4L2_PIX_FMT_UYVY;
 
 	return 0;
diff --git a/drivers/media/usb/cpia2/cpia2_v4l.c b/drivers/media/usb/cpia2/cpia2_v4l.c
index 0feae825cebb..ded7eb2dc40a 100644
--- a/drivers/media/usb/cpia2/cpia2_v4l.c
+++ b/drivers/media/usb/cpia2/cpia2_v4l.c
@@ -292,28 +292,13 @@ static int cpia2_s_input(struct file *file, void *fh, unsigned int i)
 static int cpia2_enum_fmt_vid_cap(struct file *file, void *fh,
 					    struct v4l2_fmtdesc *f)
 {
-	int index = f->index;
-
-	if (index < 0 || index > 1)
-	       return -EINVAL;
+	if (f->index > 1)
+		return -EINVAL;
 
-	memset(f, 0, sizeof(*f));
-	f->index = index;
-	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	f->flags = V4L2_FMT_FLAG_COMPRESSED;
-	switch(index) {
-	case 0:
-		strscpy(f->description, "MJPEG", sizeof(f->description));
+	if (f->index == 0)
 		f->pixelformat = V4L2_PIX_FMT_MJPEG;
-		break;
-	case 1:
-		strscpy(f->description, "JPEG", sizeof(f->description));
+	else
 		f->pixelformat = V4L2_PIX_FMT_JPEG;
-		break;
-	default:
-		return -EINVAL;
-	}
-
 	return 0;
 }
 
diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
index 2475f69a2f1c..30624376679b 100644
--- a/drivers/media/usb/cx231xx/cx231xx-417.c
+++ b/drivers/media/usb/cx231xx/cx231xx-417.c
@@ -1592,7 +1592,6 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
 	if (f->index != 0)
 		return -EINVAL;
 
-	strscpy(f->description, "MPEG", sizeof(f->description));
 	f->pixelformat = V4L2_PIX_FMT_MPEG;
 
 	return 0;
diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
index b651ac7713ea..c77597917ca1 100644
--- a/drivers/media/usb/cx231xx/cx231xx-video.c
+++ b/drivers/media/usb/cx231xx/cx231xx-video.c
@@ -80,7 +80,6 @@ MODULE_PARM_DESC(video_debug, "enable debug messages [video]");
 /* supported video standards */
 static struct cx231xx_fmt format[] = {
 	{
-	 .name = "16bpp YUY2, 4:2:2, packed",
 	 .fourcc = V4L2_PIX_FMT_YUYV,
 	 .depth = 16,
 	 .reg = 0,
@@ -1578,7 +1577,6 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
 	if (unlikely(f->index >= ARRAY_SIZE(format)))
 		return -EINVAL;
 
-	strscpy(f->description, format[f->index].name, sizeof(f->description));
 	f->pixelformat = format[f->index].fourcc;
 
 	return 0;
diff --git a/drivers/media/usb/cx231xx/cx231xx.h b/drivers/media/usb/cx231xx/cx231xx.h
index 3efa8ff93c1c..b007611abc37 100644
--- a/drivers/media/usb/cx231xx/cx231xx.h
+++ b/drivers/media/usb/cx231xx/cx231xx.h
@@ -121,7 +121,6 @@
 #define CX23417_RESET    9
 
 struct cx23417_fmt {
-	char  *name;
 	u32   fourcc;          /* v4l2 format id */
 	int   depth;
 	int   flags;
diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 0512e1959394..82eb1550ec3b 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -102,37 +102,30 @@ MODULE_PARM_DESC(video_debug, "enable debug messages [video]");
 /* supported video standards */
 static struct em28xx_fmt format[] = {
 	{
-		.name     = "16 bpp YUY2, 4:2:2, packed",
 		.fourcc   = V4L2_PIX_FMT_YUYV,
 		.depth    = 16,
 		.reg	  = EM28XX_OUTFMT_YUV422_Y0UY1V,
 	}, {
-		.name     = "16 bpp RGB 565, LE",
 		.fourcc   = V4L2_PIX_FMT_RGB565,
 		.depth    = 16,
 		.reg      = EM28XX_OUTFMT_RGB_16_656,
 	}, {
-		.name     = "8 bpp Bayer RGRG..GBGB",
 		.fourcc   = V4L2_PIX_FMT_SRGGB8,
 		.depth    = 8,
 		.reg      = EM28XX_OUTFMT_RGB_8_RGRG,
 	}, {
-		.name     = "8 bpp Bayer BGBG..GRGR",
 		.fourcc   = V4L2_PIX_FMT_SBGGR8,
 		.depth    = 8,
 		.reg      = EM28XX_OUTFMT_RGB_8_BGBG,
 	}, {
-		.name     = "8 bpp Bayer GRGR..BGBG",
 		.fourcc   = V4L2_PIX_FMT_SGRBG8,
 		.depth    = 8,
 		.reg      = EM28XX_OUTFMT_RGB_8_GRGR,
 	}, {
-		.name     = "8 bpp Bayer GBGB..RGRG",
 		.fourcc   = V4L2_PIX_FMT_SGBRG8,
 		.depth    = 8,
 		.reg      = EM28XX_OUTFMT_RGB_8_GBGB,
 	}, {
-		.name     = "12 bpp YUV411",
 		.fourcc   = V4L2_PIX_FMT_YUV411P,
 		.depth    = 12,
 		.reg      = EM28XX_OUTFMT_YUV411,
@@ -2011,7 +2004,6 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
 	if (unlikely(f->index >= ARRAY_SIZE(format)))
 		return -EINVAL;
 
-	strscpy(f->description, format[f->index].name, sizeof(f->description));
 	f->pixelformat = format[f->index].fourcc;
 
 	return 0;
diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx/em28xx.h
index a551072e62ed..c69e0bc46eb7 100644
--- a/drivers/media/usb/em28xx/em28xx.h
+++ b/drivers/media/usb/em28xx/em28xx.h
@@ -251,13 +251,11 @@ struct em28xx_usb_ctl {
 /**
  * struct em28xx_fmt - Struct to enumberate video formats
  *
- * @name:	Name for the video standard
  * @fourcc:	v4l2 format id
  * @depth:	mean number of bits to represent a pixel
  * @reg:	em28xx register value to set it
  */
 struct em28xx_fmt {
-	char	*name;
 	u32	fourcc;
 	int	depth;
 	int	reg;
diff --git a/drivers/media/usb/go7007/go7007-v4l2.c b/drivers/media/usb/go7007/go7007-v4l2.c
index 88edfef80b40..0b3d185f3cb0 100644
--- a/drivers/media/usb/go7007/go7007-v4l2.c
+++ b/drivers/media/usb/go7007/go7007-v4l2.c
@@ -285,33 +285,22 @@ static int vidioc_querycap(struct file *file, void  *priv,
 static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
 					struct v4l2_fmtdesc *fmt)
 {
-	char *desc = NULL;
-
 	switch (fmt->index) {
 	case 0:
 		fmt->pixelformat = V4L2_PIX_FMT_MJPEG;
-		desc = "Motion JPEG";
 		break;
 	case 1:
 		fmt->pixelformat = V4L2_PIX_FMT_MPEG1;
-		desc = "MPEG-1 ES";
 		break;
 	case 2:
 		fmt->pixelformat = V4L2_PIX_FMT_MPEG2;
-		desc = "MPEG-2 ES";
 		break;
 	case 3:
 		fmt->pixelformat = V4L2_PIX_FMT_MPEG4;
-		desc = "MPEG-4 ES";
 		break;
 	default:
 		return -EINVAL;
 	}
-	fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	fmt->flags = V4L2_FMT_FLAG_COMPRESSED;
-
-	strscpy(fmt->description, desc, sizeof(fmt->description));
-
 	return 0;
 }
 
diff --git a/drivers/media/usb/gspca/gspca.c b/drivers/media/usb/gspca/gspca.c
index be11f7830bca..83b78a42414e 100644
--- a/drivers/media/usb/gspca/gspca.c
+++ b/drivers/media/usb/gspca/gspca.c
@@ -1024,15 +1024,6 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
 		return -EINVAL;		/* no more format */
 
 	fmtdesc->pixelformat = fmt_tb[index];
-	if (gspca_dev->cam.cam_mode[i].sizeimage <
-			gspca_dev->cam.cam_mode[i].width *
-				gspca_dev->cam.cam_mode[i].height)
-		fmtdesc->flags = V4L2_FMT_FLAG_COMPRESSED;
-	fmtdesc->description[0] = fmtdesc->pixelformat & 0xff;
-	fmtdesc->description[1] = (fmtdesc->pixelformat >> 8) & 0xff;
-	fmtdesc->description[2] = (fmtdesc->pixelformat >> 16) & 0xff;
-	fmtdesc->description[3] = fmtdesc->pixelformat >> 24;
-	fmtdesc->description[4] = '\0';
 	return 0;
 }
 
diff --git a/drivers/media/usb/hdpvr/hdpvr-video.c b/drivers/media/usb/hdpvr/hdpvr-video.c
index 5b3e67b80627..bad71d863d39 100644
--- a/drivers/media/usb/hdpvr/hdpvr-video.c
+++ b/drivers/media/usb/hdpvr/hdpvr-video.c
@@ -987,9 +987,6 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void *private_data,
 	if (f->index != 0)
 		return -EINVAL;
 
-	f->flags = V4L2_FMT_FLAG_COMPRESSED;
-	strscpy(f->description, "MPEG2-TS with AVC/AAC streams",
-		sizeof(f->description));
 	f->pixelformat = V4L2_PIX_FMT_MPEG;
 
 	return 0;
diff --git a/drivers/media/usb/msi2500/msi2500.c b/drivers/media/usb/msi2500/msi2500.c
index 4c9b2a12acfb..65be6f140fe8 100644
--- a/drivers/media/usb/msi2500/msi2500.c
+++ b/drivers/media/usb/msi2500/msi2500.c
@@ -66,7 +66,6 @@ static const struct v4l2_frequency_band bands[] = {
 
 /* stream formats */
 struct msi2500_format {
-	char	*name;
 	u32	pixelformat;
 	u32	buffersize;
 };
@@ -74,27 +73,21 @@ struct msi2500_format {
 /* format descriptions for capture and preview */
 static struct msi2500_format formats[] = {
 	{
-		.name		= "Complex S8",
 		.pixelformat	= V4L2_SDR_FMT_CS8,
 		.buffersize	= 3 * 1008,
 #if 0
 	}, {
-		.name		= "10+2-bit signed",
 		.pixelformat	= MSI2500_PIX_FMT_SDR_MSI2500_384,
 	}, {
-		.name		= "12-bit signed",
 		.pixelformat	= MSI2500_PIX_FMT_SDR_S12,
 #endif
 	}, {
-		.name		= "Complex S14LE",
 		.pixelformat	= V4L2_SDR_FMT_CS14LE,
 		.buffersize	= 3 * 1008,
 	}, {
-		.name		= "Complex U8 (emulated)",
 		.pixelformat	= V4L2_SDR_FMT_CU8,
 		.buffersize	= 3 * 1008,
 	}, {
-		.name		= "Complex U16LE (emulated)",
 		.pixelformat	=  V4L2_SDR_FMT_CU16LE,
 		.buffersize	= 3 * 1008,
 	},
@@ -904,7 +897,6 @@ static int msi2500_enum_fmt_sdr_cap(struct file *file, void *priv,
 	if (f->index >= dev->num_formats)
 		return -EINVAL;
 
-	strscpy(f->description, formats[f->index].name, sizeof(f->description));
 	f->pixelformat = formats[f->index].pixelformat;
 
 	return 0;
diff --git a/drivers/media/usb/pwc/pwc-v4l.c b/drivers/media/usb/pwc/pwc-v4l.c
index 76c498cccc49..2f135d533af6 100644
--- a/drivers/media/usb/pwc/pwc-v4l.c
+++ b/drivers/media/usb/pwc/pwc-v4l.c
@@ -873,14 +873,9 @@ static int pwc_enum_fmt_vid_cap(struct file *file, void *fh, struct v4l2_fmtdesc
 	case 0:
 		/* RAW format */
 		f->pixelformat = pdev->type <= 646 ? V4L2_PIX_FMT_PWC1 : V4L2_PIX_FMT_PWC2;
-		f->flags = V4L2_FMT_FLAG_COMPRESSED;
-		strscpy(f->description, "Raw Philips Webcam",
-			sizeof(f->description));
 		break;
 	case 1:
 		f->pixelformat = V4L2_PIX_FMT_YUV420;
-		strscpy(f->description, "4:2:0, planar, Y-Cb-Cr",
-			sizeof(f->description));
 		break;
 	default:
 		return -EINVAL;
diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index aa90558479f7..533f7f064a44 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -273,7 +273,6 @@ static inline struct s2255_dev *to_s2255_dev(struct v4l2_device *v4l2_dev)
 }
 
 struct s2255_fmt {
-	char *name;
 	u32 fourcc;
 	int depth;
 };
@@ -385,29 +384,23 @@ MODULE_DEVICE_TABLE(usb, s2255_table);
 /* JPEG formats must be defined last to support jpeg_enable parameter */
 static const struct s2255_fmt formats[] = {
 	{
-		.name = "4:2:2, packed, YUYV",
 		.fourcc = V4L2_PIX_FMT_YUYV,
 		.depth = 16
 
 	}, {
-		.name = "4:2:2, packed, UYVY",
 		.fourcc = V4L2_PIX_FMT_UYVY,
 		.depth = 16
 	}, {
-		.name = "4:2:2, planar, YUV422P",
 		.fourcc = V4L2_PIX_FMT_YUV422P,
 		.depth = 16
 
 	}, {
-		.name = "8bpp GREY",
 		.fourcc = V4L2_PIX_FMT_GREY,
 		.depth = 8
 	}, {
-		.name = "JPG",
 		.fourcc = V4L2_PIX_FMT_JPEG,
 		.depth = 24
 	}, {
-		.name = "MJPG",
 		.fourcc = V4L2_PIX_FMT_MJPEG,
 		.depth = 24
 	}
@@ -737,7 +730,6 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
 	if (!jpeg_enable && ((formats[index].fourcc == V4L2_PIX_FMT_JPEG) ||
 			(formats[index].fourcc == V4L2_PIX_FMT_MJPEG)))
 		return -EINVAL;
-	strscpy(f->description, formats[index].name, sizeof(f->description));
 	f->pixelformat = formats[index].fourcc;
 	return 0;
 }
diff --git a/drivers/media/usb/stk1160/stk1160-v4l.c b/drivers/media/usb/stk1160/stk1160-v4l.c
index b71a0f4b40b5..bcd14c66e8df 100644
--- a/drivers/media/usb/stk1160/stk1160-v4l.c
+++ b/drivers/media/usb/stk1160/stk1160-v4l.c
@@ -46,7 +46,6 @@ struct stk1160_decimate_ctrl {
 /* supported video standards */
 static struct stk1160_fmt format[] = {
 	{
-		.name     = "16 bpp YUY2, 4:2:2, packed",
 		.fourcc   = V4L2_PIX_FMT_UYVY,
 		.depth    = 16,
 	}
@@ -346,7 +345,6 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
 	if (f->index != 0)
 		return -EINVAL;
 
-	strscpy(f->description, format[f->index].name, sizeof(f->description));
 	f->pixelformat = format[f->index].fourcc;
 	return 0;
 }
diff --git a/drivers/media/usb/stk1160/stk1160.h b/drivers/media/usb/stk1160/stk1160.h
index 099ce2a2f021..a31ea1c80f25 100644
--- a/drivers/media/usb/stk1160/stk1160.h
+++ b/drivers/media/usb/stk1160/stk1160.h
@@ -102,7 +102,6 @@ struct stk1160_isoc_ctl {
 };
 
 struct stk1160_fmt {
-	char  *name;
 	u32   fourcc;          /* v4l2 format id */
 	int   depth;
 };
diff --git a/drivers/media/usb/stkwebcam/stk-webcam.c b/drivers/media/usb/stkwebcam/stk-webcam.c
index be8041e3e6b8..cfca3c70599b 100644
--- a/drivers/media/usb/stkwebcam/stk-webcam.c
+++ b/drivers/media/usb/stkwebcam/stk-webcam.c
@@ -857,23 +857,18 @@ static int stk_vidioc_enum_fmt_vid_cap(struct file *filp,
 	switch (fmtd->index) {
 	case 0:
 		fmtd->pixelformat = V4L2_PIX_FMT_RGB565;
-		strscpy(fmtd->description, "r5g6b5", sizeof(fmtd->description));
 		break;
 	case 1:
 		fmtd->pixelformat = V4L2_PIX_FMT_RGB565X;
-		strscpy(fmtd->description, "r5g6b5BE", sizeof(fmtd->description));
 		break;
 	case 2:
 		fmtd->pixelformat = V4L2_PIX_FMT_UYVY;
-		strscpy(fmtd->description, "yuv4:2:2", sizeof(fmtd->description));
 		break;
 	case 3:
 		fmtd->pixelformat = V4L2_PIX_FMT_SBGGR8;
-		strscpy(fmtd->description, "Raw bayer", sizeof(fmtd->description));
 		break;
 	case 4:
 		fmtd->pixelformat = V4L2_PIX_FMT_YUYV;
-		strscpy(fmtd->description, "yuv4:2:2", sizeof(fmtd->description));
 		break;
 	default:
 		return -EINVAL;
diff --git a/drivers/media/usb/tm6000/tm6000-video.c b/drivers/media/usb/tm6000/tm6000-video.c
index 85fcddfb0202..c07a81a6cbe2 100644
--- a/drivers/media/usb/tm6000/tm6000-video.c
+++ b/drivers/media/usb/tm6000/tm6000-video.c
@@ -52,15 +52,12 @@ EXPORT_SYMBOL_GPL(tm6000_debug);
 
 static struct tm6000_fmt format[] = {
 	{
-		.name     = "4:2:2, packed, YVY2",
 		.fourcc   = V4L2_PIX_FMT_YUYV,
 		.depth    = 16,
 	}, {
-		.name     = "4:2:2, packed, UYVY",
 		.fourcc   = V4L2_PIX_FMT_UYVY,
 		.depth    = 16,
 	}, {
-		.name     = "A/V + VBI mux packet",
 		.fourcc   = V4L2_PIX_FMT_TM6000,
 		.depth    = 16,
 	}
@@ -875,7 +872,6 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
 	if (f->index >= ARRAY_SIZE(format))
 		return -EINVAL;
 
-	strscpy(f->description, format[f->index].name, sizeof(f->description));
 	f->pixelformat = format[f->index].fourcc;
 	return 0;
 }
diff --git a/drivers/media/usb/tm6000/tm6000.h b/drivers/media/usb/tm6000/tm6000.h
index 0864ed7314eb..bf396544da9a 100644
--- a/drivers/media/usb/tm6000/tm6000.h
+++ b/drivers/media/usb/tm6000/tm6000.h
@@ -64,7 +64,6 @@ struct tm6000_input {
  */
 
 struct tm6000_fmt {
-	char  *name;
 	u32   fourcc;          /* v4l2 format id */
 	int   depth;
 };
diff --git a/drivers/media/usb/usbtv/usbtv-video.c b/drivers/media/usb/usbtv/usbtv-video.c
index 51f784479e91..3d9284a09ee5 100644
--- a/drivers/media/usb/usbtv/usbtv-video.c
+++ b/drivers/media/usb/usbtv/usbtv-video.c
@@ -633,8 +633,6 @@ static int usbtv_enum_fmt_vid_cap(struct file *file, void  *priv,
 	if (f->index > 0)
 		return -EINVAL;
 
-	strscpy(f->description, "16 bpp YUY2, 4:2:2, packed",
-		sizeof(f->description));
 	f->pixelformat = V4L2_PIX_FMT_YUYV;
 	return 0;
 }
diff --git a/drivers/media/usb/usbvision/usbvision-video.c b/drivers/media/usb/usbvision/usbvision-video.c
index 93750af82d98..0874526f599e 100644
--- a/drivers/media/usb/usbvision/usbvision-video.c
+++ b/drivers/media/usb/usbvision/usbvision-video.c
@@ -87,14 +87,14 @@
 static int usbvision_nr;
 
 static struct usbvision_v4l2_format_st usbvision_v4l2_format[] = {
-	{ 1, 1,  8, V4L2_PIX_FMT_GREY    , "GREY" },
-	{ 1, 2, 16, V4L2_PIX_FMT_RGB565  , "RGB565" },
-	{ 1, 3, 24, V4L2_PIX_FMT_RGB24   , "RGB24" },
-	{ 1, 4, 32, V4L2_PIX_FMT_RGB32   , "RGB32" },
-	{ 1, 2, 16, V4L2_PIX_FMT_RGB555  , "RGB555" },
-	{ 1, 2, 16, V4L2_PIX_FMT_YUYV    , "YUV422" },
-	{ 1, 2, 12, V4L2_PIX_FMT_YVU420  , "YUV420P" }, /* 1.5 ! */
-	{ 1, 2, 16, V4L2_PIX_FMT_YUV422P , "YUV422P" }
+	{ 1, 1,  8, V4L2_PIX_FMT_GREY },
+	{ 1, 2, 16, V4L2_PIX_FMT_RGB565 },
+	{ 1, 3, 24, V4L2_PIX_FMT_RGB24 },
+	{ 1, 4, 32, V4L2_PIX_FMT_RGB32 },
+	{ 1, 2, 16, V4L2_PIX_FMT_RGB555 },
+	{ 1, 2, 16, V4L2_PIX_FMT_YUYV },
+	{ 1, 2, 12, V4L2_PIX_FMT_YVU420 }, /* 1.5 ! */
+	{ 1, 2, 16, V4L2_PIX_FMT_YUV422P }
 };
 
 /* Function prototypes */
@@ -796,8 +796,6 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
 {
 	if (vfd->index >= USBVISION_SUPPORTED_PALETTES - 1)
 		return -EINVAL;
-	strscpy(vfd->description, usbvision_v4l2_format[vfd->index].desc,
-		sizeof(vfd->description));
 	vfd->pixelformat = usbvision_v4l2_format[vfd->index].format;
 	return 0;
 }
diff --git a/drivers/media/usb/usbvision/usbvision.h b/drivers/media/usb/usbvision/usbvision.h
index 4198f972a47b..11539578e8d2 100644
--- a/drivers/media/usb/usbvision/usbvision.h
+++ b/drivers/media/usb/usbvision/usbvision.h
@@ -264,7 +264,6 @@ struct usbvision_v4l2_format_st {
 	int		bytes_per_pixel;
 	int		depth;
 	int		format;
-	char		*desc;
 };
 #define USBVISION_SUPPORTED_PALETTES ARRAY_SIZE(usbvision_v4l2_format)
 
diff --git a/drivers/media/usb/zr364xx/zr364xx.c b/drivers/media/usb/zr364xx/zr364xx.c
index a9bcba4fa9c6..b8e89d550d29 100644
--- a/drivers/media/usb/zr364xx/zr364xx.c
+++ b/drivers/media/usb/zr364xx/zr364xx.c
@@ -141,7 +141,6 @@ struct zr364xx_pipeinfo {
 };
 
 struct zr364xx_fmt {
-	char *name;
 	u32 fourcc;
 	int depth;
 };
@@ -149,7 +148,6 @@ struct zr364xx_fmt {
 /* image formats.  */
 static const struct zr364xx_fmt formats[] = {
 	{
-		.name = "JPG",
 		.fourcc = V4L2_PIX_FMT_JPEG,
 		.depth = 24
 	}
@@ -376,8 +374,7 @@ static int buffer_prepare(struct videobuf_queue *vq, struct videobuf_buffer *vb,
 						  vb);
 	int rc;
 
-	DBG("%s, field=%d, fmt name = %s\n", __func__, field,
-	    cam->fmt ? cam->fmt->name : "");
+	DBG("%s, field=%d\n", __func__, field);
 	if (!cam->fmt)
 		return -EINVAL;
 
@@ -751,8 +748,6 @@ static int zr364xx_vidioc_enum_fmt_vid_cap(struct file *file,
 {
 	if (f->index > 0)
 		return -EINVAL;
-	f->flags = V4L2_FMT_FLAG_COMPRESSED;
-	strscpy(f->description, formats[0].name, sizeof(f->description));
 	f->pixelformat = formats[0].fourcc;
 	return 0;
 }
-- 
2.20.1

