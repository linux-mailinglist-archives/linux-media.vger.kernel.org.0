Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7BE938E45A
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 12:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232690AbhEXKqO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 06:46:14 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60914 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232679AbhEXKqG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 06:46:06 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57F68140C;
        Mon, 24 May 2021 12:44:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621853078;
        bh=VyadD48nYm74/kLPqNEKdNAFtkZjPEKr4GPvXjEaCLE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TjRi6AnmEKGRsy67HZHpRq9rW7+ISLYoLn87loyjN0SBH4GJeA/kEGhvpkxJjCYmG
         2yYnPMerLYIxnE8rOD5yFVPetWSkjOrAakPNDU1e+f9x6Ggn/EnWagwrNJB06TyFd3
         qs3b2slpdFYjHzzxinq0KAMRmSCzpq1UxeDyeB9c=
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
Subject: [PATCH v7 13/27] media: entity: Add only connected pads to the pipeline
Date:   Mon, 24 May 2021 13:43:54 +0300
Message-Id: <20210524104408.599645-14-tomi.valkeinen@ideasonboard.com>
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
index 71dd14dd6c4d..e2aa14ac8000 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -472,7 +472,7 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
 		DECLARE_BITMAP(active, MEDIA_ENTITY_MAX_PADS);
 		DECLARE_BITMAP(has_no_links, MEDIA_ENTITY_MAX_PADS);
 
-		media_entity_for_each_pad(entity, iter) {
+		media_entity_for_each_routed_pad(pad, iter) {
 			if (iter->pipe && iter->pipe != pipe) {
 				pr_err("Pipe active for %s. Can't start for %s\n",
 				       entity->name, iter->entity->name);
@@ -561,10 +561,9 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
 	media_graph_walk_start(graph, pad_err);
 
 	while ((pad_err = media_graph_walk_next(graph))) {
-		struct media_entity *entity = pad_err->entity;
 		struct media_pad *iter;
 
-		media_entity_for_each_pad(entity, iter) {
+		media_entity_for_each_routed_pad(pad_err, iter) {
 			/* Sanity check for negative stream_count */
 			if (!WARN_ON_ONCE(iter->stream_count <= 0)) {
 				--iter->stream_count;
@@ -617,10 +616,9 @@ void __media_pipeline_stop(struct media_pad *pad)
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

