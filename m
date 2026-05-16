Return-Path: <linux-media+bounces-61830-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NEyNQLfCGp09AMAu9opvQ
	(envelope-from <linux-media+bounces-61830-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 23:17:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AE555DDCD
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 23:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 063D73040FA9
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 21:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC67737C933;
	Sat, 16 May 2026 21:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="pE3P2gru";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Blb1KiI/"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C6737F73B;
	Sat, 16 May 2026 21:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778966065; cv=none; b=kmqAZRvjhVXpTQagDjlDIVw10m9nrfeXT1Hf9XD0rpdm0eYQr0mqggILguGzTDAHSlsRuTAedUNENgsudXDD0e3Sgfae2H7L6I5hfH8f4nmkH7nmKUheUUDIJjMRVNr22rq8i490iCBRPkuSg7yj/H0iiOt7xMb751pvbAPbbyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778966065; c=relaxed/simple;
	bh=ZrfaVeEJBK0kaAeQ2RxDZhg9Nr2tn/Ev8CfgjxOM8Xk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GXP34oxRjAbCmSS30pEE21TQ3Ur4xW+E2NKILJq7JdsVgDwtOnu7cBy/TcEeJUYM7HwySPzY43aR73xLViWyOHzS8uojXh0e3andgLQpNhtpPZQ41xy26/vd6CfzOas6j1f/FWjJlY+V+f+WX3GWTzWJmvfTLf/DIdTsKSj2/nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=pE3P2gru; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Blb1KiI/; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 7892DEC00B4;
	Sat, 16 May 2026 17:14:18 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sat, 16 May 2026 17:14:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778966058;
	 x=1779052458; bh=RhujGj17gGpCLzSV/UYOg6Drb1r/5gGKcbPvwBlAyzs=; b=
	pE3P2gru/7ciq65iTEZnot1xXuMy+NQb4LI2qJSjM8y1umYIPvZz8wJL0E977xgd
	eMw83BUQWZdDtyEa5bFQJgt9Ob8IpYiIkO70H5pcDqWaU+c7qQYCr5mGLLdkvcVZ
	lHuLC0ZsGZ6DaPvXtY4bHEtZGrdGCwt7FhbKFRQMiUtymnBNJmLseEVbNbr+L92g
	6zGMCr0vL+3AD3poyZeLI3w86MwfQT+om/3SiFvpfWW27epiHn2OrDvoErOBSqba
	hx0jPRAGm5RfC/7u7kEg07oinvInCaS8eFq3jM5bjN9/xxVZ2lCD3Stp8NzL/d73
	af1GIBfpKKG3vQUKtx3L2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778966058; x=
	1779052458; bh=RhujGj17gGpCLzSV/UYOg6Drb1r/5gGKcbPvwBlAyzs=; b=B
	lb1KiI/uEwaXHuMCSi+2Kaxv/r3iseNARxF3qiKuvwAlSqnWOlS9OWYukAzJDc4m
	mDRPulfhJbomR+jHtB14p+39M3ocUba+DjdYfrFokH1iws2qRjCFDT9F1MPCheOA
	uZXTb+isKBIn9XcS0WZHBDtUx1/Txah+9kIR9PItnLWOAHsI7NH44flHGCUO99Dj
	96Jz3issnXsrjCftw4O6Fil7Nj+jQZPb3FvAs27SSIsln8L5sCzVO7ataba1WsUD
	15qknGY4LDGA1SgVIt8/DIWqcK5zOCe27jukambPSuUFStjn+2AeZVqQ9W5Thxt4
	iapB0vxoRJSUhQ2qt+zRA==
X-ME-Sender: <xms:Kt4IaorqBZtoOpXmAUlUTpIu-QMsjz7qktUOaQHDzqXA8mzGyqTkxw>
    <xme:Kt4IakpQdw5LaXHzHQbVHZ5CS6yuJoEmOHmbq7u2kCizZREbd-pDFJ0XTOH2ep0zp
    c0iTly7d8t2OEMy34lUJGRC-cS5FhMsiav_R_yv9q0rnXiWNiTd0q0>
X-ME-Received: <xmr:Kt4IaoAU6B5PZU1aUcqVq1HnQSXJ5bEHerhTwJ6DPJN82czYtHU0MNHfF3-t9fU2bK3yCeP-jm2BDOsE2WaDLx54E62VGVgC3NuP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeegfeefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:Kt4IaivLrVNQAhllfqCw8eO1WKyTGhZzLsZsuCv13zzS7vpd2lpsuw>
    <xmx:Kt4IanLlpuT16QRNEivbo-1OgCpz-Iijh-jIF-XgTN-F4dDpK2P23w>
    <xmx:Kt4IapajxBAbLqITDLiWMfcHm7XQ97MDz4U9wbCdPwzfcJHVUwxRwg>
    <xmx:Kt4IapCuSKhDFQZ0cotAtJEQH7qW8VtJnuQKJz7n-ixH8AYmNc06ng>
    <xmx:Kt4IaqNSqutcMhY0wqMtWAHXlfm73k2SJdhlVreg-gq0c0Fjt_uGETk_>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 May 2026 17:14:17 -0400 (EDT)
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
Subject: [PATCH v9 07/13] media: rppx1: exm: Add support for exposure measurement
Date: Sat, 16 May 2026 23:13:14 +0200
Message-ID: <20260516211320.3041412-8-niklas.soderlund+renesas@ragnatech.se>
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
X-Rspamd-Queue-Id: 73AE555DDCD
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
	TAGGED_FROM(0.00)[bounces-61830-lists,linux-media=lfdr.de,renesas];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,messagingengine.com:dkim,ideasonboard.com:email,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:dkim]
