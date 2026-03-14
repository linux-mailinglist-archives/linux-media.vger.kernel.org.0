Return-Path: <linux-media+bounces-55808-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPgtOc3dtWlT6AAAu9opvQ
	(envelope-from <linux-media+bounces-55808-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 23:14:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8FD28F3F9
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 23:14:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E12EF307C276
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 22:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF385386C28;
	Sat, 14 Mar 2026 22:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="sAR3M5js";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RrUA5mfp"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E723C38654D;
	Sat, 14 Mar 2026 22:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773526262; cv=none; b=dXqFE5Iv0CiqEVKm+gJHaesR4MbMjG4+lzjZVvlsj/qfK5oT15D9Bd452OEzsZf8A2pZGAUhX3Xfkp+CCQli49lM2Fe+jZ+lPTYhK2id06lFMWvHdwN6DzXqcLJW4cLEei+89+P5bMejir1UkvJJwdvJgbaFNbFzSX8X9ySaJkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773526262; c=relaxed/simple;
	bh=AGzvjzXHvnlnlV6IKWSbwAw1/Ld00KwaldS7j2d/q/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NX3ZSn9YUX0/Mk69ou8MyR82DRICidh/E/RmRYb3OnAtbZkN5qbQ8r2yMHyO28NnGVdSc+nN6b5sYEpk2ZhL1CdyklgXQd3/l//IvE5veyFM7CKymyFy6VkGzbus9sBhjZYDBd/ThyeZy1+z7+GaphuwH7X9Fxxed6lbrGwxZjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=sAR3M5js; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RrUA5mfp; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 54FAAEC0B41;
	Sat, 14 Mar 2026 18:11:00 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sat, 14 Mar 2026 18:11:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773526260;
	 x=1773612660; bh=+E5daJH8oJNkNB1/Mh0mDqK+mJOZ+qIsWkO/RkJVKzM=; b=
	sAR3M5js1epyWqwrPZM11qisj0zWZMCW1cXuVZ9o48JBbljKOnAGyAmIo6b2J8ID
	5WukYGiyKBWPBnGhmCWkloMafswPU7cg4uSiZu4JBGE7VE9sDZ3lajZ15N3ZHrbh
	AcMx2zKAopLP8lAA+ptGUxW5yuP+4nZwFux9tvWveDAUveuKMPAMtoWM+iyFUAnZ
	RuWUkdJ6N2qz3qC41mNxzVV+XYJqhlgSSVIRVKY/MVsuuyQ7VTr6VE/h7Rjq+WIW
	nAFtg5AV6B79tU/KcihbPPOPMk1WIMGk/1pUSPSNfuQP+LrYfnaeIr7WY7Z7vzUb
	qrOniL03kdm16+iShmxz/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773526260; x=
	1773612660; bh=+E5daJH8oJNkNB1/Mh0mDqK+mJOZ+qIsWkO/RkJVKzM=; b=R
	rUA5mfpD2g7B38jRQ348eZ5zClKayT5JpA04KmDgykrnADj5kxkNwoUNJhObjysk
	BlT9K0QH/CZUR3z660kMWve3ZZYG00KJl5YkPFr4ekKTpx0JROjFap/G3J8UbMo8
	qNzxxgjKx8MinNcIrX6OP48F6i2zmk6QjH0WPQmH1Wo8uDXdjhmBtClROwFlOdfT
	PcEBeLp8+FMctnrFhHXk9iZLHMT9+me+ycFE0YLwVIwXE6KvJRPO7g1RV/rEaRYS
	XZprD/DOhdo0hVjrOL+Rl7nj1twQiO5ouZyFlzjPtwpa4zTp+JyWbofrn5SmcN0o
	0/BnPGjD5WcI8HrsvK+UA==
X-ME-Sender: <xms:9Ny1aXqig5CvbuE0DxrMoKZjzByTPPaESst6LGHHIMrYb9Y6ARdPsA>
    <xme:9Ny1aSGAH3LU8jh-zCby4Zwun9foCW-1wYYbCkrxCo6l8OAjRYOZsZuSKWYp9vlN9
    aU8073RfSROP56JMifxEsftPO3iu2McSg1UVyKgtj8nyqS9-5Ggogk>
X-ME-Received: <xmr:9Ny1aU4w-mlJUQyWz1spwUWPoY0gYov-Fe3z-QJV1djeJLWPYHMMDU-U5Z6bzOBCLVdtn8IOGyM9jfxhrjjiQSDxjrIxcd8TiIFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvleefjeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeelpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehkuhhnihhnohhrihdrmhhorhhimhhothhordhggiesrhgvnhgvshgrshdrtg
    homhdprhgtphhtthhopehjrggtohhpohdrmhhonhguihesihguvggrshhonhgsohgrrhgu
    rdgtohhmpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsoh
    hnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotg
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgv
    lhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvpdhrtghpthhtohep
    mhgrrhgvkhdrvhgrshhuthdorhgvnhgvshgrshesmhgrihhlsghogidrohhrgh
X-ME-Proxy: <xmx:9Ny1aSeMoIqYENS539Vy3MU668sGSCGsU9C29P1nXiFilx7QCHORUA>
    <xmx:9Ny1aX7v4L3tmECN_e57YOK3Vmdd5TV6vra_hU9siJQrp3tYmXMdJg>
    <xmx:9Ny1af8tjiyANdzZvncdzbu1VWOCFEC7LDOrsSgthZdKnsV_9OJgGQ>
    <xmx:9Ny1aZGHDpsWUb2U9jcehgf6MtGS5A6D_u7lugZckHvyLsPhimXYmw>
    <xmx:9Ny1aZzf3-zrEGG0l4OBVL0DFPLNxfpco-sfh246q6QHYboQCIhRZx8K>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Mar 2026 18:10:59 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Subject: [PATCH v6 05/12] media: rppx1: Add support for Auto Exposure Measurement
Date: Sat, 14 Mar 2026 22:59:37 +0100
Message-ID: <20260314215944.3674865-6-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260314215944.3674865-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260314215944.3674865-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55808-lists,linux-media=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,mailbox.org:email,messagingengine.com:dkim]
X-Rspamd-Queue-Id: 4C8FD28F3F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Extend the RPPX1 driver to allow setting the EXM configuration using the
RkISP1 parameter buffer format. It uses the RPPX1 framework for
parameters and its writer abstraction to allow the user to control how
(and when) configuration is applied to the RPPX1.

