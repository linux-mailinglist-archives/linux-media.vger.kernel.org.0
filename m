Return-Path: <linux-media+bounces-64629-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 221dOLMeK2rU2wMAu9opvQ
	(envelope-from <linux-media+bounces-64629-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 22:46:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D970067548D
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 22:46:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=X6lI2E02;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="K coU8sh";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64629-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-64629-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7833E303D6D3
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 20:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66C39348C66;
	Thu, 11 Jun 2026 20:42:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4927E4DD6F7;
	Thu, 11 Jun 2026 20:42:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781210556; cv=none; b=bWpRV0/UD9WSz+gmJfa6tqkTCwzizHy89QUyo+85iFuDqUML5hp3ujezeQjLZiWWsN28Ohk68ETXX6REc/VH1QipeWErBW2fqe1cM/JJbN3IZNY07mAgqeuL1g6RprY6MbBqOTkd7zDk4uwwgViFYZP7HjsI+80z5wbDFhXsNAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781210556; c=relaxed/simple;
	bh=aNaPwUa2+Yas78xJKIrDYUP4e6cgKejAdg2EovMKusg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bFEdw2W5ZSdJuDiATHOEjP/bzMyAWRfh3pOntRcyRFMk/QB4kHJRrazi4Yzv/e9HSiNubyRKbdBtGF1QM9El76tGOsm/hNxJHK7rujWQPTDWIAfOprSygd+78ksBGJicNGasiXMbR2RPqQadglFp4BD+EA/Kz4DhFuE99yG2SLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=X6lI2E02; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KcoU8sh5; arc=none smtp.client-ip=103.168.172.152
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 78CEB1400079;
	Thu, 11 Jun 2026 16:42:30 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 11 Jun 2026 16:42:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781210550;
	 x=1781296950; bh=7ecR3jL3VnngSQER7ibEERK/D9/GoTatlfN8Aalp3O0=; b=
	X6lI2E02R+vBhBk2UrU0Hcw3qyWN9hr0XodN8Jz+rfX9gyJWdkH4GsqpmXi7cysS
	Unqbk+fncNaMpBxE5t7gSnHeNHczBXsnsD4vgViSDneUubO1vPROjQdR8Nw0wKKw
	AdPjsZpIM+wtdmvmXyHQFHoJjRIUYHZOBFohjuTZQmWpYY17rBX4njNdMMuBRLFR
	SGYFqEj37yaEUAqXFMFL9f9XhevzX0XZMPCTAfjU+WdpfIRElthiOVuY0MK5V643
	zS7xvWDkidI8UEfHGYCpn+wttWNp7o9zeytN8nijHLdZ0qRMMm86CZaMRrJdcI0J
	x8CwEAi9/IQy5flMCeoSHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781210550; x=
	1781296950; bh=7ecR3jL3VnngSQER7ibEERK/D9/GoTatlfN8Aalp3O0=; b=K
	coU8sh5vXOHVhEvXUgUcusNDMmbcXnTZfE1fcSLZyqPmlXlKZXB/MIDr60xHg67W
	1UDTs8olbuv6+sBcd8FRW7s7mCEEAmIgxx4En8el+TA5WhperE0W8fG613W4VLCK
	Zy2oJpNHA2xx9KIrWCn3WX4J0zoVUq1aubfAMQXy7x0I2aikpvoCoRkizJLle6xi
	8W96wc68heEP302sG6NLMGcfzxdISgg2CmmpIjfXQPNoJebAR82JeqeqrGJ5+2oM
	t/m/RUhTL1Tryw1NIUuUcBGLxFGiYWEKnHfeBhpsZUXeuaQfwAP+Se4KcqqPzXbm
	EnOWgfk827BWyVlnd/Y/w==
X-ME-Sender: <xms:th0rags4NS5GgT18H9a6tkbaVnJRuIIjybfLBOQOo941MJP9AvCarQ>
    <xme:th0rajc2KYqN41p6vQ6Ctig7mRSJkFnUIoOp78Pd3_ulsHYjlV9l0HgAwCffviEG-
    m-DDqDvqXrPnmToG9VPvxKm-XyUZcek-5gGFAo6OkmRpILVNq19Pg>
X-ME-Received: <xmr:th0ramnotRoJRvO3FHItUXIyLQWpL0_WCKuZUZyNY29m7KgajCJLUFwvlP71k2qLJug3pLCyqgKnBW_kogCEVehgZi29>
X-ME-Proxy-Cause: dmFkZTGxElkQpZKuuZIqkKBJAFdRhkHm/9iYIJMf9OZbtUFKoFmvg3oWFyWDIgyTOM0Jba
    2Q6bwItLaOYA3kzoPcZe/N+kpo9DXAwczNA0VXwrjxbGx0lD2XXXlr3nsZMZb0xS4b6XXe
    I6iW3031atpYYSTEncWcwXnzdf5jCUyIHlKnUqoQN2MsRbIrSh4OQDyLy/jJRFPtBa7IF5
    rIOcFVsNMhucIeQfJcSDZj21MW0HM2+2r1mEWmR9Me0JkGW3nVOb6+uq0O8fbWZgX4+nsR
    HEtMRdZF7zaasRzz6Vm4jiAnpbSpUdOkuebJWUCyBz9msAxYj7jERII9BhifZnQbpsjJoF
    Ei6qDZo3bursPGVBOeND3YVVGmYzBMda/Y83pZKjiiWRYK3E1tJbdCf4rbuAJAWZveBmEb
    itMslDvu4GxAKxJAQIno2ZnqWILCWPI10xnis8TFv6yXe2a0w+EBUUvMt9Z5M7Ct8GLBpO
    w6k15rMmrAFuKA1ksaG+YYf7Tk5JrQUvIE/6KTyqQw3gcspAIwY3fixzTdKEzQTSZG1HwA
    I2U5rgpsjnnJSxNqoKkwZNKeKJNErlWKyFNUEkEFKoIGNhnuu962ER5tcLp0mnVxQ5mxTm
    l19BOaVeDNMyPo3l9RM8Cs6LGllmruIHf+qSCxo26V2h5t28qH2nsDAGrF+Q
X-ME-Proxy: <xmx:th0ramBbgN-Kiec3JF9GtHBGI-Apk1rWmMBmqnMLy5w9JBBbHwNXUA>
    <xmx:th0ragPquYEJuduJlEBXllaXhwxROeqYT82ZjJnvxBTZSU2WXcu7hw>
    <xmx:th0ralPbo_vkKeUUCE_wKe7-Yyf6pKgiI52Lmjif5uhcAiRCsNvDmA>
    <xmx:th0ragk4o33f25W8S6XP-9dYRAUIlfG4twPVefWT7Pf6-47YmR_2UA>
    <xmx:th0ramtH6bfKhOyGlcBQRp3sqIpSps287D5cdLE4lH6cyp_0H75eA7w->
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Jun 2026 16:42:29 -0400 (EDT)
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
Subject: [PATCH v10 12/13] media: rppx1: ga: Add support for gamma out correction
Date: Thu, 11 Jun 2026 22:41:47 +0200
Message-ID: <20260611204148.1423192-13-niklas.soderlund+renesas@ragnatech.se>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64629-lists,linux-media=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:jai.luthra+renesas@ideasonboard.com,m:mchehab@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:jacopo.mondi+renesas@ideasonboard.com,m:jai.luthra@ideasonboard.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:email,messagingengine.com:dkim,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D970067548D

Extend the RPPX1 driver to allow setting the gamma out correction
configuration parameters. It uses the RPPX1 framework for parameters and
its writer abstraction to allow the user to control how, and when,
configuration is applied to the RPPX1.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Co-developed-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
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
index c8378910bee5..62e26e9917f5 100644
--- a/include/uapi/linux/media/dreamchip/rppx1-config.h
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -90,6 +90,8 @@ enum rppx1_meas_chan {
  * @RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST: POST pipe Color Correction
  * @RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE1: PRE1 pipe Lens Shading Correction
  * @RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE2: PRE2 pipe Lens Shading Correction
+ * @RPPX1_PARAMS_BLOCK_TYPE_GA_HV: Human Vision Pipe Gamma Out Correction
+ * @RPPX1_PARAMS_BLOCK_TYPE_GA_MV: Machine Vision Gamma Out Correction
  */
 enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
@@ -106,6 +108,8 @@ enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST,
 	RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE1,
 	RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE2,
+	RPPX1_PARAMS_BLOCK_TYPE_GA_HV,
+	RPPX1_PARAMS_BLOCK_TYPE_GA_MV,
 };
 
 /**
@@ -496,6 +500,51 @@ struct rppx1_lsc_params {
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
@@ -516,7 +565,9 @@ struct rppx1_lsc_params {
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


