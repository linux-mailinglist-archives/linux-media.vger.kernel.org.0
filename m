Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 275AF5626D1
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 01:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231823AbiF3XKq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 19:10:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231802AbiF3XKm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 19:10:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B9862E9DF
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 16:10:38 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8175529E4;
        Fri,  1 Jul 2022 01:07:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656630478;
        bh=CCn1pvCGzS4JVn27RddMmYCDfKrTsyFjqp4DZNL7wLI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Wj1ptsw4tT9+HKmlESa+tTuCuQXova0Z1DxfjjzlVIPoUtjd5hw6SZPh1OhgMmcjj
         atPJesl/WztXSZVarsaSunatmZY5six8R7lo0m4v79VXmbJuiiGXbHMNGGAs3Ns7zE
         FNck8Na3e/m3cJkym3FjyQzYsQt3zV0YwJFtvUJo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v2 33/55] media: rkisp1: isp: Merge ISP_ACQ_PROP configuration in single variable
Date:   Fri,  1 Jul 2022 02:06:51 +0300
Message-Id: <20220630230713.10580-34-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
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

The rkisp1_config_isp() function stores the value of the input selection
and polarity configuration in two different local variables, OR'ed
together when writing the register. Merge them into a single acq_prop
variable.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
---
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c  | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 85c1995bb5c2..938541ce52ce 100644
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
 			dev_err(rkisp1->dev, "Invalid bus width %u\n",
@@ -209,15 +209,15 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
 
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
Regards,

Laurent Pinchart

