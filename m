Return-Path: <linux-media+bounces-49550-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D79CDDFC8
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 18:15:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E12663056C7E
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 17:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28FD727E045;
	Thu, 25 Dec 2025 17:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="TgfVMNnq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kKhxX2+5"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80A3278156;
	Thu, 25 Dec 2025 17:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766682707; cv=none; b=lKoWc/4AjTqFHuzkZGyptb+gF/Gx0YCxYMaD32hmMBdEWrK+UN9I52V52Ezwk5BaF7pL869umlgBYOVqmZ5LZ3lffl/AGyDvuaFbVwpPcpI4/8g8opHC9pDja3NXnhJPdS+w1C2W+J+C7+XGWl9nf2YLpEcU5iKTnFNTYjWwJIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766682707; c=relaxed/simple;
	bh=crYGIB0cnzGGsUjx1xqMSAACUXAws2c1SCEX8a1gTds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U8KoYHdogMEuLt4E0ciszqGTiZp80wcofPp536EocNL/f/aEVjUkvd7ESk+4GoxeM0SgIPoVji5+vlaDssRQ2ajMgaVtb9V7EzJ+fVD05/gvPQe5OMbHEPm3Qa3vCNCoFSKyDq/GFvXPIJ8aY4Y2FIQUMXGGoAobnjqN239UB7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=TgfVMNnq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kKhxX2+5; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 0A2B1EC004F;
	Thu, 25 Dec 2025 12:11:44 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 25 Dec 2025 12:11:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1766682704;
	 x=1766769104; bh=OGWe6TSXXaxV0jXBC5bnZNtWGZGdnyR/SX8HCNYOzZc=; b=
	TgfVMNnqvp9NwtMy3DQWvKyfAHP78JWA7jZC84pP17wxtIU6S6qoPwIAdWJdUnk9
	m41G6LsLmRmfjVWLTbGeHH12r2pUFHqLRcyOq7OAU1HLJVDYp2lqfIDlqTz5DZ5A
	jlG2xsUpMPSds3RI36gZhiBMODUiFSw9JJaaP0ikwDRCBVctOdwdIrWZ7mPEnN9c
	vqu4vRnMm/0+zcN6n+ffkbHLtU1A8gVExIZliXYcIGw/WzXmeWdPXEIEKdAtvf5q
	bhLhU+MzcdK4vR9+Y85kEkSyj08toWfOuR2kWxQK8fDWFpMmOlwYCBd7WQz9kqD+
	JJZ3H8EfW1M6wm0WS966FA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766682704; x=
	1766769104; bh=OGWe6TSXXaxV0jXBC5bnZNtWGZGdnyR/SX8HCNYOzZc=; b=k
	KhxX2+5//jy3LimDEQ00C/utEAraWF5CsQetFLXNSlgB70nLgBZS8IjC6Gby8rTH
	qZxHF6Z6e02FMQ0x8vfboMShjTuF3OTW9msyB8VJDFMI9728nMK32Q3UnoPNxiaw
	rUNUujta77yQ0jRPxVH5F4BbWODHGBVxXi0k/ezDegVg39/wg0lQUwdZxzioUtqD
	xVYn26dxcZcfkNHIDzNeoWhZl3I759XJKD9LCP/IbLrBRpgtowclqpxwlvFV1Y+m
	Lv7JxRP+TGmynLRCUhQrpsPgr7RbOAMW+d2ngUlG1SaHsgxerSSLMfWOdf5Yx1+h
	7WPs8dPZkNREQjVuMCJ0g==
X-ME-Sender: <xms:T3BNaZQat40INdw5taeQWjsACLb2Ci3nP66_tvX998YP58tQxJ1N5w>
    <xme:T3BNaUVFTnqH_fQ7EcJGI6XyPJkCVFBsXPg3ZTbkVHy-B4mwoKp8iEJ9pQcJxQqKF
    dEIbWsUtMfBKJwDbQc-xDeE4tI7sIGUv4cdZ_sgVYDLS68BUmz7tyI>
X-ME-Received: <xmr:T3BNaVJj945MVuKIA84QmyiamcUvGOxGT6Liqj3nzxci3-saWv8ZyAhUI78wbEVecWX_k1B2G5diHGedmsl6G3r6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeiieduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgepudenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepledpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepkhhunhhinhhorhhirdhmohhrihhmohhtohdrghigsehrvghnvghsrghsrdgtoh
    hmpdhrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsghorghrugdr
    tghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonh
    gsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghl
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrdhsohguvg
    hrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgdprhgtphhtthhopehm
    rghrvghkrdhvrghsuhhtodhrvghnvghsrghssehmrghilhgsohigrdhorhhg
