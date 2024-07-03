Return-Path: <linux-media+bounces-14616-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 456D6926B89
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 00:26:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4FF81F2295D
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 22:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42329194133;
	Wed,  3 Jul 2024 22:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OcTSAl65"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49FE18E746
	for <linux-media@vger.kernel.org>; Wed,  3 Jul 2024 22:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720045565; cv=none; b=b9LubvUdMFo++IbVnYIL3cvG2M1taMoF1J2mcRO8xhr+cmClCO9SrRFLcSPMVZDHvZWmsYKrNEnwf3mxqHHp977nuQZLBmuy7XnvFHtZuE7GXXAZMzo3PpZ6+F7IZbgw/RzBWWwmTBK8UsLMDEV7ssP54vVRBluKIhy4qkGPft0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720045565; c=relaxed/simple;
	bh=jvvUfwkGQQb5lb9wjVuX6Fpl5C1eqFkIxbDxJem0UjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HnekpqPW/3PjTPFh2hEANNvkzQKXfFmdtaW14Y7b1sTkN+moY3RSVTJf8C24apZ+HZcq24Djgd5UcohUs+FXEB+X+U8HGTU2xVT7YqL2jfeJRgh+WGzAru3TtF+w8OJLIx50EMP/SfICz6h7AaADx9xhQ6WKuPQnU8+I/Az7340=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OcTSAl65; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BDA6AD8;
	Thu,  4 Jul 2024 00:25:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720045531;
	bh=jvvUfwkGQQb5lb9wjVuX6Fpl5C1eqFkIxbDxJem0UjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OcTSAl65QiYrFs4bGaZI9Ms3axvJwDRnC+bAF491vVp8r5HNlfzXPM3DzLTBOO5Hk
	 N5rNoNnYzec6hKPb3v39ZnV/yyen1EMP8Ha4hjuwi3BLYHyMeM909ASq6HLdDCge7l
	 JE42NI7IT5H2hssEEyQw+BwuPry5CwGsR+3Wh9w8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v1 5/5] media: rkisp1: Add support for the companding block
Date: Thu,  4 Jul 2024 01:25:33 +0300
Message-ID: <20240703222533.1662-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240703222533.1662-1-laurent.pinchart@ideasonboard.com>
References: <20240703222533.1662-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Elder <paul.elder@ideasonboard.com>

Add support to the rkisp1 driver for the companding block that exists on
the i.MX8MP version of the ISP. This requires usage of the new
extensible parameters format, and showcases how the format allows for
extensions without breaking backward compatibility.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v0:

- Drop RKISP1_EXT_PARAM_BUFFER_V2
- Use common structure for compression and expansion curves
- Rename config fields in rkisp1_ext_params_*_config to just config
- Mention block type in structures documentation
- Constify arguments
- Replace __uxx types with uxx
- Use rkisp1_bls_swap_regs() helper in rkisp1_compand_bls_config()
- Use generic feature handling mechanism
---
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 166 ++++++++++++++++++
 include/uapi/linux/rkisp1-config.h            |  85 ++++++++-
 2 files changed, 250 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index bac9d4972493..5865d53be9c8 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -57,6 +57,8 @@ union rkisp1_ext_params_config {
 	struct rkisp1_ext_params_hst_config hst;
 	struct rkisp1_ext_params_aec_config aec;
 	struct rkisp1_ext_params_afc_config afc;
+	struct rkisp1_ext_params_compand_bls_config compand_bls;
+	struct rkisp1_ext_params_compand_curve_config compand_curve;
 };
 
 enum rkisp1_params_formats {
@@ -1258,6 +1260,92 @@ rkisp1_dpf_strength_config(struct rkisp1_params *params,
 	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPF_STRENGTH_R, arg->r);
 }
 
