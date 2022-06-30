Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 437D35626DA
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 01:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231839AbiF3XKn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 19:10:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231673AbiF3XKh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 19:10:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2E9DBE34
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 16:10:33 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D75D2895;
        Fri,  1 Jul 2022 01:07:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656630478;
        bh=UTX1KlpduCbPiHTFDfiCrohJLjz4TSl7CUWviqNLgzs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MB+ncRByxwUjuLVQ5mDFrrtkbgjTjBjAXLLlZ5mWeBabbhAz0UayrhAV5fRAXV02+
         xNN8fWLQLGE3iPSyeU01d82MQc9sZLGl83UQuYhkeAcVCci4aazFUEbAno2FUM/MCS
         FKeLyz+Nrgg5HZwPT1TsUCv4Zdg1/lCC1/kPVtP8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v2 32/55] media: rkisp1: isp: Move input configuration to rkisp1_config_isp()
Date:   Fri,  1 Jul 2022 02:06:50 +0300
Message-Id: <20220630230713.10580-33-laurent.pinchart@ideasonboard.com>
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

The ISP_ACQ_PROP register is set twice, once in rkisp1_config_isp() for
most of its fields, and once in rkisp1_config_dvp() (called from
rkisp1_config_path()) to configure the input selection field. Move the
latter to rkisp1_config_isp() to write the register once only, and drop
the now empty rkisp1_config_dvp() function.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Print the value of unsupported bus width
- Remove unneeded curly braces
---
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 66 +++++++------------
 1 file changed, 24 insertions(+), 42 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 9b32ae585de8..85c1995bb5c2 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -141,7 +141,7 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
 			     enum v4l2_mbus_type mbus_type, u32 mbus_flags)
 {
 	struct rkisp1_device *rkisp1 = isp->rkisp1;
-	u32 isp_ctrl = 0, irq_mask = 0, acq_mult = 0, signal = 0;
+	u32 isp_ctrl = 0, irq_mask = 0, acq_mult = 0, signal = 0, input_sel = 0;
 	const struct rkisp1_mbus_info *src_fmt, *sink_fmt;
 	struct v4l2_mbus_framefmt *sink_frm;
 	struct v4l2_rect *sink_crop;
@@ -189,6 +189,22 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
 	if (mbus_type == V4L2_MBUS_BT656 || mbus_type == V4L2_MBUS_PARALLEL) {
 		if (mbus_flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
 			signal = RKISP1_CIF_ISP_ACQ_PROP_POS_EDGE;
+
+		switch (sink_fmt->bus_width) {
+		case 8:
+			input_sel = RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_8B_ZERO;
+			break;
+		case 10:
+			input_sel = RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_10B_ZERO;
+			break;
+		case 12:
+			input_sel = RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_12B;
+			break;
+		default:
+			dev_err(rkisp1->dev, "Invalid bus width %u\n",
+				sink_fmt->bus_width);
+			return -EINVAL;
+		}
 	}
 
 	if (mbus_type == V4L2_MBUS_PARALLEL) {
@@ -201,7 +217,7 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
 
 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_CTRL, isp_ctrl);
 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ACQ_PROP,
-		     signal | sink_fmt->yuv_seq |
+		     signal | sink_fmt->yuv_seq | input_sel |
 		     RKISP1_CIF_ISP_ACQ_PROP_BAYER_PAT(sink_fmt->bayer_pat) |
 		     RKISP1_CIF_ISP_ACQ_PROP_FIELD_SEL_ALL);
 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ACQ_NR_FRAMES, 0);
@@ -238,52 +254,19 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
 	return 0;
 }
 
-static int rkisp1_config_dvp(struct rkisp1_isp *isp)
-{
-	struct rkisp1_device *rkisp1 = isp->rkisp1;
-	const struct rkisp1_mbus_info *sink_fmt = isp->sink_fmt;
-	u32 val, input_sel;
-
-	switch (sink_fmt->bus_width) {
-	case 8:
-		input_sel = RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_8B_ZERO;
-		break;
-	case 10:
-		input_sel = RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_10B_ZERO;
-		break;
-	case 12:
-		input_sel = RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_12B;
-		break;
-	default:
-		dev_err(rkisp1->dev, "Invalid bus width\n");
-		return -EINVAL;
-	}
-
-	val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_ACQ_PROP);
-	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ACQ_PROP, val | input_sel);
-
-	return 0;
-}
-
 /* Configure MUX */
-static int rkisp1_config_path(struct rkisp1_isp *isp,
-			      enum v4l2_mbus_type mbus_type)
+static void rkisp1_config_path(struct rkisp1_isp *isp,
+			       enum v4l2_mbus_type mbus_type)
 {
 	struct rkisp1_device *rkisp1 = isp->rkisp1;
 	u32 dpcl = rkisp1_read(rkisp1, RKISP1_CIF_VI_DPCL);
-	int ret = 0;
 
-	if (mbus_type == V4L2_MBUS_BT656 ||
-	    mbus_type == V4L2_MBUS_PARALLEL) {
-		ret = rkisp1_config_dvp(isp);
+	if (mbus_type == V4L2_MBUS_BT656 || mbus_type == V4L2_MBUS_PARALLEL)
 		dpcl |= RKISP1_CIF_VI_DPCL_IF_SEL_PARALLEL;
-	} else if (mbus_type == V4L2_MBUS_CSI2_DPHY) {
+	else if (mbus_type == V4L2_MBUS_CSI2_DPHY)
 		dpcl |= RKISP1_CIF_VI_DPCL_IF_SEL_MIPI;
-	}
 
 	rkisp1_write(rkisp1, RKISP1_CIF_VI_DPCL, dpcl);
-
-	return ret;
 }
 
 /* Hardware configure Entry */
@@ -295,9 +278,8 @@ static int rkisp1_config_cif(struct rkisp1_isp *isp,
 	ret = rkisp1_config_isp(isp, mbus_type, mbus_flags);
 	if (ret)
 		return ret;
-	ret = rkisp1_config_path(isp, mbus_type);
-	if (ret)
-		return ret;
+
+	rkisp1_config_path(isp, mbus_type);
 	rkisp1_config_ism(isp);
 
 	return 0;
-- 
Regards,

Laurent Pinchart

