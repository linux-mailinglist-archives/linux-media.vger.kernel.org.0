Return-Path: <linux-media+bounces-55805-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGQnFCPdtWlT6AAAu9opvQ
	(envelope-from <linux-media+bounces-55805-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 23:11:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E51A928F36C
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 23:11:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9A75304CCF1
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 22:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F52E330B3A;
	Sat, 14 Mar 2026 22:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="22fCCSaz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pKSmmNyw"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B701386444;
	Sat, 14 Mar 2026 22:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773526258; cv=none; b=hRqF7wyqZTNZpSObhshCDnzX5c3YL2RzR1WjcExwD6NlBku0ingAhaxjNevusGByP6yZ8OFgvG88VQ6zwBjSOI2HBzANQASKdyRDxfadYIpBngxB4/9Qs8rZEB3IDXBY8UBYFe1Iz06defReehSB3lSpm1SATqZL5JvHZ1G0uZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773526258; c=relaxed/simple;
	bh=4Wwj/rMN3e1CWhDNrf0Ua9wYifkX/yOtTHu92SomlQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ohlzLqeXG2uW54VucHLoGikzex9rw3cnZwWFSdypDzUeGWE6MoUZHLLDAymRLB6EYX+4x6vNAl5wpdPvScRJgLgQkVjOmATfyRUaQiJwgp5UiTQ3UIo6yaByNcfcwucwoU+QCxPZPktkFuhG6OIyl/plX4+giWuZphU9WKtokMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=22fCCSaz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pKSmmNyw; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 84594140013A;
	Sat, 14 Mar 2026 18:10:56 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sat, 14 Mar 2026 18:10:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773526256;
	 x=1773612656; bh=cIT7PyMj5aO2s9VKllLkWnqRy6Uv5NTeUkAoJ8CK1Yc=; b=
	22fCCSazhJvz7o1hXGbKGy0UBpQ3S/3FGhHob6t7ekFcHjBe6GaerLprGSfYroFd
	avIJxzfWyoY0imV5q/hNvyVSpQ9iPsZzFZkKJwWByI7+EyVlpFxIGrYtN9jG1T0L
	SRrR9M1fRxG0fRmK1mUCCZpP+IjISXHAss813wPJMwbPoDmFPushdAAccfxrdS0D
	OI8WSlc/IvMWEjDJW4nrkxLuXCh3e/gWLfYPhFZMc9YiaZ8O8WsNVmMaYPWkL4i7
	r321xPb9iHOAgBJVW+IHzXwJSUKFkvgiVeL9n7W4C2qSYgCbgWkLpBHJH1NuZAJS
	+6ICL5Hbup8LLcw4b/Mp2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773526256; x=
	1773612656; bh=cIT7PyMj5aO2s9VKllLkWnqRy6Uv5NTeUkAoJ8CK1Yc=; b=p
	KSmmNywlMUkdN+XPbXK+QOdREnj581Ci8PJsI/C7wLbC1F+GNZB7jt89oA9tDuc3
	jF1J0SNPavb1yst+SZP53dFiSM0q6X/2L8uTD/vpYFACMce9ZaNoxhHDVOxsvkqh
	GB0rRotlSdY6AgOx7pMjgjOjjKX1qkbNJVEdYloLZQUc/QwpHKtfAfTX/YfGhr0C
	RYZWYm8LN7I1HydC6VSZJ0vfNotzNUY1wzy9MhVq3IKFRNM6F/Ry5iniKymQcf27
	Ps/7ZC59CQiLa3ndioyNp5N1McXfxYQVB+wPrfCF4UKEuGp83b3Xm404+h2tjDIV
	0ulUJAhtzRk2WdMnT/x9w==
X-ME-Sender: <xms:8Ny1aVMNPVnf0SCFX00a8KY2fbywg3iAreUpueNOtQnwLP5S8bKV5A>
    <xme:8Ny1aYb0HC1qJ1ZfU1uK_I4Lg33vd18lmYvdb2j5bCU6dIpfVcVMub5j-8g9dGpvr
    X0Ag8YVQh7gLURCPAXm1_T9OtalZ1od8LoCIDNCcKxTgTkg8S3LzGI>
X-ME-Received: <xmr:8Ny1aU99k6EqMSoBj2VmRq8tXzOrcmbGjRShv_sStGyQPAi97P6Ew-cDEoNFYo42bTLSTRhRCtBim2Wusa_Wm129db2d5SRSs8X9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvleefjeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
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
X-ME-Proxy: <xmx:8Ny1aZQ7Ac3AyjoRB5uxVdmNb9n1sZ1Sn_0uL0Q1aApmJN6n7-1-7A>
    <xmx:8Ny1aeeOIx0S59UKFbXjyBu64keFKsosWDGJJqnCP-wXCnHE1SBScA>
    <xmx:8Ny1abRj8JkiSo2rdx7v8T6n8T-LmZQ643YBVte-XZC3nHni75s--Q>
    <xmx:8Ny1aaID_OLhGHEeFlJVymky7RdOJr08V4erhtSgAuv0EAJo8XHBSQ>
    <xmx:8Ny1aRyQyc5bDy2MlWmLOVMX5GcMuau5902VU-XyQmZ7cJctfy_k8yZL>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Mar 2026 18:10:55 -0400 (EDT)
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
Subject: [PATCH v6 03/12] media: rppx1: Add support for AWB measurement parameters and statistics
Date: Sat, 14 Mar 2026 22:59:35 +0100
Message-ID: <20260314215944.3674865-4-niklas.soderlund+renesas@ragnatech.se>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55805-lists,linux-media=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,messagingengine.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E51A928F36C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Extend the RPPX1 driver to parse parameter blocks configuring for the
auto white balance measurement window and parameters. As well as
producing the measurements as part of a statistics buffer.

This is the first ISP algorithm added to the RPPX1 driver and exercises
both the parameter and statistics API provided by the base driver. It
shows how the RkISP1 parameter and statistics buffer data can be scaled
and adopted to fit the RPPX1 hardware.

It also uses the parameter writing interface which allows the framework
user to specify how (and when) the configuration are applied to the
RPPX1.

As the RkISP1 parameters and statics buffers have lower precision then
the RPPX1 hardware the values needs to be scaled.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |   4 +
 .../platform/dreamchip/rppx1/rpp_stats.c      |   4 +
 .../platform/dreamchip/rppx1/rppx1_wbmeas.c   | 127 ++++++++++++++++++
 3 files changed, 135 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 43e65eb6187d..bc1ade8821cc 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -16,6 +16,7 @@
 
 static const struct v4l2_isp_params_block_type_info
 rkisp1_ext_params_blocks_info[] = {
+	RKISP1_PARAMS_BLOCK_INFO(AWB_MEAS, awb_meas),
 };
 
 int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
@@ -50,6 +51,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		block_offset += block->header.size;
 
 		switch (block->header.type) {
+		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS:
+			module = &rpp->post.wbmeas;
+			break;
 		default:
 			module = NULL;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
index a5daa28e09cf..a6abb85f0df1 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
@@ -11,5 +11,9 @@ void rppx1_stats_fill_isr(struct rppx1 *rpp, u32 isc, void *buf)
 	struct rkisp1_stat_buffer *stats = buf;
 
 	stats->meas_type = 0;
+
+	if (isc & RPPX1_IRQ_ID_POST_AWB_MEAS)
+		if (!rpp_module_call(&rpp->post.wbmeas, stats_rkisp1, &stats->params))
+			stats->meas_type |= RKISP1_CIF_ISP_STAT_AWB;
 }
 EXPORT_SYMBOL_GPL(rppx1_stats_fill_isr);
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c b/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
index 3d197d914d07..126972cfd57a 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
@@ -56,6 +56,133 @@ static int rppx1_wbmeas_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static int
+rppx1_wbmeas_param_rkisp1(struct rpp_module *mod,
+			  const union rppx1_params_rkisp1_config *block,
+			  rppx1_reg_write write, void *priv)
+{
+	const struct rkisp1_ext_params_awb_meas_config *cfg = &block->awbm;
+	/*
+	 * The RkISP params are 8-bit while the RPP can be 8, 20 or 24 bit.
+	 * Figure out how much we need to adjust the input parameters.
+	 */
+	const unsigned int shift = mod->info.wbmeas.colorbits - 8;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + AWB_MEAS_PROP_REG, 0);
+		return 0;
+	}
+
+	/* Program measurement window. */
+	write(priv, mod->base + AWB_MEAS_H_OFFS_REG,
+	      cfg->config.awb_wnd.h_offs);
+	write(priv, mod->base + AWB_MEAS_V_OFFS_REG,
+	      cfg->config.awb_wnd.v_offs);
+	write(priv, mod->base + AWB_MEAS_H_SIZE_REG,
+	      cfg->config.awb_wnd.h_size);
+	write(priv, mod->base + AWB_MEAS_V_SIZE_REG,
+	      cfg->config.awb_wnd.v_size);
+
+	/* Set number of frames to sample. */
+	write(priv, mod->base + AWB_MEAS_FRAMES_REG, cfg->config.frames);
+
+	if (cfg->config.awb_mode == RKISP1_CIF_ISP_AWB_MODE_YCBCR) {
+		write(priv, mod->base + AWB_MEAS_REF_CB_MAX_B_REG,
+		      cfg->config.awb_ref_cb << shift);
+		write(priv, mod->base + AWB_MEAS_REF_CR_MAX_R_REG,
+		      cfg->config.awb_ref_cr << shift);
+		write(priv, mod->base + AWB_MEAS_MAX_Y_REG,
+		      cfg->config.max_y << shift);
+		write(priv, mod->base + AWB_MEAS_MIN_Y_MAX_G_REG,
+		      cfg->config.min_y << shift);
+		write(priv, mod->base + AWB_MEAS_MAX_CSUM_REG,
+		      cfg->config.max_csum << shift);
+		write(priv, mod->base + AWB_MEAS_MIN_C_REG,
+		      cfg->config.min_c << shift);
+
+		/*
+		 * Match RkISP1 conversion, documented as
+		 *  Y = 16 + 0.2500 R + 0.5000 G + 0.1094 B
+		 *  Cb = 128 - 0.1406 R - 0.2969 G + 0.4375 B
+		 *  Cr = 128 + 0.4375 R - 0.3750 G - 0.0625 B
+		 *
+		 * Note map Y to G. Matrix is GBR, not RGB documented for RPPX1.
+		 */
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(0), 0x0800);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(1), 0x01c0);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(2), 0x0400);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(3), 0xfb40);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(4), 0x0700);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(5), 0xfdc0);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(6), 0xfa00);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(7), 0xff00);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(8), 0x0700);
+
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_R_REG, 0x00100000);
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_G_REG, 0x00800000);
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_B_REG, 0x00800000);
+
+		write(priv, mod->base + AWB_MEAS_PROP_REG,
+		      cfg->config.enable_ymax_cmp ? AWB_MEAS_PROP_YMAX : 0 |
+		      AWB_MEAS_PROP_AWB_MODE_ON);
+	} else {
+		/* The RkISP params are oddly named, but do map to RGB. */
+		write(priv, mod->base + AWB_MEAS_REF_CB_MAX_B_REG,
+		      cfg->config.awb_ref_cb << shift);
+		write(priv, mod->base + AWB_MEAS_REF_CR_MAX_R_REG,
+		      cfg->config.awb_ref_cr << shift);
+		write(priv, mod->base + AWB_MEAS_MIN_Y_MAX_G_REG,
+		      cfg->config.min_y << shift);
+
+		/* Values from datasheet to map G to Y, B to Cb and R to Cr. */
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(0), 0x1000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(1), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(2), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(3), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(4), 0x1000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(5), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(6), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(7), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(8), 0x1000);
+
+		/* Values from datasheet. */
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_R_REG, 0x00000000);
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_G_REG, 0x00000000);
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_B_REG, 0x00000000);
+
+		write(priv, mod->base + AWB_MEAS_PROP_REG,
+		      AWB_MEAS_PROP_MEAS_MODE_RGB |
+		      AWB_MEAS_PROP_AWB_MODE_ON);
+	}
+
+	return 0;
+}
+
+static int rppx1_wbmeas_stats_rkisp1(struct rpp_module *mod,
+				     struct rkisp1_cif_isp_stat *stats)
+{
+	struct rkisp1_cif_isp_awb_meas *meas = &stats->awb.awb_mean[0];
+	/*
+	 * The RkISP YCbCr/RGB mean stats are 8-bit while the RPP can be 8, 20
+	 * or 24 bit. Figure out how much we need to adjust the output
+	 * statistics.
+	 */
+	const unsigned int shift = mod->info.wbmeas.colorbits - 8;
+
+	meas->cnt = rpp_module_read(mod, AWB_MEAS_WHITE_CNT_REG);
+	meas->mean_y_or_g =
+		rpp_module_read(mod, AWB_MEAS_MEAN_Y_G_REG) >> shift;
+	meas->mean_cb_or_b =
+		rpp_module_read(mod, AWB_MEAS_MEAN_CB_B_REG) >> shift;
+	meas->mean_cr_or_r =
+		rpp_module_read(mod, AWB_MEAS_MEAN_CR_R_REG) >> shift;
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_wbmeas_ops = {
 	.probe = rppx1_wbmeas_probe,
+	.param_rkisp1 = rppx1_wbmeas_param_rkisp1,
+	.stats_rkisp1 = rppx1_wbmeas_stats_rkisp1
 };
-- 
2.53.0


