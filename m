Return-Path: <linux-media+bounces-28578-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CBEA6BE88
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 16:47:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D68077A8213
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 15:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45EBD22D78D;
	Fri, 21 Mar 2025 15:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kjU0CHRr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F25D1E571B;
	Fri, 21 Mar 2025 15:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742571955; cv=none; b=nm4Ch5jXGyPynmSLEE2VGuIb1bjwXE3jlJpZoU6QI78MBdkGOgkvRnK7RJdFPVzjJRZgTMhEaaLvK/y4osKZvIeDdq9Zvx9WDZldCKcTjtED/1n8JYtjV0nIo2tcBV4XpEk7Tdw+CPByWWWqR9oGY0WNSNzVB0CNdxObcd0s4j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742571955; c=relaxed/simple;
	bh=GkhQrc7huofYtRfwb1FCBYsdda+2vEItebsLYKisRQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PqJ5ikPpPyahc4/SEz0wzZo06ZecXv8QHK/cmbj60nSJcPiqBsSqmrJ89OgqjKFMiVaPTNAjrqzhhfGPUzgXAXXjLTupjaJvOmZCGi4Brtj6/oGhRQE8QZ+MuXt6+gfDA4tEFXomE58r+3L7mvv5kzLxMu2/QmjdHik2pjQxa8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kjU0CHRr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.109] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 126B215CA;
	Fri, 21 Mar 2025 16:44:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742571841;
	bh=GkhQrc7huofYtRfwb1FCBYsdda+2vEItebsLYKisRQI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kjU0CHRrNmsVFHsC85slhUpm+Uwrq8mFyMXVc0yHhdDHqisSvR/lSmO81A4vBH0EC
	 /puxSnAYKwJQaBZD4aE3+Z/Zocpqg/ylHHx8++xR+mgNxLP7RfgMYGiHzTqoe/D2ne
	 bSQ0/HiAdSuZzVLr1L8xDNhbtcmSQ24tRk6Mn3fQ=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Fri, 21 Mar 2025 16:45:38 +0100
Subject: [PATCH v6 6/7] media: vsp1: rwpf: Support operations with IIF
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250321-v4h-iif-v6-6-361e9043026a@ideasonboard.com>
References: <20250321-v4h-iif-v6-0-361e9043026a@ideasonboard.com>
In-Reply-To: <20250321-v4h-iif-v6-0-361e9043026a@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3903;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=GkhQrc7huofYtRfwb1FCBYsdda+2vEItebsLYKisRQI=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBn3YmlaNTlX3P5JhA/hv8xEiyzaXYJxxE4dq3nA
 k5FW0Q50rmJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ92JpQAKCRByNAaPFqFW
 PEH5D/0V047oXoig8ufJwD8aUWg4YKVsL7K+bt0kmktFwGvXD4ByFD7VcXwRWnULfCd5AwMkBmv
 ZhIBVtHBakM1kGXO3MkRmlEwk67KBaF0JH5X6Ck4M/wDLkwuMeMb7Fx4i9s6Y5lZTLh1CJy3+bt
 qow1hSHjHpXTFNY9QlC5vrNiNBevgqu2GWkbRfj/SGvBsdevhQAL1qml/V5mBat+wdysro4Bn6E
 AZn3Iw1VeDLRmSShIgiifGgkqL0kgjCRL7yeda1mqmqgSZiP8KbQ1xJt71UKVpORsNb6SuXMBhp
 B/J71y9rjj9yj7fN1/ZBN6NMcpJ6I/rKo9akChLNvUUVUANhtRJOqOD9Y6E+zKF4fYz6tnOVr90
 lLHvNrbw+g9Jtu/XF8f/tM2mYuePohNNumHsUu9+qlUlBGtBkvoS9iadjz+fWPXxeHYU8/Qb3k+
 tzsaJ5boBxzNaZUSMROv3van9FFXUg4toYaHw31HFI66R6oEUP8qv3HV3ONbdLxDQuK7NsSxM62
 Azc5LEGN1opDE2kka3OJN5PMkstk38jkxdjItHl9M1i22YJTGJ0qTG7MidDIQVQovjCmLZc1r+j
 DQ2evOgNy87f40lZheyOEzZ0uTPQYa8mlHkFVYozT3MCAOAxRqH+ChDvsdIPY4VQ2RiOKhhWBAO
 4oLKgZWQ6K5B6JQ==
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
 drivers/media/platform/renesas/vsp1/vsp1_rpf.c |  9 ++++++++-
 drivers/media/platform/renesas/vsp1/vsp1_wpf.c | 14 ++++++++++----
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
index 056491286577..6f6cf70e267b 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
@@ -84,7 +84,7 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
 	sink_format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
 	source_format = v4l2_subdev_state_get_format(state, RWPF_PAD_SOURCE);
 
-	infmt = VI6_RPF_INFMT_CIPM
+	infmt = (pipe->iif ? 0 : VI6_RPF_INFMT_CIPM)
 	      | (fmtinfo->hwfmt << VI6_RPF_INFMT_RDFMT_SHIFT);
 
 	if (fmtinfo->swap_yc)
@@ -98,6 +98,13 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
 	vsp1_rpf_write(rpf, dlb, VI6_RPF_INFMT, infmt);
 	vsp1_rpf_write(rpf, dlb, VI6_RPF_DSWAP, fmtinfo->swap);
 
+	/* No further configuration for VSPX. */
+	if (pipe->iif) {
+		/* VSPX wants alpha_sel to be set to 0. */
+		vsp1_rpf_write(rpf, dlb, VI6_RPF_ALPH_SEL, 0);
+		return;
+	}
+
 	if (entity->vsp1->info->gen == 4) {
 		u32 ext_infmt0;
 		u32 ext_infmt1;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
index a32e4b3527db..fafef9eeb3f8 100644
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


