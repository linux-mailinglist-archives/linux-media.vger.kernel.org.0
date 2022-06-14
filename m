Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2006354BA46
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 21:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357479AbiFNTOA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 15:14:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357493AbiFNTN7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 15:13:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70F8F28995
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 12:13:58 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240126034.bbtec.net [36.240.126.34])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC898D96;
        Tue, 14 Jun 2022 21:13:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655234037;
        bh=35+hA7UDvD2qw6jCdPcIbuPN8UA7aIOG3BVxM+CvBR8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XIGPIpoPrOZX7ILPWr9PyEU34w3DL9PeFEHSWsxqn63Bgq/ZUyMjZGE8T0dLIo6oK
         bHNz5A2eiUodiox8nmIFJYqMORsTTJbQ/EllJPTrqEvIVyyxdzLH4JBP8YS4EG21pM
         N5pL2XkAV5glO/FxzBX44DEyTUV0hd4pGoDfXMFo=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 32/55] media: rkisp1: isp: Merge ISP_ACQ_PROP configuration in single variable
Date:   Wed, 15 Jun 2022 04:11:04 +0900
Message-Id: <20220614191127.3420492-33-paul.elder@ideasonboard.com>
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

The rkisp1_config_isp() function stores the value of the input selection
and polarity configuration in two different local variables, OR'ed
together when writing the register. Merge them into a single acq_prop
variable.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c  | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index f5b8a2e31936..4496af991c82 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -141,7 +141,7 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
 			     enum v4l2_mbus_type mbus_type, u32 mbus_flags)
 {
 	struct rkisp1_device *rkisp1 = isp->rkisp1;
-	u32 isp_ctrl = 0, irq_mask = 0, acq_mult = 0, signal = 0, input_sel = 0;
+	u32 isp_ctrl = 0, irq_mask = 0, acq_mult = 0, acq_prop = 0;
 	const struct rkisp1_mbus_info *src_fmt, *sink_fmt;
 	struct v4l2_mbus_framefmt *sink_frm;
 	struct v4l2_rect *sink_crop;
@@ -188,17 +188,17 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
 	/* Set up input acquisition properties */
 	if (mbus_type == V4L2_MBUS_BT656 || mbus_type == V4L2_MBUS_PARALLEL) {
 		if (mbus_flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
-			signal = RKISP1_CIF_ISP_ACQ_PROP_POS_EDGE;
+			acq_prop |= RKISP1_CIF_ISP_ACQ_PROP_POS_EDGE;
 
 		switch (sink_fmt->bus_width) {
 		case 8:
-			input_sel = RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_8B_ZERO;
+			acq_prop |= RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_8B_ZERO;
 			break;
 		case 10:
-			input_sel = RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_10B_ZERO;
+			acq_prop |= RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_10B_ZERO;
 			break;
 		case 12:
-			input_sel = RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_12B;
+			acq_prop |= RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_12B;
 			break;
 		default:
 			dev_err(rkisp1->dev, "Invalid bus width\n");
@@ -208,15 +208,15 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
 
 	if (mbus_type == V4L2_MBUS_PARALLEL) {
 		if (mbus_flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
-			signal |= RKISP1_CIF_ISP_ACQ_PROP_VSYNC_LOW;
+			acq_prop |= RKISP1_CIF_ISP_ACQ_PROP_VSYNC_LOW;
 
 		if (mbus_flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
-			signal |= RKISP1_CIF_ISP_ACQ_PROP_HSYNC_LOW;
+			acq_prop |= RKISP1_CIF_ISP_ACQ_PROP_HSYNC_LOW;
 	}
 
 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_CTRL, isp_ctrl);
 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ACQ_PROP,
-		     signal | sink_fmt->yuv_seq | input_sel |
+		     acq_prop | sink_fmt->yuv_seq |
 		     RKISP1_CIF_ISP_ACQ_PROP_BAYER_PAT(sink_fmt->bayer_pat) |
 		     RKISP1_CIF_ISP_ACQ_PROP_FIELD_SEL_ALL);
 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ACQ_NR_FRAMES, 0);
-- 
2.30.2

