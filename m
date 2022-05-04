Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECBD651B1E2
	for <lists+linux-media@lfdr.de>; Thu,  5 May 2022 00:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235162AbiEDWem (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 May 2022 18:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354265AbiEDWef (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 May 2022 18:34:35 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA1542B24F
        for <linux-media@vger.kernel.org>; Wed,  4 May 2022 15:30:54 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id w4so3786136wrg.12
        for <linux-media@vger.kernel.org>; Wed, 04 May 2022 15:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wi29Ap2zgAim6yF6i/K40HPuBvWXM5rGaocel2NVWbk=;
        b=WFYdXcicFf+w7uqHvwNP2KiitwYLQufA3VTmr1qMNPqbo75gYhiFP1gu0tHkdzvMRc
         pV85j+0oeB7eL4KY/RPM7MIefy2zm4zvS1IOnILlTEAEknI3ITdM9+rEytCpjxXFxV1R
         ZSadH2pR0iKC0vsCa7ec4iTExFrU1v6FxJnydYKkxeSbxD7LYSQv6jBG+GeBVIYDcf6U
         aZY4Rbrdx+aqvH3YHypEXMczimycDVb/tCsETwECgsF86s1bEiW71XYneRdD4byTY8kr
         vgjg4Q62OLvnlD9XDvL6jBjm5P/wlPJQRv7BAOQNK5LUW6ibvCXoMULSo0Pbwl0PNNy/
         kK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wi29Ap2zgAim6yF6i/K40HPuBvWXM5rGaocel2NVWbk=;
        b=DknUlCl0YRahQAFJRFC4Viljdtg1zMwpKjrPKW8UEkYYztCGiNs3DBHUKkEhxhi4vj
         LTROeZIuCXwuXzgXyOE1hraL6VGoEN/8OGaQfF/GsNY6oN/cFQmH0RtpTQd66aYmTdoT
         0YHtTv0v9nWq8evh3t0nH9jKh8u01fv2vxlpn/Pe/lKGgq1TQ6Ni0MhS7SBOrUjLXlZe
         bJZ3lubB7Z1sExUgLh7J2nrRrqHC1liGVagX4vNiHOlZUrQgVs2+/B+GRzBac0xPsElM
         Gav+6ExC9uTXxu7FOIHeqlue4uX434R12K+VBdNRpY5oUoxfUOYiwURhz/5aQzylS+t7
         aK6A==
X-Gm-Message-State: AOAM5319f1simIygza9ZKO/YsNZgBdrvCY8wvpnOKDV3fzuaukpfn2ue
        xA4QCeFeT7uhNEU8MlS1ggX0/6DredA=
X-Google-Smtp-Source: ABdhPJwGsbesHhAeitfwFQNOJ0B2hpa+3C5VAcEAyshQgbxgLC+b+BcQullao8RFZKQmi+VR1Ln7pg==
X-Received: by 2002:a5d:414a:0:b0:20a:d5f9:8b62 with SMTP id c10-20020a5d414a000000b0020ad5f98b62mr18431961wrq.492.1651703454291;
        Wed, 04 May 2022 15:30:54 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id h29-20020adfaa9d000000b0020c5253d913sm12501442wrc.95.2022.05.04.15.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 15:30:53 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v3 15/15] media: i2c: Add vblank control to ov7251 driver
Date:   Wed,  4 May 2022 23:30:27 +0100
Message-Id: <20220504223027.3480287-16-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504223027.3480287-1-djrscally@gmail.com>
References: <20220504223027.3480287-1-djrscally@gmail.com>
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
Changes in v3:

	- New patch

 drivers/media/i2c/ov7251.c | 53 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 003a7a5ae038..dc9d4e08efae 100644
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
+					       vblank_max, 1, vblank_max);
+		if (ret < 0)
+			goto exit;
+
 		ov7251->current_mode = new_mode;
 	}
 
@@ -1492,6 +1537,7 @@ static int ov7251_detect_chip(struct ov7251 *ov7251)
 
 static int ov7251_init_ctrls(struct ov7251 *ov7251)
 {
+	int vblank_max, vblank_def;
 	s64 pixel_rate;
 	int hblank;
 
@@ -1535,6 +1581,13 @@ static int ov7251_init_ctrls(struct ov7251 *ov7251)
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

