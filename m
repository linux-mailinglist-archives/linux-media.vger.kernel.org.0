Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4917C422177
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 10:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233593AbhJEJA0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 05:00:26 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60822 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233554AbhJEJAW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 05:00:22 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC7BF1516;
        Tue,  5 Oct 2021 10:58:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633424311;
        bh=YHZvmeGd5HTtm5USFRz0/NGI/WH25omht+wndPg3R+0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D1nIPDC8gzVwZK5e9KYITdRvNTw78J52nXWFm9F+kcFIWtyu4tkh7ckHI795jIYvL
         vmvwXJZXVQvUyVupvxni1kBMBVmT7HcLNiJ2j5/LMhqSBY7p1HGm1hk83RUND2FF6V
         a8vnkfhU5CtiVG46pbZ0FLkV7Vv05sc5IrGi67j0=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH v9 19/36] media: entity: Add only connected pads to the pipeline
Date:   Tue,  5 Oct 2021 11:57:33 +0300
Message-Id: <20211005085750.138151-20-tomi.valkeinen@ideasonboard.com>
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

A single entity may contain multiple pipelines. Only add pads that were
connected to the pad through which the entity was reached to the pipeline.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 072f017b399a..4eb4b94c09e2 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -474,7 +474,7 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
 
 		ret = 0;
 
-		media_entity_for_each_pad(entity, iter) {
+		media_entity_for_each_routed_pad(pad, iter) {
 			if (iter->pipe && iter->pipe != pipe) {
 				pr_err("Pipe active for %s. Can't start for %s\n",
 				       entity->name, iter->entity->name);
@@ -563,10 +563,9 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
 	media_graph_walk_start(graph, pad_err);
 
 	while ((pad_err = media_graph_walk_next(graph))) {
-		struct media_entity *entity = pad_err->entity;
 		struct media_pad *iter;
 
-		media_entity_for_each_pad(entity, iter) {
+		media_entity_for_each_routed_pad(pad_err, iter) {
 			/* Sanity check for negative stream_count */
 			if (!WARN_ON_ONCE(iter->stream_count <= 0)) {
 				--iter->stream_count;
@@ -619,10 +618,9 @@ void __media_pipeline_stop(struct media_pad *pad)
 	media_graph_walk_start(graph, pad);
 
 	while ((pad = media_graph_walk_next(graph))) {
-		struct media_entity *entity = pad->entity;
 		struct media_pad *iter;
 
-		media_entity_for_each_pad(entity, iter) {
+		media_entity_for_each_routed_pad(pad, iter) {
 			/* Sanity check for negative stream_count */
 			if (!WARN_ON_ONCE(iter->stream_count <= 0)) {
 				iter->stream_count--;
-- 
2.25.1

