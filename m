Return-Path: <linux-media+bounces-60227-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEQJGj/z92mjoQIAu9opvQ
	(envelope-from <linux-media+bounces-60227-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 03:15:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4F84B7EED
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 03:15:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 957DF3057D61
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 01:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91DCA1D5ABA;
	Mon,  4 May 2026 01:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="v/X4YP2A";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Fwu5hJSB"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4528C1C2324;
	Mon,  4 May 2026 01:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777856969; cv=none; b=pTj+iV/CfyElAkmoEiiY0mSKy+zkeiJzBr9Ok02f1sPexBqZcjcWSt0GR3YAk6BwgoJ8dHRvlxFTbOzAqn7yO84VfoBJzn8cGyJqXCD/x9Uf6RqG9fpnI/5xNbq6QPuY33GEePcf0USaS5JAT9l+EJMBq01JaJZXS/AYfSSTALU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777856969; c=relaxed/simple;
	bh=xxOlNRhTYS3KW8d2XN+BLjiBVOdj9CFMr4miUr5CH7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bc9EoFOeEQKSmJa33V0w7TOuMEBvIVyJz0JVEsNMeR04UCBAV7YGPjOU2efIDlsvbKcNfdn6SrvEYQ6Zxir0MJFubPbO0BYCFA5zC44DC1JVRc0gG01wMy51LobxYQBublhIUDYbSzsjM5RkrI3imm4Mwc8dvYCd/j4CC3UKkng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=v/X4YP2A; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Fwu5hJSB; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 74D031D000AA;
	Sun,  3 May 2026 21:09:26 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Sun, 03 May 2026 21:09:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777856966;
	 x=1777943366; bh=KO+zXsiDEQdPM69zo1W6+Ooum3g9XlqZXXEyMTfn+7s=; b=
	v/X4YP2Aw+Yydbs/2ECpuwir4K0+6H33IN/8qrvXftUtTWB5btbLPfEnVCd6r+Bt
	TkhYtQerp8SpygkOTXE9/9Hy5w7v85n4LGD7aiRkO1DxXVrZWvgrLaylxgkboHT7
	7KMgR5mcGC1g+Q5rsyj5pa2hKFjSz4PKHnU7QF9pkOQi9ZEW5HzEocioiPdJLJph
	8bMxSKxSI3DVFVPK7LHxnDuqZe/dJjaYN+1VKzO1A13YpXKeNvDhFesWVmH9bwTt
	iB0aZuqYqZt7xVDwdKJVKMrHN0PymWqc5yZ4nsrH6SubLGE7oqWq+thMhxCMlt65
	Hqz9ykQMPWsrROyfDPyNfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777856966; x=
	1777943366; bh=KO+zXsiDEQdPM69zo1W6+Ooum3g9XlqZXXEyMTfn+7s=; b=F
	wu5hJSBGlbKD5IVwKtSs28Uc8LZ8ubDvsCyGQ1ribFeJ2I5amJkvv1wuVFtyitwa
	oSYsoUqI13u95tsP8Vh/8vl+XxWjs5TicFRWXmQKjuZV9F9zsfW39jeivvYLW6/i
	u0gLmxofor6X6XR5bTHSpJUiFMqn4YUixVPdNzLmni0W4kSt7k1X57onLxCMUFH5
	4kjlQlcVWqPqVzY5vL2Rb0yB9/rFB2P5rmrBKeEjMDqhUjMGeRU4qbOI6JG6/A0q
	SSu1Ko9pnS37tFkHRlW1cIsNVvGOUf+0e4z6AT63EtaVu4Lpva+/rwW8JY7ifj1Q
	hQCMljo1fKSaHWltxDnrw==
X-ME-Sender: <xms:xvH3aUa7PIckPYvyQve91k2ibVpwn-1EabwPKOXuR8nwxqANy_ghjQ>
    <xme:xvH3aVYYp1aAwxHSPJyTJfo9HPzu28P3u9_XYjthp2rghX4SRdj-jWGGaBV2UhHf1
    M6wKttW7QAP_k_-Y3wX4Dop9gyH5elSurtSF-LvE4ks8gUBpLvlXcg>
X-ME-Received: <xmr:xvH3aZwJC5zyH7Ao2GJODpMEdbxEKEWyKVmCi0Xpx2mKawPrI-WfoJMjvk2enI76aS_LLs4R5kpS4m0_x0I6kwc1ZaWDd8wnFOmq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeljeegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehjrghirdhluhhthhhrrgdorhgvnhgvshgrshesihgu
    vggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepkhhunhhinhhorhhirdhmohhrihhmohhtohdrghigsehr
    vghnvghsrghsrdgtohhmpdhrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrg
    hsohhnsghorghrugdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghr
    thesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvug
    hirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghn
    vghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgr
    ihdrlhhuthhhrhgrsehiuggvrghsohhnsghorghrugdrtghomh
X-ME-Proxy: <xmx:xvH3aRdQl0FlPPsRSlq6Exb_w0BstFax_q1jP11DCLrZSQhERkc6gA>
    <xmx:xvH3ae6FEDBkDNLPwxo6KVa-4yq4L5mCS5OOQKexzGX86wyKa8fR3A>
    <xmx:xvH3aWJgPY01U7MTMhUeFAho8VM-wjgv8QjWpENpoAIfVTEdv7puug>
    <xmx:xvH3aWxZYBXKm1Sz__PB13X1xOKaPBexs5fo_wmDoxKlDOaj6T9Piw>
    <xmx:xvH3aT9L2BFttGwReL5c0EOLo06EbI8yGGPRe9CqvGi3d0J7qX9yyS9E>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 3 May 2026 21:09:25 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [v8 14/14] media: rppx1: lin: Add support for gamma sensor linearization
Date: Mon,  4 May 2026 03:05:56 +0200
Message-ID: <20260504010556.2796398-15-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504010556.2796398-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260504010556.2796398-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0A4F84B7EED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60227-lists,linux-media=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ragnatech.se:email,ragnatech.se:dkim,ragnatech.se:mid,messagingengine.com:dkim]

