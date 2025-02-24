Return-Path: <linux-media+bounces-26875-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43912A42D9C
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 21:21:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A03A33B2609
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 20:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE90266B4C;
	Mon, 24 Feb 2025 20:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bmWbPwxQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1067B266196;
	Mon, 24 Feb 2025 20:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740428411; cv=none; b=p7UYe2EWLWy24W+bKPOFk6y3pS0/FGE/edmBt2vYiIvdycxsqWoTq7jdfZwlu7i0MeNZJuVYMMe7mQWl1ys2oRZz8x+HwdnvbWWpH9JMOEml9wTtHKbU/HQ8Tk995yuQxjhWjKJd+VNBeOQJ/UAqmpq9gEpSCez+B91VucexYzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740428411; c=relaxed/simple;
	bh=WiLiBj0SJRFxfxK31XdalHPJfovGc7Rsw7QaWrP0nVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oLsGtVaxpwvOuOVseSQ2pkmMexU4T0qnvHhgJzZ5ydK6yGSNzWgpZrIkEPwvbZsgRS/2jE+a4JDORFKAqIcPPrVJuNouVsPNCxbsLs0zMVCPn2dgvi7IXFPlPhNVAVC+d4dHDt3X9uEUXD8H4HCv5t5+Q5TAUhMTjoam6jQgjOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bmWbPwxQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.103] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 20780E62;
	Mon, 24 Feb 2025 21:18:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740428314;
	bh=WiLiBj0SJRFxfxK31XdalHPJfovGc7Rsw7QaWrP0nVU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bmWbPwxQHixWMcoOldCF4PIntnRHDcoVoHtEqZBqdN8XLcWZgjfnaHN5XSI73YuqO
	 dg2A1feTHBzacGUlrO1XFKR+y6NhRd7atOFeETWmcqczIuY4XEmRZpZb8syYfPLxAu
	 +GfzFDNnkDAiQ64/iiwkkQKxb4nAm1BdT4UKO1pY=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Mon, 24 Feb 2025 21:19:46 +0100
Subject: [PATCH v2 6/6] media: vsp1: rwpf: Support operations with IIF
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-v4h-iif-v2-6-0305e3c1fe2d@ideasonboard.com>
References: <20250224-v4h-iif-v2-0-0305e3c1fe2d@ideasonboard.com>
In-Reply-To: <20250224-v4h-iif-v2-0-0305e3c1fe2d@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=4208;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=WiLiBj0SJRFxfxK31XdalHPJfovGc7Rsw7QaWrP0nVU=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnvNRsit80a6Z3tyW/pK842HRUMRIMrv3YdA6vJ
 quy39XlfIeJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ7zUbAAKCRByNAaPFqFW
 PLorD/49Lh2mL+vg/uPNKWD/OcVw/XdyZfm2bG5clJDF1yVfzWUeH8Fif5OVEOsuznC3Fit3tfo
 5vidnyF/8ufolJInIj6aZSoQ5f32tXLjeGqJzZwyoWDj9G0r77xb2ntj+fxtijsTsrW7bOf8z1z
 FM76ALLboU7EPobWE93jD1l7rVC8FaoRmcI5dVAR0qbi2OtIeM0HzKNHuwcaiCTiA7i+ItHwlhM
 fXAoPs5DbrKJGrKp001wKyxiGHPVKZ6SJWEsHozSSsJXu0O9yn9EIP8xRFPh0dvkVlB6Rbtw6J/
 T+CKzRAuE0iMgHGIVqlN3IGeMm5oNsREq7YRO/IG/P/ue/7nv4FhcMBjJ3Vd/opU5SSsr88Hlc1
 BjWPWKss/fELlMwXpkU3UkLLsmU54dU+dVP9Mykm9r/UDb5ujq/GxO3+p0wnfUrazDByJa1fByA
 t6AaM4aaGFhO4r72tiYbv79gQRSEHu8wcQ4hQ/dt1J2atxbGlXclaeJvOg5pPGU+UdZFql0W6wW
 YKTkSEdsVjQbaUC0wG3zyvlU9YeFAgBVd8u5Bc47/9GEPZZJGnQFBCh93NXHU/gf6NP3nO8aAOr
 +YeOzSwVu8MyKfiEnWCh4Vj+Kx6sk5c27HyWCEdDI50oD4M7y7NO9d92WY+oLeYmsOeBPYFHj+O
 LDB20kPNd2l6kbg==
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
 drivers/media/platform/renesas/vsp1/vsp1_rpf.c | 11 +++++++++--
 drivers/media/platform/renesas/vsp1/vsp1_wpf.c | 14 ++++++++++----
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
index e10ed836153633c4fe27224d0df39c77d4c8ab89..dae94129a105a646917353dba0181f9c93327132 100644
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
@@ -174,6 +174,13 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
 		       (left << VI6_RPF_LOC_HCOORD_SHIFT) |
 		       (top << VI6_RPF_LOC_VCOORD_SHIFT));
 
+	/* No further configuration for VSPX. */
+	if (pipe->iif) {
+		/* VSPX wants alpha_sel to be set to 0. */
+		vsp1_rpf_write(rpf, dlb, VI6_RPF_ALPH_SEL, 0);
+		return;
+	}
+
 	/*
 	 * On Gen2 use the alpha channel (extended to 8 bits) when available or
 	 * a fixed alpha value set through the V4L2_CID_ALPHA_COMPONENT control
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
index f176750ccd9847fdb8d51f7f51a6bd5092b70197..88db60596f0f2f459eddbbc2ea7247620d675dd8 100644
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


