Return-Path: <linux-media+bounces-46161-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C43AC2990F
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 00:00:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15AFD3B0834
	for <lists+linux-media@lfdr.de>; Sun,  2 Nov 2025 22:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0605025D533;
	Sun,  2 Nov 2025 22:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="gQcucSLC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jSA1gSeg"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8432571D8;
	Sun,  2 Nov 2025 22:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762124240; cv=none; b=WCDgm4EVl6Ign9CUP3IVJV2TYpAJ32B4l99gOO2kiuRgW/rtzQRX7XKmNlJ1G2wY1Sw+Uj6C0/MwviAJTzBfHryeGNa4qC0IHG2oxNCV8RnU0U4lEhG8n0nVoevZ9S5WoLcv4TuRX/iPBtf8IdMWbR5a9pK/YNf5NTBJvIkFotk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762124240; c=relaxed/simple;
	bh=3BsEiC3yXAZ4lYorwmUAKhyiOkNN+8Qam6rPYtsAHqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jrCT49Ht038nCkhjhOBsW/ynyGprgZe2R4qs0h7UA0J6I/r0zSLQLqxSVp+97AjUvx7UD0uSLSlWApdvEXj4szE2qKgg+20okgHF+OPFWpsiKQD5QC03Swqc731KwaIFLMvmkmUPZ0PQjnKLsQny+UzbmYIr1Kn7LhU3KsuX3Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=gQcucSLC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jSA1gSeg; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4F18A140025D;
	Sun,  2 Nov 2025 17:57:17 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 02 Nov 2025 17:57:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762124237;
	 x=1762210637; bh=frx7H/XMJROWbWj4SqKL71xx2DhWlWuWN3SaPGeryjw=; b=
	gQcucSLCrNVP0klkKFaLWJLC0+/AbylksQuB3Ky0tYooL+EvpXaSRgYOM+GHRTqj
	DE5ji5tdUL/xle1WTEK8+4pRMNFLog6s5LiwWOtuGdXoe4vNX7MKs4CwO6aGZ1Ab
	YqsHcff9kC1APQXkWEIO1mMt64t1m3PSCd1YIjkTa7AWejjALU30Njdm8nJpb1dZ
	JMjA4HH+s9MdbVwF8u6AqoDm4x+/y3EG8zsXjHB5jUdmWqGEyfIRlq0kWkq0+FP8
	l1Y68ilXW/V4KAj3G4cTs88VfByvyvN3BjdCMh8qx1M4ea4bg/SBGXSjn13XJECF
	qa1knnNGVxMojmUaBaVMqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762124237; x=
	1762210637; bh=frx7H/XMJROWbWj4SqKL71xx2DhWlWuWN3SaPGeryjw=; b=j
	SA1gSegYIzSYFHcGc4+nn9e2qw7OzPobZeW/6lXB4LiQsbDW/HPHN7ZK/mGXdBsk
	aUUOvZ0LEEweAHvCyR4nQ/0sjEreK+E5MhmcbP/xqztSmPnq7k4gPvUSDZnDNsyY
	reKPRG27fvwfEz33LE+KTgJ3sSPkRB+UtfPF2qLgcCBJgR/SywrDJZcMzHDAu8W0
	lrGDQgQDFj+5xS2H5ASloyE0+yj/CKr9hKbYO/Kna23pmFdwqoJ2Olbt/d3JB/pE
	SKyZEReEwr2Q/n5rDr/tjND9y+btJTQ/LEzn3HfM1ZoIK8vsgMDgTDUPFwtqZgDv
	pTOz2+T5FC0n5P7YPxQ3A==
X-ME-Sender: <xms:zeEHaVHnCfGqJuLiJ2t6eJe-sF9Y2enu4nm4Fu2HGVBkk-iGAj78tA>
    <xme:zeEHaUajA1bJ_-1kShlfmm9u0dGzYwI6qTlOPO3HL_CRwZyo_6LQv3f16bfMMqPWD
    syq4V0IDm-saceE8RGDITtRtMp2PV8XzSo5Ou7ETo9eIX2gbr152w>
