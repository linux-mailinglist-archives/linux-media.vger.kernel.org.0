Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8CA7463655
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 15:16:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242095AbhK3OUM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 09:20:12 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41004 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242092AbhK3OT6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 09:19:58 -0500
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9EB2E1516;
        Tue, 30 Nov 2021 15:16:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638281797;
        bh=+EY0MLLXHquXu6ILD+aF9lVeAffqTfwMOdF8h1c/wO0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KW34fAKAGmRkgYooOrJH+e4IXfDibHeY4MaVJHFY/LJXoal3+mNM3rLV3AfUrgwnL
         TuBqUivHFJunouvLe0jXPw8si53CSX/xmE3chQEoUyTORgD3+/UEvCVRsm9SbpO45P
         5Im8eGtl65OPTovIK5lDMwzh0qWSW4uULcwsU07Q=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v10 05/38] media: subdev: Add v4l2_subdev_lock_and_return_state()
Date:   Tue, 30 Nov 2021 16:15:03 +0200
Message-Id: <20211130141536.891878-6-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
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
---
 include/media/v4l2-subdev.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 1810dde9c7fc..873bbe0686e3 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1317,4 +1317,35 @@ void v4l2_subdev_lock_state(struct v4l2_subdev_state *state);
  */
 void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state);
 
+/**
+ * v4l2_subdev_lock_and_return_state() - Gets locked TRY or ACTIVE subdev state
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
+ * issue by using subdev->state in case the passed state is NULL.
+ *
+ * This is a temporary helper function, and should be removed when we can ensure
+ * that all drivers pass proper state when calling other subdevs.
+ */
+static inline struct v4l2_subdev_state *
+v4l2_subdev_lock_and_return_state(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state)
+{
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

