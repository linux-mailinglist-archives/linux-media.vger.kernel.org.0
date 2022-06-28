Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAF1D55C136
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 14:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345364AbiF1MGp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 08:06:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345340AbiF1MGo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 08:06:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0E9E3334B
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 05:06:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2F2A160F52
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 12:05:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D56BBC3411D;
        Tue, 28 Jun 2022 12:05:34 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 8/8] vivid: add pixel_array test control
Date:   Tue, 28 Jun 2022 14:05:23 +0200
Message-Id: <20220628120523.2915913-9-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628120523.2915913-1-hverkuil-cisco@xs4all.nl>
References: <20220628120523.2915913-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This control will change dimensions according to the source resolution.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/test-drivers/vivid/vivid-core.h    |  1 +
 drivers/media/test-drivers/vivid/vivid-ctrls.c   | 14 ++++++++++++++
 drivers/media/test-drivers/vivid/vivid-vid-cap.c |  4 ++++
 3 files changed, 19 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.h b/drivers/media/test-drivers/vivid/vivid-core.h
index 176b72cb143b..e7b23ebc705e 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.h
+++ b/drivers/media/test-drivers/vivid/vivid-core.h
@@ -227,6 +227,7 @@ struct vivid_dev {
 	struct v4l2_ctrl		*bitmask;
 	struct v4l2_ctrl		*int_menu;
 	struct v4l2_ctrl		*ro_int32;
+	struct v4l2_ctrl		*pixel_array;
 	struct v4l2_ctrl		*test_pattern;
 	struct v4l2_ctrl		*colorspace;
 	struct v4l2_ctrl		*rgb_range_cap;
diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index a78d676575bc..f98a651842ce 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -35,6 +35,7 @@
 #define VIVID_CID_AREA			(VIVID_CID_CUSTOM_BASE + 11)
 #define VIVID_CID_RO_INTEGER		(VIVID_CID_CUSTOM_BASE + 12)
 #define VIVID_CID_U32_DYN_ARRAY		(VIVID_CID_CUSTOM_BASE + 13)
+#define VIVID_CID_U8_PIXEL_ARRAY	(VIVID_CID_CUSTOM_BASE + 14)
 
 #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
 #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
@@ -228,6 +229,18 @@ static const struct v4l2_ctrl_config vivid_ctrl_u8_4d_array = {
 	.dims = { 2, 3, 4, 5 },
 };
 
+static const struct v4l2_ctrl_config vivid_ctrl_u8_pixel_array = {
+	.ops = &vivid_user_gen_ctrl_ops,
+	.id = VIVID_CID_U8_PIXEL_ARRAY,
+	.name = "U8 Pixel Array",
+	.type = V4L2_CTRL_TYPE_U8,
+	.def = 0x80,
+	.min = 0x00,
+	.max = 0xff,
+	.step = 1,
+	.dims = { 640, 360 },
+};
+
 static const char * const vivid_ctrl_menu_strings[] = {
 	"Menu Item 0 (Skipped)",
 	"Menu Item 1",
@@ -1642,6 +1655,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u8_4d_array, NULL);
+	dev->pixel_array = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u8_pixel_array, NULL);
 
 	if (dev->has_vid_cap) {
 		/* Image Processing Controls */
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
index b9caa4b26209..6dc4091fcabb 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
@@ -381,6 +381,7 @@ static enum tpg_pixel_aspect vivid_get_pixel_aspect(const struct vivid_dev *dev)
 void vivid_update_format_cap(struct vivid_dev *dev, bool keep_controls)
 {
 	struct v4l2_bt_timings *bt = &dev->dv_timings_cap[dev->input].bt;
+	u32 dims[V4L2_CTRL_MAX_DIMS] = {};
 	unsigned size;
 	u64 pixelclock;
 
@@ -459,6 +460,9 @@ void vivid_update_format_cap(struct vivid_dev *dev, bool keep_controls)
 	tpg_s_video_aspect(&dev->tpg, vivid_get_video_aspect(dev));
 	tpg_s_pixel_aspect(&dev->tpg, vivid_get_pixel_aspect(dev));
 	tpg_update_mv_step(&dev->tpg);
+	dims[0] = dev->src_rect.width;
+	dims[1] = dev->src_rect.height;
+	v4l2_ctrl_modify_dimensions(dev->pixel_array, dims);
 }
 
 /* Map the field to something that is valid for the current input */
-- 
2.35.1

