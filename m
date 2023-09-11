Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD0C79A0C1
	for <lists+linux-media@lfdr.de>; Mon, 11 Sep 2023 02:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231765AbjIKAZE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Sep 2023 20:25:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231723AbjIKAZC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Sep 2023 20:25:02 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B612E19C
        for <linux-media@vger.kernel.org>; Sun, 10 Sep 2023 17:24:56 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1qfUjW-0008TI-9f; Mon, 11 Sep 2023 02:24:54 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1qfUjV-005QgW-Nj; Mon, 11 Sep 2023 02:24:53 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.96)
        (envelope-from <mgr@pengutronix.de>)
        id 1qfUjV-00C03A-03;
        Mon, 11 Sep 2023 02:24:53 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     laurent.pinchart@ideasonboard.com
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        dan.scally@ideasonboard.com, gregkh@linuxfoundation.org,
        nicolas@ndufresne.ca, kernel@pengutronix.de
Subject: [PATCH 1/3] usb: gadget: uvc: stop pump thread on video disable
Date:   Mon, 11 Sep 2023 02:24:49 +0200
Message-Id: <20230911002451.2860049-2-m.grzeschik@pengutronix.de>
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

Since the uvc-video gadget driver is using the v4l2 interface,
the streamon and streamoff can be triggered at any times. To ensure
that the pump worker will be closed as soon the userspace is
calling streamoff we synchronize the state of the gadget ensuring
the pump worker to bail out.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/gadget/function/uvc_video.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 91af3b1ef0d412..4b6e854e30c58c 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -384,13 +384,14 @@ static void uvcg_video_pump(struct work_struct *work)
 	struct uvc_video_queue *queue = &video->queue;
 	/* video->max_payload_size is only set when using bulk transfer */
 	bool is_bulk = video->max_payload_size;
+	struct uvc_device *uvc = video->uvc;
 	struct usb_request *req = NULL;
 	struct uvc_buffer *buf;
 	unsigned long flags;
 	bool buf_done;
 	int ret;
 
-	while (video->ep->enabled) {
+	while (video->ep->enabled && uvc->state == UVC_STATE_STREAMING) {
 		/*
 		 * Retrieve the first available USB request, protected by the
 		 * request lock.
@@ -498,6 +499,8 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
 	}
 
 	if (!enable) {
+		uvc->state = UVC_STATE_CONNECTED;
+
 		cancel_work_sync(&video->pump);
 		uvcg_queue_cancel(&video->queue, 0);
 
@@ -523,6 +526,8 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
 		video->encode = video->queue.use_sg ?
 			uvc_video_encode_isoc_sg : uvc_video_encode_isoc;
 
+	uvc->state = UVC_STATE_STREAMING;
+
 	video->req_int_count = 0;
 
 	queue_work(video->async_wq, &video->pump);
-- 
2.39.2

