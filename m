Return-Path: <linux-media+bounces-58514-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCZyDgu+2GlVhggAu9opvQ
	(envelope-from <linux-media+bounces-58514-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:08:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A65BE3D483F
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:08:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5FCBF300A538
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 09:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E10D13BB9F4;
	Fri, 10 Apr 2026 09:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UH2udzHD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1623B9DBB;
	Fri, 10 Apr 2026 09:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775812047; cv=none; b=neNiHuGx0Io2BcU0iI5T9OH9G5RWld399aTb+oY7cLXFFtLJlUivfDJUlSOfIfue7pDt9j1eC4NilsfPf+M/ecLjRLd7oYax3Mk8ti1XIfBf40XNrkZqN5H1YDXd1TPkiWqE++pKehD/apCfFTIUXWMQdganNyyQSEga2FeiZ/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775812047; c=relaxed/simple;
	bh=8SP1pLD2v4weOx4m/bxBew8IGjO9WCjo0JbzU5xNyDI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k/iyign3MazKP3o180g+fQdFAjTSZPkH7fK8BJJBVh4o3FjPn2iBZRAFmn8AwIPy0CnHFfoNILvcOVvU0l7bwFnBwAdbGPrbsp5CdoJMRAtuyA7PD7l8/hGC0itHvuo7d1/kBKiQIhVwYkunMjBRKFHEbzhJ/JXc7M73TJmETDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UH2udzHD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [103.176.47.184])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8BE55225;
	Fri, 10 Apr 2026 11:05:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775811955;
	bh=8SP1pLD2v4weOx4m/bxBew8IGjO9WCjo0JbzU5xNyDI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UH2udzHDA2At+iD1PfxoaPXu5/2JT/cSfPi+jciCZSu/a5gLnnVBtZTWe7VO3QJOH
	 ks590q4aMt/6oqLxlXQ/6TqyUZpVM78puwqv6aUZxB0F6m1WUCGAkPtDlCdWcBhnyo
	 OggeFcCZvE7w8Jw9ZHVzW4Nsax12gbSGsUn0KRv8=
From: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Date: Fri, 10 Apr 2026 14:35:44 +0530
Subject: [PATCH v7 09/18] media: rppx1: Add support for Histogram
 Measurement
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260410-rppx1-v7-9-43cfc6b44f1f@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9283;
 i=jai.luthra+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=1sBw/dX3FI7Eobu/dBucdsaPIftOAnrYbNtOA/vAHV4=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBp2L1/lAush77VZhDjRVsS8HMzz4MxzAoFH3y37
 JLr+hIl5A6JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCadi9fwAKCRBD3pH5JJpx
 Rd6lEADBKdyZg3c5RHN49aM5iFOuvKsAyUvg4Cgj3uLEEot+d0pfvxnT97RWNgQk0a2FN1qv/xY
 PXBmThMAJ5C+t/besv6FOPFQfZhGV9wI1XgjEix3RvRJvmpYhILXEO+r5CSm1sQKGtIRYNtbQTY
 TDHkfEUX0tA3VSoS+Oz8OOZU2I1TiLClrTUVZGn9UIYTyQ587tna1oHmVFLcOahwJIufhcPOt6W
 cjYNBS4YGTyPAHWQ3E9mKM58GqXshkYurQFn2627w3nCKNKY+dg+UYrobYr993X2tuQcB+TwGZ9
 n/k1SQt2nxX72x5lIwoaJlRcPkkS76TEKxLVdfT9a5VJRtSfFuEgVOEcy+95k/glC111AA5w5ig
 6HyjaWAumCfDszx6cD8sVWQ3YhTA0HgMvnDp9zdIWkWTalRR5hMQ0YYt3gBGRAL4GkzxEltpry+
 EaWarH7iauJTYvKSA2UTiN85Wru1xG/VT+HWFRpo2G19Kfmwp1l7aeRFSBh9m+nhx4Laqo3SYRW
 FGB2D9lwwhFbnaaFk+/9Elgg0UwVAyL0XbKdSMoB6EeVMUpp3jJHzMYlwZ/nF3C+l53oe6ak8XO
 MpSVvkLReoX3/4xl2OwGtcOYNC16PXiC6xmheHbr009BwsY5RqvS1IvuDm/0nsROiKApdiGXzUa
 XLMHtkNXd/K5lxg==
