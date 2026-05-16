Return-Path: <linux-media+bounces-61835-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAsAGHveCGp09AMAu9opvQ
	(envelope-from <linux-media+bounces-61835-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 23:15:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8954955DD47
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 23:15:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4D3DC300D767
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 21:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966C4383C8F;
	Sat, 16 May 2026 21:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="0C4UScd4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bFc5qquK"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B780537DEA5;
	Sat, 16 May 2026 21:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778966073; cv=none; b=VilMyiLNhCbOs0e+TN7atZegwTEDAw1M+GrGsKBNrIGz9m0X1nW0IVzQusS7vVwFyDAf1E9/r9cHhF5EIxsXTnEd718Fh884sBoihaUr+gxXnu3peUEJERMMQWhC4zqB1kZN98S7SwWKuAo9jA4aL+GgFgDQEr5u0IM7CxR1Iic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778966073; c=relaxed/simple;
	bh=oijJBn/T7XMK5IB6Z+Esx54XI1eXTznJhep/cgR/Sr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OTXAbY/y4arYsxHJO2uZF8k6tOLXJGvhJT6FIeU9WPK2VVZK8FrMX3vFhqAYqyho+WUhHOQGZI7hpKTSSevowtn/zkxzJmgNe9/mtreVp/owAMEPjrBUPeKbyIQr5W8A0pfXYrFPcR0XCI9iSbjgaKBdoWe/62K/CMWw0M2MaRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=0C4UScd4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bFc5qquK; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id F330BEC00DA;
	Sat, 16 May 2026 17:14:29 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Sat, 16 May 2026 17:14:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778966069;
	 x=1779052469; bh=hI34xtXbgwXdLDFfMugYnhfob+7cPzScjY7uHSf/GG0=; b=
	0C4UScd4AXkNcNlGuhMUxReD+L+JVSr3EEJgQ4L2NsyWZF/lwDu1JApWbEbw7lSU
	b1MnXqDf0QP3VAuzZmI36wxsLc2QFlXsbfUtzXjsFCxMtZhw0i+8jATMKWtjIgLY
	w+c0y66nZq1jzBv3uAvEnYSle/xLQdAXVKMEuTrGPBF5JT7nJJYFxjRfTy2ZpRaS
	nj8TkV1MBnJV2V4wbPU0Z/uKjNNgxu1JeKTh45q+8rDFrtprGnjLWpWN9sltNBL3
	fh85A7Q62OJEIhfsDqS59gG/fY1FFlnRwwUj//WdAWTIDA45vJ/u/E/0gXy342zO
	Ug99rbNBoHOclG2oqM4kFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778966069; x=
	1779052469; bh=hI34xtXbgwXdLDFfMugYnhfob+7cPzScjY7uHSf/GG0=; b=b
	Fc5qquKuE7gj50ySRjZ8+FF0nj5WYaF+Y2kzU11E/9zWF5GMQhbov9kevlX0H4AS
	ZD8AldkzLar3/Og4ioTw+re5uTbhj3dovGdRqSxtPBqXWbwS6dZJBzX03Dq5mtS3
	swUfs+JUE+kx766BFWVjwAHjieM4S+I6K6MYw1XjYYE9TK/PGpofMs1KNd3vJMGr
	xS53YHsue0wM8og/zMJxP1SXUaISsTcml2+7dm32dyVlYmOT0K523buHre0tRG2x
	557i5ElaaJE6SYhxd/i4M9puKmssJ7GBLCzyrNLbspQmAp1vNUIOPsvLRHYoAo37
	Uox2x2I43tJAMkTffFzbg==
X-ME-Sender: <xms:Nd4IahrFZ001mWHs0qadLOgVHuHt_XTlUVl9bYOWWCiNCUPqmv-DOA>
    <xme:Nd4Iapq_Pkk353DXXZfJ8pA_BB_IJ_V59Tno8YcDQOvVo6d9U0-dHXkJuUSCiR6g3
    b90cLQInW1tiPQvGRFQHOB_iT92SElsRX22mgPQELETF9kSBCYQVGk>
X-ME-Received: <xmr:Nd4IapBZlFF1umQsqEVeSsSPAN2hLa0FWNL4dRKTSYSmZwzKtzHGN0nQgna79c9STfNc9HGrTxaDDrWkYOa2DGoOMFIxpyP4m7NX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeegfeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopedutddpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhn
    sghorghrugdrtghomhdprhgtphhtthhopehjrghirdhluhhthhhrrgdorhgvnhgvshgrsh
    esihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepkhhunhhinhhorhhirdhmohhrihhmohhtohdrgh
    igsehrvghnvghsrghsrdgtohhmpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgr
    rhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvg
    guihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgv
    nhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlih
    hnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehj
    rghirdhluhhthhhrrgesihguvggrshhonhgsohgrrhgurdgtohhm
X-ME-Proxy: <xmx:Nd4IavuS0zd4mDbFRwJRiBO9FSFZ0hh0KG5kHwSaCqwwv7OpKGazBA>
    <xmx:Nd4IagLZAY7MTBdp2hbRJrW36OVRR9bluU4mjarAq5OJCad7PXCsUA>
    <xmx:Nd4Iaua3EUzgyiBpcaIl9Amve5nZGPOANsFGyHX6u1vr5hi0BRVFCQ>
    <xmx:Nd4IaqA0GkJVA3BYLi0YMKeBN-ETD9sCCQ7XFPoIl3fbZIvuKg08Ig>
    <xmx:Nd4IarO5KWF_-1jTBiE0enzt0E0VJaVohqrBd2cnIzmOReeNhRQu-zsW>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 May 2026 17:14:29 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v9 13/13] media: rppx1: lin: Add support for gamma sensor linearization
