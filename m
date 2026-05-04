Return-Path: <linux-media+bounces-60218-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJLIFAXy92mjoQIAu9opvQ
	(envelope-from <linux-media+bounces-60218-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 03:10:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEDC4B7E31
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 03:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BAC8302528F
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 01:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07AD71C84BB;
	Mon,  4 May 2026 01:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="HSKKXt+b";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mIIDhoEa"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69C01A6837;
	Mon,  4 May 2026 01:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777856945; cv=none; b=KfwSi+rgr7iTUkfLUn4vTYiYo2rE3/9thzXbzdx6q07hR3leT0Ea2AB6uJz0Nf7xRiMGOJ9oZ0663/7xEMjZUyJbt+Qdmwt+FSvpgyMkfW6yh4K73ZOFww2/39EyiYUYRw8sGBLR8g5LCEKf0LkJEN2cuE+knas6NCv43v2qLMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777856945; c=relaxed/simple;
	bh=soZBTxhZAmxV5hkYz07obJ1kDfvkTfr2nt2oG5KdrhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RwWfx00uFPboz7JAwy0daI7Ubls1vvgxec/tPf+oclVUZ8hVtFetEZyIPHcHlzordBeavDHgMpjUfijphNUqKxIXWQfg87cVQBFksji1ihhLboSxsrYKydXKvnf0cYSMlLClwfJSdk/yKcfW59CasbuS14UpyfElbKxKFCBiaLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=HSKKXt+b; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mIIDhoEa; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id F2AD61D000AA;
	Sun,  3 May 2026 21:09:02 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 03 May 2026 21:09:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777856942;
	 x=1777943342; bh=Gs7sS1/fOeALHVHI3+YLAESAX1aeprkYfkuZMPfF5jU=; b=
	HSKKXt+bphAiEqZPBYexDKrVZCCwVA/oeeWW3Gme7dD4KwpDDGtLK9jR9kGXXylR
	o49m1cYlDmP1cV2fbM4bBzQYhMH57f2r07I5/97nlyi6xH57RMjnNhnpiNRkEstq
	cBl8OH/f2dBktneQBq5ggomPEDnXrrXceHWJimNCY2+YGUagnTNh7ycHkrMtdqP1
	BkNXH0Dpj4+WUOxkh4EUwKcyI3NB9pBH8qkdDSIt02T5B61SOQmK6k9nebrAVMB8
	32SCJRDn4KJW7Aj0KIEUcID74+F9o7vLTY9jYg8PiQfy6HMewCHkr11Bmk0cWcz9
	ImMF4z5IBvsxDi2XmUalWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777856942; x=
	1777943342; bh=Gs7sS1/fOeALHVHI3+YLAESAX1aeprkYfkuZMPfF5jU=; b=m
	IIDhoEaoE/2OGRxzAnh2C8V99Kgj6PS1VIhoBCPcQN+pDPtpN0e/bU+v22VGCWAD
	hJ2JwtvZn62ZMrcPps7Z4bJGkNXLoX747MV8vZBdk2HeB9jjfMHfNaRCEpEXO4Dg
	GgwOICfJosBdbcah1gyZYYlNjuzWP6UzN47c9Fizf/pfYKqHEyo+xRJrZQWHYIc6
	I2lmqaXnZXXZRNj6L8StRlWr3AEEwW3wHC6DaYXXIjBKqda0RDxhgBbJMok/qCdo
	cKwdDgVm6GsGVyxcrfLpJdafFXPXGyI02bpFzpqYBxYXWNlhXk+DmUhiHuS56TEj
	KUqLCLyr7QJwFi95ZDuZA==
X-ME-Sender: <xms:rvH3aVOX3r_Cu0RMcXl6KRA8o0sgmoVhSAV5bfwgHEHYqLJPEUiteg>
    <xme:rvH3aYa24DnnCOEGoZ7LNOOWVaJ7Tk_SFeBWy9qamNenGF-_g2YsRpFGaYVbGDwYu
    nHmi92ZUFnQvD0vJ_sCNwx_5hhMCDMDhAzW5M7qt_5-ImxSpE3aUTc>
X-ME-Received: <xmr:rvH3aU8XOcnt1Lq9AtgqZLG0YY7gL5YcdKRXT5PQgHTWT4-A3c9-MD7FcuLD6lZiE_IkgB2uh-xszuwRCtTEU9I5FxyiYx4DfY9W>
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
X-ME-Proxy: <xmx:rvH3aZTN324fs8MzyJKLdBaw1kfrSkfdaJCMMCIgPvHOirF7HCuRGg>
    <xmx:rvH3aee4E5hY87ZooVipwxCBGTyQ1_sMzUWDXOnv5OQd6zjjUKlFzA>
    <xmx:rvH3abRF7m8_ocoLVVp-g26-rvUh4Dxjc9aql5pSvXR88-Gm2bXKCw>
    <xmx:rvH3aaI9IXH5F82IVQ8hnq4ft9Iix65AvB6-i-lOENJhtoJGk9KKXA>
    <xmx:rvH3aeV4FI3fmv983P41sR6NaBFvQqvAIB7QeMun4ceoutUhq4vdEJgW>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 3 May 2026 21:09:02 -0400 (EDT)
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
Subject: [v8 04/14] media: rppx1: wbmeas: Add support for white balance measurement
Date: Mon,  4 May 2026 03:05:46 +0200
Message-ID: <20260504010556.2796398-5-niklas.soderlund+renesas@ragnatech.se>
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
X-Rspamd-Queue-Id: AAEDC4B7E31
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-60218-lists,linux-media=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ragnatech.se:email,ragnatech.se:dkim,ragnatech.se:mid,messagingengine.com:dkim]

