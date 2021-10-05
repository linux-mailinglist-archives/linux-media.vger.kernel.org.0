Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87118422187
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 10:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233635AbhJEJAh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 05:00:37 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60730 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233669AbhJEJAf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 05:00:35 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECF291172;
        Tue,  5 Oct 2021 10:58:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633424324;
        bh=8+WEp0gHOjyfCkPh1lS1PFfiEn6ycfkGCKcd7f4Qp4c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=k/XOAeNc6ehlHhs9+C7xud7Nn6fQNDTSNxfiNkeCMqwKPeu0UaRW5QLXJEkIGlZAp
         Iv2+L1H+sgk+Hd42ksFbuSaxyIkjRS1g0Mk5Bn59fHxX95yCOEcUztyheAIHqLAxoq
         9yOXcKI92ZZGLB7Uut4PGSGZzr82QN7IZJIDmhks=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH v9 34/36] media: subdev: add v4l2_subdev_get_fmt() helper function
Date:   Tue,  5 Oct 2021 11:57:48 +0300
Message-Id: <20211005085750.138151-35-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
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
index 9eeadad997c8..d402ffeef560 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1526,3 +1526,24 @@ v4l2_state_get_opposite_stream_format(struct v4l2_subdev_state *state, u32 pad,
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
index 4b9520410783..04fca595aa91 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1532,5 +1532,21 @@ int v4l2_state_find_opposite_end(struct v4l2_subdev_krouting *routing, u32 pad,
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

