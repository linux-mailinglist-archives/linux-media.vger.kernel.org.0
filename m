Return-Path: <linux-media+bounces-64624-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Hp9cNPkeK2rn2wMAu9opvQ
	(envelope-from <linux-media+bounces-64624-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 22:47:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F49F6754CA
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 22:47:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=frjIOBdZ;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="E G8p6i1";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64624-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64624-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2934C34105DE
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 20:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 157D84DB55F;
	Thu, 11 Jun 2026 20:42:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC6A4C9555;
	Thu, 11 Jun 2026 20:42:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781210543; cv=none; b=X6rYE1ZHpaUzVIJJscoUx3ALuCB+cWzea/Ynqq1kohhZ28zEmcLqEtUrLbRR/+IUaiqPKklUHSkM4cTYR7rXRweiefgBH45B7uJ9LBMNc17OI8Lfu8mGjKX6iq+6LjuEg3It3b6WX0fDVX8OUFR0unF4OQlzcsKsgfgFqI6iKf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781210543; c=relaxed/simple;
	bh=VgOEGngAIH0aXfvGCNNXhJ+jVpyjPO5+Mpw1q7m83e0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J3OX/da2pNitA4pZl1QjKSSVjFCgnO6Gg7SEoQb5GdXrihsck73Jf+AAryOWLnPPo5rbNTlljhz5LFX6KXPUXGckQzhQn9CBlVqxig9+EjGz1Tc4kDWWN/89Xc+hdh/MDhgQNA5QuhE0OdSANT3pQPyuZ/IJ0VZ/TKdGZZc5Jnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=frjIOBdZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EG8p6i1+; arc=none smtp.client-ip=103.168.172.144
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id B57E3EC0100;
	Thu, 11 Jun 2026 16:42:20 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 11 Jun 2026 16:42:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781210540;
	 x=1781296940; bh=HfglF1sNnytu2DKIF+b4LXuS0v5wwLdxtW9zgiK6AGI=; b=
	frjIOBdZCyuBClt6URMiW06NRMvypmbYm8E3IP+xGQzHy7H8PDR+3XxT5f2sLEUl
	hCBf2tpjRnKkyEfWqIK80XjaY1KbmgR6R1ltxMotCMg4Ri9VgHMq5Gm6u1/jwyjc
	FniIXCxZjVrmHsyLFlhJx14gKBclRwcC5T10vBcWJCzgf7oKz40+Xxn8sK9fazAZ
	M+vb5BbBPc6J09/IuFb9wrPh+5EXuLIi0KeCIzEGm7YLVJmYtDoFJWPfLCcomkzV
	h82ezA4+C6R5GG2GPCWCnd2nneDnqU3wfvEXXNjn8aEYEqDb48s8KzKtHKyL6tMJ
	Yzt2F7dDBQs2Yg6qrjdGzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781210540; x=
	1781296940; bh=HfglF1sNnytu2DKIF+b4LXuS0v5wwLdxtW9zgiK6AGI=; b=E
	G8p6i1+kZnNdkIiqthJV2+zphDrnN01CeRq2vohSSI8xeG2VC8NOKCnqMJuTBo/K
	1Pzr2PHxb8LbwCuaA3K1ZC6VUM2mR9xe1ZJ5KT01Z1v9mBeJ3UewzvgeWTM7ipg7
	GNwm02VQ18ABkDZfXOgC/vbVcalPbaubf3vtQl4QdNOpoFdrE94fX4BmT8hSiVS5
	wuhTKGtWgx2Cq2XeR1sC4GIB5QpvNGkcux2QAzQs8PC6RyEm2LGAk/dmUHdRn9Gn
	UnDSywgQkSzrXMx/kzN1aPjjBfj+bt2KCeVhmpuwD78dzcsRZ6SDJfojmbcplHnS
	LFKi38tbJR45kPMBW+nHQ==
X-ME-Sender: <xms:rB0rauEmHxWJbM7ZUsOZ7-KnozpaBBhjnm8pv83_0ZvccpRnAuT1ug>
    <xme:rB0ralUroMn_exIOc14a4RgXeLE5lBtW3ps5LwWKcPecT-AO1GiFVjkUM2gcnDs5H
    zKjlSs-jM7w1mkiq4OCRIYvZgIKIxiP8qUKzzij88fAF4M7E5Amy1M>
X-ME-Received: <xmr:rB0rai86Pfy0fKudnwAjPJ-icN5H8_zarECTC36GyiY3-89DOmlXeSwZ-O5nW8fcGrE2rpX8wVVA3EHmEEOnbcbmxOwW>
X-ME-Proxy-Cause: dmFkZTGxElkQpZKuuZIqkKBJAFdRhkHm/9iYIJMf9OZbtUFKoFmvg3oWFyWDIgyTOM0Jba
    2Q6bwItLaOYA3kzoPcZe/N+kpo9DXAwczNA0VXwrjxbGx0lD2XXXlr3nsZMZb0xS4b6XXe
    I6iW3031atpYYSTEncWcwXnzdf5jCUyIHlKnUqoQN2MsRbIrSh4OQDyLy/jJRFPtBa7IF5
    rIOcFVsNMhucIeQfJcSDZj21MW0HM2+2r1mEWmR9Me0JkGW3nVOb6+uq0O8fbWZgX4+nsR
    HEtMRdZF7zaasRzz6Vm4jiAnpbSpUdOkuebJWUCyBz9msAxYj7jERII9BhifZnQbpsjJZe
    0CdU6B719I6UEIipPbrclYf9hvy0S25FqiTnknDDJHpTUNsteEH5RVJKdW/c4NjTWn7ook
    QwV1K6eo+mSItXzOftygg7slLsg2v8zIqGbvAMqDCK3z16W47BvcRHEsi0YJupXlcahdMV
    pW6+0NI8zLDdlhD7JtS2mhWIgiqMWTs2GwcSRLtyaF8tLvlXPtvL16x9RyNNSklTXY3Tp7
    iS+GRlBApSE932G/qRvTd0x0OsMROcxGetw6NiOq9zCeZcmm5Xwbk3Jc6cm0baQsd4pBLq
    Kt/EtrheTEJgppFh23Ee4DeD6u0S5ph0HHznmJIK4mxPLKz8WDtpNydaWHHQ
X-ME-Proxy: <xmx:rB0raq4QHpC-8a78dyUPQGv4chePj5rMpEydCBnybQe_fnXTltd1vg>
    <xmx:rB0rajkwrC3awLDT_mFGoQLk4f9XFt83mNvrqyJgbRg0jsk8tZynhA>
    <xmx:rB0ralFEqGpqmpqNFE9j0KptvD_eGIR6Cb49xLKqPaPPwOck6Weiuw>
    <xmx:rB0rai8gAMf-G-xkQMXXGwiAcMTT3n-S9lCmiTTQ37UWRHMoaFEsQw>
    <xmx:rB0rajKGX6FikC84JrtxwmVp126Mlw8tBaYsd7ihVHGgVRWPav2jIwb1>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Jun 2026 16:42:20 -0400 (EDT)
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
Subject: [PATCH v10 07/13] media: rppx1: exm: Add support for exposure measurement
Date: Thu, 11 Jun 2026 22:41:42 +0200
Message-ID: <20260611204148.1423192-8-niklas.soderlund+renesas@ragnatech.se>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64624-lists,linux-media=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:jai.luthra+renesas@ideasonboard.com,m:mchehab@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:jacopo.mondi+renesas@ideasonboard.com,m:jai.luthra@ideasonboard.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,ideasonboard.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3F49F6754CA

Extend the RPPX1 driver to allow setting the exposure measurement
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
* Changes since v9
- Update comment and drop a one that is now out-dated.

* Changes since v8
- Use IS_ERR to check rppx1_init_stats_block() return code.
---
 .../platform/dreamchip/rppx1/rpp_module.h     |   2 +
 .../platform/dreamchip/rppx1/rpp_params.c     |   5 +
 .../platform/dreamchip/rppx1/rpp_stats.c      |  10 ++
 .../platform/dreamchip/rppx1/rppx1_exm.c      |  76 +++++++++++
 .../uapi/linux/media/dreamchip/rppx1-config.h | 121 +++++++++++++++++-
 5 files changed, 212 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
index 0e36b717b4ef..e968ec67b9f5 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
@@ -48,11 +48,13 @@ void rpp_module_clrset(struct rpp_module *mod, u32 offset, u32 mask, u32 value);
 union rppx1_params_block {
 	struct v4l2_isp_block_header header;
 	struct rppx1_awbg_params awbg;
+	struct rppx1_exm_params exm;
 	struct rppx1_wbmeas_params wbmeas;
 };
 
 union rppx1_stats_block {
 	struct v4l2_isp_block_header header;
+	struct rppx1_exm_stats exm;
 	struct rppx1_wbmeas_stats wbmeas;
 };
 
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 17bbcf366970..8c0f45e8066a 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -19,6 +19,8 @@ static const struct v4l2_isp_params_block_type_info
 rppx1_ext_params_blocks_info[] = {
 	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
 	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE2, awbg),
+	RPPX1_PARAMS_BLOCK_INFO(EXM_PRE1, exm),
+	RPPX1_PARAMS_BLOCK_INFO(EXM_PRE2, exm),
 	RPPX1_PARAMS_BLOCK_INFO(WBMEAS_POST, wbmeas),
 };
 