X-Developer-Key: i=jai.luthra+renesas@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58514-lists,linux-media=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: A65BE3D483F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Extend the RPPX1 driver to allow setting the Histogram configuration
using the parameter buffer format. It uses the RPPX1 framework for
parameters and  its writer abstraction to allow the user to control how
(and when) configuration is applied to the RPPX1.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
---
 .../media/platform/dreamchip/rppx1/rpp_params.c    |   4 +
 drivers/media/platform/dreamchip/rppx1/rpp_stats.c |   4 +
 .../media/platform/dreamchip/rppx1/rppx1_hist.c    | 172 +++++++++++++++++++++
 3 files changed, 180 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 928e4fa196c0e4c0db6a23a89833359645a0941e..788d26f619d1a96d16e9dc499d2763366f70be0a 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -18,6 +18,7 @@ static const struct v4l2_isp_params_block_type_info
 rppx1_ext_params_blocks_info[] = {
 	RPPX1_PARAMS_BLOCK_INFO(AWB_GAIN, awb_gain),
 	RPPX1_PARAMS_BLOCK_INFO(AWB_MEAS, awb_meas),
+	RPPX1_PARAMS_BLOCK_INFO(HST_MEAS, hst),
 	RPPX1_PARAMS_BLOCK_INFO(AEC_MEAS, aec),
 };
 
@@ -59,6 +60,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		case RPPX1_PARAMS_BLOCK_TYPE_AWB_MEAS:
 			module = &rpp->post.wbmeas;
 			break;
+		case RPPX1_PARAMS_BLOCK_TYPE_HST_MEAS:
+			module = &rpp->post.hist;
+			break;
 		case RPPX1_PARAMS_BLOCK_TYPE_AEC_MEAS:
 			module = &rpp->pre1.exm;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
index 44edcbc7f2b644d7d569d46707b0b4b94ebe4144..6f3be95026f60252d05370421bb2ec6ea090ce6f 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
@@ -16,6 +16,10 @@ void rppx1_stats_fill_isr(struct rppx1 *rpp, u32 isc, void *buf)
 		if (!rpp_module_call(&rpp->post.wbmeas, fill_stats, &stats->params))
 			stats->meas_type |= RPPX1_STAT_AWB;
 
+	if (isc & RPPX1_IRQ_ID_POST_HIST_MEAS)
+		if (!rpp_module_call(&rpp->post.hist, fill_stats, &stats->params))
+			stats->meas_type |= RPPX1_STAT_HIST;
+
 	if (isc & RPPX1_IRQ_ID_PRE1_EXM)
 		if (!rpp_module_call(&rpp->pre1.exm, fill_stats, &stats->params))
 			stats->meas_type |= RPPX1_STAT_AUTOEXP;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c b/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
index cab498ece5a8fac01e9e6c048b786f2aed829dd2..6287f9c401dfc8ee7f1c19acef1a3e82c5036ac7 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
@@ -25,6 +25,9 @@
 
 #define HIST_LAST_MEAS_LINE_REG			0x0010
 #define HIST_SUBSAMPLING_REG			0x0014
+#define HIST_SUBSAMPLING_V_STEPSIZE(x)		(((x) & 0x7f) << 24)
+#define HIST_SUBSAMPLING_H_STEP_INC(x)		(((x) & 0x1ffff))
+
 #define HIST_COEFF_R_REG			0x0018
 #define HIST_COEFF_G_REG			0x001c
 #define HIST_COEFF_B_REG			0x0020
@@ -71,6 +74,175 @@ static int rppx1_hist_probe(struct rpp_module *mod)
 	return 0;
 }
 
