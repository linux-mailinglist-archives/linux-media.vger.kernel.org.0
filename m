Return-Path: <linux-media+bounces-24155-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B15939FE310
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 07:55:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BFFF1881CC7
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 06:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B246919E994;
	Mon, 30 Dec 2024 06:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f2Wfee5+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4534B335BA;
	Mon, 30 Dec 2024 06:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735541746; cv=none; b=HQnZIdg46D3T0QYzfW1GspBVrP3U1Lfltlc6ZdXcLROLaGdYGazfCiSpX4/PIejAKmmy+g2SgrHgf6rKpzsWRwyITT1VOJvQAkmgNCSpTn4E+5mPZ4Tdw9HqeaZisM5t3ChjtHkBrH+B+fUczNXYLoU/SoVzMEp41wCLXDFMqVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735541746; c=relaxed/simple;
	bh=h+1me2feCpYOfeX+BsDnc7MMp3Hw7n6fYWb8BDpMy4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aRAVo7DRwrbig4C18m8xZBY1UDP02NUYgDjeT+0hi0SKmG4+R/H6wCOaa7/xZpsVOnl809FGAGBkqxZt7/Z59hGmfGBR/yDfrxd3bUslZK8Q6FnOOHOfkTVp7sGvQIZ5oIax+G8kHwluzCk+NXsR4evaYoFrnryQz25AExBp7PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=f2Wfee5+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.82.226])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D16863DC;
	Mon, 30 Dec 2024 07:54:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735541695;
	bh=h+1me2feCpYOfeX+BsDnc7MMp3Hw7n6fYWb8BDpMy4Q=;
	h=From:Date:Subject:To:Cc:From;
	b=f2Wfee5+pkbe5IQ9GxXqwlO5evoZqTFExYx/Ec90yg8Z6WHwS3eY5XAQlbnHOEDk+
	 w0MFuB3UDGcTiNAHfgSkeZTEKEun5c22s1w/R69hrnx6jE8aH2ycxpsTT5R4SYMa81
	 /58yHARfFL54HGNkBGF/fPuiqKnKBn8Yot8Z7N9o=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 30 Dec 2024 12:25:09 +0530
Subject: [PATCH RFC] media: rockchip: rkisp1: Add support for AWB64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-awb64-v1-1-27b0ee65f551@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAMxDcmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI2MD3cTyJDMTXXNLI3MDA0uLVEPTVCWg2oKi1LTMCrA50UpBbs5KsbW
 1AFfMMHZcAAAA
X-Change-ID: 20241230-awb64-79270098e15e
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=22362;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=h+1me2feCpYOfeX+BsDnc7MMp3Hw7n6fYWb8BDpMy4Q=;
 b=kA0DAAgBQ96R+SSacUUByyZiAGdyQ96iulDfLMfveo4znTnjTjDd82sz0N3gygYlUiEyoACII
 okCMwQAAQgAHRYhBE3g2Bjl1XXo1FqvxUPekfkkmnFFBQJnckPeAAoJEEPekfkkmnFFiCwP/i0/
 7HUjUTc/mZB0a17WYEIbfM6JY8EZ6XhKkS3tV5msAERGA6ErDENAF+6m4I0B+mzAA2m1gnGMzYl
 WNaqlgd5U/xnSAb3Pb05fLL2bzfBFfhLSFDiByf1hEkNRJvceKwKGh53ZoNtlrSHQ1k9y5I+dRn
 RHvd2kTg2uN0IuZ/jdyuDffPpnB4Qen4D7iYfHH/wDiOqtCgFjbmlVDfg6ex08H6m7vX0XC9lgA
 nldRrAqc5nueLOhWXpHROOtWv2yLkeQwln661ScxPFVTD85BloW1kA5xucmAE9mrlf+75SDYfK0
 aP8UkBKfSWsYj2WtprMWGtIcQq4RkB4BuC4BTlYGs5miurQIcRilDQvwvnTrJsFyllG0+qIvakH
 9HkVKaa3yTo5mO5V0xjkyF3XOkkPHyVaUCdMadMPW1jWD2n+pheY1POP+d3vizAv+O4sfZbVDDp
 FLqM4N6dYEb2lPAeLEq3wfCUXFo/TLRh++4JDp2oCO7FAGcPLHeBEpeEnOFKO2/tmDu2fL5d6ol
 FYlDug6QWcZ43+/bILqnBnosRVYSbmT4npgSVx3Ni4Vr/RyGgD7P+QSNCUJfZq4IabtcCqdrN6x
 ZW+h/qNsgycq9d+J7O4a/TblGWfn0NKOE6/le7xovdM8BC4xmjz1aDdBMdDE+W8+/P8sotcY/Pw
 tv8dg
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

