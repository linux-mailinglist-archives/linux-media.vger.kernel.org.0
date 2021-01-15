Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 813F52F6F7E
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 01:32:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731207AbhAOAa0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 19:30:26 -0500
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:48075 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731073AbhAOAa0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 19:30:26 -0500
X-Halon-ID: bbe56034-56c7-11eb-b73f-0050569116f7
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p4fca2458.dip0.t-ipconnect.de [79.202.36.88])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id bbe56034-56c7-11eb-b73f-0050569116f7;
        Fri, 15 Jan 2021 01:22:22 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 2/4] rcar-vin: Route events to correct video device
Date:   Fri, 15 Jan 2021 01:21:46 +0100
Message-Id: <20210115002148.4079591-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210115002148.4079591-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210115002148.4079591-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The event route for VIN running with a media controller (Gen3) is
incorrect as all events are only routed to the video device that are
used to register the async notifier.

Remedy this be examining which subdevice generated the event and route
it to all VIN(s) that are connected to that subdevice.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 44 ++++++++++++++++++---
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index e6ea2b7991b8dcb3..457a65bf6b664f05 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -966,18 +966,50 @@ void rvin_v4l2_unregister(struct rvin_dev *vin)
 	video_unregister_device(&vin->vdev);
 }
 
+static void rvin_notify_video_device(struct rvin_dev *vin,
+				     unsigned int notification, void *arg)
+{
+	switch (notification) {
+	case V4L2_DEVICE_NOTIFY_EVENT:
+		v4l2_event_queue(&vin->vdev, arg);
+		break;
+	default:
+		break;
+	}
+}
+
 static void rvin_notify(struct v4l2_subdev *sd,
 			unsigned int notification, void *arg)
 {
+	struct v4l2_subdev *remote;
+	struct rvin_group *group;
+	struct media_pad *pad;
 	struct rvin_dev *vin =
 		container_of(sd->v4l2_dev, struct rvin_dev, v4l2_dev);
+	unsigned int i;
 
-	switch (notification) {
-	case V4L2_DEVICE_NOTIFY_EVENT:
-		v4l2_event_queue(&vin->vdev, arg);
-		break;
-	default:
-		break;
+	/* If no media controller, no need to route the event. */
+	if (!vin->info->use_mc) {
+		rvin_notify_video_device(vin, notification, arg);
+		return;
+	}
+
+	group = vin->group;
+
+	for (i = 0; i < RCAR_VIN_NUM; i++) {
+		vin = group->vin[i];
+		if (!vin)
+			continue;
+
+		pad = media_entity_remote_pad(&vin->pad);
+		if (!pad)
+			continue;
+
+		remote = media_entity_to_v4l2_subdev(pad->entity);
+		if (remote != sd)
+			continue;
+
+		rvin_notify_video_device(vin, notification, arg);
 	}
 }
 
-- 
2.30.0

