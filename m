Return-Path: <linux-media+bounces-55813-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOSGJGjetWlT6AAAu9opvQ
	(envelope-from <linux-media+bounces-55813-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 23:17:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEB828F482
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 23:17:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5387D30C296E
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 22:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C01138C2B8;
	Sat, 14 Mar 2026 22:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Mw0NwqaM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LOllSiLY"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA58038A712;
	Sat, 14 Mar 2026 22:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773526276; cv=none; b=ccOmDSmx9vZgE6S5CZYIOYMJHmW8kaurhZ7MqCvVEQWe54DHFunGr5M1o1VXAk/WYWop7D3u+37svpxQlgV1oWF01+Z/iBCh+Ovqi7NDPX5lFKbeWcrr8oBS0pCZE9f/hgl3W1MNc6wAOaPwXSABmxHAZp5C8KNZO9DbG4CHfnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773526276; c=relaxed/simple;
	bh=IO7eSaokJHwbLqzGDmMMkYowFFDw2IuIKGfoML5SrTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=akhO55WMdZBMiKFoiAAfQLcNhDJGTyGYW15c+ExXqnQ/07Yg9TXb9MVXEtJLHth/ZqSnMz1rOn8pptsio60hs9ayAZwNMr3GQNE4Qw7T1bZtHdxt5Fme56Z4792/+DrtRKumAC0E/w759CP+8ElSHjmhCnsh99VP17tvYLfJ884=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Mw0NwqaM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LOllSiLY; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 172AAEC0B60;
	Sat, 14 Mar 2026 18:11:08 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Sat, 14 Mar 2026 18:11:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773526268;
	 x=1773612668; bh=rFL9VTr1+BKA5alIIH2RLX00l2FZoFiOQPLMShf2Zk8=; b=
	Mw0NwqaME9j2C2bSOyosiCWU7/dfMW3M2+iRgqVC34FUad/gNo7NXD5mPKRI1qOj
	+524DupVslkuqxlFZnhLSUCDFOEhop862uxddHJurG3QgncdiccxuYKslhG/8TnL
	hOdLAo+5w6z5DuAIwFj7UwEYO7kn1JnCUWSaUfTncDCuOu+uKTOWJr1iy4RSRFj3
	eQxLRWeDrI7Rzcfw8zfObqdyvIMhSJQ1H7UFFJafMm/VMFW7BTeVkXGXCxKDSBoN
	m6piJvDxH/MGO4WdcvJeSHYaAxz1I8uXsNwtrl93/pR5FR90KKHTOrrka/ulKaNX
	aeOxWMr5sBjtRYhf8gvHSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773526268; x=
	1773612668; bh=rFL9VTr1+BKA5alIIH2RLX00l2FZoFiOQPLMShf2Zk8=; b=L
	OllSiLYWXt5K4x65I03Tj0NnZJx5ZniHHuZGCrb6T75hbqol4HV9rteocPCaQX2c
	4rZnaTCVnypfQxkSSuKuQ8P1rp23LRWDkTry/kq0TU634Ay8W5HuYE3Fv2BtSEIa
	ZbEVCJ0PVzpLLLsC0smXnLStxuMgk+WyXynzztPwje+ruvWOkRczxL7XtyOkWjcF
	m8WtKYdi4w02PWNRf9Z9wQ9r6blL1xvUzGq5EQobYlHAFLWITpm4eKchoL/fkKDt
	c2+8RdYLXndeeGPti08WkfOGFGWX7C15uzpwwb9GKm5eI1msSWMmKYspnerSbRRp
	A7uJO+0jZF3LDodmOeTdw==
X-ME-Sender: <xms:-9y1aXP34vP8QQQBaLGWu5jUxbnf5U6jrYcCoJd0c7OCROf-XOGi7w>
    <xme:-9y1aTiq_2IZK9L3gKfZAwTtj6h6U93i7ZisePNaQULTJiq3tmBsu2LGUzH6-zow3
    xbvSQg_zqd4nDazPF4BgJb6RMb9eIyeULaP-1KV3Ns-d8JT7FgwuCE>
X-ME-Received: <xmr:-9y1acmwNc3sWFrypYGieQJqgGEdNllkUC7U2yj4q0Hd4YoifxZXKdsXUQe-KhqiwY5gZxnTnv0V5UEmuxm5JV7Z-ORr1QJRn98U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvleefjeefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:-9y1aXgUo1e166ffXtYbTJgXhCgxb_EHPb7oxDturjkDifn12VcJMw>
    <xmx:-9y1aXGI6PNqXVi4o9rdFBL_XoHTwGLgB0_uPgFic1PQEysW6C6biA>
    <xmx:-9y1aRt24eYv43_DJmDjf4KCW50fq3lWb4n2AGGNNvMnZYqhDrvtZw>
    <xmx:-9y1aQcDAgJLqoFZkxBmWMbHJYoy6-pwGtD0BbX4zjOEh67AAmidwQ>
    <xmx:_Ny1aYaQ_JsMLYADxd5wOLTbU7uAM6n04VM7LmvkwouQGOPkzCJlM7Py>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Mar 2026 18:11:07 -0400 (EDT)
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
Subject: [PATCH v6 09/12] media: rppx1: Add support for Lens Shade Correction
Date: Sat, 14 Mar 2026 22:59:41 +0100
Message-ID: <20260314215944.3674865-10-niklas.soderlund+renesas@ragnatech.se>
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
	TAGGED_FROM(0.00)[bounces-55813-lists,linux-media=lfdr.de,renesas];
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
X-Rspamd-Queue-Id: 0DEB828F482
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Extend the RPPX1 driver to allow setting the Lens Shade Correction (LSC)
configuration using the RkISP1 parameter buffer format. It uses the
RPPX1 framework for parameters and  its writer abstraction to allow the
user to control how (and when) configuration is applied to the RPPX1.

As the RkISP1 parameters buffer only describes one quadrant of the lens,
this is due to the RkISP1 hardware only allowing one quadrant to be
programmed to hardware. The hardware then extrapolates this to the other
three quadrants of the lens. For RPP all four quadrants are individually
programmable.

To compensate for the driver need to extrapolate all four quadrants from
the RkISP1 parameters buffer information.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |   4 +
 .../platform/dreamchip/rppx1/rppx1_lsc.c      | 126 ++++++++++++++++++
 2 files changed, 130 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index c807ccfef628..0314cb732844 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -19,6 +19,7 @@ rkisp1_ext_params_blocks_info[] = {
 	RKISP1_PARAMS_BLOCK_INFO(BLS, bls),
 	RKISP1_PARAMS_BLOCK_INFO(AWB_GAIN, awb_gain),
 	RKISP1_PARAMS_BLOCK_INFO(CTK, ctk),
+	RKISP1_PARAMS_BLOCK_INFO(LSC, lsc),
 	RKISP1_PARAMS_BLOCK_INFO(AWB_MEAS, awb_meas),
 	RKISP1_PARAMS_BLOCK_INFO(HST_MEAS, hst),
 	RKISP1_PARAMS_BLOCK_INFO(AEC_MEAS, aec),
@@ -65,6 +66,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK:
 			module = &rpp->post.ccor;
 			break;
+		case RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC:
+			module = &rpp->pre1.lsc;
+			break;
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS:
 			module = &rpp->post.wbmeas;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c b/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
index e8acdf744956..00bdcc4aedb3 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
@@ -54,6 +54,10 @@
 #define LSC_TABLE_SEL_REG	0x00a8
 #define LSC_STATUS_REG		0x00ac
 
+#define LSC_R_TABLE_DATA_VALUE(v1, v2) (((v1) & 0xfff) | (((v2) & 0xfff) << 12))
+#define LSC_GRAD_VALUE(v1, v2) (((v1) & 0xfff) | (((v2) & 0xfff) << 16))
+#define LSC_SIZE_VALUE(v1, v2) (((v1) & 0x1ff) | (((v2) & 0x1ff) << 16))
+
 static int rppx1_lsc_probe(struct rpp_module *mod)
 {
 	/* Version check. */
@@ -63,6 +67,128 @@ static int rppx1_lsc_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static int
+rppx1_lsc_param_rkisp1(struct rpp_module *mod,
+		       const union rppx1_params_rkisp1_config *block,
+		       rppx1_reg_write write, void *priv)
+{
+	const struct rkisp1_ext_params_lsc_config *cfg = &block->lsc;
+	const __u16 *v;
+
+	/* Always disable module as it needs be disabled before configuring. */
+	write(priv, mod->base + LSC_CTRL_REG, 0);
+	if (cfg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE)
+		return 0;
+
+	/*
+	 * Program the color correction sectors.
+	 *
+	 * There are two tables to one can program and switch between. As the
+	 * RPPX1 supports preparing a buffer of commands to be applied later
+	 * only use table 0. This works as long as the ISP is not used in
+	 * inline-mode.
+	 *
+	 * For inline-mode support using DMA for configuration is not possible
+	 * so this is not an issue, but needs to be address if inline-mode
+	 * support is added to the driver.
+	 */
+
+	/* Start writing at beginning of table 0. */
+	write(priv, mod->base + LSC_R_TABLE_ADDR_REG, 0);
+	write(priv, mod->base + LSC_GR_TABLE_ADDR_REG, 0);
+	write(priv, mod->base + LSC_B_TABLE_ADDR_REG, 0);
+	write(priv, mod->base + LSC_GB_TABLE_ADDR_REG, 0);
+
+	/* Program data tables. */
+	for (unsigned int i = 0; i < RKISP1_CIF_ISP_LSC_SAMPLES_MAX; i++) {
+		const __u16 *r = cfg->config.r_data_tbl[i];
+		const __u16 *gr = cfg->config.gr_data_tbl[i];
+		const __u16 *b = cfg->config.b_data_tbl[i];
+		const __u16 *gb = cfg->config.gb_data_tbl[i];
+		unsigned int j;
+
+		for (j = 0; j < RKISP1_CIF_ISP_LSC_SAMPLES_MAX - 1; j += 2) {
+			write(priv, mod->base + LSC_R_TABLE_DATA_REG,
+			      LSC_R_TABLE_DATA_VALUE(r[j], r[j + 1]));
+			write(priv, mod->base + LSC_GR_TABLE_DATA_REG,
+			      LSC_R_TABLE_DATA_VALUE(gr[j], gr[j + 1]));
+			write(priv, mod->base + LSC_B_TABLE_DATA_REG,
+			      LSC_R_TABLE_DATA_VALUE(b[j], b[j + 1]));
+			write(priv, mod->base + LSC_GB_TABLE_DATA_REG,
+			      LSC_R_TABLE_DATA_VALUE(gb[j], gb[j + 1]));
+		}
+
+		write(priv, mod->base + LSC_R_TABLE_DATA_REG,
+		      LSC_R_TABLE_DATA_VALUE(r[j], 0));
+		write(priv, mod->base + LSC_GR_TABLE_DATA_REG,
+		      LSC_R_TABLE_DATA_VALUE(gr[j], 0));
+		write(priv, mod->base + LSC_B_TABLE_DATA_REG,
+		      LSC_R_TABLE_DATA_VALUE(b[j], 0));
+		write(priv, mod->base + LSC_GB_TABLE_DATA_REG,
+		      LSC_R_TABLE_DATA_VALUE(gb[j], 0));
+	}
+
+	/* Activate table 0. */
+	write(priv, mod->base + LSC_TABLE_SEL_REG, 0);
+
+	/*
+	 * Program X- and Y- sizes, and gradients.
+	 *
+	 * The RPP ISP can describe each quarter of the lens individually, this
+	 * differs from the Rk1ISP which can only describe one quarter of lens
+	 * with software and then extrapolates the other three.
+	 *
+	 * To adjust for this extrapolate the three missing quadrants using
+	 * software for the RPP ISP.
+	 */
+
+	v = cfg->config.x_grad_tbl;
+	write(priv, mod->base + LSC_XGRAD_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
+	write(priv, mod->base + LSC_XGRAD_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
+	write(priv, mod->base + LSC_XGRAD_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
+	write(priv, mod->base + LSC_XGRAD_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
+	write(priv, mod->base + LSC_XGRAD_89_REG, LSC_GRAD_VALUE(v[7], v[6]));
+	write(priv, mod->base + LSC_XGRAD_1011_REG, LSC_GRAD_VALUE(v[5], v[4]));
+	write(priv, mod->base + LSC_XGRAD_1213_REG, LSC_GRAD_VALUE(v[3], v[2]));
+	write(priv, mod->base + LSC_XGRAD_1415_REG, LSC_GRAD_VALUE(v[1], v[0]));
+
+	v = cfg->config.y_grad_tbl;
+	write(priv, mod->base + LSC_YGRAD_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
+	write(priv, mod->base + LSC_YGRAD_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
+	write(priv, mod->base + LSC_YGRAD_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
+	write(priv, mod->base + LSC_YGRAD_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
+	write(priv, mod->base + LSC_YGRAD_89_REG, LSC_GRAD_VALUE(v[7], v[6]));
+	write(priv, mod->base + LSC_YGRAD_1011_REG, LSC_GRAD_VALUE(v[5], v[4]));
+	write(priv, mod->base + LSC_YGRAD_1213_REG, LSC_GRAD_VALUE(v[3], v[2]));
+	write(priv, mod->base + LSC_YGRAD_1415_REG, LSC_GRAD_VALUE(v[1], v[0]));
+
+	v = cfg->config.x_size_tbl;
+	write(priv, mod->base + LSC_XSIZE_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
+	write(priv, mod->base + LSC_XSIZE_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
+	write(priv, mod->base + LSC_XSIZE_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
+	write(priv, mod->base + LSC_XSIZE_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
+	write(priv, mod->base + LSC_XSIZE_89_REG, LSC_GRAD_VALUE(v[7], v[6]));
+	write(priv, mod->base + LSC_XSIZE_1011_REG, LSC_GRAD_VALUE(v[5], v[4]));
+	write(priv, mod->base + LSC_XSIZE_1213_REG, LSC_GRAD_VALUE(v[3], v[2]));
+	write(priv, mod->base + LSC_XSIZE_1415_REG, LSC_GRAD_VALUE(v[1], v[0]));
+
+	v = cfg->config.y_size_tbl;
+	write(priv, mod->base + LSC_YSIZE_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
+	write(priv, mod->base + LSC_YSIZE_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
+	write(priv, mod->base + LSC_YSIZE_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
+	write(priv, mod->base + LSC_YSIZE_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
+	write(priv, mod->base + LSC_YSIZE_89_REG, LSC_GRAD_VALUE(v[7], v[6]));
+	write(priv, mod->base + LSC_YSIZE_1011_REG, LSC_GRAD_VALUE(v[5], v[4]));
+	write(priv, mod->base + LSC_YSIZE_1213_REG, LSC_GRAD_VALUE(v[3], v[2]));
+	write(priv, mod->base + LSC_YSIZE_1415_REG, LSC_GRAD_VALUE(v[1], v[0]));
+
+	/* Enable module. */
+	write(priv, mod->base + LSC_CTRL_REG, LSC_CTRL_LSC_EN);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_lsc_ops = {
 	.probe = rppx1_lsc_probe,
+	.param_rkisp1 = rppx1_lsc_param_rkisp1,
 };
-- 
2.53.0


