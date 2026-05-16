Return-Path: <linux-media+bounces-61828-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ClLOLXeCGp09AMAu9opvQ
	(envelope-from <linux-media+bounces-61828-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 23:16:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C7255DD8B
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 23:16:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55EB13035250
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 21:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9A937F8B8;
	Sat, 16 May 2026 21:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="J6gp1UbG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pFdkbifi"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B1037F8B1;
	Sat, 16 May 2026 21:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778966058; cv=none; b=paFCg5zttLRuA0bnuPvm3VvmG2+0l1ll8RdGsN0L2L6MyEJr304dBZhEWnqEzOdGakoPIGR7sjnWLiEOxOd2n+9WmKcJO4Dp0ohZGm3Fui0HbuN8WmAKHXyY52jvIuxlJjiroMOenxbtrjhNzPA4pViS7DTzSy84rGNWi86UQRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778966058; c=relaxed/simple;
	bh=Fiu/fmAtWLsDezHaV0SO4EZQsRlb4zIq5zskYk76R58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dvhFQ6TzQjSoLIsd8q5nc1usaHF5r4kZGfNg9TAm2SgzNpJsoXvdRuC1JJyLl+tuzoDpSOeTqx27gGDaK0/PbfXkzdXrKhcifhjFiVqUootiMd3vlbMNI6X9L30xm1JtalWmACd5LFV7gj92/cqxTz+Ne7ITGPA2Azf9j0PEMJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=J6gp1UbG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pFdkbifi; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 81D901400093;
	Sat, 16 May 2026 17:14:16 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sat, 16 May 2026 17:14:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778966056;
	 x=1779052456; bh=WOrMCyWnfLkRZzMEvdBU3o7f+7Bhjk3xhTQwhmpTIKo=; b=
	J6gp1UbGqRrUhFu4hOOavQVXCiyIVkgQtQdWwnkdV/68/hdxM/mseAhIPXCGVTXp
	dXPPRJucSs1wXtKIMjZ0AEg77dQjp1aYENV/Qijifsuaf+YOD/ka0m2hPcubbzLt
	maa2M62DuTxI5BjXLldd0yiCy4IjYnPA0GdRvkYqqGbySFXOPgVa/v3CNLW0WqUN
	IfEEaIjoexKS1z7phloQpWC8nBT0ZBXjwFiF+cHyWclnmQyYpRzXLXZSo3oiNsJ8
	oIJ5XIUOnMgp/hdRvH6SC4reREjaqnKHdKDfXPi+FDj5LVOFOrtHDYEiXB2eNbbR
	wwpAtV9AQx/UYIX5e+EsnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778966056; x=
	1779052456; bh=WOrMCyWnfLkRZzMEvdBU3o7f+7Bhjk3xhTQwhmpTIKo=; b=p
	FdkbifiON3S6cn+piRFKrGOUBoE4vA9btL2i/ib0KlnXi2rccH1jrgTYheaVexKU
	ndE9h4Mcf9ueaaNE7wwxHn0dD3PEXIFhHqjxX7TuiIl5+6eUIZiagcApLdgenbLV
	zVnwrxwPMbOm2/8WauNEwWRqMrFgCZFidgoWAyuh67rhUpbHHL304xhoLnobl3Am
	cq+vFyo2/cVrHHKdqUhvKoPuR0YvykX30Y9VlLFe/o4h1zXaOyBYQ+N+gQsxPgRB
	y5Pju5HcEJQBUvT2j6Hn+UCVaUCuDVmTo/QewIGNEfIh27BM3lgxKyDiHqhI4zBU
	bYC+FTn4g8CYrBmEpnN7A==
X-ME-Sender: <xms:KN4IarjN1hvOBSqJzW_A6aFLP7PK6Ipg2jtlvKnTwq2qdPeykGtGQA>
    <xme:KN4IalZQqaC5DQVbE34prVoujqwAJeZertMUJr1nYiTcTon1MMbQ2K1cG7rq_ReSj
    _A_RgMKpYq3QIH0j7IA6leogi-utdCnKP3zuIEJP3LrYvFFq9Hj0Zc>
X-ME-Received: <xmr:KN4IakmJ_uvAeVJ2l5wqReBoosEV6Gl_IRc8r3SFXQMZFWBSgIgBfKzfwoi2roMiLxNW__Mm1rHhUgUXRSUskUjTVU_XydtbVKMS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeegfeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
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
X-ME-Proxy: <xmx:KN4IajjMfpEJ9RsptCLXsNak1oCze3kDPax8FalOMws3ETLvjqoJCg>
    <xmx:KN4IauTJjxTtAXNCKaHBa03_64XWhzQy6e_jzgofg5A4ClcX3fRmZw>
    <xmx:KN4IasYRGr6L74B3iSw77uF2Nu5h5TyI0NDwFVDz1Kud2llsdn68HQ>
    <xmx:KN4IajRIfmphRE6neByxE9nmZV-jpKB_N5vHNJ5Tu2dC2Em0o2JyWg>
    <xmx:KN4IanSaQY9gjajb4Qv8aGrduIgfCIejh7TMk34PZb0QnZ6osdRZrAj1>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 May 2026 17:14:15 -0400 (EDT)
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
Subject: [PATCH v9 06/13] media: rppx1: awbg: Add support for white balance gain settings
Date: Sat, 16 May 2026 23:13:13 +0200
Message-ID: <20260516211320.3041412-7-niklas.soderlund+renesas@ragnatech.se>
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
X-Rspamd-Queue-Id: 56C7255DD8B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	TAGGED_FROM(0.00)[bounces-61828-lists,linux-media=lfdr.de,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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

Extend the RPPX1 driver to allow setting the white balance gain
configuration parameters. It uses the RPPX1 framework for parameters and
its writer abstraction to allow the user to control how, and when,
configuration is applied to the RPPX1.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Co-developed-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 .../platform/dreamchip/rppx1/rpp_module.h     |  1 +
 .../platform/dreamchip/rppx1/rpp_params.c     |  5 +++
 .../platform/dreamchip/rppx1/rppx1_awbg.c     | 32 +++++++++++++++
 .../uapi/linux/media/dreamchip/rppx1-config.h | 40 ++++++++++++++++++-
 4 files changed, 77 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
index 64a1b848f1ea..0e36b717b4ef 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
@@ -47,6 +47,7 @@ void rpp_module_clrset(struct rpp_module *mod, u32 offset, u32 mask, u32 value);
 
 union rppx1_params_block {
 	struct v4l2_isp_block_header header;
+	struct rppx1_awbg_params awbg;
 	struct rppx1_wbmeas_params wbmeas;
 };
 
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 7325abeba92a..17bbcf366970 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -17,6 +17,8 @@
 
 static const struct v4l2_isp_params_block_type_info
 rppx1_ext_params_blocks_info[] = {
+	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
+	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE2, awbg),
 	RPPX1_PARAMS_BLOCK_INFO(WBMEAS_POST, wbmeas),
 };
 
@@ -51,6 +53,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		block_offset += block->header.size;
 
 		switch (block->header.type) {
+		case RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1:
+			module = &rpp->pre1.awbg;
+			break;
 		case RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST:
 			module = &rpp->post.wbmeas;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c b/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
index 4a242b41142b..f30e12d6f880 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
@@ -26,6 +26,38 @@ static int rppx1_awbg_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static int
+rppx1_awbg_fill_params(struct rpp_module *mod,
+		       const union rppx1_params_block *block,
+		       rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_awbg_params *cfg = &block->awbg;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + AWB_ENABLE_REG, 0);
+		return 0;
+	}
+
+	/*
+	 * RPP gains are 18-bit with 12 bit fractional part and 0x1000 = 1.0,
+	 * giving a possible range of 0.0 to 64.0. NOTE: RPP documentation is
+	 * contradictory this is the register definition, the function
+	 * description states 0x400 = 1.0 AND 18-bit with 12 fractional bits,
+	 * which is not possible...
+	 */
+
+	write(priv, mod->base + AWB_GAIN_GR_REG, cfg->gain_green_r);
+	write(priv, mod->base + AWB_GAIN_GB_REG, cfg->gain_green_b);
+	write(priv, mod->base + AWB_GAIN_R_REG, cfg->gain_red);
+	write(priv, mod->base + AWB_GAIN_B_REG, cfg->gain_blue);
+
+	write(priv, mod->base + AWB_ENABLE_REG, AWB_ENABLE_AWB_GAIN_EN);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_awbg_ops = {
 	.probe = rppx1_awbg_probe,
+	.fill_params = rppx1_awbg_fill_params,
 };
diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
index 938f8f258f9e..5ed8a335c9de 100644
--- a/include/uapi/linux/media/dreamchip/rppx1-config.h
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -48,9 +48,15 @@ struct rppx1_window {
  * NOTE: Only append to the enumeration as the numbers are uAPI.
  *
  * @RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST: AWB Measurement Configuration
+ * @RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1: PRE1 pipe White Balance Gains
+ * @RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE2: PRE2 White Balance Gains
+ * @RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST: MAIN_POST White Balance Gains
  */
 enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
+	RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1,
+	RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE2,
+	RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST,
 };
 
 /**
@@ -109,6 +115,35 @@ struct rppx1_wbmeas_params {
 	__u32 ccor_offs[3];
 };
 
+/**
+ * struct rppx1_awbg_params  - WB gain configuration
+ *
+ * The RPP-X1 White Balance Gain module is available in the PRE1 and PRE2
+ * pre-fusion pipes and in the MAIN_POST post-fusion pipe. Userspace selects
+ * which pipe to operate by setting the @header.type field to
+ * RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1, RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE2
+ * or RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST.
+ *
+ * The White Balance module allows to specify per-color channel gains, expressed
+ * as unsigned fixed-point values as 18 bits unsigned integers in Q6.12 format
+ * with a maximum of 63.999.
+ *
+ * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1 or
+ *	    type = RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE2 or
+ *	    type = RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST)
+ * @gain_red: gain for red component, 18-bit (unsigned Q6.12)
+ * @gain_green_r: gain for green component in red lines, 18-bit (unsigned Q6.12)
+ * @gain_blue: gain for blue component, 18-bit (unsigned Q6.12)
+ * @gain_green_b: gain for green component in blue lines, 18-bit (unsigned Q6.12)
+ */
+struct rppx1_awbg_params {
+	struct v4l2_isp_params_block_header header;
+	__u32 gain_red;
+	__u32 gain_green_r;
+	__u32 gain_blue;
+	__u32 gain_green_b;
+};
+
 /**
  * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
  *
@@ -116,7 +151,10 @@ struct rppx1_wbmeas_params {
  * multiple pipes.
  */
 #define RPPX1_PARAMS_MAX_SIZE						\
-	(sizeof(struct rppx1_wbmeas_params))
+	(sizeof(struct rppx1_wbmeas_params)			+	\
+	sizeof(struct rppx1_awbg_params)			+	\
+	sizeof(struct rppx1_awbg_params)			+	\
+	sizeof(struct rppx1_awbg_params))
 
 /* ---------------------------------------------------------------------------
  * Statistics Structures
-- 
2.54.0


