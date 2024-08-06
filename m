Return-Path: <linux-media+bounces-15860-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7009493D0
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 16:53:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2AF81F275A3
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 14:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580FA20FABA;
	Tue,  6 Aug 2024 14:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GwzRQtgH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5798210185
	for <linux-media@vger.kernel.org>; Tue,  6 Aug 2024 14:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722955911; cv=none; b=mIu19ov1Fbgfmr9mIlhJlT1KCcFERH5VV6VdBBYDNb4L4KTrMIOEYEUpBqiAQcbELhd4l6ldcbrIVA0kJk1M3GmWOLhxOwAUIeenAVVckFtFHvGe9WQb/mean6mWaYzjvQ5TNUiOW5K+zVPKo+psOjwQ2l0sreSm35oswydx3Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722955911; c=relaxed/simple;
	bh=FZAEsdRU9Ce2PQ2utagAR+oyKJnwt7ukP+K+rUzW6dg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EFuUS/7quaXE/UMNk3/iqb5qabPLoeNqr3N5pGonIbFS5aMvf3mqWlLLZEaHo3+3OPzOehlsrVz2C7/sQe1+0QRiZVhDFMPr2JvlGLJG4EukGMk2p/3PaHh1uFDIIGOl22ZVtwyz/AM7avctisTEQdqS0yEzR1ba/YpAakp8Iag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GwzRQtgH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-91-24-0.net.vodafone.it [5.91.24.0])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3FCA4C8E;
	Tue,  6 Aug 2024 16:50:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722955852;
	bh=FZAEsdRU9Ce2PQ2utagAR+oyKJnwt7ukP+K+rUzW6dg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GwzRQtgHkRwqN/boVW1e4HOD5UQ0slANPD/revWuszyC0cnoTq/GmnzzQF4NZCmtZ
	 J8uj96d8fS+MR04q8rq1b9LmRH0SZm2825vkgeDA7ZTNVnodqZjJoDOin4WZteH0eT
	 TPjWjRVmSf5wBXR8FobGKDuLScPXItWrSnZ8E5Kw=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v8 12/12] media: rkisp1: Add support for the companding block
Date: Tue,  6 Aug 2024 16:51:08 +0200
Message-ID: <20240806145110.918843-13-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240806145110.918843-1-jacopo.mondi@ideasonboard.com>
References: <20240806145110.918843-1-jacopo.mondi@ideasonboard.com>
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
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Tested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 168 ++++++++++++++++++
 include/uapi/linux/rkisp1-config.h            |  89 +++++++++-
 2 files changed, 256 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index 7b39dcefe094..663c812764fc 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
  */
 
+#include <linux/math.h>
 #include <linux/string.h>
 
 #include <media/v4l2-common.h>
@@ -57,6 +58,8 @@ union rkisp1_ext_params_config {
 	struct rkisp1_ext_params_hst_config hst;
 	struct rkisp1_ext_params_aec_config aec;
 	struct rkisp1_ext_params_afc_config afc;
+	struct rkisp1_ext_params_compand_bls_config compand_bls;
+	struct rkisp1_ext_params_compand_curve_config compand_curve;
 };
 
 enum rkisp1_params_formats {
@@ -1258,6 +1261,93 @@ rkisp1_dpf_strength_config(struct rkisp1_params *params,
 	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPF_STRENGTH_R, arg->r);
 }
 
+static void rkisp1_compand_write_px_curve(struct rkisp1_params *params,
+					  unsigned int addr, const u8 *curve)
+{
+	const unsigned int points_per_reg = 6;
+	const unsigned int num_regs =
+		DIV_ROUND_UP(RKISP1_CIF_ISP_COMPAND_NUM_POINTS,
+			     points_per_reg);
+
+	/*
+	 * The compand curve is specified as a piecewise linear function with
+	 * 64 points. X coordinates are stored as a log2 of the displacement
+	 * from the previous point, in 5 bits, with 6 values per register. The
+	 * last register stores 4 values.
+	 */
+	for (unsigned int reg = 0; reg < num_regs; ++reg) {
+		unsigned int num_points =
+			min(RKISP1_CIF_ISP_COMPAND_NUM_POINTS -
+			    reg * points_per_reg, points_per_reg);
+		u32 val = 0;
+
+		for (unsigned int i = 0; i < num_points; i++)
+			val |= (*curve++ & 0x1f) << (i * 5);
+
+		rkisp1_write(params->rkisp1, addr, val);
+		addr += 4;
+	}
+}
+
+static void
+rkisp1_compand_write_curve_mem(struct rkisp1_params *params,
+			       unsigned int reg_addr, unsigned int reg_data,
+			       const u32 curve[RKISP1_CIF_ISP_COMPAND_NUM_POINTS])
+{
+	for (unsigned int i = 0; i < RKISP1_CIF_ISP_COMPAND_NUM_POINTS; i++) {
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
+				       arg->y);
+	rkisp1_compand_write_curve_mem(params, RKISP1_CIF_ISP_COMPAND_EXPAND_X_ADDR,
+				       RKISP1_CIF_ISP_COMPAND_EXPAND_X_WRITE_DATA,
+				       arg->x);
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
+				       arg->y);
+	rkisp1_compand_write_curve_mem(params, RKISP1_CIF_ISP_COMPAND_COMPRESS_X_ADDR,
+				       RKISP1_CIF_ISP_COMPAND_COMPRESS_X_WRITE_DATA,
+				       arg->x);
+}
+
 static void
 rkisp1_isp_isr_other_config(struct rkisp1_params *params,
 			    const struct rkisp1_params_cfg *new_params)
