Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A570636C651
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 14:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237756AbhD0MrB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 08:47:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45230 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237743AbhD0Mq7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 08:46:59 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E84CE1242;
        Tue, 27 Apr 2021 14:46:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619527575;
        bh=kToWsVi8/jk6eCdP3PqD2ZzFB2YJwXAYSFgcfvzOSTg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=t9OJwKa7VC5xL2B3uglwv8AE825Yrv1vtIdy4yOTqYh1uj2NxWUuRwXrqzIEDzSD7
         eqvnw0lTr361ai4DAvr58MZzak3MGOdNnsNkd9xXdrXC0CljHLuoM0e6gVkJQk+Khp
         GwVs/Ue4vn2hn3hTleeFIzdrQTPUM17MQKxCrKBM=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v6 13/24] media: entity: Add only connected pads to the pipeline
Date:   Tue, 27 Apr 2021 15:45:12 +0300
Message-Id: <20210427124523.990938-14-tomi.valkeinen@ideasonboard.com>
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
index a4cca53124b2..2b70ef97c56c 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -457,7 +457,7 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
 		DECLARE_BITMAP(active, MEDIA_ENTITY_MAX_PADS);
 		DECLARE_BITMAP(has_no_links, MEDIA_ENTITY_MAX_PADS);
 
-		media_entity_for_each_pad(entity, iter) {
+		media_entity_for_each_routed_pad(pad, iter) {
 			if (iter->pipe && iter->pipe != pipe) {
 				pr_err("Pipe active for %s. Can't start for %s\n",
 				       entity->name, iter->entity->name);
@@ -546,10 +546,9 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
 	media_graph_walk_start(graph, pad_err);
 
 	while ((pad_err = media_graph_walk_next(graph))) {
-		struct media_entity *entity = pad_err->entity;
 		struct media_pad *iter;
 
-		media_entity_for_each_pad(entity, iter) {
+		media_entity_for_each_routed_pad(pad_err, iter) {
 			/* Sanity check for negative stream_count */
 			if (!WARN_ON_ONCE(iter->stream_count <= 0)) {
 				--iter->stream_count;
@@ -602,10 +601,9 @@ void __media_pipeline_stop(struct media_pad *pad)
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