Date: Sat, 16 May 2026 23:13:20 +0200
Message-ID: <20260516211320.3041412-14-niklas.soderlund+renesas@ragnatech.se>
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
X-Rspamd-Queue-Id: 8954955DD47
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	TAGGED_FROM(0.00)[bounces-61835-lists,linux-media=lfdr.de,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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

From: Jai Luthra <jai.luthra@ideasonboard.com>

Extend the RPPX1 driver to allow setting the gamma sensor linearization
configuration parameters. It uses the RPPX1 framework for parameters and
its writer abstraction to allow the user to control how, and when,
configuration is applied to the RPPX1.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v8
- Move declaration of dx_lo and dx_hi to top of function.
---
 .../platform/dreamchip/rppx1/rpp_module.h     |  1 +
 .../platform/dreamchip/rppx1/rpp_params.c     |  5 ++
 .../platform/dreamchip/rppx1/rppx1_lin.c      | 54 +++++++++++++++++++
 .../uapi/linux/media/dreamchip/rppx1-config.h | 48 ++++++++++++++++-
 4 files changed, 107 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
index 948e26d7361d..072309d8662d 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
@@ -48,6 +48,7 @@ void rpp_module_clrset(struct rpp_module *mod, u32 offset, u32 mask, u32 value);
 union rppx1_params_block {
 	struct v4l2_isp_block_header header;
 	struct rppx1_bls_params bls;
+	struct rppx1_lin_params lin;
 	struct rppx1_lsc_params lsc;
 	struct rppx1_awbg_params awbg;
 	struct rppx1_ccor_params ccor;
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 86d445b52504..a75a27a8afd0 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -19,6 +19,8 @@ static const struct v4l2_isp_params_block_type_info
 rppx1_ext_params_blocks_info[] = {
 	RPPX1_PARAMS_BLOCK_INFO(BLS_PRE1, bls),
 	RPPX1_PARAMS_BLOCK_INFO(BLS_PRE2, bls),
+	RPPX1_PARAMS_BLOCK_INFO(LIN_PRE1, lin),
+	RPPX1_PARAMS_BLOCK_INFO(LIN_PRE2, lin),
 	RPPX1_PARAMS_BLOCK_INFO(LSC_PRE1, lsc),
 	RPPX1_PARAMS_BLOCK_INFO(LSC_PRE2, lsc),
 	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
@@ -68,6 +70,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
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
index 0a0e7ab2d1d6..04a92f24ab49 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_lin.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_lin.c
@@ -25,6 +25,11 @@
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
@@ -53,7 +58,56 @@ static int rppx1_lin_start(struct rpp_module *mod,
 	return 0;
 }
 
+static int rppx1_lin_fill_params(struct rpp_module *mod,
+				 const union rppx1_params_block *block,
+				 rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_lin_params *cfg = &block->lin;
+	u8 sample_mask;
+	u32 dx_lo = 0;
+	u32 dx_hi = 0;
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
index 05faec2f68e3..72f3fd836f41 100644
--- a/include/uapi/linux/media/dreamchip/rppx1-config.h
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -93,6 +93,8 @@ enum rppx1_meas_chan {
  * @RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE2: PRE2 Lens Shading Correction
  * @RPPX1_PARAMS_BLOCK_TYPE_GA_HV: Human Vision Pipe Gamma Out Correction
  * @RPPX1_PARAMS_BLOCK_TYPE_GA_MV: Machine Vision Gamma Out Correction
+ * @RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE1: PRE1 pipe Linearization (Sensor De-gamma)
+ * @RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE2: PRE2 pipe Linearization (Sensor De-gamma)
  */
 enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
@@ -111,6 +113,8 @@ enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE2,
 	RPPX1_PARAMS_BLOCK_TYPE_GA_HV,
 	RPPX1_PARAMS_BLOCK_TYPE_GA_MV,
+	RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE1,
+	RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE2,
 };
 
 /**
@@ -546,6 +550,46 @@ struct rppx1_ga_params {
 	__u32 gamma_y[RPPX1_GA_MAX_SAMPLES];
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
@@ -568,7 +612,9 @@ struct rppx1_ga_params {
 	sizeof(struct rppx1_lsc_params)				+	\
 	sizeof(struct rppx1_lsc_params)				+	\
 	sizeof(struct rppx1_ga_params)				+	\
-	sizeof(struct rppx1_ga_params))
+	sizeof(struct rppx1_ga_params)				+	\
+	sizeof(struct rppx1_lin_params)				+	\
+	sizeof(struct rppx1_lin_params))
 
 /* ---------------------------------------------------------------------------
  * Statistics Structures
-- 
2.54.0