X-ME-Received: <xmr:zeEHaXDEn5Dhxj8dg-zhxVKkdnYNV2ghWMjpAXLv3C644UoZEv5WZ2ZzNBSP-nKEHK6YIJ3GylJuXQhz_Xo3oYZl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddujeeiheduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeejpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehjrggtohhpohdrmhhonhguihesihguvggrshhonhgsohgrrhgurdgtohhmpd
    hrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghr
    ugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhn
    ugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:zeEHack-LOS19hEDpkMGP4Rg3iZB-c4Osr0-P9A_eyQeE3QgcD2P1g>
    <xmx:zeEHaYwPGKrFVsxA1cq23AXcSFnb6XfA-FxnJXfQHtUmrKaoqOzhHw>
    <xmx:zeEHaWSELzwpuBVS9uYgz8ds89ZzFNPFxmiQ4C6eMhFaNpj7VTqQ4w>
    <xmx:zeEHaQ_Fmz1zGzofJkN1DLU5Q1iQJshCbzhvGyVV5tMjGF7p2D_rcw>
    <xmx:zeEHaWxlmai-6TYiq21aEQmvAs_mJV2go4D4v0Ho30IIn1-VXxT6priI>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Nov 2025 17:57:16 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 06/12] media: rppx1: Add support for Histogram Measurement
Date: Sun,  2 Nov 2025 23:56:36 +0100
Message-ID: <20251102225642.3125325-7-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251102225642.3125325-1-niklas.soderlund+renesas@ragnatech.se>
References: <20251102225642.3125325-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Extend the RPPX1 driver to allow setting the Histogram configuration
using the RkISP1 parameter buffer format. It uses the RPPX1 framework for
parameters and  its writer abstraction to allow the user to control how
(and when) configuration is applied to the RPPX1.

As the RkISP1 parameters buffer have lower precision then the RPPX1
hardware the values needs to be scaled. The behavior matches the RkISP1
hardware.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |   3 +
 .../platform/dreamchip/rppx1/rpp_stats.c      |   4 +
 .../platform/dreamchip/rppx1/rppx1_hist.c     | 173 ++++++++++++++++++
 3 files changed, 180 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index bff525970478..15e476d2fa1c 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -30,6 +30,9 @@ int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS:
 			module = &rpp->post.wbmeas;
 			break;
+		case RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS:
+			module = &rpp->post.hist;
+			break;
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS:
 			module = &rpp->pre1.exm;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
index d62b26e24cb0..059bd76ecf64 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
@@ -16,6 +16,10 @@ void rppx1_stats_fill_isr(struct rppx1 *rpp, u32 isc, void *buf)
 		if (!rpp_module_call(&rpp->post.wbmeas, stats_rkisp1, &stats->params))
 			stats->meas_type |= RKISP1_CIF_ISP_STAT_AWB;
 
+	if (isc & RPPX1_IRQ_ID_POST_HIST_MEAS)
+		if (!rpp_module_call(&rpp->post.hist, stats_rkisp1, &stats->params))
+			stats->meas_type |= RKISP1_CIF_ISP_STAT_HIST;
+
 	if (isc & RPPX1_IRQ_ID_PRE1_EXM)
 		if (!rpp_module_call(&rpp->pre1.exm, stats_rkisp1, &stats->params))
 			stats->meas_type |= RKISP1_CIF_ISP_STAT_AUTOEXP;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c b/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
index cab498ece5a8..40ae8dc72b90 100644
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
@@ -71,6 +74,176 @@ static int rppx1_hist_probe(struct rpp_module *mod)
 	return 0;
 }
 
