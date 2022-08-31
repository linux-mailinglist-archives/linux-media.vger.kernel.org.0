Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB93F5A7FE0
	for <lists+linux-media@lfdr.de>; Wed, 31 Aug 2022 16:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232112AbiHaOQ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Aug 2022 10:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232145AbiHaOQA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Aug 2022 10:16:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 518C370E45
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 07:15:26 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F0BA82D1F;
        Wed, 31 Aug 2022 16:14:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661955273;
        bh=9hrpt+sZa6ji42yLKgt41CLifp1cCBhca2JHoJHybsw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NJVPKVi0Rjn8Smyc4m2A79wUw15Cws0zaoMqybxqA3bslQxxo+JliI8HtKQepyKfw
         QdeWkMpRKhUnw3Wm7TZCXG5EgkGDgrHKPANGOYT8VIbEbYSiBURZAPPxCyPdI8DvcG
         mEmj/0Y/EDSBcnF4pxZKAuL4OA+g2a8mJ1h96VLc=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v14 21/34] media: subdev: add v4l2_subdev_has_pad_interdep()
Date:   Wed, 31 Aug 2022 17:13:44 +0300
Message-Id: <20220831141357.1396081-22-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
References: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a v4l2_subdev_has_pad_interdep() helper function which can be used
for media_entity_operations.has_pad_interdep op.

It considers two pads interdependent if there is an active route between
pad0 and pad1.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 31 +++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 17 +++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index af1f53d99507..1ce9a7dc0c6e 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1045,6 +1045,37 @@ int v4l2_subdev_link_validate(struct media_link *link)
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate);
 
+bool v4l2_subdev_has_pad_interdep(struct media_entity *entity,
+				  unsigned int pad0, unsigned int pad1)
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
+EXPORT_SYMBOL_GPL(v4l2_subdev_has_pad_interdep);
+
 struct v4l2_subdev_state *
 __v4l2_subdev_state_alloc(struct v4l2_subdev *sd, const char *lock_name,
 			  struct lock_class_key *lock_key)
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index f38943932cfe..2d1509556ce0 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1235,6 +1235,23 @@ int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
  */
 int v4l2_subdev_link_validate(struct media_link *link);
 
+/**
+ * v4l2_subdev_has_pad_interdep - MC has_pad_interdep implementation for subdevs
+ *
+ * @entity: pointer to &struct media_entity
+ * @pad0: pad number for the first pad
+ * @pad1: pad number for the second pad
+ *
+ * This function is an implementation of the media_entity_operations.has_pad_interdep
+ * operation for subdevs that implement the multiplexed streams API (as
+ * indicated by the V4L2_SUBDEV_FL_STREAMS subdev flag).
+ *
+ * It considers two pads interdependent if there is an active route between pad0
+ * and pad1.
+ */
+bool v4l2_subdev_has_pad_interdep(struct media_entity *entity,
+				  unsigned int pad0, unsigned int pad1);
+
 /**
  * __v4l2_subdev_state_alloc - allocate v4l2_subdev_state
  *
-- 
2.34.1

