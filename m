Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E592260D8EE
	for <lists+linux-media@lfdr.de>; Wed, 26 Oct 2022 03:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232526AbiJZBpM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Oct 2022 21:45:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232488AbiJZBpJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Oct 2022 21:45:09 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0311491CB
        for <linux-media@vger.kernel.org>; Tue, 25 Oct 2022 18:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666748708; x=1698284708;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QiYNUPsx488wHqIHdTsw+25Zmmr1pdlQrdyeKhCGb7o=;
  b=L4sYnQDoFgOrFw//yHg0C2HEDudxeUL/okXhBzPnC8w+0c+j8R3jfF/6
   cI2OlzZsmq+U9nedOVSMyedqSwOE4xVC/5lt0RWMT8szRIrhpEeZyAdwP
   Gbps6yp0MIOubn7mVA1AovG4q7iib2tYa8IeDD/8tONWZjDtD76NNBh6j
   oW7zWgQ+6eKxty4uGehMBtyazcEjr2nwnIuANBZtuM7+goyPM4G4YvAnv
   f88PcuTPPpO3ZJyonoJMprtC+wY6TuPPeWdsngz0MioqYr4TYxaStozu0
   sEWvKZB2RawQQyGcXQ+eG2n6gpwAnrcVNhRYkAYpQEUdu8sKo9NtixsRY
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="308928123"
X-IronPort-AV: E=Sophos;i="5.95,213,1661842800"; 
   d="scan'208";a="308928123"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2022 18:45:07 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="700756914"
X-IronPort-AV: E=Sophos;i="5.95,213,1661842800"; 
   d="scan'208";a="700756914"
Received: from jimlai-desktop.itwn.intel.com ([10.5.230.136])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2022 18:45:05 -0700
From:   "Lai, Jim" <jim.lai@intel.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, bingbu.cao@linux.intel.com,
        andy.yeh@intel.com, shawnx.tu@intel.com, sam.lin@sk.com,
        frank.chung@sk.com, Jim Lai <jim.lai@intel.com>
Subject: [PATCH v3] media: hi556: add 2592x1444 resolution
Date:   Wed, 26 Oct 2022 09:35:45 +0800
Message-Id: <20221026013545.27708-1-jim.lai@intel.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jim Lai <jim.lai@intel.com>

Adding additional cropped 2592x1444 resolution
for QHD output from Hi556 sensor

Also implement the get_selection pad operation for the Hi556 sensor driver.
The supported targets report the sensor's native size, the crop default
rectangle and the crop rectangle.

Signed-off-by: Jim Lai <jim.lai@intel.com>
---
 drivers/media/i2c/hi556.c | 150 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 148 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index 055d1aa8410e..ade1c276a3de 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -63,6 +63,14 @@
 #define HI556_REG_ISP_TPG_EN		0x01
 #define HI556_REG_TEST_PATTERN		0x0201
 
+/* HI556 native and active pixel array size. */
+#define HI556_NATIVE_WIDTH		2592U
+#define HI556_NATIVE_HEIGHT		1944U
+#define HI556_PIXEL_ARRAY_LEFT		0U
+#define HI556_PIXEL_ARRAY_TOP		0U
+#define HI556_PIXEL_ARRAY_WIDTH	2592U
+#define HI556_PIXEL_ARRAY_HEIGHT	1944U
+
 enum {
 	HI556_LINK_FREQ_437MHZ_INDEX,
 };
