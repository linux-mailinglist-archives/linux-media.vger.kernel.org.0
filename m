Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1EDC38E45B
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 12:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232688AbhEXKqN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 06:46:13 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60880 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232684AbhEXKqH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 06:46:07 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F04129DE;
        Mon, 24 May 2021 12:44:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621853078;
        bh=CSSdUbpxoSkJMV+ePmYverPMoWZmaPKrSnsPxh9LCR4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Uo4pEp+dnxoClBZwPHXjnq5d6wMYNMwy06Y9UN+dwlE0vS7xkDrT64nHDOr42RtZL
         F4CzTrarL/ovBBJ5aWjmrMi62Bd0tyr8cLJjr+ryu5w1LV7xlFyn5kYuIgjcLBg+d1
         64hGNgcjXkz5KJG1LsL7N2HyP4a+Q66vsxekLMeI=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v7 14/27] media: entity: Add debug information in graph walk route check
Date:   Mon, 24 May 2021 13:43:55 +0300
Message-Id: <20210524104408.599645-15-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sakari Ailus <sakari.ailus@linux.intel.com>

Add debug printout in graph walk route check.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index e2aa14ac8000..f24f3854a8a3 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -365,6 +365,9 @@ static void media_graph_walk_iter(struct media_graph *graph)
 	 */
 	if (!media_entity_has_route(pad->entity, pad->index, local->index)) {
 		link_top(graph) = link_top(graph)->next;
+		dev_dbg(pad->graph_obj.mdev->dev,
+			"walk: skipping \"%s\":%u -> %u (no route)\n",
+			pad->entity->name, pad->index, local->index);
 		return;
 	}
 
-- 
2.25.1