@@ -1855,6 +1945,66 @@ rkisp1_ext_params_afcm(struct rkisp1_params *params,
 				      RKISP1_CIF_ISP_AFM_ENA);
 }
 
+static void rkisp1_ext_params_compand_bls(struct rkisp1_params *params,
+					  const union rkisp1_ext_params_config *block)
+{
+	const struct rkisp1_ext_params_compand_bls_config *bls =
+		&block->compand_bls;
+
+	if (bls->header.flags & RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_COMPAND_CTRL,
+					RKISP1_CIF_ISP_COMPAND_CTRL_BLS_ENABLE);
+		return;
+	}
+
+	rkisp1_compand_bls_config(params, &bls->config);
+
+	if ((bls->header.flags & RKISP1_EXT_PARAMS_BLOCK_ENABLE) &&
+	    !(params->enabled_blocks & BIT(bls->header.type)))
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
+	if (curve->header.flags & RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_COMPAND_CTRL,
+					RKISP1_CIF_ISP_COMPAND_CTRL_EXPAND_ENABLE);
+		return;
+	}
+
+	rkisp1_compand_expand_config(params, &curve->config);
+
+	if ((curve->header.flags & RKISP1_EXT_PARAMS_BLOCK_ENABLE) &&
+	    !(params->enabled_blocks & BIT(curve->header.type)))
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
+	if (curve->header.flags & RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
+		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_COMPAND_CTRL,
+					RKISP1_CIF_ISP_COMPAND_CTRL_COMPRESS_ENABLE);
+		return;
+	}
+
+	rkisp1_compand_compress_config(params, &curve->config);
+
+	if ((curve->header.flags & RKISP1_EXT_PARAMS_BLOCK_ENABLE) &&
+	    !(params->enabled_blocks & BIT(curve->header.type)))
+		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_COMPAND_CTRL,
+				      RKISP1_CIF_ISP_COMPAND_CTRL_COMPRESS_ENABLE);
+}
+
 typedef void (*rkisp1_block_handler)(struct rkisp1_params *params,
 			     const union rkisp1_ext_params_config *config);
 
@@ -1950,6 +2100,24 @@ static const struct rkisp1_ext_params_handler {
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
index 552da5fd9f95..8d955924f439 100644
--- a/include/uapi/linux/rkisp1-config.h
+++ b/include/uapi/linux/rkisp1-config.h
@@ -164,6 +164,11 @@
 #define RKISP1_CIF_ISP_DPF_MAX_NLF_COEFFS      17
 #define RKISP1_CIF_ISP_DPF_MAX_SPATIAL_COEFFS  6
 
+/*
+ * Compand
+ */
+#define RKISP1_CIF_ISP_COMPAND_NUM_POINTS	64
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
+ *     unknown due to do a lack of hardware documentation, but these are left
+ *     here for future compatibility purposes.
+ * @y: Compand curve y-values
+ */
+struct rkisp1_cif_isp_compand_curve_config {
+	__u8 px[RKISP1_CIF_ISP_COMPAND_NUM_POINTS];
+	__u32 x[RKISP1_CIF_ISP_COMPAND_NUM_POINTS];
+	__u32 y[RKISP1_CIF_ISP_COMPAND_NUM_POINTS];
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
+ * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS: Companding compress curve
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
@@ -1389,6 +1433,46 @@ struct rkisp1_ext_params_afc_config {
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
+ * :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND` or
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
+/*
+ * The rkisp1_ext_params_compand_curve_config structure is counted twice as it
+ * is used for both the COMPAND_EXPAND and COMPAND_COMPRESS block types.
+ */
 #define RKISP1_EXT_PARAMS_MAX_SIZE					\
 	(sizeof(struct rkisp1_ext_params_bls_config)			+\
 	sizeof(struct rkisp1_ext_params_dpcc_config)			+\
@@ -1406,7 +1490,10 @@ struct rkisp1_ext_params_afc_config {
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
2.45.2


