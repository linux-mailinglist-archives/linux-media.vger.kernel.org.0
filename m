Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7144B17DD1B
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 11:15:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgCIKOu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 06:14:50 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:40741 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbgCIKOt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Mar 2020 06:14:49 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBFQm-0003mn-Qs; Mon, 09 Mar 2020 11:14:40 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jBFQg-0001mH-V5; Mon, 09 Mar 2020 11:14:34 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: [PATCH v12 14/19] media: tvp5150: add v4l2-event support
Date:   Mon,  9 Mar 2020 11:14:23 +0100
Message-Id: <20200309101428.15267-15-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200309101428.15267-1-m.felsch@pengutronix.de>
References: <20200309101428.15267-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently the driver notifies internal subdevs if the signal is locked
or not. This information is also useful for userpace applications e.g. to
switch to another input device upon a signal lost event.

This commit adds the support for the userspace to subscribe to the
V4L2_EVENT_SOURCE_CHANGE and V4L2_EVENT_CTRL events.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
v12:
- new patch

 drivers/media/i2c/tvp5150.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index 313d2a43d79e..9bad3192358d 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -17,6 +17,7 @@
 #include <linux/regmap.h>
 #include <media/v4l2-async.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-mc.h>
@@ -1526,6 +1527,19 @@ static int tvp5150_s_register(struct v4l2_subdev *sd, const struct v4l2_dbg_regi
 }
 #endif
 
+static int tvp5150_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
+				   struct v4l2_event_subscription *sub)
+{
+	switch (sub->type) {
+	case V4L2_EVENT_SOURCE_CHANGE:
+		return v4l2_src_change_event_subdev_subscribe(sd, fh, sub);
+	case V4L2_EVENT_CTRL:
+		return v4l2_ctrl_subdev_subscribe_event(sd, fh, sub);
+	default:
+		return -EINVAL;
+	}
+}
+
 static int tvp5150_g_tuner(struct v4l2_subdev *sd, struct v4l2_tuner *vt)
 {
 	int status = tvp5150_read(sd, 0x88);
@@ -1617,6 +1631,8 @@ static const struct v4l2_subdev_core_ops tvp5150_core_ops = {
 	.g_register = tvp5150_g_register,
 	.s_register = tvp5150_s_register,
 #endif
+	.subscribe_event = tvp5150_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
 };
 
 static const struct v4l2_subdev_tuner_ops tvp5150_tuner_ops = {
@@ -2045,7 +2061,7 @@ static int tvp5150_probe(struct i2c_client *c)
 	sd = &core->sd;
 	v4l2_i2c_subdev_init(sd, c, &tvp5150_ops);
 	sd->internal_ops = &tvp5150_internal_ops;
-	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
 
 	if (IS_ENABLED(CONFIG_OF) && np) {
 		res = tvp5150_parse_dt(core, np);
-- 
2.20.1

