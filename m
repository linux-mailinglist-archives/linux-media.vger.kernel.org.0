Return-Path: <linux-media+bounces-64621-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pzBkEe0dK2qs2wMAu9opvQ
	(envelope-from <linux-media+bounces-64621-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 22:43:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7639C67540D
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 22:43:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=Lnnyx+k1;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="X ULCf3Z";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64621-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64621-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 12E3930257AE
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 20:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E40F44D90CC;
	Thu, 11 Jun 2026 20:42:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9565F397347;
	Thu, 11 Jun 2026 20:42:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781210539; cv=none; b=ana9anUa307AV29SLRLOIUzP4fixdAyAhx/FXNZOxkMmhrDz/lukFqWIxGf1b2T4XAGDQmAVFsjsFTQR0x+G8XW0m/kDxK9ClrixDAlOvyCXxEZSHmiYeJ6QIHQj4h5c3nkh6YlsCbF7YTGUxW+RjfGyJf1Ijl8e42wutFdkD4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781210539; c=relaxed/simple;
	bh=srlZjpS8YCVmWQc/6/etzA33jyaPAex4BjRO61rFltA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qNM1koLJtVrSvwaCFckgo48YvcOBYvOmpN7tOW7i8qv1Sk8lbHQ8ZRGfj/lOPL+XaN7b+bbvM5OZ7R0e1IjGzpks3mpmSbTu7zxisq0ukJcTt5kPCCehGlM19/xVU6OH6xSEVKL+n8Eb6wvcUM8LkzruQsDorKwWEsjgvIGKYeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Lnnyx+k1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XULCf3Z3; arc=none smtp.client-ip=103.168.172.152
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DAC521400081;
	Thu, 11 Jun 2026 16:42:16 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 11 Jun 2026 16:42:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781210536;
	 x=1781296936; bh=17msbLdPdI9bCO6+lrlmRTF0Ot1kv+kAJHDG7nr6Bq8=; b=
	Lnnyx+k11UXAVj4vNhQVVQVhMfhfuApJ5/EJHIyot7MVhaGcx+u1fsusnLkr3LJH
	RSZbrPZ4UDE9OJMZqdLPPeG4iw+L/YWBKCHDMl/V5r1iLjamJvRSourfDYKdL6k/
	5VaFBjDczhFTxaU6uqFsSE3/KSBGyLzaAJi1lSO5OUJWd/w1EAJ7iO4DsJaStEyV
	6Kjsal6kO1gG25Ga8vt54fUxKXN4rNrw94Ryt7cpDA8AkuK6UcEA8MtpBFlrNq3d
	HacJ4A/WN9m4jmjD4hkJvQinzWTW+UxE9JWcrWYa1Mmr/9MFP7PUXkuHLPbWQepD
	zsyWrBpCPjA0G+zNfWEK9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781210536; x=
	1781296936; bh=17msbLdPdI9bCO6+lrlmRTF0Ot1kv+kAJHDG7nr6Bq8=; b=X
	ULCf3Z34hCcH+LE+A/EtFaBSBIy+yOsZwFoDUywyumCHfJ4a9sD97EHQE+TjlKL0
	WpkDuE8Kqc77yyxWkn6iYNdjzF37rD0/9SQ7R11fC/8TBXmezY2yItnqdlKP2R1h
	2r+qqRrcnU9RSMtrTwdRVvBTYHeHNebn6kzyQFlkWG/PAD43rfGA0/JgpdjDLb2l
	Ke2hCnv/4BFhTtlwl36zgrS89nzoUumTQHZBcfwEJOWRfeZ3FEg5e2+We7me0+vJ
	MW+TQ4qQ09amI3Gf3YmkF2qQLdXq0RuQ2wB8ZXpEv347Xn6lcn5OcegydcuvGQ6g
	XiCs5RcWBWVMELaHA0Mqw==
X-ME-Sender: <xms:qB0rasCrUgSVOLOWGwiz9DqtsiFHsizDDsZxYyr7RCN4itZGsqp7yw>
    <xme:qB0rakgYhMs1qfZmVLXV_N-Wr3FPVcYl-QGQ_ekWgllThhxU2HwN4ITx5SnP9XyUs
    9T-_r02737L9652PLPbcy-6_T31IrbDl5VC0j3z8R4OKMOWa5YHqx3p>
X-ME-Received: <xmr:qB0raqZvL7sxlisyR0CeFX2bBscm8oJ0MTwW1tEq36ARy_aYL0ImYPFo42mqg4_KLZNBHWyb1MtWyPXNP-AWu_Cl-eX0>
X-ME-Proxy-Cause: dmFkZTGTwJp0D3nyprng9f+ehyN+U4VV3MOe5/cdH2A5qA/R9Ky1QdhqFluVFv9t9K1PqO
    d46xy08QaJjHyS5c59wsiACPu8imV1juPGXo/cmfrwGuYk523Skor7nnOYakFru4NnykAC
    xzNGbgE2sHBbOHUC4l2NGJpAFTRChAVssbC/rx5sCdBojwu+s0UAX9qR0T9Er+xzyH7ibV
    Y2tUOqaYCAVxPqYvGj2WmubZa3QEk8z8DzCrDdR5IDamHf1qX4GxlGuF8Tu8+GGHcGjsOc
    TXMF0jHVRMNdt52NYa5uuUlAr+ssgLiG8Ph/oCak6VeTZu2Hn5H5xPKodOk69frGJXZ0Vy
    lVhkJchj6jMpRVfXkEnACUjEr4t123D6E5ZDs+Pv7kmaWzGMHDmY8nMGyVvSGDFYO/n1Ci
    JqtnRGMmjdC/W+gnb1BAXoB108jqfpoTn/YaRS9hwKcOahqdQf2k6OllfDNmiytoXWM+Yv
    fsI8HqFCBZMZksq3r3JYfVtEalmpKsmEc/3qI/56mnT1YiABKCvuMf4aFtXb3ae+F3nYeo
    TM+eQTpa5Yld+TiXVVfl3KTvAaEHlRvHqumJ5DtBWxL4dIx5UdYgG0znkTbQlejCfXbTRs
    C6SEAl3ofKbCLMXBeTrhTU0BD/FNfQOX/l1fLRDfk+RpFZHX2prWzqpKII5w
X-ME-Proxy: <xmx:qB0ralm--_SSU_RHAfOL_VDS59qhPAACRgzUe9NzayyqtsjVi3egCg>
    <xmx:qB0ragjEuq1yUXAmsqtR29jr4AxK1A-q2u6SoPL6ZBwhlOet9c6GiA>
    <xmx:qB0ranQtfc53w674lLc-rdg--4xOz_HC0nNfmkcVAx3mH_b0XRCigw>
    <xmx:qB0rahbWYNitxAeMYkg0Cb5HmbI9Iz6vLuUPliLl5xqg5K6BgGq1uA>
    <xmx:qB0raokCC-pmG3VDGR210J9tqQk9vppOiips41XSltMJQu6qd9uCVXTL>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Jun 2026 16:42:16 -0400 (EDT)
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
Subject: [PATCH v10 05/13] media: rppx1: wbmeas: Add support for white balance measurement
Date: Thu, 11 Jun 2026 22:41:40 +0200
Message-ID: <20260611204148.1423192-6-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611204148.1423192-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260611204148.1423192-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64621-lists,linux-media=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:jai.luthra+renesas@ideasonboard.com,m:mchehab@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:jacopo.mondi+renesas@ideasonboard.com,m:jai.luthra@ideasonboard.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,ideasonboard.com:email,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7639C67540D

Extend the RPPX1 driver to allow setting the white balance measurement
configuration and consuming the resulting statistics. It uses the RPPX1
framework for parameters and its writer abstraction to allow the user to
control how, and when, configuration is applied to the RPPX1.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Co-developed-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
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
index 1f2548db73ad..d33abab05a0f 100644
--- a/include/uapi/linux/media/dreamchip/rppx1-config.h
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -41,13 +41,81 @@ struct rppx1_window {
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
@@ -58,12 +126,41 @@ struct rppx1_window {
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


