Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D57444AC571
	for <lists+linux-media@lfdr.de>; Mon,  7 Feb 2022 17:27:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376445AbiBGQVf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Feb 2022 11:21:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387352AbiBGQLf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Feb 2022 11:11:35 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B867CC0401CE
        for <linux-media@vger.kernel.org>; Mon,  7 Feb 2022 08:11:34 -0800 (PST)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 26CD81831;
        Mon,  7 Feb 2022 17:11:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644250288;
        bh=8ojkCYly46d2S1TipvFJ//5kccx+OPErJd7e8Wi3q80=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GGVGYh07VjjTs8KuQUir4M/R1XLM6Vpe1bD6QxUXJjqe7HAfoavY/4mmv0otfJ8tO
         Osgh98dxDqMBSbtg0LLAxcTjGIQ8qGgp/9ZtEpShF1rjYGBhazOfLGW8xdnLYfqHrG
         PF4tP7UzDfHzuFiOF8cyRGX2zTFTvmHXZc5XV4i0=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 5/7] media: subdev: Add v4l2_subdev_lock_and_return_state()
Date:   Mon,  7 Feb 2022 18:11:05 +0200
Message-Id: <20220207161107.1166376-6-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220207161107.1166376-1-tomi.valkeinen@ideasonboard.com>
References: <20220207161107.1166376-1-tomi.valkeinen@ideasonboard.com>
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

All suitable subdev ops are now passed either the TRY or the ACTIVE
state by the v4l2 core. However, other subdev drivers can still call the
ops passing NULL as the state, implying the active case.

For all current upstream drivers this doesn't matter, as they do not
expect to get a valid state for ACTIVE case. But future drivers which
support multiplexed streaming and routing will depend on getting a state
for both active and try cases.

For new drivers we can mandate that the pipelines where the drivers are
used need to pass the state properly, or preferably, not call such
subdev ops at all.

However, if an existing subdev driver is changed to support multiplexed
streams, the driver has to consider cases where its ops will be called
with NULL state. The problem can easily be solved by using the
v4l2_subdev_lock_and_return_state() helper, introduced here.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 include/media/v4l2-subdev.h | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index e9aa38dc6489..16497b8fc875 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1283,6 +1283,42 @@ void v4l2_subdev_lock_state(struct v4l2_subdev_state *state);
  */
 void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state);
 
+/**
+ * v4l2_subdev_lock_and_return_state() - Gets locked try or active subdev state
+ * @sd: subdevice
+ * @state: subdevice state as passed to the subdev op
+ *
+ * Due to legacy reasons, when subdev drivers call ops in other subdevs they use
+ * NULL as the state parameter, as subdevs always used to have their active
+ * state stored privately.
+ *
+ * However, newer state-aware subdev drivers, which store their active state in
+ * a common place, subdev->active_state, expect to always get a proper state as
+ * a parameter.
+ *
+ * These state-aware drivers can use v4l2_subdev_lock_and_return_state() instead
+ * of v4l2_subdev_lock_state(). v4l2_subdev_lock_and_return_state() solves the
+ * issue by using subdev->active_state in case the passed state is NULL.
+ *
+ * This is a temporary helper function, and should be removed when we can ensure
+ * that all drivers pass proper state when calling other subdevs.
+ */
+static inline struct v4l2_subdev_state *
+v4l2_subdev_lock_and_return_state(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state)
+{
+	if (!state)
+		dev_notice_once(sd->dev,
+			"The provided state is NULL. Adjusting to the subdev active state.\n"
+			"Please consider porting your driver to the new state management API.\n");
+
+	state = state ? state : sd->active_state;
+
+	v4l2_subdev_lock_state(state);
+
+	return state;
+}
+
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
 /**
-- 
2.25.1

