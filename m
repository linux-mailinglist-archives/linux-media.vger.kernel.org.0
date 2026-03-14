Return-Path: <linux-media+bounces-55811-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OrzKE7dtWlT6AAAu9opvQ
	(envelope-from <linux-media+bounces-55811-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 23:12:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C158528F3A0
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 23:12:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 28A28301F683
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 22:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 956FA3876B5;
	Sat, 14 Mar 2026 22:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="7AiIUahj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="1gYBLWsf"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3B6388E54;
	Sat, 14 Mar 2026 22:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773526274; cv=none; b=r1fV4s3grYDdodQgyK5B4TUYq4bn7lfVSVi01Z1vDIVdadWfELTOtPnNRzj9i1EqcOheeYUdbPXlRfHocFK7l1DtTAU+gpak7qGU9Zsvr2uzyS8GDkvAw592Mp0IWVn3E4lmXl7MOdJVb2Fx4558FvYxi2TkgkyG/3KKK1QyRmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773526274; c=relaxed/simple;
	bh=0ilOLezNPPk8QlaUljEA0EJ4gA+ltnPYRo5ldtjM3QI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ObDM5Eh7K0pM+nJ8yeuWHVmqt9d3/mBhZQW5OnZRXkvWiIPFPPSBIFQNmSAteTxvtgbZlW70XaD+L2O2SuCDYzM0tifoqoi+L9yj2T/410qi7kM1o5RCqEF9w9g8/6Ybx/Hswc578QQ4CviAXy4SGb8Xj0Nn2nwEjAXViaUbJ9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=7AiIUahj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=1gYBLWsf; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 048E3EC0B94;
	Sat, 14 Mar 2026 18:11:10 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Sat, 14 Mar 2026 18:11:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773526269;
	 x=1773612669; bh=V6gDJu9O86Y8DIzkmgM7DJpVF91X8GLzUk61w3xjgFY=; b=
	7AiIUahjdM1Zra1Qn4CG3SRuSgUlS+h/YoHuQFvaskPOMDPPu2n6YFi9dzkJ8RO3
	/8x/DV4c0vF1b6gw1EPKvwPNfsfwWE1Nic+biSry2SQKKOlOmGsfY8Elt/7rJj+9
	balQb21lCainz2IwklKOwvWBDiurLQXJeeigH5gWXib6WgkCh9PkH0jAR9jl3neJ
	IgqMzglz7B1udjLrMv9TeQse7UrxEtTFGVwgEvYZNXilyrfPVao5JiKEyRA5vwz9
	XkKk9eE6748RRK1kzpwESuZvcAHu92sfjCnIMCrbSFsEfojGWrk0DuJxi3eZAWyD
	jsRC/bQCkTydY+u9Xs1vFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773526269; x=
	1773612669; bh=V6gDJu9O86Y8DIzkmgM7DJpVF91X8GLzUk61w3xjgFY=; b=1
	gYBLWsfaKGd/FlEbj8djyFeGhiz6OQ6drIfIEJDED3bnMr0I2mwsUMgG5/HPz7ww
	Zyrh9cFdtmqtE8b5dXEzUGiMTDK7wJurmqPVagfr6Bfmsh9AavcHwOmNkwNrfzLA
	KMvQ0BVTMUHOGjDWpnyvcPmNlPMjMfbd3wW4oeUF80DXQrCdfFeKfRrRn/OoIxsY
	r88/IccLuY2HNZjjUvNrk44P6/vAweYeoTy09CaADyE2YdfCTwQZPW8+HNMaswqc
	TQqg0TzEPPDhFmzK5GmxQEKNp3d1516mbhy65D6FuZS56eWVcSDt4z5CKi+fVL/q
	dFE47EaAyEgPlBlt4N8sQ==
X-ME-Sender: <xms:_dy1aTCLxUr0LemaYTnnPzsQREOU2bEVmg-k_uO6s5SqAZBaYoXUow>
    <xme:_dy1aZ8ZC1NuT9Vm0C-M8IT5L1Etkb-vhh9i97niA8tAihAbU7l80OyRCNKcqDtDd
    yKqwDiiYFAx1ZVyGktzJtxoKCF2Fv-JC4bneS0khxAL080CGvMx_Ec>
X-ME-Received: <xmr:_dy1afS-WZ7U3UNFLsvH0d-DH6CFH--p72TzLlQPhaixRHtQWT1pS8wJiIdz6-fKIXsxXPzeM_WsmxXEQZGg3hQr9VBq7SiZWJSz>
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
X-ME-Proxy: <xmx:_dy1adVsgSbnssP_ERW9q0s7H2OIwqeXS9Jagz3Y9U-012qSJ4fzjA>
    <xmx:_dy1aZTt5CpmZn_LxADok1MXwSfcoygsjurQV5cxj6-aZYeVNGUMIQ>
    <xmx:_dy1aV0h0X2KtcIBtV9yVwLzU-HGAJSP1mLanH02_Ck4tOpYD_I77Q>
    <xmx:_dy1aZea3jmnvaxO-52iE-L4c9WTvahmBhUUM4HNAM1kpfLFjgfAiQ>
    <xmx:_dy1abX2Do2L7e9pKoksn6h6ueOMiF2W8GN9C92p9CYZa4kpCkv75_QD>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Mar 2026 18:11:09 -0400 (EDT)
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
Subject: [PATCH v6 10/12] media: rppx1: Add support for Gamma Correction
Date: Sat, 14 Mar 2026 22:59:42 +0100
Message-ID: <20260314215944.3674865-11-niklas.soderlund+renesas@ragnatech.se>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55811-lists,linux-media=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,mailbox.org:email,messagingengine.com:dkim]
X-Rspamd-Queue-Id: C158528F3A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Extend the RPPX1 driver to allow setting the Gamma Correction
configuration using the RkISP1 parameter buffer format. It uses the
RPPX1 framework for parameters and  its writer abstraction to allow the
user to control how (and when) configuration is applied to the RPPX1.

