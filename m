Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C134B58EBC7
	for <lists+linux-media@lfdr.de>; Wed, 10 Aug 2022 14:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232202AbiHJMMZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Aug 2022 08:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232192AbiHJMMY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Aug 2022 08:12:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79E176AA19
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 05:12:23 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3BB8946FD;
        Wed, 10 Aug 2022 14:11:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1660133516;
        bh=dxW4wy2iw3CWFmP/i3H4FpO6+vtU1Lfdu1qCuyJugdA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qn4x93WhNg6EwVbi17iwrOslNOb+UU6LIxHRs1qHV2umSeGI4bxQ/mOyNfIgy3rdq
         TQq3QbeLEinWyMzRoTcKatO+a07GS2zeokGCDdvyS5Qkjja15eFI4DNrS9fIoXYb68
         x3VtbZFhA17ORr1++iIjqQLm9BafrVZaHKQ+cE8Y=
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
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v13 29/34] media: subdev: add v4l2_subdev_set_routing_with_fmt() helper
Date:   Wed, 10 Aug 2022 15:11:17 +0300
Message-Id: <20220810121122.3149086-30-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220810121122.3149086-1-tomi.valkeinen@ideasonboard.com>
References: <20220810121122.3149086-1-tomi.valkeinen@ideasonboard.com>
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

v4l2_subdev_set_routing_with_fmt() is the same as
v4l2_subdev_set_routing(), but additionally initializes all the streams
with the given format.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 22 ++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 16 ++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 76788798e976..92a3142fcf23 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1511,6 +1511,28 @@ __v4l2_subdev_next_active_route(const struct v4l2_subdev_krouting *routing,
 }
 EXPORT_SYMBOL_GPL(__v4l2_subdev_next_active_route);
 
+int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state,
+				     struct v4l2_subdev_krouting *routing,
+				     const struct v4l2_mbus_framefmt *fmt)
+{
+	struct v4l2_subdev_stream_configs *stream_configs;
+	unsigned int i;
+	int ret;
+
+	ret = v4l2_subdev_set_routing(sd, state, routing);
+	if (ret)
+		return ret;
+
+	stream_configs = &state->stream_configs;
+
+	for (i = 0; i < stream_configs->num_configs; ++i)
+		stream_configs->configs[i].fmt = *fmt;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing_with_fmt);
+
 struct v4l2_mbus_framefmt *
 v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
 				    unsigned int pad, u32 stream)
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index a57a866cdcfe..cacc56ee3ee6 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1474,6 +1474,22 @@ __v4l2_subdev_next_active_route(const struct v4l2_subdev_krouting *routing,
 	for ((route) = NULL;                  \
 	     ((route) = __v4l2_subdev_next_active_route((routing), (route)));)
 
+/**
+ * v4l2_subdev_set_routing_with_fmt() - Set given routing and format to subdev
+ *					state
+ * @sd: The subdevice
+ * @state: The subdevice state
+ * @routing: Routing that will be copied to subdev state
+ * @fmt: Format used to initialize all the streams
+ *
+ * This is the same as v4l2_subdev_set_routing, but additionally initializes
+ * all the streams using the given format.
+ */
+int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state,
+				     struct v4l2_subdev_krouting *routing,
+				     const struct v4l2_mbus_framefmt *fmt);
+
 /**
  * v4l2_subdev_state_get_stream_format() - Get pointer to a stream format
  * @state: subdevice state
-- 
2.34.1

