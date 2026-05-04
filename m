Return-Path: <linux-media+bounces-60225-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePx+G+/x92mjoQIAu9opvQ
	(envelope-from <linux-media+bounces-60225-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 03:10:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC684B7E05
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 03:10:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2B5A3300845D
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 01:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FEA01A76BB;
	Mon,  4 May 2026 01:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Rz1mTB4I";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RU/3l38u"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77081ACEDF;
	Mon,  4 May 2026 01:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777856964; cv=none; b=NItThNxdzcXZlj3XiHfz//xdwNt2QFodHA7eQ85IwoJsm12NIPKXaWDcmoeed6rQz3MKaoPNrKP2B+pw9sy3S6k4oNEJ57K+aNeadOo4iLcHXOwKNEKMzzDUdmCiC5AMjA16hsVQ2iMip6KPdsKBn35f4pCl9dAlWnS9L4+shdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777856964; c=relaxed/simple;
	bh=zD2SFvMoPMdpABmDVxu//bvNmn2dZJiRebnXy2wOxfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NnstbWRIk5QH9/Z9IAv5RxnZF1xWAe5HY0SHJAYZfVlrhi1hJwQXolSIzwjH3tlhNQn8YVyYCIzdxRYB2FtbJKlqBWQUUATymyOhHKytM52zbN47hjv/A6Ogjc8cSANeW0KkxknZ1LoXcQgCPJfxo843jQ6DM/Ya3PNUfwsc8IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Rz1mTB4I; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RU/3l38u; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2EBF77A0072;
	Sun,  3 May 2026 21:09:19 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Sun, 03 May 2026 21:09:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777856959;
	 x=1777943359; bh=yKvr7QwSN0OSQnGGbQ2zuI/BgM9VaBL8pOubiPkpjuI=; b=
	Rz1mTB4IS2ClxMvmlajDy0O0geq/1oe8k23SbTYRdpVJUywvGePxkLUvIGWfWOUj
	jXUYu4ldO5V79cZ2YWmb6QbRhs6HWUEX7CDvuz7WZ1ZpRMh2AuK+H4ui3KBCp/gC
	SOfxbyb6IXwLTPYjZaHZ2rdLRZhQo4ODJ0566+qMvKD4/VmUMCjw58BnlVQRHhw7
	72t2+nwiePqbsh/cBt7lEUuY7c6c++i9t9Ps1+9YnT2pAQIOzctoaiiDXSS5v5hn
	IkP8yYR+JGik9iMOqrMianen97zQ+x0gY55Gh1G4x/UfRQ1I/IqBhyEY+Ne8ElU/
	7E9rES1i7rDCMJ2lmtN/wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777856959; x=
	1777943359; bh=yKvr7QwSN0OSQnGGbQ2zuI/BgM9VaBL8pOubiPkpjuI=; b=R
	U/3l38uqG2123Rrpu0Zqzsr4cAQCJXF3HUJIzDlLydeNbKOsseOrWidWZsF0HmfJ
	Cyuoy+eOoEdlOJbpI4F4rI0aN3s5IVAH0a0afNkhoLTBV54w94gNKnsjXxPrISbm
	IgeWRk68+QwZhTqYgJBlfpA+l5pYUdhGuML6EdLkduDYYxaUvPlmzX7c9aX/FO+4
	v+UgcOmrBWynM4QQB9/Cdh59sVaczaiUGDrMCHMHKxqJcIgkFmlF7hnKPvIcG9FQ
	a/fQ0jcui1Kffq9yE/bVOWJv7EdzfThdrAm6LgGMk3U2tFpIvl3L5AEfjr9tBgz3
	i4I9u4tNwE2VDzgG6rNfQ==
X-ME-Sender: <xms:vvH3ac_uP70XMUW_LsF-8ABBULCWO8OkkpH7d1cT_c1toHYmQNTLfA>
    <xme:vvH3aWSkoXZ5dG1vo3BMiNvkVi0uhQ2zJwfJuwzbmRn-rzPDRJtIHI_q-gCkDEqxa
    pe3bwk28Q9APEIGKJx6wFfZKKZjs82Hx8JPcqEKDXTNaqfDn_GNE8Q>
X-ME-Received: <xmr:vvH3aYW9gHjkS6hblSF6qifPF4nT2vKKLyX-OZOMQNQSG0-6-y3AjJG6XSulEr5jl8QmKFtHvrbeY_8lX2iFfYeUXJH_wg5UwmLV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeljeegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepledpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepjhgrihdrlhhuthhhrhgrodhrvghnvghsrghssehiuggv
    rghsohhnsghorghrugdrtghomhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehkuhhnihhnohhrihdrmhhorhhimhhothhordhggiesrhgv
    nhgvshgrshdrtghomhdprhgtphhtthhopehjrggtohhpohdrmhhonhguihesihguvggrsh
    honhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhht
    sehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguih
    grsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgv
    shgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhk
    lhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:vvH3aYRoWHlv_0KOGkDzEnsSL4gzwFbxQHjCtmN77t05ju2IH0v_eg>
    <xmx:vvH3aY0ZsBqV84PNg9cYyqvTrT81CoJUtgEE2x5H_KU9bHgNFHdUTg>
    <xmx:vvH3aQdnCcR8cCs6--GXx-slwM2A3Y7W82WiSxd4fob8Og53FJkGeg>
    <xmx:vvH3aYOfB9Bn41ZxzbBtJaCM-eJYV3BUTc8goKmwPXxoG9h3L0T58Q>
    <xmx:v_H3aZrwYZrrC7v2zVI6RkN32ibaz0cpSbcO9XZRPZSB--iekaAV_iJt>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 3 May 2026 21:09:18 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [v8 11/14] media: rppx1: ga: Add support for gamma out correction
Date: Mon,  4 May 2026 03:05:53 +0200
Message-ID: <20260504010556.2796398-12-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504010556.2796398-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260504010556.2796398-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6BC684B7E05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60225-lists,linux-media=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:email,ragnatech.se:email,ragnatech.se:dkim,ragnatech.se:mid,messagingengine.com:dkim]

