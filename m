Return-Path: <linux-media+bounces-13639-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8914F90E0AE
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 02:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14495B21437
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 00:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7053ADDBD;
	Wed, 19 Jun 2024 00:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rqwcvkkk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73309BA2F;
	Wed, 19 Jun 2024 00:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718756295; cv=none; b=DlVkVQMBv+hgrA8aTy9GIV2eL53hy4OOvfkGLkDdxgmrGdUo6HV/v3jsQ9LzG9B4/e4Yk6afotL6UHSwuluGMFN17Hz+p12VVDgtnbRY4jI8XJftUDyDWXQBcPLCcrFXGmGCKsIXWnTkLVQCK6XVdooVlOPevIimnVX2x//EDhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718756295; c=relaxed/simple;
	bh=LIF+98r2HvBsaEXWdQw1ppppt4ZOL9QcWAbsO616AHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FCAajg/N+/s6Xv+0rKPwGFYHlS2p0R45HHF5rBPLDbq6zNeOtYDA2xaLUkGo93bZWyw8nwHoU15L39u1q42hXSLusd8TzKVE/gcBiQkvG5axR1a7BZj9DjeEVU5MepJSzkqhCAQHbBteUC0h6tX+OEuL+wpNWve+Nj2GeagWfoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rqwcvkkk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E2DC7122D;
	Wed, 19 Jun 2024 02:17:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718756270;
	bh=LIF+98r2HvBsaEXWdQw1ppppt4ZOL9QcWAbsO616AHA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rqwcvkkkv77uPVHyIAem+6tvptrGDVoVqNdrNhKlwvDGX8wvqAtcnqPkSx9GlqpxP
	 TT/sbnoeUidlfkxfMa/7AdTKREo/jjDL5DQ167Y7eP68f+fsMsH2dHwOpZg01pwPpY
	 HvQM3VSf9t/pnDIak1HJJZJsg5DnAtc71Oskc1yI=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 17/19] media: renesas: vsp1: Initialize control handler after subdev
Date: Wed, 19 Jun 2024 03:17:20 +0300
Message-ID: <20240619001722.9749-18-laurent.pinchart+renesas@ideasonboard.com>
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

Some VSP modules initialize their control handler after initializing the
subdev, while some initialize it before. This makes the code
inconsistent and more error prone. Standardize on control initialization
after initializing the subdev.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_hgo.c    | 20 +++++++++----------
 .../media/platform/renesas/vsp1/vsp1_hgt.c    | 12 +++++------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hgo.c b/drivers/media/platform/renesas/vsp1/vsp1_hgo.c
index 0ea87014a701..2c8ce7175a4e 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_hgo.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_hgo.c
@@ -192,6 +192,16 @@ struct vsp1_hgo *vsp1_hgo_create(struct vsp1_device *vsp1)
 	if (hgo == NULL)
 		return ERR_PTR(-ENOMEM);
 
+	/* Initialize the video device and queue for statistics data. */
+	ret = vsp1_histogram_init(vsp1, &hgo->histo, VSP1_ENTITY_HGO, "hgo",
+				  &hgo_entity_ops, hgo_mbus_formats,
+				  ARRAY_SIZE(hgo_mbus_formats),
+				  HGO_DATA_SIZE, V4L2_META_FMT_VSP1_HGO);
+	if (ret < 0) {
+		vsp1_entity_destroy(&hgo->histo.entity);
+		return ERR_PTR(ret);
+	}
+
 	/* Initialize the control handler. */
 	v4l2_ctrl_handler_init(&hgo->ctrls.handler,
 			       vsp1->info->gen >= 3 ? 2 : 1);
@@ -207,15 +217,5 @@ struct vsp1_hgo *vsp1_hgo_create(struct vsp1_device *vsp1)
 
 	hgo->histo.entity.subdev.ctrl_handler = &hgo->ctrls.handler;
 
-	/* Initialize the video device and queue for statistics data. */
-	ret = vsp1_histogram_init(vsp1, &hgo->histo, VSP1_ENTITY_HGO, "hgo",
-				  &hgo_entity_ops, hgo_mbus_formats,
-				  ARRAY_SIZE(hgo_mbus_formats),
-				  HGO_DATA_SIZE, V4L2_META_FMT_VSP1_HGO);
-	if (ret < 0) {
-		vsp1_entity_destroy(&hgo->histo.entity);
-		return ERR_PTR(ret);
-	}
-
 	return hgo;
 }
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hgt.c b/drivers/media/platform/renesas/vsp1/vsp1_hgt.c
index 496354c8df0e..858f330d44fa 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_hgt.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_hgt.c
@@ -191,12 +191,6 @@ struct vsp1_hgt *vsp1_hgt_create(struct vsp1_device *vsp1)
 	if (hgt == NULL)
 		return ERR_PTR(-ENOMEM);
 
-	/* Initialize the control handler. */
-	v4l2_ctrl_handler_init(&hgt->ctrls, 1);
-	v4l2_ctrl_new_custom(&hgt->ctrls, &hgt_hue_areas, NULL);
-
-	hgt->histo.entity.subdev.ctrl_handler = &hgt->ctrls;
-
 	/* Initialize the video device and queue for statistics data. */
 	ret = vsp1_histogram_init(vsp1, &hgt->histo, VSP1_ENTITY_HGT, "hgt",
 				  &hgt_entity_ops, hgt_mbus_formats,
@@ -207,6 +201,12 @@ struct vsp1_hgt *vsp1_hgt_create(struct vsp1_device *vsp1)
 		return ERR_PTR(ret);
 	}
 
+	/* Initialize the control handler. */
+	v4l2_ctrl_handler_init(&hgt->ctrls, 1);
+	v4l2_ctrl_new_custom(&hgt->ctrls, &hgt_hue_areas, NULL);
+
+	hgt->histo.entity.subdev.ctrl_handler = &hgt->ctrls;
+
 	v4l2_ctrl_handler_setup(&hgt->ctrls);
 
 	return hgt;
-- 
Regards,

Laurent Pinchart


