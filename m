Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED220360A00
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 15:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233072AbhDONFo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 09:05:44 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46134 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233058AbhDONFl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 09:05:41 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A2604BA7;
        Thu, 15 Apr 2021 15:05:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618491918;
        bh=+a9z1l9zEbsj1aoDTBaqVlw+QUszzA4Zro7a3qJAyTU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ku0yhKPLYtCar6aHn5YPx4qpdXdWEhZa3hlnLCvIsH4B25dGot9wvD/Q6WPXjcVRV
         I66uoa5I2VeQO3Cp9tUMgPLgy+TXCnOgrO9eaeLXy9Orr+CD0948TtJjB28w4ErKtK
         ApeoScLqzJLWaeBpdosqmSsL3zqFlwGKxalwQOKs=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v5 11/24] media: entity: Skip link validation for pads to which there is no route to
Date:   Thu, 15 Apr 2021 16:04:37 +0300
Message-Id: <20210415130450.421168-12-tomi.valkeinen@ideasonboard.com>
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

Links are validated along the pipeline which is about to start streaming.
Not all the pads in entities that are traversed along that pipeline are
part of the pipeline, however. Skip the link validation for such pads,
and while at there rename "other_pad" to "local_pad" to convey the fact
the route to be checked is internal to the entity.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/mc/mc-entity.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 28d7fd254c77..fe6cb743c85c 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -482,12 +482,17 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
 		bitmap_fill(has_no_links, entity->num_pads);
 
 		list_for_each_entry(link, &entity->links, list) {
-			struct media_pad *other_pad =
+			struct media_pad *local_pad =
 				link->sink->entity == entity ?
 				link->sink : link->source;
 
+			/* Ignore pads to which there is no route. */
+			if (!media_entity_has_route(entity, pad->index,
+						    local_pad->index))
+				continue;
+
 			/* Mark that a pad is connected by a link. */
-			bitmap_clear(has_no_links, other_pad->index, 1);
+			bitmap_clear(has_no_links, local_pad->index, 1);
 
 			/*
 			 * Pads that either do not need to connect or
@@ -496,13 +501,13 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
 			 */
 			if (!(pad->flags & MEDIA_PAD_FL_MUST_CONNECT) ||
 			    link->flags & MEDIA_LNK_FL_ENABLED)
-				bitmap_set(active, other_pad->index, 1);
+				bitmap_set(active, local_pad->index, 1);
 
 			/*
 			 * Link validation will only take place for
 			 * sink ends of the link that are enabled.
 			 */
-			if (link->sink != other_pad ||
+			if (link->sink != local_pad ||
 			    !(link->flags & MEDIA_LNK_FL_ENABLED))
 				continue;
 
-- 
2.25.1

