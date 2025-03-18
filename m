Return-Path: <linux-media+bounces-28413-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 558F3A67294
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 12:25:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 360FD17FA8C
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 11:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37F6620C00C;
	Tue, 18 Mar 2025 11:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VCLq4LxK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB0720C00D;
	Tue, 18 Mar 2025 11:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742296961; cv=none; b=defGKODknky8zeWxwCNGjyUmozVvfmZP48qXFQtIakZcDKyoCl/h/iZEJhSw2iLEis5scWwptpuHIytiDzGrET3ouy8iKjFvaxGky7SAvhZLgZP/S7RyHfejqAxna6zuXixzyFPq2PQ+VXsrZy9EK++N/8xNhF58alV/xHgVtaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742296961; c=relaxed/simple;
	bh=L3EHJlduO8HxIoJ1jIlrPRmfWgrTM/fRI/20nH4RFRs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=glcwcXqYGI9CJVbaqDwU3FSBaAyx7TDOqjsJoErErKyNdSu58Vx3fXH+WU5FxjYkLtm6alqPOmKmavJFqOyUenH3aO0wORi+1cjz5KFpVI3yZgoI7mTQPvXa5y1o8S9pDmOXs86OQG4AEyy2qq0UwrTRJ56Db6PuxiTEBpc5Qu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VCLq4LxK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0DE5D13DE;
	Tue, 18 Mar 2025 12:20:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742296841;
	bh=L3EHJlduO8HxIoJ1jIlrPRmfWgrTM/fRI/20nH4RFRs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VCLq4LxK7x/Y9vNuOJErY0xsksY6T8Pf+aao2koeEi8lD04rKzZMquZjOUemSLwg8
	 Yu2YoaxurgmiWoxdwJKNOLnqJalO+vrKlhiHKgn2KWU4x519XPLXNp8U/AlX0hR5VN
	 D5o6HLSC67kL1jNDpV2ec5ed9Mj8kxnQMqGl9LH4=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Tue, 18 Mar 2025 12:21:25 +0100
Subject: [PATCH v4 6/7] media: vsp1: rwpf: Support operations with IIF
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250318-v4h-iif-v4-6-10ed4c41c195@ideasonboard.com>
References: <20250318-v4h-iif-v4-0-10ed4c41c195@ideasonboard.com>
In-Reply-To: <20250318-v4h-iif-v4-0-10ed4c41c195@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBn2VdqPvF/qBO7/K+n664x3AzTmH5Ue4JwProhY
 xwKirRjxeqJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ9lXagAKCRByNAaPFqFW
 PI0fD/4oZbM/97lwNk5szz+hl9MrDlBQZotUueshwLjJogty2rAQW2aftyOhSV679oS28yBkkEG
 SV6Y7Iiln9//cjcyNkKFJPKHRqXjK/8qNgXbTMX8kLZlO/K6ejeEF5zYQJ/yyA6DndN2q//4+q+
 Uq8O3arP8V7wzIkAXNG+T8Rb5a6vPgUh2pukcHjoigBFwAxaEF8My36wXnwKXBHBp/r2k8h3T2v
 P5KfugganM9gIR1YPm1lcrvlw5KxzEHZOH/d8XgAh2nyZKn5skJe7I7CUOa21qXEP2X1I8qnYil
 mlfo3FuSECbwM0avNkniyXhQZEiiYmwU/6h5Jecj7CVotT4pOfR8E37jWSboOZg4bDy51SrIpRP
 hyOU1ylUd1Ge1RPxCrsZjCXf5N4ZrmwzlMAcTTN2HfzMCxXK6gCCx8e1t1iEVadtpxEpahMqY7U
 x4evkn92UtUFv37/jYCpUkoJ/GYswjLf/2AnhgqfqLI4PtKrDbo9ZdAXYFXzjzBdPqwIIsatNGR
 pDDzjsRA01e0ooGIFJtD06laYdBc9trN/iBc0lYBlDnJtcDqrLrRa4I0xThfWFD4SPiVp5jVcas
 uJtU7gygZ9Cc6vl2HDdSOlW/b8Fqp/zBs41i4gGBFoKRsSEAIvRPlBNHf1AigXTXd5rojuv9Iar
 yP1L/MGtPqNeVjw==
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


