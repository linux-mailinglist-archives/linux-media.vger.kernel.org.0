Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3516551CC6B
	for <lists+linux-media@lfdr.de>; Fri,  6 May 2022 01:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386577AbiEEXIQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 May 2022 19:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386553AbiEEXII (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 May 2022 19:08:08 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E20825EDC5
        for <linux-media@vger.kernel.org>; Thu,  5 May 2022 16:04:26 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id e24so7862296wrc.9
        for <linux-media@vger.kernel.org>; Thu, 05 May 2022 16:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=10bGTJ2+BtTAQLbHFAjuYKXTSrjADGSIg0sJUSuRJsQ=;
        b=mxAbNuJxH7AAdMXMHp04WEE5azL9YZTm+xODh5DnZ7861boAO7DSrqeqvyrUcJ5nHK
         LwHdSgu+SdGYA154rvyShp66UdrKErBLCc0/8IxDjDVsA/lNeaT2zXEf5qH7zbzRXzVi
         9oANt9bZDqV7h0YrnNB9yfAL5UlV/Vbd6WRxSRXF6/hzGDY/zGRcmmfF/EIjZQ+IkwOs
         McejOPftXVarfJPVEv7QqaGllq87ySJs0AZOrt3BrfMTE/yLsznuU6+puZbrEA12Ooss
         lAg2il5UtXn9Ams8R13F2TBXYYu3PnyG2HDt6wqKob7kx7SIiIa/ySF4rI320gwWj8rO
         PhQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=10bGTJ2+BtTAQLbHFAjuYKXTSrjADGSIg0sJUSuRJsQ=;
        b=g6IX8VaQT85UjATDMTwLnWKwZ9Dqz3UAWizE+/bSqG3ObDaqBZdQhPrhEA/mC0R0S3
         wEUu/P3M1xRdV7/hzAMm7j0JBBVp7R6GJax8H3T8B55PzBQ+FSBxJ8t0CGcuChgeXF3O
         rLL+Vrt2Zms1m5pNRGse8mAyeiz5M0ayH/GKzfQEplIVZ7mJTWiM235Ksmvg9d9k5X9q
         yyGlBj3x6X+RVHaNcr/p+rKxmeIGlN74fkUYMUzOH22GraSzeera4uyG9pmJ2ZOvoD6o
         EPmH9zdmyTqEJiDUuiv+NEwqr55dx7LiSKRjjPjFMjtE9yRgvqjqSp7KkOLlBP/CrCBv
         Tt2A==
X-Gm-Message-State: AOAM532laVB1U4shy+FaucM6JtqPYiPotqWg3FulZ+SKlICP26dsRdmb
        VRwRt8awQA3MJBZDmwtguVWmnxtqT9Q=
X-Google-Smtp-Source: ABdhPJyCchQvoD7jaDxxG+pbhhgwGvC32935fGnGK+L2Qrv1QfjRkFVV7/E+cacXP9BMH97/22X1FQ==
X-Received: by 2002:a5d:6d8c:0:b0:20c:599a:4f7e with SMTP id l12-20020a5d6d8c000000b0020c599a4f7emr296936wrs.324.1651791865396;
        Thu, 05 May 2022 16:04:25 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id o20-20020a05600c339400b003942a244f33sm6782130wmp.12.2022.05.05.16.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 16:04:25 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v4 15/15] media: i2c: Add vblank control to ov7251 driver
Date:   Fri,  6 May 2022 00:04:02 +0100
Message-Id: <20220505230402.449643-16-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505230402.449643-1-djrscally@gmail.com>
References: <20220505230402.449643-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a vblank control to the ov7251 driver.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v4:

	- Used vblank_def in ov7251_set_format()

Suggestions not applied:

	- Didn't use __be16 / cpu_to_be16() - Andy I kinda thought the better
	way to do that would be as another patch changing the i2c read/write
	functions. I'll be working on this driver a bit more in the near future

Changes in v3:

	- New patch

 drivers/media/i2c/ov7251.c | 53 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 20591d8227c9..4867dc86cd2e 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -62,6 +62,10 @@
 #define OV7251_ACTIVE_HEIGHT		488
 
 #define OV7251_FIXED_PPL		928
