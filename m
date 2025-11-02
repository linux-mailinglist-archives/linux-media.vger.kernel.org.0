Return-Path: <linux-media+bounces-46157-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D402C298FA
	for <lists+linux-media@lfdr.de>; Sun, 02 Nov 2025 23:59:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD8A03AF289
	for <lists+linux-media@lfdr.de>; Sun,  2 Nov 2025 22:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0CB1253F3A;
	Sun,  2 Nov 2025 22:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="eAIbNjo7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LevfHHYx"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E90024DCE9;
	Sun,  2 Nov 2025 22:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762124236; cv=none; b=Htkms3ISh5CCnqmPMxZzXY0tuXk5b5D18fn/pjJQfU/p3YfCi31UiJGVFipbbORsCWMgAXr96ts5Q+83R2J4lzfm5NSz/ML63gFPs0Nb0j5uODCxJloJ0I1+wKk2UjOEJJPxI3l8b6qC+DUH+M8un7fhNGjYI4E3DSC79n1H1eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762124236; c=relaxed/simple;
	bh=P0uVtaF/QS7iXfJCWsjvD8+eDjvHX3cC57Lr4zxELVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oClUzOSuAdVTq4JmMweZOvIJashPHFlAib4ldSfROgWhf+DITDBY8cfp5mm11F5ziRjCv8AScxiZ3+iImE7IuLs/V/BjQnj2fj1Wbnu9qoM9iJJVgXyEH4nB/pUYYsF4q+YjGuN4nMiHzzxhbJUZ9JZIVbjltaQ7W45WVjvpaSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=eAIbNjo7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LevfHHYx; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 705481400267;
	Sun,  2 Nov 2025 17:57:13 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sun, 02 Nov 2025 17:57:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762124233;
	 x=1762210633; bh=07/3PMlGyH9QonG0Ren3tqPZwNTWC9LujZK3ALI3M3E=; b=
	eAIbNjo79FAhZ6t7q3Ycwpt/Rch/LhfUcxUGJSDWQOnkiVPOBT9lBSssOXsvU3F+
	blveanli8vybARKin7xrTWchw98WUt5lI2a17kt6K40N2gIVmcuo8v4lG2ODjalY
	gZbLCPiPJQozu+98BQolexjgW2H/q55eDz0wMp2r0KZ6yoOc8SkUhJtS1Rf/KR0m
	5By+JDmgP0QpFTGNM7yzOiMxj3Hl6lGWyDM/dLD9jhgGxHSlWAuN8pS9iCzVCEIC
	4QU4UtVqA2/Uy1vvP2x3386oxri/Noviby451fyjdsw/fhutUkKmI7XKxF+/cQuF
	9xGi9PLK4rH1MzTByq8JWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762124233; x=
	1762210633; bh=07/3PMlGyH9QonG0Ren3tqPZwNTWC9LujZK3ALI3M3E=; b=L
	evfHHYxLq/IBToHTovyA/NtMfbEQEcG/m267s3Dd0hirbrKcHniUOLzQzG7YmYKi
	vTzmlBAntqPPY5Xwd8mrtTPijxZtPQu0jbMWlFYAK7NDfYuG76RryA0Nc7zyyTWj
	m5NbEBiKu0yGc3xaF8ysshhpw4vaI47X9X5PK2SwClAbtasKrhExR79nNvjI9Vo5
	BnbGZkWqhso2B7mT2GBTuoCvGfUmGiLXIxpQjRKKtLTgwLoaov8TUgOwkL0kwBiW
	xsqN9VRVxP04KwnnAQvnHhGqG2hNw1GRyOb6aXE9Gem2pLSeO5hAQPOzGRcnlEnB
	exldpbHD2dVQrh6MPExZQ==
X-ME-Sender: <xms:yeEHaVLktDncYLzRUp3gaizCRLDlW1u_kGLxjMz5vchOB-VVNzcRSw>
    <xme:yeEHabNCDAFOH991e1nkYeAg8j-s6LoyZvuTVTs2VYuEuXEuaQpagYuK5oUJ54ZTR
    nP8P-sS4QqLMeOV4UIBmgGRmaYRa5nCc9Saz3Md0ZrJjUOyki2zjA>
