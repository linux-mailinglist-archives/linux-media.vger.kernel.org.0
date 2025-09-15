Return-Path: <linux-media+bounces-42574-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0ED7B58309
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 19:12:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 461DB1A2495F
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 17:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4488F2E7650;
	Mon, 15 Sep 2025 17:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="TdRZXZbb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lWxjdzV8"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA9B2DE6E8;
	Mon, 15 Sep 2025 17:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757956247; cv=none; b=FkWHTLVFU812qBNyQSmwhcCQiqMIMr7G5y/F2m0d69liziEOfUNud5dSWyS+Ir/GDoNcC4ZGfuEnYz19zh1L0etGWYhQzSUFon3vcg5LHnnUNA7TYIQetJ7mssoUPOJL4WShDemE+qJEDTQMjPRpOX+l9icAdKpiiBNo6rd3JQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757956247; c=relaxed/simple;
	bh=sJTbXXngzJNFtPf5fBJ8qMT08dQ0ouBCzAJz9Bs/ynA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NbB/VkYEWaKkW5Utot1E9tPk3htmms3Pcy5k+z0fhU9j3IvuNoywp2L6yiQYuYjmvJnNAAEzjAGhaeUT+Gn90xNrn2wI3ieAnrN1hUKYmR3ECYmCpt0i5tsNoIM7T4fXdsoNcMzih5Naw4So7bXgqCzjglk8uboWTOm6lHNe8Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=TdRZXZbb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lWxjdzV8; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 300A21D00153;
	Mon, 15 Sep 2025 13:10:44 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Mon, 15 Sep 2025 13:10:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757956244;
	 x=1758042644; bh=LmvZxPwatK4qKPxXge+q3IDINjzHCMSgdKqn29GSQoE=; b=
	TdRZXZbb+YpwZqG5QFcKebUHFFBAf0XeZUrOr2ery8uMWn+wIB9Fy2c9+uWc61b2
	o1mNKJgKw9Euw5t/UEGLi+JZFtgiw4dYDnJLxFNdgfBZB5a7MJVTjSpwCG408A4C
	iV3PHYfeKQeCOu4ETAomwTvlU2Qy8oUmcFHX1Rux58GLHE+OseULGj1zlBs/5Skl
	ymejqEaad2AJXw8UpNBh5w1psszVA70CbwJrqENQMjsBLPjz9lDrzd8Gcu5xS6bo
	Rkv/zf7K31wIhDr6hydCBMl76fVXqXvbbLVFXCc/TveXwhHu98S5iglIJd6A8jIx
	CSg8lb3/OMH8aCjtPAb4NA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757956244; x=
	1758042644; bh=LmvZxPwatK4qKPxXge+q3IDINjzHCMSgdKqn29GSQoE=; b=l
	WxjdzV8H6Iv98BgGtTn4zNX8hAyu3c4ro1/hEqpJvv+tPYinPrCvbtmk+c9s0EKk
	4cPZti+QToC+4+rRGqkVR8MMXCSgw3uo601XaLDAi25qhNr+1xoYLT0OjVDUIWaC
	Z49MjC9phsBXT5Thgdl2miUZXlRrvAzj+MyKANZ5F5OSBxCJIbIOwaRb5CB0V1GO
	hXFdxyRr/vTWxkEQXT+fl4yxNk5fcXph40APcU+p/stNrOkUGoJdCD5DjktS312+
	UrfpDaDFnjP90Np8crAeFw9/2x5hBshc/9JNtlv/qSp4vuQcFQEYsU0VmvclU8O2
	ZFEwXidm6qqk9vunDDf0w==
X-ME-Sender: <xms:k0jIaBvxq0rnngOoADNaRYB-d172KTlFMRTyrRVQG16R4_mNtwKk2g>
    <xme:k0jIaCFGkmglLNYyPtzz5n6_xwDPgX5YjQ0Vi_H8RGgd2Q1ac613L9BqUH0ICKXYq
    DHeT2GrCcTNhbsOuQc>
X-ME-Received: <xmr:k0jIaCZ9HsTU5ma_ARssA7d8KRi7xP0mcfUKPbp5WuD6rlChCo8QQM90-5PFa1689nD5iVkV1RkF53PWOhveydRqJw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefkedvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsghorghrugdrtghomhdprh
    gtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgu
    rdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhgu
    odhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:k0jIaCUrAMzEL7nlG2FHZeP8LKSlXThnyEKSBAsEOYmsT-ci67PZ9Q>
    <xmx:k0jIaIm62lMFO8Vpt7UzwXjyVFn2-Cp8vJq0Qhh8KfvbLL1o4febSA>
    <xmx:k0jIaNAQQyQAo2vvcOAUpt1kbMs6eJik4qmyVkXsWvM3QEUfdguabQ>
    <xmx:k0jIaHgGIXLObjdon7Xd8HWszBwqVpKMQIfdiSwAlXnqmbOdhINiSQ>
    <xmx:lEjIaHB-c0SU6ZaNEaPcRRF7bLe3xjWLIk_216pdJEIxBXha2o7V2qTi>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Sep 2025 13:10:43 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 08/12] media: rppx1: Add support for Color Correction Matrix
Date: Mon, 15 Sep 2025 19:07:39 +0200
Message-ID: <20250915170743.106249-9-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915170743.106249-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250915170743.106249-1-niklas.soderlund+renesas@ragnatech.se>
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
2.51.0


