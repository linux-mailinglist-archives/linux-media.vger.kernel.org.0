Return-Path: <linux-media+bounces-705-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 860357F3CDE
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 05:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6D761C20DF6
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 04:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1EF45666;
	Wed, 22 Nov 2023 04:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vdvGXdFk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1363D45;
	Tue, 21 Nov 2023 20:30:29 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC05716B7;
	Wed, 22 Nov 2023 05:29:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700627389;
	bh=+NZ3Vg0yj1bilBw77wZZj5S4+VybLhTMXQ6P0y3ZyXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vdvGXdFkvPQNDPAEBwJsN5ilNuT6HnIY4UpVujLp3kjeYm0r2QPdmQ68pcVX857c1
	 C+6B8rr4M1F95OAJoYw3igkz/6drkqOQJEiX5HoHm1QqyzvqjlbANAijasR8RGY0SR
	 69LU5I46Uh3zdjw19Oc9kpQZjDF4WL8Z4alvNx9s=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [RFC PATCH v1 12/19] media: renesas: vsp1: Keep the DRM pipeline entities sorted
Date: Wed, 22 Nov 2023 06:30:02 +0200
Message-ID: <20231122043009.2741-13-laurent.pinchart+renesas@ideasonboard.com>
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

Some of the code that handles pipeline configuration assumes that
entities in a pipeline's entities list are sorted from sink to source.
To prepare for using that code with the DRM pipeline, insert the BRx
just before the WPF, and the RPFs at the head of the list.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_drm.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
index 1aa59a74672f..e44359b661b6 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
@@ -317,7 +317,10 @@ static int vsp1_du_pipeline_setup_brx(struct vsp1_device *vsp1,
 			list_add_tail(&released_brx->list_pipe,
 				      &pipe->entities);
 
-		/* Add the BRx to the pipeline. */
+		/*
+		 * Add the BRx to the pipeline, inserting it just before the
+		 * WPF.
+		 */
 		dev_dbg(vsp1->dev, "%s: pipe %u: acquired %s\n",
 			__func__, pipe->lif->index, BRX_NAME(brx));
 
@@ -326,7 +329,8 @@ static int vsp1_du_pipeline_setup_brx(struct vsp1_device *vsp1,
 		pipe->brx->sink = &pipe->output->entity;
 		pipe->brx->sink_pad = 0;
 
-		list_add_tail(&pipe->brx->list_pipe, &pipe->entities);
+		list_add_tail(&pipe->brx->list_pipe,
+			      &pipe->output->entity.list_pipe);
 	}
 
 	/*
@@ -420,7 +424,7 @@ static int vsp1_du_pipeline_setup_inputs(struct vsp1_device *vsp1,
 
 		if (!rpf->entity.pipe) {
 			rpf->entity.pipe = pipe;
-			list_add_tail(&rpf->entity.list_pipe, &pipe->entities);
+			list_add(&rpf->entity.list_pipe, &pipe->entities);
 		}
 
 		brx->inputs[i].rpf = rpf;
-- 
Regards,

Laurent Pinchart


