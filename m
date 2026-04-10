Return-Path: <linux-media+bounces-58522-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJfoDZC+2GlVhggAu9opvQ
	(envelope-from <linux-media+bounces-58522-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:10:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3AD3D48D9
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:10:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7E124300530F
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 09:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A073C454F;
	Fri, 10 Apr 2026 09:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fAFA76IF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701D63BA252;
	Fri, 10 Apr 2026 09:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775812095; cv=none; b=iLqgh43/AUsCjq5hmtxWNA8K2faQGmZiaU6me19SqY+P7Ps2/qRuvx3EOraxGR6Oi4yD1j8yS9ov3ti5xAfZcLEHUjrx1pAjUznoqoep0Mryg4t1RICpqvso5Ran5Mhi3z1lLUkO6zVlb7fGSNclONNCgkFM4MfZ04F57fbvBFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775812095; c=relaxed/simple;
	bh=oJG+GAZmTKCt65RZeYqjH4yPyhor2PTj87SfNvVSXEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sOYkIvqVWb4OiTyDO3KkTOOuQgYhQEpNuDtbR5zzoYiQX2J8EJuSLSiivpWWUvPXsltksYfoBrRm7MG56xS50vkzFp9+AIEzZmZwU/GKdm01i8v5QQPZJUI69lDArGzAI96YD8iCt67Pan4SBV3fZCwd5PQnTQT6ZauKmf5iwQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fAFA76IF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [103.176.47.184])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7B51A97F;
	Fri, 10 Apr 2026 11:06:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775812003;
	bh=oJG+GAZmTKCt65RZeYqjH4yPyhor2PTj87SfNvVSXEs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fAFA76IFj3vrnlv9g0UQuaPkUsqxn8RSwxQDej7FW1hrd+EzeE74q9LBz2WNvST6r
	 VwYuB0ge1vC2cJl3WL37FpBaiXAjOoRPzyO1YdvEOQClEmNTcbMNWTl0qHoXCHu1fN
	 0yYRS+EjZ4T4tBgeR0vOhXLDGcV2gxNCRf76gYpQ=
From: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Date: Fri, 10 Apr 2026 14:35:52 +0530
Subject: [PATCH v7 17/18] media: rppx1: Add support for Bilateral Denoising
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260410-rppx1-v7-17-43cfc6b44f1f@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7524;
 i=jai.luthra+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=VbLCU1DXxQXKMWSaaxeybGD05GI3hJgaay1Y0ioT5sU=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBp2L2Hj7utiZQcNg+Php1GEDOlE6KY86IjCqm5C
 ygpPRBqGjuJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCadi9hwAKCRBD3pH5JJpx
 RTrDD/4sXmr9kIu7PESldDX/1cfSgAVjA2bmK6omxal/I1yaEfofNoRlptr2N47isKfIRtAUGtG
 T8kr9HGIJ/Zi8ptpUWzGLATuG6NKloY2fNuM7MLODwXIoWIhrAO5bPru/umwy6CmDnrQgPNCbSW
 hcfdapD0GUkvDYKICPAcn1McZUACP7dh21je81KXs9AokDgAiHGtrM58A+mWwinN2adIBRfIoKv
 wexhWmGREiYwAD/G5G/NlO3yth4NRjDshNvcVuXinHDoOpawPoZht1mbk2Ar8jgBrlv2+YZhDtI
 6tmLpJVvoOySQDEEjiGvhU7Efocxhz8+YccHGZ20jmgHgSke0J1CwoWGJq+cNxeCPRkrsQVEFjQ
 feT1OITSNHo0limbRQKnCrKzk9Is0ARDv/8LcFyMYRAFFqebsL5YvwOzXmOMi68ESgo6lAeVrQW
 4+27QyFbSPLosXzJgQwLQS9DNlhHTxNopv3KCiv+pqjaANDvFJ4yoAVFNE/aYkDlfZZeRi/v6Hc
 JEUydqoQ/XCiY0bZMNHkQOBskFUSP0qXlW2Ur5uaJHSeCcB3gZ+vGWU66a5GSFrYinOhZtkGKVs
 /3EMFe5d0uLRls+oodF/J36Qz4ov6+avbmvM4T+mj89/+EHzogfG/IoVk6ikg7bUIcLWYRiJsHl
 qz152PiyWIbBw6Q==
X-Developer-Key: i=jai.luthra+renesas@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58522-lists,linux-media=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ragnatech.se:email,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 3B3AD3D48D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Extend the RPPX1 driver to allow setting the Bilateral Denoising
configuration using the parameter buffer format. It uses the RPPX1
framework for parameters and its writer abstraction to allow the user to
control how (and when) configuration is applied to the RPPX1.