Extend the RPPX1 driver to allow setting the gamma out correction
configuration parameters. It uses the RPPX1 framework for parameters and
its writer abstraction to allow the user to control how, and when,
configuration is applied to the RPPX1.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Co-developed-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
---
 .../platform/dreamchip/rppx1/rpp_module.h     |  1 +
 .../platform/dreamchip/rppx1/rpp_params.c     |  5 ++
 .../media/platform/dreamchip/rppx1/rppx1_ga.c | 43 ++++++++++++++-
 .../uapi/linux/media/dreamchip/rppx1-config.h | 53 ++++++++++++++++++-
 4 files changed, 100 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
index 11c38ea843f4..830ef0df7228 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
@@ -92,6 +92,7 @@ union rppx1_params_block {
 	struct rppx1_hist_params hist;
 	struct rppx1_exm_params exm;
 	struct rppx1_wbmeas_params wbmeas;
+	struct rppx1_ga_params ga;
 };
 
 union rppx1_stats_block {
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index f66640aff5b7..317ed715f1de 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -29,6 +29,8 @@ rppx1_ext_params_blocks_info[] = {
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
 			module = NULL;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c b/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
index d6c7f951cf29..5dec868c1ed7 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
@@ -14,9 +14,11 @@
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
@@ -43,7 +45,46 @@ static int rppx1_ga_start(struct rpp_module *mod,
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
index e9d8c379bd50..d173c0c1bfc0 100644
--- a/include/uapi/linux/media/dreamchip/rppx1-config.h
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -89,6 +89,8 @@ enum rppx1_meas_chan {
  * @RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST: POST pipe Color Correction
  * @RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE1: PRE1 pipe Lens Shading Correction
  * @RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE2: PRE2 Lens Shading Correction
+ * @RPPX1_PARAMS_BLOCK_TYPE_GA_HV: Human Vision Pipe Gamma Out Correction
+ * @RPPX1_PARAMS_BLOCK_TYPE_GA_MV: Machine Vision Gamma Out Correction
  */
 enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
@@ -105,6 +107,8 @@ enum rppx1_params_block_type {
 	RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST,
 	RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE1,
 	RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE2,
+	RPPX1_PARAMS_BLOCK_TYPE_GA_HV,
+	RPPX1_PARAMS_BLOCK_TYPE_GA_MV,
 };
 
 /**
@@ -495,6 +499,51 @@ struct rppx1_lsc_params {
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
@@ -515,7 +564,9 @@ struct rppx1_lsc_params {
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


