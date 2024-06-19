Return-Path: <linux-media+bounces-13635-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E288A90E0A4
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 02:18:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B49E1F22F47
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 00:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF13AD53;
	Wed, 19 Jun 2024 00:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZvWCawUQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C871B1103;
	Wed, 19 Jun 2024 00:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718756290; cv=none; b=MgFrq/rM0FeVhGJ/LHLuVgzK2keEJcYVJgP57ioxOcYd/WjWqWZPzezBpmtPq2EghRaeV6c0ogEJCQnGJnrQUvdTCS5dl3THWfPltb5ZCqvMVH0LQZ4J5RD/lH85p9hHldZZdcwTy65xFMbB6HnDRlxkU4bwno1pkoafDAuLCH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718756290; c=relaxed/simple;
	bh=hjUgfJNl+xrONb0lQSQ8jeu/u/wKTbxupGRxsU42v6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=puoxxfxS4u12hnUPeLyVYXc7G1FDJVuHVmxyWdO+TLmT1SSOwUTbY2lU5hXH6nleEVjG3xjDzQN37F09KCwZpnbRRTgBTvduDSiA7cEpHEyc3bSKoiZlSQVJNAgqO7FnH8WIIvS5rsOHDLLkpel1/NdFByiPUsiVpn0cN7CpVO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZvWCawUQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95EDEE39;
	Wed, 19 Jun 2024 02:17:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718756264;
	bh=hjUgfJNl+xrONb0lQSQ8jeu/u/wKTbxupGRxsU42v6c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZvWCawUQQEwXSgfQ1d6i+JZCbffHNtMhCaGgSbG5rcxgkBFF7ItAuaIcsS8Uz/17t
	 72S+4agOVE3meb6yZMAQ26mdLWyrn8oBOJbk/1UArp+TAzc87NA4O9scEJZJo3zLq/
	 7dP9EtBBue7d9f+5+16XitQwvyt9WhcBIWfQwTmE=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 13/19] media: renesas: vsp1: Compute partitions for DRM pipelines
Date: Wed, 19 Jun 2024 03:17:16 +0300
Message-ID: <20240619001722.9749-14-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240619001722.9749-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240619001722.9749-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DRM pipelines don't partition frames, as the hardware operates
synchronously with the display. The entity operations access
configuration data from the entity state in that case, instead of
accessing the partition structure. This requires special cases in
entity-specific code, increasing the driver complexity.

To prepare for simplifying the code, initialize a single partition for
the DRM pipelines, similarly to how video pipelines create one partition
spanning the full image when partitioning isn't needed. The partition is
allocated statically in the vsp1_drm_pipeline structure instead of
dynamically as for video pipelines, as DRM pipelines are guaranteed to
operate on a single partition.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_drm.c | 9 ++++++++-
 drivers/media/platform/renesas/vsp1/vsp1_drm.h | 2 ++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
index e44359b661b6..11313e26a298 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
@@ -550,6 +550,9 @@ static void vsp1_du_pipeline_configure(struct vsp1_pipeline *pipe)
 	struct vsp1_dl_body *dlb;
 	unsigned int dl_flags = 0;
 
+	vsp1_pipeline_calculate_partition(pipe, &pipe->part_table[0],
+					  drm_pipe->width, 0);
+
 	if (drm_pipe->force_brx_release)
 		dl_flags |= VSP1_DL_FRAME_END_INTERNAL;
 	if (pipe->output->writeback)
@@ -573,7 +576,8 @@ static void vsp1_du_pipeline_configure(struct vsp1_pipeline *pipe)
 		vsp1_entity_route_setup(entity, pipe, dlb);
 		vsp1_entity_configure_stream(entity, pipe, dl, dlb);
 		vsp1_entity_configure_frame(entity, pipe, dl, dlb);
-		vsp1_entity_configure_partition(entity, pipe, NULL, dl, dlb);
+		vsp1_entity_configure_partition(entity, pipe,
+						&pipe->part_table[0], dl, dlb);
 	}
 
 	vsp1_dl_list_commit(dl, dl_flags);
@@ -968,6 +972,9 @@ int vsp1_drm_init(struct vsp1_device *vsp1)
 
 		vsp1_pipeline_init(pipe);
 
+		pipe->partitions = 1;
+		pipe->part_table = &drm_pipe->partition;
+
 		pipe->frame_end = vsp1_du_pipeline_frame_end;
 
 		/*
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.h b/drivers/media/platform/renesas/vsp1/vsp1_drm.h
index ab8b7e3161a2..3fd95b53f27e 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.h
@@ -20,6 +20,7 @@
 /**
  * struct vsp1_drm_pipeline - State for the API exposed to the DRM driver
  * @pipe: the VSP1 pipeline used for display
+ * @partition: the pre-calculated partition used by the pipeline
  * @width: output display width
  * @height: output display height
  * @force_brx_release: when set, release the BRx during the next reconfiguration
@@ -31,6 +32,7 @@
  */
 struct vsp1_drm_pipeline {
 	struct vsp1_pipeline pipe;
+	struct vsp1_partition partition;
 
 	unsigned int width;
 	unsigned int height;
-- 
Regards,

Laurent Pinchart