X-Rspamd-Action: no action

Extend the RPPX1 driver to allow setting the exposure measurement
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
 .../platform/dreamchip/rppx1/rpp_params.c     |   5 +
 .../platform/dreamchip/rppx1/rpp_stats.c      |  10 ++
 .../platform/dreamchip/rppx1/rppx1_exm.c      |  78 ++++++++++-
 .../uapi/linux/media/dreamchip/rppx1-config.h | 121 +++++++++++++++++-
 5 files changed, 213 insertions(+), 3 deletions(-)

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
index 10b899ba201f..1694f2b487fc 100644
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
@@ -27,7 +31,6 @@
 #define EXM_FORCED_UPD_START_LINE_REG	0x0038
 #define EXM_VSTART_STATUS_REG		0x003c
 
-#define EXM_MEAN_REG_NUM		25
 #define EXM_MEAN_REG(n)			(0x0040 + (4 * (n)))
 
 static int rppx1_exm_probe(struct rpp_module *mod)
@@ -47,6 +50,79 @@ static int rppx1_exm_probe(struct rpp_module *mod)
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
+	 * Adjust and set measurement window to hardware limitations,
+	 * - Offsets must be even.
+	 * - Width and height must be divisible by 10.
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
+	/* Return measurements at native hardware precision. */
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
index 5ed8a335c9de..dbc1e116fdf5 100644
--- a/include/uapi/linux/media/dreamchip/rppx1-config.h
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -33,6 +33,36 @@ struct rppx1_window {
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
@@ -51,12 +81,16 @@ struct rppx1_window {
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
@@ -144,6 +178,64 @@ struct rppx1_awbg_params {
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
@@ -154,7 +246,9 @@ struct rppx1_awbg_params {
 	(sizeof(struct rppx1_wbmeas_params)			+	\
 	sizeof(struct rppx1_awbg_params)			+	\
 	sizeof(struct rppx1_awbg_params)			+	\
-	sizeof(struct rppx1_awbg_params))
+	sizeof(struct rppx1_awbg_params)			+	\
+	sizeof(struct rppx1_exm_params)				+	\
+	sizeof(struct rppx1_exm_params))
 
 /* ---------------------------------------------------------------------------
  * Statistics Structures
@@ -171,9 +265,13 @@ struct rppx1_awbg_params {
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
@@ -193,6 +291,23 @@ struct rppx1_wbmeas_stats {
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
@@ -200,6 +315,8 @@ struct rppx1_wbmeas_stats {
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


