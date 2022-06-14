Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5A1654BA40
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 21:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357271AbiFNTNi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 15:13:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344359AbiFNTNg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 15:13:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2656A11C0F
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 12:13:35 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240126034.bbtec.net [36.240.126.34])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 54A8D825;
        Tue, 14 Jun 2022 21:13:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655234013;
        bh=tZdsTEOzZ0A5HJGR1F3OoUPE4i5dFnHw09rTYGtqYNY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=H3o3JQ6onfS3TdxMjM53jlS9xIRc2tJEMvBYdiAsB86sVSvE8Rl6DUBM6ba1Ifu3r
         YzrzMK7aXr8v9+k0InuJmFEJ9VDBgGlqFKHAfJ6R2cXOn8ZvWiYeD5yLd6eua02IyB
         8ruz/fc7n2x/F0a/Dj5dqw1uu4LRi6GqQun9TiBY=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 26/55] media: rkisp1: isp: Pass mbus type and flags to rkisp1_config_cif()
Date:   Wed, 15 Jun 2022 04:10:58 +0900
Message-Id: <20220614191127.3420492-27-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
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

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

To prepare for the removal of the active_sensor field from the
rkisp1_device structure, pass the media bus type of flag to the
rkisp1_config_cif() function instead of accessing them through
active_sensor.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 44 +++++++++----------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index a234cf29ec67..f6d1c93dd99d 100644
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
2.30.2

