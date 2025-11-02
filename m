Return-Path: <linux-media+bounces-46163-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0289C29926
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 00:00:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1947D3B0FD7
	for <lists+linux-media@lfdr.de>; Sun,  2 Nov 2025 22:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 926AA264A97;
	Sun,  2 Nov 2025 22:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="VDX+WOXM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fu3xNII1"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE12246763;
	Sun,  2 Nov 2025 22:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762124243; cv=none; b=DjnT1LrNKqVManZGEAX8FL2wcC4nid8xYTMrSFkEEwHGD0Yrwgh3k3WQPtpmbKZAT1T1/zUPVRkw9n/eumUqOcV+T3AQf22Igv2QCSV+8aYiVhmSS2LfwTer4hxp25Hyj6ZKFaOev0EM/4v/TK3hNFxBWvVHgNZBPPc8neviMvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762124243; c=relaxed/simple;
	bh=v/kqNuA3ZSD73ATobYuVnD9F3dGgVkMmYB2WWrfAmJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GzqbFPFjAZ7yEZzbP2vP/TGVdxmD6ZeDRwO5VK/AxV2QzJgVf3XpgKb5U/T6f2Qhag3RupnaVRgT6XCDvGPOVzfbYT28vepePcmRGqUTAjEN1AW99teXXydXG46lKqqQU2FWTQUiFO/o8E2nha0rzcbzBQPCcJTo5kGxSyZkWQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=VDX+WOXM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fu3xNII1; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 33FA51400267;
	Sun,  2 Nov 2025 17:57:21 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 02 Nov 2025 17:57:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762124241;
	 x=1762210641; bh=kcxde6V0H6wNIshoXU1ilz41lV9yyHyehgIm1lB0CBQ=; b=
	VDX+WOXM87UjYKvmFGhZS2enyTpxe3YYu4Rq3r3qMyptgNTDnoANwDOxsij3NCRS
	jFbTPrXyfhbfQsaqblj1nD9KX7lUblq7UzhHT3TMraZ9qf3vUlTvz8Jeay19qDaT
	lkFSyvFUzlDVG6uqsbKrCuWXQfOi/1G1lJvEnC57S7j2JdT3gyI0/YBUBef2IFb9
	8Qhm3g2KAFfCZnUVV6YAGYCt1t+8PgryCTgdfMYaVQpjUYfwykvHQlVHv8JaCtOa
	ZpoyC6YU+TaIIz4QTJtL+HPRZNFEMkj2KGWSkJmUWSKo+IRh2zyyea1a1RT1eXBD
	7wrb+IK+XJ9DSNRNtVPAWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762124241; x=
	1762210641; bh=kcxde6V0H6wNIshoXU1ilz41lV9yyHyehgIm1lB0CBQ=; b=f
	u3xNII1walRgilpVYiVsvv0TBc6SI2SNAwlFg2nAJD0N9Tks+Fv+mFU7MmdOT0CH
	6EdvHGVerx0qKx5mhdJRiAbHBRznBucRIlOESxf+IkJ8DWSkJXK7yBcw0q1CDLXL
	MUFK17MqFPHEav18iSOiSx1+CTKGj5y6uYHFHmOLCiYNm7DfIz0SYiyy8/H9eoXu
	JobxSkuM1ERL3uvfO9uWX9ArVoJoMW1TxvEvvqcBOao/nIIUSagYNCFQ6OmUD6ei
	3BVagMSUxeSJL5IA7B7gQDs0y0cFRt1Xr0Yye53ZrtkvJUOcSZk3NR8DpO626iwH
	YBMvHOcDzf3jJoIqKk5vA==
X-ME-Sender: <xms:0OEHabsCXbqWVK-zsrVOCkjBX3pTSbhjoMRgJZ19wBb4Nptm5wP7dA>
    <xme:0OEHaWiLv-ogWnx8Mwie-T6thhDll0LM33MoGdMcJ_Eza0lYhayoJqzD8wMvIt4-L
    oBWPMiXdgXofKA-qO1Dvsz22ecfq5VGHlKWfYHJPsAMtJQ13-F_C-0>
X-ME-Received: <xmr:0OEHaeomiDJR8X36TPayKY8mIkjJQG0-jvh4hFgPaF59Y97Utxh5aihaBYQzgfNO-Z7OqhWAHL36NrCqJfg8KNBU>
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
X-ME-Proxy: <xmx:0OEHabvIDzE7T5vjKvxtD8mk8bpUhtM-vJh3fTUPEuO_6GIwy2bK2w>
    <xmx:0OEHaZY3Adx59vX3PVfHBeNG02FSq4KS3aEQ2PQhcEPJEEdjpKVqxg>
    <xmx:0OEHaaaMpotHBu-kQxml47zMBNV1FX65mp_3hnzIb-oNWnIDXFnYiQ>
    <xmx:0OEHaSmVjd2cc2_3FyZClEL2TqstysYSWyjejWP48pyIOtLAjhJENw>
    <xmx:0eEHaW7BFHsXgvkoO9-0VMfstRxJ_v3SEa9a5mbGFcBX58wzyf6EbcJ6>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Nov 2025 17:57:20 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 08/12] media: rppx1: Add support for Color Correction Matrix
