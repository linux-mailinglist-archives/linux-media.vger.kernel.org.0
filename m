Return-Path: <linux-media+bounces-26949-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4617A43FC4
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 13:55:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E01F179694
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 12:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E67268C56;
	Tue, 25 Feb 2025 12:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Iuc3D0eF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D33267F60;
	Tue, 25 Feb 2025 12:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740488118; cv=none; b=jOFZttT3KT/06Zm2gxGdPqDlzkjhVO87aYoIgRMKL61b/a5iMwLHJF/BSPzTR2yXn54aiqozszEmfu/7GSh8LJsTtij27DD2wkW0s52CJVAcYjAPUV8rEc9StAgiP0I5UxRtDCLfuh2wFs7vQtbx+ulH2qfP5cqOOhafNr2K2p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740488118; c=relaxed/simple;
	bh=2EkNM0NpuHUU7gLMmoj+7YZgPTkyFA9js1o80AYC9Uw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C4ZRKdbieT9tW7UjX9jmaXI3GH/U2dJ1NDN2E4wl1Wcx0n4IaDEBH5tcRf+xwUPFwHFdekS/vrUqGOMn3QTlcQ+NwMhWKuzuQqCAt1ilsSAJrvN+xCN0WipXUP/JefldOLO9xqY44v9TBR+DYiYMCfnXysvlm7XzmjLq6xoYfvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Iuc3D0eF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.81.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CDD22A30;
	Tue, 25 Feb 2025 13:53:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740488027;
	bh=2EkNM0NpuHUU7gLMmoj+7YZgPTkyFA9js1o80AYC9Uw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Iuc3D0eFEhJvZxVxj4OSLAMls8nRwUXSCl75WUPdyGFkc9SLzA4v43CRWHH+qfMtH
	 Ezzf1R6FRBgzGPr2d7yzY6I3hx0kGuNnmOrWKglojD0vf3MbhSygi/OFjHqLyJ/bmN
	 8/TvSVuua4MViKbwNE7jWtcOBW8qelI4QOmHBkAI=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 25 Feb 2025 18:23:05 +0530
Subject: [PATCH v3 2/2] media: rockchip: rkisp1: Add support for AWB64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-awb64-v3-2-af29b1201e48@ideasonboard.com>
References: <20250225-awb64-v3-0-af29b1201e48@ideasonboard.com>
In-Reply-To: <20250225-awb64-v3-0-af29b1201e48@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Stefan Klug <stefan.klug@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=21231;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=2EkNM0NpuHUU7gLMmoj+7YZgPTkyFA9js1o80AYC9Uw=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnvb2CF4fzL0RDoPBZljiWbjjeLLH51yIzWvJC+
 k3uMfLOloyJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ729ggAKCRBD3pH5JJpx
 RVnzD/4vAaQ859tFR1w0Y6I3T0m4E4PXOW+ikKdRTLlbJZazMtDbeO7YOAznu2O91YVljPtVso1
 7evyo4HlCbxhwRIsyqpvEFK7ww5m5LDWbSI8kXlhGh3PzD9Zk6SXddytCrm6R8m/3w06dc0mCRk
 QRcce7LOeRPS3rzLkJU5jmmjcdYxaacTPfJVA3NsyJOT0IKblyotXYNlrC/WEB1MMHeU9/iA6Ym
 Ht5/T0GwT+bJCx/8DOoTsY9b4GXZgbPPAzbyBafhagRyQFQVdnCeZ58LeQQny1R+9F/oMMYK/Wp
 rLevtwpbBUV71MGIwZNR1J+Ms2/FBt1u52D+XoJhFdULhsNliNkFp68r5y7WV6e2CshJjuBDlm1
 6jHY4kWq1LB1+6OgDZOG3e3K80LJ/S3mP29Q5JpKPSXKjoE60+eVvotVHetD+SI0iFuigy1WISf
 uBOKDbh4+JOtcf4wbuUqnA6Wpm4WUxKOjvhME3cFw//mIkzLSYFrQZ+SMLktf/+Q96+yTnpFKsW
 HL++u1ytcv5X/faEmOTmom+CJgx/xxf6hf1iVNoZWr3lcKQlJpA21kW7w9JGx79IQDXWyjCF5P0
 A3fCgF3ySpD+A+Xbvd6V3O86VvDsJeMj4rUOPodt7A1lt+WdGt/1+ojgoxqoKBDSAtz3q0LueFO
 ABRNPtoVmJWyfFA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

