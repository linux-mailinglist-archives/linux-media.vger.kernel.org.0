Return-Path: <linux-media+bounces-35053-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85907ADC867
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 12:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21D3E176BEE
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 10:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855602DA745;
	Tue, 17 Jun 2025 10:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="VTd06mds";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ePFIZ7rf"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242702D9EDE;
	Tue, 17 Jun 2025 10:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750156417; cv=none; b=vA4OgSNr68U9oTdN9Pu+qR95ove1ymMUXrV+9fhowTRfRYZ5aeGeGKQnAVFztwUKwnULqJcFkjyT6cQyam7B1XThCWqWfNCBnNSAdk99IcwRkpRDYkayACU+9n/hfLGYHJPM1oHUyNM9slVjt3hkrSWYXBEU2QBVVY7pUEv/2oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750156417; c=relaxed/simple;
	bh=UrEuOyPEF1lLwZLQttdKJ/rSOi4eqzcnvbdzufkz+WU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o5W0QnmdkotU5L2N+FPbvm5Qg+YIdtEPvMQTW37dcYZU/pR/LBNp3GlHrtpRtBmv41WiuSuNyW5GahSNpC9b//iWwIHvQeiid6GstVFnoJG14slTj8VVHj7kwtsvHzwJL+Q8a2umY6MXzvvrwYjZCCvVc321PSwtjpdS4X2+rgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=VTd06mds; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ePFIZ7rf; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1F5622540199;
	Tue, 17 Jun 2025 06:33:35 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 17 Jun 2025 06:33:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1750156414;
	 x=1750242814; bh=89KtcIVxWek+DdbvQQhDTdnDPKACoHS53DtjQlhrP4E=; b=
	VTd06mdsgRvn4TO43SKFSIk++GZTqZRpu2O/EMlU6jpIcDhGniwaWRyRnyBCNV6a
	SG/rjcIEem0pxmeVM/uZQlBqfLmkvv3pF6vUSao3UT6qWIhAt2AZ9Oj0lNjTaPi5
	+XXvry1fkYBJl5rPFXomo/eQa5CZlN5XV3X0Mct24TAPXVOx62SX/vYQHaZDv+Pn
	mSylGDtyDO1jFSuc6MYhIRsxaHe/BfuxbfJN3ejAV29H43gmqjvKqFZj2EHJcZF0
	XNRXRxQCN4Hwh77c49LhOBcrtDNI1AafLrCG50H2HWu8CYNbSrxFKrgFSmxi7IRI
	BOYPleoML51pwnfBgwmGkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750156414; x=
	1750242814; bh=89KtcIVxWek+DdbvQQhDTdnDPKACoHS53DtjQlhrP4E=; b=e
	PFIZ7rffPEiAVWH3MvjYepWWnxuutxc+2zIUhhn5+rW6J9vKxN58a+SKyuulTErc
	b0HxrkEgZqZEVmhkLq0rODda5iAaQHoKLz63K9hbuE2ReH3buafqtjJqvPP/QwrH
	oST5LvIXtKhFpEMiuSwzaA4GT96onymV4vkRsN/EsgBaG04lmM3FXqZ7xBNjjR7m
	TApwLoiLRcFXiAFqZysY/PeFbpnlYDKKkuEVAsVypshtFjm65tUfGnCyrzW082Sl
	M+gbywgu2a7WKKqamBxNCKFew9MiD17LsKh7GNbZlJk7zMBwLlVrt8r6Udl3Ddz2
	SmwNxY6o0bn8+TP7sd0tA==
X-ME-Sender: <xms:fkRRaFJFfn4AbJN0ln9ObMTvBItOLwq55hiFtDYsCK32ZDGOx_Xgtw>
    <xme:fkRRaBJMmZlAYJjqhOAgyUFZjddIOGwhwxUGc6DDHt2Y6eumWJIAlR4aZghqaU1Xg
    SQkeCt5eyLZmIyIqyI>
X-ME-Received: <xmr:fkRRaNvnldTiP_y27JkcHIOYU77qGlooaOceykcqZIAwlR3ugEGbVNj3vD22-b2u0EpAfSG8WirS4VqgIi69ohQqDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvledtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgthhgvhhgrsges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrg
    hsohhnsghorghrugdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghr
    thesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvug
    hirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghn
    vghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhi
    khhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:fkRRaGbm6R5xLzv7oH76Q9hsjMjbU0JYVsh7eqcdeox0UfCvOu16GA>
    <xmx:fkRRaMaB4mQ-5d7SQqVpK1DUTdMxMUrScCAW8ksaGAnUfswdrACtcA>
    <xmx:fkRRaKDBd0wtdrZNTMcPRCHzwJBzNnnd_SEFxVcQZZcIWwa9BTK28A>
    <xmx:fkRRaKbCENka4PiX8rlbXlKJb6zrk8v8zkJpz5fS4ASk3uk1B1fC9Q>
    <xmx:fkRRaP417j-smymBwFEobd1O08PKxtJCrM2a2cegXOllHL-_MuiUJPK6>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jun 2025 06:33:34 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 3/7] media: rppx1: Add support for AWB gain settings
Date: Tue, 17 Jun 2025 12:31:57 +0200
Message-ID: <20250617103201.1594152-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617103201.1594152-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250617103201.1594152-1-niklas.soderlund+renesas@ragnatech.se>
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
index e7f18edc6819..61eee8f35013 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -23,6 +23,9 @@ int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
 		block_offset += block->header.size;
 
 		switch (block->header.type) {
+		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAIN:
+			module = &rpp->post.awbg;
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
2.49.0