From: Jai Luthra <jai.luthra@ideasonboard.com>

Extend the RPPX1 driver to allow setting the gamma sensor linearization
configuration parameters. It uses the RPPX1 framework for parameters and
its writer abstraction to allow the user to control how, and when,
configuration is applied to the RPPX1.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/dreamchip/rppx1/rpp_module.h     |  1 +
 .../platform/dreamchip/rppx1/rpp_params.c     |  5 ++
 .../platform/dreamchip/rppx1/rppx1_lin.c      | 55 +++++++++++++++++++
 .../uapi/linux/media/dreamchip/rppx1-config.h | 48 +++++++++++++++-
 4 files changed, 108 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
index 136ec4d48054..27235fdfb749 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
@@ -86,6 +86,7 @@ void rpp_module_clrset(struct rpp_module *mod, u32 offset, u32 mask, u32 value);
 union rppx1_params_block {
 	struct v4l2_isp_params_block_header header;
 	struct rppx1_bls_params bls;
+	struct rppx1_lin_params lin;
 	struct rppx1_lsc_params lsc;
 	struct rppx1_awbg_params awbg;
 	struct rppx1_bd_params bd;
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index edea25293d64..1995a80890f4 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -18,6 +18,8 @@ static const struct v4l2_isp_block_type_info
 rppx1_ext_params_blocks_info[] = {
 	RPPX1_PARAMS_BLOCK_INFO(BLS_PRE1, bls),
 	RPPX1_PARAMS_BLOCK_INFO(BLS_PRE2, bls),
+	RPPX1_PARAMS_BLOCK_INFO(LIN_PRE1, lin),
+	RPPX1_PARAMS_BLOCK_INFO(LIN_PRE2, lin),
 	RPPX1_PARAMS_BLOCK_INFO(LSC_PRE1, lsc),
 	RPPX1_PARAMS_BLOCK_INFO(LSC_PRE2, lsc),
 	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
@@ -72,6 +74,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		case RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1:
 			module = &rpp->pre1.bls;
 			break;
+		case RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE1:
+			module = &rpp->pre1.lin;
+			break;
 		case RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE1:
 			module = &rpp->pre1.lsc;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_lin.c b/drivers/media/platform/dreamchip/rppx1/rppx1_lin.c
index f595f56a292e..cc8efe3b3f2c 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_lin.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_lin.c
@@ -24,6 +24,11 @@
 #define LIN_B_Y_REG_NUM				17
 #define LIN_B_Y_REG(n)				(0x0098 + (4 * (n)))
 
+#define LIN_PRE1_DEGAMMA_CURVE_MASK		GENMASK(23, 0)
+#define LIN_PRE1_SAMPLE_POINTS_MASK		GENMASK(3, 0)
+#define LIN_PRE2_DEGAMMA_CURVE_MASK		GENMASK(11, 0)
+#define LIN_PRE2_SAMPLE_POINTS_MASK		GENMASK(2, 0)
+
 static int rppx1_lin_probe(struct rpp_module *mod)
 {
 	/* Version check. */
@@ -52,7 +57,57 @@ static int rppx1_lin_start(struct rpp_module *mod,
 	return 0;
 }
 
+static int rppx1_lin_fill_params(struct rpp_module *mod,
+				 const union rppx1_params_block *block,
+				 rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_lin_params *cfg = &block->lin;
+	u8 sample_mask;
+	u32 mask;
+
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + LIN_ENABLE_REG, 0);
+		return 0;
+	}
+
+	switch (cfg->header.type) {
+	case RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE1:
+		mask = LIN_PRE1_DEGAMMA_CURVE_MASK;
+		sample_mask = LIN_PRE1_SAMPLE_POINTS_MASK;
+		break;
+	case RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE2:
+		mask = LIN_PRE2_DEGAMMA_CURVE_MASK;
+		sample_mask = LIN_PRE2_SAMPLE_POINTS_MASK;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	u32 dx_lo = 0;
+	u32 dx_hi = 0;
+
+	for (unsigned int i = 0; i < 8; ++i) {
+		dx_lo |= (cfg->dx[i] & sample_mask) << 4 * i;
+		dx_hi |= (cfg->dx[i + 8] & sample_mask) << 4 * i;
+	}
+
+	write(priv, mod->base + LIN_DX_LO_REG, dx_lo);
+	write(priv, mod->base + LIN_DX_HI_REG, dx_hi);
+
+	for (unsigned int i = 0; i < RPPX1_LIN_DEGAMMA_CURVE_NUM; i++) {
+		write(priv, mod->base + LIN_R_Y_REG(i), cfg->curve_r[i] & mask);
+		write(priv, mod->base + LIN_G_Y_REG(i), cfg->curve_g[i] & mask);
+		write(priv, mod->base + LIN_B_Y_REG(i), cfg->curve_b[i] & mask);
+	}
+
+	if ((cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE))
+		write(priv, mod->base + LIN_ENABLE_REG, LIN_ENABLE_GAMMA_IN_EN);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_lin_ops = {
 	.probe = rppx1_lin_probe,
 	.start = rppx1_lin_start,
+	.fill_params = rppx1_lin_fill_params,
 };
diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
index 0246e9af1d1d..e743e11d11e9 100644
--- a/include/uapi/linux/media/dreamchip/rppx1-config.h
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -95,6 +95,8 @@ enum rppx1_meas_chan {
  * @RPPX1_PARAMS_BLOCK_TYPE_DB_FILTER_POST: Debayer filtering
  * @RPPX1_PARAMS_BLOCK_TYPE_BD_PRE1: PRE1 pipe De-noise Pre-Filter
  * @RPPX1_PARAMS_BLOCK_TYPE_BD_PRE2: PRE2 pipe De-noise Pre-Filter
+ * @RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE1: PRE1 pipe Linearization (Sensor De-gamma)
+ * @RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE2: PRE2 pipe Linearization (Sensor De-gamma)
  */
 enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
@@ -117,6 +119,8 @@ enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_DB_FILTER_POST,
 	RPPX1_PARAMS_BLOCK_TYPE_BD_PRE1,
 	RPPX1_PARAMS_BLOCK_TYPE_BD_PRE2,
+	RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE1,
+	RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE2,
 };
 
 /**
@@ -735,6 +739,46 @@ struct rppx1_bd_params {
 	struct rppx1_bd_nll nll;
 };
 
+/* Linearization (Sensor De-gamma) */
+#define RPPX1_LIN_SAMPLE_POINTS_NUM 16
+#define RPPX1_LIN_DEGAMMA_CURVE_NUM 17
+
+/**
+ * struct rppx1_lin_params - Linearization (Sensor De-gamma) configuration
+ *
+ * The RPP-X1 linearization module is available on the PRE1 and PRE2 pre-fusion
+ * pipes. Userspace selects which pipe to operate by setting the @header.type
+ * field to RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE1 or
+ * RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE2.
+ *
+ * The LIN module applies the per-color channel de-gamma linearization curves
+ * @curve_r, @curve_g and @curve_b defined on the input sampling points @dx.
+ *
+ * For the PRE1 pipe the de-gamma curves values are 24-bits, for the PRE2 pipe
+ * the de-gamma curve values are 12-bits.
+ *
+ * For the PRE1 pipe de-gamma module sampling points @dx values are in the range
+ * [0, 15] (4 bits). For the PRE2 pipe de-gamma module sampling points values
+ * are in the range [0, 7] (3 bits).
+ *
+ * Userspace is expected to provide the curve values and sampling points with a
+ * bit-depth matching the one of pipe in use.
+ *
+ * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE1 or
+ *	    RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE2)
+ * @curve_r: de-gamma linearization curve for red channel
+ * @curve_g: de-gamma linearization curve for green channel
+ * @curve_b: de-gamma linearization curve for blue channel
+ * @dx: input sampling points
+ */
+struct rppx1_lin_params {
+	struct v4l2_isp_params_block_header header;
+	__u32 curve_r[RPPX1_LIN_DEGAMMA_CURVE_NUM];
+	__u32 curve_g[RPPX1_LIN_DEGAMMA_CURVE_NUM];
+	__u32 curve_b[RPPX1_LIN_DEGAMMA_CURVE_NUM];
+	__u8 dx[RPPX1_LIN_SAMPLE_POINTS_NUM];
+};
+
 /**
  * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
  *
@@ -761,7 +805,9 @@ struct rppx1_bd_params {
 	sizeof(struct rppx1_db_demosaic_params)			+	\
 	sizeof(struct rppx1_db_filter_params)			+	\
 	sizeof(struct rppx1_bd_params)				+	\
-	sizeof(struct rppx1_bd_params))
+	sizeof(struct rppx1_bd_params)				+	\
+	sizeof(struct rppx1_lin_params)				+	\
+	sizeof(struct rppx1_lin_params))
 
 /* ---------------------------------------------------------------------------
  * Statistics Structures
-- 
2.54.0


