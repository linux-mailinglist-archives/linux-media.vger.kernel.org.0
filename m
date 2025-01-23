Return-Path: <linux-media+bounces-25222-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F07A1A864
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 18:06:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 504FD188D9B3
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 17:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B8A2139D2;
	Thu, 23 Jan 2025 17:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="k1uKMqfB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7676221325E;
	Thu, 23 Jan 2025 17:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737651893; cv=none; b=TiqeE4uQyitghtZO0R60BzGXefBMuka1467FVkvzMQDD/WzO2IToPIDi8QHjQmRE8TfQIZMkW6HzQWD2SdDTw7r2IGe5OHHRmjKYZPXCTuAbdE8ThTtRZ6mVTj1Myh3TVqdrGmqM92jbEhf7iETvyTyOWaZ+XouTxm/lm9+qX5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737651893; c=relaxed/simple;
	bh=6Rhq7m0mfOiA+XjVW/iGea+Z9wS3Y4XZxjZqtEyzltk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bMrRnXL6XZx/1UmYwH1iS+WBvTK4ESzyksI0/gRDdu8KVcvj5hH64XGM0cM32xtfJuc6WbI99BexcQI0uf5HaJLD9JqMvRUlc3w+GJvEJZoJeaMzIlxjKxokKMmjrzuaqP/TSPba6ej12FHOxqR2sH+xXScx/dA2VJuMcUY4wZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=k1uKMqfB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.103] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 88C251A89;
	Thu, 23 Jan 2025 18:03:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737651817;
	bh=6Rhq7m0mfOiA+XjVW/iGea+Z9wS3Y4XZxjZqtEyzltk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=k1uKMqfBdJk2nnt4GKqVDywKE7J+wDs+Zyw4Nd8WET6sG6RDFxkSdPDsVL+B5kV8m
	 8EFZHqd+Ng6mqFALEXXtE4UEY3BNI5nMZzRoz/QpDAAhdnuwqLu0zBAMteJ5FvLbr5
	 yOs2lzJrHnGXJMJOBUNy/J0C3+iKdfZauLyyM6/M=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Thu, 23 Jan 2025 18:04:07 +0100
Subject: [PATCH 6/6] media: vsp1: rwpf: Support operations with IIF
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250123-v4h-iif-v1-6-7b4e5299939f@ideasonboard.com>
References: <20250123-v4h-iif-v1-0-7b4e5299939f@ideasonboard.com>
In-Reply-To: <20250123-v4h-iif-v1-0-7b4e5299939f@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=6705;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=6Rhq7m0mfOiA+XjVW/iGea+Z9wS3Y4XZxjZqtEyzltk=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnknalUroA6hChXqG/NGKlBUKIrOrLeEF6QyE8N
 F42+XtTisiJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ5J2pQAKCRByNAaPFqFW
 POzFD/40oe/xdZVYBI4iVj6jcOsmU/X94M9v7ofF/uYXj//nsFgaID9CXwpNhmbXZ68zsDtapnE
 Y+DjhnX7Y+L2NEQ7MXlHTp+4/RwC89xTlK8lX8qWiskgL6p/94w33MvcLO8uUf1C29jqTSIu6ld
 cVlyzYr+Q2wdUSNNVOjQiwDEh1vEanzf5xe16IOZMH22/uCA2CapRoZQVqHGgrX0ynV3Bv6fINF
 Wrvh7E2FgSRuj/EBRuoHithcrSvP33Ti+KpksGlK8HD2PCRjmVGjAQQerSI977BZwA3Md5qiMtc
 uYyNF9RRuLsG092cHXCLg/N2mW8yEtkJc0x1gG75DEyH7KSe5abZvbZZTWlqF99lZRLzoFFefKM
 EUcN85bt5uKMQVkvFC1iWoyqSj2kK5Jj/wJNefB167hcSVzuZu8Fg9oNLNxUfqXqXG/wdS+Gque
 eDD4xN7trXQq528cs1eALTO+EYLxqbmVoHybDcrh0eKFYfvfFaMKfdk04XoVMTi4C7b/RBBOylj
 eDvCM5NumSWXCOv7+wvwqNLXfK3K8cDFxjHTPIHW81Kx+xhg3fV7SbBjs8vn/1ygRXW9PsLP7v4
 uKzHlTtYj9Q+eadU09JDHHH11HmoxdYvnfU/AwZen+udK/mJbY9u8JcUWQD7GFdyzJcj32XsSJp
 oW7jTShOfgiNi0g==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

