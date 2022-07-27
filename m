Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5944582482
	for <lists+linux-media@lfdr.de>; Wed, 27 Jul 2022 12:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231998AbiG0KhT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jul 2022 06:37:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231991AbiG0KhS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jul 2022 06:37:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07BD2474C2
        for <linux-media@vger.kernel.org>; Wed, 27 Jul 2022 03:37:17 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FEC0A49;
        Wed, 27 Jul 2022 12:37:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658918228;
        bh=qTu/zC06xNtQ02E++Fh4mR+JNACiZCSshchY2GjqWl4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pavI2GQ75W+VlkJBoULXuFoBEosdvyngkQsefQa+gRKe0C82lFzTL+CfdP7XSbL5p
         BpWyVjxsmkCc1Av5y6jbgycW0vWLYDx4UHHcuJybWaDl0wOiGCgrFHzKUUa60RXaMB
         lW+YzYtwtkrBSlne0BsBjZzzo9auDczXRbYTINUw=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v12 14/30] media: subdev: add v4l2_subdev_has_route()
Date:   Wed, 27 Jul 2022 13:36:23 +0300
Message-Id: <20220727103639.581567-15-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
index 7badd693f36c..befd00ebf381 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1041,6 +1041,37 @@ int v4l2_subdev_link_validate(struct media_link *link)
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
+	state = v4l2_subdev_lock_and_get_active_state(sd);
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
index a683d911e44c..decd1e1c3d39 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1231,6 +1231,22 @@ int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
  */
 int v4l2_subdev_link_validate(struct media_link *link);
 
+/**
+ * v4l2_subdev_has_route - MC has_route implementation for subdevs
+ *
+ * @entity: pointer to &struct media_entity
+ * @pad0: pad number for the first pad
+ * @pad1: pad number for the second pad
+ *
+ * This function is an implementation of the media_entity_operations.has_route
+ * operation for subdevs that implement the multiplexed streams API (as
+ * indicated by the V4L2_SUBDEV_FL_STREAMS subdev flag).
+ *
+ * It returns true if any active route exists between pad0 and pad1.
+ */
+bool v4l2_subdev_has_route(struct media_entity *entity, unsigned int pad0,
+			   unsigned int pad1);
+
 /**
  * __v4l2_subdev_state_alloc - allocate v4l2_subdev_state
  *
-- 
2.34.1