Extend the RPPX1 driver to allow setting the white balance measurement
configuration and consuming the resulting statistics. It uses the RPPX1
framework for parameters and its writer abstraction to allow the user to
control how, and when, configuration is applied to the RPPX1.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Co-developed-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
---
 .../platform/dreamchip/rppx1/rpp_module.h     |   2 +
 .../platform/dreamchip/rppx1/rpp_params.c     |   4 +
 .../platform/dreamchip/rppx1/rpp_stats.c      |  18 +++
 .../platform/dreamchip/rppx1/rppx1_wbmeas.c   | 103 ++++++++++++++++++
 .../uapi/linux/media/dreamchip/rppx1-config.h | 101 ++++++++++++++++-
 5 files changed, 226 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
index 742904973e35..85fb23174e57 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
@@ -85,10 +85,12 @@ void rpp_module_clrset(struct rpp_module *mod, u32 offset, u32 mask, u32 value);
 
 union rppx1_params_block {
 	struct v4l2_isp_params_block_header header;
+	struct rppx1_wbmeas_params wbmeas;
 };
 
 union rppx1_stats_block {
 	struct v4l2_isp_params_block_header header;
+	struct rppx1_wbmeas_stats wbmeas;
 };
 
 struct rpp_module_ops {
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index a5feb18f3bd5..1262350d2190 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -16,6 +16,7 @@
 
 static const struct v4l2_isp_block_type_info
 rppx1_ext_params_blocks_info[] = {
+	RPPX1_PARAMS_BLOCK_INFO(WBMEAS_POST, wbmeas),
 };
 
 int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
@@ -50,6 +51,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		block_offset += block->header.size;
 
 		switch (block->header.type) {
+		case RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST:
+			module = &rpp->post.wbmeas;
+			break;
 		default:
 			module = NULL;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
index 8f43e56ba361..4c38e657e5f0 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
@@ -14,6 +14,11 @@
 		.size = sizeof(struct rppx1_ ## block ## _stats), \
 	}
 
+static const struct v4l2_isp_block_type_info
+rppx1_stats_blocks_info[] = {
+	RPPX1_STATS_BLOCK_INFO(WBMEAS_POST, wbmeas),
+};
+
 #define rppx1_init_stats_block(rpp, buf, type)				\
 	((union rppx1_stats_block *)					\
 	v4l2_isp_stats_init_block((rpp)->dev, (buf),			\
@@ -23,5 +28,18 @@
 
 void rppx1_stats_fill_isr(struct rppx1 *rpp, u32 isc, void *buf)
 {
+	struct v4l2_isp_buffer *stats = buf;
+	union rppx1_stats_block *block;
+
+	v4l2_isp_stats_init_buffer(stats);
+
+	if (isc & RPPX1_IRQ_ID_POST_AWB_MEAS) {
+		block = rppx1_init_stats_block(rpp, stats,
+					       RPPX1_STATS_BLOCK_TYPE_WBMEAS_POST);
+		if (!block)
+			return;
+
+		rpp_module_call(&rpp->post.wbmeas, fill_stats, block);
+	}
 }
 EXPORT_SYMBOL_GPL(rppx1_stats_fill_isr);
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c b/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
index 3d197d914d07..53263bc96280 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
@@ -56,6 +56,109 @@ static int rppx1_wbmeas_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static int
+rppx1_wbmeas_fill_params(struct rpp_module *mod,
+			 const union rppx1_params_block *block,
+			 rppx1_reg_write write, void *priv)
+{
+	const struct rppx1_wbmeas_params *cfg = &block->wbmeas;
+	u32 awb_meas_props;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + AWB_MEAS_PROP_REG, 0);
+		return 0;
+	}
+
+	/* Program measurement window. */
+	write(priv, mod->base + AWB_MEAS_H_OFFS_REG, cfg->wnd.h_offs);
+	write(priv, mod->base + AWB_MEAS_V_OFFS_REG, cfg->wnd.v_offs);
+	write(priv, mod->base + AWB_MEAS_H_SIZE_REG, cfg->wnd.h_size);
+	write(priv, mod->base + AWB_MEAS_V_SIZE_REG, cfg->wnd.v_size);
+
+	/* Set number of frames to sample. */
+	write(priv, mod->base + AWB_MEAS_FRAMES_REG, cfg->frames);
+
+	if (cfg->mode == RPPX1_WBMEAS_MODE_YCBCR) {
+		write(priv, mod->base + AWB_MEAS_REF_CB_MAX_B_REG,
+		      cfg->ref_cb_max_b);
+		write(priv, mod->base + AWB_MEAS_REF_CR_MAX_R_REG,
+		      cfg->ref_cr_max_r);
+		write(priv, mod->base + AWB_MEAS_MAX_Y_REG, cfg->max_y);
+		write(priv, mod->base + AWB_MEAS_MIN_Y_MAX_G_REG,
+		      cfg->min_y_max_g);
+		write(priv, mod->base + AWB_MEAS_MAX_CSUM_REG, cfg->max_csum);
+		write(priv, mod->base + AWB_MEAS_MIN_C_REG, cfg->min_c);
+
+		/*
+		 * Program the color conversion matrix coefficients and the
+		 * per-color channel offsets.
+		 */
+		for (unsigned int i = 0; i < 3; i++) {
+			for (unsigned int j = 0; j < 3; j++) {
+				unsigned int index = i * 3 + j;
+
+				write(priv,
+				      mod->base + AWB_MEAS_CCOR_COEFF_REG(index),
+				      cfg->ccor_coeff[i][j]);
+			}
+		}
+
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_R_REG,
+		      cfg->ccor_offs[0]);
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_G_REG,
+		      cfg->ccor_offs[1]);
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_B_REG,
+		      cfg->ccor_offs[2]);
+
+		awb_meas_props = cfg->ymax_cmp ? AWB_MEAS_PROP_YMAX : 0;
+	} else {
+		write(priv, mod->base + AWB_MEAS_REF_CB_MAX_B_REG,
+		      cfg->ref_cb_max_b);
+		write(priv, mod->base + AWB_MEAS_REF_CR_MAX_R_REG,
+		      cfg->ref_cr_max_r);
+		write(priv, mod->base + AWB_MEAS_MIN_Y_MAX_G_REG,
+		      cfg->min_y_max_g);
+
+		/* Bypass color conversion matrix and color offsets. */
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(0), 0x1000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(1), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(2), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(3), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(4), 0x1000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(5), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(6), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(7), 0x0000);
+		write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(8), 0x1000);
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_R_REG, 0x00000000);
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_G_REG, 0x00000000);
+		write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_B_REG, 0x00000000);
+
+		awb_meas_props = AWB_MEAS_PROP_MEAS_MODE_RGB;
+	}
+
+	write(priv, mod->base + AWB_MEAS_PROP_REG,
+	      awb_meas_props | AWB_MEAS_PROP_AWB_MODE_ON);
+
+	return 0;
+}
+
+static int rppx1_wbmeas_fill_stats(struct rpp_module *mod,
+				   union rppx1_stats_block *block)
+{
+	struct rppx1_wbmeas_stats *stats = &block->wbmeas;
+
+	/* Return measurements at native hardware precision. */
+	stats->cnt = rpp_module_read(mod, AWB_MEAS_WHITE_CNT_REG);
+	stats->mean_y_or_g = rpp_module_read(mod, AWB_MEAS_MEAN_Y_G_REG);
+	stats->mean_cb_or_b = rpp_module_read(mod, AWB_MEAS_MEAN_CB_B_REG);
+	stats->mean_cr_or_r = rpp_module_read(mod, AWB_MEAS_MEAN_CR_R_REG);
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_wbmeas_ops = {
 	.probe = rppx1_wbmeas_probe,
+	.fill_params = rppx1_wbmeas_fill_params,
+	.fill_stats = rppx1_wbmeas_fill_stats
 };
diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
index 26627be6f483..1d76a85164c8 100644
--- a/include/uapi/linux/media/dreamchip/rppx1-config.h
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -40,13 +40,81 @@ struct rppx1_window {
  * wider-than-8-bit results.
  */
 
+/**
+ * enum rppx1_params_block_type - RPP-X1 extensible params block types
+ *
+ * NOTE: Only append to the enumeration as the numbers are uAPI.
+ *
+ * @RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST: AWB Measurement Configuration
+ */
+enum rppx1_params_block_type {
+	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
+};
+
+/**
+ * enum rppx1_wbmeas_mode - AWB measurement mode
+ *
+ * @RPPX1_WBMEAS_MODE_YCBCR: YCbCr measurement mode
+ * @RPPX1_WBMEAS_MODE_RGB: RGB measurement mode
+ */
+enum rppx1_wbmeas_mode {
+	RPPX1_WBMEAS_MODE_YCBCR,
+	RPPX1_WBMEAS_MODE_RGB,
+};
+
+/**
+ * struct rppx1_wbmeas_params - AWB measurement configuration
+ *
+ * The Auto-White Balance measurement module is available on the MAIN_POST pipe.
+ * It supports two measurement modes, selected by the @mode field. The
+ * measurement window is programmed through the @wnd field.
+ *
+ * To support measurement in YCbCr mode a color conversion matrix with
+ * programmable offset is available in the @ccor_coeff and @ccor_offs fields.
+ * The color conversion matrix coefficients are represented as 16 bits signed
+ * Q4.12 numbers ranging from -8 to +7.99. The per-color channel offsets are
+ * represented as 25 bits 2's complement integer numbers ranging from -16777216
+ * to +16777215.
+ *
+ * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST)
+ * @mode: measurement mode (from enum rppx1_wbmeas_mode)
+ * @ymax_cmp: enable Y_MAX compare using @max_y
+ * @wnd: measurement window
+ * @frames: number of frames for mean value calculation (0 = 1 frame)
+ * @ref_cr_max_r: reference Cr or max red value in RGB mode, 24 bits
+ * @ref_cb_max_b: reference Cb or max blue value in RGB mode, 24 bits
+ * @min_y_max_g: luminance minimum value or max green value in RGB mode, 24 bits
+ * @max_y: luminance maximum value, only valid if @mode is set to YCbCr and
+ *	   @ymax_cmp is set to enabled, 24 bits
+ * @max_csum: chrominance sum maximum value, 24 bits
+ * @min_c: chrominance minimum value, 24 bits
+ * @ccor_coeff: coefficients for color conversion matrix, signed 16 bits Q4.6
+ * @ccor_offs: R-G-B color conversion coefficients, signed 25 bits 2's complement
+ */
+struct rppx1_wbmeas_params {
+	struct v4l2_isp_params_block_header header;
+	__u8 mode;
+	__u8 ymax_cmp;
+	struct rppx1_window wnd;
+	__u8 frames;
+	__u32 ref_cr_max_r;
+	__u32 ref_cb_max_b;
+	__u32 min_y_max_g;
+	__u32 max_y;
+	__u32 max_csum;
+	__u32 min_c;
+	__u16 ccor_coeff[3][3];
+	__u32 ccor_offs[3];
+};
+
 /**
  * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
  *
  * Some types are reported twice as the same block might be instantiated in
  * multiple pipes.
  */
-#define RPPX1_PARAMS_MAX_SIZE 0
+#define RPPX1_PARAMS_MAX_SIZE						\
+	(sizeof(struct rppx1_wbmeas_params))
 
 /* ---------------------------------------------------------------------------
  * Statistics Structures
@@ -55,12 +123,41 @@ struct rppx1_window {
  * wider-than-8-bit results.
  */
 
+/**
+ * enum rppx1_stats_block_type - RPP-X1 extensible stats block types
+ *
+ * NOTE: Only append to the enumeration as the numbers are uAPI.
+ *
+ * @RPPX1_STATS_BLOCK_TYPE_WBMEAS_POST: post-fusion white-balance measurement
+ */
+enum rppx1_stats_block_type {
+	RPPX1_STATS_BLOCK_TYPE_WBMEAS_POST,
+};
+
+/**
+ * struct rppx1_wbmeas_stats - AWB statistics
+ *
+ * @header: block header (type = RPPX1_STATS_BLOCK_TYPE_WBMEAS)
+ * @cnt: Number of pixels matched
+ * @mean_y_or_g: mean Y (or G in RGB mode) value, 24-bit
+ * @mean_cb_or_b: mean Cb (or B in RGB mode) value, 24-bit
+ * @mean_cr_or_r: mean Cr (or R in RGB mode) value, 24-bit
+ */
+struct rppx1_wbmeas_stats {
+	struct v4l2_isp_block_header header;
+	__u32 cnt;
+	__u32 mean_y_or_g;
+	__u32 mean_cb_or_b;
+	__u32 mean_cr_or_r;
+};
+
 /**
  * RPPX1_STATS_MAX_SIZE - Maximum size of all RPP-X1 statistics
  *
  * Some types are reported twice as the same block might be instantiated in
  * multiple pipes.
  */
-#define RPPX1_STATS_MAX_SIZE 0
+#define RPPX1_STATS_MAX_SIZE						\
+	(sizeof(struct rppx1_wbmeas_stats))
 
 #endif /* __UAPI_RPP_X1_CONFIG_H */
-- 
2.54.0


