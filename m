Return-Path: <linux-media+bounces-55809-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJQrHPzdtWlT6AAAu9opvQ
	(envelope-from <linux-media+bounces-55809-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 23:15:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EB028F40F
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 23:15:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54B3C3095202
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 22:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0741F388372;
	Sat, 14 Mar 2026 22:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Ed1RXjJC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dBCgM1El"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CEB38758C;
	Sat, 14 Mar 2026 22:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773526268; cv=none; b=EC5KPyC4hlvMIkldqkLP5mR82tB6qGNCE1TihQImMPmt83kTz5UMkLd5u2GXcRVQS3UOmgO151hHefsptImXaRyYQiQFvjBT+xLI7Pa+10mk49k/DOCd7G5/omPPuF2xTVZF3NrjODFk1EYAukkZvUzSVE+eJ4EDSMmIdR6oKvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773526268; c=relaxed/simple;
	bh=oHfc55Phe9ZaJZAl4MzMlEvjIZmuRhHeb9ZkZFnCYVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NJHsCwjb3XgfpI0+G3jMhUAWT3y7KYihR1WhIzfS9BTonxcQRhNfXsSaQ9Y7YU3TFRs80ExPWuzQQRTZMVxQB7yD5BCFPLc2EH2VegzAXb6dSDx0Nag/YP9Fzw3N3RfOBue4VVLzSrv5qNa8Y3+2CJoVZ/LuXUOlRGBhjBsKnkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Ed1RXjJC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dBCgM1El; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 3DD4DEC0B5C;
	Sat, 14 Mar 2026 18:11:02 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sat, 14 Mar 2026 18:11:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773526262;
	 x=1773612662; bh=B3jUCejEUjdzTSgmSfp7WaVdgNNgcogjFBK2749s0dw=; b=
	Ed1RXjJCfLJ/f4m4w1dQrc38DDVimMk3jUuGgDGZrJbICJNAtTvCUvu5woj6NA9K
	PUHzkzBRAkoQi6k4ggucEw+LyXc2VZ4FLXfB12i7MqOx97S2GF7PBRHKlILXWZx8
	FcBcdQ5WHQ1f9DU/sn1Tr9MavOiOgrPD9PrrGRNOh1LvrXCoSBxheoY3Qfnsgleg
	/02J5c/xKAV7kl6s8E6IUKbffgkh3elohAgI79ttshW9rpaNIYtmCjp1PMqlEkJW
	S/UB+66KltGZuLsROS3oc4fRzQzoSPZB1n481i2NebXELwl1MFJh3LWJZ26/iBWU
	GxTMlijzQOYP/cuj+h9TfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773526262; x=
	1773612662; bh=B3jUCejEUjdzTSgmSfp7WaVdgNNgcogjFBK2749s0dw=; b=d
	BCgM1ElEyMtwOYpdhUJPMvNv1pgU0ZMHKTHcxeYj9I9b++pFYZ8n5taB8jeq3iEl
	wjotrOcREXLmd7QOBYeo+TorgopL3OFDhvVhEwDp1PAxnk6sDurQIBWs5teJdTtx
	GDmLnN9+JBPp95VJNSHcyI/6kQmZMnq8Aw+L/LcXB7hAtMGSaGZum5Rtz7GCWzhs
	yhvb+be8nkgncZQoyVk338YyWaUWuZwdr2z1dYjDROGTFShj4gfmjUo5lJDfkpix
	yW/COe6ZPiUHix02tz30ul8l3DawoqxYlTHKtYxfi3pXAXWmwpTGSG8rV3Ip1/+K
	dRNAuEmcDnpr5/USo9g3g==
X-ME-Sender: <xms:9ty1aSvlvlSuIjqm3mLBc1JN8XxVzJpNMijwKvEKmvqHgCOO8SD_Fw>
    <xme:9ty1aX7rcTavw8VDj6D4M10MDDdjhwrsIIWlHlcs0iCh1GXZwzLxwCAWkdKONSYHb
    ICPBPg2eEUKrgY-0JrHqVVxt-D4NxGZOlaT9IaX2jh2BfSFcOgRtQ>
X-ME-Received: <xmr:9ty1aed0Q63TSjQ4n_l0iKhPyNsASbDHCvxctLqeNiTDeMYs2OUg22daeDxKwDaqJlQ3uX2fLZWei6trFwhe-lRFtF8gY-yFZxJG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvleefjeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeelpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehkuhhnihhnohhrihdrmhhorhhimhhothhordhggiesrhgvnhgvshgrshdrtg
    homhdprhgtphhtthhopehjrggtohhpohdrmhhonhguihesihguvggrshhonhgsohgrrhgu
    rdgtohhmpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsoh
    hnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotg
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgv
    lhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvpdhrtghpthhtohep
    mhgrrhgvkhdrvhgrshhuthdorhgvnhgvshgrshesmhgrihhlsghogidrohhrgh
X-ME-Proxy: <xmx:9ty1aUw3gO_lVnbHFgEE8brsu0DbO2Gw-xASUwgijoM8zwfk4s-OPw>
    <xmx:9ty1aT8M_IAoGmNuVpnsdScaNeGLmQwaQRk5H0sh0v2vKBz5kX-cZw>
    <xmx:9ty1aSzS2nq2nU6nslGUhbp2LQdTYJVIYRt6ICb1_kysoLJx-QHOvA>
    <xmx:9ty1abrcrCzCFA_KFfqHQ-r5F0JhNnXHdmWUtP8a8sgukV7nNli3Tw>
    <xmx:9ty1abWlsfqmq-gZ9o1K47u_ToHG_TSGDDlKAQIbHtds8vwjNG-d2Xxo>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Mar 2026 18:11:01 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Subject: [PATCH v6 06/12] media: rppx1: Add support for Histogram Measurement
Date: Sat, 14 Mar 2026 22:59:38 +0100
Message-ID: <20260314215944.3674865-7-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260314215944.3674865-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260314215944.3674865-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55809-lists,linux-media=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,mailbox.org:email,messagingengine.com:dkim]
X-Rspamd-Queue-Id: C6EB028F40F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Extend the RPPX1 driver to allow setting the Histogram configuration
using the RkISP1 parameter buffer format. It uses the RPPX1 framework for
parameters and  its writer abstraction to allow the user to control how
(and when) configuration is applied to the RPPX1.

As the RkISP1 parameters buffer have lower precision then the RPPX1
hardware the values needs to be scaled. The behavior matches the RkISP1
hardware.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |   4 +
 .../platform/dreamchip/rppx1/rpp_stats.c      |   4 +
 .../platform/dreamchip/rppx1/rppx1_hist.c     | 173 ++++++++++++++++++
 3 files changed, 181 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index e3f96528b837..d8dd783110c6 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -18,6 +18,7 @@ static const struct v4l2_isp_params_block_type_info
 rkisp1_ext_params_blocks_info[] = {
 	RKISP1_PARAMS_BLOCK_INFO(AWB_GAIN, awb_gain),
 	RKISP1_PARAMS_BLOCK_INFO(AWB_MEAS, awb_meas),
+	RKISP1_PARAMS_BLOCK_INFO(HST_MEAS, hst),
 	RKISP1_PARAMS_BLOCK_INFO(AEC_MEAS, aec),
 };
 
@@ -59,6 +60,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
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
2.53.0


