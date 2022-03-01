Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DB394C8FE0
	for <lists+linux-media@lfdr.de>; Tue,  1 Mar 2022 17:13:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236066AbiCAQNs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Mar 2022 11:13:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232311AbiCAQNq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Mar 2022 11:13:46 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9927C3D4BB
        for <linux-media@vger.kernel.org>; Tue,  1 Mar 2022 08:13:05 -0800 (PST)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7BC6D37D5;
        Tue,  1 Mar 2022 17:12:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646151167;
        bh=8Xiw+EyT/bbexITOxcMHXnGGf5YAJrqF6kdWtt/GxX0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HOxcvJh9lP9EhwCc8uStTX2VqQyoVZIiY4YJFJZTguNysle63znZWIZBrS92tNV6M
         ZzifgJ8CHrF2hw8v+yiDpy7jZFpstcTCsphQwZPB/615lL8DZ8+q+MnmJ6CE/IHNe1
         5T5wTGmOYDjw73v7Jj+9j2FiwTHI04O5u8bpyqic=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v11 31/36] media: subdev: add v4l2_subdev_set_routing_with_fmt() helper
Date:   Tue,  1 Mar 2022 18:11:51 +0200
Message-Id: <20220301161156.1119557-32-tomi.valkeinen@ideasonboard.com>
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

v4l2_subdev_set_routing_with_fmt() is the same as
v4l2_subdev_set_routing(), but additionally initializes all the streams
with the given format.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 22 ++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 16 ++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 7f50871054cd..1ceee8313246 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1438,6 +1438,28 @@ int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing);
 
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
index a80830801a7f..97db6dfc0b7a 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1430,6 +1430,22 @@ int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_state *state,
 			    struct v4l2_subdev_krouting *routing);
 
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
2.25.1

