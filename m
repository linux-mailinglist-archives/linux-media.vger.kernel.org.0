Return-Path: <linux-media+bounces-61836-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GElOHpvfCGp09AMAu9opvQ
	(envelope-from <linux-media+bounces-61836-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 23:20:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D405E55DE35
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 23:20:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD8AC301F488
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 21:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF16380FF7;
	Sat, 16 May 2026 21:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="qB1sx74D";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SyA+iXWb"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8EF329E5D;
	Sat, 16 May 2026 21:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778966074; cv=none; b=o6HaPZrys8z29SYKeHCUwiPShTJ+KXqBWlcsC+6/XjoX++WZSSSONx77RYAQh/pYfpB9zXApQrV/Dx8HjwFpThqxj9w6MMsLp55IBqhRP6ytyFVWS8SSvDLWx87vOjYaOIGrZD/VCeCwGfsQkvhUDq7KAEO5fPbb1fb0wvwMF8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778966074; c=relaxed/simple;
	bh=zUyKJbN+R7oBOSZxtM03MIEvet5uUvy70tG5Iv1lCzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TcT94201WbTtIguI0KBN6vPfM/5hDwj3V9m+F8g6/HrxfXGFqCYLNYLMkGIelohpjzomc22N8Cphb3hXGvCoQE5MPQnx1HWEx5+dwyAiDg6g0uwGB9k4Bt6e0reEskmUKi2w2o13t6uYH7UmY9qmO/x4oU4J0Y1QHeflUTx+KKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=qB1sx74D; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SyA+iXWb; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 35D7414000E4;
	Sat, 16 May 2026 17:14:26 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Sat, 16 May 2026 17:14:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778966066;
	 x=1779052466; bh=0TmSYAsyh4y9HxVU13mu6MkRSGxrorA6A7L8Z7iYBmU=; b=
	qB1sx74D+hFDDQpLoX5C3PdzLjGFcnHcYOHADUjytC7o4Co/MVyvfpHrINSVIMjX
	L5W7+PpbAOvRPonVQ0c91T1DjLuqSyZlC4NcnRn0GevuBTnyYjSJrDx+U+Qoxr3R
	kFWgMUPBC4QPZRoLeLKim8UbHFwKrYVthK0PUbqpjLsYddCuZbJrme/o4Ui95DHG
	AfqryTgOVXFF9gnE5W/XJ2eYNPRWfaAHo5S312nlg/ccbaC9VhIuoIw4KC5OS17h
	kDt2uAXq+5O2F6RYLx0j7O6xy08P4gtix17FBz9ktD3ftlA2otm8Fxxqp4N7jLCU
	87ONgQzd+ae31YWI442FQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778966066; x=
	1779052466; bh=0TmSYAsyh4y9HxVU13mu6MkRSGxrorA6A7L8Z7iYBmU=; b=S
	yA+iXWbTYT/u0xUe3lJlGeZojrdaBBcrNJoZdUaYwMAdYgeFUCVvN3srboBPJSUe
	DjinTe3ksuHZ0KDQYEO9tprMsxIEyW4tXMFAJrqTuK5UJBoXx063U2qyWxKqhEf9
	Gh48Hycxv5FHVFX9jY/dTHcjhWE3MNj+t6CqfpC9ifeeI7OXFvogKHhdHoPeXz1P
	VYnVpZIwmBWirconnShnQevgYj0jRJQ5m49CMIH8fbvi0KeFtixVTqqLtf5w3WtC
	MBZkw2oNUaTCgiWpV99invy1ETcKnM+t4NZ0KIHD+1tQETNssMwEgvPwqWotyAZx
	Nj6zGx4KVFoJ6QqkmYq9A==
X-ME-Sender: <xms:Mt4IavvQdiUXV34WknfxUQ0mcGKlq9coynf0Jdrrvq1U5dCns3YPzw>
    <xme:Mt4Iamf0vt0OTrRD4nbTG68ZFQm-9jqlpl9BxzAq8xOXqmCjQ0-sLV--aTt4Hdxz1
    CYCVFc5RR2m63QAM6VBNtkNQEjU_zZ3zM_2jA8tpdCNoJdGYp0qZow>
X-ME-Received: <xmr:Mt4IatkCly6QCofqzaamAWzbGbWuuNoiAYuD0lY6lLrgEnPh98071hWEiTHrPTIGI4zJOmhCBKrV4Hn5oOoH64dDuXtVNYByodGJ>
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
    hnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehn
    ihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrsh
    gv
X-ME-Proxy: <xmx:Mt4IahA9WRMC-43b_6Ac4IuqqzgaLQNta_1bpNN-X8UiO2p9YAMUQg>
    <xmx:Mt4IavMhFh4D6YbPeVrV-WaTNfO93piTlSVUsmgQvFwJHFUKzOVWmQ>
    <xmx:Mt4IaoNMaRrcXSgId3Gavo-MJrjxNRncjqVqcdcaigzAkl54yhy9Bg>
    <xmx:Mt4IanmJpfOhCAetzTumJa_yDxN0OGRkNf7p0Aqj59hsjrRBQ_AFYg>
    <xmx:Mt4Iahz03OOg1mAKkDjHAI_CkQjHo0g_dgv869SdpVjiW_LPVOhsOzIf>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 May 2026 17:14:25 -0400 (EDT)
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
Subject: [PATCH v9 11/13] media: rppx1: lsc: Add support for lens shade correction
Date: Sat, 16 May 2026 23:13:18 +0200
Message-ID: <20260516211320.3041412-12-niklas.soderlund+renesas@ragnatech.se>
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
X-Rspamd-Queue-Id: D405E55DE35
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61836-lists,linux-media=lfdr.de,renesas];
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