AWB64 is an advanced auto white-balance statistics block, present on the
ISP in iMX8MP. This block can calculate color statistics for a maximum
of 8 different (elliptical) regions, which can help the AWB algorithm in
calculating gains for complex lighting scenarios.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v3:
- Rebase on top of WDR support
- Improve doxygen comments to better describe the fixed-point values
  used by AWB64 for ellipse configuration and minimum divider threshold
---
 .../media/platform/rockchip/rkisp1/rkisp1-common.h |   2 +
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c    |   3 +-
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 123 +++++++++++++++++++++
 .../media/platform/rockchip/rkisp1/rkisp1-regs.h   |  41 +++++++
 .../media/platform/rockchip/rkisp1/rkisp1-stats.c  |  40 +++++++
 include/uapi/linux/rkisp1-config.h                 | 107 ++++++++++++++++++
 6 files changed, 315 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index ca952fd0829ba7d923ad42fec92840ccd422b6e5..60fbf5a886c498957ba04ddd47a21b744d4ff8b1 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -118,6 +118,7 @@ enum rkisp1_isp_pad {
  * @RKISP1_FEATURE_DMA_34BIT: The ISP uses 34-bit DMA addresses
  * @RKISP1_FEATURE_BLS: The ISP has a dedicated BLS block
  * @RKISP1_FEATURE_COMPAND: The ISP has a companding block
+ * @RKISP1_FEATURE_AWB64: The ISP has an AWB64 block
  *
  * The ISP features are stored in a bitmask in &rkisp1_info.features and allow
  * the driver to implement support for features present in some ISP versions
@@ -131,6 +132,7 @@ enum rkisp1_feature {
 	RKISP1_FEATURE_DMA_34BIT = BIT(4),
 	RKISP1_FEATURE_BLS = BIT(5),
 	RKISP1_FEATURE_COMPAND = BIT(6),
+	RKISP1_FEATURE_AWB64 = BIT(7),
 };
 
 #define rkisp1_has_feature(rkisp1, feature) \
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index dc65a7924f8ae6f95e7c93c4339619cd90881a62..576ed26e013add281b6d1ad401ba91c5c4128e76 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -560,7 +560,8 @@ static const struct rkisp1_info imx8mp_isp_info = {
 	.isp_ver = RKISP1_V_IMX8MP,
 	.features = RKISP1_FEATURE_MAIN_STRIDE
 		  | RKISP1_FEATURE_DMA_34BIT
-		  | RKISP1_FEATURE_COMPAND,
+		  | RKISP1_FEATURE_COMPAND
+		  | RKISP1_FEATURE_AWB64,
 	.max_width = 4096,
 	.max_height = 3072,
 };
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index 92a9aad79f6dca3c76d7692421827234e7f06390..7671dfc8249b4f631ab8bc1e0a7bf6debc0ddc1a 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -61,6 +61,7 @@ union rkisp1_ext_params_config {
 	struct rkisp1_ext_params_compand_bls_config compand_bls;
 	struct rkisp1_ext_params_compand_curve_config compand_curve;
 	struct rkisp1_ext_params_wdr_config wdr;
+	struct rkisp1_ext_params_awb64_meas_config awb64;
 };
 
 enum rkisp1_params_formats {
@@ -675,6 +676,105 @@ rkisp1_awb_meas_enable_v12(struct rkisp1_params *params,
 	}
 }
 
+/* ISP White Balance Mode */
+static void
+rkisp1_awb64_meas_config(struct rkisp1_params *params,
+			 const struct rkisp1_cif_isp_awb64_meas_config *arg)
+{
+	u32 reg_val =
+		rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_AWB64_MEAS_MODE);
+
+	/* Measurement mode */
+	if (arg->enable_median_filter)
+		reg_val |= RKISP1_CIF_ISP_AWB64_PRE_FILTER_EN;
+	else
+		reg_val &= ~RKISP1_CIF_ISP_AWB64_PRE_FILTER_EN;
+
+	if (arg->chrom_switch)
+		reg_val |= RKISP1_CIF_ISP_AWB64_CHROM_SWITCH;
+	else
+		reg_val &= ~RKISP1_CIF_ISP_AWB64_CHROM_SWITCH;
+
+	reg_val |= (arg->ellip_unite & RKISP1_CIF_ISP_AWB64_UNITE_MASK)
+		   << RKISP1_CIF_ISP_AWB64_UNITE_SHIFT;
+
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_MEAS_MODE,
+		     reg_val);
+
+	/* Measurement window */
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_V_OFFS,
+		     arg->awb_wnd.v_offs);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_H_OFFS,
+		     arg->awb_wnd.h_offs);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_V_SIZE,
+		     arg->awb_wnd.v_size);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_H_SIZE,
+		     arg->awb_wnd.h_size);
+
+	/* RGB thresholds for measurement */
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_R_MIN_MAX,
+		     arg->min_max_r);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_G_MIN_MAX,
+		     arg->min_max_g);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_B_MIN_MAX,
+		     arg->min_max_b);
+
+	/* Minimum input divider threshold */
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_MIN_DIVIDER,
+		     arg->min_div & RKISP1_CIF_ISP_AWB64_MIN_DIV_MASK);
+
+	/* Colorspace matrix coefficients */
+	for (int i = 0; i < 3; i++) {
+		for (int j = 0; j < 3; j++)
+			rkisp1_write(params->rkisp1,
+				     RKISP1_CIF_ISP_AWB64_CC_COEFF(i * 3 + j),
+				     arg->cc_coeff[i][j]);
+	}
+
+	/* Ellipse configuration */
+	for (int i = 0; i < RKISP1_CIF_ISP_AWB64_MAX_ELLIPSE; i++) {
+		const struct rkisp1_cif_isp_awb64_ellip *ellip = &arg->ellip[i];
+
+		/* Center */
+		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_ELLIP_CEN_X(i),
+			     ellip->cen_x & RKISP1_CIF_ISP_AWB64_ELLIP_CEN_MASK);
+		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_ELLIP_CEN_Y(i),
+			     ellip->cen_y & RKISP1_CIF_ISP_AWB64_ELLIP_CEN_MASK);
+		/* Radius */
+		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_ELLIP_RMAX(i),
+			     ellip->rmax & RKISP1_CIF_ISP_AWB64_ELLIP_RMAX_MASK);
+		/* CTM */
+		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_ELLIP_A1(i),
+			     ellip->ctm[0] &
+				     RKISP1_CIF_ISP_AWB64_ELLIP_A1_A3_MASK);
+		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_ELLIP_A2(i),
+			     ellip->ctm[1] &
+				     RKISP1_CIF_ISP_AWB64_ELLIP_A2_A4_MASK);
+		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_ELLIP_A3(i),
+			     ellip->ctm[2] &
+				     RKISP1_CIF_ISP_AWB64_ELLIP_A1_A3_MASK);
+		rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_ELLIP_A4(i),
+			     ellip->ctm[3] &
+				     RKISP1_CIF_ISP_AWB64_ELLIP_A2_A4_MASK);
+	}
+}
+
+static void
+rkisp1_awb64_meas_enable(struct rkisp1_params *params,
+			 const struct rkisp1_cif_isp_awb64_meas_config *arg,
+			 bool en)
+{
+	if (en) {
+		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_AWB64_MEAS_MODE,
+				      RKISP1_CIF_ISP_AWB64_MEAS_EN |
+					      RKISP1_CIF_ISP_AWB64_IRQ_EN);
+	} else {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_AWB64_MEAS_MODE,
+					RKISP1_CIF_ISP_AWB64_MEAS_EN |
+						RKISP1_CIF_ISP_AWB64_IRQ_EN);
+	}
+}
+
 static void
 rkisp1_awb_gain_config_v10(struct rkisp1_params *params,
 			   const struct rkisp1_cif_isp_awb_gain_config *arg)
