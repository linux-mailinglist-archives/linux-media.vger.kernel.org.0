Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 036472F6F7F
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 01:32:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731277AbhAOAa2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 19:30:28 -0500
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:19349 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731073AbhAOAa1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 19:30:27 -0500
X-Halon-ID: bced8b5b-56c7-11eb-b73f-0050569116f7
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p4fca2458.dip0.t-ipconnect.de [79.202.36.88])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id bced8b5b-56c7-11eb-b73f-0050569116f7;
        Fri, 15 Jan 2021 01:22:24 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 3/4] rcar-vin: Stop stream when subdevice signal EOS
Date:   Fri, 15 Jan 2021 01:21:47 +0100
Message-Id: <20210115002148.4079591-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210115002148.4079591-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210115002148.4079591-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When a subdevice signals end of stream stop the VIN in addition to
informing user-space of the event.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 457a65bf6b664f05..176eae2dd5151ac9 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -969,9 +969,23 @@ void rvin_v4l2_unregister(struct rvin_dev *vin)
 static void rvin_notify_video_device(struct rvin_dev *vin,
 				     unsigned int notification, void *arg)
 {
+	const struct v4l2_event *event;
+
 	switch (notification) {
 	case V4L2_DEVICE_NOTIFY_EVENT:
-		v4l2_event_queue(&vin->vdev, arg);
+		event = arg;
+
+		switch (event->type) {
+		case V4L2_EVENT_EOS:
+			rvin_stop_streaming(vin);
+			v4l2_info(&vin->v4l2_dev,
+				  "Subdevice signaled end of stream, stopping.\n");
+			break;
+		default:
+			break;
+		}
+
+		v4l2_event_queue(&vin->vdev, event);
 		break;
 	default:
 		break;
-- 
2.30.0