X-ME-Proxy: <xmx:T3BNac0uz0EeyDVU3964-KL3VqGuB2SNX6AJAWcjBsxLOFw2A7w8LA>
    <xmx:T3BNaaIctETxItENPmVAi4sp2US5PbXjicgGMFhL3efpJ-gppxbs8Q>
    <xmx:T3BNafiU30-CXVw-yAI31TjJZOJcVLUrtwcpzx5W4FU1sZi4EtndMg>
    <xmx:T3BNaSC1qx9WtmqW2L84DPKp8m84A2maeFavwPqqkckJB2HVCTZPFA>
    <xmx:UHBNaROLi4RZPYzpaeBIHX3NbOCDj_P0l5RAs9wDa0E-c0hwzXVksT7I>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Dec 2025 12:11:43 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Marek Vasut' <marek.vasut+renesas@mailbox.org>
Subject: [PATCH v5 09/12] media: rppx1: Add support for Lens Shade Correction
Date: Thu, 25 Dec 2025 18:10:51 +0100
Message-ID: <20251225171054.1370856-10-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251225171054.1370856-1-niklas.soderlund+renesas@ragnatech.se>
References: <20251225171054.1370856-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Extend the RPPX1 driver to allow setting the Lens Shade Correction (LSC)
configuration using the RkISP1 parameter buffer format. It uses the
RPPX1 framework for parameters and  its writer abstraction to allow the
user to control how (and when) configuration is applied to the RPPX1.

As the RkISP1 parameters buffer only describes one quadrant of the lens,
this is due to the RkISP1 hardware only allowing one quadrant to be
programmed to hardware. The hardware then extrapolates this to the other
three quadrants of the lens. For RPP all four quadrants are individually
programmable.

To compensate for the driver need to extrapolate all four quadrants from
the RkISP1 parameters buffer information.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Marek Vasut'<marek.vasut+renesas@mailbox.org>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |   3 +
 .../platform/dreamchip/rppx1/rppx1_lsc.c      | 126 ++++++++++++++++++
 2 files changed, 129 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index f7b9e14e2b5b..0519ad77d5c9 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -35,6 +35,9 @@ int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK:
 			module = &rpp->post.ccor;
 			break;
+		case RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC:
+			module = &rpp->pre1.lsc;
+			break;
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS:
 			module = &rpp->post.wbmeas;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c b/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
index e8acdf744956..00bdcc4aedb3 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
@@ -54,6 +54,10 @@
 #define LSC_TABLE_SEL_REG	0x00a8
 #define LSC_STATUS_REG		0x00ac
 