When the RPF/WPF units are used for ISP interfacing through
the IIF, the set of accessible registers is limited compared to
the regular VSPD operations.

Support ISP interfacing in the rpf and wpf drivers by checking if
the pipe features an IIF instance and writing only the relevant
registers.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_rpf.c | 66 +++++++++++++++-----------
 drivers/media/platform/renesas/vsp1/vsp1_wpf.c | 18 +++++--
 2 files changed, 53 insertions(+), 31 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
index 5c8b3ba1bd3c2c7b9289f05c9c2578e9717c23ff..e215491a3d962e2ae3c06b7835ca3b7654f04d10 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
@@ -60,6 +60,7 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
 	const struct v4l2_mbus_framefmt *sink_format;
 	unsigned int left = 0;
 	unsigned int top = 0;
+	u32 alpha_sel = 0;
 	u32 pstride;
 	u32 infmt;
 
@@ -84,7 +85,7 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
 	sink_format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
 	source_format = v4l2_subdev_state_get_format(state, RWPF_PAD_SOURCE);
 
-	infmt = VI6_RPF_INFMT_CIPM
+	infmt = (pipe->iif ? 0 : VI6_RPF_INFMT_CIPM)
 	      | (fmtinfo->hwfmt << VI6_RPF_INFMT_RDFMT_SHIFT);
 
 	if (fmtinfo->swap_yc)
@@ -98,7 +99,7 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
 	vsp1_rpf_write(rpf, dlb, VI6_RPF_INFMT, infmt);
 	vsp1_rpf_write(rpf, dlb, VI6_RPF_DSWAP, fmtinfo->swap);
 