As the RkISP1 parameters buffer have lower precision then the RPPX1
hardware the values needs to be scaled. The behavior matches the RkISP1
hardware.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |  4 +
 .../platform/dreamchip/rppx1/rpp_stats.c      |  4 +
 .../platform/dreamchip/rppx1/rppx1_exm.c      | 89 +++++++++++++++++++
 3 files changed, 97 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index 92f16e139ee4..e3f96528b837 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -18,6 +18,7 @@ static const struct v4l2_isp_params_block_type_info
 rkisp1_ext_params_blocks_info[] = {
 	RKISP1_PARAMS_BLOCK_INFO(AWB_GAIN, awb_gain),
 	RKISP1_PARAMS_BLOCK_INFO(AWB_MEAS, awb_meas),
+	RKISP1_PARAMS_BLOCK_INFO(AEC_MEAS, aec),
 };
 
 int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
@@ -58,6 +59,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
 		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS:
 			module = &rpp->post.wbmeas;
 			break;
+		case RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS:
+			module = &rpp->pre1.exm;
+			break;
 		default:
 			module = NULL;
 			break;
diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
index a6abb85f0df1..d62b26e24cb0 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
@@ -15,5 +15,9 @@ void rppx1_stats_fill_isr(struct rppx1 *rpp, u32 isc, void *buf)
 	if (isc & RPPX1_IRQ_ID_POST_AWB_MEAS)
 		if (!rpp_module_call(&rpp->post.wbmeas, stats_rkisp1, &stats->params))
 			stats->meas_type |= RKISP1_CIF_ISP_STAT_AWB;
+
+	if (isc & RPPX1_IRQ_ID_PRE1_EXM)
+		if (!rpp_module_call(&rpp->pre1.exm, stats_rkisp1, &stats->params))
+			stats->meas_type |= RKISP1_CIF_ISP_STAT_AUTOEXP;
 }
 EXPORT_SYMBOL_GPL(rppx1_stats_fill_isr);
diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_exm.c b/drivers/media/platform/dreamchip/rppx1/rppx1_exm.c
index 0c40300e13ad..c9478ea5f851 100644
--- a/drivers/media/platform/dreamchip/rppx1/rppx1_exm.c
+++ b/drivers/media/platform/dreamchip/rppx1/rppx1_exm.c
@@ -10,6 +10,7 @@
 #define EXM_START_REG			0x0004
 
 #define EXM_CTRL_REG			0x0008
+#define EXM_CTRL_EXM_AUTOSTOP		BIT(1) /* HW doc says not supported. */
 #define EXM_CTRL_EXM_UPDATE_ENABLE	BIT(0)
 
 #define EXM_MODE_REG			0x000c
