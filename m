Return-Path: <linux-media+bounces-61833-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2N+QB0LfCGp09AMAu9opvQ
	(envelope-from <linux-media+bounces-61833-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 23:18:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A7C55DDFF
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 23:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BC2330492BA
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 21:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B81E380FCB;
	Sat, 16 May 2026 21:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="n9bu71Wj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="J7OdWIEO"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A9937F8BA;
	Sat, 16 May 2026 21:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778966071; cv=none; b=mC/bFEta0sCRhECvxEiaez9pLliUEp1HVYa6nmWuyUZuQMJzOAsp7Mb826jyq8KJRiaSx93e6kjnuXqnwONwPw3ql9HRnPFUKuV++0zdLHsmnYkbwDQhwk3PpUhCu86kqP6xqDPwYg1AN7SM0LiVzu0lwxQs1k7Fn1mQHPLLKiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778966071; c=relaxed/simple;
	bh=XPBVKtGJuSAp0G51y5mhI4PH1WrFJIGQ+sPE4HVIYjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gjTHaZ400V7hmH/JGUkeckJmLqHcKYEWR1MMD1akF6FaGXmfLCKWFTPMlXx99kiWNhC6CC4qpqi7GWbV00TYy8IoFTX8eEKgWOupFapicKm2KS7vKhRfEvbm4nOixEvDRkclb8alcW8BaqqQy1/rlU2KuHDSQVWYAvKJczFqaLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=n9bu71Wj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=J7OdWIEO; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5402814000E3;
	Sat, 16 May 2026 17:14:24 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sat, 16 May 2026 17:14:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778966064;
	 x=1779052464; bh=1vL3+FxwS2iOizkgmLZNojxoX1ulQFatFkFsHgQfPLk=; b=
	n9bu71Wjb3gobOlw7P7fvI/M2PQW1iEawskzS0EZMdP3KVSTB8I0pCZgkw2UJPUm
	8T3O2j0IO968ODmb1Oq9i33Bvg+lg6Auv60sQFlx6NB5hb7RF371uoBuC/QdgEmh
	h0O/bTWvDb/B2mbogmYzf30m5+gwlVVKneq/PlcR8H5UdEWy9e5ygOlyk/gzGoSl
	mOeSAKMauz8jLGTganjoOpH8hNL7p1Atrt++x6jzOhnu2qvwFsFQuF/Ou+Z3Ntn7
	jZoswvLGX0FROcm2CMeBMmVp5d2rd9PQH1y021rrorfi0+CS2lRrnOaVgJ7SY10D
	kHGvImROyIUe24T0/uYiqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778966064; x=
	1779052464; bh=1vL3+FxwS2iOizkgmLZNojxoX1ulQFatFkFsHgQfPLk=; b=J
	7OdWIEOR+hY/KmBL+KJr8fDfyZB34EpamIHkoghcVZWA63m62EZ1MJWwVZQnsv1N
	Qt7t9NKugs8JY0M7J5fKev3++nEDQr02Mwgo4+1QyrPXZZunNWJ6+PX+HsGAI4Op
	2NUSZjZNISCloxSC9/eunsLJtVRDC04QvBPsDUcbyEZ4nWqCAEnhnu32PIEXbdSo
	ECrgObYJS6dMk06xRHEfbjilfUdKt6u6e8C9f2EtBqGiczswGDPs0KE3SwB8QY6z
	FYJEYSZoO046ipEiUdXuYD7g8cxFyyItnaPbCijgvFQQQhxrWGnzwCK28nDrJNJC
	LZQtEELkWJZLyzcs7/F3w==
X-ME-Sender: <xms:MN4IapB--DYTydMrgcFZ8-zO4mrc9PpmWof00pA-Sop-skiOFs4yZw>
    <xme:MN4Iati6RQ-k0mTk9cWQAAbOROdejpJrTicf6XzaqCpafXSm77nPumM8G1OSPTBEp
    WhlxONJW-UOwIo-3QDOih-_7m14mysEjEsoKFt3GdYlsaGdAYJ9ZIY>
X-ME-Received: <xmr:MN4IavYGb0l9Nm3fsWOJOnXwPLgBvGP1ED6V7Ozx9TZ6dIlYZUhRF6NlvAj4imgZT7Rpk_H4JYWK33EUd_9MeN02IvPdWjsb5CAe>
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
X-ME-Proxy: <xmx:MN4IamkLwYWD8j2BuI_n748UdYCgjMZaFxJxA8rEKnvk1XE974KsMQ>
    <xmx:MN4IatjzuH9jrJKzvpEtoy4WhCNr-hZWCRJkDgjjqJqRIXW4xUDlNA>
    <xmx:MN4IagRpbApzyUaT3dCv5ginv_RpVQNa-zU4M3bKSY1zlT1lqFyssA>
    <xmx:MN4IamaSgBUT-LHPNR88J0p___2OiflKVWB6av3mULKLI88oqZdGwg>
    <xmx:MN4IatkDYuwaZRq5nqBP7b2lABACAGKxHf6GSU0uKareiyZLvIYWesYg>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 May 2026 17:14:23 -0400 (EDT)
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
Subject: [PATCH v9 10/13] media: rppx1: ccor: Add support for color correction matrix
Date: Sat, 16 May 2026 23:13:17 +0200
Message-ID: <20260516211320.3041412-11-niklas.soderlund+renesas@ragnatech.se>
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
X-Rspamd-Queue-Id: 88A7C55DDFF
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
	TAGGED_FROM(0.00)[bounces-61833-lists,linux-media=lfdr.de,renesas];
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

Extend the RPPX1 driver to allow setting the color correction matrix
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
 .../platform/dreamchip/rppx1/rpp_params.c     |  4 ++
 .../platform/dreamchip/rppx1/rppx1_ccor.c     | 61 +++++++++++++++++++
 .../uapi/linux/media/dreamchip/rppx1-config.h | 28 ++++++++-
 4 files changed, 93 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
index 5e20fcdcbcc4..e039746ac542 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
@@ -49,6 +49,7 @@ union rppx1_params_block {
 	struct v4l2_isp_block_header header;
 	struct rppx1_bls_params bls;
 	struct rppx1_awbg_params awbg;
+	struct rppx1_ccor_params ccor;
 	struct rppx1_hist_params hist;
 	struct rppx1_exm_params exm;
 	struct rppx1_wbmeas_params wbmeas;
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 831cf7ca154c..a83d393d0504 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -21,6 +21,7 @@ rppx1_ext_params_blocks_info[] = {
 	RPPX1_PARAMS_BLOCK_INFO(BLS_PRE2, bls),
 	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
 	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE2, awbg),
+	RPPX1_PARAMS_BLOCK_INFO(CCOR_POST, ccor),
 	RPPX1_PARAMS_BLOCK_INFO(HIST_PRE1, hist),
 	RPPX1_PARAMS_BLOCK_INFO(HIST_PRE2, hist),
 	RPPX1_PARAMS_BLOCK_INFO(HIST_POST, hist),
@@ -66,6 +67,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		case RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1:
 			module = &rpp->pre1.awbg;
 			break;
+		case RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST:
+			module = &rpp->post.ccor;
+			break;
 		case RPPX1_PARAMS_BLOCK_TYPE_HIST_POST:
 			module = &rpp->post.hist;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c b/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
index 3bfad3ba12e6..5ddc7edf6930 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
@@ -67,9 +67,70 @@ static int rppx1_ccor_start(struct rpp_module *mod,
 	return 0;
 }
 
+static int
+rppx1_ccor_fill_params(struct rpp_module *mod,
+		       const union rppx1_params_block *block,
+		       rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_ccor_params *cfg = &block->ccor;
+
+	/* If the modules is disabled, configure in bypass mode. */
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + CCOR_COEFF_REG(0), 0x1000);
+		write(priv, mod->base + CCOR_COEFF_REG(1), 0x0000);
+		write(priv, mod->base + CCOR_COEFF_REG(2), 0x0000);
+
+		write(priv, mod->base + CCOR_COEFF_REG(3), 0x0000);
+		write(priv, mod->base + CCOR_COEFF_REG(4), 0x1000);
+		write(priv, mod->base + CCOR_COEFF_REG(5), 0x0000);
+
+		write(priv, mod->base + CCOR_COEFF_REG(6), 0x0000);
+		write(priv, mod->base + CCOR_COEFF_REG(7), 0x0000);
+		write(priv, mod->base + CCOR_COEFF_REG(8), 0x1000);
+
+		write(priv, mod->base + CCOR_OFFSET_R_REG, 0x00000000);
+		write(priv, mod->base + CCOR_OFFSET_G_REG, 0x00000000);
+		write(priv, mod->base + CCOR_OFFSET_B_REG, 0x00000000);
+
+		return 0;
+	}
+
+	/*
+	 * Coefficient n for color correction matrix.
+	 *
+	 * RPP coefficients are 16-bit signed fixed-point numbers with 4 bit
+	 * integer and 12 bit fractional part ranging from -8 (0x8000) to
+	 * +7.9996 (0x7FFF). 0 is represented by 0x0000 and a coefficient
+	 * value of 1 as 0x1000.
+	 */
+	write(priv, mod->base + CCOR_COEFF_REG(0), cfg->coeff[0][0]);
+	write(priv, mod->base + CCOR_COEFF_REG(1), cfg->coeff[0][1]);
+	write(priv, mod->base + CCOR_COEFF_REG(2), cfg->coeff[0][2]);
+
+	write(priv, mod->base + CCOR_COEFF_REG(3), cfg->coeff[1][0]);
+	write(priv, mod->base + CCOR_COEFF_REG(4), cfg->coeff[1][1]);
+	write(priv, mod->base + CCOR_COEFF_REG(5), cfg->coeff[1][2]);
+
+	write(priv, mod->base + CCOR_COEFF_REG(6), cfg->coeff[2][0]);
+	write(priv, mod->base + CCOR_COEFF_REG(7), cfg->coeff[2][1]);
+	write(priv, mod->base + CCOR_COEFF_REG(8), cfg->coeff[2][2]);
+
+	/*
+	 * Offset for color components correction matrix.
+	 *
+	 * Values are a two's complement integer with one sign bit.
+	 */
+	write(priv, mod->base + CCOR_OFFSET_R_REG, cfg->offset[0]);
+	write(priv, mod->base + CCOR_OFFSET_G_REG, cfg->offset[1]);
+	write(priv, mod->base + CCOR_OFFSET_B_REG, cfg->offset[2]);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_ccor_ops = {
 	.probe = rppx1_ccor_probe,
 	.start = rppx1_ccor_start,
+	.fill_params = rppx1_ccor_fill_params,
 };
 
 static int rppx1_ccor_csm_start(struct rpp_module *mod,
diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
index dbbd6223f33c..97c333c72d56 100644
--- a/include/uapi/linux/media/dreamchip/rppx1-config.h
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -88,6 +88,7 @@ enum rppx1_meas_chan {
  * @RPPX1_PARAMS_BLOCK_TYPE_HIST_POST: POST pipe Histogram Measurement
  * @RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1: PRE1 pipe Black Level Subtraction
  * @RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2: PRE2 pipe Black Level Subtraction
+ * @RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST: POST pipe Color Correction
  */
 enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
@@ -101,6 +102,7 @@ enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_HIST_POST,
 	RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1,
 	RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2,
+	RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST,
 };
 
 /**
@@ -422,6 +424,29 @@ struct rppx1_bls_params {
 	struct rppx1_bls_fixed fixed;
 };
 
+/**
+ * struct rppx1_ccor_params - Color CORrection configuration
+ *
+ * The CCOR (Color Correction) module is available on the MAIN_POST pipe. It
+ * performs color space correction on a pixel-per-pixel basis using a 3x3 matrix
+ * of coefficients and per-color channel offsets.
+ *
+ * The matrix coefficients are represented as 16 bits signed fixed point values
+ * in Q4.12 format ranging from -8 to +7.999.
+ *
+ * The per-channel color offsets are represented as 2's complement values
+ * stored in 25 bits ranging from -16777216 to 16777215.
+ *
+ * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST)
+ * @coeff: color correction matrix coefficients, 16 bits signed Q4.12
+ * @offset: R, G, B offsets, 2's complement 25 bits
+ */
+struct rppx1_ccor_params {
+	struct v4l2_isp_params_block_header header;
+	__u16 coeff[3][3];
+	__u32 offset[3];
+};
+
 /**
  * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
  *
@@ -439,7 +464,8 @@ struct rppx1_bls_params {
 	sizeof(struct rppx1_hist_params)			+	\
 	sizeof(struct rppx1_hist_params)			+	\
 	sizeof(struct rppx1_bls_params)				+	\
-	sizeof(struct rppx1_bls_params))
+	sizeof(struct rppx1_bls_params)				+	\
+	sizeof(struct rppx1_ccor_params))
 
 /* ---------------------------------------------------------------------------
  * Statistics Structures
-- 
2.54.0


