Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4724463672
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 15:17:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242158AbhK3OUe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 09:20:34 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41004 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242119AbhK3OUR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 09:20:17 -0500
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A47CA1447;
        Tue, 30 Nov 2021 15:16:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638281816;
        bh=6LNbMQ04/egIeWSSZSVLK/Is8Ldo3yuT/R6Zpf9o0J0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=b1Dk2ZY+civygkdORSVYAqByL3O67qY1D5Py/dNWssQg3smBiAyz1RUArfsCAFqbG
         BMu6LvFRrJj7xeSuY31zgeA2m5GbjVTkW4LnRqqmmZTQhafAvLHCWt31orfEDtcM//
         lMGU2Optb8D3LVBkL2lMeHse7PoUgWnLEkc+z3rI=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v10 29/38] media: subdev: add v4l2_subdev_has_route()
Date:   Tue, 30 Nov 2021 16:15:27 +0200
Message-Id: <20211130141536.891878-30-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a v4l2_subdev_has_route() helper function which can be used for
media_entity_operations.has_route op.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 31 +++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 16 ++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 06e234e0aa98..67f3c14d7398 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1000,6 +1000,37 @@ int v4l2_subdev_link_validate(struct media_link *link)
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate);
 
+bool v4l2_subdev_has_route(struct media_entity *entity, unsigned int pad0,
+			   unsigned int pad1)
+{
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
+	struct v4l2_subdev_krouting *routing;
+	unsigned int i;
+	struct v4l2_subdev_state *state;
+
+	state = v4l2_subdev_lock_active_state(sd);
+
+	routing = &state->routing;
+
+	for (i = 0; i < routing->num_routes; ++i) {
+		struct v4l2_subdev_route *route = &routing->routes[i];
+
+		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
+			continue;
+
+		if ((route->sink_pad == pad0 && route->source_pad == pad1) ||
+		    (route->source_pad == pad0 && route->sink_pad == pad1)) {
+			v4l2_subdev_unlock_state(state);
+			return true;
+		}
+	}
+
+	v4l2_subdev_unlock_state(state);
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_has_route);
+
 struct v4l2_subdev_state *
 __v4l2_subdev_state_alloc(struct v4l2_subdev *sd, const char *lock_name,
 			  struct lock_class_key *lock_key)
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 946455cc1f01..350ee4d9600f 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1230,6 +1230,22 @@ int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
  */
 int v4l2_subdev_link_validate(struct media_link *link);
 
+/**
+ * v4l2_subdev_has_route - MC has_route implementation for subdevs
+ *
+ * @entity: pointer to &struct media_entity
+ * @pad0: pad number for the first pad
+ * @pad1: pad number for the second pad
+ *
+ * This function looks at the routing in subdev's active state and returns if
+ * there is a route connecting pad0 and pad1.
+ *
+ * This function can be used as implementation for
+ * media_entity_operations.has_route.
+ */
+bool v4l2_subdev_has_route(struct media_entity *entity, unsigned int pad0,
+			   unsigned int pad1);
+
 /**
  * __v4l2_subdev_state_alloc - allocate v4l2_subdev_state
  *
-- 
2.25.1

