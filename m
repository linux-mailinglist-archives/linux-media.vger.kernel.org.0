Return-Path: <linux-media+bounces-28360-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 505EEA64D90
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 12:59:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA3A0189691E
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 11:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA1A23E344;
	Mon, 17 Mar 2025 11:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kjn6/7JB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A9E23C8CB;
	Mon, 17 Mar 2025 11:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742212667; cv=none; b=DJTgWe4Wglr3CQfCwzcaTjssGAN6CAKt3T8EJXHG3UuorkYW+6+6DVLU4S7xkR2KqcJ0QOdm3zVfF1wsbX2sdYjCiTxz5CETd+EGXkg0Q6b1Xg3usUh0XfreO+qqrSZWOj8CWgBlLJ4T19Cz3qEDEvZ8DX48uHVMe3w0fPPvWjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742212667; c=relaxed/simple;
	bh=L3EHJlduO8HxIoJ1jIlrPRmfWgrTM/fRI/20nH4RFRs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ot11VZxAbohAXOIdYfUakpRu8tb6uVrrK1aA3Kw3zF6s8bqqyhbmbdW4U7UuqHb/SbySi9v1WElXGbeCDsD4KTAcRi1f9m+PesZCSo7JkNBcHmFaeS/gn974Gv3CF1ULygH6QNBfQL5g5qnAGKfbMrkoaGct1yOz7GskZFrJJaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kjn6/7JB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 08309193B;
	Mon, 17 Mar 2025 12:55:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742212549;
	bh=L3EHJlduO8HxIoJ1jIlrPRmfWgrTM/fRI/20nH4RFRs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kjn6/7JBMNxmOVAxv00ALnZrrds3KTld4Dn12Kbc1l1UpMlz2CKRfekW8DL/zTiEN
	 s9QQcDdIEGQya/u39rm7h0iTuizNB8Rno7hwACcZ3O3qaZDfSwoIRQ9B+bpWWp/bEE
	 joSZn9uqQpum7qe7mKvW5YN/CpM/xL2Cyy6itozE=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Mon, 17 Mar 2025 12:56:44 +0100
Subject: [PATCH v3 6/7] media: vsp1: rwpf: Support operations with IIF
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250317-v4h-iif-v3-6-63aab8982b50@ideasonboard.com>
References: <20250317-v4h-iif-v3-0-63aab8982b50@ideasonboard.com>
In-Reply-To: <20250317-v4h-iif-v3-0-63aab8982b50@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=4350;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=L3EHJlduO8HxIoJ1jIlrPRmfWgrTM/fRI/20nH4RFRs=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBn2A4lk1YJ67TVGoJyyx/LynhHeRFnF1yfnWVv2
 SQ5jxSk1JOJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ9gOJQAKCRByNAaPFqFW
 PKnWEACGzM2dIVMmAfTp4XTh0JiRopsZmf8hui1fEp18wKJqA/ay66zT29GUTAldNF1maEL/ieW
 j827S9XwbIPpUWUNfoc2qDDh7sbZGZN0RhEq/YZEtu2dpgwWjQDlXQ/GpTanmASXh8X/UrE/Zwy
 6gX3jHZC9csXnmK49sGuJgSDU6iWgy4DwZ801Oyuglai3Vt+KbTUelxnqW4Hg/k0VyoSErYQqNA
 kWJQz7Y6y66wwJvu0++coDbYEP/tZuPl8Q2qgWtj1OLvaTW9KtZW4vC+BwkMpmURwCxUAispFJI
 Ntsh81k7RQP2eyZExbWk3Zvvw4J820hl9iMQtAcROnBI03g8yvo7vurhMVxsEXWbEpGRqjJp85A
 sov2qcBoK9gzgN8QiU4DaW2J3XK30Cr1vHHMZaj0AyEG0ifkUso3aDEeuDRHJeYjNhYb0xabl7/
 rDBT+MtVaAzHDMdhVrE2pURdHcKU+ZInFTTL1HqSwAGgYERRhJt2PzMuVUCmCMlbZTB6J5Qc1gY
 qM+bMs1fXN3pMAs9CDgwQJi2BlH2AMnPyE3dAt0y+w8iAGKoRQOb7X3CNIxFwPrZj5SyXgyROR5
 bKLPQ7qnhyWbp73T3EwmwQENEOlaxuMChV9NWT1VzKXNZvI66OI3R1VZ+bq7/F6uW3CheZGFMtU
 3Hy0Cgv2lXYciFQ==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

