Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F40254C8FDA
	for <lists+linux-media@lfdr.de>; Tue,  1 Mar 2022 17:13:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236065AbiCAQNk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Mar 2022 11:13:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236050AbiCAQNg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Mar 2022 11:13:36 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD44A3D4B4
        for <linux-media@vger.kernel.org>; Tue,  1 Mar 2022 08:12:54 -0800 (PST)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE16FA67;
        Tue,  1 Mar 2022 17:12:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646151160;
        bh=tq5OZyvZHYJPo5sPST93B3zrXPdDwkyajX2EPMPm3Ak=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VcfWWZ99jksK7GoUJb05tKpoRYQfmgOcWhj6ap0R01XWrFpi0H8DmbpAY2c3h+kbs
         RdhsTQC1/9jOelnBWs8c5eGTnBjfMha+5pAAHGgGXiXaGozQEBDEJLOQtmk68jw/PA
         ztutnDLMYxCQXsjvRSmyb5OUvnxvloJgu2fbgOVg=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v11 23/36] media: subdev: add v4l2_subdev_has_route()
Date:   Tue,  1 Mar 2022 18:11:43 +0200
Message-Id: <20220301161156.1119557-24-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
References: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
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

Add a v4l2_subdev_has_route() helper function which can be used for
media_entity_operations.has_route op.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 31 +++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 16 ++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 89c97bde4575..d3047b932142 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -994,6 +994,37 @@ int v4l2_subdev_link_validate(struct media_link *link)
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
index 2630bb4c0459..2a6880c71028 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1224,6 +1224,22 @@ int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
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

