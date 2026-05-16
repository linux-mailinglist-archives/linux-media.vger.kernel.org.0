Return-Path: <linux-media+bounces-61834-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHq1NmrfCGp09AMAu9opvQ
	(envelope-from <linux-media+bounces-61834-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 23:19:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E65C55DE0F
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 23:19:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 227A8305209B
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 21:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43AF3812F2;
	Sat, 16 May 2026 21:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="LRtLovMT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ODgATwFr"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF68637FF5A;
	Sat, 16 May 2026 21:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778966072; cv=none; b=nrQjSsiJ5kau4WmuFuOcQhYIpXupdBcbyhKevzWjuv+M8pNVxK60i2VTi6UzCT6LK+Q02CF4Cy4EiZ8rTtL7Hb9S73Vdwe82xntuX4bdXd+T8q3yGnUAUG17Uzap28Qq6GbvOykfodoBQVYPTNHW6+e+edf1Ak/6xludAZWxIoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778966072; c=relaxed/simple;
	bh=gzVO9YrwtFn/SA5si4hnglh5pfqQorNFLr1HxaI4YJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eaQWymHkwhNg5ysrpQkveQXfFSyugPHbd2dkTmFiHrukvhYDD9AsFW0DuHY5dJwvZyg0rHUXqIsvrKY/GLmPWjqJdw2O5ZJAShotoQuWaBE+wzVjmHHWiTlCAni9A800E4YMYw1+asK59ygR/M3eID175gGq7BYubLm8c5mlyG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=LRtLovMT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ODgATwFr; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1D9EC14000EB;
	Sat, 16 May 2026 17:14:28 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sat, 16 May 2026 17:14:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778966068;
	 x=1779052468; bh=4AXAqLtTjvWE5HRkgk3vZiWivnxhoIuhy+DZ4qzA/2Y=; b=
	LRtLovMTFhhdEIR226SxnqpCAH18187qwKUgeZzYKxCGoVUyyMj80On3bsxB5OSp
	By2qFVwChIWrsqKg0qdJcjzeHVkShtoAwSjDal/mKP5G3I1t6cJRDaVR7FNM2fx/
	9nSI1XewZUi99a1O63C+8uDqaS2sH0s+ToN9V2Gg5SNNnXNq4GqIegDBMghURqdG
	3w2X0RV0iVw/WxgNuGLL49FaHqxYlkRi8iwG4RwhGIFbpZUY9SZLiiiJHTSP33KL
	W5yf9aT4POmmAXczJLyD1q8xYnszdYSFvIf3Ek37Cbs4QgNtnKTTCygy+on0vkx4
	U9WhbNEq1qqOmozmsdGgOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778966068; x=
	1779052468; bh=4AXAqLtTjvWE5HRkgk3vZiWivnxhoIuhy+DZ4qzA/2Y=; b=O
	DgATwFraq1GCmPng/RkQN2yuLkBrpHf7KDH141d1UxwAfdP6O7C2M6YOubMfof0q
	MU5AWQIKRHfjsqufNk+NcsZI6SgQXoVy507P7Mr4PDuhrjGIvjwVQHu3J45vzPeb
	qlvwvrdvDRaA6nBa1JagMAchy/1c7Oq0EzOQOXhAtFqxR56Ttg6LippZY7zcJuez
	oubn0SUP8Jct8KzzbJXwWqBK7vzHs6G0oNgPQb9nuQXHvZNh6yltM+wQdI3CGyZh
	VnXzZ7U2ScQERsjKXmT6igVhmtqje4Q0uKsPXVWe212JoeiANbW9A6wuOS/Z1ALa
	Tjvn4zq3uK/IEu9hh8nPQ==
X-ME-Sender: <xms:NN4IauF3fxsYVv7eKNbrbEyckG9u5QH7haLHfTMXxIP3oArh1Qixsw>
    <xme:NN4IalWoaLUTxVl9b9pegaMCVMekLIbsoZR-szbjvliQ7kb1hVchjzGgqxlg2RTXq
    K_1wJA74_VVJgYShqCtn4nQsKDY1box9r42OWp1HccY4hUgqss-1U4>
X-ME-Received: <xmr:NN4Iai9z6Lx_NvqNR-EDJ7mKuOtS1TP6jZfL1YuXyhyg_6zdkI1i-ewlS_8WHkcOVWOyzeuvZrQDwMRGWIModAZ3WyBgif0rELDW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeegfeefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:NN4Iaq5VO_rgNpyK2Rq3AuX4W6QUTR4iAnH81s55CNmupevaGgIQRA>
    <xmx:NN4IajmRIET5pBtFa2ymJZzEwcMTKfV-9pxqRNTFfa6ehb_TbENrcg>
    <xmx:NN4IalGRW_WBbhkmOP3cPmB12ofnmHwzeGM371XeOgzUn-DVh5I5_A>
    <xmx:NN4Iai_phehC8zRjFu_Xsg2cc33aXTOAuZjhoLLE3i3TUajjV4qapw>
    <xmx:NN4IajLfWaDk_K5fV-QCt0OiVGx7mrz9a3MqBof1RdirVRYqhYnsLPvB>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 May 2026 17:14:27 -0400 (EDT)
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
Subject: [PATCH v9 12/13] media: rppx1: ga: Add support for gamma out correction
Date: Sat, 16 May 2026 23:13:19 +0200
Message-ID: <20260516211320.3041412-13-niklas.soderlund+renesas@ragnatech.se>
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
X-Rspamd-Queue-Id: 3E65C55DE0F
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
	TAGGED_FROM(0.00)[bounces-61834-lists,linux-media=lfdr.de,renesas];
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

Extend the RPPX1 driver to allow setting the gamma out correction
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
 .../platform/dreamchip/rppx1/rpp_params.c     |  5 ++
 .../media/platform/dreamchip/rppx1/rppx1_ga.c | 43 ++++++++++++++-
 .../uapi/linux/media/dreamchip/rppx1-config.h | 53 ++++++++++++++++++-
 4 files changed, 100 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
index 48b61b5c35b4..948e26d7361d 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
@@ -54,6 +54,7 @@ union rppx1_params_block {
 	struct rppx1_hist_params hist;
 	struct rppx1_exm_params exm;
 	struct rppx1_wbmeas_params wbmeas;
+	struct rppx1_ga_params ga;
 };
 
 union rppx1_stats_block {
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 8d85d0c7bff1..86d445b52504 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -30,6 +30,8 @@ rppx1_ext_params_blocks_info[] = {
 	RPPX1_PARAMS_BLOCK_INFO(EXM_PRE1, exm),
 	RPPX1_PARAMS_BLOCK_INFO(EXM_PRE2, exm),
 	RPPX1_PARAMS_BLOCK_INFO(WBMEAS_POST, wbmeas),
+	RPPX1_PARAMS_BLOCK_INFO(GA_HV, ga),
+	RPPX1_PARAMS_BLOCK_INFO(GA_MV, ga),
 };
 
 int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
@@ -84,6 +86,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		case RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST:
 			module = &rpp->post.wbmeas;
 			break;
+		case RPPX1_PARAMS_BLOCK_TYPE_GA_HV:
+			module = &rpp->hv.ga;
+			break;
 		default:
 			dev_warn(rpp->dev,
 				 "Not handled RPPX1 block type: 0x%04x\n",
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c b/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
index 0667672b2694..1d9c24c43f77 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
@@ -15,9 +15,11 @@
 #define GAMMA_OUT_MODE_REG			0x0008
 #define GAMMA_OUT_MODE_GAMMA_OUT_EQU_SEGM	BIT(0)
 
-#define GAMMA_OUT_Y_REG_NUM			17
 #define GAMMA_OUT_Y_REG(n)			(0x000c + (4 * (n)))
 
+#define GAMMA_OUT_HV_GAMMA_CURVE_MASK		GENMASK(11, 0)
+#define GAMMA_OUT_MV_GAMMA_CURVE_MASK		GENMASK(23, 0)
+
 static int rppx1_ga_probe(struct rpp_module *mod)
 {
 	/* Version check. */
@@ -44,7 +46,46 @@ static int rppx1_ga_start(struct rpp_module *mod,
 	return 0;
 }
 
+static int
+rppx1_ga_fill_params(struct rpp_module *mod,
+		     const union rppx1_params_block *block,
+		     rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_ga_params *cfg = &block->ga;
+	u32 mask;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + GAMMA_OUT_ENABLE_REG, 0);
+		return 0;
+	}
+
+	switch (cfg->header.type) {
+	case RPPX1_PARAMS_BLOCK_TYPE_GA_HV:
+		mask = GAMMA_OUT_HV_GAMMA_CURVE_MASK;
+		break;
+	case RPPX1_PARAMS_BLOCK_TYPE_GA_MV:
+		mask = GAMMA_OUT_MV_GAMMA_CURVE_MASK;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	write(priv, mod->base + GAMMA_OUT_MODE_REG, cfg->mode);
+
+	for (unsigned int i = 0; i < RPPX1_GA_MAX_SAMPLES; i++)
+		write(priv, mod->base + GAMMA_OUT_Y_REG(i),
+		      cfg->gamma_y[i] & mask);
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
+	.fill_params = rppx1_ga_fill_params,
 };
diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
index 7ebcc00ace04..05faec2f68e3 100644
--- a/include/uapi/linux/media/dreamchip/rppx1-config.h
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -91,6 +91,8 @@ enum rppx1_meas_chan {
  * @RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST: POST pipe Color Correction
  * @RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE1: PRE1 pipe Lens Shading Correction
  * @RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE2: PRE2 Lens Shading Correction
+ * @RPPX1_PARAMS_BLOCK_TYPE_GA_HV: Human Vision Pipe Gamma Out Correction
+ * @RPPX1_PARAMS_BLOCK_TYPE_GA_MV: Machine Vision Gamma Out Correction
  */
 enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
@@ -107,6 +109,8 @@ enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST,
 	RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE1,
 	RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE2,
+	RPPX1_PARAMS_BLOCK_TYPE_GA_HV,
+	RPPX1_PARAMS_BLOCK_TYPE_GA_MV,
 };
 
 /**
@@ -497,6 +501,51 @@ struct rppx1_lsc_params {
 	__u16 y_sect_size[RPPX1_LSC_NUM_SECTORS];
 };
 
+/* Gamma Out */
+#define RPPX1_GA_MAX_SAMPLES 17
+
+/**
+ * enum rppx1_ga_seg_mode - Gamma out curve segmentation mode
+ *
+ * Segmentation mode of the 16 input sampling points for the Gamma Out
+ * Correction module.
+ *
+ * @RPPX1_GA_SEG_MODE_LOGARITHMIC: logarithmic-like segmentation mode
+ * @RPPX1_GA_SEG_MODE_EQUIDISTANT: equidistant segmentation mode
+ */
+enum rppx1_ga_seg_mode {
+	RPPX1_GA_SEG_MODE_LOGARITHMIC,
+	RPPX1_GA_SEG_MODE_EQUIDISTANT
+};
+
+/**
+ * struct rppx1_ga_params - Gamma Out Correction configuration
+ *
+ * The Gamma Out Correction module is available on the Human Vision Output
+ * Pipe (HV) and the Machine Vision Output Pipe (MV). Userspace selects
+ * which pipe to operate by setting the @header.type field to
+ * RPPX1_PARAMS_BLOCK_TYPE_GA_HV or RPPX1_PARAMS_BLOCK_TYPE_GA_MV.
+ *
+ * The module allows to apply a @gamma_y gamma correction curve to RGB data
+ * represented as a table of 16 entries. The 16 input sampling points can be
+ * equidistant or segmented using a logarithmic scale according to the value of
+ * @mode.
+ *
+ * The gamma curve values are 12 bits on the HV output pipe and 24 bits on the
+ * MV output pipe. Userspace is expected to provide the curve values with a
+ * bit-depth matching the one of pipe in use.
+ *
+ * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_GA_HV or
+ *	    type = RPPX1_PARAMS_BLOCK_TYPE_GA_MV)
+ * @mode: gamma curve input segmentation mode (see rppx1_ga_seg_mode)
+ * @gamma_y: gamma out curve y-axis values
+ */
+struct rppx1_ga_params {
+	struct v4l2_isp_params_block_header header;
+	__u8 mode;
+	__u32 gamma_y[RPPX1_GA_MAX_SAMPLES];
+};
+
 /**
  * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
  *
@@ -517,7 +566,9 @@ struct rppx1_lsc_params {
 	sizeof(struct rppx1_bls_params)				+	\
 	sizeof(struct rppx1_ccor_params)			+	\
 	sizeof(struct rppx1_lsc_params)				+	\
-	sizeof(struct rppx1_lsc_params))
+	sizeof(struct rppx1_lsc_params)				+	\
+	sizeof(struct rppx1_ga_params)				+	\
+	sizeof(struct rppx1_ga_params))
 
 /* ---------------------------------------------------------------------------
  * Statistics Structures
-- 
2.54.0


