Return-Path: <linux-media+bounces-13634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A68890E0A3
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 02:18:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D93C6B21148
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 00:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D7BAD32;
	Wed, 19 Jun 2024 00:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Mj3NuQPy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD98EDB;
	Wed, 19 Jun 2024 00:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718756288; cv=none; b=DkIwtsbGk94rJ+z41EDWcGEUS6/wEQtUVrBnKOTFQSvz0adThU6kkXWt7mLZotCR+eWX6NcjksyESkeXpzEnp5c4WFlGe/qjeX7IWS/5ptNx3+WjZ0GAgZb1bRJvn0Ud43NI927Pc8EfKpSdQGYX9KSvb7++xSsf3uOGZvHGnxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718756288; c=relaxed/simple;
	bh=+NZ3Vg0yj1bilBw77wZZj5S4+VybLhTMXQ6P0y3ZyXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=td6bYMFKugCJYBxoINfHEVJErdscpaiKqoKUCbxV0lKcrTrOkYer5SGYfYoRZ2bL70qKK+iqfc49bIcJoW1tKoHIBGJeAiZje4jRQ589ypmWSR6d4z2kTq5IjZtvjva53XbO2iFWavYsAHyowUPeTbiJUjQZZH1WZ1HEbWKyRt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Mj3NuQPy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43CD911CF;
	Wed, 19 Jun 2024 02:17:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718756263;
	bh=+NZ3Vg0yj1bilBw77wZZj5S4+VybLhTMXQ6P0y3ZyXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mj3NuQPybt81Yy6DnuR4pG1oQAIMs3b9SqcmJ6kn0hy/2Gtvqd0PPBJRsgWiqtrXX
	 sq+bNROfxB0XnQ6RsrM5ESUY3PgvuXoaCntUKbFR5mjbrPzTpjWF5h0VLbPpUMbzZ0
	 Z2dbIHkNBnP9dtvlhnczQ8hYJ23cReuXU6MuhFvE=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 12/19] media: renesas: vsp1: Keep the DRM pipeline entities sorted
Date: Wed, 19 Jun 2024 03:17:15 +0300
Message-ID: <20240619001722.9749-13-laurent.pinchart+renesas@ideasonboard.com>
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


