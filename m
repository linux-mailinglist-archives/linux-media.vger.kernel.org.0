Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 671A4360A03
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 15:05:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233081AbhDONFr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 09:05:47 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46132 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233061AbhDONFo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 09:05:44 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 17099DA8;
        Thu, 15 Apr 2021 15:05:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618491920;
        bh=rsUFt4eoWxRvjHlJMOePh5h62ISriuswwKKAIoTeVO4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Nh+xUaFT9z/XCYkBiKB6TIet9lJEmz6PZvgCjS9q2cORzxfACt4aJifH5NfFFGMBC
         z8hZpSmC3zEb/ciZQfgxEwaJL6BYOxOsPeGkTOZ6pnYZcSx2S/3oihjd1qLucydryz
         eZfB9kbx/U0G4/MMKAbdYHfY4xGtkCGS2tMpvoaM=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v5 14/24] media: entity: Add debug information in graph walk route check
Date:   Thu, 15 Apr 2021 16:04:40 +0300
Message-Id: <20210415130450.421168-15-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
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
---
 drivers/media/mc/mc-entity.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 40e5544552c0..484a18333231 100644
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

