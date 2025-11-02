Return-Path: <linux-media+bounces-46159-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CF3C298DB
	for <lists+linux-media@lfdr.de>; Sun, 02 Nov 2025 23:58:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1ACC334735F
	for <lists+linux-media@lfdr.de>; Sun,  2 Nov 2025 22:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D75A4258EDF;
	Sun,  2 Nov 2025 22:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="TUuMrUcc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="xrtpsTDo"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CE624E01D;
	Sun,  2 Nov 2025 22:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762124238; cv=none; b=uBeK6qGOamQV8sxgsKXCuZdbVcyNfOp+jBUYyVqJxrU6guZ1UQq9ryPFaXZOTSNXcyJEMmyefE5i2+d+Rah8MiDSqtIIjQNCVaTB/0Fy8ZWQ/gSrpgenU1EJ/3PTGedu+ay/Xd+n3HvbfKpeOXyG2jgi008rwGhk5I8GfHe3Is4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762124238; c=relaxed/simple;
	bh=cLLp3MmYGBZEcUQcRB1mKstcCxJ0Umlx2c1Qr/uKoyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XM/YIb3zd3pcIbmXuHCFo0NRwZcaMfXWuZWc36O9pvCZiPMjDvM2Uy5zW7OdVwnpijNfc4eyOPVpgfC2P+EGesSJBTUdIkYSZ9/0++c+QEPgr+sxkJ9Y0FAG5HcRiLWVyoBhmMBuPGIqqC65++tSYIXw7wShKGgXfIOMHh0hkjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=TUuMrUcc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=xrtpsTDo; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 680E3EC01E0;
	Sun,  2 Nov 2025 17:57:15 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Sun, 02 Nov 2025 17:57:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762124235;
	 x=1762210635; bh=vu0gcyAUhixLGfmyTLosiAYfO8xmvx0jlVdytnkWFUc=; b=
	TUuMrUccUtWhhzMV4cmYRb7ZYZGNlNqqFKLaRABe9sbfj1OwyO85t2xu3W3sZ2k2
	0VqsVL77AzNzFDexNVLVvD2/6JXqv7yUEfu36ivezJv+VjnUJnNwdnnuGimqyGJ/
	aF7gqgs56Lg8ovrusnRFmIuC9vhamDgJhcB+/q63dtiAEPMb9e4b8F/xu8osb1xn
	9cz3N0WF85OkY5EF/MSm3lJ/F5EdAOK4HU7DkvXu7PNm9RKdpl3/bvuj+cFAtcby
	xWIxhYJkyPRlXuHNuspPkJZz11SKqI9IGuNuE3f22o1SVHh+HLaulvk9Ls3+W0JG
	RdFySjFAi/ACn/9Op2HiIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762124235; x=
	1762210635; bh=vu0gcyAUhixLGfmyTLosiAYfO8xmvx0jlVdytnkWFUc=; b=x
	rtpsTDo3iRsOXGCERQqx/6AFvgG4JJFv21fMViaBhrgxOH0oo26fJJm1WnsA3lg8
	X9O/U08KdxMrwGMYeqbzw0z3flc3xqhACjZS+jP+VryJdzWbdpmyTaCWDLahYupO
	OIHZsIX0MgbzhE542l7IUlKW+S6JOStOZOF4vAbUJxbQgvv1piKw5kr6yGdIUWim
	nyemV+9aGTnSJxjk25e4OP3i80y9VehzX/C8cA2KMO1Twpi4QHOaNtIVTRZ/CNSJ
	4M674TDH87Fir7/EEAE0/Xxx+vXudjeOqEKfPYdHmgIiK9I/FTgeH5apyvUSBNIR
	Ic5tV0jI9nWaC5EC+l12A==
X-ME-Sender: <xms:y-EHaQVmW72lI2BOIyQp4nVxTmi6iolla0dWlKRwGedv0eXRlrlhqA>
    <xme:y-EHaepNfHIhocwEE_esn0Xzqjs3EMXhPRwmtyK83jDVTyGJZVlT-ZOI0Zo9SGOq6
    FSblaAHd9qKfHXjFvMTjEMEakFkSG57h5pAOVNUFBu0GvX8j3-wkQ>
X-ME-Received: <xmr:y-EHaUTEf6C_C2ONnaA0mwRLRCOadUZbmbMvNoEbrOsKLNtE8w05-oL92_MGGi5Qk2Z4iKV75gp2s81nCIOfqwPw>
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
X-ME-Proxy: <xmx:y-EHaQ2k1JW3kkxzFuvI8k8ERW3-Gaf0LvAxOQ2Lz9bib0gRNIby5A>
    <xmx:y-EHaYBFduxIoM6kpjyBdJgbiidLBqmNhT7GNLV0mYTXjtl2R0_UAg>
    <xmx:y-EHaUi1tXdzsljat3OVyUinvEq7cKC-0guWYuntaodrFiq4UGrFOQ>
    <xmx:y-EHaSNu2--dsKyrWzu5oDTHZWAImcAo5fJinzeO3TbY5dENc7C8EA>
    <xmx:y-EHadBxvX9tDRx6V4X3ooXfbHWgmWyc4jlCkH0x6UGyENeuAywX0_Fp>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Nov 2025 17:57:14 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 05/12] media: rppx1: Add support for Auto Exposure Measurement
Date: Sun,  2 Nov 2025 23:56:35 +0100
Message-ID: <20251102225642.3125325-6-niklas.soderlund+renesas@ragnatech.se>
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

Extend the RPPX1 driver to allow setting the EXM configuration using the
RkISP1 parameter buffer format. It uses the RPPX1 framework for
parameters and its writer abstraction to allow the user to control how
(and when) configuration is applied to the RPPX1.

As the RkISP1 parameters buffer have lower precision then the RPPX1
hardware the values needs to be scaled. The behavior matches the RkISP1
hardware.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/dreamchip/rppx1/rpp_params.c     |  3 +
 .../platform/dreamchip/rppx1/rpp_stats.c      |  4 +
 .../platform/dreamchip/rppx1/rppx1_exm.c      | 89 +++++++++++++++++++
 3 files changed, 96 insertions(+)

diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
index a561c01bda9a..bff525970478 100644
--- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
+++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
@@ -30,6 +30,9 @@ int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
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
2.51.1