When the RPF/WPF units are used for ISP interfacing through
the IIF, the set of accessible registers is limited compared to
the regular VSPD operations.

Support ISP interfacing in the rpf and wpf entities by checking if
the pipe features an IIF instance and writing only the relevant
registers.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_rpf.c | 11 +++++++++--
 drivers/media/platform/renesas/vsp1/vsp1_wpf.c | 14 ++++++++++----
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
index 056491286577cc8e9e7a6bd096f1107da6009ea7..4e960fc910c16600b875286c2efec558ebdc1ee7 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
@@ -84,7 +84,7 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
 	sink_format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
 	source_format = v4l2_subdev_state_get_format(state, RWPF_PAD_SOURCE);
 
-	infmt = VI6_RPF_INFMT_CIPM
+	infmt = (pipe->iif ? 0 : VI6_RPF_INFMT_CIPM)
 	      | (fmtinfo->hwfmt << VI6_RPF_INFMT_RDFMT_SHIFT);
 
 	if (fmtinfo->swap_yc)
@@ -98,7 +98,7 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
 	vsp1_rpf_write(rpf, dlb, VI6_RPF_INFMT, infmt);
 	vsp1_rpf_write(rpf, dlb, VI6_RPF_DSWAP, fmtinfo->swap);
 
-	if (entity->vsp1->info->gen == 4) {
+	if (entity->vsp1->info->gen == 4 && !pipe->iif) {
 		u32 ext_infmt0;
 		u32 ext_infmt1;
 		u32 ext_infmt2;
@@ -163,6 +163,13 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
 	if (pipe->interlaced)
 		top /= 2;
 
+	/* No further configuration for VSPX. */
+	if (pipe->iif) {
+		/* VSPX wants alpha_sel to be set to 0. */
+		vsp1_rpf_write(rpf, dlb, VI6_RPF_ALPH_SEL, 0);
+		return;
+	}
+
 	vsp1_rpf_write(rpf, dlb, VI6_RPF_LOC,
 		       (left << VI6_RPF_LOC_HCOORD_SHIFT) |
 		       (top << VI6_RPF_LOC_VCOORD_SHIFT));
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
index a32e4b3527db41e7fac859ad8e13670141c1ef04..fafef9eeb3f898b774287d615bb4a99fed0b4cfe 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
@@ -247,8 +247,11 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
 	sink_format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
 	source_format = v4l2_subdev_state_get_format(state, RWPF_PAD_SOURCE);
 
-	/* Format */
-	if (!pipe->lif || wpf->writeback) {
+	/*
+	 * Format configuration. Skip for IIF (VSPX) or if the pipe doesn't
+	 * write to memory.
+	 */
+	if (!pipe->iif && (!pipe->lif || wpf->writeback)) {
 		const struct v4l2_pix_format_mplane *format = &wpf->format;
 		const struct vsp1_format_info *fmtinfo = wpf->fmtinfo;
 
@@ -291,7 +294,7 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
 	 * Sources. If the pipeline has a single input and BRx is not used,
 	 * configure it as the master layer. Otherwise configure all
 	 * inputs as sub-layers and select the virtual RPF as the master
-	 * layer.
+	 * layer. For VSPX configure the enabled sources as masters.
 	 */
 	for (i = 0; i < vsp1->info->rpf_count; ++i) {
 		struct vsp1_rwpf *input = pipe->inputs[i];
@@ -299,7 +302,7 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
 		if (!input)
 			continue;
 
-		srcrpf |= (!pipe->brx && pipe->num_inputs == 1)
+		srcrpf |= (pipe->iif || (!pipe->brx && pipe->num_inputs == 1))
 			? VI6_WPF_SRCRPF_RPF_ACT_MST(input->entity.index)
 			: VI6_WPF_SRCRPF_RPF_ACT_SUB(input->entity.index);
 	}
@@ -316,6 +319,9 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
 	vsp1_dl_body_write(dlb, VI6_WPF_IRQ_ENB(index),
 			   VI6_WPF_IRQ_ENB_DFEE);
 
+	if (pipe->iif)
+		return;
+
 	/*
 	 * Configure writeback for display pipelines (the wpf writeback flag is
 	 * never set for memory-to-memory pipelines). Start by adding a chained

-- 
2.48.1


