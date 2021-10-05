Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFAB8422178
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 10:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233572AbhJEJA1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 05:00:27 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60730 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233568AbhJEJAW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 05:00:22 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E331146B;
        Tue,  5 Oct 2021 10:58:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633424312;
        bh=k4dtSi5T81HriB88LQzoRIe3W/ODgFiOtzTeyiQAslA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=a4a2vFDoNgzL8VeS6cIVFqOT3VQxNghw/wRuDXR0BLhruDHO1kdP1yLrZSnBGjzrr
         L1wQJa5Vguwo+OLgSOT3g7GztBPZPzDpb0CdJqt/QirCfYEsvHCdJZ7lDSBUqW8qSu
         US+ImVr79CbgmtNSqHirlHRobsAdMvp0o565RkDI=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH v9 20/36] media: entity: Add debug information in graph walk route check
Date:   Tue,  5 Oct 2021 11:57:34 +0300
Message-Id: <20211005085750.138151-21-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
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
index 4eb4b94c09e2..663773f6bb2f 100644
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