+#define RPPX1_HIST_WEIGHT(v0, v1, v2, v3) \
+	(((v0) & 0x1f) | (((v1) & 0x1f) << 8)  | \
+	(((v2) & 0x1f) << 16) | \
+	(((v3) & 0x1f) << 24))
+
+static int rppx1_hist_fill_params(struct rpp_module *mod,
+				  const union rppx1_params_block *block,
+				  rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_params_hst_config *cfg = &block->hst;
+	u32 h_offs, v_offs, h_size, v_size;
+	u8 mode, coeff[3];
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + HIST_MODE_REG,
+		      HIST_MODE_HIST_MODE_DISABLE);
+		return 0;
+	}
+
+	/* Sample after demosaicing. */
+	write(priv, mod->base + HIST_CHANNEL_SEL_REG, 7);
+
+	/*
+	 * The RkISP1 histogram_predivider setting controls the pixel spacing
+	 * between each sample. On RPPX1 there is greater control as both line
+	 * and pixel spacing can be controlled.  The RkISP1 stepsize register is
+	 * documented as.
+	 *
+	 *  0, 1, 3: not allowed
+	 *  3: process every third input pixel
+	 *  4: process every fourth input pixel
+	 *  127: process every 127th pixel
+	 *
+	 * The output bins are 16 bit (FP16.4) so to not overflow a divider
+	 * calculated as would be needed.
+	 *
+	 *  count = mode == RGB_COMBINED ? 3 : 1
+	 *  factor = vsize * hsize  * count / 65536
+	 *
+	 * However the libcamera user of the RkISP documents the setting as
+	 * applying to both h and v direction at the same time and calculates
+	 * the divider as,
+	 *
+	 *  count = mode == RGB_COMBINED ? 3 : 1
+	 *  factor = ceil(sqrt(vsize * hsize  * count / 65536))
+	 *
+	 * Real world usage is better then bad documentation, do the same here
+	 * and apply the divider in both directions.
+	 *
+	 * The RPPX1 h-stepping is also configured differently. Internally
+	 * there is a 16-bit counter and for each input pixel h_step_inc is
+	 * added to it. Every time it overflows the input pixel is sampled.
+	 *
+	 *  h_step_inc = 2**16 => sample every pixel
+	 *  h_step_inc = 2**15 => sample every other pixel
+	 *
+	 * Gives us the conversion to RkISP1 parameters of.
+	 *
+	 *  h_step_inc = 65536 / divider
+	 */
+	write(priv, mod->base + HIST_SUBSAMPLING_REG,
+	      HIST_SUBSAMPLING_V_STEPSIZE(cfg->histogram_predivider) |
+	      HIST_SUBSAMPLING_H_STEP_INC(0x10000 / cfg->histogram_predivider));
+
+	/*
+	 * Adjust and set measurement window to hardware limitations,
+	 * - Offsets must be even.
+	 * - Width and height must be divisible by 10.
+	 */
+	h_offs = cfg->meas_window.h_offs & 0x1ffe;
+	v_offs = cfg->meas_window.v_offs & 0x1ffe;
+	h_size = cfg->meas_window.h_size - cfg->meas_window.h_size % 10;
+	v_size = cfg->meas_window.v_size - cfg->meas_window.v_size % 10;
+
+	write(priv, mod->base + HIST_H_OFFS_REG, h_offs);
+	write(priv, mod->base + HIST_V_OFFS_REG, v_offs);
+	write(priv, mod->base + HIST_H_SIZE_REG, h_size / 5);
+	write(priv, mod->base + HIST_V_SIZE_REG, v_size / 5);
+
+	/* Set last measurement line for ready interrupt. */
+	write(priv, mod->base + HIST_LAST_MEAS_LINE_REG,
+	      v_offs + v_size + 1);
+
+	/* NOTE: Keep the default full sample range. */
+
+	/* Set measurement window weights. */
+	write(priv, mod->base + HIST_WEIGHT_00TO30_REG,
+	      RPPX1_HIST_WEIGHT(cfg->hist_weight[0], cfg->hist_weight[1],
+				cfg->hist_weight[2], cfg->hist_weight[3]));
+	write(priv, mod->base + HIST_WEIGHT_40TO21_REG,
+	      RPPX1_HIST_WEIGHT(cfg->hist_weight[4], cfg->hist_weight[5],
+				cfg->hist_weight[6], cfg->hist_weight[7]));
+	write(priv, mod->base + HIST_WEIGHT_31TO12_REG,
+	      RPPX1_HIST_WEIGHT(cfg->hist_weight[8], cfg->hist_weight[9],
+				cfg->hist_weight[10], cfg->hist_weight[11]));
+	write(priv, mod->base + HIST_WEIGHT_22TO03_REG,
+	      RPPX1_HIST_WEIGHT(cfg->hist_weight[12], cfg->hist_weight[13],
+				cfg->hist_weight[14], cfg->hist_weight[15]));
+	write(priv, mod->base + HIST_WEIGHT_13TO43_REG,
+	      RPPX1_HIST_WEIGHT(cfg->hist_weight[16], cfg->hist_weight[17],
+				cfg->hist_weight[18], cfg->hist_weight[19]));
+	write(priv, mod->base + HIST_WEIGHT_04TO34_REG,
+	      RPPX1_HIST_WEIGHT(cfg->hist_weight[20], cfg->hist_weight[21],
+				cfg->hist_weight[22], cfg->hist_weight[23]));
+	write(priv, mod->base + HIST_WEIGHT_44_REG,
+	      RPPX1_HIST_WEIGHT(cfg->hist_weight[24], 0, 0, 0));
+
+	/* Translate RkISP1 modes. */
+	mode = HIST_MODE_HIST_MODE_YRGB;
+	switch (cfg->mode) {
+	case RPPX1_HISTOGRAM_MODE_RGB_COMBINED:
+		/* L = R + G + B */
+		coeff[0] = 0x80;
+		coeff[1] = 0x80;
+		coeff[2] = 0x80;
+		break;
+	case RPPX1_HISTOGRAM_MODE_R_HISTOGRAM:
+		/* L = R */
+		coeff[0] = 0x80;
+		coeff[1] = 0x00;
+		coeff[2] = 0x00;
+		break;
+	case RPPX1_HISTOGRAM_MODE_G_HISTOGRAM:
+		/* L = G */
+		coeff[0] = 0x00;
+		coeff[1] = 0x80;
+		coeff[2] = 0x00;
+		break;
+	case RPPX1_HISTOGRAM_MODE_B_HISTOGRAM:
+		coeff[0] = 0x00;
+		coeff[1] = 0x00;
+		coeff[2] = 0x80;
+		break;
+	case RPPX1_HISTOGRAM_MODE_Y_HISTOGRAM:
+		/* Coefficients for a BT.601 (from datasheet). */
+		coeff[0] = 38;
+		coeff[1] = 75;
+		coeff[2] = 15;
+		break;
+	default:
+		mode = HIST_MODE_HIST_MODE_DISABLE;
+		coeff[0] = 0x00;
+		coeff[1] = 0x00;
+		coeff[2] = 0x00;
+		break;
+	}
+
+	write(priv, mod->base + HIST_MODE_REG, mode);
+	write(priv, mod->base + HIST_COEFF_R_REG, coeff[0]);
+	write(priv, mod->base + HIST_COEFF_G_REG, coeff[1]);
+	write(priv, mod->base + HIST_COEFF_B_REG, coeff[2]);
+
+	write(priv, mod->base + HIST_FORCED_UPDATE_REG, 1);
+
+	return 0;
+}
+
+static int rppx1_hist_fill_stats(struct rpp_module *mod,
+				 struct rppx1_stat *stats)
+{
+	for (unsigned int i = 0; i < HIST_BIN_REG_NUM; i++)
+		stats->hist.hist_bins[i] = rpp_module_read(mod, HIST_BIN_REG(i)) & 0xfffff;
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_hist_ops = {
 	.probe = rppx1_hist_probe,
+	.fill_params = rppx1_hist_fill_params,
+	.fill_stats = rppx1_hist_fill_stats,
 };

-- 
2.53.0


