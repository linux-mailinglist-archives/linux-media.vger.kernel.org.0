Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB14A79ACA3
	for <lists+linux-media@lfdr.de>; Tue, 12 Sep 2023 01:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234473AbjIKUuD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Sep 2023 16:50:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238835AbjIKOFt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Sep 2023 10:05:49 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BE8CE54
        for <linux-media@vger.kernel.org>; Mon, 11 Sep 2023 07:05:44 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1qfhXq-0006nq-F8; Mon, 11 Sep 2023 16:05:42 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1qfhXq-005ZVA-2S; Mon, 11 Sep 2023 16:05:42 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.96)
        (envelope-from <mgr@pengutronix.de>)
        id 1qfhXp-002tVf-0u;
        Mon, 11 Sep 2023 16:05:41 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     laurent.pinchart@ideasonboard.com
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        dan.scally@ideasonboard.com, gregkh@linuxfoundation.org,
        nicolas@ndufresne.ca, kernel@pengutronix.de
Subject: [PATCH v2 2/3] usb: gadget: uvc: cleanup request when not in correct state
Date:   Mon, 11 Sep 2023 16:05:29 +0200
Message-Id: <20230911140530.2995138-3-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230911140530.2995138-1-m.grzeschik@pengutronix.de>
References: <20230911140530.2995138-1-m.grzeschik@pengutronix.de>
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

The uvc_video_enable function of the uvc-gadget driver is dequeing and
immediately deallocs all requests on its disable codepath. This is not
save since the dequeue function is async and does not ensure that the
requests are left unlinked in the controller driver.

By adding the ep_free_request into the completion path of the requests
we ensure that the request will be properly deallocated.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
v1 == v2

 drivers/usb/gadget/function/uvc_video.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 4b68a3a9815d73..c48c904f500fff 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -256,6 +256,12 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
 	struct uvc_device *uvc = video->uvc;
 	unsigned long flags;
 
+	if (uvc->state == UVC_STATE_CONNECTED) {
+		usb_ep_free_request(video->ep, ureq->req);
+		ureq->req = NULL;
+		return;
+	}
+
 	switch (req->status) {
 	case 0:
 		break;
-- 
2.39.2

