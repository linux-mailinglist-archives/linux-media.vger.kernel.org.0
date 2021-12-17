Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 066CB478CB7
	for <lists+linux-media@lfdr.de>; Fri, 17 Dec 2021 14:50:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236840AbhLQNuu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Dec 2021 08:50:50 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:55130 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236835AbhLQNut (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Dec 2021 08:50:49 -0500
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E94C1906;
        Fri, 17 Dec 2021 14:50:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639749047;
        bh=BDnYd0txR+jI5OGXD1u5/g6TyIyMeF0U90gebnJ6ta4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ATTG6unaC9cHqvkA/AtaqbzBMK4Xu/9jisCvKYEh20KvSFxjxyKnfMjEU+gnCAqEU
         6HE74qQ1xXS8yYeiDXE1mLl1llmj634BriS/sDYhfjsrmu8r4H3BUvfGuJbbGyYTA5
         NPu8ebCqzrG7ZjMZMnbMqMh1GnKfz9LNODGVQN9I=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 5/6] media: subdev: Add v4l2_subdev_lock_and_return_state()
Date:   Fri, 17 Dec 2021 15:50:21 +0200
Message-Id: <20211217135022.364954-6-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211217135022.364954-1-tomi.valkeinen@ideasonboard.com>
References: <20211217135022.364954-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
index 867e19ef80bd..d6c7db1d37e4 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1321,4 +1321,40 @@ void v4l2_subdev_lock_state(struct v4l2_subdev_state *state);
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
 #endif
-- 
2.25.1

