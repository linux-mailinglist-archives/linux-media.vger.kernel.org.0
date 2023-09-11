Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F170E79A0C3
	for <lists+linux-media@lfdr.de>; Mon, 11 Sep 2023 02:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231873AbjIKAZF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Sep 2023 20:25:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231715AbjIKAZB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Sep 2023 20:25:01 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F5619B
        for <linux-media@vger.kernel.org>; Sun, 10 Sep 2023 17:24:56 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1qfUjW-0008TK-9f; Mon, 11 Sep 2023 02:24:54 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1qfUjV-005QgX-OY; Mon, 11 Sep 2023 02:24:53 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.96)
        (envelope-from <mgr@pengutronix.de>)
        id 1qfUjV-00C03I-08;
        Mon, 11 Sep 2023 02:24:53 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     laurent.pinchart@ideasonboard.com
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        dan.scally@ideasonboard.com, gregkh@linuxfoundation.org,
        nicolas@ndufresne.ca, kernel@pengutronix.de
Subject: [PATCH 3/3] usb: gadget: uvc: rework pump worker to avoid while loop
Date:   Mon, 11 Sep 2023 02:24:51 +0200
Message-Id: <20230911002451.2860049-4-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230911002451.2860049-1-m.grzeschik@pengutronix.de>
References: <20230911002451.2860049-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The uvc_video_enable function is calling cancel_work_sync which will be
blocking as long as new requests will be queued with the while loop. To
ensure an earlier stop in the pumping loop in this particular case we
rework the worker to requeue itself on every requests. Since the worker
is already running prioritized, the scheduling overhad did not have real
impact on the performance.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/gadget/function/uvc_video.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 52e3666b51f743..bfda91ca73ddc6 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -397,7 +397,7 @@ static void uvcg_video_pump(struct work_struct *work)
 	bool buf_done;
 	int ret;
 
-	while (video->ep->enabled && uvc->state == UVC_STATE_STREAMING) {
+	if (video->ep->enabled && uvc->state == UVC_STATE_STREAMING) {
 		/*
 		 * Retrieve the first available USB request, protected by the
 		 * request lock.
@@ -409,6 +409,11 @@ static void uvcg_video_pump(struct work_struct *work)
 		}
 		req = list_first_entry(&video->req_free, struct usb_request,
 					list);
+		if (!req) {
+			spin_unlock_irqrestore(&video->req_lock, flags);
+			return;
+		}
+
 		list_del(&req->list);
 		spin_unlock_irqrestore(&video->req_lock, flags);
 
@@ -437,7 +442,7 @@ static void uvcg_video_pump(struct work_struct *work)
 			 * further.
 			 */
 			spin_unlock_irqrestore(&queue->irqlock, flags);
-			break;
+			goto out;
 		}
 
 		/*
@@ -470,20 +475,23 @@ static void uvcg_video_pump(struct work_struct *work)
 		/* Queue the USB request */
 		ret = uvcg_video_ep_queue(video, req);
 		spin_unlock_irqrestore(&queue->irqlock, flags);
-
 		if (ret < 0) {
 			uvcg_queue_cancel(queue, 0);
-			break;
+			goto out;
 		}
 
 		/* Endpoint now owns the request */
 		req = NULL;
 		video->req_int_count++;
+	} else {
+		return;
 	}
 
-	if (!req)
-		return;
+	if (uvc->state == UVC_STATE_STREAMING)
+		queue_work(video->async_wq, &video->pump);
 
+	return;
+out:
 	spin_lock_irqsave(&video->req_lock, flags);
 	list_add_tail(&req->list, &video->req_free);
 	spin_unlock_irqrestore(&video->req_lock, flags);
-- 
2.39.2

