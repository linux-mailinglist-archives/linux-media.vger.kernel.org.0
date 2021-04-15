Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76755360A01
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 15:05:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233076AbhDONFo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 09:05:44 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46132 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233062AbhDONFn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 09:05:43 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 718331864;
        Thu, 15 Apr 2021 15:05:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618491919;
        bh=dh8RmCXlStCWlEEewZrKk8BUf0qb1/ON/fMrY3/iTZ8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZaFKWR8eYxrparMNGqmKvyKj+74Rw+BtgkrEZSfcOBKjFkZVbQ221+kmvn/HonzIW
         5ziNquCR5FR/fAzmUIU1aTbj+zZYarSKIpF/y8b6VQlxG6sx+WctRw2gF80gGkV2mp
         LqXKw/xr8IT/ZfixlZIsLnaIfecqQ1KBuD1kXBgI=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v5 12/24] media: entity: Add an iterator helper for connected pads
Date:   Thu, 15 Apr 2021 16:04:38 +0300
Message-Id: <20210415130450.421168-13-tomi.valkeinen@ideasonboard.com>
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

Add a helper macro for iterating over pads that are connected through
enabled routes. This can be used to find all the connected pads within an
entity, for instance starting from the pad which has been obtained during
the graph walk.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

- Make __media_entity_next_routed_pad() return NULL and adjust the
  iterator to handle that
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 include/media/media-entity.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 73de1c335e4e..edd6f60ed6b4 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -916,6 +916,33 @@ __must_check int media_graph_walk_init(
 bool media_entity_has_route(struct media_entity *entity, unsigned int pad0,
 			    unsigned int pad1);
 
+static inline struct media_pad *__media_entity_next_routed_pad(
+	struct media_pad *start, struct media_pad *iter)
+{
+	struct media_entity *entity = start->entity;
+
+	for (; iter < &entity->pads[entity->num_pads]; iter++)
+		if (media_entity_has_route(entity, start->index, iter->index))
+			return iter;
+
+	return NULL;
+}
+
+/**
+ * media_entity_for_each_routed_pad - Iterate over entity pads connected by routes
+ *
+ * @start: The stating pad
+ * @iter: The iterator pad
+ *
+ * Iterate over all pads connected through routes from a given pad
+ * within an entity. The iteration will include the starting pad itself.
+ */
+#define media_entity_for_each_routed_pad(start, iter)			\
+	for (iter = __media_entity_next_routed_pad(			\
+		     start, (start)->entity->pads);			\
+	     iter != NULL;						\
+	     iter = __media_entity_next_routed_pad(start, iter + 1))
+
 /**
  * media_graph_walk_cleanup - Release resources used by graph walk.
  *
-- 
2.25.1

