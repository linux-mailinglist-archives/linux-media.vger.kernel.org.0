Return-Path: <linux-media+bounces-16618-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 471C295C032
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 23:25:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6EA0B24222
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 21:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC8791D2790;
	Thu, 22 Aug 2024 21:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Llpkgefj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D551D1F7F;
	Thu, 22 Aug 2024 21:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724361896; cv=none; b=WS1ctGberwSSjsk+uxR7joyu/9uxWKihqR3JT/px8wS26I1kLZ+d3EW5+A/vXNk/qa1xeJBRM2GOL45gDvInBUnFUbY2XCtLwWtDd7elePbEfwyyVpVvuZ1V3B1pz6oWgmdkXAuYZo5WQd1hHxXCKt1LCXb64C5xkRCr/gGGFDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724361896; c=relaxed/simple;
	bh=B7BalneVeiN7IaUOyCYEq7VXbo3UG4I6yh7+Cg+SqG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pVkd9wLvt0ch5jVafMfkzicW/sgiNUEaf7n/tf6zCIZ1sUeiIqCq5bDfNpFIFxG7ItAwl9RFMrR0OGWfChWT3IQFHvB1EfdjhElqMsm+C5mBGooDE5LoB3kVQ+C8SSjAr/Gk3yltGk5KORMaI1NddOMgo1vunIwFED8KsWB9kf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Llpkgefj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D09B8CC;
	Thu, 22 Aug 2024 23:23:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724361828;
	bh=B7BalneVeiN7IaUOyCYEq7VXbo3UG4I6yh7+Cg+SqG4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Llpkgefjw8Nk5BIUr0/oDIdfS9wIjLfqTWGRr2vtauvuDnSh9sbB5Ko9HP4HiN6IC
	 zkTcIy8fgQ965EXXfMwA14Fy50HvyYSuETcU0Kn7g3hrobYcPHEwU1PysRyGSB8R/7
	 6GrezmPD2B6uzsaFyqGmNYBEF4PysFRj2ScnlBRY=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 2/4] media: vsp1: Sort entities in the pipeline
Date: Fri, 23 Aug 2024 00:24:41 +0300
Message-ID: <20240822212445.2037-3-laurent.pinchart+renesas@ideasonboard.com>
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

The driver relies on the pipe->entities list being sorted in graph
order, in particular for the partition management code to correctly
compute partitions from source to sink. The media graph walk API happens
to produce that order, but doesn't offer any guarantee, which makes the
code fairly fragile. Harden it by sorting the list in the order we need.

While at it fix an unrelated white space issue.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_entity.c |  1 -
 .../media/platform/renesas/vsp1/vsp1_video.c  | 66 +++++++++++++++++++
 2 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
index 8b8945bd8f10..b2e6c0ed8744 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
@@ -500,7 +500,6 @@ struct media_pad *vsp1_entity_remote_pad(struct media_pad *pad)
 	}
 
 	return NULL;
-
 }
 
 /* -----------------------------------------------------------------------------
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index ca2d00c9be35..f0288968bd55 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -442,6 +442,7 @@ static int vsp1_video_pipeline_build(struct vsp1_pipeline *pipe,
 	struct media_graph graph;
 	struct media_entity *entity = &video->video.entity;
 	struct media_device *mdev = entity->graph_obj.mdev;
+	struct list_head *cursor;
 	unsigned int i;
 	int ret;
 
@@ -520,6 +521,71 @@ static int vsp1_video_pipeline_build(struct vsp1_pipeline *pipe,
 			return ret;
 	}
 
+	/*
+	 * Sort the pipe->entities list from RPF to WPF, as the partition code
+	 * relies on that order. Iterate over the list in reverse order and
+	 * place each entry before any entry that follows it in pipeline order.
+	 *
+	 * The cursor points to the list entry immediately after the entry
+	 * being processed. When the cursor reaches the entry after the list
+	 * head we are thus done.
+	 */
+	for (cursor = &pipe->entities; cursor->prev != &pipe->entities; ) {
+		struct vsp1_entity *to_sort;
+		struct vsp1_entity *e;
+
+		/*
+		 * Sort the entity just before the cursor. Place it before the
+		 * first entry in the list that is connected to the sort
+		 * entry's source pad.
+		 */
+		to_sort = list_entry(cursor->prev, struct vsp1_entity, list_pipe);
+
+		list_for_each_entry(e, &pipe->entities, list_pipe) {
+			struct media_link *link;
+			struct media_pad *pad;
+			bool connected = false;
+
+			if (e == to_sort)
+				break;
+
+			/*
+			 * Check if to_sort's source pad is connected through
+			 * an active link to entity e.
+			 */
+			pad = &to_sort->pads[to_sort->source_pad];
+
+			list_for_each_entry(link, &pad->entity->links, list) {
+				if (!(link->flags & MEDIA_LNK_FL_ENABLED) ||
+				    link->source != pad)
+					continue;
+
+				if (link->sink->entity == &e->subdev.entity) {
+					connected = true;
+					break;
+				}
+			}
+
+			/* If connected, move to_sort right before e. */
+			if (connected) {
+				dev_dbg(video->vsp1->dev,
+					"sorting pipeline: moving %s before %s\n",
+					to_sort->subdev.name, e->subdev.name);
+				list_move_tail(&to_sort->list_pipe, &e->list_pipe);
+				break;
+			}
+		}
+
+		/*
+		 * If the entry before the cursor hasn't changed it means it's
+		 * correctly positioned, and the cursor can then be updated.
+		 * Otherwise the next iteration will process the cursor's new
+		 * previous entry.
+		 */
+		if (cursor->prev == &to_sort->list_pipe)
+			cursor = cursor->prev;
+	}
+
 	vsp1_pipeline_dump(pipe, "video");
 
 	return 0;
-- 
Regards,

Laurent Pinchart


