Return-Path: <linux-media+bounces-3734-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE7F82EB04
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 09:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 881D7285449
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 08:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5275211CB9;
	Tue, 16 Jan 2024 08:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="S2bcBJSL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3032911CBD
	for <linux-media@vger.kernel.org>; Tue, 16 Jan 2024 08:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 685CA13AC;
	Tue, 16 Jan 2024 09:41:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1705394489;
	bh=EZTcoB3r1J1RKFi0JM6JAplkY2hpDAxJcIluuscDPIg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S2bcBJSL98DilVIak7XcXwe/Y/ZUmphE/s3pZCYgugM6E1yUCkJSIEz/y3cB9M8c/
	 hS5aSuzgxgX/NlCCmNHevbw4OKUHXCEDs+SPI34EMefjh+Cm2usdZNHtlHkWx+qDgm
	 v701ncr27yf0m0xBqFAzUYcba4GMBY285jkuxFoA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Alexander Shiyan <eagle.alexander923@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Marek Vasut <marex@denx.de>,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Tim Harvey <tharvey@gateworks.com>,
	Purism Kernel Team <kernel@puri.sm>
Subject: [PATCH v2 1/7] media: mc: Add local pad to pipeline regardless of the link state
Date: Tue, 16 Jan 2024 10:42:34 +0200
Message-ID: <20240116084240.14228-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116084240.14228-1-laurent.pinchart@ideasonboard.com>
References: <20240116084240.14228-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building pipelines by following links, the
media_pipeline_explore_next_link() function only traverses enabled
links. The remote pad of a disabled link is not added to the pipeline,
and neither is the local pad. While the former is correct as disabled
links should not be followed, not adding the local pad breaks processing
of the MEDIA_PAD_FL_MUST_CONNECT flag.

The MEDIA_PAD_FL_MUST_CONNECT flag is checked in the
__media_pipeline_start() function that iterates over all pads after
populating the pipeline. If the pad is not present, the check gets
skipped, rendering it useless.

Fix this by adding the local pad of all links regardless of their state,
only skipping the remote pad for disabled links.

Cc: Alexander Shiyan <eagle.alexander923@gmail.com>
Fixes: ae219872834a ("media: mc: entity: Rewrite media_pipeline_start()")
Reported-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Closes: https://lore.kernel.org/linux-media/7658a15a-80c5-219f-2477-2a94ba6c6ba1@kontron.de
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-entity.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 543a392f8635..a6f28366106f 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -620,13 +620,6 @@ static int media_pipeline_explore_next_link(struct media_pipeline *pipe,
 		link->source->entity->name, link->source->index,
 		link->sink->entity->name, link->sink->index);
 
-	/* Skip links that are not enabled. */
-	if (!(link->flags & MEDIA_LNK_FL_ENABLED)) {
-		dev_dbg(walk->mdev->dev,
-			"media pipeline: skipping link (disabled)\n");
-		return 0;
-	}
-
 	/* Get the local pad and remote pad. */
 	if (link->source->entity == pad->entity) {
 		local = link->source;
@@ -648,13 +641,20 @@ static int media_pipeline_explore_next_link(struct media_pipeline *pipe,
 	}
 
 	/*
-	 * Add the local and remote pads of the link to the pipeline and push
-	 * them to the stack, if they're not already present.
+	 * Add the local pad of the link to the pipeline and push it to the
+	 * stack, if not already present.
 	 */
 	ret = media_pipeline_add_pad(pipe, walk, local);
 	if (ret)
 		return ret;
 
+	/* Similarly, add the remote pad, but only if the link is enabled. */
+	if (!(link->flags & MEDIA_LNK_FL_ENABLED)) {
+		dev_dbg(walk->mdev->dev,
+			"media pipeline: skipping link (disabled)\n");
+		return 0;
+	}
+
 	ret = media_pipeline_add_pad(pipe, walk, remote);
 	if (ret)
 		return ret;
-- 
Regards,

Laurent Pinchart