+#define OV7251_TIMING_VTS_REG		0x380e
+#define OV7251_TIMING_MIN_VTS		1
+#define OV7251_TIMING_MAX_VTS		0xffff
+#define OV7251_INTEGRATION_MARGIN	20
 
 struct reg_value {
 	u16 reg;
@@ -71,6 +75,7 @@ struct reg_value {
 struct ov7251_mode_info {
 	u32 width;
 	u32 height;
+	u32 vts;
 	const struct reg_value *data;
 	u32 data_size;
 	u32 pixel_clock;
@@ -142,6 +147,7 @@ struct ov7251 {
 	struct v4l2_ctrl *exposure;
 	struct v4l2_ctrl *gain;
 	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *vblank;
 
 	/* Cached register values */
 	u8 aec_pk_manual;
@@ -637,6 +643,7 @@ static const struct ov7251_mode_info ov7251_mode_info_data[] = {
 	{
 		.width = 640,
 		.height = 480,
+		.vts = 1724,
 		.data = ov7251_setting_vga_30fps,
 		.data_size = ARRAY_SIZE(ov7251_setting_vga_30fps),
 		.exposure_max = 1704,
@@ -649,6 +656,7 @@ static const struct ov7251_mode_info ov7251_mode_info_data[] = {
 	{
 		.width = 640,
 		.height = 480,
+		.vts = 860,
 		.data = ov7251_setting_vga_60fps,
 		.data_size = ARRAY_SIZE(ov7251_setting_vga_60fps),
 		.exposure_max = 840,
@@ -661,6 +669,7 @@ static const struct ov7251_mode_info ov7251_mode_info_data[] = {
 	{
 		.width = 640,
 		.height = 480,
+		.vts = 572,
 		.data = ov7251_setting_vga_90fps,
 		.data_size = ARRAY_SIZE(ov7251_setting_vga_90fps),
 		.exposure_max = 552,
@@ -1001,12 +1010,36 @@ static const char * const ov7251_test_pattern_menu[] = {
 	"Vertical Pattern Bars",
 };
 
+static int ov7251_vts_configure(struct ov7251 *ov7251, s32 vblank)
+{
+	u8 vts[2];
+
+	vts[0] = ((ov7251->current_mode->height + vblank) & 0xff00) >> 8;
+	vts[1] = ((ov7251->current_mode->height + vblank) & 0x00ff);
+
+	return ov7251_write_seq_regs(ov7251, OV7251_TIMING_VTS_REG, vts, 2);
+}
+
 static int ov7251_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov7251 *ov7251 = container_of(ctrl->handler,
 					     struct ov7251, ctrls);
 	int ret;
 
+	/* If VBLANK is altered we need to update exposure to compensate */
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		int exposure_max;
+
+		exposure_max = ov7251->current_mode->height + ctrl->val -
+			       OV7251_INTEGRATION_MARGIN;
+		__v4l2_ctrl_modify_range(ov7251->exposure,
+					 ov7251->exposure->minimum,
+					 exposure_max,
+					 ov7251->exposure->step,
+					 min(ov7251->exposure->val,
+					     exposure_max));
+	}
+
 	/* v4l2_ctrl_lock() locks our mutex */
 
 	if (!pm_runtime_get_if_in_use(ov7251->dev))
@@ -1028,6 +1061,9 @@ static int ov7251_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_VFLIP:
 		ret = ov7251_set_vflip(ov7251, ctrl->val);
 		break;
+	case V4L2_CID_VBLANK:
+		ret = ov7251_vts_configure(ov7251, ctrl->val);
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -1179,6 +1215,7 @@ static int ov7251_set_format(struct v4l2_subdev *sd,
 {
 	struct ov7251 *ov7251 = to_ov7251(sd);
 	struct v4l2_mbus_framefmt *__format;
+	int vblank_max, vblank_def;
 	struct v4l2_rect *__crop;
 	const struct ov7251_mode_info *new_mode;
 	int ret = 0;
@@ -1212,6 +1249,14 @@ static int ov7251_set_format(struct v4l2_subdev *sd,
 		if (ret < 0)
 			goto exit;
 
+		vblank_max = OV7251_TIMING_MAX_VTS - new_mode->height;
+		vblank_def = new_mode->vts - new_mode->height;
+		ret = __v4l2_ctrl_modify_range(ov7251->vblank,
+					       OV7251_TIMING_MIN_VTS,
+					       vblank_max, 1, vblank_def);
+		if (ret < 0)
+			goto exit;
+
 		ov7251->current_mode = new_mode;
 	}
 
@@ -1490,6 +1535,7 @@ static int ov7251_detect_chip(struct ov7251 *ov7251)
 
 static int ov7251_init_ctrls(struct ov7251 *ov7251)
 {
+	int vblank_max, vblank_def;
 	s64 pixel_rate;
 	int hblank;
 
@@ -1533,6 +1579,13 @@ static int ov7251_init_ctrls(struct ov7251 *ov7251)
 	if (ov7251->hblank)
 		ov7251->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
+	vblank_max = OV7251_TIMING_MAX_VTS - ov7251->current_mode->height;
+	vblank_def = ov7251->current_mode->vts - ov7251->current_mode->height;
+	ov7251->vblank = v4l2_ctrl_new_std(&ov7251->ctrls, &ov7251_ctrl_ops,
+					   V4L2_CID_VBLANK,
+					   OV7251_TIMING_MIN_VTS, vblank_max, 1,
+					   vblank_def);
+
 	ov7251->sd.ctrl_handler = &ov7251->ctrls;
 
 	if (ov7251->ctrls.error) {
-- 
2.25.1

