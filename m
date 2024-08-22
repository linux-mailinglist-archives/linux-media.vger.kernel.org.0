Return-Path: <linux-media+bounces-16617-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA73395C02F
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 23:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E78E3285DCC
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 21:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243A713B787;
	Thu, 22 Aug 2024 21:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jZhtJSnF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73B51D1753;
	Thu, 22 Aug 2024 21:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724361893; cv=none; b=IzHMIW1AQ1XH6A2KVvHgqthhYPLwQyjvliR86qpazfMQbO3AwccRADKQHvx01Zn9nnTEL1odxkNBZ3q4buSanlJY03s7eGvulPnHsQfrTwasN9SV1+pw9VzsIJQmJ1ZETnE1a3bHJUvZzZfu+G4GuKjMRG9PwKIXy2CYDaEfglg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724361893; c=relaxed/simple;
	bh=MLDyfpjT+SmchGmpRWoLhkFRvYsGE89EYC55eOC4Lu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RB0LSRYpnix2Z7jwyfL7BIgMnqpOKx0xDoD+E0wwYATGu85K8XhC7aEQI6kjQGc1bEABNdrG2v9CJMX28qsWruQHUgiAzcGuo9bjktxA539iRpBo5ohPQAKuKcDXiGwxXqaVzWtkZXQBBYyf7BzX/Alqovbuzd865ILscjARdOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jZhtJSnF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 84BE88A9;
	Thu, 22 Aug 2024 23:23:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724361826;
	bh=MLDyfpjT+SmchGmpRWoLhkFRvYsGE89EYC55eOC4Lu4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jZhtJSnFxJepfMu9g7M3dchFiuXhEXp9RiZpiDhXgJU70KBNw6/6+d59UITBYHFzI
	 boiGaFIcKnBMUHyj4SC7KRd5fJSwY2yQ+Ahr+ZsKPArGxypV7p3DSwxxbg5C8uFbNv
	 WOsO1gUYfnmByI+l4EYKs9VtVoTDLlkqca0A5Qbw=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 1/4] media: vsp1: Build the pipeline after starting it
Date: Fri, 23 Aug 2024 00:24:40 +0300
Message-ID: <20240822212445.2037-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240822212445.2037-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240822212445.2037-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to use the new media pipeline iterators, the pipeline has to be
built after being started. Refactor the code to do so. Switching to the
iterators will happen in a separate step.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_video.c  | 57 +++++++++----------
 1 file changed, 28 insertions(+), 29 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index fdb46ec0c872..ca2d00c9be35 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -520,22 +520,6 @@ static int vsp1_video_pipeline_build(struct vsp1_pipeline *pipe,
 			return ret;
 	}
 
-	return 0;
-}
-
-static int vsp1_video_pipeline_init(struct vsp1_pipeline *pipe,
-				    struct vsp1_video *video)
-{
-	int ret;
-
-	vsp1_pipeline_init(pipe);
-
-	pipe->frame_end = vsp1_video_pipeline_frame_end;
-
-	ret = vsp1_video_pipeline_build(pipe, video);
-	if (ret)
-		return ret;
-
 	vsp1_pipeline_dump(pipe, "video");
 
 	return 0;
@@ -544,7 +528,6 @@ static int vsp1_video_pipeline_init(struct vsp1_pipeline *pipe,
 static struct vsp1_pipeline *vsp1_video_pipeline_get(struct vsp1_video *video)
 {
 	struct vsp1_pipeline *pipe;
-	int ret;
 
 	/*
 	 * Get a pipeline object for the video node. If a pipeline has already
@@ -557,12 +540,9 @@ static struct vsp1_pipeline *vsp1_video_pipeline_get(struct vsp1_video *video)
 		if (!pipe)
 			return ERR_PTR(-ENOMEM);
 
-		ret = vsp1_video_pipeline_init(pipe, video);
-		if (ret < 0) {
-			vsp1_pipeline_reset(pipe);
-			kfree(pipe);
-			return ERR_PTR(ret);
-		}
+		vsp1_pipeline_init(pipe);
+
+		pipe->frame_end = vsp1_video_pipeline_frame_end;
 	} else {
 		pipe = video->rwpf->entity.pipe;
 		kref_get(&pipe->kref);
@@ -579,12 +559,17 @@ static void vsp1_video_pipeline_release(struct kref *kref)
 	kfree(pipe);
 }
 
+static void __vsp1_video_pipeline_put(struct vsp1_pipeline *pipe)
+{
+	kref_put(&pipe->kref, vsp1_video_pipeline_release);
+}
+
 static void vsp1_video_pipeline_put(struct vsp1_pipeline *pipe)
 {
 	struct media_device *mdev = &pipe->output->entity.vsp1->media_dev;
 
 	mutex_lock(&mdev->graph_mutex);
-	kref_put(&pipe->kref, vsp1_video_pipeline_release);
+	__vsp1_video_pipeline_put(pipe);
 	mutex_unlock(&mdev->graph_mutex);
 }
 
@@ -985,8 +970,23 @@ vsp1_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 
 	ret = __video_device_pipeline_start(&video->video, &pipe->pipe);
 	if (ret < 0) {
+		__vsp1_video_pipeline_put(pipe);
 		mutex_unlock(&mdev->graph_mutex);
-		goto err_pipe;
+		return ret;
+	}
+
+	/*
+	 * If the pipeline hasn't been built, do so now. This needs to happen
+	 * after __media_pipeline_start() to use the pipeline iterators.
+	 */
+	if (!pipe->output) {
+		ret = vsp1_video_pipeline_build(pipe, video);
+		if (ret < 0) {
+			__media_pipeline_stop(video->video.entity.pads);
+			__vsp1_video_pipeline_put(pipe);
+			mutex_unlock(&mdev->graph_mutex);
+			return ret;
+		}
 	}
 
 	mutex_unlock(&mdev->graph_mutex);
@@ -997,18 +997,17 @@ vsp1_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 	 */
 	ret = vsp1_video_verify_format(video);
 	if (ret < 0)
-		goto err_stop;
+		goto error;
 
 	/* Start the queue. */
 	ret = vb2_streamon(&video->queue, type);
 	if (ret < 0)
-		goto err_stop;
+		goto error;
 
 	return 0;
 
-err_stop:
+error:
 	video_device_pipeline_stop(&video->video);
-err_pipe:
 	vsp1_video_pipeline_put(pipe);
 	return ret;
 }
-- 
Regards,

Laurent Pinchart


