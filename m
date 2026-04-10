Return-Path: <linux-media+bounces-58513-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AK6HOFzB2Gk4hwgAu9opvQ
	(envelope-from <linux-media+bounces-58513-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:22:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9DC3D4ABF
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B227F30AEEEA
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 09:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB913B8934;
	Fri, 10 Apr 2026 09:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b0n53X4/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44CF3B8949;
	Fri, 10 Apr 2026 09:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775812041; cv=none; b=QO0BDDzKwt0x1TXulNQO80zCAR3BTKbcpTmLptHKfwLCMuD7Ri94LIYUIvoGsR814wNFOePe3x6BbSb7e3rWTEqbd8aes+waN6+PlKbMXofRmShn7bGLGnTzxdwC1lifJ3wDtLsRkY8EDwNeK7jcpSv05Ij5zj1Q3vQza4YzBN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775812041; c=relaxed/simple;
	bh=i5FNALCYz5CRiBS4RgXgRUPXZ5II1iZ0njVtL70MlLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DUVo5jMnnJEtLdkzUo3sUEs8HDro2dzntfZKhFN/nyh1UtsBzprNTAvZSWJeUnEbavVij7rAJssPk/UinbRzuo5ZefXsG6djsd8RpsozSz0pzUX/a+/R+TYfb2pkC62rvIix0k8deiybr83yHujyOiS/wjjEfYAuXZIZJtXow/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b0n53X4/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [103.176.47.184])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 75E15838;
	Fri, 10 Apr 2026 11:05:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775811948;
	bh=i5FNALCYz5CRiBS4RgXgRUPXZ5II1iZ0njVtL70MlLE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=b0n53X4/iDTNUCeI9RqCtYShMGpm0XWVaTjMQtiLhh8Yd401lzJPp9YYvcKM2wByI
	 sC3/vCFN6VB95DRVPvoqKo7DUotCYvbm7VFlBx9m7Frtc5bXaLhx7bljascaVGKe1m
	 CRcuGUeH6x2NVgY143SDeds9ehzPIoOa/QYGiC3w=
From: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Date: Fri, 10 Apr 2026 14:35:43 +0530
Subject: [PATCH SQUASH v7 08/18] media: rppx1: exm: Expose coefficients,
 RGB mode and channel selection
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-rppx1-v7-8-43cfc6b44f1f@ideasonboard.com>
References: <20260410-rppx1-v7-0-43cfc6b44f1f@ideasonboard.com>
In-Reply-To: <20260410-rppx1-v7-0-43cfc6b44f1f@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Jai Luthra <jai.luthra+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6767;
 i=jai.luthra+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=i5FNALCYz5CRiBS4RgXgRUPXZ5II1iZ0njVtL70MlLE=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBp2L1++bilfMesMwZ3gxp2SfaoDfNSWBBXYxI69
 3ffwR7gCIOJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCadi9fgAKCRBD3pH5JJpx
 RXRBD/9s3vC1b7s7UjgQaVSOzyU/R3VDmShN+E36z0pz1wB8VdGT6JfiHS0o5q0efGhIHZO9lRN
 vqAgBFPgPnJZNunpo7decMHN0dIGRg/rPhJFTPL+6vImkzgDmlZ3sj2pDebCT0gs2aBggEcU4Qv
 +4nYze0kQO1nnPNs8QhlZIE5QTem98SkPf7jWcbwtBspgbaSP/h8am3ebz+V6/NlrUH00bh15/R
 DQr9G/ZqtNWunxm8zmmC5xkA+qE8ne5/+GHgc4hmdTyAae/0bV/28+H4bxErlN5vboYXL5qVhaA
 A8l68pWV7HQWiuUUlVxdN3xUS9YVUOVb0ttlyEf+NH21+QYEPDlcEqFEmgZRsmwocIklJGvnvjc
 0RgZO0SFgyU7/TuKWgp3RvN31xTaCbgzr8hb0+7cfqNgzlN++CnWlCCGUm8VY1K+Thg1bcO+hWE
 e/7p5JxuE75RUIsskxqXGyxtdO8BZD0rOXI9WKv7Z4r86sIZMp8KXLfK0pRZOMOBGR9ukPm4OCB
 NX3EEBzV5MWPY3MI+3m0yUgVMbZF7eS/0DvxwCzdPEROTm02zsGUux21LWtDyWURzN1fPkJQxOl
 8XYEs8SMpxpqs2XH2kU1exy77ntwqfsrFaN33wOn1S/7FfSLRoRdks4oKQ2JLV0QhYjN+bSSAis
 AEBEJRcGByuaxkg==
