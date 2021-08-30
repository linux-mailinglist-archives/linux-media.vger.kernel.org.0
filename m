Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 859973FB454
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 13:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236520AbhH3LDo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 07:03:44 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43936 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236528AbhH3LDf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 07:03:35 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E869D247A;
        Mon, 30 Aug 2021 13:02:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630321361;
        bh=eTbgt48ZKsQVDu9dp3vDLrw482Oirbwsxmw2HvheeUg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gTaMG0JQcIpO5LVl8rN8iEqxgJ3iKcnXO/t4dXKt50oE+hPE2Ufn02ejYqaM+JH+E
         L5UixDx5uy7K3uVUcn5KfIQCsslM0hwqDxnAvnsotR6tET2f+GXABhvKhFoFRCFmpD
         oc47Wv/ycJabVAhbNRJjssTM+VnbvXzWyHPOqWnk=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v8 35/36] media: subdev: add v4l2_subdev_set_routing_with_fmt() helper
Date:   Mon, 30 Aug 2021 14:01:15 +0300
Message-Id: <20210830110116.488338-36-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v4l2_subdev_set_routing_with_fmt() is the same as
v4l2_subdev_set_routing(), but additionally initializes all the streams
with the given format.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 22 ++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 15 +++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index df3e376e439c..83fa87e88bce 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1467,6 +1467,28 @@ int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
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
 v4l2_state_get_stream_format(struct v4l2_subdev_state *state, unsigned int pad,
 			     u32 stream)
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index c3e859077557..3f72c500ff6e 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1485,6 +1485,21 @@ int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_state *state,
 			    struct v4l2_subdev_krouting *routing);
 
+/**
+ * v4l2_subdev_set_routing_with_fmt() - Set given routing and format to subdev state
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
  * v4l2_state_get_stream_format() - Get pointer to a stream format
  * @state: subdevice state
-- 
2.25.1