Date: Sun,  2 Nov 2025 23:56:38 +0100
Message-ID: <20251102225642.3125325-9-niklas.soderlund+renesas@ragnatech.se>
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

Extend the RPPX1 driver to allow setting the Color Correction Matrix
(BLS) configuration using the RkISP1 parameter buffer format. It uses
the RPPX1 framework for parameters and  its writer abstraction to allow
the user to control how (and when) configuration is applied to the
RPPX1.

As the RkISP1 parameters buffer have lower precision then the RPPX1
hardware the values needs to be scaled. The behavior matches the RkISP1
hardware.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |  3 +
 .../platform/dreamchip/rppx1/rppx1_ccor.c     | 74 +++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index afc80a480d42..c2c8349a2837 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -30,6 +30,9 @@ int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN:
 			module = &rpp->pre1.awbg;
 			break;
+		case RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK:
+			module = &rpp->post.ccor;
+			break;
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS:
 			module = &rpp->post.wbmeas;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c b/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
index 4754b0bbce0a..0ccaed8ce55d 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
@@ -68,9 +68,83 @@ static int rppx1_ccor_start(struct rpp_module *mod,
 	return 0;
 }
 
+static int
+rppx1_ccor_param_rkisp1(struct rpp_module *mod,
+			const union rppx1_params_rkisp1_config *block,
+			rppx1_reg_write write, void *priv)
+{
+	const struct rkisp1_ext_params_ctk_config *cfg = &block->ctk;
+
+	/* If the modules is disabled, configure in bypass mode. */
+	if (cfg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
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
+	 * RkISP1 coefficients are 11-bit signed fixed-point numbers with 4 bit
+	 * integer and 7 bit fractional part, ranging from -8 (0x400) to +7.992
+	 * (0x3FF). 0 is represented by 0x000 and a coefficient value of 1 as
+	 * 0x080.
+	 *
+	 * RPP gains are 16-bit signed fixed-point numbers with 4 bit integer
+	 * and 12 bit fractional part ranging from -8 (0x8000) to +7.9996
+	 * (0x7FFF). 0 is represented by 0x0000 and a coefficient value of 1 as
+	 * 0x1000.
+	 *
+	 * Map the RkISP1 value range by left shifting by 5.
+	 */
+	write(priv, mod->base + CCOR_COEFF_REG(0), cfg->config.coeff[0][0] << 5);
+	write(priv, mod->base + CCOR_COEFF_REG(1), cfg->config.coeff[0][1] << 5);
+	write(priv, mod->base + CCOR_COEFF_REG(2), cfg->config.coeff[0][2] << 5);
+
+	write(priv, mod->base + CCOR_COEFF_REG(3), cfg->config.coeff[1][0] << 5);
+	write(priv, mod->base + CCOR_COEFF_REG(4), cfg->config.coeff[1][1] << 5);
+	write(priv, mod->base + CCOR_COEFF_REG(5), cfg->config.coeff[1][2] << 5);
+
+	write(priv, mod->base + CCOR_COEFF_REG(6), cfg->config.coeff[2][0] << 5);
+	write(priv, mod->base + CCOR_COEFF_REG(7), cfg->config.coeff[2][1] << 5);
+	write(priv, mod->base + CCOR_COEFF_REG(8), cfg->config.coeff[2][2] << 5);
+
+	/*
+	 * Offset for color components correction matrix.
+	 *
+	 * Values are a two's complement integer with one sign bit.
+	 *
+	 * The RkISP params are 11-bit while the RPP can be 12, 20 or 24 bit,
+	 * all values are excluding the sign bit. Figure out how much we need
+	 * to adjust the input parameters.
+	 */
+	const unsigned int shift = mod->info.wbmeas.colorbits - 12 + 1;
+
+	write(priv, mod->base + CCOR_OFFSET_R_REG, cfg->config.ct_offset[0] << shift);
+	write(priv, mod->base + CCOR_OFFSET_G_REG, cfg->config.ct_offset[1] << shift);
+	write(priv, mod->base + CCOR_OFFSET_B_REG, cfg->config.ct_offset[2] << shift);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_ccor_ops = {
 	.probe = rppx1_ccor_probe,
 	.start = rppx1_ccor_start,
+	.param_rkisp1 = rppx1_ccor_param_rkisp1,
 };
 
 static int rppx1_ccor_csm_start(struct rpp_module *mod,
-- 
2.51.1