+static void rkisp1_compand_write_px_curve(struct rkisp1_params *params,
+					  unsigned int addr, const u8 *px_curve)
+{
+	size_t i, j;
+	u32 val;
+
+	/*
+	 * The compand curve is specified as a piecewise linear function with
+	 * 64 points. X coordinates are stored as a log2 of the displacement
+	 * from the previous point, in 5 bits, with 6 values per register. The
+	 * last register stores 4 values.
+	 */
+	for (i = 0; i < 10; i++) {
+		val = 0;
+		for (j = 0; j < 6; j++)
+			val |= ((px_curve[i * 6 + j] & 0x1f) << (j * 5));
+		rkisp1_write(params->rkisp1, addr + (i * 4), val);
+	}
+
+	val = 0;
+	for (j = 0; j < 4; j++)
+		val |= ((px_curve[60 + j] & 0x1f) << (j * 5));
+	rkisp1_write(params->rkisp1, addr + (i * 4), val);
+}
+
+static void
+rkisp1_compand_write_curve_mem(struct rkisp1_params *params,
+			       unsigned int reg_addr, unsigned int reg_data,
+			       size_t num_samples, const u32 *curve)
+{
+	size_t i;
+
+	for (i = 0; i < num_samples; i++) {
+		rkisp1_write(params->rkisp1, reg_addr, i);
+		rkisp1_write(params->rkisp1, reg_data, curve[i]);
+	}
+}
+
+static void
+rkisp1_compand_bls_config(struct rkisp1_params *params,
+			  const struct rkisp1_cif_isp_compand_bls_config *arg)
+{
+	static const u32 regs[] = {
+		RKISP1_CIF_ISP_COMPAND_BLS_A_FIXED,
+		RKISP1_CIF_ISP_COMPAND_BLS_B_FIXED,
+		RKISP1_CIF_ISP_COMPAND_BLS_C_FIXED,
+		RKISP1_CIF_ISP_COMPAND_BLS_D_FIXED,
+	};
+	u32 swapped[4];
+
+	rkisp1_bls_swap_regs(params->raw_type, regs, swapped);
+
+	rkisp1_write(params->rkisp1, swapped[0], arg->r);
+	rkisp1_write(params->rkisp1, swapped[1], arg->gr);
+	rkisp1_write(params->rkisp1, swapped[2], arg->gb);
+	rkisp1_write(params->rkisp1, swapped[3], arg->b);
+}
+
+static void
+rkisp1_compand_expand_config(struct rkisp1_params *params,
+			     const struct rkisp1_cif_isp_compand_curve_config *arg)
+{
+	rkisp1_compand_write_px_curve(params, RKISP1_CIF_ISP_COMPAND_EXPAND_PX_N(0),
+				      arg->px);
+	rkisp1_compand_write_curve_mem(params, RKISP1_CIF_ISP_COMPAND_EXPAND_Y_ADDR,
+				       RKISP1_CIF_ISP_COMPAND_EXPAND_Y_WRITE_DATA,
+				       ARRAY_SIZE(arg->y), arg->y);
+	rkisp1_compand_write_curve_mem(params, RKISP1_CIF_ISP_COMPAND_EXPAND_X_ADDR,
+				       RKISP1_CIF_ISP_COMPAND_EXPAND_X_WRITE_DATA,
+				       ARRAY_SIZE(arg->x), arg->x);
+}
+
+static void
+rkisp1_compand_compress_config(struct rkisp1_params *params,
+			       const struct rkisp1_cif_isp_compand_curve_config *arg)
+{
+	rkisp1_compand_write_px_curve(params, RKISP1_CIF_ISP_COMPAND_COMPRESS_PX_N(0),
+				      arg->px);
+	rkisp1_compand_write_curve_mem(params, RKISP1_CIF_ISP_COMPAND_COMPRESS_Y_ADDR,
+				       RKISP1_CIF_ISP_COMPAND_COMPRESS_Y_WRITE_DATA,
+				       ARRAY_SIZE(arg->y), arg->y);
+	rkisp1_compand_write_curve_mem(params, RKISP1_CIF_ISP_COMPAND_COMPRESS_X_ADDR,
+				       RKISP1_CIF_ISP_COMPAND_COMPRESS_X_WRITE_DATA,
+				       ARRAY_SIZE(arg->x), arg->x);
+}
+
 static void
 rkisp1_isp_isr_other_config(struct rkisp1_params *params,
 			    const struct rkisp1_params_cfg *new_params)
@@ -1844,6 +1932,66 @@ rkisp1_ext_params_afcm(struct rkisp1_params *params,
 				      RKISP1_CIF_ISP_AFM_ENA);
 }
 
