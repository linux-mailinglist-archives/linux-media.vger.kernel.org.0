Return-Path: <linux-media+bounces-3688-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E9F82D767
	for <lists+linux-media@lfdr.de>; Mon, 15 Jan 2024 11:30:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE8F21F21F34
	for <lists+linux-media@lfdr.de>; Mon, 15 Jan 2024 10:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3A4101E3;
	Mon, 15 Jan 2024 10:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BZTfC1kk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5388812E70
	for <linux-media@vger.kernel.org>; Mon, 15 Jan 2024 10:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F203FAD;
	Mon, 15 Jan 2024 11:29:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1705314564;
	bh=UhIxup8qGbozpDATzUSz1ikfNlVBWS6J76knrgnV59I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BZTfC1kkbnmkpLUS5qI8Lerv7tpTeREsGImueU1+yujna8OzKdV9T/a0x0qVgyGUt
	 WQSkJT7WFYAkbA1SClQZRDQ7bnh2P5+xDQdBX5R+A6IEnQEPeTAvcd9PIjZRCNvjjc
	 yTAfXLDRdYsVdrxXXzVdnaCXuBiM4HlZc2L+m2lA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Marek Vasut <marex@denx.de>,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Purism Kernel Team <kernel@puri.sm>
Subject: [PATCH 5/7] media: mc: Rename pad variable to clarify intent
Date: Mon, 15 Jan 2024 12:30:27 +0200
Message-ID: <20240115103029.28055-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115103029.28055-1-laurent.pinchart@ideasonboard.com>
References: <20240115103029.28055-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pad local variable in the media_pipeline_explore_next_link()
function is used to store the pad through which the entity has been
reached. Rename it to origin to reflect that and make the code easier to
read. This will be even more important in subsequent commits when
expanding the function with additional logic.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index c2d8f59b62c1..5907925ffd89 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -605,13 +605,13 @@ static int media_pipeline_explore_next_link(struct media_pipeline *pipe,
 					    struct media_pipeline_walk *walk)
 {
 	struct media_pipeline_walk_entry *entry = media_pipeline_walk_top(walk);
-	struct media_pad *pad;
+	struct media_pad *origin;
 	struct media_link *link;
 	struct media_pad *local;
 	struct media_pad *remote;
 	int ret;
 
-	pad = entry->pad;
+	origin = entry->pad;
 	link = list_entry(entry->links, typeof(*link), list);
 	media_pipeline_walk_pop(walk);
 
@@ -621,7 +621,7 @@ static int media_pipeline_explore_next_link(struct media_pipeline *pipe,
 		link->sink->entity->name, link->sink->index);
 
 	/* Get the local pad and remote pad. */
-	if (link->source->entity == pad->entity) {
+	if (link->source->entity == origin->entity) {
 		local = link->source;
 		remote = link->sink;
 	} else {
@@ -633,8 +633,9 @@ static int media_pipeline_explore_next_link(struct media_pipeline *pipe,
 	 * Skip links that originate from a different pad than the incoming pad
 	 * that is not connected internally in the entity to the incoming pad.
 	 */
-	if (pad != local &&
-	    !media_entity_has_pad_interdep(pad->entity, pad->index, local->index)) {
+	if (origin != local &&
+	    !media_entity_has_pad_interdep(origin->entity, origin->index,
+					   local->index)) {
 		dev_dbg(walk->mdev->dev,
 			"media pipeline: skipping link (no route)\n");
 		return 0;
-- 
Regards,

Laurent Pinchart