Compared to RkISP, RPP-X1 has dropped the hardware bit AWB_GAIN_COMP.
Luckily it's behavior is easy to emulate in software, so we have kept
the uAPI same.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
---
 .../media/platform/dreamchip/rppx1/rpp_params.c    |   7 +
 drivers/media/platform/dreamchip/rppx1/rppx1_bd.c  | 150 +++++++++++++++++++++
 2 files changed, 157 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 07ce9d22265a444038bb8bdc91c129a47cb94e0d..2847647dcf42d7975dee446c8e29c87828db746c 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -22,6 +22,8 @@ rppx1_ext_params_blocks_info[] = {
 	RPPX1_PARAMS_BLOCK_INFO(BDM, bdm),
 	RPPX1_PARAMS_BLOCK_INFO(CTK, ctk),
 	RPPX1_PARAMS_BLOCK_INFO(GOC, goc),
+	RPPX1_PARAMS_BLOCK_INFO(DPF, dpf),
+	RPPX1_PARAMS_BLOCK_INFO(DPF_STRENGTH, dpf_strength),
 	RPPX1_PARAMS_BLOCK_INFO(LSC, lsc),
 	RPPX1_PARAMS_BLOCK_INFO(AWB_MEAS, awb_meas),
 	RPPX1_PARAMS_BLOCK_INFO(HST_MEAS, hst),
@@ -77,6 +79,11 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		case RPPX1_PARAMS_BLOCK_TYPE_GOC:
 			module = &rpp->hv.ga;
 			break;
+		case RPPX1_PARAMS_BLOCK_TYPE_DPF:
+		case RPPX1_PARAMS_BLOCK_TYPE_DPF_STRENGTH:
+			/* Both types handled by the same block. */
+			module = &rpp->pre1.bd;
+			break;
 		case RPPX1_PARAMS_BLOCK_TYPE_LSC:
 			module = &rpp->pre1.lsc;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_bd.c b/drivers/media/platform/dreamchip/rppx1/rppx1_bd.c
index acbfbcd595915fbb36221bc3e6a63cfdc954409e..0d629c3752905687dc67d1cd90ec6d6fd3249e93 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_bd.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_bd.c
@@ -47,6 +47,156 @@ static int rppx1_bd_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static int
+rppx1_bd_fill_params_main(struct rpp_module *mod,
+			  const union rppx1_params_block *block,
+			  rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_params_dpf_config *cfg = &block->dpf;
+	unsigned int isp_dpf_mode, spatial_coeff;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + DPF_MODE_REG, 0);
+		return 0;
+	}
+
+	/*
+	 * RPP DB module version 4 and later removed the AWB_GAIN_COMP bit.
+	 * Always use programmed nf-gains for gain compensation. Emulate the
+	 * old behavior by programming default gains when gain compensation
+	 * is not requested.
+	 */
+	bool awb_gain_comp = false;
+
+	switch (cfg->gain.mode) {
+	case RPPX1_DPF_GAIN_USAGE_NF_GAINS:
+		awb_gain_comp = true;
+		isp_dpf_mode = DPF_MODE_USE_NF_GAIN;
+		break;
+	case RPPX1_DPF_GAIN_USAGE_LSC_GAINS:
+		isp_dpf_mode = DPF_MODE_LSC_GAIN_COMP;
+		break;
+	case RPPX1_DPF_GAIN_USAGE_NF_LSC_GAINS:
+		awb_gain_comp = true;
+		isp_dpf_mode = DPF_MODE_USE_NF_GAIN | DPF_MODE_LSC_GAIN_COMP;
+		break;
+	case RPPX1_DPF_GAIN_USAGE_AWB_GAINS:
+		awb_gain_comp = true;
+		isp_dpf_mode = 0;
+		break;
+	case RPPX1_DPF_GAIN_USAGE_AWB_LSC_GAINS:
+		awb_gain_comp = true;
+		isp_dpf_mode = DPF_MODE_LSC_GAIN_COMP;
+		break;
+	case RPPX1_DPF_GAIN_USAGE_DISABLED:
+	default:
+		isp_dpf_mode = 0;
+		break;
+	}
+
+	/* NOTE: Hardware bit for scale_mode is inverted compared to RkISP1. */
+	if (cfg->nll.scale_mode == RPPX1_NLL_SCALE_LINEAR)
+		isp_dpf_mode |= DPF_MODE_NLL_SEGMENTATION;
+	if (cfg->rb_flt.fltsize == RPPX1_DPF_RB_FILTERSIZE_9x9)
+		isp_dpf_mode |= DPF_MODE_RB_FILTER_SIZE;
+	if (!cfg->rb_flt.r_enable)
+		isp_dpf_mode |= DPF_MODE_R_FILTER_OFF;
+	if (!cfg->rb_flt.b_enable)
+		isp_dpf_mode |= DPF_MODE_B_FILTER_OFF;
+	if (!cfg->g_flt.gb_enable)
+		isp_dpf_mode |= DPF_MODE_GB_FILTER_OFF;
+	if (!cfg->g_flt.gr_enable)
+		isp_dpf_mode |= DPF_MODE_GR_FILTER_OFF;
+
+	isp_dpf_mode |= DPF_MODE_DPF_ENABLE;
+
+	if (awb_gain_comp) {
+		write(priv, mod->base + DPF_NF_GAIN_B_REG, cfg->gain.nf_b_gain);
+		write(priv, mod->base + DPF_NF_GAIN_R_REG, cfg->gain.nf_r_gain);
+		write(priv, mod->base + DPF_NF_GAIN_GB_REG, cfg->gain.nf_gb_gain);
+		write(priv, mod->base + DPF_NF_GAIN_GR_REG, cfg->gain.nf_gr_gain);
+	} else {
+		write(priv, mod->base + DPF_NF_GAIN_B_REG, 0x100);
+		write(priv, mod->base + DPF_NF_GAIN_R_REG, 0x100);
+		write(priv, mod->base + DPF_NF_GAIN_GB_REG, 0x100);
+		write(priv, mod->base + DPF_NF_GAIN_GR_REG, 0x100);
+	}
+
+	for (unsigned int i = 0; i < RPPX1_DPF_MAX_NLF_COEFFS; i++) {
+		write(priv, mod->base + DPF_NLL_G_COEFF_REG(i), cfg->nll.coeff[i]);
+		write(priv, mod->base + DPF_NLL_RB_COEFF_REG(i), cfg->nll.coeff[i]);
+	}
+
+	spatial_coeff = cfg->g_flt.spatial_coeff[0] |
+			(cfg->g_flt.spatial_coeff[1] << 8) |
+			(cfg->g_flt.spatial_coeff[2] << 16) |
+			(cfg->g_flt.spatial_coeff[3] << 24);
+	write(priv, mod->base + DPF_S_WEIGHT_G_1_4_REG, spatial_coeff);
+
+	spatial_coeff = cfg->g_flt.spatial_coeff[4] |
+			(cfg->g_flt.spatial_coeff[5] << 8);
+	write(priv, mod->base + DPF_S_WEIGHT_G_5_6_REG, spatial_coeff);
+
+	spatial_coeff = cfg->rb_flt.spatial_coeff[0] |
+			(cfg->rb_flt.spatial_coeff[1] << 8) |
+			(cfg->rb_flt.spatial_coeff[2] << 16) |
+			(cfg->rb_flt.spatial_coeff[3] << 24);
+	write(priv, mod->base + DPF_S_WEIGHT_RB_1_4_REG, spatial_coeff);
+
+	spatial_coeff = cfg->rb_flt.spatial_coeff[4] |
+			(cfg->rb_flt.spatial_coeff[5] << 8);
+	write(priv, mod->base + DPF_S_WEIGHT_RB_5_6_REG, spatial_coeff);
+
+	/*
+	 * Bilateral Denoising does not react on RPP_HDR_UPD::regs_gen_cfg_upd
+	 * (see Table 25). A change in configuration needs write of 1 to
+	 * RPP_HDR_UPD::regs_cfg_upd.
+	 */
+	write(priv, 4, 1);
+
+	write(priv, mod->base + DPF_MODE_REG, isp_dpf_mode);
+
+	return 0;
+}
+
+static int
+rppx1_bd_fill_params_strength(struct rpp_module *mod,
+			      const union rppx1_params_block *block,
+			      rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_params_dpf_strength_config *cfg = &block->dpfs;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + DPF_MODE_REG, 0);
+		return 0;
+	}
+
+	/* Module version 5 adds shadowing for mode and spatial weights. */
+	write(priv, mod->base + DPF_STRENGTH_R_REG, cfg->r);
+	write(priv, mod->base + DPF_STRENGTH_G_REG, cfg->g);
+	write(priv, mod->base + DPF_STRENGTH_B_REG, cfg->b);
+
+	return 0;
+}
+
+static int
+rppx1_bd_fill_params(struct rpp_module *mod,
+		     const union rppx1_params_block *block,
+		     rppx1_reg_write write, void *priv)
+{
+	switch (block->header.type) {
+	case RPPX1_PARAMS_BLOCK_TYPE_DPF:
+		return rppx1_bd_fill_params_main(mod, block, write, priv);
+	case RPPX1_PARAMS_BLOCK_TYPE_DPF_STRENGTH:
+		return rppx1_bd_fill_params_strength(mod, block, write, priv);
+	}
+
+	return -EINVAL;
+}
+
 const struct rpp_module_ops rppx1_bd_ops = {
 	.probe = rppx1_bd_probe,
+	.fill_params = rppx1_bd_fill_params,
 };

-- 
2.53.0


