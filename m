Return-Path: <linux-media+bounces-18017-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56212971E71
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 17:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81BA11C23001
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 15:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD9E360B8A;
	Mon,  9 Sep 2024 15:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vFlzop8u"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D963B791;
	Mon,  9 Sep 2024 15:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725896960; cv=none; b=CzQweccJLfEDFrHcVtcXMi//A8h37BMHYgAJwWEG7iAQNWdGxe2siDUetUL5y6b6gW+JdA0nL2EzFGKLrF9jz9oqTZAYgQWemfLx8LEImVrCuKaGJBfn89UKlk8h7w0Xq6CdjY5kEE72ra07Z4RcU/M/a1QS9EYUZVOOlaqPMzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725896960; c=relaxed/simple;
	bh=1n4LKalLj0U+RZY15W5Z9FwyFjbUuJ0hWD0n1ZO3bSk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lZlABNsv8FgWCH1ILE0M53hFcvD0z0um/Kd0+FEcz8YNnb85lj1DcaLktONGZycS8Ad82VSgt4aSRvbzzr5yngHabHrPYzZSWHEktk1K4IaAsA2nNm7bF9bNuSi2l4W2qPesaCFq7UALQPaGMTIA9vpTLRP706XEiV0f0wbQwxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vFlzop8u; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pyrite.hamster-moth.ts.net (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E6977827;
	Mon,  9 Sep 2024 17:47:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725896880;
	bh=1n4LKalLj0U+RZY15W5Z9FwyFjbUuJ0hWD0n1ZO3bSk=;
	h=From:To:Cc:Subject:Date:From;
	b=vFlzop8ucgsSZm35yh3A9+/NM3qFGCKV4BRd9ZpZ9wzw8BQIO837yOQTej7iaOvMB
	 OAAXotLoSF5n/2piAPcdKnqFhC2Jkjp6peVwG/wLc/rNG0GI7N3W07r+vSOjgSfMwC
	 ofRoBBa9VMtpfEN7DhSU2o+LR3gJXnoNDmGEpukE=
From: Paul Elder <paul.elder@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] media: platform: video-mux: Fix mutex locking
Date: Mon,  9 Sep 2024 17:48:28 +0200
Message-Id: <20240909154828.1661627-1-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current order of locking between the driver mutex and the v4l2
subdev state lock causes a circuluar locking dependency when trying to
set up a link. Fix this.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 drivers/media/platform/video-mux.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
index 31e9e92e723eb..f43849db56800 100644
--- a/drivers/media/platform/video-mux.c
+++ b/drivers/media/platform/video-mux.c
@@ -52,6 +52,7 @@ static int video_mux_link_setup(struct media_entity *entity,
 				const struct media_pad *remote, u32 flags)
 {
 	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
+	struct v4l2_subdev_state *sd_state;
 	struct video_mux *vmux = v4l2_subdev_to_video_mux(sd);
 	u16 source_pad = entity->num_pads - 1;
 	int ret = 0;
@@ -67,10 +68,10 @@ static int video_mux_link_setup(struct media_entity *entity,
 		remote->entity->name, remote->index, local->entity->name,
 		local->index, flags & MEDIA_LNK_FL_ENABLED);
 
+	sd_state = v4l2_subdev_lock_and_get_active_state(sd);
 	mutex_lock(&vmux->lock);
 
 	if (flags & MEDIA_LNK_FL_ENABLED) {
-		struct v4l2_subdev_state *sd_state;
 		struct v4l2_mbus_framefmt *source_mbusformat;
 
 		if (vmux->active == local->index)
@@ -88,12 +89,10 @@ static int video_mux_link_setup(struct media_entity *entity,
 		vmux->active = local->index;
 
 		/* Propagate the active format to the source */
-		sd_state = v4l2_subdev_lock_and_get_active_state(sd);
 		source_mbusformat = v4l2_subdev_state_get_format(sd_state,
 								 source_pad);
 		*source_mbusformat = *v4l2_subdev_state_get_format(sd_state,
 								   vmux->active);
-		v4l2_subdev_unlock_state(sd_state);
 	} else {
 		if (vmux->active != local->index)
 			goto out;
@@ -105,6 +104,7 @@ static int video_mux_link_setup(struct media_entity *entity,
 
 out:
 	mutex_unlock(&vmux->lock);
+	v4l2_subdev_unlock_state(sd_state);
 	return ret;
 }
 
-- 
2.39.2