X-Developer-Key: i=jai.luthra+renesas@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58513-lists,linux-media=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[kernel.org,ragnatech.se,glider.be,gmail.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4D9DC3D4ABF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Compared to RkISP, Dreamchip's RPP-X1's exposure measurement module
supports following extra features:

1. Measurement modes (bayer or RGB domain)
2. Programmable coefficients for RGB or Bayer channels
3. Choice for sampling point (channel selector) in the pipeline

Expose these features in the uAPI and support them in the driver.

Note: This commit's changes will be squashed into the relevant uAPI and
driver commits. It is separate for now to ease review and highlight the
differences.

Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
---
 drivers/media/platform/dreamchip/rppx1/rppx1_exm.c | 47 ++++++++----------
 include/uapi/linux/media/dreamchip/rppx1-config.h  | 57 ++++++++++++++++++++--
 2 files changed, 73 insertions(+), 31 deletions(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_exm.c b/drivers/media/platform/dreamchip/rppx1/rppx1_exm.c
index f756f7f882a124850a0908d9efa564443de01b2a..839aa8a18b895c71305c44c317b7125882af3c97 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_exm.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_exm.c
@@ -14,7 +14,10 @@
 #define EXM_CTRL_EXM_UPDATE_ENABLE	BIT(0)
 
 #define EXM_MODE_REG			0x000c
+
 #define EXM_CHANNEL_SEL_REG		0x0010
+#define EXM_CHANNEL_SEL_CHANNEL_SELECT_MASK	GENMASK(2, 0)
+
 #define EXM_LAST_MEAS_LINE_REG		0x0014
 #define EXM_COEFF_R_REG			0x0018
 #define EXM_COEFF_G_GR_REG		0x001c
@@ -61,37 +64,27 @@ rppx1_exm_fill_params(struct rpp_module *mod,
 		return 0;
 	}
 
-	/* RGB bayer exposure measurement */
-	write(priv, mod->base + EXM_MODE_REG, 2);
+	switch (cfg->mode) {
+	case RPPX1_EXP_MEASURING_MODE_RGB:
+	case RPPX1_EXP_MEASURING_MODE_BAYER:
+		write(priv, mod->base + EXM_MODE_REG, cfg->mode);
+		break;
+	default:
+		write(priv, mod->base + EXM_MODE_REG, 0);
+		return 0;
+	}
+
+	write(priv, mod->base + EXM_COEFF_R_REG, cfg->coeff.red);
+	write(priv, mod->base + EXM_COEFF_G_GR_REG, cfg->coeff.green_r);
+	write(priv, mod->base + EXM_COEFF_GB_REG, cfg->coeff.green_b);
+	write(priv, mod->base + EXM_COEFF_B_REG, cfg->coeff.blue);
 
 	write(priv, mod->base + EXM_CTRL_REG, EXM_CTRL_EXM_UPDATE_ENABLE |
 	      cfg->autostop ? EXM_CTRL_EXM_AUTOSTOP : 0);
 
-	/*
-	 * Select where to sample.
-	 * 0 - after input acquisition
-	 * 1 - after black level subtraction
-	 * 2 - after input linearization
-	 * 3 - after lens shade correction
-	 * 4 - after white balance gain stage
-	 * 5 - after defect pixel correction
-	 * 6 - after denoising
-	 */
-	write(priv, mod->base + EXM_CHANNEL_SEL_REG, 6);
-
-	if (cfg->mode == RPPX1_EXP_MEASURING_MODE_0) {
-		/* Coefficients for a BT.601 BAYER (from datasheet). */
-		write(priv, mod->base + EXM_COEFF_R_REG, 38);
-		write(priv, mod->base + EXM_COEFF_G_GR_REG, 75);
-		write(priv, mod->base + EXM_COEFF_B_REG, 15);
-		write(priv, mod->base + EXM_COEFF_GB_REG, 75);
-	} else {
-		/* Y = (R + Gr + B + Gb) / 4*/
-		write(priv, mod->base + EXM_COEFF_R_REG, 128);
-		write(priv, mod->base + EXM_COEFF_G_GR_REG, 128);
-		write(priv, mod->base + EXM_COEFF_B_REG, 128);
-		write(priv, mod->base + EXM_COEFF_GB_REG, 128);
-	}
+	/* Select sample point */
+	write(priv, mod->base + EXM_CHANNEL_SEL_REG,
+	      cfg->channel_sel & EXM_CHANNEL_SEL_CHANNEL_SELECT_MASK);
 
 	/*
 	 * Adjust and set measurement window to hardware limitations,
diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
index b9083e6f32b15329333eb13491b50c0aea8d1a32..2adf5f9e083b89c0308a8728f8468f326ab87c48 100644
--- a/include/uapi/linux/media/dreamchip/rppx1-config.h
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -537,6 +537,36 @@ struct rppx1_params_awb_meas_config {
 	__u8 enable_ymax_cmp;
 };
 
+/**
+ * enum rppx1_pre_meas_chan - Measurement point for PRE1/2 modules
+ * @RPPX1_PRE_MEASURE_AFTER_ACQ: after input acquisition
+ * @RPPX1_PRE_MEASURE_AFTER_BLS: after black level subtraction
+ * @RPPX1_PRE_MEASURE_AFTER_LIN: after sensor gamma linearization
+ * @RPPX1_PRE_MEASURE_AFTER_LSC: after lens shading correction
+ * @RPPX1_PRE_MEASURE_AFTER_AWBG: after auto white balance gains
+ * @RPPX1_PRE_MEASURE_AFTER_DPCC: after defect pixel correction
+ * @RPPX1_PRE_MEASURE_AFTER_DPF: after denoise pre-filter
+ */
+enum rppx1_pre_meas_chan {
+	RPPX1_PRE_MEASURE_AFTER_ACQ,
+	RPPX1_PRE_MEASURE_AFTER_BLS,
+	RPPX1_PRE_MEASURE_AFTER_LIN,
+	RPPX1_PRE_MEASURE_AFTER_LSC,
+	RPPX1_PRE_MEASURE_AFTER_AWBG,
+	RPPX1_PRE_MEASURE_AFTER_DPCC,
+	RPPX1_PRE_MEASURE_AFTER_DPF,
+};
+
+/**
+ * enum rppx1_post_meas_chan - Measurement point for POST modules
+ * @RPPX1_PRE_MEASURE_AFTER_AWBG: after auto white balance gains
+ * @RPPX1_PRE_MEASURE_AFTER_DEMOSAIC: after demosaicing
+ */
+enum rppx1_post_meas_chan {
+	RPPX1_POST_MEASURE_AFTER_AWBG = 4,
+	RPPX1_POST_MEASURE_AFTER_DEMOSAIC = 7,
+};
+
 /**
  * enum rppx1_histogram_mode - Histogram measurement mode
  * @RPPX1_HISTOGRAM_MODE_DISABLE: histogram disabled
@@ -574,14 +604,29 @@ struct rppx1_params_hst_config {
 	__u8 hist_weight[RPPX1_HISTOGRAM_WEIGHT_GRIDS_SIZE];
 };
 
+/**
+ * struct rppx1_aec_coeff - Coefficients for exposure measurement
+ *
+ * @red: Coefficient for weighting Red sample/channel (Q1.7)
+ * @green_r: Coefficient for weighting GreenRed bayer sample or Green channel (Q1.7)
+ * @green_b: Coefficient for weighting GreenBlue bayer sample (Q1.7)
+ * @blue: Coefficient for weighting Blue sample/channel (Q1.7)
+ */
+struct rppx1_aec_coeff {
+	__u8 red;
+	__u8 green_r;
+	__u8 green_b;
+	__u8 blue;
+};
+
 /**
  * enum rppx1_exp_meas_mode - Exposure measurement mode
- * @RPPX1_EXP_MEASURING_MODE_0: Y = 16 + 0.25R + 0.5G + 0.1094B
- * @RPPX1_EXP_MEASURING_MODE_1: Y = (R + G + B) x (85/256)
+ * @RPPX1_EXP_MEASURING_MODE_RGB: out_sample = coeff_r * R + coeff_gr * G + coeff_b * B
+ * @RPPX1_EXP_MEASURING_MODE_BAYER: out_sample = coeff_[r|gr|gb|b] * [R|Gr|Gb|B]
  */
 enum rppx1_exp_meas_mode {
-	RPPX1_EXP_MEASURING_MODE_0,
-	RPPX1_EXP_MEASURING_MODE_1,
+	RPPX1_EXP_MEASURING_MODE_RGB = 1,
+	RPPX1_EXP_MEASURING_MODE_BAYER,
 };
 
 /**
@@ -591,12 +636,16 @@ enum rppx1_exp_meas_mode {
  * @mode: exposure measure mode (from enum rppx1_exp_meas_mode)
  * @autostop: 0 = continuous, 1 = stop after one frame
  * @meas_window: measurement window coordinates
+ * @coeff: weighting coefficients for R/Gr/Gb/B
+ * @channel_sel: measurement point (see enum rppx1_[pre|post]_meas_chan)
  */
 struct rppx1_params_aec_config {
 	struct v4l2_isp_params_block_header header;
 	__u32 mode;
 	__u32 autostop;
 	struct rppx1_window meas_window;
+	struct rppx1_aec_coeff coeff;
+	__u8 channel_sel;
 };
 
 /**

-- 
2.53.0


