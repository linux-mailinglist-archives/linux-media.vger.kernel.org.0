Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87986570322
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 14:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231679AbiGKMpM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 08:45:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232018AbiGKMog (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 08:44:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA31465552
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 05:44:26 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A40D0440;
        Mon, 11 Jul 2022 14:43:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657543416;
        bh=RlK4exWAqaRYJVUJdirlFjjAHNRwMV6rEZlQMI1az98=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dVPM8NVoDz3w2UEDM8Pk4EeLiJh7QbvbPRUbLg5yyeHi9q/FYUHzsZv+oRceAHxBk
         nYnPkWVGhM8k2PPTZVtulcyBieJicp3RTza5aDbdPmKG2LpkpD3r6Ysh7RWJ+R6tSa
         9Rl8UCTKzxAcrVyOpyXwjoWCk7pqL/Jmw00gbw+w=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v3 27/46] media: rkisp1: isp: Pass mbus type and flags to rkisp1_config_cif()
Date:   Mon, 11 Jul 2022 15:42:29 +0300
Message-Id: <20220711124248.2683-28-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
References: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To prepare for the removal of the active_sensor field from the
rkisp1_device structure, pass the media bus type of flag to the
rkisp1_config_cif() function instead of accessing them through
active_sensor.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
---
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 44 +++++++++----------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index faf80197edbf..501996fffca0 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -136,15 +136,14 @@ static void rkisp1_config_ism(struct rkisp1_device *rkisp1)
 /*
  * configure ISP blocks with input format, size......
  */
-static int rkisp1_config_isp(struct rkisp1_device *rkisp1)
+static int rkisp1_config_isp(struct rkisp1_device *rkisp1,
+			     enum v4l2_mbus_type mbus_type, u32 mbus_flags)
 {
 	u32 isp_ctrl = 0, irq_mask = 0, acq_mult = 0, signal = 0;
 	const struct rkisp1_mbus_info *src_fmt, *sink_fmt;
-	struct rkisp1_sensor_async *sensor;
 	struct v4l2_mbus_framefmt *sink_frm;
 	struct v4l2_rect *sink_crop;
 
-	sensor = rkisp1->active_sensor;
 	sink_fmt = rkisp1->isp.sink_fmt;
 	src_fmt = rkisp1->isp.src_fmt;
 	sink_frm = rkisp1_isp_get_pad_fmt(&rkisp1->isp, NULL,
@@ -157,7 +156,7 @@ static int rkisp1_config_isp(struct rkisp1_device *rkisp1)
 	if (sink_fmt->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
 		acq_mult = 1;
 		if (src_fmt->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
-			if (sensor->mbus_type == V4L2_MBUS_BT656)
+			if (mbus_type == V4L2_MBUS_BT656)
 				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_RAW_PICT_ITU656;
 			else
 				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_RAW_PICT;
@@ -165,17 +164,17 @@ static int rkisp1_config_isp(struct rkisp1_device *rkisp1)
 			rkisp1_write(rkisp1, RKISP1_CIF_ISP_DEMOSAIC,
 				     RKISP1_CIF_ISP_DEMOSAIC_TH(0xc));
 
-			if (sensor->mbus_type == V4L2_MBUS_BT656)
+			if (mbus_type == V4L2_MBUS_BT656)
 				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_BAYER_ITU656;
 			else
 				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_BAYER_ITU601;
 		}
 	} else if (sink_fmt->pixel_enc == V4L2_PIXEL_ENC_YUV) {
 		acq_mult = 2;
-		if (sensor->mbus_type == V4L2_MBUS_CSI2_DPHY) {
+		if (mbus_type == V4L2_MBUS_CSI2_DPHY) {
 			isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU601;
 		} else {
-			if (sensor->mbus_type == V4L2_MBUS_BT656)
+			if (mbus_type == V4L2_MBUS_BT656)
 				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU656;
 			else
 				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU601;
@@ -185,17 +184,16 @@ static int rkisp1_config_isp(struct rkisp1_device *rkisp1)
 	}
 
 	/* Set up input acquisition properties */
-	if (sensor->mbus_type == V4L2_MBUS_BT656 ||
-	    sensor->mbus_type == V4L2_MBUS_PARALLEL) {
-		if (sensor->mbus_flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
+	if (mbus_type == V4L2_MBUS_BT656 || mbus_type == V4L2_MBUS_PARALLEL) {
+		if (mbus_flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
 			signal = RKISP1_CIF_ISP_ACQ_PROP_POS_EDGE;
 	}
 
-	if (sensor->mbus_type == V4L2_MBUS_PARALLEL) {
-		if (sensor->mbus_flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
+	if (mbus_type == V4L2_MBUS_PARALLEL) {
+		if (mbus_flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
 			signal |= RKISP1_CIF_ISP_ACQ_PROP_VSYNC_LOW;
 
-		if (sensor->mbus_flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
+		if (mbus_flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
 			signal |= RKISP1_CIF_ISP_ACQ_PROP_HSYNC_LOW;
 	}
 
@@ -265,17 +263,17 @@ static int rkisp1_config_dvp(struct rkisp1_device *rkisp1)
 }
 
 /* Configure MUX */
-static int rkisp1_config_path(struct rkisp1_device *rkisp1)
+static int rkisp1_config_path(struct rkisp1_device *rkisp1,
+			      enum v4l2_mbus_type mbus_type)
 {
-	struct rkisp1_sensor_async *sensor = rkisp1->active_sensor;
 	u32 dpcl = rkisp1_read(rkisp1, RKISP1_CIF_VI_DPCL);
 	int ret = 0;
 
-	if (sensor->mbus_type == V4L2_MBUS_BT656 ||
-	    sensor->mbus_type == V4L2_MBUS_PARALLEL) {
+	if (mbus_type == V4L2_MBUS_BT656 ||
+	    mbus_type == V4L2_MBUS_PARALLEL) {
 		ret = rkisp1_config_dvp(rkisp1);
 		dpcl |= RKISP1_CIF_VI_DPCL_IF_SEL_PARALLEL;
-	} else if (sensor->mbus_type == V4L2_MBUS_CSI2_DPHY) {
+	} else if (mbus_type == V4L2_MBUS_CSI2_DPHY) {
 		dpcl |= RKISP1_CIF_VI_DPCL_IF_SEL_MIPI;
 	}
 
@@ -285,14 +283,15 @@ static int rkisp1_config_path(struct rkisp1_device *rkisp1)
 }
 
 /* Hardware configure Entry */
-static int rkisp1_config_cif(struct rkisp1_device *rkisp1)
+static int rkisp1_config_cif(struct rkisp1_device *rkisp1,
+			     enum v4l2_mbus_type mbus_type, u32 mbus_flags)
 {
 	int ret;
 
-	ret = rkisp1_config_isp(rkisp1);
+	ret = rkisp1_config_isp(rkisp1, mbus_type, mbus_flags);
 	if (ret)
 		return ret;
-	ret = rkisp1_config_path(rkisp1);
+	ret = rkisp1_config_path(rkisp1, mbus_type);
 	if (ret)
 		return ret;
 	rkisp1_config_ism(rkisp1);
@@ -777,7 +776,8 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 
 	rkisp1->isp.frame_sequence = -1;
 	mutex_lock(&isp->ops_lock);
-	ret = rkisp1_config_cif(rkisp1);
+	ret = rkisp1_config_cif(rkisp1, rkisp1->active_sensor->mbus_type,
+				rkisp1->active_sensor->mbus_flags);
 	if (ret)
 		goto mutex_unlock;
 
-- 
Regards,

Laurent Pinchart

