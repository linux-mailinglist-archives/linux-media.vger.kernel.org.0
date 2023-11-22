Return-Path: <linux-media+bounces-709-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 054C07F3CE5
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 05:31:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1466281123
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 04:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 398B0168A7;
	Wed, 22 Nov 2023 04:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZTsb1EtJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28740D45;
	Tue, 21 Nov 2023 20:30:37 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ACA64C85;
	Wed, 22 Nov 2023 05:29:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700627395;
	bh=jfEFjSGcWkEwC6uMPBJVQbV6nlVimrRVyxDcHJOMmh8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZTsb1EtJvFCpi3A2evnzlZDadc8IL4HPByfrtmUSCjXsWi1H9fArIMGAgOU1vSvcw
	 mzqe86R/EdsGqAHuKU9w/OYCoXo1JnIDpBR8EGlmf686e7t7XtlBE0RtRYG9YY0QEP
	 XzCEZMm0PFwshLtvRChA8kPTwdOGohgHrg/DIcXs=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [RFC PATCH v1 17/19] media: renesas: vsp1: Initialize control handler after subdev
Date: Wed, 22 Nov 2023 06:30:07 +0200
Message-ID: <20231122043009.2741-18-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231122043009.2741-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20231122043009.2741-1-laurent.pinchart+renesas@ideasonboard.com>
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
---
 .../media/platform/renesas/vsp1/vsp1_hgo.c    | 20 +++++++++----------
 .../media/platform/renesas/vsp1/vsp1_hgt.c    | 12 +++++------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hgo.c b/drivers/media/platform/renesas/vsp1/vsp1_hgo.c
index 237dc4c7c5ed..21cffe6947a2 100644
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
index b73eac676ef0..a447ed1c59c3 100644
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


