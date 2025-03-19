Return-Path: <linux-media+bounces-28477-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF38A68BBC
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 12:35:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C84F716F5BB
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 11:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E6E2571CE;
	Wed, 19 Mar 2025 11:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CymARwjw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70372256C7C;
	Wed, 19 Mar 2025 11:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742383718; cv=none; b=KH4DJxV2GA3y9gvmpIXTQBPqI0Q6v9p3n3VYLI3kLHra0XkStxU+2EznP1V0AnBxhtDzxXFwU6rryUn8b2KemJ9S1p7qfMAsjEMcqLMxuiwkx4JDagLYqVrA3w8G+5t79XpldVd6LFV7RiAuPLmLbNUtucUrlaqmelG0HKqCpr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742383718; c=relaxed/simple;
	bh=L3EHJlduO8HxIoJ1jIlrPRmfWgrTM/fRI/20nH4RFRs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tV2b9In2MoiXdj4k+2StBEkNAH/MHlMFIf2j5C/cVQzkWGxUUicOOiTxqF/3Hx2RbfwfCrk8ESeVnLDH9L+5BQCOOWl/9gZaY9dRTHAH5ZAlXpxI1nortB/o2fV9BN+fdA4cAz0JCvN019NHp57pv7P3EwQ0Qep07bGsp+BQJFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CymARwjw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C53AB193E;
	Wed, 19 Mar 2025 12:26:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742383605;
	bh=L3EHJlduO8HxIoJ1jIlrPRmfWgrTM/fRI/20nH4RFRs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CymARwjwwAWYMJIbdJ3xj0Z5mNAvK5Zr5A0b//o8K6D5+YqQB1E6apEproHUKZ6DL
	 FnKvKkBieWsJQ/Rpfene8ogRkFIpACboP0KQASMRkiVhF/ZelfRcXp9niJElLdypWV
	 /ZMEcFkFJaxUtCbcWX5cSV3RlgnEqaKyYpKrf8fY=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Wed, 19 Mar 2025 12:28:19 +0100
Subject: [PATCH v5 6/7] media: vsp1: rwpf: Support operations with IIF
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250319-v4h-iif-v5-6-0a10456d792c@ideasonboard.com>
References: <20250319-v4h-iif-v5-0-0a10456d792c@ideasonboard.com>
In-Reply-To: <20250319-v4h-iif-v5-0-0a10456d792c@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBn2qpXyt6GiW4JWRCYubtQPAdzB98xODrMrdAhz
 1x5N5LVcEiJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ9qqVwAKCRByNAaPFqFW
 PG1gD/0ZFGbazDBQSVMJu0hzR0mUM9zl2IRFzvWlQqusxuwN0VTbCEByrTgxk1Lyj8c7RO7oAE0
 1W6FMSbFxVTIKkOwjOYvgtTyD6hApVgzUe4jthxPvPfiBb+oLRpIXcGFsn7+7GfBi1gVBwOR/lb
 ZJ7wKwi+9nEqHcvl8vp7M3jLLxJd7KuOlQNW44aTToWuqmowPcINBODFkb2YAefwNA2U8OP8PRX
 Hu/fGNQ6xKKni9tCvXhSIgas0WsVdR/wezV8zSNPmNeVfJKTlCMw0tcL0d/7WilyGkXsWYMPQdF
 tRjBzt+TGc4XVltny2OE4qzTRdIbIDq93H0xh1pHMOcKBR0Yyj0hK+LS4yXxN+ZTo8kA9prhQTE
 LGY5unbKZZayFWSMyTh2X0Iow/rR2GZm6kQlHn0Zec83NahMWPXlxn3wA3SjzArjHNvdj2Tq0o2
 OYyfTy/anKCDYHq1v+Cigy5cvlNuZbQdzK8fFpy43nx6iKOeykhTBeA/m8pa1qaKe0gi2wGLau/
 NduHHKVVlciRzczb4xNAArE5ygn+NrvoFt1ZJGzquIMfqSmdLxghOmro9Q/1mpzsIYtj8ox5KFR
 yjE2SFePAytnhXGzWQrr9YtIfO5mLsnUltqQMJwtWonbiZMxeQzR1lXE0gLNX3inGUa3rFxRAwy
 jFpEdtIAqI7yQxQ==
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


