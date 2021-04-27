Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21A5136C652
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 14:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237784AbhD0MrB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 08:47:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45348 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237759AbhD0MrA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 08:47:00 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C3446144C;
        Tue, 27 Apr 2021 14:46:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619527576;
        bh=/HvJfRtGIUaJ33Enk9PhwOPcD/bDLYVcAdsyBwiJszo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FYlEnWMXwf2XNu7LKKiY5KZ/qxmo0OuBEKSy74JlZ4Q04C8sAJ7tomc7antvNK3gG
         CYT+hMTKbY8CUP8BY/qQzR/tCxWh8sF0+3xb6rTWKB+ivxSZV0vTlTqa028woL5qyq
         IWZuDdBmLSaQaOfgwcCj4JKrQG3s1ii00bRWY84E=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v6 14/24] media: entity: Add debug information in graph walk route check
Date:   Tue, 27 Apr 2021 15:45:13 +0300
Message-Id: <20210427124523.990938-15-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210427124523.990938-1-tomi.valkeinen@ideasonboard.com>
References: <20210427124523.990938-1-tomi.valkeinen@ideasonboard.com>
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
index 2b70ef97c56c..d62436cdd64f 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -351,6 +351,9 @@ static void media_graph_walk_iter(struct media_graph *graph)
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