@@ -88,6 +96,9 @@ struct hi556_mode {
 	/* Frame height in pixels */
 	u32 height;
 
+	/* Analog crop rectangle. */
+	struct v4l2_rect crop;
+
 	/* Horizontal timining size */
 	u32 llp;
 
@@ -378,6 +389,49 @@ static const struct hi556_reg mode_2592x1944_regs[] = {
 	{0x0958, 0xbb80},
 };
 
+static const struct hi556_reg mode_2592x1444_regs[] = {
+	{0x0a00, 0x0000},
+	{0x0b0a, 0x8252},
+	{0x0f30, 0xe545},
+	{0x0f32, 0x7067},
+	{0x004a, 0x0100},
+	{0x004c, 0x0000},
+	{0x000c, 0x0022},
+	{0x0008, 0x0b00},
+	{0x005a, 0x0202},
+	{0x0012, 0x000e},
+	{0x0018, 0x0a33},
+	{0x0022, 0x0008},
+	{0x0028, 0x0017},
+	{0x0024, 0x0122},
+	{0x002a, 0x0127},
+	{0x0026, 0x012a},
+	{0x002c, 0x06cf},
+	{0x002e, 0x1111},
+	{0x0030, 0x1111},
+	{0x0032, 0x1111},
+	{0x0006, 0x0821},
+	{0x0a22, 0x0000},
+	{0x0a12, 0x0a20},
+	{0x0a14, 0x05a4},
+	{0x003e, 0x0000},
+	{0x0074, 0x081f},
+	{0x0070, 0x040f},
+	{0x0804, 0x0300},
+	{0x0806, 0x0100},
+	{0x0a04, 0x014a},
+	{0x090c, 0x0fdc},
+	{0x090e, 0x002d},
+	{0x0902, 0x4319},
+	{0x0914, 0xc10a},
+	{0x0916, 0x071f},
+	{0x0918, 0x0408},
+	{0x091a, 0x0c0d},
+	{0x091c, 0x0f09},
+	{0x091e, 0x0a00},
+	{0x0958, 0xbb80},
+};
+
 static const struct hi556_reg mode_1296x972_regs[] = {
 	{0x0a00, 0x0000},
 	{0x0b0a, 0x8259},
@@ -450,8 +504,14 @@ static const struct hi556_link_freq_config link_freq_configs[] = {
 
 static const struct hi556_mode supported_modes[] = {
 	{
-		.width = 2592,
-		.height = 1944,
+		.width = HI556_PIXEL_ARRAY_WIDTH,
+		.height = HI556_PIXEL_ARRAY_HEIGHT,
+		.crop = {
+			.left = HI556_PIXEL_ARRAY_LEFT,
+			.top = HI556_PIXEL_ARRAY_TOP,
+			.width = HI556_PIXEL_ARRAY_WIDTH,
+			.height = HI556_PIXEL_ARRAY_HEIGHT
+		},
 		.fll_def = HI556_FLL_30FPS,
 		.fll_min = HI556_FLL_30FPS_MIN,
 		.llp = 0x0b00,
@@ -461,9 +521,33 @@ static const struct hi556_mode supported_modes[] = {
 		},
 		.link_freq_index = HI556_LINK_FREQ_437MHZ_INDEX,
 	},
+	{
+		.width = HI556_PIXEL_ARRAY_WIDTH,
+		.height = 1444,
+		.crop = {
+			.left = HI556_PIXEL_ARRAY_LEFT,
+			.top = 250,
+			.width = HI556_PIXEL_ARRAY_WIDTH,
+			.height = 1444
+		},
+		.fll_def = 0x821,
+		.fll_min = 0x821,
+		.llp = 0x0b00,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_2592x1444_regs),
+			.regs = mode_2592x1444_regs,
+		},
+		.link_freq_index = HI556_LINK_FREQ_437MHZ_INDEX,
+	},
 	{
 		.width = 1296,
 		.height = 972,
+		.crop = {
+			.left = HI556_PIXEL_ARRAY_LEFT,
+			.top = HI556_PIXEL_ARRAY_TOP,
+			.width = HI556_PIXEL_ARRAY_WIDTH,
+			.height = HI556_PIXEL_ARRAY_HEIGHT
+		},
 		.fll_def = HI556_FLL_30FPS,
 		.fll_min = HI556_FLL_30FPS_MIN,
 		.llp = 0x0b00,
@@ -785,6 +869,58 @@ static int hi556_identify_module(struct hi556 *hi556)
 	return 0;
 }
 
+static const struct v4l2_rect *
+__hi556_get_pad_crop(struct hi556 *hi556,
+		     struct v4l2_subdev_state *sd_state,
+		     unsigned int pad, enum v4l2_subdev_format_whence which)
+{
+	switch (which) {
+	case V4L2_SUBDEV_FORMAT_TRY:
+		return v4l2_subdev_get_try_crop(&hi556->sd, sd_state, pad);
+	case V4L2_SUBDEV_FORMAT_ACTIVE:
+		return &hi556->cur_mode->crop;
+	}
+
+	return NULL;
+}
+
+static int hi556_get_selection(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_state *sd_state,
+			       struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP: {
+		struct hi556 *hi556 = to_hi556(sd);
+
+		mutex_lock(&hi556->mutex);
+		sel->r = *__hi556_get_pad_crop(hi556, sd_state, sel->pad,
+						sel->which);
+		mutex_unlock(&hi556->mutex);
+
+		return 0;
+	}
+
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = HI556_NATIVE_WIDTH;
+		sel->r.height = HI556_NATIVE_HEIGHT;
+
+		return 0;
+
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.top = HI556_PIXEL_ARRAY_TOP;
+		sel->r.left = HI556_PIXEL_ARRAY_LEFT;
+		sel->r.width = HI556_PIXEL_ARRAY_WIDTH;
+		sel->r.height = HI556_PIXEL_ARRAY_HEIGHT;
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
 static int hi556_start_streaming(struct hi556 *hi556)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&hi556->sd);
@@ -1000,10 +1136,19 @@ static int hi556_enum_frame_size(struct v4l2_subdev *sd,
 static int hi556_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct hi556 *hi556 = to_hi556(sd);
+	struct v4l2_rect *try_crop;
 
 	mutex_lock(&hi556->mutex);
 	hi556_assign_pad_format(&supported_modes[0],
 				v4l2_subdev_get_try_format(sd, fh->state, 0));
+
+	/* Initialize try_crop rectangle. */
+	try_crop = v4l2_subdev_get_try_crop(sd, fh->state, 0);
+	try_crop->top = HI556_PIXEL_ARRAY_TOP;
+	try_crop->left = HI556_PIXEL_ARRAY_LEFT;
+	try_crop->width = HI556_PIXEL_ARRAY_WIDTH;
+	try_crop->height = HI556_PIXEL_ARRAY_HEIGHT;
+
 	mutex_unlock(&hi556->mutex);
 
 	return 0;
@@ -1016,6 +1161,7 @@ static const struct v4l2_subdev_video_ops hi556_video_ops = {
 static const struct v4l2_subdev_pad_ops hi556_pad_ops = {
 	.set_fmt = hi556_set_format,
 	.get_fmt = hi556_get_format,
+	.get_selection = hi556_get_selection,
 	.enum_mbus_code = hi556_enum_mbus_code,
 	.enum_frame_size = hi556_enum_frame_size,
 };
-- 
2.22.0

