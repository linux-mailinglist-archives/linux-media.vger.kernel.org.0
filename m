Return-Path: <linux-media+bounces-46165-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF3FC29930
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 00:01:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12383188E1BA
	for <lists+linux-media@lfdr.de>; Sun,  2 Nov 2025 23:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F74525A353;
	Sun,  2 Nov 2025 22:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ctwucj6j";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="t5+tA9vE"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDE7266B46;
	Sun,  2 Nov 2025 22:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762124247; cv=none; b=PYC4j5pkvKTiHU3iSMhrD0A5wU8dewNhTDrf88+EHOB+6YoquSfzSpFS4joRFOh27JcUsbTVoZMQiuGe/PLdVmvRLkmQQXlhF/i5Ydz8VSYU2JGxY79ohEbYfyUgwAEdd/DaG+eQusgol653ay1xbDBzksWFoMpjqnSxZzfeWPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762124247; c=relaxed/simple;
	bh=w4Uyq0SrHJqq+x7eMwLd6JHqyXtI3MAeTlpbLd7R5sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qS4FajxwANrB3yV08W0Ps0MPbe+E2goqi348HjUrrlD/x2zI5x2ZyzKNZoyyomciD4MI6T+PeZHDhDoEek1x4rxU2at4n3n84ecPgTQZLO+WoWTT+yE1VTo7yCGBBV6X+aVADfdB8HgWxa6N+9TY/Z4nAnGn6z7hOCwF195ZsY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ctwucj6j; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=t5+tA9vE; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 0A8CCEC00D9;
	Sun,  2 Nov 2025 17:57:25 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Sun, 02 Nov 2025 17:57:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762124245;
	 x=1762210645; bh=IHkZyyooR85D1mXbiSpFLDlwzKm/HBD1Pq0YvK3HGX4=; b=
	ctwucj6jMRqHmh953Iec6F3ssPI7X3b+nXjU0OePKVdgU1efr6SFpz8JEgR7Ohtr
	oA+8e6k2nNAlNax/rcjs4E2zAm8LkeaGr6vB4jaDuXrzPrvbNKzQ7YCiYJSNr0f/
	oFX85JRVKIJSiRLB2kYxWwjVxGYvWa8Tl8G6hjarVwxNaaClzVCLsnwQcRWcY4HU
	w4WfkwcrS+NKdgweQ+gMqkoRGpmZfX0FRRJZEtcth+BdhSbEe0EUtIB2iM9Z/0hg
	ygaNajDwSDELlQ6HMNMe62/ouOSoJJbXpTeOPM+wvwyqh/5S4fD4uBjw2LbWQuk9
	kRIp8gfOW+eKMq1bmgZQUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762124245; x=
	1762210645; bh=IHkZyyooR85D1mXbiSpFLDlwzKm/HBD1Pq0YvK3HGX4=; b=t
	5+tA9vE5bNXwOz07BuJBjGAu7mzV3nzCI7lZ93NEnJyaT0FwUp2geU6UWOw39IOd
	yuaFa6XsksOKnnglj+Z1TVOXCQQexv8HSjUovrDyTXaPMIwwJx3TTA2XQzZRf50I
	fRFqY8bpVykx5Pd6Z8TOKR0NBZ6U0iaM+47G7B6CNSc52WhCq8W9dDeJvDpfQydg
	bVTMGa9+0Jg5KfNXeVaKS7UHBB5O+x7ZbpMppOLbRWk3PNXwnM2LVoBJghCoSDEm
	pWePqoN2HeURpWFmUmtp/i8VKKbxATLX3GZ0DikYyGETo51GTI/R1z34uZDo753r
	C7fj9/bmwdv0V+hzc81Gw==
X-ME-Sender: <xms:1OEHafjtCRXqOxLSyXYAIWPC9p0-6-XzldD2Yf2O1H0fPUrLjZIWfQ>
    <xme:1OEHaWGC9KNd4MXw_ZYzQgYqtiPiWXAnJJFybtYXbAg8zdAxslpU77ClSx8bsZB32
    pY2-El9seKfEBJoG1Vi410o9lxabBhykhSc0jbVyJgtAElpTJ5tpv4>
X-ME-Received: <xmr:1OEHae8EhT-YR6CAUnyFCvKhIqvG42kdFkTiG4jUX_Wk4ouNQhQ0Nvj6N9NLC_9RV9s8-JDjz1dCyUzswdpMqCSd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddujeeiheduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeejpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehjrggtohhpohdrmhhonhguihesihguvggrshhonhgsohgrrhgurdgtohhmpd
    hrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghr
    ugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhn
    ugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:1OEHadzOzupVVNsFRfXxWZ40UvlhLzYUmPgxNznta--kQdwi5zE2aw>
    <xmx:1OEHaaN5RNaeSDVtIETSM_qQIh0WU693nW55YKrmgkbC3KvbSKY54A>
    <xmx:1OEHaS9anbFEcxTDxPzLq-kqU1r634EOl0fnVMaqN017dpccCYjnNg>
    <xmx:1OEHaX4umAy7_V6JVpigD0iSc05G-V7ktWjFqY86IZ6z6AYc3uA8yA>
    <xmx:1eEHadc7w3RkYpCxV0IMxNc264UgmaydGPYoUWe0Zo2_C2dhicb2eUj6>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Nov 2025 17:57:24 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 10/12] media: rppx1: Add support for Gamma Correction
Date: Sun,  2 Nov 2025 23:56:40 +0100
Message-ID: <20251102225642.3125325-11-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251102225642.3125325-1-niklas.soderlund+renesas@ragnatech.se>
References: <20251102225642.3125325-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Extend the RPPX1 driver to allow setting the Gamma Correction
configuration using the RkISP1 parameter buffer format. It uses the
RPPX1 framework for parameters and  its writer abstraction to allow the
user to control how (and when) configuration is applied to the RPPX1.

As the RkISP1 parameters are all 10-bit while RPP can be either 12- or
24-bit, the driver corrects for this allowing the RkISP1 parameters to
be used.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |  3 ++
 .../media/platform/dreamchip/rppx1/rppx1_ga.c | 34 +++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 8491ce88ab90..323ee792426e 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -33,6 +33,9 @@ int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
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
2.51.1