+static void rkisp1_ext_params_compand_bls(struct rkisp1_params *params,
+					  const union rkisp1_ext_params_config *block)
+{
+	const struct rkisp1_ext_params_compand_bls_config *bls =
+		&block->compand_bls;
+
+	if (bls->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_COMPAND_CTRL,
+					RKISP1_CIF_ISP_COMPAND_CTRL_BLS_ENABLE);
+		return;
+	}
+
+	rkisp1_compand_bls_config(params, &bls->config);
+
+	if (!(params->enabled_blocks &
+	      BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS)))
+		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_COMPAND_CTRL,
+				      RKISP1_CIF_ISP_COMPAND_CTRL_BLS_ENABLE);
+}
+
+static void rkisp1_ext_params_compand_expand(struct rkisp1_params *params,
+					     const union rkisp1_ext_params_config *block)
+{
+	const struct rkisp1_ext_params_compand_curve_config *curve =
+		&block->compand_curve;
+
+	if (curve->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_COMPAND_CTRL,
+					RKISP1_CIF_ISP_COMPAND_CTRL_EXPAND_ENABLE);
+		return;
+	}
+
+	rkisp1_compand_expand_config(params, &curve->config);
+
+	if (!(params->enabled_blocks &
+	      BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND)))
+		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_COMPAND_CTRL,
+				      RKISP1_CIF_ISP_COMPAND_CTRL_EXPAND_ENABLE);
+}
+
+static void rkisp1_ext_params_compand_compress(struct rkisp1_params *params,
+					       const union rkisp1_ext_params_config *block)
+{
+	const struct rkisp1_ext_params_compand_curve_config *curve =
+		&block->compand_curve;
+
+	if (curve->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_COMPAND_CTRL,
+					RKISP1_CIF_ISP_COMPAND_CTRL_COMPRESS_ENABLE);
+		return;
+	}
+
+	rkisp1_compand_compress_config(params, &curve->config);
+
+	if (!(params->enabled_blocks &
+	      BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS)))
+		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_COMPAND_CTRL,
+				      RKISP1_CIF_ISP_COMPAND_CTRL_COMPRESS_ENABLE);
+}
+
 typedef void (*rkisp1_block_handler)(struct rkisp1_params *params,
 			     const union rkisp1_ext_params_config *config);
 