@@ -56,6 +58,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		case RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1:
 			module = &rpp->pre1.awbg;
 			break;
+		case RPPX1_PARAMS_BLOCK_TYPE_EXM_PRE1:
+			module = &rpp->pre1.exm;
+			break;
 		case RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST:
 			module = &rpp->post.wbmeas;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
index c99ea158abcf..388c758d805d 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
@@ -17,6 +17,7 @@
 
 static const struct v4l2_isp_stats_block_type_info
 rppx1_stats_blocks_info[] = {
+	RPPX1_STATS_BLOCK_INFO(EXM_PRE1, exm),
 	RPPX1_STATS_BLOCK_INFO(WBMEAS_POST, wbmeas),
 };
 
@@ -34,6 +35,15 @@ void rppx1_stats_fill_isr(struct rppx1 *rpp, u32 isc, void *buf)
 
 	v4l2_isp_stats_init_buffer(stats, V4L2_ISP_VERSION_V1);
 
+	if (isc & RPPX1_IRQ_ID_PRE1_EXM) {
+		block = rppx1_init_stats_block(rpp, stats,
+					       RPPX1_STATS_BLOCK_TYPE_EXM_PRE1);
+		if (IS_ERR(block))
+			return;
+
+		rpp_module_call(&rpp->pre1.exm, fill_stats, block);
+	}
+
 	if (isc & RPPX1_IRQ_ID_POST_AWB_MEAS) {
 		block = rppx1_init_stats_block(rpp, stats,
 					       RPPX1_STATS_BLOCK_TYPE_WBMEAS_POST);
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_exm.c b/drivers/media/platform/dreamchip/rppx1/rppx1_exm.c
index 1dccb110d3e9..c7b24c356222 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_exm.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_exm.c
@@ -11,10 +11,14 @@
 #define EXM_START_REG			0x0004
 
 #define EXM_CTRL_REG			0x0008
+#define EXM_CTRL_EXM_AUTOSTOP		BIT(1) /* HW doc says not supported. */
 #define EXM_CTRL_EXM_UPDATE_ENABLE	BIT(0)
 
 #define EXM_MODE_REG			0x000c
+
 #define EXM_CHANNEL_SEL_REG		0x0010
+#define EXM_CHANNEL_SEL_CHANNEL_SELECT_MASK	GENMASK(2, 0)
+
 #define EXM_LAST_MEAS_LINE_REG		0x0014
 #define EXM_COEFF_R_REG			0x0018
 #define EXM_COEFF_G_GR_REG		0x001c
@@ -46,6 +50,78 @@ static int rppx1_exm_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static int
+rppx1_exm_fill_params(struct rpp_module *mod,
+		      const union rppx1_params_block *block,
+		      rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_exm_params *cfg = &block->exm;
+	u32 h_offs, v_offs, h_size, v_size;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + EXM_MODE_REG, 0);
+		return 0;
+	}
+
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
+	write(priv, mod->base + EXM_COEFF_R_REG, cfg->coeff_r);
+	write(priv, mod->base + EXM_COEFF_G_GR_REG, cfg->coeff_g_gr);
+	write(priv, mod->base + EXM_COEFF_GB_REG, cfg->coeff_gb);
+	write(priv, mod->base + EXM_COEFF_B_REG, cfg->coeff_b);
+
+	/* Select sample point */
+	write(priv, mod->base + EXM_CHANNEL_SEL_REG,
+	      cfg->channel_sel & EXM_CHANNEL_SEL_CHANNEL_SELECT_MASK);
+
+	/*
+	 * Adjust and set measurement window,
+	 * - Offsets must be even.
+	 * - Width and height must be even and divisible in 5 windows.
+	 */
+	h_offs = cfg->wnd.h_offs & 0x1ffe;
+	v_offs = cfg->wnd.v_offs & 0x1ffe;
+	h_size = (cfg->wnd.h_size - 1) - ((cfg->wnd.h_size - 1) % 10);
+	v_size = (cfg->wnd.v_size - 1) - ((cfg->wnd.v_size - 1) % 10);
+
+	write(priv, mod->base + EXM_H_OFFS_REG, h_offs);
+	write(priv, mod->base + EXM_V_OFFS_REG, v_offs);
+	write(priv, mod->base + EXM_H_SIZE_REG, h_size / 5);
+	write(priv, mod->base + EXM_V_SIZE_REG, v_size / 5);
+
+	/*
+	 * Set last measurement line for ready interrupt. Ignore the value
+	 * from the parameters as it is only useful for fast-channel switching.
+	 */
+	write(priv, mod->base + EXM_LAST_MEAS_LINE_REG, v_offs + v_size + 1);
+
+	write(priv, mod->base + EXM_START_REG, 1);
+
+	return 0;
+}
+
+static int rppx1_exm_fill_stats(struct rpp_module *mod,
+				union rppx1_stats_block *block)
+{
+	struct rppx1_exm_stats *stats = &block->exm;
+
+	for (unsigned int i = 0; i < RPPX1_EXM_NUM_WIN; i++)
+		stats->exp_mean[i] = rpp_module_read(mod, EXM_MEAN_REG(i));
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_exm_ops = {
 	.probe = rppx1_exm_probe,
+	.fill_params = rppx1_exm_fill_params,
+	.fill_stats = rppx1_exm_fill_stats,
 };
diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
index 47a86aeaccf2..aac10165be83 100644
--- a/include/uapi/linux/media/dreamchip/rppx1-config.h
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -32,6 +32,36 @@ struct rppx1_window {
 	__u16 v_size;
 };
 
+/**
+ * enum rppx1_meas_chan - Measurement point for the Histogram and EXM Modules
+ *
+ * Measurement points for the RPP-X1 Histogram measurement module and Exposure
+ * measurement module.
+ *
+ * All tap points are available for the PRE1/PRE2 pipes. Only
+ * RPPX1_MEAS_CHAN_SEL4 and RPPX1_MEAS_CHAN_SEL7 are available for the
+ * MAIN_POST pipe.
+ *
+ * @RPPX1_MEAS_CHAN_SEL0: after input acquisition
+ * @RPPX1_MEAS_CHAN_SEL1: after black level subtraction
+ * @RPPX1_MEAS_CHAN_SEL2: after sensor gamma linearization
+ * @RPPX1_MEAS_CHAN_SEL3: after lens shading correction
+ * @RPPX1_MEAS_CHAN_SEL4: after auto white balance gains
+ * @RPPX1_MEAS_CHAN_SEL5: after defect pixel correction
+ * @RPPX1_MEAS_CHAN_SEL6: after denoise pre-filter
+ * @RPPX1_MEAS_CHAN_SEL7: after demosaicing
+ */
+enum rppx1_meas_chan {
+	RPPX1_MEAS_CHAN_SEL0,
+	RPPX1_MEAS_CHAN_SEL1,
+	RPPX1_MEAS_CHAN_SEL2,
+	RPPX1_MEAS_CHAN_SEL3,
+	RPPX1_MEAS_CHAN_SEL4,
+	RPPX1_MEAS_CHAN_SEL5,
+	RPPX1_MEAS_CHAN_SEL6,
+	RPPX1_MEAS_CHAN_SEL7,
+};
+
 /* ---------------------------------------------------------------------------
  * Parameter Structures
  *
@@ -50,12 +80,16 @@ struct rppx1_window {
  * @RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1: PRE1 pipe White Balance Gains
  * @RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE2: PRE2 White Balance Gains
  * @RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST: MAIN_POST White Balance Gains
+ * @RPPX1_PARAMS_BLOCK_TYPE_EXM_PRE1: PRE1 pipe Exposure Measurement
+ * @RPPX1_PARAMS_BLOCK_TYPE_EXM_PRE2: PRE2 pipe Exposure Measurement
  */
 enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
 	RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1,
 	RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE2,
 	RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST,
+	RPPX1_PARAMS_BLOCK_TYPE_EXM_PRE1,
+	RPPX1_PARAMS_BLOCK_TYPE_EXM_PRE2,
 };
 
 /**
@@ -143,6 +177,64 @@ struct rppx1_awbg_params {
 	__u32 gain_green_b;
 };
 
+/**
+ * enum rppx1_exm_mode - Exposure measurement mode
+ *
+ * Exaposure measurement mode selection (RGB/Bayer).
+ *
+ * @RPPX1_EXP_MEASURING_MODE_DISABLED: no measurement
+ * @RPPX1_EXP_MEASURING_MODE_RGB: Y/R/G/B measurement
+ * @RPPX1_EXP_MEASURING_MODE_BAYER: Bayer RGB measurement
+ */
+enum rppx1_exm_mode {
+	RPPX1_EXP_MEASURING_MODE_DISABLED,
+	RPPX1_EXP_MEASURING_MODE_RGB,
+	RPPX1_EXP_MEASURING_MODE_BAYER,
+};
+
+/**
+ * struct rppx1_exm_params - Exposure measurement configuration
+ *
+ * The RPP-X1 Exposure measurement unit is available on the PRE1 and PRE2
+ * pre-fusion pipes. Userspace selects which pipe to operate by setting
+ * the @header.type field to RPPX1_PARAMS_BLOCK_TYPE_EXM_PRE1 or
+ * RPPX1_PARAMS_BLOCK_TYPE_EXM_PRE2.
+ *
+ * Exposure measurement is performed in the RGB or Bayer domain, according to
+ * the setting of the @mode field. The exposure measurement tap point is
+ * selected according to the value of @channel_sel.
+ *
+ * The exposure measurement is performed on an input window specified in @wnd.
+ * To each color component a programmable weight coefficient is associated.
+ * Coefficients are represented as unsigned 8 bits integer values in Q1.7 format
+ * ranging from 0 to 1.992.
+ *
+ * The @last_line fields controls when the exposure measurement completes. It
+ * is usually programmed to the value of (@wnd.v_offs + @wnd.v_size + 1).
+ *
+ * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_EXM_PRE1 or
+ *	    type = RPPX1_PARAMS_BLOCK_TYPE_EXM_PRE2)
+ * @mode: exposure measure mode (from enum rppx1_exm_mode)
+ * @channel_sel: exposure measurement point (see enum rppx1_meas_chan)
+ * @last_line: line number for which the exposure measurement completes
+ * @wnd: measurement window coordinates
+ * @coeff_r: coefficient for the red Bayer sample or red color channel, Q1.7
+ * @coeff_g_gr: coefficient for the green/red Bayer sample or green color channel, Q1.7
+ * @coeff_b: coefficient for the blue Bayer sample or blue color channel, Q1.7
+ * @coeff_gb: coefficient for the green/blue Bayer sample, unused in RGB mode, Q1.7
+ */
+struct rppx1_exm_params {
+	struct v4l2_isp_params_block_header header;
+	__u32 mode;
+	__u8 channel_sel;
+	__u32 last_line;
+	struct rppx1_window wnd;
+	__u8 coeff_r;
+	__u8 coeff_g_gr;
+	__u8 coeff_b;
+	__u8 coeff_gb;
+};
+
 /**
  * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
  *
@@ -153,7 +245,9 @@ struct rppx1_awbg_params {
 	(sizeof(struct rppx1_wbmeas_params)			+	\
 	sizeof(struct rppx1_awbg_params)			+	\
 	sizeof(struct rppx1_awbg_params)			+	\
-	sizeof(struct rppx1_awbg_params))
+	sizeof(struct rppx1_awbg_params)			+	\
+	sizeof(struct rppx1_exm_params)				+	\
+	sizeof(struct rppx1_exm_params))
 
 /* ---------------------------------------------------------------------------
  * Statistics Structures
@@ -170,9 +264,13 @@ struct rppx1_awbg_params {
  * NOTE: Only append to the enumeration as the numbers are uAPI.
  *
  * @RPPX1_STATS_BLOCK_TYPE_WBMEAS_POST: post-fusion white-balance measurement
+ * @RPPX1_STATS_BLOCK_TYPE_EXM_PRE1: pre-fusion pipe1 exposure measurement
+ * @RPPX1_STATS_BLOCK_TYPE_EXM_PRE2: pre-fusion pipe2 exposure measurement
  */
 enum rppx1_stats_block_type {
 	RPPX1_STATS_BLOCK_TYPE_WBMEAS_POST,
+	RPPX1_STATS_BLOCK_TYPE_EXM_PRE1,
+	RPPX1_STATS_BLOCK_TYPE_EXM_PRE2,
 };
 
 /**
@@ -192,6 +290,23 @@ struct rppx1_wbmeas_stats {
 	__u32 mean_cr_or_r;
 };
 
+/* Exposure Measurement */
+#define RPPX1_EXM_NUM_WIN 25
+
+/**
+ * struct rppx1_exm_stats - Exposure measurement
+ *
+ * RPP-X1 exposure measurement calculates the mean value on 25 programmable
+ * windows on the input picture.
+ *
+ * @header: block header (type = RPPX1_STATS_BLOCK_TYPE_EXM_PRE1)
+ * @exp_mean: mean luminance values per block, up to 20-bit
+ */
+struct rppx1_exm_stats {
+	struct v4l2_isp_block_header header;
+	__u32 exp_mean[RPPX1_EXM_NUM_WIN];
+};
+
 /**
  * RPPX1_STATS_MAX_SIZE - Maximum size of all RPP-X1 statistics
  *
@@ -199,6 +314,8 @@ struct rppx1_wbmeas_stats {
  * multiple pipes.
  */
 #define RPPX1_STATS_MAX_SIZE						\
-	(sizeof(struct rppx1_wbmeas_stats))
+	(sizeof(struct rppx1_wbmeas_stats)			+	\
+	sizeof(struct rppx1_exm_stats)				+	\
+	sizeof(struct rppx1_exm_stats))
 
 #endif /* __UAPI_RPP_X1_CONFIG_H */
-- 
2.54.0


