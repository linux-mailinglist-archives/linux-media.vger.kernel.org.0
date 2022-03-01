Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A98A4C8A1B
	for <lists+linux-media@lfdr.de>; Tue,  1 Mar 2022 11:56:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234450AbiCAK5D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Mar 2022 05:57:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234449AbiCAK44 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Mar 2022 05:56:56 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A2028BF1A
        for <linux-media@vger.kernel.org>; Tue,  1 Mar 2022 02:56:15 -0800 (PST)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E963E41;
        Tue,  1 Mar 2022 11:56:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646132172;
        bh=mcPGrTwvYGlJHy7MqpKXaXhJJ8RzhjnXNr7uA00c19w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TqxorqPCr1JONVNuarFt92xJeG8LLifpxt+WtHr7rUGDYHhQWBc0tkDIkqqqrrb4K
         co2WuDN1cb6dF8D0vGwniUSUQUiln91/sM3iQmZ6OxqgO8pi4t35i0MagVHcDSGc0c
         mTtHxwpmCnRDDkvpklMacxFpMV53OZyrdZR1D0Hk=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v5 5/6] media: subdev: add v4l2_subdev_call_state_active()
Date:   Tue,  1 Mar 2022 12:55:47 +0200
Message-Id: <20220301105548.305191-6-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301105548.305191-1-tomi.valkeinen@ideasonboard.com>
References: <20220301105548.305191-1-tomi.valkeinen@ideasonboard.com>
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

Add v4l2_subdev_call_state_active() macro to help calling subdev ops
that take a subdev state as a parameter. Normally the v4l2 framework
will lock and pass the correct subdev state to the subdev ops, but there
are legacy situations where this is not the case (e.g. non-MC video
device driver calling set_fmt in a source subdev).

As this macro is only needed for legacy use cases, the macro is added in
a new header file, v4l2-subdev-legacy.h.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 include/media/v4l2-subdev-legacy.h | 42 ++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 include/media/v4l2-subdev-legacy.h

diff --git a/include/media/v4l2-subdev-legacy.h b/include/media/v4l2-subdev-legacy.h
new file mode 100644
index 000000000000..6a61e579b629
--- /dev/null
+++ b/include/media/v4l2-subdev-legacy.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *  V4L2 sub-device legacy support header.
+ *
+ *  Copyright (C) 2022  Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+ */
+
+#ifndef _V4L2_SUBDEV_LEGACY_H
+#define _V4L2_SUBDEV_LEGACY_H
+
+/**
+ * v4l2_subdev_call_state_active - call an operation of a v4l2_subdev which
+ *				   takes state as a parameter, passing the
+ *				   subdev its active state.
+ *
+ * @sd: pointer to the &struct v4l2_subdev
+ * @o: name of the element at &struct v4l2_subdev_ops that contains @f.
+ *     Each element there groups a set of callbacks functions.
+ * @f: callback function to be called.
+ *     The callback functions are defined in groups, according to
+ *     each element at &struct v4l2_subdev_ops.
+ * @args: arguments for @f.
+ *
+ * This is similar to v4l2_subdev_call(), except that this version can only be
+ * used for ops that take a subdev state as a parameter. The macro will get the
+ * active state and lock it before calling the op, and unlock it after the
+ * call.
+ */
+#define v4l2_subdev_call_state_active(sd, o, f, args...)		\
+	({								\
+		int __result;						\
+		struct v4l2_subdev_state *state;			\
+		state = v4l2_subdev_get_active_state(sd);		\
+		if (state)						\
+			v4l2_subdev_lock_state(state);			\
+		__result = v4l2_subdev_call(sd, o, f, state, ##args);	\
+		if (state)						\
+			v4l2_subdev_unlock_state(state);		\
+		__result;						\
+	})
+
+#endif
-- 
2.25.1

