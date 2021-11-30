Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27604463677
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 15:17:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242176AbhK3OUi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 09:20:38 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41006 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242135AbhK3OUU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 09:20:20 -0500
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3C68914E2;
        Tue, 30 Nov 2021 15:17:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638281820;
        bh=4JS8wRzPjPCqqdwGVJkHyu/WeAz1mP9iM1s21wt0eWo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jN7MtUDnE41UpR+J2HHus4GrhpOt0Q17OtYzhCoNUVsKZUyYtbiXu5+2lYAEO1FHL
         ZiEPVCUFYDExdrhssJVCK8C4PV3khs3OJ5iqkmxgBzI+ml4no86Elm6sZfLnuG1cMf
         Pvsj05cW3+Aiih8GR0oj8ImloU1OS6C5OUf4E6A8=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v10 35/38] media: subdev: add v4l2_subdev_get_fmt() helper function
Date:   Tue, 30 Nov 2021 16:15:33 +0200
Message-Id: <20211130141536.891878-36-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
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
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 21 +++++++++++++++++++++
 include/media/v4l2-subdev.h           | 17 +++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 13a092442cd4..8469c56ae870 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1536,3 +1536,24 @@ v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
 	return v4l2_state_get_stream_format(state, other_pad, other_stream);
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_opposite_stream_format);
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
index b1761da83533..65c62a889f6c 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1539,4 +1539,21 @@ struct v4l2_mbus_framefmt *
 v4l2_subdev_state_get_opposite_stream_format(struct v4l2_subdev_state *state,
 					     u32 pad, u32 stream);
 
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
+
 #endif
-- 
2.25.1

