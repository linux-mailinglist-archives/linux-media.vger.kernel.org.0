Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6838F3FB437
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 13:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236463AbhH3LDW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 07:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236441AbhH3LDK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 07:03:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36443C061575
        for <linux-media@vger.kernel.org>; Mon, 30 Aug 2021 04:02:17 -0700 (PDT)
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1706A1279;
        Mon, 30 Aug 2021 13:02:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630321335;
        bh=77/kGOwAmfB7XR0MAHbi0ZBIQYCI8yOU2NxtlsUStmk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qlHsJ0UdWK6seonQemfGP4cTFPA1rvF+teGSjph9twcrLzLx9n7tI0rQDHQDlpZmO
         nJ20IVHLZv89LTA2kSQqcIOd4GguQcf0DmaX+WyRnClh0hpoDrK5fIJG/OorqvLY8W
         wzF2tcIa4fw86A7/B8C+xnm68dTCvrl2BsxYc2r4=
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
Subject: [PATCH v8 06/36] media: subdev: Add v4l2_subdev_validate(_and_lock)_state()
Date:   Mon, 30 Aug 2021 14:00:46 +0300
Message-Id: <20210830110116.488338-7-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All suitable subdev ops are now passed either the TRY or the ACTIVE
state by the v4l2 core. However, other subdrivers can still call the ops
passing NULL as the state, implying the active case.

Thus all subdev drivers supporting active state need to handle the NULL
state case. Additionally, the subdev drivers usually need to lock the
state.

Add two helper functions to easen the transition to centrally managed
ACTIVE state. v4l2_subdev_validate_state() ensures that the state is not
NULL, and v4l2_subdev_validate_and_lock_state() does the same and
additionally locks the state.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 include/media/v4l2-subdev.h | 41 +++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 52a725281b23..2290b5025fc0 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1307,4 +1307,45 @@ void v4l2_subdev_lock_state(struct v4l2_subdev_state *state);
  */
 void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state);
 
+/**
+ * v4l2_subdev_validate_state() - Gets the TRY or ACTIVE subdev state
+ * @sd: subdevice
+ * @state: subdevice state as passed to the subdev op
+ *
+ * Subdev ops used to be sometimes called with NULL as the state for ACTIVE
+ * case. Even if the v4l2 core now passes proper state for both TRY and
+ * ACTIVE cases, a subdev driver may call an op in another subdev driver,
+ * passing NULL.
+ *
+ * This function can be used as a helper to get the state also for the ACTIVE
+ * case. The subdev driver that supports ACTIVE state can use this function
+ * as the first thing in its ops, ensuring that the state variable contains
+ * either the TRY or ACTIVE state.
+ */
+static inline struct v4l2_subdev_state *
+v4l2_subdev_validate_state(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *state)
+{
+	return state ? state : sd->state;
+}
+
+/**
+ * v4l2_subdev_validate_and_lock_state() - Gets locked TRY or ACTIVE subdev state
+ * @sd: subdevice
+ * @state: subdevice state as passed to the subdev op
+ *
+ * This is a helper function which does the same as v4l2_subdev_validate_state
+ * () except that it also locks the state.
+ */
+static inline struct v4l2_subdev_state *
+v4l2_subdev_validate_and_lock_state(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state)
+{
+	state = state ? state : sd->state;
+
+	v4l2_subdev_lock_state(state);
+
+	return state;
+}
+
 #endif
-- 
2.25.1