-	if (entity->vsp1->info->gen == 4) {
+	if (entity->vsp1->info->gen == 4 && !pipe->iif) {
 		u32 ext_infmt0;
 		u32 ext_infmt1;
 		u32 ext_infmt2;
@@ -150,23 +151,6 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
 		vsp1_rpf_write(rpf, dlb, VI6_RPF_EXT_INFMT2, ext_infmt2);
 	}
 
-	/* Output location. */
-	if (pipe->brx) {
-		const struct v4l2_rect *compose;
-
-		compose = v4l2_subdev_state_get_compose(pipe->brx->state,
-							rpf->brx_input);
-		left = compose->left;
-		top = compose->top;
-	}
-
-	if (pipe->interlaced)
-		top /= 2;
-
-	vsp1_rpf_write(rpf, dlb, VI6_RPF_LOC,
-		       (left << VI6_RPF_LOC_HCOORD_SHIFT) |
-		       (top << VI6_RPF_LOC_VCOORD_SHIFT));
-
 	/*
 	 * On Gen2 use the alpha channel (extended to 8 bits) when available or
 	 * a fixed alpha value set through the V4L2_CID_ALPHA_COMPONENT control
@@ -188,11 +172,35 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
 	 * contains an alpha channel. On Gen2 the global alpha is ignored in
 	 * that case.
 	 *
-	 * In all cases, disable color keying.
+	 * In all the above cases, disable color keying.
+	 *
+	 * VSPX wants alpha_sel to be set to 0.
 	 */
-	vsp1_rpf_write(rpf, dlb, VI6_RPF_ALPH_SEL, VI6_RPF_ALPH_SEL_AEXT_EXT |
-		       (fmtinfo->alpha ? VI6_RPF_ALPH_SEL_ASEL_PACKED
-				       : VI6_RPF_ALPH_SEL_ASEL_FIXED));
+	alpha_sel = pipe->iif ? 0
+			      : VI6_RPF_ALPH_SEL_AEXT_EXT
+				| (fmtinfo->alpha ? VI6_RPF_ALPH_SEL_ASEL_PACKED
+						  : VI6_RPF_ALPH_SEL_ASEL_FIXED);
+	vsp1_rpf_write(rpf, dlb, VI6_RPF_ALPH_SEL, alpha_sel);
+
+	if (pipe->iif)
+		return;
+
+	/* Output location. */
+	if (pipe->brx) {
+		const struct v4l2_rect *compose;
+
+		compose = v4l2_subdev_state_get_compose(pipe->brx->state,
+							rpf->brx_input);
+		left = compose->left;
+		top = compose->top;
+	}
+
+	if (pipe->interlaced)
+		top /= 2;
+	vsp1_rpf_write(rpf, dlb, VI6_RPF_LOC,
+		       (left << VI6_RPF_LOC_HCOORD_SHIFT) |
+		       (top << VI6_RPF_LOC_VCOORD_SHIFT));
+
 
 	if (entity->vsp1->info->gen >= 3) {
 		u32 mult;
@@ -338,11 +346,15 @@ static void rpf_configure_partition(struct vsp1_entity *entity,
 	 */
 	if (pipe->interlaced) {
 		vsp1_rpf_configure_autofld(rpf, dl);
-	} else {
-		vsp1_rpf_write(rpf, dlb, VI6_RPF_SRCM_ADDR_Y, mem.addr[0]);
-		vsp1_rpf_write(rpf, dlb, VI6_RPF_SRCM_ADDR_C0, mem.addr[1]);
-		vsp1_rpf_write(rpf, dlb, VI6_RPF_SRCM_ADDR_C1, mem.addr[2]);
+		return;
 	}
+
+	vsp1_rpf_write(rpf, dlb, VI6_RPF_SRCM_ADDR_Y, mem.addr[0]);
+	if (!mem.addr[1])
+		return;
+
+	vsp1_rpf_write(rpf, dlb, VI6_RPF_SRCM_ADDR_C0, mem.addr[1]);
+	vsp1_rpf_write(rpf, dlb, VI6_RPF_SRCM_ADDR_C1, mem.addr[2]);
 }
 
 static void rpf_partition(struct vsp1_entity *entity,
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
index 93a663f58a5930a3c7c40a96a30888d0b8ccb2ed..736f76389e07a7cc28ba098a0a0bdf350a0794f7 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
@@ -248,8 +248,11 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
 	sink_format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
 	source_format = v4l2_subdev_state_get_format(state, RWPF_PAD_SOURCE);
 
-	/* Format */
-	if (!pipe->lif || wpf->writeback) {
+	/*
+	 * Format configuration. Skip for IIF (VSPX) or if the pipe doesn't have
+	 * an active output.
+	 */
+	if (!pipe->iif && (!pipe->lif || wpf->writeback)) {
 		const struct v4l2_pix_format_mplane *format = &wpf->format;
 		const struct vsp1_format_info *fmtinfo = wpf->fmtinfo;
 
@@ -292,7 +295,7 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
 	 * Sources. If the pipeline has a single input and BRx is not used,
 	 * configure it as the master layer. Otherwise configure all
 	 * inputs as sub-layers and select the virtual RPF as the master
-	 * layer.
+	 * layer. For VSPX configure the enabled sources as masters.
 	 */
 	for (i = 0; i < vsp1->info->rpf_count; ++i) {
 		struct vsp1_rwpf *input = pipe->inputs[i];
@@ -300,7 +303,11 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
 		if (!input)
 			continue;
 
-		srcrpf |= (!pipe->brx && pipe->num_inputs == 1)
+		/* For VSPX we enable and use RPF0 only for now. */
+		if (pipe->iif && i > 0)
+			break;
+
+		srcrpf |= (pipe->iif || (!pipe->brx && pipe->num_inputs == 1))
 			? VI6_WPF_SRCRPF_RPF_ACT_MST(input->entity.index)
 			: VI6_WPF_SRCRPF_RPF_ACT_SUB(input->entity.index);
 	}
@@ -317,6 +324,9 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
 	vsp1_dl_body_write(dlb, VI6_WPF_IRQ_STA(index), 0);
 	vsp1_dl_body_write(dlb, VI6_WPF_IRQ_ENB(index), irqmask);
 
+	if (pipe->iif)
+		return;
+
 	/*
 	 * Configure writeback for display pipelines (the wpf writeback flag is
 	 * never set for memory-to-memory pipelines). Start by adding a chained

-- 
2.47.1


