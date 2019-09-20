Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05A2DB962B
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2019 19:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405901AbfITREE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 13:04:04 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:39330 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405874AbfITRED (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 13:04:03 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8KH42Cd101474;
        Fri, 20 Sep 2019 12:04:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568999042;
        bh=Trmrc/banhPyf4P0kKzE6kHGmdEATwfDUmJ+ay4KqVY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=yGsPgJNoqSIQmqkX4+uiYiRFcZ4EProH1HBfKFi4RD5rORuy8g3MHxWuT9pjUwAwm
         XdQP4O6okTG3I9FTqstJbNykh9rboEX6LT6vWG1yLIeI5AP7OcoquPRG8579gUQx5X
         4YMHOqsZF5a7FZyQy8Ol3JILSTA0Tfuk1VCl5BeQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8KH41P1102513
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Sep 2019 12:04:02 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 20
 Sep 2019 12:03:56 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 20 Sep 2019 12:04:01 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8KH3r72054719;
        Fri, 20 Sep 2019 12:04:01 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 08/13] media: am437x-vpfe: Use a per instance format array instead of a static one
Date:   Fri, 20 Sep 2019 12:05:49 -0500
Message-ID: <20190920170554.29666-9-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190920170554.29666-1-bparrot@ti.com>
References: <20190920170554.29666-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Using a statically defined format array would cause issue when
multiple vpfe instance would be connected to sub-device of
different capabilities. We need to use an instance based array
instead to properly maintain a per port/instance format list.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/am437x/am437x-vpfe.c | 110 ++++++++------------
 drivers/media/platform/am437x/am437x-vpfe.h |  34 ++++++
 2 files changed, 75 insertions(+), 69 deletions(-)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index 8b218f48428f..b213348fd1c4 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -69,31 +69,7 @@ static const struct vpfe_standard vpfe_standards[] = {
 	{V4L2_STD_625_50, 720, 576, {54, 59}, 1},
 };
 