AWB64 is an advanced auto white-balance statistics block, present on the
ISP in iMX8MP. This block can calculate color statistics for a maximum
of 8 different (elliptical) regions, which can be used by the AWB
algorithm to better tune the color gains.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
This patch is only compile-tested, thus marked as an RFC.

Some of the ellipse and color transformation parameters are sparsely
documented, so the API might have to change on further testing.
---
 .../media/platform/rockchip/rkisp1/rkisp1-common.h |   9 ++
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c    |   3 +-
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 123 +++++++++++++++++++++
 .../media/platform/rockchip/rkisp1/rkisp1-regs.h   |  41 +++++++
 .../media/platform/rockchip/rkisp1/rkisp1-stats.c  |  31 +++++-
 include/uapi/linux/rkisp1-config.h                 | 105 ++++++++++++++++++
 6 files changed, 310 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index ca952fd0829ba7d923ad42fec92840ccd422b6e5..7dc9d101a1a01627f174cc4c454e4e57b38e1f8e 100644
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
@@ -345,6 +347,8 @@ struct rkisp1_stats;
 struct rkisp1_stats_ops {
 	void (*get_awb_meas)(struct rkisp1_stats *stats,
 			     struct rkisp1_stat_buffer *pbuf);
+	void (*get_awb64_meas)(struct rkisp1_stats *stats,
+			       struct rkisp1_stat_buffer *pbuf);
 	void (*get_aec_meas)(struct rkisp1_stats *stats,
 			     struct rkisp1_stat_buffer *pbuf);
 	void (*get_hst_meas)(struct rkisp1_stats *stats,
@@ -381,6 +385,11 @@ struct rkisp1_params_ops {
 	void (*awb_meas_enable)(struct rkisp1_params *params,
 				const struct rkisp1_cif_isp_awb_meas_config *arg,
 				bool en);
+	void (*awb64_meas_config)(struct rkisp1_params *params,
+				  const struct rkisp1_cif_isp_awb64_meas_config *arg);
+	void (*awb64_meas_enable)(struct rkisp1_params *params,
+				  const struct rkisp1_cif_isp_awb64_meas_config *arg,
+				  bool en);
 	void (*awb_gain_config)(struct rkisp1_params *params,
 				const struct rkisp1_cif_isp_awb_gain_config *arg);
 	void (*aec_config)(struct rkisp1_params *params,
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 0100b9c3edbefbdc001e2e4d13049efa9493e3bd..20903823b8eec2dd6b2fda788a42ef7545158f8c 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -557,7 +557,8 @@ static const struct rkisp1_info imx8mp_isp_info = {
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
index b28f4140c8a309a3231d44d825c6461e3ecb2a44..1ee5f07d461c5ad7aadff908c25f7a5bd2ff81f9 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -60,6 +60,7 @@ union rkisp1_ext_params_config {
 	struct rkisp1_ext_params_afc_config afc;
 	struct rkisp1_ext_params_compand_bls_config compand_bls;
 	struct rkisp1_ext_params_compand_curve_config compand_curve;
+	struct rkisp1_ext_params_awb64_meas_config awb64;
 };
 
 enum rkisp1_params_formats {
@@ -674,6 +675,101 @@ rkisp1_awb_meas_enable_v12(struct rkisp1_params *params,
 	}
 }
 
+/* ISP White Balance Mode */
+static void
+rkisp1_awb64_meas_config_v10(struct rkisp1_params *params,
+			     const struct rkisp1_cif_isp_awb64_meas_config *arg)
+{
+	/* window offset */
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_V_OFFS,
+		     arg->awb_wnd.v_offs);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_V_OFFS,
+		     arg->awb_wnd.v_offs);
+	/* AWB window size */
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_V_SIZE,
+		     arg->awb_wnd.v_size);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_H_SIZE,
+		     arg->awb_wnd.h_size);
+	/* RGB thresholds for measurement */
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_R_MIN_MAX,
+		     arg->max_r << 8 | arg->min_r);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_G_MIN_MAX,
+		     arg->max_g << 8 | arg->min_g);
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_B_MIN_MAX,
+		     arg->max_b << 8 | arg->min_b);
+	/* Minimum input divider threshold */
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_MIN_DIVIDER,
+		     arg->min_div & RKISP1_CIF_ISP_AWB64_MIN_DIV_MASK);
+	/* Colorspace matrix coefficients */
+	for (int i = 0; i < 3; i++)
+		for (int j = 0; j < 3; j++)
+			rkisp1_write(params->rkisp1,
+				     RKISP1_CIF_ISP_AWB64_CC_COEFF(i * 3 + j),
+				     arg->cc_coeff[i][j]);
+	/* Ellipse configuration */
+	for (int i = 0; i < RKISP1_CIF_ISP_AWB64_MAX_ELLIPSE; i++) {
+		/* Center */
+		rkisp1_write(params->rkisp1,
+			     RKISP1_CIF_ISP_AWB64_ELLIP_CEN_X(i),
+			     arg->ellip[i].cen_x &
+				     RKISP1_CIF_ISP_AWB64_ELLIP_CEN_MASK);
+		rkisp1_write(params->rkisp1,
+			     RKISP1_CIF_ISP_AWB64_ELLIP_CEN_Y(i),
+			     arg->ellip[i].cen_y &
+				     RKISP1_CIF_ISP_AWB64_ELLIP_CEN_MASK);
+		/* Radius */
+		rkisp1_write(params->rkisp1,
+			     RKISP1_CIF_ISP_AWB64_ELLIP_RMAX(i),
+			     arg->ellip[i].rmax &
+				     RKISP1_CIF_ISP_AWB64_ELLIP_RMAX_MASK);
+		/* CTM */
+		rkisp1_write(params->rkisp1,
+			     RKISP1_CIF_ISP_AWB64_ELLIP_A1(i),
+			     arg->ellip[i].ctm[0] &
+				     RKISP1_CIF_ISP_AWB64_ELLIP_A1_A3_MASK);
+		rkisp1_write(params->rkisp1,
+			     RKISP1_CIF_ISP_AWB64_ELLIP_A2(i),
+			     arg->ellip[i].ctm[1] &
+				     RKISP1_CIF_ISP_AWB64_ELLIP_A2_A4_MASK);
+		rkisp1_write(params->rkisp1,
+			     RKISP1_CIF_ISP_AWB64_ELLIP_A3(i),
+			     arg->ellip[i].ctm[2] &
+				     RKISP1_CIF_ISP_AWB64_ELLIP_A1_A3_MASK);
+		rkisp1_write(params->rkisp1,
+			     RKISP1_CIF_ISP_AWB64_ELLIP_A4(i),
+			     arg->ellip[i].ctm[3] &
+				     RKISP1_CIF_ISP_AWB64_ELLIP_A2_A4_MASK);
+	}
+}
+
+static void
+rkisp1_awb64_meas_enable_v10(struct rkisp1_params *params,
+			     const struct rkisp1_cif_isp_awb64_meas_config *arg,
+			     bool en)
+{
+	u32 reg_val =
+		rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_AWB64_MEAS_MODE);
+
+	if (en) {
+		if (arg->enable_median_filter)
+			reg_val |= RKISP1_CIF_ISP_AWB64_PRE_FILTER_EN;
+
+		if (arg->chrom_switch)
+			reg_val |= RKISP1_CIF_ISP_AWB64_CHROM_SWITCH;
+
+		reg_val |= (arg->ellip_unite & RKISP1_CIF_ISP_AWB64_UNITE_MASK)
+			   << RKISP1_CIF_ISP_AWB64_UNITE_SHIFT;
+
+		reg_val |= RKISP1_CIF_ISP_AWB64_MEAS_EN |
+			   RKISP1_CIF_ISP_AWB64_IRQ_EN;
+	} else {
+		reg_val &= ~RKISP1_CIF_ISP_AWB64_MEAS_EN;
+	}
+
+	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_MEAS_MODE,
+		     reg_val);
+}
+
 static void
 rkisp1_awb_gain_config_v10(struct rkisp1_params *params,
 			   const struct rkisp1_cif_isp_awb_gain_config *arg)