@@ -46,6 +47,94 @@ static int rppx1_exm_probe(struct rpp_module *mod)
 	return 0;
 }
 
+static int
+rppx1_exm_param_rkisp1(struct rpp_module *mod,
+		       const union rppx1_params_rkisp1_config *block,
+		       rppx1_reg_write write, void *priv)
+{
+	const struct rkisp1_ext_params_aec_config *cfg = &block->aec;
+	const struct rkisp1_cif_isp_aec_config *arg = &cfg->config;
+	u32 h_offs, v_offs, h_size, v_size;
+
+	/* If the modules is disabled, simply bypass it. */
+	if (cfg->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
+		write(priv, mod->base + EXM_MODE_REG, 0);
+		return 0;
+	}
+
+	/* RGB bayer exposure measurement */
+	write(priv, mod->base + EXM_MODE_REG, 2);
+
+	write(priv, mod->base + EXM_CTRL_REG, EXM_CTRL_EXM_UPDATE_ENABLE |
+	      arg->autostop ? EXM_CTRL_EXM_AUTOSTOP : 0);
+
+	/*
+	 * Select where to sample.
+	 * 0 - after input acquisition
+	 * 1 - after black level subtraction
+	 * 2 - after input linearization
+	 * 3 - after lens shade correction
+	 * 4 - after white balance gain stage
+	 * 5 - after defect pixel correction
+	 * 6 - after denoising
+	 */
+	write(priv, mod->base + EXM_CHANNEL_SEL_REG, 6);
+
+	if (arg->mode == RKISP1_CIF_ISP_EXP_MEASURING_MODE_0) {
+		/* Coefficients for a BT.601 BAYER (from datasheet). */
+		write(priv, mod->base + EXM_COEFF_R_REG, 38);
+		write(priv, mod->base + EXM_COEFF_G_GR_REG, 75);
+		write(priv, mod->base + EXM_COEFF_B_REG, 15);
+		write(priv, mod->base + EXM_COEFF_GB_REG, 75);
+	} else {
+		/* Y = (R + Gr + B + Gb) / 4*/
+		write(priv, mod->base + EXM_COEFF_R_REG, 128);
+		write(priv, mod->base + EXM_COEFF_G_GR_REG, 128);
+		write(priv, mod->base + EXM_COEFF_B_REG, 128);
+		write(priv, mod->base + EXM_COEFF_GB_REG, 128);
+	}
+
+	/*
+	 * Adjust and set measurement window to hardware limitations,
+	 * - Offsets must be even.
+	 * - Width and height must be divisible by 10.
+	 */
+	h_offs = arg->meas_window.h_offs & 0x1ffe;
+	v_offs = arg->meas_window.v_offs & 0x1ffe;
+	h_size = (arg->meas_window.h_size - 1) - ((arg->meas_window.h_size - 1) % 10);
+	v_size = (arg->meas_window.v_size - 1) - ((arg->meas_window.v_size - 1) % 10);
+
+	write(priv, mod->base + EXM_H_OFFS_REG, h_offs);
+	write(priv, mod->base + EXM_V_OFFS_REG, v_offs);
+	write(priv, mod->base + EXM_H_SIZE_REG, h_size / 5);
+	write(priv, mod->base + EXM_V_SIZE_REG, v_size / 5);
+
+	/* Set last measurement line for ready interrupt. */
+	write(priv, mod->base + EXM_LAST_MEAS_LINE_REG, v_offs + v_size + 1);
+
+	write(priv, mod->base + EXM_START_REG, 1);
+
+	return 0;
+}
+
+static int rppx1_exm_stats_rkisp1(struct rpp_module *mod,
+				  struct rkisp1_cif_isp_stat *stats)
+{
+	u8 *meas = &stats->ae.exp_mean[0];
+	/*
+	 * The RkISP mean stats are 8-bit while the RPP can be 8 or 20 bit.
+	 * Figure out how much we need to adjust the output parameters.
+	 */
+	const unsigned int shift = mod->info.exm.resultbits - 8;
+
+	for (unsigned int i = 0; i < EXM_MEAN_REG_NUM; i++)
+		meas[i] = rpp_module_read(mod, EXM_MEAN_REG(i)) >> shift;
+
+	return 0;
+}
+
 const struct rpp_module_ops rppx1_exm_ops = {
 	.probe = rppx1_exm_probe,
+	.param_rkisp1 = rppx1_exm_param_rkisp1,
+	.stats_rkisp1 = rppx1_exm_stats_rkisp1,
 };
-- 
2.53.0


