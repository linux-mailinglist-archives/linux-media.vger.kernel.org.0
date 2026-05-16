Return-Path: <linux-media+bounces-61831-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFsQAP7eCGp09AMAu9opvQ
	(envelope-from <linux-media+bounces-61831-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 23:17:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B9C55DDC5
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 23:17:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C320303FFD0
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 21:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 687E737D12F;
	Sat, 16 May 2026 21:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="BPmm5y+F";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="K3R9Yuza"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D83363C4B;
	Sat, 16 May 2026 21:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778966066; cv=none; b=gXzseBqjU0R0riTXqcxCeCWo+SEvpykx2zVXizJyW+GOC+AN2/TM5RWVOYcJjH+7EsH8gsOnfHQ/6yHQO8fakSg5JyxVsY8Df/5joB0yUPETMyNyOfMh6WAaUxiom69vX6Ock2/U9ynApd5NxkVpvTDMIwSgWcbAwgi+Nhi/Y68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778966066; c=relaxed/simple;
	bh=NA+H9ccsQ+VbslaDjTRJd82XbELnGMyFkWVihmBUsNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bviIV75Dxgp6yTOpOvK/X7REK4e8UYg2hLeHV6bgsVncWAJDOsLQ/0IcWLHtnQl28jn0Kj/AMhAtK18sVGoFlIyygH0RS5woLrdd9fuNQCSp9dlTpcuIb3GfjHB84WrHAtJVuTyVyDExO7K++EnTkDsI34LMMQ9fMwymt/ThJmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=BPmm5y+F; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=K3R9Yuza; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 58D28EC00B8;
	Sat, 16 May 2026 17:14:22 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sat, 16 May 2026 17:14:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778966062;
	 x=1779052462; bh=uD+uybLBunx7AimDHRKmo2olCNJija+N4gDe7cP4E9s=; b=
	BPmm5y+F+fy0DLoRNoBXLHsG59oRQxsCLEYCuxbsuRCTnKUjT9uCZ4xTvLgSu6ID
	7klyQSXJ/K6U9iNfRo4fhWUTqF4RtVOggJ0MWE8lwIYp8kTquXUOpuSenPCsqagR
	ztJjyFeNFhJY3VFxVsxEvO35/mU1UbiJTEK1BZ5aXKVfq36nN/nK9OYw6OnOmOgM
	OOohzRdslyFANXcHRFZ2oz+rYy2Jg7icP4rotGvPYIo0z8Mk6Qm57Amb4pGOdAAR
	soNcdYIb3wV4y7BdikUQ+6+PFYI56g+4kA/piqsEmtlpTGOnJQtIRnH2BZxRQxYE
	BtrVYsmZPjn13Sbur02Y8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778966062; x=
	1779052462; bh=uD+uybLBunx7AimDHRKmo2olCNJija+N4gDe7cP4E9s=; b=K
	3R9YuzaOq1v02T9DWev9bb0CpDXfo0j6L4UVxFComaC8zNKF+Jp68tvlsl0C0kZ8
	H68UwuPu7F+7mCPaQUvbKlVcKD0w5+FHo6vwoYH9eMNTwklAIHaaChzKirrWJhX6
	93CbAAOC4yB4RfTvLrocBjR/wj28DiF754Gjw/9Z6bGy0fi81iOsAQ8IMmXuUIZE
	ZszLC/DABaEYaa0qXiE6tQ+U34O1Oure//IKr3uj1QkXQoL1hxnRBAnnQtEnESn/
	gZYTTCFTlHuIQCIQ4aJsl8LLYzTNmxZmJETi0WcVNpH4Wva6FJ+9Agcg76qoB4z5
	xWtKRpc5Jnw/8IZi2bBzQ==
X-ME-Sender: <xms:Lt4IanFFmo1Iyj4kKJemPxoAl74ybqYEwTxdzfrQxAFwAGTCTZKgCA>
    <xme:Lt4IaqWOQcD5z7kPPFYNo2tJccmIRL6lQTN6E2R-XObTqNiILK9D5oWgMQbJqe8Cw
    a_bjLf1lowlh7aHw-djh-Ryj3mXECUoFi-9ErsOjpo_b3059ukq-iI>
X-ME-Received: <xmr:Lt4Iaj9j7usnodazG9OxPvm2E83xTCoVwJdrUNgXa2jL55vP0Z7n1mDmEgwf_fnC9eJgbe7aMWREfNGnW4Cum8Z2hBFukgJHBmiS>
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
X-ME-Proxy: <xmx:Lt4Ian7sMIQspZT5qNstUQtSQ5ptsYighBnUkevGCuOLhr72olmsIA>
    <xmx:Lt4Iasmn8A7V0d_rQQtM8DH34d-y0mubfU6_JR7pCJFVIw8T_MGZvg>
    <xmx:Lt4IaqGM-vDIbHmdu_sFjBLzEhB-f6GWFSPPqBVWAmIeBX6tLk4fdA>
    <xmx:Lt4Iaj_KwO7kvcVrksQeB_crtefnBqQ64kteoNtjOuASLP7njw4u_Q>
    <xmx:Lt4IakJRINiQTS1pfSB2muRQXF6l00AAX4_ltAIEVKC8OEEUiDyRK69c>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 May 2026 17:14:21 -0400 (EDT)
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
Subject: [PATCH v9 09/13] media: rppx1: bls: Add support for black level compensation
Date: Sat, 16 May 2026 23:13:16 +0200
Message-ID: <20260516211320.3041412-10-niklas.soderlund+renesas@ragnatech.se>
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
X-Rspamd-Queue-Id: 61B9C55DDC5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61831-lists,linux-media=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,messagingengine.com:dkim,ideasonboard.com:email,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:dkim]
X-Rspamd-Action: no action

