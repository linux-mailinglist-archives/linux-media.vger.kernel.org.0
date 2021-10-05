Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3FD7422167
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 10:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233450AbhJEJAN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 05:00:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233079AbhJEJAK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 05:00:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 266D3C061745
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 01:58:20 -0700 (PDT)
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A3951253;
        Tue,  5 Oct 2021 10:58:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633424298;
        bh=lISdFJPuJ6m9T0FwiCj4jjNsclsqI3m0siEfIwXd/Us=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=d6sKXImnznewH+mr3zN6RjOvyHhW4yNP6uy5I9jBpSn0miqQZTbPGtqGp0sl3KM5t
         SBzvULcCL/7oY8aBB1mC+plyQxWpJlrJmmeN+8Xcu0OSbe1mdpf9rrO6K5V8kiInuc
         EUPfi0XjKFe24ZXHg5ijLW+mdvIBMInSKjUqke8M=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH v9 05/36] media: subdev: Add v4l2_subdev_validate_and_lock_state()
Date:   Tue,  5 Oct 2021 11:57:19 +0300
Message-Id: <20211005085750.138151-6-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
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
v4l2_subdev_validate_and_lock_state() helper, introduced here.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 include/media/v4l2-subdev.h | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index a6e8f531a396..b75eeaee492b 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1313,4 +1313,37 @@ void v4l2_subdev_lock_state(struct v4l2_subdev_state *state);
  */
 void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state);
 
+/**
+ * v4l2_subdev_validate_and_lock_state() - Gets locked TRY or ACTIVE subdev
+ *					   state
+ * @sd: subdevice
+ * @state: subdevice state as passed to the subdev op
+ *
+ * Due to legacy reasons, when subdev drivers call ops in other subdevs they use
+ * NULL as the state parameter, as subdevs always used to have their active
+ * state stored privately.
+ *
+ * However, newer state-aware subdev drivers, which store their active state in
+ * a common place, subdev->state, expect to always get a proper state as a
+ * parameter.
+ *
+ * These state-aware drivers can use v4l2_subdev_validate_and_lock_state()
+ * instead of v4l2_subdev_lock_state(). v4l2_subdev_validate_and_lock_state()
+ * solves the issue by using subdev->state in case the passed state is
+ * NULL.
+ *
+ * This is a temporary helper function, and should be removed when we can ensure
+ * that all drivers pass proper state when calling other subdevs.
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

