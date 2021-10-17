Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1C0C430B7A
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 20:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344320AbhJQS0h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 14:26:37 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:57661 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344139AbhJQS0g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 14:26:36 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id E440F200004;
        Sun, 17 Oct 2021 18:24:24 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        kieran.bingham@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 09/13] media: rcar-csi2: Implement set_routing
Date:   Sun, 17 Oct 2021 20:24:45 +0200
Message-Id: <20211017182449.64192-10-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211017182449.64192-1-jacopo+renesas@jmondi.org>
References: <20211017182449.64192-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the set_routing() subdev operation to allow userspace to configure
routing on the R-Car CSI-2 receiver.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 40 +++++++++++++++------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index a74087b49e71..451a6da26e03 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -752,6 +752,33 @@ static int rcsi2_get_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int _rcsi2_set_routing(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state,
+			      struct v4l2_subdev_krouting *routing)
+{
+	int ret;
+
+	ret = v4l2_routing_simple_verify(routing);
+	if (ret)
+		return ret;
+
+	state = v4l2_subdev_validate_and_lock_state(sd, state);
+
+	ret = v4l2_subdev_set_routing(sd, state, routing);
+
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
+}
+
+static int rcsi2_set_routing(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state,
+			     enum v4l2_subdev_format_whence which,
+			     struct v4l2_subdev_krouting *routing)
+{
+	return _rcsi2_set_routing(sd, state, routing);
+}
+
 static int rcsi2_init_cfg(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_state *state)
 {
@@ -792,17 +819,7 @@ static int rcsi2_init_cfg(struct v4l2_subdev *sd,
 		.routes = routes,
 	};
 
-	int ret = v4l2_routing_simple_verify(&routing);
-	if (ret)
-		return ret;
-
-	state = v4l2_subdev_validate_and_lock_state(sd, state);
-
-	ret = v4l2_subdev_set_routing(sd, state, &routing);
-
-	v4l2_subdev_unlock_state(state);
-
-	return ret;
+	return _rcsi2_set_routing(sd, state, &routing);
 }
 
 static const struct v4l2_subdev_video_ops rcar_csi2_video_ops = {
@@ -813,6 +830,7 @@ static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
 	.init_cfg = rcsi2_init_cfg,
 	.set_fmt = rcsi2_set_pad_format,
 	.get_fmt = rcsi2_get_pad_format,
+	.set_routing = rcsi2_set_routing,
 };
 
 static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
-- 
2.33.0

