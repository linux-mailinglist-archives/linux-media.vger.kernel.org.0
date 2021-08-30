Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C9793FB453
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 13:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236538AbhH3LDn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 07:03:43 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43892 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236523AbhH3LDe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 07:03:34 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 060192461;
        Mon, 30 Aug 2021 13:02:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630321360;
        bh=aUvCtcu2NZ4hs6j01pjqnkMqos5HeUeCNC8yv+lkiao=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pdNcRpwWBbBLduYFnFcDNYt+jX+fcE5gRpPjh1HBv3ULUUyIv6oxx5GCi1x4NMkqT
         ppFKyBUTJO+tUgaDjFvb3VsDV+A2t4EDts4oeRoPg2wkHMR2nzaMH52X7Diy9ov5GY
         5mLfw0niBah5j19B92cmgjPQWTvwEjUEGSVLnYEw=
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
Subject: [PATCH v8 34/36] media: subdev: add v4l2_subdev_get_fmt() helper function
Date:   Mon, 30 Aug 2021 14:01:14 +0300
Message-Id: <20210830110116.488338-35-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add v4l2_subdev_get_fmt() helper function which implements
v4l2_subdev_pad_ops.get_fmt using streams. Subdev drivers that do not
need to do anything special in their get_fmt op can use this helper
directly for v4l2_subdev_pad_ops.get_fmt.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 21 +++++++++++++++++++++
 include/media/v4l2-subdev.h           | 16 ++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 68db3f23c256..df3e376e439c 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1529,3 +1529,24 @@ v4l2_state_get_opposite_stream_format(struct v4l2_subdev_state *state, u32 pad,
 	return v4l2_state_get_stream_format(state, other_pad, other_stream);
 }
 EXPORT_SYMBOL_GPL(v4l2_state_get_opposite_stream_format);
+
+int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
+			struct v4l2_subdev_format *format)
+{
+	struct v4l2_mbus_framefmt *fmt;
+
+	v4l2_subdev_lock_state(state);
+
+	fmt = v4l2_state_get_stream_format(state, format->pad, format->stream);
+	if (!fmt) {
+		v4l2_subdev_unlock_state(state);
+		return -EINVAL;
+	}
+
+	format->format = *fmt;
+
+	v4l2_subdev_unlock_state(state);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_get_fmt);
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index bc69123f71cb..c3e859077557 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1530,5 +1530,21 @@ int v4l2_state_find_opposite_end(struct v4l2_subdev_krouting *routing, u32 pad,
 struct v4l2_mbus_framefmt *
 v4l2_state_get_opposite_stream_format(struct v4l2_subdev_state *state, u32 pad,
 				      u32 stream);
+/**
+ * v4l2_subdev_get_fmt() - Fill format based on state
+ * @sd: subdevice
+ * @state: subdevice state
+ * @format: pointer to &struct v4l2_subdev_format
+ *
+ * Fill @format based on the pad and stream given in the @format struct.
+ *
+ * This function can be used by the subdev drivers to implement
+ * v4l2_subdev_pad_ops.get_fmt if the subdev driver does not need to do
+ * anything special in their get_fmt op.
+ *
+ * Returns 0 on success, error value otherwise.
+ */
+int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
+			struct v4l2_subdev_format *format);
 
 #endif
-- 
2.25.1

