Return-Path: <linux-media+bounces-2095-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0FD80CA6B
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 14:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A99D281DD8
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 13:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 963753DBA8;
	Mon, 11 Dec 2023 13:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qggPT1UQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE93ACB;
	Mon, 11 Dec 2023 05:00:27 -0800 (PST)
Received: from umang.jain (unknown [103.251.226.68])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ABAB613C5;
	Mon, 11 Dec 2023 13:59:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702299582;
	bh=IIHzhLeJ2uWKFZ++JpqPDkX4rPrwuTAjp5fcEGektbY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qggPT1UQ7u59H/4OBICLVFNpf+MjNbBxuBJy4wHKRilWPrdbLm6XY0O1jj4X7/2VR
	 Ws9r7j6254sOB5iVrZ9nTiF/B+aH0RCVUBH/pDwPc/64RKkKrsjVx/wFUC6Eey32oJ
	 yZA1hyF8whJRs93TP8WKP9l8QgGwKid7jzXjsYv8=
From: Umang Jain <umang.jain@ideasonboard.com>
To: devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: "Paul J . Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 7/7] media: i2c: imx335: Support 2592x1940 10-bit mode
Date: Mon, 11 Dec 2023 18:29:49 +0530
Message-ID: <20231211125950.108092-8-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211125950.108092-1-umang.jain@ideasonboard.com>
References: <20231211125950.108092-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In addition to the existing 2592x1940 12-bit mode, introduce support
for 2592x1940 10-bit mode.

