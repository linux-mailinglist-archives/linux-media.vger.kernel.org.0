Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6D4E4FDCDB
	for <lists+linux-media@lfdr.de>; Tue, 12 Apr 2022 13:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241736AbiDLKr1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Apr 2022 06:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356979AbiDLKpr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Apr 2022 06:45:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D394960060
        for <linux-media@vger.kernel.org>; Tue, 12 Apr 2022 02:43:30 -0700 (PDT)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4AF6AD1D;
        Tue, 12 Apr 2022 11:43:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1649756605;
        bh=Zb5BpviIUdydVk11HAVIV/HmMUyYO0huo6w31D17r0M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QVTfw5Nn6Gs+3xhyP2Z5nsgZG5SGjC3izENcpQLua519rOoKperKFjnbnK5p4Ecy3
         NAl2ncLMLZY6p6WEtSezy28bxue0mL8fPrrSWWJbrGF3e/44MrAhdYIJ1A7ZmfukTW
         o/2R3iuEwNfkW+XvY6hh4Qf7k1ay2oXEcY6IXpAg=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>, satish.nagireddy@getcruise.com
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v8 08/10] media: subdev: add locking wrappers to subdev op wrappers
Date:   Tue, 12 Apr 2022 12:42:47 +0300
Message-Id: <20220412094249.695754-9-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412094249.695754-1-tomi.valkeinen@ideasonboard.com>
References: <20220412094249.695754-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_FILL_THIS_FORM_SHORT,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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
 drivers/media/v4l2-core/v4l2-subdev.c | 55 +++++++++++++++++++++++----
 1 file changed, 48 insertions(+), 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 47d480786f03..afe916366dfe 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -318,14 +318,55 @@ static int call_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
 	       sd->ops->pad->get_mbus_config(sd, pad, config);
 }
 
+#ifdef CONFIG_MEDIA_CONTROLLER
+/*
+ * Create state-management wrapper for pad ops dealing with subdev state. The
+ * wrapper handles the case where the caller does not provide the called
+ * subdev's state. This should be removed when all the callers are fixed.
+ */
+#define DEFINE_STATE_WRAPPER(f, arg_type)                                  \
+	static int call_##f##_state(struct v4l2_subdev *sd,                \
+				    struct v4l2_subdev_state *_state,      \
+				    arg_type *arg)                         \
+	{                                                                  \
+		struct v4l2_subdev_state *state = _state;                  \
+		int ret;                                                   \
+		if (!_state)                                               \
+			state = v4l2_subdev_lock_and_get_active_state(sd); \
+		ret = call_##f(sd, state, arg);                            \
+		if (!_state && state)                                      \
+			v4l2_subdev_unlock_state(state);                   \
+		return ret;                                                \
+	}
+
+#else /* CONFIG_MEDIA_CONTROLLER */
+
+#define DEFINE_STATE_WRAPPER(f, arg_type)                            \
+	static int call_##f##_state(struct v4l2_subdev *sd,          \
+				    struct v4l2_subdev_state *state, \
+				    arg_type *arg)                   \
+	{                                                            \
+		return call_##f(sd, state, arg);                     \
+	}
+
+#endif /* CONFIG_MEDIA_CONTROLLER */
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