+#define LSC_R_TABLE_DATA_VALUE(v1, v2) (((v1) & 0xfff) | (((v2) & 0xfff) << 12))
+#define LSC_GRAD_VALUE(v1, v2) (((v1) & 0xfff) | (((v2) & 0xfff) << 16))
+#define LSC_SIZE_VALUE(v1, v2) (((v1) & 0x1ff) | (((v2) & 0x1ff) << 16))
+
 static int rppx1_lsc_probe(struct rpp_module *mod)
 {
 	/* Version check. */
@@ -63,6 +67,128 @@ static int rppx1_lsc_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static int
+rppx1_lsc_param_rkisp1(struct rpp_module *mod,
+		       const union rppx1_params_rkisp1_config *block,
+		       rppx1_reg_write write, void *priv)
+{
+	const struct rkisp1_ext_params_lsc_config *cfg = &block->lsc;
+	const __u16 *v;
+
+	/* Always disable module as it needs be disabled before configuring. */
+	write(priv, mod->base + LSC_CTRL_REG, 0);
+	if (cfg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE)
+		return 0;
+
+	/*
+	 * Program the color correction sectors.
+	 *
+	 * There are two tables to one can program and switch between. As the
+	 * RPPX1 supports preparing a buffer of commands to be applied later
+	 * only use table 0. This works as long as the ISP is not used in
+	 * inline-mode.
+	 *
+	 * For inline-mode support using DMA for configuration is not possible
+	 * so this is not an issue, but needs to be address if inline-mode
+	 * support is added to the driver.
+	 */
+
+	/* Start writing at beginning of table 0. */
+	write(priv, mod->base + LSC_R_TABLE_ADDR_REG, 0);
+	write(priv, mod->base + LSC_GR_TABLE_ADDR_REG, 0);
+	write(priv, mod->base + LSC_B_TABLE_ADDR_REG, 0);
+	write(priv, mod->base + LSC_GB_TABLE_ADDR_REG, 0);
+
+	/* Program data tables. */
+	for (unsigned int i = 0; i < RKISP1_CIF_ISP_LSC_SAMPLES_MAX; i++) {
+		const __u16 *r = cfg->config.r_data_tbl[i];
+		const __u16 *gr = cfg->config.gr_data_tbl[i];
+		const __u16 *b = cfg->config.b_data_tbl[i];
+		const __u16 *gb = cfg->config.gb_data_tbl[i];
+		unsigned int j;
+
+		for (j = 0; j < RKISP1_CIF_ISP_LSC_SAMPLES_MAX - 1; j += 2) {
+			write(priv, mod->base + LSC_R_TABLE_DATA_REG,
+			      LSC_R_TABLE_DATA_VALUE(r[j], r[j + 1]));
+			write(priv, mod->base + LSC_GR_TABLE_DATA_REG,
+			      LSC_R_TABLE_DATA_VALUE(gr[j], gr[j + 1]));
+			write(priv, mod->base + LSC_B_TABLE_DATA_REG,
+			      LSC_R_TABLE_DATA_VALUE(b[j], b[j + 1]));
+			write(priv, mod->base + LSC_GB_TABLE_DATA_REG,
+			      LSC_R_TABLE_DATA_VALUE(gb[j], gb[j + 1]));
+		}
+
+		write(priv, mod->base + LSC_R_TABLE_DATA_REG,
+		      LSC_R_TABLE_DATA_VALUE(r[j], 0));
+		write(priv, mod->base + LSC_GR_TABLE_DATA_REG,
+		      LSC_R_TABLE_DATA_VALUE(gr[j], 0));
+		write(priv, mod->base + LSC_B_TABLE_DATA_REG,
+		      LSC_R_TABLE_DATA_VALUE(b[j], 0));
+		write(priv, mod->base + LSC_GB_TABLE_DATA_REG,
+		      LSC_R_TABLE_DATA_VALUE(gb[j], 0));
+	}
+
+	/* Activate table 0. */
+	write(priv, mod->base + LSC_TABLE_SEL_REG, 0);
+
+	/*
+	 * Program X- and Y- sizes, and gradients.
+	 *
+	 * The RPP ISP can describe each quarter of the lens individually, this
+	 * differs from the Rk1ISP which can only describe one quarter of lens
+	 * with software and then extrapolates the other three.
+	 *
+	 * To adjust for this extrapolate the three missing quadrants using
+	 * software for the RPP ISP.
+	 */
+
+	v = cfg->config.x_grad_tbl;
+	write(priv, mod->base + LSC_XGRAD_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
+	write(priv, mod->base + LSC_XGRAD_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
+	write(priv, mod->base + LSC_XGRAD_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
+	write(priv, mod->base + LSC_XGRAD_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
+	write(priv, mod->base + LSC_XGRAD_89_REG, LSC_GRAD_VALUE(v[7], v[6]));
+	write(priv, mod->base + LSC_XGRAD_1011_REG, LSC_GRAD_VALUE(v[5], v[4]));
+	write(priv, mod->base + LSC_XGRAD_1213_REG, LSC_GRAD_VALUE(v[3], v[2]));
+	write(priv, mod->base + LSC_XGRAD_1415_REG, LSC_GRAD_VALUE(v[1], v[0]));
+
+	v = cfg->config.y_grad_tbl;
+	write(priv, mod->base + LSC_YGRAD_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
+	write(priv, mod->base + LSC_YGRAD_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
+	write(priv, mod->base + LSC_YGRAD_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
+	write(priv, mod->base + LSC_YGRAD_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
+	write(priv, mod->base + LSC_YGRAD_89_REG, LSC_GRAD_VALUE(v[7], v[6]));
+	write(priv, mod->base + LSC_YGRAD_1011_REG, LSC_GRAD_VALUE(v[5], v[4]));
+	write(priv, mod->base + LSC_YGRAD_1213_REG, LSC_GRAD_VALUE(v[3], v[2]));
+	write(priv, mod->base + LSC_YGRAD_1415_REG, LSC_GRAD_VALUE(v[1], v[0]));
+
+	v = cfg->config.x_size_tbl;
+	write(priv, mod->base + LSC_XSIZE_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
+	write(priv, mod->base + LSC_XSIZE_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
+	write(priv, mod->base + LSC_XSIZE_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
+	write(priv, mod->base + LSC_XSIZE_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
+	write(priv, mod->base + LSC_XSIZE_89_REG, LSC_GRAD_VALUE(v[7], v[6]));
+	write(priv, mod->base + LSC_XSIZE_1011_REG, LSC_GRAD_VALUE(v[5], v[4]));
+	write(priv, mod->base + LSC_XSIZE_1213_REG, LSC_GRAD_VALUE(v[3], v[2]));
+	write(priv, mod->base + LSC_XSIZE_1415_REG, LSC_GRAD_VALUE(v[1], v[0]));
+
+	v = cfg->config.y_size_tbl;
+	write(priv, mod->base + LSC_YSIZE_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
+	write(priv, mod->base + LSC_YSIZE_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
+	write(priv, mod->base + LSC_YSIZE_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
+	write(priv, mod->base + LSC_YSIZE_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
+	write(priv, mod->base + LSC_YSIZE_89_REG, LSC_GRAD_VALUE(v[7], v[6]));
+	write(priv, mod->base + LSC_YSIZE_1011_REG, LSC_GRAD_VALUE(v[5], v[4]));
+	write(priv, mod->base + LSC_YSIZE_1213_REG, LSC_GRAD_VALUE(v[3], v[2]));
+	write(priv, mod->base + LSC_YSIZE_1415_REG, LSC_GRAD_VALUE(v[1], v[0]));
+
+	/* Enable module. */
+	write(priv, mod->base + LSC_CTRL_REG, LSC_CTRL_LSC_EN);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_lsc_ops = {
 	.probe = rppx1_lsc_probe,
+	.param_rkisp1 = rppx1_lsc_param_rkisp1,
 };
-- 
2.52.0