Following are the register set which control the 10/12 bit mode setting:
MDBIT	0x319d
ADBIT	0x3050
ADBIT1	0x341c
	0x341d

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/media/i2c/imx335.c | 78 ++++++++++++++++++++++++++++++++++----
 1 file changed, 71 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index f353647a0d4e..5cca8d637952 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -134,6 +134,7 @@ struct imx335_mode {
  * @vblank: Vertical blanking in lines
  * @cur_mode: Pointer to current selected sensor mode
  * @mutex: Mutex for serializing sensor controls
+ * @cur_mbus_code: Currently selected media bus format code
  */
 struct imx335 {
 	struct device *dev;
@@ -156,6 +157,7 @@ struct imx335 {
 	u32 vblank;
 	const struct imx335_mode *cur_mode;
 	struct mutex mutex;
+	u32 cur_mbus_code;
 };
 
 static const s64 link_freq[] = {
@@ -250,6 +252,25 @@ static const struct imx335_reg mode_2592x1940_regs[] = {
 	{0x3a00, 0x01},
 };
 
+static const struct imx335_reg raw10_framefmt_regs[] = {
+	{0x3050, 0x00},
+	{0x319d, 0x00},
+	{0x341c, 0xff},
+	{0x341d, 0x01},
+};
+
+static const struct imx335_reg raw12_framefmt_regs[] = {
+	{0x3050, 0x01},
+	{0x319d, 0x01},
+	{0x341c, 0x47},
+	{0x341d, 0x00},
+};
+
+static const u32 imx335_mbus_codes[] = {
+	MEDIA_BUS_FMT_SRGGB12_1X12,
+	MEDIA_BUS_FMT_SRGGB10_1X10,
+};
+
 /* Supported sensor mode configurations */
 static const struct imx335_mode supported_mode = {
 	.width = 2592,
@@ -260,7 +281,6 @@ static const struct imx335_mode supported_mode = {
 	.vblank_max = 133060,
 	.pclk = 396000000,
 	.link_freq_idx = 0,
-	.code = MEDIA_BUS_FMT_SRGGB12_1X12,
 	.reg_list = {
 		.num_of_regs = ARRAY_SIZE(mode_2592x1940_regs),
 		.regs = mode_2592x1940_regs,
@@ -500,6 +520,18 @@ static const struct v4l2_ctrl_ops imx335_ctrl_ops = {
 	.s_ctrl = imx335_set_ctrl,
 };
 
+static int imx335_get_format_code(struct imx335 *imx335, u32 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(imx335_mbus_codes); i++) {
+		if (imx335_mbus_codes[i] == code)
+			return imx335_mbus_codes[i];
+	}
+
+	return imx335_mbus_codes[0];
+}
+
 /**
  * imx335_enum_mbus_code() - Enumerate V4L2 sub-device mbus codes
  * @sd: pointer to imx335 V4L2 sub-device structure
@@ -512,10 +544,10 @@ static int imx335_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
-	if (code->index > 0)
+	if (code->index >= ARRAY_SIZE(imx335_mbus_codes))
 		return -EINVAL;
 
-	code->code = supported_mode.code;
+	code->code = imx335_mbus_codes[code->index];
 
 	return 0;
 }
@@ -532,10 +564,14 @@ static int imx335_enum_frame_size(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fsize)
 {
-	if (fsize->index > 0)
+	struct imx335 *imx335 = to_imx335(sd);
+	u32 code;
+
+	if (fsize->index > ARRAY_SIZE(imx335_mbus_codes))
 		return -EINVAL;
 
-	if (fsize->code != supported_mode.code)
+	code = imx335_get_format_code(imx335, fsize->code);
+	if (fsize->code != code)
 		return -EINVAL;
 
 	fsize->min_width = supported_mode.width;
@@ -559,7 +595,7 @@ static void imx335_fill_pad_format(struct imx335 *imx335,
 {
 	fmt->format.width = mode->width;
 	fmt->format.height = mode->height;
-	fmt->format.code = mode->code;
+	fmt->format.code = imx335->cur_mbus_code;
 	fmt->format.field = V4L2_FIELD_NONE;
 	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
 	fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
@@ -611,11 +647,16 @@ static int imx335_set_pad_format(struct v4l2_subdev *sd,
 {
 	struct imx335 *imx335 = to_imx335(sd);
 	const struct imx335_mode *mode;
-	int ret = 0;
+	int i, ret = 0;
 
 	mutex_lock(&imx335->mutex);
 
 	mode = &supported_mode;
+	for (i = 0; i < ARRAY_SIZE(imx335_mbus_codes); i++) {
+		if (imx335_mbus_codes[i] == fmt->format.code)
+			imx335->cur_mbus_code = imx335_mbus_codes[i];
+	}
+
 	imx335_fill_pad_format(imx335, mode, fmt);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
@@ -688,6 +729,21 @@ static int imx335_get_selection(struct v4l2_subdev *sd,
 	return -EINVAL;
 }
 
+static int imx335_set_framefmt(struct imx335 *imx335)
+{
+	switch (imx335->cur_mbus_code) {
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+		return imx335_write_regs(imx335, raw10_framefmt_regs,
+					 ARRAY_SIZE(raw10_framefmt_regs));
+
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+		return imx335_write_regs(imx335, raw12_framefmt_regs,
+					 ARRAY_SIZE(raw12_framefmt_regs));
+	}
+
+	return -EINVAL;
+}
+
 /**
  * imx335_start_streaming() - Start sensor stream
  * @imx335: pointer to imx335 device
@@ -708,6 +764,13 @@ static int imx335_start_streaming(struct imx335 *imx335)
 		return ret;
 	}
 
+	ret = imx335_set_framefmt(imx335);
+	if (ret) {
+		dev_err(imx335->dev, "%s failed to set frame format: %d\n",
+			__func__, ret);
+		return ret;
+	}
+
 	/* Setup handler will write actual exposure and gain */
 	ret =  __v4l2_ctrl_handler_setup(imx335->sd.ctrl_handler);
 	if (ret) {
@@ -1104,6 +1167,7 @@ static int imx335_probe(struct i2c_client *client)
 
 	/* Set default mode to max resolution */
 	imx335->cur_mode = &supported_mode;
+	imx335->cur_mbus_code = imx335_mbus_codes[0];
 	imx335->vblank = imx335->cur_mode->vblank;
 
 	ret = imx335_init_controls(imx335);
-- 
2.41.0


