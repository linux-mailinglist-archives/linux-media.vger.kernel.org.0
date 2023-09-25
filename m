Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E7777ACD3C
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 02:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231445AbjIYAmY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Sep 2023 20:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231464AbjIYAmF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Sep 2023 20:42:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D170180
        for <linux-media@vger.kernel.org>; Sun, 24 Sep 2023 17:41:45 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 05E0113C5;
        Mon, 25 Sep 2023 02:39:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695602374;
        bh=60kPSPrfAehlbCTZDk+uFbzmzXkKrjGoDel2HuOJZbg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TcSnq/H3GtK8CMU684uR5tsnAmd7bEiQCl0ZNIWNZpHeov/Gxot9NHqcbAkHmpswt
         QBQu1hP2IFJ/4qMGACvLu4dCDc12FM/k5Hl9vRZwLtBRVR/cAp5cpx8aMUb0YhtiPR
         0/8y0Oa+ni8ex1fnwUMJI7hk4+d7rdk8jHw9WOp0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v2 08/14] media: rkisp1: Remove dual crop control register from config structure
Date:   Mon, 25 Sep 2023 03:41:06 +0300
Message-ID: <20230925004112.22797-9-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230925004112.22797-1-laurent.pinchart@ideasonboard.com>
References: <20230925004112.22797-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The dual crop register is the same for both the MP and SP channels. Drop
it from the rkisp1_rsz_config structure and use the
RKISP1_CIF_DUAL_CROP_CTRL macro directly in the code.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/platform/rockchip/rkisp1/rkisp1-resizer.c   | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
index 6845df38ef5f..bca111711cee 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
@@ -60,7 +60,6 @@ struct rkisp1_rsz_config {
 	const int min_rsz_height;
 	/* registers */
 	struct {
-		u32 ctrl;
 		u32 yuvmode_mask;
 		u32 rawmode_mask;
 		u32 h_offset;
@@ -78,7 +77,6 @@ static const struct rkisp1_rsz_config rkisp1_rsz_config_mp = {
 	.min_rsz_height = RKISP1_RSZ_SRC_MIN_HEIGHT,
 	/* registers */
 	.dual_crop = {
-		.ctrl =			RKISP1_CIF_DUAL_CROP_CTRL,
 		.yuvmode_mask =		RKISP1_CIF_DUAL_CROP_MP_MODE_YUV,
 		.rawmode_mask =		RKISP1_CIF_DUAL_CROP_MP_MODE_RAW,
 		.h_offset =		RKISP1_CIF_DUAL_CROP_M_H_OFFS,
@@ -96,7 +94,6 @@ static const struct rkisp1_rsz_config rkisp1_rsz_config_sp = {
 	.min_rsz_height = RKISP1_RSZ_SRC_MIN_HEIGHT,
 	/* registers */
 	.dual_crop = {
-		.ctrl =			RKISP1_CIF_DUAL_CROP_CTRL,
 		.yuvmode_mask =		RKISP1_CIF_DUAL_CROP_SP_MODE_YUV,
 		.rawmode_mask =		RKISP1_CIF_DUAL_CROP_SP_MODE_RAW,
 		.h_offset =		RKISP1_CIF_DUAL_CROP_S_H_OFFS,
@@ -124,7 +121,7 @@ static inline void rkisp1_rsz_write(struct rkisp1_resizer *rsz, u32 offset,
 static void rkisp1_dcrop_disable(struct rkisp1_resizer *rsz,
 				 enum rkisp1_shadow_regs_when when)
 {
-	u32 dc_ctrl = rkisp1_read(rsz->rkisp1, rsz->config->dual_crop.ctrl);
+	u32 dc_ctrl = rkisp1_read(rsz->rkisp1, RKISP1_CIF_DUAL_CROP_CTRL);
 	u32 mask = ~(rsz->config->dual_crop.yuvmode_mask |
 		     rsz->config->dual_crop.rawmode_mask);
 
@@ -133,7 +130,7 @@ static void rkisp1_dcrop_disable(struct rkisp1_resizer *rsz,
 		dc_ctrl |= RKISP1_CIF_DUAL_CROP_GEN_CFG_UPD;
 	else
 		dc_ctrl |= RKISP1_CIF_DUAL_CROP_CFG_UPD;
-	rkisp1_write(rsz->rkisp1, rsz->config->dual_crop.ctrl, dc_ctrl);
+	rkisp1_write(rsz->rkisp1, RKISP1_CIF_DUAL_CROP_CTRL, dc_ctrl);
 }
 
 /* configure dual-crop unit */
@@ -158,14 +155,14 @@ static void rkisp1_dcrop_config(struct rkisp1_resizer *rsz,
 		return;
 	}
 
-	dc_ctrl = rkisp1_read(rkisp1, rsz->config->dual_crop.ctrl);
+	dc_ctrl = rkisp1_read(rkisp1, RKISP1_CIF_DUAL_CROP_CTRL);
 	rkisp1_write(rkisp1, rsz->config->dual_crop.h_offset, sink_crop->left);
 	rkisp1_write(rkisp1, rsz->config->dual_crop.v_offset, sink_crop->top);
 	rkisp1_write(rkisp1, rsz->config->dual_crop.h_size, sink_crop->width);
 	rkisp1_write(rkisp1, rsz->config->dual_crop.v_size, sink_crop->height);
 	dc_ctrl |= rsz->config->dual_crop.yuvmode_mask;
 	dc_ctrl |= RKISP1_CIF_DUAL_CROP_CFG_UPD;
-	rkisp1_write(rkisp1, rsz->config->dual_crop.ctrl, dc_ctrl);
+	rkisp1_write(rkisp1, RKISP1_CIF_DUAL_CROP_CTRL, dc_ctrl);
 
 	dev_dbg(rkisp1->dev, "stream %d crop: %dx%d -> %dx%d\n", rsz->id,
 		sink_fmt->width, sink_fmt->height,
-- 
Regards,

Laurent Pinchart

