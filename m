Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 004CF4F793F
	for <lists+linux-media@lfdr.de>; Thu,  7 Apr 2022 10:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242706AbiDGIRR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Apr 2022 04:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233081AbiDGIRN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Apr 2022 04:17:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6B8A1E7440
        for <linux-media@vger.kernel.org>; Thu,  7 Apr 2022 01:15:13 -0700 (PDT)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 731B9D88;
        Thu,  7 Apr 2022 10:15:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1649319309;
        bh=cKkpSY/NCL5VHJyOKbYFsczYfMA8KhWdwv/Tny9V79c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QhIt1gyZPNBKc6sVeLFu0FrOr7jsjTbuabBjz9Xuo0UjbWAVM2cBr4S2C2KDotwY/
         zGfvmLONerYpo9o8wipnP0xG585cyZdwK1q/AX8kkXoIt04kVyKwohd+UmMxRxvd+T
         cl4YGMYl6SUijqLGV0Sq4TvoiU9Z+q9m2sPqu/d8=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v7 6/8] media: subdev: add locking wrappers to subdev op wrappers
Date:   Thu,  7 Apr 2022 11:14:22 +0300
Message-Id: <20220407081424.295870-7-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407081424.295870-1-tomi.valkeinen@ideasonboard.com>
References: <20220407081424.295870-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_FILL_THIS_FORM_SHORT,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It is common that media drivers call subdev ops in source subdevs, and
pass NULL as the state. This was the way to indicate that the callee
should use the callee's private active state.

E.g.:

v4l2_subdev_call(priv->source_sd, pad, get_fmt, NULL, &sd_fmt);

Now that we have a real subdev active state in the v4l2_subdev struct,
we want the caller to pass a proper state (when available). And
furthermore, the state should be locked.

This would mean changing all the callers, which is the long term goal.

To fix this issue in the short term, let's add an extra wrapper layer to
all v4l2_subdev_call_pad_wrappers which deal with states. These wrappers
handle the state == NULL case by using the locked active state instead
(when available).

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 42 ++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 824424f0a741..d8d1c9ef4dc4 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -319,14 +319,42 @@ static int call_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
 	       sd->ops->pad->get_mbus_config(sd, pad, config);
 }
 
+/*
+ * Create state-management wrapper for pad ops dealing with subdev state. The
+ * wrapper handles the case where the caller does not provide the called
+ * subdev's state. This should be removed when all the callers are fixed.
+ */
+#define DEFINE_STATE_WRAPPER(f, arg_type)                                  \
+	static int call_##f##_state(struct v4l2_subdev *sd,                \
+				    struct v4l2_subdev_state *_state,      \
+				    arg_type *format)                      \
+	{                                                                  \
+		struct v4l2_subdev_state *state = _state;                  \
+		int ret;                                                   \
+		if (!_state)                                               \
+			state = v4l2_subdev_lock_and_get_active_state(sd); \
+		ret = call_##f(sd, state, format);                         \
+		if (!_state && state)                                      \
+			v4l2_subdev_unlock_state(state);                   \
+		return ret;                                                \
+	}
+
+DEFINE_STATE_WRAPPER(get_fmt, struct v4l2_subdev_format);
+DEFINE_STATE_WRAPPER(set_fmt, struct v4l2_subdev_format);
+DEFINE_STATE_WRAPPER(enum_mbus_code, struct v4l2_subdev_mbus_code_enum);
+DEFINE_STATE_WRAPPER(enum_frame_size, struct v4l2_subdev_frame_size_enum);
+DEFINE_STATE_WRAPPER(enum_frame_interval, struct v4l2_subdev_frame_interval_enum);
+DEFINE_STATE_WRAPPER(get_selection, struct v4l2_subdev_selection);
+DEFINE_STATE_WRAPPER(set_selection, struct v4l2_subdev_selection);
+
 static const struct v4l2_subdev_pad_ops v4l2_subdev_call_pad_wrappers = {
-	.get_fmt		= call_get_fmt,
-	.set_fmt		= call_set_fmt,
-	.enum_mbus_code		= call_enum_mbus_code,
-	.enum_frame_size	= call_enum_frame_size,
-	.enum_frame_interval	= call_enum_frame_interval,
-	.get_selection		= call_get_selection,
-	.set_selection		= call_set_selection,
+	.get_fmt		= call_get_fmt_state,
+	.set_fmt		= call_set_fmt_state,
+	.enum_mbus_code		= call_enum_mbus_code_state,
+	.enum_frame_size	= call_enum_frame_size_state,
+	.enum_frame_interval	= call_enum_frame_interval_state,
+	.get_selection		= call_get_selection_state,
+	.set_selection		= call_set_selection_state,
 	.get_edid		= call_get_edid,
 	.set_edid		= call_set_edid,
 	.dv_timings_cap		= call_dv_timings_cap,
-- 
2.25.1