@@ -2092,6 +2192,23 @@ static void rkisp1_ext_params_wdr(struct rkisp1_params *params,
 				      RKISP1_CIF_ISP_WDR_CTRL_ENABLE);
 }
 
+static void rkisp1_ext_params_awb64(struct rkisp1_params *params,
+				    const union rkisp1_ext_params_config *block)
+{
+	const struct rkisp1_ext_params_awb64_meas_config *awb64 = &block->awb64;
+
+	if (awb64->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
+		rkisp1_awb64_meas_enable(params, &awb64->config, false);
+		return;
+	}
+
+	rkisp1_awb64_meas_config(params, &awb64->config);
+
+	if ((awb64->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE) &&
+	    !(params->enabled_blocks & BIT(awb64->header.type)))
+		rkisp1_awb64_meas_enable(params, &awb64->config, true);
+}
+
 typedef void (*rkisp1_block_handler)(struct rkisp1_params *params,
 			     const union rkisp1_ext_params_config *config);
 
@@ -2210,6 +2327,12 @@ static const struct rkisp1_ext_params_handler {
 		.handler	= rkisp1_ext_params_wdr,
 		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB64_MEAS] = {
+		.size		= sizeof(struct rkisp1_ext_params_awb64_meas_config),
+		.handler	= rkisp1_ext_params_awb64,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+		.features	= RKISP1_FEATURE_AWB64,
+	},
 };
 
 static void rkisp1_ext_params_config(struct rkisp1_params *params,
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
index 31783617f39753a9b847b6612c9adf09c2ea8c99..14299ecc3a067d6711b86965e9acca31d29f9555 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
@@ -516,6 +516,24 @@
 #define RKISP1_CIF_ISP_AWB_CBCR_MAX_REF			0x000000ff
 #define RKISP1_CIF_ISP_AWB_THRES_MAX_YC			0x000000ff
 
+/* AWB64 */
+/* ISP_AWB64_WHITE_CNT */
+#define RKISP1_CIF_ISP_AWB64_GET_PIXEL_CNT(x)		((x) & 0xffffff)
+/* ISP_AWB64_MEAS_MODE */
+#define RKISP1_CIF_ISP_AWB64_MEAS_EN			BIT(0)
+#define RKISP1_CIF_ISP_AWB64_PRE_FILTER_EN		BIT(1)
+#define RKISP1_CIF_ISP_AWB64_IRQ_EN			BIT(2)
+#define RKISP1_CIF_ISP_AWB64_CHROM_SWITCH		BIT(3)
+#define RKISP1_CIF_ISP_AWB64_UNITE_MASK			GENMASK(5, 0)
+#define RKISP1_CIF_ISP_AWB64_UNITE_SHIFT		4
+/* ISP_AWB64_DIVIDER_MIN */
+#define RKISP1_CIF_ISP_AWB64_MIN_DIV_MASK		GENMASK(9, 0)
+/* ISP_AWB64_ELLIP */
+#define RKISP1_CIF_ISP_AWB64_ELLIP_CEN_MASK		GENMASK(9, 0)
+#define RKISP1_CIF_ISP_AWB64_ELLIP_A1_A3_MASK		GENMASK(11, 0)
+#define RKISP1_CIF_ISP_AWB64_ELLIP_A2_A4_MASK		GENMASK(8, 0)
+#define RKISP1_CIF_ISP_AWB64_ELLIP_RMAX_MASK		GENMASK(23, 0)
+
 /* AE */
 /* ISP_EXP_CTRL */
 #define RKISP1_CIF_ISP_EXP_ENA				BIT(0)
@@ -1330,6 +1348,29 @@
 #define RKISP1_CIF_ISP_WDR_TONECURVE_SHD(n)	(RKISP1_CIF_ISP_WDR_BASE + 0x000000a0 + (n) * 4)
 #define RKISP1_CIF_ISP_WDR_TONECURVE_YM_SHD(n)	(RKISP1_CIF_ISP_WDR_BASE + 0x000000b0 + (n) * 4)
 
+#define RKISP1_CIF_ISP_AWB64_BASE		0x00002c00
+#define RKISP1_CIF_ISP_AWB64_MEAS_MODE		(RKISP1_CIF_ISP_AWB64_BASE + 0x00000000)
+#define RKISP1_CIF_ISP_AWB64_H_OFFS		(RKISP1_CIF_ISP_AWB64_BASE + 0x00000004)
+#define RKISP1_CIF_ISP_AWB64_V_OFFS		(RKISP1_CIF_ISP_AWB64_BASE + 0x00000008)
+#define RKISP1_CIF_ISP_AWB64_H_SIZE		(RKISP1_CIF_ISP_AWB64_BASE + 0x0000000c)
+#define RKISP1_CIF_ISP_AWB64_V_SIZE		(RKISP1_CIF_ISP_AWB64_BASE + 0x00000010)
+#define RKISP1_CIF_ISP_AWB64_R_MIN_MAX		(RKISP1_CIF_ISP_AWB64_BASE + 0x00000014)
+#define RKISP1_CIF_ISP_AWB64_G_MIN_MAX		(RKISP1_CIF_ISP_AWB64_BASE + 0x00000018)
+#define RKISP1_CIF_ISP_AWB64_B_MIN_MAX		(RKISP1_CIF_ISP_AWB64_BASE + 0x0000001c)
+#define RKISP1_CIF_ISP_AWB64_MIN_DIVIDER	(RKISP1_CIF_ISP_AWB64_BASE + 0x00000020)
+#define RKISP1_CIF_ISP_AWB64_CC_COEFF(n)	(RKISP1_CIF_ISP_AWB64_BASE + 0x00000024 + (n) * 4)
+#define RKISP1_CIF_ISP_AWB64_ELLIP_CEN_X(n)	(RKISP1_CIF_ISP_AWB64_BASE + 0x00000048 + (n) * 8)
+#define RKISP1_CIF_ISP_AWB64_ELLIP_CEN_Y(n)	(RKISP1_CIF_ISP_AWB64_BASE + 0x0000004c + (n) * 8)
+#define RKISP1_CIF_ISP_AWB64_ELLIP_A1(n)	(RKISP1_CIF_ISP_AWB64_BASE + 0x00000088 + (n) * 16)
+#define RKISP1_CIF_ISP_AWB64_ELLIP_A2(n)	(RKISP1_CIF_ISP_AWB64_BASE + 0x0000008c + (n) * 16)
+#define RKISP1_CIF_ISP_AWB64_ELLIP_A3(n)	(RKISP1_CIF_ISP_AWB64_BASE + 0x00000090 + (n) * 16)
+#define RKISP1_CIF_ISP_AWB64_ELLIP_A4(n)	(RKISP1_CIF_ISP_AWB64_BASE + 0x00000094 + (n) * 16)
+#define RKISP1_CIF_ISP_AWB64_ELLIP_RMAX(n)	(RKISP1_CIF_ISP_AWB64_BASE + 0x00000108 + (n) * 4)
+#define RKISP1_CIF_ISP_AWB64_WHITE_CNT(n)	(RKISP1_CIF_ISP_AWB64_BASE + 0x00000128 + (n) * 4)
+#define RKISP1_CIF_ISP_AWB64_R_ACCU(n)		(RKISP1_CIF_ISP_AWB64_BASE + 0x00000148 + (n) * 12)
+#define RKISP1_CIF_ISP_AWB64_G_ACCU(n)		(RKISP1_CIF_ISP_AWB64_BASE + 0x0000014c + (n) * 12)
+#define RKISP1_CIF_ISP_AWB64_B_ACCU(n)		(RKISP1_CIF_ISP_AWB64_BASE + 0x00000150 + (n) * 12)
+
 #define RKISP1_CIF_ISP_HIST_BASE_V12		0x00002c00
 #define RKISP1_CIF_ISP_HIST_CTRL_V12		(RKISP1_CIF_ISP_HIST_BASE_V12 + 0x00000000)
 #define RKISP1_CIF_ISP_HIST_SIZE_V12		(RKISP1_CIF_ISP_HIST_BASE_V12 + 0x00000004)
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
index d5fdb8f82dc78b0143f71d76f36817db389921b7..de2571ac4c162a770b987e4ada469d2e8953ff7c 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
@@ -214,6 +214,38 @@ static void rkisp1_stats_get_awb_meas_v12(struct rkisp1_stats *stats,
 				RKISP1_CIF_ISP_AWB_GET_MEAN_Y_G(reg_val);
 }
 
+static void rkisp1_stats_get_awb64_meas_imx8mp(struct rkisp1_stats *stats,
+					       struct rkisp1_stat_buffer *pbuf)
+{
+	struct rkisp1_device *rkisp1 = stats->rkisp1;
+	u32 white_cnt;
+
+	pbuf->meas_type |= RKISP1_CIF_ISP_STAT_AWB64;
+
+	for (unsigned int i = 0; i < RKISP1_CIF_ISP_AWB64_MAX_ELLIPSE; i++) {
+		struct rkisp1_cif_isp_awb64_meas *count =
+			&pbuf->params.awb64.count[i];
+
+		white_cnt = rkisp1_read(rkisp1,
+					RKISP1_CIF_ISP_AWB64_WHITE_CNT(i));
+		count->cnt = RKISP1_CIF_ISP_AWB64_GET_PIXEL_CNT(white_cnt);
+
+		count->accu_r =
+			rkisp1_read(rkisp1, RKISP1_CIF_ISP_AWB64_R_ACCU(i));
+		count->accu_g =
+			rkisp1_read(rkisp1, RKISP1_CIF_ISP_AWB64_G_ACCU(i));
+		count->accu_b =
+			rkisp1_read(rkisp1, RKISP1_CIF_ISP_AWB64_B_ACCU(i));
+	}
+}
+
+static void rkisp1_stats_get_awb_meas_imx8mp(struct rkisp1_stats *stats,
+					     struct rkisp1_stat_buffer *pbuf)
+{
+	rkisp1_stats_get_awb_meas_v10(stats, pbuf);
+	rkisp1_stats_get_awb64_meas_imx8mp(stats, pbuf);
+}
+
 static void rkisp1_stats_get_aec_meas_v10(struct rkisp1_stats *stats,
 					  struct rkisp1_stat_buffer *pbuf)
 {
@@ -335,6 +367,12 @@ static struct rkisp1_stats_ops rkisp1_v12_stats_ops = {
 	.get_hst_meas = rkisp1_stats_get_hst_meas_v12,
 };
 
+static const struct rkisp1_stats_ops rkisp1_imx8mp_stats_ops = {
+	.get_awb_meas = rkisp1_stats_get_awb_meas_imx8mp,
+	.get_aec_meas = rkisp1_stats_get_aec_meas_v10,
+	.get_hst_meas = rkisp1_stats_get_hst_meas_v10,
+};
+
 static void
 rkisp1_stats_send_measurement(struct rkisp1_stats *stats, u32 isp_ris)
 {
@@ -404,6 +442,8 @@ static void rkisp1_init_stats(struct rkisp1_stats *stats)
 
 	if (stats->rkisp1->info->isp_ver == RKISP1_V12)
 		stats->ops = &rkisp1_v12_stats_ops;
+	else if (stats->rkisp1->info->isp_ver == RKISP1_V_IMX8MP)
+		stats->ops = &rkisp1_imx8mp_stats_ops;
 	else
 		stats->ops = &rkisp1_v10_stats_ops;
 }
diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
index 78f4f350119bd29b2ac50cba2dd7cf3b0e4a8416..0e91a36b62387ad33a67b86ed2300c59720a80cc 100644
--- a/include/uapi/linux/rkisp1-config.h
+++ b/include/uapi/linux/rkisp1-config.h
@@ -88,6 +88,11 @@
 #define RKISP1_CIF_ISP_AWB_MAX_GRID                1
 #define RKISP1_CIF_ISP_AWB_MAX_FRAMES              7
 
+/*
+ * Automatic white balance extended block (AWB64)
+ */
+#define RKISP1_CIF_ISP_AWB64_MAX_ELLIPSE           8
+
 /*
  * Gamma out
  */
@@ -183,6 +188,7 @@
 #define RKISP1_CIF_ISP_STAT_AUTOEXP       (1U << 1)
 #define RKISP1_CIF_ISP_STAT_AFM           (1U << 2)
 #define RKISP1_CIF_ISP_STAT_HIST          (1U << 3)
+#define RKISP1_CIF_ISP_STAT_AWB64         (1U << 4)
 
 /**
  * enum rkisp1_cif_isp_version - ISP variants
@@ -526,6 +532,61 @@ struct rkisp1_cif_isp_awb_gain_config {
 	__u16 gain_green_b;
 };
 
+/**
+ * struct rkisp1_cif_isp_awb64_ellip - Ellipse configuration for AWB64 measurement
+ *
+ * @rmax: Points within rmax (24-bit) squared distance from center are
+ *        considered for white point calculations
+ * @cen_x: X coordinate of the center of ellipse, 10-bit signed fixed-point
+ *         number with 9 bits fractional part
+ * @cen_y: Y coordinate of the center of ellipse, 10-bit signed fixed-point
+ *         number with 9 bits fractional part
+ * @ctm: Coordinate transformation matrix,
+ *       ctm[0] and ctm[2] are 12-bit signed fixed-point with 8-bit fractional
+ *       part ranging from -8 (0x800) to 7.996 (0x7ff),
+ *       ctm[1] and ctm[3] are 9-bit signed fixed-point with 8-bit fractional
+ *       part ranging from -1 (0x100) to 0.996 (0x0ff)
+ */
+struct rkisp1_cif_isp_awb64_ellip {
+	__u32 rmax;
+	__u16 cen_x;
+	__u16 cen_y;
+	__u16 ctm[4];
+};
+
+/**
+ * struct rkisp1_cif_isp_awb64_meas_config - Configuration for the AWB64 stats
+ *
+ * @awb_wnd: White balance measurement window (in pixels)
+ * @ellip: Ellipse regions used for measurement
+ * @cc_coeff: Colorspace matrix (all coefficient values are 11-bit)
+ * @min_div: Minimum divider, if input is less than this don't do division
+ *           (unsigned 10-bit fixed-point value with 10 fractional bits)
+ * @min_max_r: Only pixels with min_r < R < max_r contribute to measurement,
+ *             bits 0:7 are min_r and bits 8:15 are max_r
+ * @min_max_g: Only pixels with min_g < G < max_g contribute to measurement,
+ *             bits 0:7 are min_g and bits 8:15 are max_g
+ * @min_max_b: Only pixels with min_b < B < max_b contribute to measurement,
+ *             bits 0:7 are min_b and bits 8:15 are max_b
+ * @enable_median_filter: Enable median filter before AWB measurement
+ * @ellip_unite: Bitmask to select which regions should be combined for measurement,
+ *               bits 0:2 to combine ellipse 0 with ellipse 1,2,3 and
+ *               bits 3:5 to combine ellipse 4 with ellipse 5,6,7
+ * @chrom_switch: Accumulate Q1, Q2 chromaticities instead of R, G, B
+ */
+struct rkisp1_cif_isp_awb64_meas_config {
+	struct rkisp1_cif_isp_window awb_wnd;
+	struct rkisp1_cif_isp_awb64_ellip ellip[RKISP1_CIF_ISP_AWB64_MAX_ELLIPSE];
+	__u16 cc_coeff[3][3];
+	__u16 min_div;
+	__u16 min_max_r;
+	__u16 min_max_g;
+	__u16 min_max_b;
+	__u8 enable_median_filter;
+	__u8 ellip_unite;
+	__u8 chrom_switch;
+};
+
 /**
  * struct rkisp1_cif_isp_flt_config - Configuration used by ISP filtering
  *
@@ -1088,6 +1149,31 @@ struct rkisp1_cif_isp_hist_stat {
 	__u32 hist_bins[RKISP1_CIF_ISP_HIST_BIN_N_MAX];
 };
 
+/**
+ * struct rkisp1_cif_isp_awb64_meas - AWB64 measured values
+ *
+ * @cnt: White pixel count, number of "white pixels" found during last
+ *	 measurement
+ * @accu_r: Total value of Red within elliptical region
+ * @accu_g: Total value of Green within elliptical region
+ * @accu_b: Total value of Blue within elliptical region
+ */
+struct rkisp1_cif_isp_awb64_meas {
+	__u32 cnt;
+	__u32 accu_r;
+	__u32 accu_g;
+	__u32 accu_b;
+};
+
+/**
+ * struct rkisp1_cif_isp_awb64_stat - statistics AWB64 data
+ *
+ * @count: Measured pixel accumulator data for elliptical regions
+ */
+struct rkisp1_cif_isp_awb64_stat {
+	struct rkisp1_cif_isp_awb64_meas count[RKISP1_CIF_ISP_AWB64_MAX_ELLIPSE];
+};
+
 /**
  * struct rkisp1_cif_isp_stat - Rockchip ISP1 Statistics Data
  *
@@ -1095,12 +1181,14 @@ struct rkisp1_cif_isp_hist_stat {
  * @ae: statistics data for auto exposure
  * @af: statistics data for auto focus
  * @hist: statistics histogram data
+ * @awb64: statistics data for automatic white balance 64
  */
 struct rkisp1_cif_isp_stat {
 	struct rkisp1_cif_isp_awb_stat awb;
 	struct rkisp1_cif_isp_ae_stat ae;
 	struct rkisp1_cif_isp_af_stat af;
 	struct rkisp1_cif_isp_hist_stat hist;
+	struct rkisp1_cif_isp_awb64_stat awb64;
 };
 
 /**
@@ -1142,6 +1230,7 @@ struct rkisp1_stat_buffer {
  * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND: Companding expand curve
  * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS: Companding compress curve
  * @RKISP1_EXT_PARAMS_BLOCK_TYPE_WDR: Wide dynamic range
+ * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB64_MEAS: Auto white balance 64 statistics
  */
 enum rkisp1_ext_params_block_type {
 	RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS,
@@ -1165,6 +1254,7 @@ enum rkisp1_ext_params_block_type {
 	RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND,
 	RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS,
 	RKISP1_EXT_PARAMS_BLOCK_TYPE_WDR,
+	RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB64_MEAS,
 };
 
 #define RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE	(1U << 0)
@@ -1460,6 +1550,23 @@ struct rkisp1_ext_params_awb_meas_config {
 	struct rkisp1_cif_isp_awb_meas_config config;
 } __attribute__((aligned(8)));
 
+/**
+ * struct rkisp1_ext_params_awb64_meas_config - RkISP1 extensible params AWB64
+ *						Meas config
+ *
+ * RkISP1 extensible parameters Auto-White Balance 64 Measurement configuration
+ * block. Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB64_MEAS`.
+ *
+ * @header: The RkISP1 extensible parameters header, see
+ *	    :c:type:`rkisp1_ext_params_block_header`
+ * @config: Auto-White Balance 64 measure configuration, see
+ *	    :c:type:`rkisp1_cif_isp_awb64_meas_config`
+ */
+struct rkisp1_ext_params_awb64_meas_config {
+	struct rkisp1_ext_params_block_header header;
+	struct rkisp1_cif_isp_awb64_meas_config config;
+} __attribute__((aligned(8)));
+
 /**
  * struct rkisp1_ext_params_hst_config - RkISP1 extensible params Histogram config
  *

-- 
2.48.1