@@ -1939,6 +2087,24 @@ static const struct rkisp1_ext_params_handler {
 		.handler	= rkisp1_ext_params_afcm,
 		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS] = {
+		.size		= sizeof(struct rkisp1_ext_params_compand_bls_config),
+		.handler	= rkisp1_ext_params_compand_bls,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+		.features	= RKISP1_FEATURE_COMPAND,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND] = {
+		.size		= sizeof(struct rkisp1_ext_params_compand_curve_config),
+		.handler	= rkisp1_ext_params_compand_expand,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+		.features	= RKISP1_FEATURE_COMPAND,
+	},
+	[RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS] = {
+		.size		= sizeof(struct rkisp1_ext_params_compand_curve_config),
+		.handler	= rkisp1_ext_params_compand_compress,
+		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+		.features	= RKISP1_FEATURE_COMPAND,
+	},
 };
 
 static void rkisp1_ext_params_config(struct rkisp1_params *params,
diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
index 00b09c92cca7..dd962df53af5 100644
--- a/include/uapi/linux/rkisp1-config.h
+++ b/include/uapi/linux/rkisp1-config.h
@@ -164,6 +164,11 @@
 #define RKISP1_CIF_ISP_DPF_MAX_NLF_COEFFS      17
 #define RKISP1_CIF_ISP_DPF_MAX_SPATIAL_COEFFS  6
 
+/*
+ * Compand
+ */
+#define RKISP1_CIF_ISP_COMPAND_MAX_SAMPLES	64
+
 /*
  * Measurement types
  */
@@ -851,6 +856,39 @@ struct rkisp1_params_cfg {
 	struct rkisp1_cif_isp_isp_other_cfg others;
 };
 
+/**
+ * struct rkisp1_cif_isp_compand_bls_config - Rockchip ISP1 Companding parameters (BLS)
+ * @r: Fixed subtraction value for Bayer pattern R
+ * @gr: Fixed subtraction value for Bayer pattern Gr
+ * @gb: Fixed subtraction value for Bayer pattern Gb
+ * @b: Fixed subtraction value for Bayer pattern B
+ *
+ * The values will be subtracted from the sensor values. Note that unlike the
+ * dedicated BLS block, the BLS values in the compander are 20-bit unsigned.
+ */
+struct rkisp1_cif_isp_compand_bls_config {
+	__u32 r;
+	__u32 gr;
+	__u32 gb;
+	__u32 b;
+};
+
+/**
+ * struct rkisp1_cif_isp_compand_curve_config - Rockchip ISP1 Companding
+ * parameters (expand and compression curves)
+ * @px: Compand curve x-values. Each value stores the distance from the
+ *      previous x-value, expressed as log2 of the distance on 5 bits.
+ * @x: Compand curve x-values. The functionality of these parameters are
+ *     unknown to do a lack of hardware documentation, but these are left here
+ *     for future compatibility purposes.
+ * @y: Compand curve y-values
+ */
+struct rkisp1_cif_isp_compand_curve_config {
+	__u8 px[RKISP1_CIF_ISP_COMPAND_MAX_SAMPLES];
+	__u32 x[RKISP1_CIF_ISP_COMPAND_MAX_SAMPLES];
+	__u32 y[RKISP1_CIF_ISP_COMPAND_MAX_SAMPLES];
+};
+
 /*---------- PART2: Measurement Statistics ------------*/
 
 /**
@@ -1018,6 +1056,9 @@ struct rkisp1_stat_buffer {
  * @RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS: Histogram statistics
  * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS: Auto exposure statistics
  * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS: Auto-focus statistics
+ * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS: BLS in the compand block
+ * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND: Companding expand curve
+ * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS: Compandding compress curve
  */
 enum rkisp1_ext_params_block_type {
 	RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS,
@@ -1037,6 +1078,9 @@ enum rkisp1_ext_params_block_type {
 	RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS,
 	RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS,
 	RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS,
+	RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS,
+	RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND,
+	RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS,
 };
 
 /**
@@ -1384,6 +1428,42 @@ struct rkisp1_ext_params_afc_config {
 	struct rkisp1_cif_isp_afc_config config;
 } __attribute__((aligned(8)));
 
+/**
+ * struct rkisp1_ext_params_compand_bls_config - RkISP1 extensible params
+ * Compand BLS config
+ *
+ * RkISP1 extensible parameters Companding configuration block (black level
+ * subtraction). Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS`.
+ *
+ * @header: The RkISP1 extensible parameters header, see
+ *	    :c:type:`rkisp1_ext_params_block_header`
+ * @config: Companding BLS configuration, see
+ *	    :c:type:`rkisp1_cif_isp_compand_bls_config`
+ */
+struct rkisp1_ext_params_compand_bls_config {
+	struct rkisp1_ext_params_block_header header;
+	struct rkisp1_cif_isp_compand_bls_config config;
+} __attribute__((aligned(8)));
+
+/**
+ * struct rkisp1_ext_params_compand_curve_config - RkISP1 extensible params
+ * Compand curve config
+ *
+ * RkISP1 extensible parameters Companding configuration block (expand and
+ * compression curves). Identified by
+ * :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND`or
+ * :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS`.
+ *
+ * @header: The RkISP1 extensible parameters header, see
+ *	    :c:type:`rkisp1_ext_params_block_header`
+ * @config: Companding curve configuration, see
+ *	    :c:type:`rkisp1_cif_isp_compand_curve_config`
+ */
+struct rkisp1_ext_params_compand_curve_config {
+	struct rkisp1_ext_params_block_header header;
+	struct rkisp1_cif_isp_compand_curve_config config;
+} __attribute__((aligned(8)));
+
 #define RKISP1_EXT_PARAMS_MAX_SIZE					\
 	(sizeof(struct rkisp1_ext_params_bls_config)			+\
 	sizeof(struct rkisp1_ext_params_dpcc_config)			+\
@@ -1401,7 +1481,10 @@ struct rkisp1_ext_params_afc_config {
 	sizeof(struct rkisp1_ext_params_awb_meas_config)		+\
 	sizeof(struct rkisp1_ext_params_hst_config)			+\
 	sizeof(struct rkisp1_ext_params_aec_config)			+\
-	sizeof(struct rkisp1_ext_params_afc_config))
+	sizeof(struct rkisp1_ext_params_afc_config)			+\
+	sizeof(struct rkisp1_ext_params_compand_bls_config)		+\
+	sizeof(struct rkisp1_ext_params_compand_curve_config)		+\
+	sizeof(struct rkisp1_ext_params_compand_curve_config))
 
 /**
  * enum rksip1_ext_param_buffer_version - RkISP1 extensible parameters version
-- 
Regards,

Laurent Pinchart


