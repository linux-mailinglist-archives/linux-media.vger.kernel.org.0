Return-Path: <linux-media+bounces-61826-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PWILy7eCGp09AMAu9opvQ
	(envelope-from <linux-media+bounces-61826-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 23:14:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BF855DCEA
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 23:14:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 25FE93006144
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 21:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1AEE37F8BA;
	Sat, 16 May 2026 21:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="VZzc7Im5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZbJIHGO4"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2FC37CD25;
	Sat, 16 May 2026 21:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778966057; cv=none; b=gB8UYTM9Alxry4rj4F8jUkuFVAAMuuzcDaqAkuVB8yCJfc8I42PHNfChIW/y0P1TabiPp2so9HrYudDnGdgFra6MXQ7GhjisMAv0/yQjRhESevNAOvPILUBXhOceAGTUojkRkyODy8V0+Th6QRBjvUUHcm1dls5EbKHlmNXUXlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778966057; c=relaxed/simple;
	bh=K/CBg+yNayW7IRhaP+n01z+9wR1Jc4MHsn/utHNVzK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s4Ce9UOwf8vKRT8eP9PzJu53muXAZl6LN9Dp71WBtmE9AigHiNQiv2u5U9bdnf51dBls4bD6+hXAUjFQYNjE02Xo7kFdcdoCP+3syRhWUWRZCF3ts5SW5KkEi41MfHpCdCYelLGR8P+csSEQkbcE6u/YRf3ilCnqJw4kVCSm+mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=VZzc7Im5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZbJIHGO4; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 9EA12140002F;
	Sat, 16 May 2026 17:14:14 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 16 May 2026 17:14:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778966054;
	 x=1779052454; bh=GepaXhPajdtwY/zg2KHoe1WpU6HXW4gJ1RlR8C1Tkgw=; b=
	VZzc7Im5Xahfi7h1u2wPVyTZnFtHXP9L+DLwF5Ypz7+GGu6KMo+q/Lx866iO5Nj8
	pOUUMsaOowX2h5R+XzsLL1LDSLKUtVKpGcgjHPLuITAdurp6UHIi3XbF14YYWvwR
	8WeZ56l2tvbnaB+cCaNUrP4pgeh2ola9ZJcD48hU6phIi5Ggs/z/AIEgCgjvysdF
	k+IkMyGREn4eAHOkREUZehua5gfwkswIiHG3EzDlhUIVvRueIVMRnpvNxqFW1fnN
	WSeDy0AzMdE1carUziYIrc3BpCiHybevW6mE4+4S2B0YW6wF4XuW90ZRnKPFoCZ3
	ZaMQ5paWNEiUJ8eloSlokg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778966054; x=
	1779052454; bh=GepaXhPajdtwY/zg2KHoe1WpU6HXW4gJ1RlR8C1Tkgw=; b=Z
	bJIHGO466arERjkGzZ89mJsafGMCajbPxlCUIlAWl+cPDDIOH1wXvhVz/FiGq7O0
	2/XVlk/B+2RctHYTDzqCD3DNGUlThlg786WZbCWarOxeEhCh3leeB4j25kaonzaS
	JfiT0Xk2V3B+H7R6b9f58mPYeOXMrQ4wiKEGzEhPW8gKxCTTsdFZ145S3qVtZ5s3
	pwlt48an66IvzEs3S82Zd7skmU0e7G6gL5DadYZAGCgLNpfUBaZw17ghuG2SQRVw
	3igZxAXYcyhN3O3/sUT4BGpCppZJzK1HcACYcFSieEUCuL9HYZIQYkuOz88H8i/i
	zBfeq/aVjwIIVeBhNvuCA==
X-ME-Sender: <xms:Jt4IanLi41o-NIpzaiRYBnEu9uVjNN-g5I8v7VOgv6wko6GUsnfHog>
    <xme:Jt4IahJOlOal8miXuEvT7mDT2BUc2VST0QlH52hZIJNgmyt-ybqOoWEskWeyal0t4
    -Xi3c4m94uxj20TfFhVg54RHy5pXDPlWtnEQeZ_H7rYTC7iM3_TkjY>
X-ME-Received: <xmr:Jt4IaqjSoZP1znj9rD0YDR0IpFYhvfkZkaBwehdiqc2JYMOuYBKG8BX389qpl6Ahn2aFdan0-FDfQ15B7HLm6I5ZKdRqOiLDNqh0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeegfeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopedutddpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhn
    sghorghrugdrtghomhdprhgtphhtthhopehjrghirdhluhhthhhrrgdorhgvnhgvshgrsh
    esihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepkhhunhhinhhorhhirdhmohhrihhmohhtohdrgh
    igsehrvghnvghsrghsrdgtohhmpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgr
    rhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvg
    guihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgv
    nhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlih
    hnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehn
    ihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrsh
    gv
X-ME-Proxy: <xmx:Jt4IajOye-QN9epQ_B5I-YveWrLp-7F8fjERqdmAmG1WrkWlOtkbvA>
    <xmx:Jt4IatpzQ3V0PFwyp6LPYF8WVL448GMMj1El9XQ5NHPPbmusjvRSDA>
    <xmx:Jt4Iat61PsPGU6djAhKexao5tBm0WFjCxNWoIAD3-X0BZNV8L_gKLg>
    <xmx:Jt4IajgnD513TlxdvkPVa_PUHasee7VAcuDuZDrR0D_sK7nWrLUuWA>
    <xmx:Jt4IassVkn_6uo25EYXMZ-_ZCV6itaNGat1iMde75wa3ViIG3nj24wS3>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 May 2026 17:14:14 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: [PATCH v9 05/13] media: rppx1: wbmeas: Add support for white balance measurement
Date: Sat, 16 May 2026 23:13:12 +0200
Message-ID: <20260516211320.3041412-6-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260516211320.3041412-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260516211320.3041412-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 54BF855DCEA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	TAGGED_FROM(0.00)[bounces-61826-lists,linux-media=lfdr.de,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Extend the RPPX1 driver to allow setting the white balance measurement
configuration and consuming the resulting statistics. It uses the RPPX1
framework for parameters and its writer abstraction to allow the user to
control how, and when, configuration is applied to the RPPX1.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Co-developed-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
* Changes since v8
- Use IS_ERR to check rppx1_init_stats_block() return code.
---
 .../platform/dreamchip/rppx1/rpp_module.h     |   2 +
 .../platform/dreamchip/rppx1/rpp_params.c     |   4 +
 .../platform/dreamchip/rppx1/rpp_stats.c      |  18 +++
 .../platform/dreamchip/rppx1/rppx1_wbmeas.c   | 103 ++++++++++++++++++
 .../uapi/linux/media/dreamchip/rppx1-config.h | 101 ++++++++++++++++-
 5 files changed, 226 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
index e92e77542980..64a1b848f1ea 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
@@ -47,10 +47,12 @@ void rpp_module_clrset(struct rpp_module *mod, u32 offset, u32 mask, u32 value);
 
 union rppx1_params_block {
 	struct v4l2_isp_block_header header;
+	struct rppx1_wbmeas_params wbmeas;
 };
 
 union rppx1_stats_block {
 	struct v4l2_isp_block_header header;
+	struct rppx1_wbmeas_stats wbmeas;
 };
 
 struct rpp_module_ops {
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index af45ad5750b3..7325abeba92a 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -17,6 +17,7 @@
 
 static const struct v4l2_isp_params_block_type_info
 rppx1_ext_params_blocks_info[] = {
+	RPPX1_PARAMS_BLOCK_INFO(WBMEAS_POST, wbmeas),
 };
 
 int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
@@ -50,6 +51,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		block_offset += block->header.size;
 
 		switch (block->header.type) {
+		case RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST:
+			module = &rpp->post.wbmeas;
+			break;
 		default:
 			dev_warn(rpp->dev,
 				 "Not handled RPPX1 block type: 0x%04x\n",
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
index f7eb60deae10..c99ea158abcf 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
@@ -15,6 +15,11 @@
 		.size = sizeof(struct rppx1_ ## block ## _stats), \
 	}
 
+static const struct v4l2_isp_stats_block_type_info
+rppx1_stats_blocks_info[] = {
+	RPPX1_STATS_BLOCK_INFO(WBMEAS_POST, wbmeas),
+};
+
 #define rppx1_init_stats_block(rpp, buf, type)				\
 	((union rppx1_stats_block *)					\
 	v4l2_isp_stats_init_block((rpp)->dev, (buf),			\
@@ -24,5 +29,18 @@
 
 void rppx1_stats_fill_isr(struct rppx1 *rpp, u32 isc, void *buf)
 {
+	struct v4l2_isp_buffer *stats = buf;
+	union rppx1_stats_block *block;
+
+	v4l2_isp_stats_init_buffer(stats, V4L2_ISP_VERSION_V1);
+
+	if (isc & RPPX1_IRQ_ID_POST_AWB_MEAS) {
+		block = rppx1_init_stats_block(rpp, stats,
+					       RPPX1_STATS_BLOCK_TYPE_WBMEAS_POST);
+		if (IS_ERR(block))
+			return;
+
+		rpp_module_call(&rpp->post.wbmeas, fill_stats, block);
+	}
 }
 EXPORT_SYMBOL_GPL(rppx1_stats_fill_isr);
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c b/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
index 60b9c076ec42..f0a943556238 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
@@ -57,6 +57,109 @@ static int rppx1_wbmeas_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static int
+rppx1_wbmeas_fill_params(struct rpp_module *mod,
+			 const union rppx1_params_block *block,
+			 rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_wbmeas_params *cfg = &block->wbmeas;
+	u32 awb_meas_props;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + AWB_MEAS_PROP_REG, 0);
+		return 0;
+	}
+
+	/* Program measurement window. */
+	write(priv, mod->base + AWB_MEAS_H_OFFS_REG, cfg->wnd.h_offs);
+	write(priv, mod->base + AWB_MEAS_V_OFFS_REG, cfg->wnd.v_offs);
+	write(priv, mod->base + AWB_MEAS_H_SIZE_REG, cfg->wnd.h_size);
+	write(priv, mod->base + AWB_MEAS_V_SIZE_REG, cfg->wnd.v_size);
+
+	/* Set number of frames to sample. */
+	write(priv, mod->base + AWB_MEAS_FRAMES_REG, cfg->frames);
+
+	if (cfg->mode == RPPX1_WBMEAS_MODE_YCBCR) {
+		write(priv, mod->base + AWB_MEAS_REF_CB_MAX_B_REG,
+		      cfg->ref_cb_max_b);
+		write(priv, mod->base + AWB_MEAS_REF_CR_MAX_R_REG,
+		      cfg->ref_cr_max_r);
+		write(priv, mod->base + AWB_MEAS_MAX_Y_REG, cfg->max_y);
+		write(priv, mod->base + AWB_MEAS_MIN_Y_MAX_G_REG,
+		      cfg->min_y_max_g);
+		write(priv, mod->base + AWB_MEAS_MAX_CSUM_REG, cfg->max_csum);
+		write(priv, mod->base + AWB_MEAS_MIN_C_REG, cfg->min_c);
+
+		/*
+		 * Program the color conversion matrix coefficients and the
+		 * per-color channel offsets.
+		 */
+		for (unsigned int i = 0; i < 3; i++) {
+			for (unsigned int j = 0; j < 3; j++) {
+				unsigned int index = i * 3 + j;
+
+				write(priv,
+				      mod->base + AWB_MEAS_CCOR_COEFF_REG(index),
+				      cfg->ccor_coeff[i][j]);
+			}
+		}
+
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_R_REG,
+		      cfg->ccor_offs[0]);
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_G_REG,
+		      cfg->ccor_offs[1]);
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_B_REG,
+		      cfg->ccor_offs[2]);
+
+		awb_meas_props = cfg->ymax_cmp ? AWB_MEAS_PROP_YMAX : 0;
+	} else {
+		write(priv, mod->base + AWB_MEAS_REF_CB_MAX_B_REG,
+		      cfg->ref_cb_max_b);
+		write(priv, mod->base + AWB_MEAS_REF_CR_MAX_R_REG,
+		      cfg->ref_cr_max_r);
+		write(priv, mod->base + AWB_MEAS_MIN_Y_MAX_G_REG,
+		      cfg->min_y_max_g);
+
+		/* Bypass color conversion matrix and color offsets. */
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(0), 0x1000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(1), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(2), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(3), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(4), 0x1000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(5), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(6), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(7), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(8), 0x1000);
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_R_REG, 0x00000000);
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_G_REG, 0x00000000);
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_B_REG, 0x00000000);
+
+		awb_meas_props = AWB_MEAS_PROP_MEAS_MODE_RGB;
+	}
+
+	write(priv, mod->base + AWB_MEAS_PROP_REG,
+	      awb_meas_props | AWB_MEAS_PROP_AWB_MODE_ON);
+
+	return 0;
+}
+
+static int rppx1_wbmeas_fill_stats(struct rpp_module *mod,
+				   union rppx1_stats_block *block)
+{
+	struct rppx1_wbmeas_stats *stats = &block->wbmeas;
+
+	/* Return measurements at native hardware precision. */
+	stats->cnt = rpp_module_read(mod, AWB_MEAS_WHITE_CNT_REG);
+	stats->mean_y_or_g = rpp_module_read(mod, AWB_MEAS_MEAN_Y_G_REG);
+	stats->mean_cb_or_b = rpp_module_read(mod, AWB_MEAS_MEAN_CB_B_REG);
+	stats->mean_cr_or_r = rpp_module_read(mod, AWB_MEAS_MEAN_CR_R_REG);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_wbmeas_ops = {
 	.probe = rppx1_wbmeas_probe,
+	.fill_params = rppx1_wbmeas_fill_params,
+	.fill_stats = rppx1_wbmeas_fill_stats
 };
diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
index b4d736d27ebb..938f8f258f9e 100644
--- a/include/uapi/linux/media/dreamchip/rppx1-config.h
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -42,13 +42,81 @@ struct rppx1_window {
  * the larger bitdepth/precision.
  */
 
+/**
+ * enum rppx1_params_block_type - RPP-X1 extensible params block types
+ *
+ * NOTE: Only append to the enumeration as the numbers are uAPI.
+ *
+ * @RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST: AWB Measurement Configuration
+ */
+enum rppx1_params_block_type {
+	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
+};
+
+/**
+ * enum rppx1_wbmeas_mode - AWB measurement mode
+ *
+ * @RPPX1_WBMEAS_MODE_YCBCR: YCbCr measurement mode
+ * @RPPX1_WBMEAS_MODE_RGB: RGB measurement mode
+ */
+enum rppx1_wbmeas_mode {
+	RPPX1_WBMEAS_MODE_YCBCR,
+	RPPX1_WBMEAS_MODE_RGB,
+};
+
+/**
+ * struct rppx1_wbmeas_params - AWB measurement configuration
+ *
+ * The Auto-White Balance measurement module is available on the MAIN_POST pipe.
+ * It supports two measurement modes, selected by the @mode field. The
+ * measurement window is programmed through the @wnd field.
+ *
+ * To support measurement in YCbCr mode a color conversion matrix with
+ * programmable offset is available in the @ccor_coeff and @ccor_offs fields.
+ * The color conversion matrix coefficients are represented as 16 bits signed
+ * Q4.12 numbers ranging from -8 to +7.99. The per-color channel offsets are
+ * represented as 25 bits 2's complement integer numbers ranging from -16777216
+ * to +16777215.
+ *
+ * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST)
+ * @mode: measurement mode (from enum rppx1_wbmeas_mode)
+ * @ymax_cmp: enable Y_MAX compare using @max_y
+ * @wnd: measurement window
+ * @frames: number of frames for mean value calculation (0 = 1 frame)
+ * @ref_cr_max_r: reference Cr or max red value in RGB mode, 24 bits
+ * @ref_cb_max_b: reference Cb or max blue value in RGB mode, 24 bits
+ * @min_y_max_g: luminance minimum value or max green value in RGB mode, 24 bits
+ * @max_y: luminance maximum value, only valid if @mode is set to YCbCr and
+ *	   @ymax_cmp is set to enabled, 24 bits
+ * @max_csum: chrominance sum maximum value, 24 bits
+ * @min_c: chrominance minimum value, 24 bits
+ * @ccor_coeff: coefficients for color conversion matrix, signed 16 bits Q4.6
+ * @ccor_offs: R-G-B color conversion coefficients, signed 25 bits 2's complement
+ */
+struct rppx1_wbmeas_params {
+	struct v4l2_isp_params_block_header header;
+	__u8 mode;
+	__u8 ymax_cmp;
+	struct rppx1_window wnd;
+	__u8 frames;
+	__u32 ref_cr_max_r;
+	__u32 ref_cb_max_b;
+	__u32 min_y_max_g;
+	__u32 max_y;
+	__u32 max_csum;
+	__u32 min_c;
+	__u16 ccor_coeff[3][3];
+	__u32 ccor_offs[3];
+};
+
 /**
  * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
  *
  * Some types are reported twice as the same block might be instantiated in
  * multiple pipes.
  */
-#define RPPX1_PARAMS_MAX_SIZE 0
+#define RPPX1_PARAMS_MAX_SIZE						\
+	(sizeof(struct rppx1_wbmeas_params))
 
 /* ---------------------------------------------------------------------------
  * Statistics Structures
@@ -59,12 +127,41 @@ struct rppx1_window {
  * the larger bitdepth/precision.
  */
 
+/**
+ * enum rppx1_stats_block_type - RPP-X1 extensible stats block types
+ *
+ * NOTE: Only append to the enumeration as the numbers are uAPI.
+ *
+ * @RPPX1_STATS_BLOCK_TYPE_WBMEAS_POST: post-fusion white-balance measurement
+ */
+enum rppx1_stats_block_type {
+	RPPX1_STATS_BLOCK_TYPE_WBMEAS_POST,
+};
+
+/**
+ * struct rppx1_wbmeas_stats - AWB statistics
+ *
+ * @header: block header (type = RPPX1_STATS_BLOCK_TYPE_WBMEAS_POST)
+ * @cnt: Number of pixels matched
+ * @mean_y_or_g: mean Y (or G in RGB mode) value, 24-bit
+ * @mean_cb_or_b: mean Cb (or B in RGB mode) value, 24-bit
+ * @mean_cr_or_r: mean Cr (or R in RGB mode) value, 24-bit
+ */
+struct rppx1_wbmeas_stats {
+	struct v4l2_isp_block_header header;
+	__u32 cnt;
+	__u32 mean_y_or_g;
+	__u32 mean_cb_or_b;
+	__u32 mean_cr_or_r;
+};
+
 /**
  * RPPX1_STATS_MAX_SIZE - Maximum size of all RPP-X1 statistics
  *
  * Some types are reported twice as the same block might be instantiated in
  * multiple pipes.
  */
-#define RPPX1_STATS_MAX_SIZE 0
+#define RPPX1_STATS_MAX_SIZE						\
+	(sizeof(struct rppx1_wbmeas_stats))
 
 #endif /* __UAPI_RPP_X1_CONFIG_H */
-- 
2.54.0


