Return-Path: <linux-media+bounces-29159-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 578F4A77DA6
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 16:26:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5828D3B004F
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 14:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19186205AA3;
	Tue,  1 Apr 2025 14:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uNlBfJIR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3D62054E3;
	Tue,  1 Apr 2025 14:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743517349; cv=none; b=ihRe3rYc24lCcK6PMEJ66f06YvN70JJfV75p6iGJmlqYSl4CwNJhQmk8zfz+vTRgORYB6Ndg6Lez2vtsxw0WQH2fH2yk7vi7hQQkl3OwDNaQhEn4yfkz2/2gs5cIKmQrpm/rxO0vsoGW1Mi5kZuHRHWGUPFWxi+esP2Ks21HDaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743517349; c=relaxed/simple;
	bh=VhLM4DyuRzvKvc9f1kvjAYAy9ejfT41I2V5SqFuVF+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RPCVAMo95zrPHmRVXhXruODtM4/WEKoBLvpyy/cBoGRtI0vlXDYc0Clnws14Cz8McmhRfv7WSMIzu4sKEs40IOUosRtX9lT4UHgRoOQLsxzbh+/Nqg+hI+20KywdcIPZ4AU75Fzi82abk3rHTyWMbnUaC6izRTJ1+xG/qeBrWd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uNlBfJIR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.101] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 999C41AD5;
	Tue,  1 Apr 2025 16:20:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743517221;
	bh=VhLM4DyuRzvKvc9f1kvjAYAy9ejfT41I2V5SqFuVF+w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uNlBfJIReYjW1O87P7BnzkWHEzrTi0TJid9S7gZTPFK2XEoiYowhhi663F9m5a+v2
	 YTRvT1OOHXwhdffwkrHaRKNk0zhvbhzg62VFA0EAiSdhr6Omaeld5DncUVpKt91FrO
	 9b9f+AVCLXP3EGXCkGUjn9Mcf2JdadxsXMgnpPDE=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Tue, 01 Apr 2025 16:22:04 +0200
Subject: [PATCH v7 4/5] media: vsp1: rwpf: Support operations with IIF
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250401-v4h-iif-v7-4-cc547c0bddd5@ideasonboard.com>
References: <20250401-v4h-iif-v7-0-cc547c0bddd5@ideasonboard.com>
In-Reply-To: <20250401-v4h-iif-v7-0-cc547c0bddd5@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4402;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=VhLM4DyuRzvKvc9f1kvjAYAy9ejfT41I2V5SqFuVF+w=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBn6/aRzjQpHbAAdngOHeu1+XU9efaJq71Kyt6Oc
 MfcNdGUYF6JAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ+v2kQAKCRByNAaPFqFW
 PDH4D/4iMEGUSbxdArXQ0anFk0XcuMVHRMFYkD1PByj/Ul7qVTdKFODgi6TTTwJIm2n7ESW4Iji
 KsxdiWAx+uiQ9iBPgakl5Wf7+SV6++DUvdADOms1xiSlmQNQ6lf6p38ooJ97IhzmidJ1vcxjsj9
 HfFW4eZRUNGeo8Nu/cT7m9XBOM7rqAvxDvUDj4rYRuTyxsHu+KGcsT5PR/6jfEl4i7MF2I3UPkJ
 A2XTpxaKHqOXfFkzp9rCqitzqb+psqlBXtmg9Xyv19YB07zwriuutyZgZHGADmzRU91DHFT+Cen
 S5KcsOWGUTdDAtkzyxrsOqTOwPhOkyR5+9OdwFyTYaYbLKEL863mWoT4j+J7rqe1AUOsest9yax
 FDvTDEvmezOeOR6YlkKw5NebL197eTOU0JmnsRtgivbIeoZ1G8TtcLUdihvKUe7SEapBiUlsNmw
 H34RjN9apL7qCR0Ba2bAGSVdRoAglWG9iolWAXEweHVXRlVIcHkm1UESfMrS5xU8Tgdo0Ag0+T0
 VyIiKo3QV5TmpgmVcOUxeCCMVLhh1LI5n53CuQfR6au9j1QJGbiJPgkQHqoSJDPNKLKi4yltopQ
 /W/3fDsWg5So6B42fRDRp02B7N52qfo6gF3Yxy9rpYx8ZwXy6bEck2xFAx2CJ9jSw4hnyvDTBQM
 aCZWljs8JUgRa3w==
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
 drivers/media/platform/renesas/vsp1/vsp1_iif.h |  3 +++
 drivers/media/platform/renesas/vsp1/vsp1_rpf.c |  9 ++++++++-
 drivers/media/platform/renesas/vsp1/vsp1_wpf.c | 14 ++++++++++----
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_iif.h b/drivers/media/platform/renesas/vsp1/vsp1_iif.h
index 165996a822c1..46f327851c35 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_iif.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_iif.h
@@ -12,6 +12,9 @@
 
 #include "vsp1_entity.h"
 
+#define VSPX_IIF_SINK_PAD_IMG		0
+#define VSPX_IIF_SINK_PAD_CONFIG	2
+
 struct vsp1_iif {
 	struct vsp1_entity entity;
 };
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
index 5c8b3ba1bd3c..5e84536f0cdd 100644
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
index da651a882bbb..f3ea3b17e4cb 100644
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