Extend the RPPX1 driver to allow setting the lens shade correction
configuration parameters. It uses the RPPX1 framework for parameters and
its writer abstraction to allow the user to control how, and when,
configuration is applied to the RPPX1.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Co-developed-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 .../platform/dreamchip/rppx1/rpp_module.h     |   1 +
 .../platform/dreamchip/rppx1/rpp_params.c     |   5 +
 .../platform/dreamchip/rppx1/rppx1_lsc.c      | 119 ++++++++++++++++++
 .../uapi/linux/media/dreamchip/rppx1-config.h |  54 +++++++-
 4 files changed, 178 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
index e039746ac542..48b61b5c35b4 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
@@ -48,6 +48,7 @@ void rpp_module_clrset(struct rpp_module *mod, u32 offset, u32 mask, u32 value);
 union rppx1_params_block {
 	struct v4l2_isp_block_header header;
 	struct rppx1_bls_params bls;
+	struct rppx1_lsc_params lsc;
 	struct rppx1_awbg_params awbg;
 	struct rppx1_ccor_params ccor;
 	struct rppx1_hist_params hist;
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index a83d393d0504..8d85d0c7bff1 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -19,6 +19,8 @@ static const struct v4l2_isp_params_block_type_info
 rppx1_ext_params_blocks_info[] = {
 	RPPX1_PARAMS_BLOCK_INFO(BLS_PRE1, bls),
 	RPPX1_PARAMS_BLOCK_INFO(BLS_PRE2, bls),
+	RPPX1_PARAMS_BLOCK_INFO(LSC_PRE1, lsc),
+	RPPX1_PARAMS_BLOCK_INFO(LSC_PRE2, lsc),
 	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
 	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE2, awbg),
 	RPPX1_PARAMS_BLOCK_INFO(CCOR_POST, ccor),
@@ -64,6 +66,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		case RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1:
 			module = &rpp->pre1.bls;
 			break;
+		case RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE1:
+			module = &rpp->pre1.lsc;
+			break;
 		case RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1:
 			module = &rpp->pre1.awbg;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c b/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
index be49fc17ea26..8badeca23e24 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
@@ -55,6 +55,10 @@
 #define LSC_TABLE_SEL_REG	0x00a8
 #define LSC_STATUS_REG		0x00ac
 
+#define LSC_R_TABLE_DATA_VALUE(v1, v2) (((v1) & 0xfff) | (((v2) & 0xfff) << 12))
+#define LSC_GRAD_VALUE(v1, v2) (((v1) & 0xfff) | (((v2) & 0xfff) << 16))
+#define LSC_SIZE_VALUE(v1, v2) (((v1) & 0x1ff) | (((v2) & 0x1ff) << 16))
+
 static int rppx1_lsc_probe(struct rpp_module *mod)
 {
 	/* Version check. */
@@ -64,6 +68,121 @@ static int rppx1_lsc_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static int
+rppx1_lsc_fill_params(struct rpp_module *mod,
+		      const union rppx1_params_block *block,
+		      rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_lsc_params *cfg = &block->lsc;
+	const __u16 *v;
+
+	/* Always disable module as it needs be disabled before configuring. */
+	write(priv, mod->base + LSC_CTRL_REG, 0);
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE)
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
+	for (unsigned int i = 0; i < RPPX1_LSC_SAMPLES_MAX; i++) {
+		const __u16 *r = cfg->r_data[i];
+		const __u16 *gr = cfg->gr_data[i];
+		const __u16 *b = cfg->b_data[i];
+		const __u16 *gb = cfg->gb_data[i];
+		unsigned int j;
+
+		for (j = 0; j < RPPX1_LSC_SAMPLES_MAX - 1; j += 2) {
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
+	 */
+
+	v = cfg->x_grad;
+	write(priv, mod->base + LSC_XGRAD_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
+	write(priv, mod->base + LSC_XGRAD_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
+	write(priv, mod->base + LSC_XGRAD_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
+	write(priv, mod->base + LSC_XGRAD_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
+	write(priv, mod->base + LSC_XGRAD_89_REG, LSC_GRAD_VALUE(v[8], v[9]));
+	write(priv, mod->base + LSC_XGRAD_1011_REG, LSC_GRAD_VALUE(v[10], v[11]));
+	write(priv, mod->base + LSC_XGRAD_1213_REG, LSC_GRAD_VALUE(v[12], v[13]));
+	write(priv, mod->base + LSC_XGRAD_1415_REG, LSC_GRAD_VALUE(v[14], v[15]));
+
+	v = cfg->y_grad;
+	write(priv, mod->base + LSC_YGRAD_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
+	write(priv, mod->base + LSC_YGRAD_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
+	write(priv, mod->base + LSC_YGRAD_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
+	write(priv, mod->base + LSC_YGRAD_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
+	write(priv, mod->base + LSC_YGRAD_89_REG, LSC_GRAD_VALUE(v[8], v[9]));
+	write(priv, mod->base + LSC_YGRAD_1011_REG, LSC_GRAD_VALUE(v[10], v[11]));
+	write(priv, mod->base + LSC_YGRAD_1213_REG, LSC_GRAD_VALUE(v[12], v[13]));
+	write(priv, mod->base + LSC_YGRAD_1415_REG, LSC_GRAD_VALUE(v[14], v[15]));
+
+	v = cfg->x_sect_size;
+	write(priv, mod->base + LSC_XSIZE_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
+	write(priv, mod->base + LSC_XSIZE_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
+	write(priv, mod->base + LSC_XSIZE_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
+	write(priv, mod->base + LSC_XSIZE_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
+	write(priv, mod->base + LSC_XSIZE_89_REG, LSC_GRAD_VALUE(v[8], v[9]));
+	write(priv, mod->base + LSC_XSIZE_1011_REG, LSC_GRAD_VALUE(v[10], v[11]));
+	write(priv, mod->base + LSC_XSIZE_1213_REG, LSC_GRAD_VALUE(v[12], v[13]));
+	write(priv, mod->base + LSC_XSIZE_1415_REG, LSC_GRAD_VALUE(v[14], v[15]));
+
+	v = cfg->y_sect_size;
+	write(priv, mod->base + LSC_YSIZE_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
+	write(priv, mod->base + LSC_YSIZE_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
+	write(priv, mod->base + LSC_YSIZE_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
+	write(priv, mod->base + LSC_YSIZE_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
+	write(priv, mod->base + LSC_YSIZE_89_REG, LSC_GRAD_VALUE(v[8], v[9]));
+	write(priv, mod->base + LSC_YSIZE_1011_REG, LSC_GRAD_VALUE(v[10], v[11]));
+	write(priv, mod->base + LSC_YSIZE_1213_REG, LSC_GRAD_VALUE(v[12], v[13]));
+	write(priv, mod->base + LSC_YSIZE_1415_REG, LSC_GRAD_VALUE(v[14], v[15]));
+
+	/* Enable module. */
+	write(priv, mod->base + LSC_CTRL_REG, LSC_CTRL_LSC_EN);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_lsc_ops = {
 	.probe = rppx1_lsc_probe,
+	.fill_params = rppx1_lsc_fill_params,
 };
diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
index 97c333c72d56..7ebcc00ace04 100644
--- a/include/uapi/linux/media/dreamchip/rppx1-config.h
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -89,6 +89,8 @@ enum rppx1_meas_chan {
  * @RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1: PRE1 pipe Black Level Subtraction
  * @RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2: PRE2 pipe Black Level Subtraction
  * @RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST: POST pipe Color Correction
+ * @RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE1: PRE1 pipe Lens Shading Correction
+ * @RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE2: PRE2 Lens Shading Correction
  */
 enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
@@ -103,6 +105,8 @@ enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1,
 	RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2,
 	RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST,
+	RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE1,
+	RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE2,
 };
 
 /**
@@ -447,6 +451,52 @@ struct rppx1_ccor_params {
 	__u32 offset[3];
 };
 
+/* Lens Shade Correction */
+#define RPPX1_LSC_SAMPLES_MAX 17
+#define RPPX1_LSC_NUM_SECTORS 16
+
+/**
+ * struct rppx1_lsc_params - Lens Shading Correction configuration
+ *
+ * The RPP-X1 Lens shading correction module is available on the PRE1 and PRE2
+ * pre-fusion pipes. Userspace selects which pipe to operate by setting the
+ * @header.type field to RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE1 or
+ * RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE2.
+ *
+ * The module applies per-color channel correction factors @r_data, @gr_data,
+ * @gb_data and @b_data as a 16x16 grid mapped on the image. The size of each
+ * grid segment is expressed by the @x_sect_size and @y_sect_size arrays.  Each
+ * segment shall be at least 8 pixels in size and the sum of all horizontal
+ * segments @x_sect_size shall match the input frame size width.
+ *
+ * The correction factors values are expressed as unsigned Q2.10 integers
+ * ranging from 1 to 3.999.
+ *
+ * Pre-calculated interpolation factors shall be provided in the @x_grad
+ * and @y_grad fields, expressed as 12 bits integer values.
+ *
+ * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_LSC)
+ * @r_data: correction factors for the red channel in Q2.10 format
+ * @gr_data: correction factors for the green (red) channel in Q2.10 format
+ * @gb_data: correction factors for the green (blue) channel in Q2.10 format
+ * @b_data: correction factors for the blue channel in Q2.10 format
+ * @x_grad: Interpolation gradients for each horizontal sector (12 bits)
+ * @y_grad: Interpolation gradients for each vertical sector (12 bits)
+ * @x_sect_size: Horizontal sectors sizes
+ * @y_sect_size: Vertical sectors sizes
+ */
+struct rppx1_lsc_params {
+	struct v4l2_isp_params_block_header header;
+	__u16 r_data[RPPX1_LSC_SAMPLES_MAX][RPPX1_LSC_SAMPLES_MAX];
+	__u16 gr_data[RPPX1_LSC_SAMPLES_MAX][RPPX1_LSC_SAMPLES_MAX];
+	__u16 gb_data[RPPX1_LSC_SAMPLES_MAX][RPPX1_LSC_SAMPLES_MAX];
+	__u16 b_data[RPPX1_LSC_SAMPLES_MAX][RPPX1_LSC_SAMPLES_MAX];
+	__u16 x_grad[RPPX1_LSC_NUM_SECTORS];
+	__u16 y_grad[RPPX1_LSC_NUM_SECTORS];
+	__u16 x_sect_size[RPPX1_LSC_NUM_SECTORS];
+	__u16 y_sect_size[RPPX1_LSC_NUM_SECTORS];
+};
+
 /**
  * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
  *
@@ -465,7 +515,9 @@ struct rppx1_ccor_params {
 	sizeof(struct rppx1_hist_params)			+	\
 	sizeof(struct rppx1_bls_params)				+	\
 	sizeof(struct rppx1_bls_params)				+	\
-	sizeof(struct rppx1_ccor_params))
+	sizeof(struct rppx1_ccor_params)			+	\
+	sizeof(struct rppx1_lsc_params)				+	\
+	sizeof(struct rppx1_lsc_params))
 
 /* ---------------------------------------------------------------------------
  * Statistics Structures
-- 
2.54.0