Extend the RPPX1 driver to allow setting the black level measurement
and gain configuration. It uses the RPPX1 framework for parameters and
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
 .../platform/dreamchip/rppx1/rppx1_bls.c      |  97 ++++++++++++++++
 .../uapi/linux/media/dreamchip/rppx1-config.h | 105 +++++++++++++++++-
 4 files changed, 207 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
index b134d140fe22..5e20fcdcbcc4 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
@@ -47,6 +47,7 @@ void rpp_module_clrset(struct rpp_module *mod, u32 offset, u32 mask, u32 value);
 
 union rppx1_params_block {
 	struct v4l2_isp_block_header header;
+	struct rppx1_bls_params bls;
 	struct rppx1_awbg_params awbg;
 	struct rppx1_hist_params hist;
 	struct rppx1_exm_params exm;
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 975ce3a42fb5..831cf7ca154c 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -17,6 +17,8 @@
 
 static const struct v4l2_isp_params_block_type_info
 rppx1_ext_params_blocks_info[] = {
+	RPPX1_PARAMS_BLOCK_INFO(BLS_PRE1, bls),
+	RPPX1_PARAMS_BLOCK_INFO(BLS_PRE2, bls),
 	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
 	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE2, awbg),
 	RPPX1_PARAMS_BLOCK_INFO(HIST_PRE1, hist),
@@ -58,6 +60,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		block_offset += block->header.size;
 
 		switch (block->header.type) {
+		case RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1:
+			module = &rpp->pre1.bls;
+			break;
 		case RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1:
 			module = &rpp->pre1.awbg;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c b/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
index 882a9a819229..01a61db279bf 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
@@ -6,6 +6,7 @@
  */
 
 #include "rpp_module.h"
+#include "rppx1.h"
 
 #define BLS_VERSION_REG				0x0000
 
@@ -32,6 +33,8 @@
 #define BLS_B_MEASURED_REG			0x0040
 #define BLS_C_MEASURED_REG			0x0044
 #define BLS_D_MEASURED_REG			0x0048
+#define BLS_PRE1_FIXED_MASK			GENMASK(24, 0)
+#define BLS_PRE2_FIXED_MASK			GENMASK(12, 0)
 
 static int rppx1_bls_probe(struct rpp_module *mod)
 {
@@ -55,6 +58,100 @@ static int rppx1_bls_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static void
+rppx1_bls_swap_regs(struct rpp_module *mod, const u32 input[4], u32 output[4])
+{
+	static const unsigned int swap[4][4] = {
+		[RPP_RGGB] = { 0, 1, 2, 3 },
+		[RPP_GRBG] = { 1, 0, 3, 2 },
+		[RPP_GBRG] = { 2, 3, 0, 1 },
+		[RPP_BGGR] = { 3, 2, 1, 0 },
+	};
+
+	/* Swap to pattern used in our path, PRE1 or PRE2. */
+	struct rpp_module *acq = mod == &mod->rpp->pre1.bls ?
+		&mod->rpp->pre1.acq : &mod->rpp->pre2.bls;
+	enum rpp_raw_pattern pattern = acq->info.acq.raw_pattern;
+
+	for (unsigned int i = 0; i < 4; ++i)
+		output[i] = input[swap[pattern][i]];
+}
+
+static int
+rppx1_bls_fill_params(struct rpp_module *mod,
+		      const union rppx1_params_block *block,
+		      rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_bls_params *cfg = &block->bls;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + BLS_CTRL_REG, 0);
+		return 0;
+	}
+
+	u32 ctrl = BLS_CTRL_BLS_EN;
+
+	if (cfg->mode == RPPX1_BLS_MODE_FIXED) {
+		static const u32 regs[] = {
+			BLS_A_FIXED_REG,
+			BLS_B_FIXED_REG,
+			BLS_C_FIXED_REG,
+			BLS_D_FIXED_REG,
+		};
+		u32 swapped[4];
+
+		rppx1_bls_swap_regs(mod, regs, swapped);
+
+		/*
+		 * The PRE1 pipe fixed values are 24-bits + 1 sign bit, while
+		 * the PRE2 pipe values are 12-bits + 1 sign bit.
+		 */
+		u32 mask;
+
+		switch (cfg->header.type) {
+		case RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1:
+			mask = BLS_PRE1_FIXED_MASK;
+			break;
+		case RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2:
+			mask = BLS_PRE2_FIXED_MASK;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		write(priv, mod->base + swapped[0], cfg->fixed.a & mask);
+		write(priv, mod->base + swapped[1], cfg->fixed.b & mask);
+		write(priv, mod->base + swapped[2], cfg->fixed.c & mask);
+		write(priv, mod->base + swapped[3], cfg->fixed.d & mask);
+	} else {
+		write(priv, mod->base + BLS_SAMPLES_REG, cfg->samples);
+
+		if (cfg->en_windows & RPPX1_BLS_WIN_EN_WIN1) {
+			write(priv, mod->base + BLS_H1_START_REG, cfg->window1.h_offs);
+			write(priv, mod->base + BLS_H1_STOP_REG, cfg->window1.h_size);
+			write(priv, mod->base + BLS_V1_START_REG, cfg->window1.v_offs);
+			write(priv, mod->base + BLS_V1_STOP_REG, cfg->window1.v_size);
+			ctrl |= BLS_CTRL_BLS_WIN1;
+		}
+
+		if (cfg->en_windows & RPPX1_BLS_WIN_EN_WIN2) {
+			write(priv, mod->base + BLS_H2_START_REG, cfg->window2.h_offs);
+			write(priv, mod->base + BLS_H2_STOP_REG, cfg->window2.h_size);
+			write(priv, mod->base + BLS_V2_START_REG, cfg->window2.v_offs);
+			write(priv, mod->base + BLS_V2_STOP_REG, cfg->window2.v_size);
+			ctrl |= BLS_CTRL_BLS_WIN2;
+		}
+
+		ctrl |= BLS_CTRL_BLS_MODE_MEASURED;
+	}
+
+	write(priv, mod->base + BLS_CTRL_REG, ctrl);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_bls_ops = {
 	.probe = rppx1_bls_probe,
+	.fill_params = rppx1_bls_fill_params,
 };
diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
index 50aba160c6cd..dbbd6223f33c 100644
--- a/include/uapi/linux/media/dreamchip/rppx1-config.h
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -86,6 +86,8 @@ enum rppx1_meas_chan {
  * @RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE1: PRE1 pipe Histogram Measurement
  * @RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE2: PRE2 pipe Histogram Measurement
  * @RPPX1_PARAMS_BLOCK_TYPE_HIST_POST: POST pipe Histogram Measurement
+ * @RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1: PRE1 pipe Black Level Subtraction
+ * @RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2: PRE2 pipe Black Level Subtraction
  */
 enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
@@ -97,6 +99,8 @@ enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE1,
 	RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE2,
 	RPPX1_PARAMS_BLOCK_TYPE_HIST_POST,
+	RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1,
+	RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2,
 };
 
 /**
@@ -321,6 +325,103 @@ struct rppx1_hist_params {
 	__u8 sample_shift;
 };
 
+/**
+ * struct rppx1_bls_fixed - BLS fixed subtraction values
+ *
+ * Fixed black level values subtracted from sensor data per Bayer channel.
+ * Negative values result in addition.
+ *
+ * The PRE1 pipe BLS module operates on a 24-bits input data and fixed black
+ * levels are stored as a signed 2's complement representation ranging from
+ * -2^24 to 2^24-1.
+ *
+ * The PRE2 pipe BLS module operates on a 12-bits input data and fixed black
+ * levels are stored as a signed 2's complement representation ranging from
+ * -2^12 to 2^12-1.
+ *
+ * Userspace is expected to provide fixed black level values with a bit-depth
+ * matching the one of pipe in use.
+ *
+ * These subtraction values are matched with the sensor native Bayer components
+ * ordering according to the cropping configuration on the input port.
+ *
+ * @a: subtraction value for channel A
+ * @b: subtraction value for channel B
+ * @c: subtraction value for channel C
+ * @d: subtraction value for channel D
+ */
+struct rppx1_bls_fixed {
+	__u32 a;
+	__u32 b;
+	__u32 c;
+	__u32 d;
+};
+
+/**
+ * enum rppx1_bls_mode - BLS subtraction mode
+ *
+ * Select if subtracted black level come from fixed or measured values.
+ *
+ * @RPPX1_BLS_MODE_FIXED: subtract fixed values
+ * @RPPX1_BLS_MODE_MEAS: subtract measured values
+ */
+enum rppx1_bls_mode {
+	RPPX1_BLS_MODE_FIXED,
+	RPPX1_BLS_MODE_MEAS,
+};
+
+/**
+ * enum rppx1_bls_win_en: BLS measurement configuration
+ *
+ * Select the measurement window to use for measured black level values.
+ *
+ * @RPPX1_BLS_WIN_EN_OFF: disable measurement
+ * @RPPX1_BLS_WIN_EN_WIN1: Enable measurement from window 1
+ * @RPPX1_BLS_WIN_EN_WIN2: enable measurement from window 2
+ * @RPPX1_BLS_WIN_EN_WIN12: enable measurement from window 1 and window 2
+ */
+enum rppx1_bls_win_en {
+	RPPX1_BLS_WIN_EN_OFF,
+	RPPX1_BLS_WIN_EN_WIN1,
+	RPPX1_BLS_WIN_EN_WIN2,
+	RPPX1_BLS_WIN_EN_WIN12,
+};
+
+/**
+ * struct rppx1_bls_params - RPP-X1 Black Level Subtraction Module
+ *
+ * The RPP-X1 Black Level Subtraction module is available on the PRE1 and PRE2
+ * pre-fusion pipes. Userspace selects which pipe to operate by setting the
+ * @header.type field to RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1 or
+ * RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2.
+ *
+ * The BLS module operates on fixed or measured data according to the setting of
+ * the @mode field. When RPPX1_BLS_MODE_FIXED is used userspace shall provide
+ * the per-channel black levels in @fixed. When RPPX1_BLS_MODE_MEAS is used
+ * userspace shall configure the measurement windows @window1 and optionally
+ * @window2 to select the optically black pixels region in the input frame. The
+ * @samples fields controls how many measure samples are used for averaging the
+ * measured black levels.
+ *
+ * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1 or
+ *	    type == RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2)
+ * @mode: BLS subtraction mode (see enum rppx1_bls_mode)
+ * @en_windows: BLS measurement mode (see rppx1_bls_win_en)
+ * @samples: log2 of the number of measured pixels per Bayer position
+ * @window1: BLS measurement window 1 (14 bits)
+ * @window2: BLS measurement window 2 (14 bits)
+ * @fixed: fixed subtraction values (see enum rppx1_bls_fixed)
+ */
+struct rppx1_bls_params {
+	struct v4l2_isp_params_block_header header;
+	__u8 mode;
+	__u8 en_windows;
+	__u8 samples;
+	struct rppx1_window window1;
+	struct rppx1_window window2;
+	struct rppx1_bls_fixed fixed;
+};
+
 /**
  * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
  *
@@ -336,7 +437,9 @@ struct rppx1_hist_params {
 	sizeof(struct rppx1_exm_params)				+	\
 	sizeof(struct rppx1_hist_params)			+	\
 	sizeof(struct rppx1_hist_params)			+	\
-	sizeof(struct rppx1_hist_params))
+	sizeof(struct rppx1_hist_params)			+	\
+	sizeof(struct rppx1_bls_params)				+	\
+	sizeof(struct rppx1_bls_params))
 
 /* ---------------------------------------------------------------------------
  * Statistics Structures
-- 
2.54.0