@@ -2005,6 +2101,25 @@ static void rkisp1_ext_params_compand_compress(struct rkisp1_params *params,
 				      RKISP1_CIF_ISP_COMPAND_CTRL_COMPRESS_ENABLE);
 }
 
+static void rkisp1_ext_params_awb64(struct rkisp1_params *params,
+				    const union rkisp1_ext_params_config *block)
+{
+	const struct rkisp1_ext_params_awb64_meas_config *awb64 = &block->awb64;
+
+	if (awb64->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
+		params->ops->awb64_meas_enable(params, &awb64->config,
+					     false);
+		return;
+	}
+
+	params->ops->awb64_meas_config(params, &awb64->config);
+
+	if ((awb64->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE) &&
+	    !(params->enabled_blocks & BIT(awb64->header.type)))
+		params->ops->awb64_meas_enable(params, &awb64->config,
+					     true);
+}
+
 typedef void (*rkisp1_block_handler)(struct rkisp1_params *params,
 			     const union rkisp1_ext_params_config *config);
 
@@ -2118,6 +2233,12 @@ static const struct rkisp1_ext_params_handler {
 		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 		.features	= RKISP1_FEATURE_COMPAND,
 	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB64_MEAS] = {
+		.size		= sizeof(struct rkisp1_ext_params_awb64_meas_config),
+		.handler	= rkisp1_ext_params_awb64,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+		.features	= RKISP1_FEATURE_AWB64,
+	},
 };
 
 static void rkisp1_ext_params_config(struct rkisp1_params *params,
@@ -2381,6 +2502,8 @@ static const struct rkisp1_params_ops rkisp1_v10_params_ops = {
 	.goc_config = rkisp1_goc_config_v10,
 	.awb_meas_config = rkisp1_awb_meas_config_v10,
 	.awb_meas_enable = rkisp1_awb_meas_enable_v10,
+	.awb64_meas_config = rkisp1_awb64_meas_config_v10,
+	.awb64_meas_enable = rkisp1_awb64_meas_enable_v10,
 	.awb_gain_config = rkisp1_awb_gain_config_v10,
 	.aec_config = rkisp1_aec_config_v10,
 	.hst_config = rkisp1_hst_config_v10,
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
index bf0260600a1923eebde6b5fe233daf7d427362dd..bc292a5738198fff28715b2a7e55e26e8fbddc64 100644
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
@@ -1379,6 +1397,29 @@
 #define RKISP1_CIF_ISP_WDR_TONECURVE_YM_31_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x0000012c)
 #define RKISP1_CIF_ISP_WDR_TONECURVE_YM_32_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x00000130)
 
+#define RKISP1_CIF_ISP_AWB64_BASE		0x00002c00
+#define RKISP1_CIF_ISP_AWB64_MEAS_MODE		(RKISP1_CIF_ISP_AWB64_BASE + 0x00000000)
+#define RKISP1_CIF_ISP_AWB64_H_OFFS		(RKISP1_CIF_ISP_AWB64_BASE + 0x00000000)
+#define RKISP1_CIF_ISP_AWB64_V_OFFS		(RKISP1_CIF_ISP_AWB64_BASE + 0x00000000)
+#define RKISP1_CIF_ISP_AWB64_H_SIZE		(RKISP1_CIF_ISP_AWB64_BASE + 0x00000000)
+#define RKISP1_CIF_ISP_AWB64_V_SIZE		(RKISP1_CIF_ISP_AWB64_BASE + 0x00000000)
+#define RKISP1_CIF_ISP_AWB64_R_MIN_MAX		(RKISP1_CIF_ISP_AWB64_BASE + 0x00000000)
+#define RKISP1_CIF_ISP_AWB64_G_MIN_MAX		(RKISP1_CIF_ISP_AWB64_BASE + 0x00000000)
+#define RKISP1_CIF_ISP_AWB64_B_MIN_MAX		(RKISP1_CIF_ISP_AWB64_BASE + 0x00000000)
+#define RKISP1_CIF_ISP_AWB64_MIN_DIVIDER	(RKISP1_CIF_ISP_AWB64_BASE + 0x00000000)
+#define RKISP1_CIF_ISP_AWB64_CC_COEFF(n)	(RKISP1_CIF_ISP_AWB64_BASE + 0x00000000 + (n) * 4)
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
index d5fdb8f82dc78b0143f71d76f36817db389921b7..a5b82963e74dac2340a1b3b07cd8d99dd23b5d5d 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
@@ -172,6 +172,31 @@ rkisp1_stats_init_vb2_queue(struct vb2_queue *q, struct rkisp1_stats *stats)
 	return vb2_queue_init(q);
 }
 
+static void rkisp1_stats_get_awb64_meas_v10(struct rkisp1_stats *stats,
+					    struct rkisp1_stat_buffer *pbuf)
+{
+	/* Protect against concurrent access from ISR? */
+	struct rkisp1_device *rkisp1 = stats->rkisp1;
+	unsigned int i;
+	u32 white_cnt;
+
+	pbuf->meas_type |= RKISP1_CIF_ISP_STAT_AWB64;
+
+	for (i = 0; i < RKISP1_CIF_ISP_AWB64_MAX_ELLIPSE; i++) {
+		white_cnt = rkisp1_read(rkisp1,
+					RKISP1_CIF_ISP_AWB64_WHITE_CNT(i));
+		pbuf->params.awb64.count[i].cnt =
+			RKISP1_CIF_ISP_AWB64_GET_PIXEL_CNT(white_cnt);
+
+		pbuf->params.awb64.count[i].accu_cr_or_r =
+			rkisp1_read(rkisp1, RKISP1_CIF_ISP_AWB64_R_ACCU(i));
+		pbuf->params.awb64.count[i].accu_y_or_g =
+			rkisp1_read(rkisp1, RKISP1_CIF_ISP_AWB64_G_ACCU(i));
+		pbuf->params.awb64.count[i].accu_cb_or_b =
+			rkisp1_read(rkisp1, RKISP1_CIF_ISP_AWB64_B_ACCU(i));
+	}
+}
+
 static void rkisp1_stats_get_awb_meas_v10(struct rkisp1_stats *stats,
 					  struct rkisp1_stat_buffer *pbuf)
 {
@@ -325,6 +350,7 @@ static void rkisp1_stats_get_bls_meas(struct rkisp1_stats *stats,
 
 static const struct rkisp1_stats_ops rkisp1_v10_stats_ops = {
 	.get_awb_meas = rkisp1_stats_get_awb_meas_v10,
+	.get_awb64_meas = rkisp1_stats_get_awb64_meas_v10,
 	.get_aec_meas = rkisp1_stats_get_aec_meas_v10,
 	.get_hst_meas = rkisp1_stats_get_hst_meas_v10,
 };
@@ -355,8 +381,11 @@ rkisp1_stats_send_measurement(struct rkisp1_stats *stats, u32 isp_ris)
 
 	cur_stat_buf = (struct rkisp1_stat_buffer *)
 			vb2_plane_vaddr(&cur_buf->vb.vb2_buf, 0);
-	if (isp_ris & RKISP1_CIF_ISP_AWB_DONE)
+	if (isp_ris & RKISP1_CIF_ISP_AWB_DONE) {
 		stats->ops->get_awb_meas(stats, cur_stat_buf);
+		if (stats->ops->get_awb64_meas)
+			stats->ops->get_awb64_meas(stats, cur_stat_buf);
+	}
 
 	if (isp_ris & RKISP1_CIF_ISP_AFM_FIN)
 		rkisp1_stats_get_afc_meas(stats, cur_stat_buf);
diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
index 430daceafac7056951be968f3b4d9cd50eb04e71..22243ab8e079925d58f739b3078efed04fd8acda 100644
--- a/include/uapi/linux/rkisp1-config.h
+++ b/include/uapi/linux/rkisp1-config.h
@@ -45,6 +45,8 @@
 #define RKISP1_CIF_ISP_MODULE_DPF		(1U << 16)
 /* Denoise Pre-Filter Strength */
 #define RKISP1_CIF_ISP_MODULE_DPF_STRENGTH	(1U << 17)
+/* Auto White Balancing 64 statistics configuration */
+#define RKISP1_CIF_ISP_MODULE_AWB64		(1U << 18)
 
 #define RKISP1_CIF_ISP_CTK_COEFF_MAX            0x100
 #define RKISP1_CIF_ISP_CTK_OFFSET_MAX           0x800
@@ -88,6 +90,11 @@
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
@@ -176,6 +183,7 @@
 #define RKISP1_CIF_ISP_STAT_AUTOEXP       (1U << 1)
 #define RKISP1_CIF_ISP_STAT_AFM           (1U << 2)
 #define RKISP1_CIF_ISP_STAT_HIST          (1U << 3)
+#define RKISP1_CIF_ISP_STAT_AWB64         (1U << 4)
 
 /**
  * enum rkisp1_cif_isp_version - ISP variants
@@ -519,6 +527,55 @@ struct rkisp1_cif_isp_awb_gain_config {
 	__u16 gain_green_b;
 };
 
+/**
+ * struct rkisp1_cif_isp_awb64_ellipse - Ellipse configuration for AWB64 measurement
+ *
+ * @rmax: Points within rmax (24 bits) distance from center are considered white point
+ * @cen_x: X co-ordinate of the center of ellipse (10 bits)
+ * @cen_y: Y co-ordinate of the center of ellipse (10 bits)
+ * @ctm: Co-ordinate transformation matrix
+ *       ctm[0] and ctm[2] are 12 bits, ctm[1] and ctm[3] are 9 bits
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
+ * @cc_coeff: Colorspace matrix (all coefficients are 11 bits)
+ * @min_div: Minimum divider, if input is less than this don't do division (10 bits)
+ * @max_r: Only pixels with R < max_r contribute to measurement
+ * @min_r: Only pixels with R > min_r contribute to measurement
+ * @max_g: Only pixels with G < max_g contribute to measurement
+ * @min_g: Only pixels with G > min_g contribute to measurement
+ * @max_b: Only pixels with B < max_b contribute to measurement
+ * @min_b: Only pixels with B > min_b contribute to measurement
+ * @ellip_unite: Bitmask to select which regions should be combined for measurement
+ *               bits 0:2 to combine ellipse 0 with ellipse 1,2,3
+ *               bits 3:5 to combine ellipse 4 with ellipse 5,6,7
+ */
+struct rkisp1_cif_isp_awb64_meas_config {
+	struct rkisp1_cif_isp_window awb_wnd;
+	struct rkisp1_cif_isp_awb64_ellip ellip[RKISP1_CIF_ISP_AWB64_MAX_ELLIPSE];
+	__u16 cc_coeff[3][3];
+	__u16 min_div;
+	__u8 max_r;
+	__u8 min_r;
+	__u8 max_g;
+	__u8 min_g;
+	__u8 max_b;
+	__u8 min_b;
+	__u8 enable_median_filter;
+	__u8 ellip_unite;
+	__u8 chrom_switch;
+};
+
 /**
  * struct rkisp1_cif_isp_flt_config - Configuration used by ISP filtering
  *
@@ -1006,6 +1063,34 @@ struct rkisp1_cif_isp_hist_stat {
 	__u32 hist_bins[RKISP1_CIF_ISP_HIST_BIN_N_MAX];
 };
 
+/**
+ * struct rkisp1_cif_isp_awb64_meas - AWB64 measured values
+ *
+ * @cnt: White pixel count, number of "white pixels" found during last
+ *	 measurement
+ * @accu_y_or_g: Total value of Y within elliptical region,
+ *		 Green if RGB is selected.
+ * @accu_cb_or_b: Total value of Cb within elliptical region,
+ *		  Blue if RGB is selected.
+ * @accu_cr_or_r: Total value of Cr within elliptical region,
+ *		  Red if RGB is selected.
+ */
+struct rkisp1_cif_isp_awb64_meas {
+	__u32 cnt;
+	__u32 accu_y_or_g;
+	__u32 accu_cb_or_b;
+	__u32 accu_cr_or_r;
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
@@ -1019,6 +1104,7 @@ struct rkisp1_cif_isp_stat {
 	struct rkisp1_cif_isp_ae_stat ae;
 	struct rkisp1_cif_isp_af_stat af;
 	struct rkisp1_cif_isp_hist_stat hist;
+	struct rkisp1_cif_isp_awb64_stat awb64;
 };
 
 /**
@@ -1059,6 +1145,7 @@ struct rkisp1_stat_buffer {
  * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS: BLS in the compand block
  * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND: Companding expand curve
  * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS: Companding compress curve
+ * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB64_MEAS: Auto white balance 64 statistics
  */
 enum rkisp1_ext_params_block_type {
 	RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS,
@@ -1081,6 +1168,7 @@ enum rkisp1_ext_params_block_type {
 	RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS,
 	RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND,
 	RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS,
+	RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB64_MEAS,
 };
 
 #define RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE	(1U << 0)
@@ -1376,6 +1464,23 @@ struct rkisp1_ext_params_awb_meas_config {
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

---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241230-awb64-79270098e15e

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