+#define RPPX1_HIST_WEIGHT(v0, v1, v2, v3) \
+	(((v0) & 0x1f) | (((v1) & 0x1f) << 8)  | \
+	(((v2) & 0x1f) << 16) | \
+	(((v3) & 0x1f) << 24))
+
+static int rppx1_hist_param_rkisp1(struct rpp_module *mod,
+				   const union rppx1_params_rkisp1_config *block,
+				   rppx1_reg_write write, void *priv)
+{
+	const struct rkisp1_ext_params_hst_config *cfg = &block->hst;
+	const struct rkisp1_cif_isp_hst_config *arg = &cfg->config;
+	u32 h_offs, v_offs, h_size, v_size;
+	u8 mode, coeff[3];
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
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
+	      HIST_SUBSAMPLING_V_STEPSIZE(arg->histogram_predivider) |
+	      HIST_SUBSAMPLING_H_STEP_INC(0x10000 / arg->histogram_predivider));
+
+	/*
+	 * Adjust and set measurement window to hardware limitations,
+	 * - Offsets must be even.
+	 * - Width and height must be divisible by 10.
+	 */
+	h_offs = arg->meas_window.h_offs & 0x1ffe;
+	v_offs = arg->meas_window.v_offs & 0x1ffe;
+	h_size = arg->meas_window.h_size - arg->meas_window.h_size % 10;
+	v_size = arg->meas_window.v_size - arg->meas_window.v_size % 10;
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
+	      RPPX1_HIST_WEIGHT(arg->hist_weight[0], arg->hist_weight[1],
+				arg->hist_weight[2], arg->hist_weight[3]));
+	write(priv, mod->base + HIST_WEIGHT_40TO21_REG,
+	      RPPX1_HIST_WEIGHT(arg->hist_weight[4], arg->hist_weight[5],
+				arg->hist_weight[6], arg->hist_weight[7]));
+	write(priv, mod->base + HIST_WEIGHT_31TO12_REG,
+	      RPPX1_HIST_WEIGHT(arg->hist_weight[8], arg->hist_weight[9],
+				arg->hist_weight[10], arg->hist_weight[11]));
+	write(priv, mod->base + HIST_WEIGHT_22TO03_REG,
+	      RPPX1_HIST_WEIGHT(arg->hist_weight[12], arg->hist_weight[13],
+				arg->hist_weight[14], arg->hist_weight[15]));
+	write(priv, mod->base + HIST_WEIGHT_13TO43_REG,
+	      RPPX1_HIST_WEIGHT(arg->hist_weight[16], arg->hist_weight[17],
+				arg->hist_weight[18], arg->hist_weight[19]));
+	write(priv, mod->base + HIST_WEIGHT_04TO34_REG,
+	      RPPX1_HIST_WEIGHT(arg->hist_weight[20], arg->hist_weight[21],
+				arg->hist_weight[22], arg->hist_weight[23]));
+	write(priv, mod->base + HIST_WEIGHT_44_REG,
+	      RPPX1_HIST_WEIGHT(arg->hist_weight[24], 0, 0, 0));
+
+	/* Translate RkISP1 modes. */
+	mode = HIST_MODE_HIST_MODE_YRGB;
+	switch (arg->mode) {
+	case RKISP1_CIF_ISP_HISTOGRAM_MODE_RGB_COMBINED:
+		/* L = R + G + B */
+		coeff[0] = 0x80;
+		coeff[1] = 0x80;
+		coeff[2] = 0x80;
+		break;
+	case RKISP1_CIF_ISP_HISTOGRAM_MODE_R_HISTOGRAM:
+		/* L = R */
+		coeff[0] = 0x80;
+		coeff[1] = 0x00;
+		coeff[2] = 0x00;
+		break;
+	case RKISP1_CIF_ISP_HISTOGRAM_MODE_G_HISTOGRAM:
+		/* L = G */
+		coeff[0] = 0x00;
+		coeff[1] = 0x80;
+		coeff[2] = 0x00;
+		break;
+	case RKISP1_CIF_ISP_HISTOGRAM_MODE_B_HISTOGRAM:
+		coeff[0] = 0x00;
+		coeff[1] = 0x00;
+		coeff[2] = 0x80;
+		break;
+	case RKISP1_CIF_ISP_HISTOGRAM_MODE_Y_HISTOGRAM:
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
+static int rppx1_hist_stats_rkisp1(struct rpp_module *mod,
+				   struct rkisp1_cif_isp_stat *stats)
+{
+	for (unsigned int i = 0; i < HIST_BIN_REG_NUM; i++)
+		stats->hist.hist_bins[i] = rpp_module_read(mod, HIST_BIN_REG(i)) & 0xfffff;
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_hist_ops = {
 	.probe = rppx1_hist_probe,
+	.param_rkisp1 = rppx1_hist_param_rkisp1,
+	.stats_rkisp1 = rppx1_hist_stats_rkisp1,
 };
-- 
2.51.1


