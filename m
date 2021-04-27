Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBAAF36C64F
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 14:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237609AbhD0MrA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 08:47:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237579AbhD0Mq6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 08:46:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34142C061756
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 05:46:15 -0700 (PDT)
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E5BF1173;
        Tue, 27 Apr 2021 14:46:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619527573;
        bh=oYdLoBEknIu3Znlf9wPdW/fstDDLulVV4SYlfAd+sHk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XvH3zJJy9Iu+xsdSUhYB7v4oEdfZqGtjlJDyEGE5TaMMjzCgBI8WoLflPg+1tsyKG
         ltF9xiQ/dDUtpF5v/tWJyhX7QOsz/RcncACoHTn3jt0Fl+nq5xDblF0wQt05IjcsBj
         77ynWiPE8/cWv7Qg11SA8PXw9+HYx+QwXyQlaViY=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v6 11/24] media: entity: Skip link validation for pads to which there is no route to
Date:   Tue, 27 Apr 2021 15:45:10 +0300
Message-Id: <20210427124523.990938-12-tomi.valkeinen@ideasonboard.com>
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

Links are validated along the pipeline which is about to start streaming.
Not all the pads in entities that are traversed along that pipeline are
part of the pipeline, however. Skip the link validation for such pads,
and while at there rename "other_pad" to "local_pad" to convey the fact
the route to be checked is internal to the entity.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index d00c7397e09a..a4cca53124b2 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -482,27 +482,32 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
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
 			 * are connected through an enabled link are
 			 * fine.
 			 */
-			if (!(other_pad->flags & MEDIA_PAD_FL_MUST_CONNECT) ||
+			if (!(local_pad->flags & MEDIA_PAD_FL_MUST_CONNECT) ||
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