X-ME-Received: <xmr:yeEHadmTA6EKza_xcGX-0IcEWLjAbfZ9pJv61xqjwmVc_5bM0z2By5xJdsm8kc7dEPB-X_5oOQAihG6N3h8wYk3V>
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
X-ME-Proxy: <xmx:yeEHaX7kz81G1-h3UehfQakxNHFjR6tJUzj29Pp9pmgNYBLHQVf1RA>
    <xmx:yeEHaZ07guQu4hrsLBvWxloxOkW3RJFCLwZFYJLvxkHICeCdgs4J0A>
    <xmx:yeEHaaGNp9zf8is9_igu2YECmXimoIMJYea6jpE9Nu8EM4eT13bvxw>
    <xmx:yeEHaQiCQNNR8Jz5gC8djEdklGfoWrG37_-TevaM9Qv_iFWOmM0FNQ>
    <xmx:yeEHaQn90tMmH0I1ijfeB6F4I1diealc1vZC4u_B1sBYItMc0nt6gEpM>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Nov 2025 17:57:12 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 04/12] media: rppx1: Add support for AWB gain settings
Date: Sun,  2 Nov 2025 23:56:34 +0100
Message-ID: <20251102225642.3125325-5-niklas.soderlund+renesas@ragnatech.se>
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

Extend the RPPX1 driver to allow setting the AWB gains using the RkISP1
parameter buffer format. This is the second function block inside the
RPPX1 to be enabled and it uses the RPPX1 framework for parameters and
its writer abstraction to allow the user to control how (and when)
configuration is applied to the RPPX1.

As the RkISP1 parameters buffer have lower precision then the RPPX1
hardware the values needs to be scaled.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |  3 ++
 .../platform/dreamchip/rppx1/rppx1_awbg.c     | 37 +++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index eb57f52ed676..a561c01bda9a 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -24,6 +24,9 @@ int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
 		block_offset += block->header.size;
 
 		switch (block->header.type) {
+		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN:
+			module = &rpp->pre1.awbg;
+			break;
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS:
 			module = &rpp->post.wbmeas;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c b/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
index e20bc369ca8c..da5ae3cfadb8 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
@@ -25,6 +25,43 @@ static int rppx1_awbg_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static int
+rppx1_awbg_param_rkisp1(struct rpp_module *mod,
+			const union rppx1_params_rkisp1_config *block,
+			rppx1_reg_write write, void *priv)
+{
+	const struct rkisp1_ext_params_awb_gain_config *cfg = &block->awbg;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + AWB_ENABLE_REG, 0);
+		return 0;
+	}
+
+	/*
+	 * RkISP1 gains are 10-bit with 8 bit fractional part and 0x100 = 1.0,
+	 * giving a possible range of 0.0 to 4.0.
+	 *
+	 * RPP gains are 18-bit with 12 bit fractional part and 0x1000 = 1.0,
+	 * giving a possible range of 0.0 to 64.0. NOTE: RPP documentation is
+	 * contradictory this is the register definition, the function
+	 * description states 0x400 = 1.0 AND 18-bit with 12 fractional bits,
+	 * which is not possible...
+	 *
+	 * Map the RkISP1 value range (0.0 - 4.0) by left shifting by 4.
+	 */
+
+	write(priv, mod->base + AWB_GAIN_GR_REG, cfg->config.gain_green_r << 4);
+	write(priv, mod->base + AWB_GAIN_GB_REG, cfg->config.gain_green_b << 4);
+	write(priv, mod->base + AWB_GAIN_R_REG, cfg->config.gain_red << 4);
+	write(priv, mod->base + AWB_GAIN_B_REG, cfg->config.gain_blue << 4);
+
+	write(priv, mod->base + AWB_ENABLE_REG, AWB_ENABLE_AWB_GAIN_EN);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_awbg_ops = {
 	.probe = rppx1_awbg_probe,
+	.param_rkisp1 = rppx1_awbg_param_rkisp1,
 };
-- 
2.51.1