-struct bus_format {
-	unsigned int width;
-	unsigned int bpp;
-};
-
-/*
- * struct vpfe_fmt - VPFE media bus format information
- * @code: V4L2 media bus format code
- * @shifted: V4L2 media bus format code for the same pixel layout but
- *	shifted to be 8 bits per pixel. =0 if format is not shiftable.
- * @pixelformat: V4L2 pixel format FCC identifier
- * @width: Bits per pixel (when transferred over a bus)
- * @bpp: Bytes per pixel (when stored in memory)
- * @supported: Indicates format supported by subdev
- */
-struct vpfe_fmt {
-	u32 fourcc;
-	u32 code;
-	struct bus_format l;
-	struct bus_format s;
-	bool supported;
-	u32 index;
-};
-
-static struct vpfe_fmt formats[] = {
+static struct vpfe_fmt formats[VPFE_NUM_FORMATS] = {
 	{
 		.fourcc		= V4L2_PIX_FMT_YUYV,
 		.code		= MEDIA_BUS_FMT_YUYV8_2X8,
@@ -101,7 +77,6 @@ static struct vpfe_fmt formats[] = {
 		.l.bpp		= 4,
 		.s.width	= 8,
 		.s.bpp		= 2,
-		.supported	= false,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_UYVY,
 		.code		= MEDIA_BUS_FMT_UYVY8_2X8,
@@ -109,7 +84,6 @@ static struct vpfe_fmt formats[] = {
 		.l.bpp		= 4,
 		.s.width	= 8,
 		.s.bpp		= 2,
-		.supported	= false,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_YVYU,
 		.code		= MEDIA_BUS_FMT_YVYU8_2X8,
@@ -117,7 +91,6 @@ static struct vpfe_fmt formats[] = {
 		.l.bpp		= 4,
 		.s.width	= 8,
 		.s.bpp		= 2,
-		.supported	= false,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_VYUY,
 		.code		= MEDIA_BUS_FMT_VYUY8_2X8,
@@ -125,7 +98,6 @@ static struct vpfe_fmt formats[] = {
 		.l.bpp		= 4,
 		.s.width	= 8,
 		.s.bpp		= 2,
-		.supported	= false,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_SBGGR8,
 		.code		= MEDIA_BUS_FMT_SBGGR8_1X8,
@@ -133,7 +105,6 @@ static struct vpfe_fmt formats[] = {
 		.l.bpp		= 2,
 		.s.width	= 8,
 		.s.bpp		= 1,
-		.supported	= false,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_SGBRG8,
 		.code		= MEDIA_BUS_FMT_SGBRG8_1X8,
@@ -141,7 +112,6 @@ static struct vpfe_fmt formats[] = {
 		.l.bpp		= 2,
 		.s.width	= 8,
 		.s.bpp		= 1,
-		.supported	= false,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_SGRBG8,
 		.code		= MEDIA_BUS_FMT_SGRBG8_1X8,
@@ -149,7 +119,6 @@ static struct vpfe_fmt formats[] = {
 		.l.bpp		= 2,
 		.s.width	= 8,
 		.s.bpp		= 1,
-		.supported	= false,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_SRGGB8,
 		.code		= MEDIA_BUS_FMT_SRGGB8_1X8,
@@ -157,7 +126,6 @@ static struct vpfe_fmt formats[] = {
 		.l.bpp		= 2,
 		.s.width	= 8,
 		.s.bpp		= 1,
-		.supported	= false,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_RGB565,
 		.code		= MEDIA_BUS_FMT_RGB565_2X8_LE,
@@ -165,7 +133,6 @@ static struct vpfe_fmt formats[] = {
 		.l.bpp		= 4,
 		.s.width	= 8,
 		.s.bpp		= 2,
-		.supported	= false,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_RGB565X,
 		.code		= MEDIA_BUS_FMT_RGB565_2X8_BE,
@@ -173,7 +140,6 @@ static struct vpfe_fmt formats[] = {
 		.l.bpp		= 4,
 		.s.width	= 8,
 		.s.bpp		= 2,
-		.supported	= false,
 	},
 };
 
@@ -181,13 +147,14 @@ static int
 __vpfe_get_format(struct vpfe_device *vpfe,
 		  struct v4l2_format *format, unsigned int *bpp);
 
-static struct vpfe_fmt *find_format_by_code(unsigned int code)
+static struct vpfe_fmt *find_format_by_code(struct vpfe_device *vpfe,
+					    unsigned int code)
 {
 	struct vpfe_fmt *fmt;
 	unsigned int k;
 
-	for (k = 0; k < ARRAY_SIZE(formats); k++) {
-		fmt = &formats[k];
+	for (k = 0; k < vpfe->num_active_fmt; k++) {
+		fmt = vpfe->active_fmt[k];
 		if (fmt->code == code)
 			return fmt;
 	}
@@ -195,13 +162,14 @@ static struct vpfe_fmt *find_format_by_code(unsigned int code)
 	return NULL;
 }
 
-static struct vpfe_fmt *find_format_by_pix(unsigned int pixelformat)
+static struct vpfe_fmt *find_format_by_pix(struct vpfe_device *vpfe,
+					   unsigned int pixelformat)
 {
 	struct vpfe_fmt *fmt;
 	unsigned int k;
 
-	for (k = 0; k < ARRAY_SIZE(formats); k++) {
-		fmt = &formats[k];
+	for (k = 0; k < vpfe->num_active_fmt; k++) {
+		fmt = vpfe->active_fmt[k];
 		if (fmt->fourcc == pixelformat)
 			return fmt;
 	}
@@ -218,7 +186,7 @@ mbus_to_pix(struct vpfe_device *vpfe,
 	unsigned int bus_width = sdinfo->vpfe_param.bus_width;
 	struct vpfe_fmt *fmt;
 
-	fmt = find_format_by_code(mbus->code);
+	fmt = find_format_by_code(vpfe, mbus->code);
 	if (WARN_ON(fmt == NULL)) {
 		pr_err("Invalid mbus code set\n");
 		*bpp = 1;
@@ -241,12 +209,12 @@ static void pix_to_mbus(struct vpfe_device *vpfe,
 {
 	struct vpfe_fmt *fmt;
 
-	fmt = find_format_by_pix(pix_fmt->pixelformat);
+	fmt = find_format_by_pix(vpfe, pix_fmt->pixelformat);
 	if (!fmt) {
 		/* default to first entry */
 		vpfe_dbg(3, vpfe, "Invalid pixel code: %x, default used instead\n",
 			pix_fmt->pixelformat);
-		fmt = &formats[0];
+		fmt = vpfe->active_fmt[0];
 	}
 
 	memset(mbus_fmt, 0, sizeof(*mbus_fmt));
@@ -1494,8 +1462,7 @@ static int vpfe_enum_fmt(struct file *file, void  *priv,
 {
 	struct vpfe_device *vpfe = video_drvdata(file);
 	struct vpfe_subdev_info *sdinfo;
-	struct vpfe_fmt *fmt = NULL;
-	unsigned int k;
+	struct vpfe_fmt *fmt;
 
 	vpfe_dbg(2, vpfe, "vpfe_enum_format index:%d\n",
 		f->index);
@@ -1504,17 +1471,10 @@ static int vpfe_enum_fmt(struct file *file, void  *priv,
 	if (!sdinfo->sd)
 		return -EINVAL;
 
-	if (f->index > ARRAY_SIZE(formats))
+	if (f->index >= vpfe->num_active_fmt)
 		return -EINVAL;
 
-	for (k = 0; k < ARRAY_SIZE(formats); k++) {
-		if (formats[k].index == f->index) {
-			fmt = &formats[k];
-			break;
-		}
-	}
-	if (!fmt)
-		return -EINVAL;
+	fmt = vpfe->active_fmt[f->index];
 
 	f->pixelformat = fmt->fourcc;
 
@@ -1593,7 +1553,7 @@ static int vpfe_enum_size(struct file *file, void  *priv,
 	vpfe_dbg(2, vpfe, "vpfe_enum_size\n");
 
 	/* check for valid format */
-	fmt = find_format_by_pix(fsize->pixel_format);
+	fmt = find_format_by_pix(vpfe, fsize->pixel_format);
 	if (!fmt) {
 		vpfe_dbg(3, vpfe, "Invalid pixel code: %x, default used instead\n",
 			fsize->pixel_format);
@@ -2281,8 +2241,10 @@ vpfe_async_bound(struct v4l2_async_notifier *notifier,
 					       struct vpfe_device, v4l2_dev);
 	struct v4l2_subdev_mbus_code_enum mbus_code;
 	struct vpfe_subdev_info *sdinfo;
+	struct vpfe_fmt *fmt;
+	int ret = 0;
 	bool found = false;
-	int i, j;
+	int i, j, k;
 
 	vpfe_dbg(1, vpfe, "vpfe_async_bound\n");
 
@@ -2304,27 +2266,37 @@ vpfe_async_bound(struct v4l2_async_notifier *notifier,
 
 	vpfe->video_dev.tvnorms |= sdinfo->inputs[0].std;
 
-	/* setup the supported formats & indexes */
-	for (j = 0, i = 0; ; ++j) {
-		struct vpfe_fmt *fmt;
-		int ret;
-
+	vpfe->num_active_fmt = 0;
+	for (j = 0, i = 0; (ret != -EINVAL); ++j) {
 		memset(&mbus_code, 0, sizeof(mbus_code));
 		mbus_code.index = j;
 		mbus_code.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 		ret = v4l2_subdev_call(subdev, pad, enum_mbus_code,
-			       NULL, &mbus_code);
+				       NULL, &mbus_code);
 		if (ret)
-			break;
-
-		fmt = find_format_by_code(mbus_code.code);
-		if (!fmt)
 			continue;
 
-		fmt->supported = true;
-		fmt->index = i++;
+		vpfe_dbg(3, vpfe,
+			 "subdev %s: code: %04x idx: %d\n",
+			 subdev->name, mbus_code.code, j);
+
+		for (k = 0; k < ARRAY_SIZE(formats); k++) {
+			fmt = &formats[k];
+			if (mbus_code.code != fmt->code)
+				continue;
+			vpfe->active_fmt[i] = fmt;
+			vpfe_dbg(3, vpfe,
+				 "matched fourcc: %s code: %04x idx: %d\n",
+				 print_fourcc(fmt->fourcc), mbus_code.code, i);
+			vpfe->num_active_fmt = ++i;
+		}
 	}
 
+	if (!i) {
+		vpfe_err(vpfe, "No suitable format reported by subdev %s\n",
+			 subdev->name);
+		return -EINVAL;
+	}
 	return 0;
 }
 
diff --git a/drivers/media/platform/am437x/am437x-vpfe.h b/drivers/media/platform/am437x/am437x-vpfe.h
index 2dde09780215..6c7bcb837f4e 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.h
+++ b/drivers/media/platform/am437x/am437x-vpfe.h
@@ -215,6 +215,37 @@ struct vpfe_ccdc {
 	u32 ccdc_ctx[VPFE_REG_END / sizeof(u32)];
 };
 
+/*
+ * struct bus_format - VPFE bus format information
+ * width: Bits per pixel (when transferred over a bus)
+ * bpp: Bytes per pixel (when stored in memory)
+ */
+struct bus_format {
+	unsigned int width;
+	unsigned int bpp;
+};
+
+/*
+ * struct vpfe_fmt - VPFE media bus format information
+ * fourcc: V4L2 pixel format code
+ * code: V4L2 media bus format code
+ * l: 10 bit bus format info
+ * s: 8 bit bus format info
+ */
+struct vpfe_fmt {
+	u32 fourcc;
+	u32 code;
+	struct bus_format l;
+	struct bus_format s;
+};
+
+/*
+ * When formats[] is modified make sure to adjust this value also.
+ * Expect compile time warnings if VPFE_NUM_FORMATS is smaller then
+ * the number of elements in formats[].
+ */
+#define VPFE_NUM_FORMATS	10
+
 struct vpfe_device {
 	/* V4l2 specific parameters */
 	/* Identifies video device for this channel */
@@ -252,6 +283,9 @@ struct vpfe_device {
 	struct v4l2_format fmt;
 	/* Used to store current bytes per pixel based on current format */
 	unsigned int bpp;
+	struct vpfe_fmt	*active_fmt[VPFE_NUM_FORMATS];
+	unsigned int num_active_fmt;
+
 	/*
 	 * used when IMP is chained to store the crop window which
 	 * is different from the image window
-- 
2.17.1

