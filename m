Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA0A536C6EA
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 15:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236001AbhD0NVV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 09:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236399AbhD0NVU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 09:21:20 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3E53C061574
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 06:20:37 -0700 (PDT)
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE59DD3C;
        Tue, 27 Apr 2021 15:20:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619529635;
        bh=JeZ7zqMuPrhcObhpMlvxKZ06WjgSPA99NBaS/vg9mSY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Es+wNOh9aNZgHJoNlffI6OaD5XOna3CpEd21zSdmzDLNOzI6+T2NM498E+7igp+O5
         7BjmzVxvLZZVqY5OqyrhgxxIG9vDwZRSMy+AgPt4orfm559OVxpyY2L2VU1zv4RPSm
         bv32KCQ8ZbkmI6frZa0u6yUU7VNN89JJlvqjCIlM=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 3/4] media: ti-vpe: cal: add routing support
Date:   Tue, 27 Apr 2021 16:20:27 +0300
Message-Id: <20210427132028.1005757-4-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210427132028.1005757-1-tomi.valkeinen@ideasonboard.com>
References: <20210427132028.1005757-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add routing support. As we still only support a single stream (i.e. a
single route), the routing is not really used for anything yet.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-camerarx.c | 64 ++++++++++++++++++++
 drivers/media/platform/ti-vpe/cal.h          |  2 +
 2 files changed, 66 insertions(+)

diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index 36103f5af6e9..3470f6dc0ec1 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -805,6 +805,37 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int cal_camerarx_sd_get_routing(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_krouting *routing)
+{
+	struct cal_camerarx *phy = to_cal_camerarx(sd);
+	struct v4l2_subdev_krouting *src;
+
+	src = &phy->routing;
+
+	if (routing->num_routes < src->num_routes) {
+		routing->num_routes = src->num_routes;
+		return -ENOSPC;
+	}
+
+	v4l2_subdev_cpy_routing(routing, src);
+
+	return 0;
+}
+
+static int cal_camerarx_sd_set_routing(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_krouting *routing)
+{
+	struct cal_camerarx *phy = to_cal_camerarx(sd);
+	int ret;
+
+	ret = v4l2_subdev_dup_routing(&phy->routing, routing);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int cal_camerarx_sd_init_cfg(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_pad_config *cfg)
 {
@@ -837,6 +868,8 @@ static const struct v4l2_subdev_pad_ops cal_camerarx_pad_ops = {
 	.enum_frame_size = cal_camerarx_sd_enum_frame_size,
 	.get_fmt = cal_camerarx_sd_get_fmt,
 	.set_fmt = cal_camerarx_sd_set_fmt,
+	.get_routing = cal_camerarx_sd_get_routing,
+	.set_routing = cal_camerarx_sd_set_routing,
 };
 
 static const struct v4l2_subdev_ops cal_camerarx_subdev_ops = {
@@ -844,8 +877,18 @@ static const struct v4l2_subdev_ops cal_camerarx_subdev_ops = {
 	.pad = &cal_camerarx_pad_ops,
 };
 
+static bool cal_camerarx_has_route(struct media_entity *entity, unsigned int pad0,
+			  unsigned int pad1)
+{
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
+	struct cal_camerarx *phy = to_cal_camerarx(sd);
+
+	return v4l2_subdev_has_route(&phy->routing, pad0, pad1);
+}
+
 static struct media_entity_operations cal_camerarx_media_ops = {
 	.link_validate = v4l2_subdev_link_validate,
+	.has_route = cal_camerarx_has_route,
 };
 
 /* ------------------------------------------------------------------
@@ -862,6 +905,20 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 	int ret;
 	unsigned int i;
 
+	struct v4l2_subdev_route routes[] = { {
+		.sink_pad = 0,
+		.sink_stream = 0,
+		.source_pad = 1,
+		.source_stream = 0,
+		.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+	} };
+
+	struct v4l2_subdev_krouting routing = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.num_routes = 1,
+		.routes = routes,
+	};
+
 	phy = kzalloc(sizeof(*phy), GFP_KERNEL);
 	if (!phy)
 		return ERR_PTR(-ENOMEM);
@@ -914,6 +971,11 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 	if (ret)
 		goto error;
 
+	/* Initialize routing to single route to the fist source pad */
+	ret = cal_camerarx_sd_set_routing(sd, &routing);
+	if (ret)
+		goto error;
+
 	ret = v4l2_device_register_subdev(&cal->v4l2_dev, sd);
 	if (ret)
 		goto error;
@@ -921,6 +983,7 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 	return phy;
 
 error:
+	v4l2_subdev_free_routing(&phy->routing);
 	media_entity_cleanup(&phy->subdev.entity);
 	kfree(phy);
 	return ERR_PTR(ret);
@@ -932,6 +995,7 @@ void cal_camerarx_destroy(struct cal_camerarx *phy)
 		return;
 
 	v4l2_device_unregister_subdev(&phy->subdev);
+	v4l2_subdev_free_routing(&phy->routing);
 	media_entity_cleanup(&phy->subdev.entity);
 	of_node_put(phy->source_ep_node);
 	of_node_put(phy->source_node);
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index 3aea444f8bf8..c96364eb0930 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -184,6 +184,8 @@ struct cal_camerarx {
 	struct mutex		mutex;
 
 	unsigned int enable_count;
+
+	struct v4l2_subdev_krouting routing;
 };
 
 struct cal_dev {
-- 
2.25.1