As the RkISP1 parameters are all 10-bit while RPP can be either 12- or
24-bit, the driver corrects for this allowing the RkISP1 parameters to
be used.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |  4 +++
 .../media/platform/dreamchip/rppx1/rppx1_ga.c | 34 +++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 0314cb732844..a2f6c85893e3 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -19,6 +19,7 @@ rkisp1_ext_params_blocks_info[] = {
 	RKISP1_PARAMS_BLOCK_INFO(BLS, bls),
 	RKISP1_PARAMS_BLOCK_INFO(AWB_GAIN, awb_gain),
 	RKISP1_PARAMS_BLOCK_INFO(CTK, ctk),
+	RKISP1_PARAMS_BLOCK_INFO(GOC, goc),
 	RKISP1_PARAMS_BLOCK_INFO(LSC, lsc),
 	RKISP1_PARAMS_BLOCK_INFO(AWB_MEAS, awb_meas),
 	RKISP1_PARAMS_BLOCK_INFO(HST_MEAS, hst),
@@ -66,6 +67,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK:
 			module = &rpp->post.ccor;
 			break;
+		case RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC:
+			module = &rpp->hv.ga;
+			break;
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC:
 			module = &rpp->pre1.lsc;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c b/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
index d6c7f951cf29..a748190ef2dc 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
@@ -43,7 +43,41 @@ static int rppx1_ga_start(struct rpp_module *mod,
 	return 0;
 }
 
+static int
+rppx1_ga_param_rkisp1(struct rpp_module *mod,
+		      const union rppx1_params_rkisp1_config *block,
+		      rppx1_reg_write write, void *priv)
+{
+	const struct rkisp1_ext_params_goc_config *cfg = &block->goc;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + GAMMA_OUT_ENABLE_REG, 0);
+		return 0;
+	}
+
+	write(priv, mod->base + GAMMA_OUT_MODE_REG,
+	      cfg->config.mode ? GAMMA_OUT_ENABLE_GAMMA_OUT_EN : 0);
+
+	/*
+	 * The RkISP mean values are 10-bit while the RPP can be 12 or 24 bit.
+	 * Figure out how much we need to adjust the output values.
+	 */
+	const unsigned int shift = mod->info.ga.colorbits - 10;
+
+	for (unsigned int i = 0; i < RKISP1_CIF_ISP_GAMMA_OUT_MAX_SAMPLES_V10; i++)
+		write(priv, mod->base + GAMMA_OUT_Y_REG(i),
+		      cfg->config.gamma_y[i] << shift);
+
+	/* Enable module. */
+	write(priv, mod->base + GAMMA_OUT_ENABLE_REG,
+	      GAMMA_OUT_ENABLE_GAMMA_OUT_EN);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_ga_ops = {
 	.probe = rppx1_ga_probe,
 	.start = rppx1_ga_start,
+	.param_rkisp1 = rppx1_ga_param_rkisp1,
 };
-- 
2.53.0


