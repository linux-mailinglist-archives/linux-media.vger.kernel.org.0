Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A788B601C18
	for <lists+linux-media@lfdr.de>; Tue, 18 Oct 2022 00:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbiJQWMD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 18:12:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229976AbiJQWMC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 18:12:02 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 301886CD2A
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 15:12:01 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1okYL0-0006xq-LA; Tue, 18 Oct 2022 00:11:58 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1okYKz-002A1H-Eg; Tue, 18 Oct 2022 00:11:57 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1okYKy-00DFaV-Sk; Tue, 18 Oct 2022 00:11:56 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     linux-media@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de
Subject: [PATCH v2] usb: gadget: uvc: limit isoc_sg to super speed gadgets
Date:   Tue, 18 Oct 2022 00:11:41 +0200
Message-Id: <20221017221141.3134818-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The overhead of preparing sg data is high for transfers with limited
payload. When transferring isoc over high-speed usb the maximum payload
is rather small which is a good argument no to use sg. This patch is
changing the uvc_video_encode_isoc_sg encode function only to be used
for super speed gadgets.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v2: - always setting mem and sg elements since now both is working in runtime

 drivers/usb/gadget/function/uvc_queue.c | 9 +++------
 drivers/usb/gadget/function/uvc_video.c | 9 +++++++--
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
index ec500ee499eed1..31c50ba1774f0d 100644
--- a/drivers/usb/gadget/function/uvc_queue.c
+++ b/drivers/usb/gadget/function/uvc_queue.c
@@ -84,12 +84,9 @@ static int uvc_buffer_prepare(struct vb2_buffer *vb)
 		return -ENODEV;
 
 	buf->state = UVC_BUF_STATE_QUEUED;
-	if (queue->use_sg) {
-		buf->sgt = vb2_dma_sg_plane_desc(vb, 0);
-		buf->sg = buf->sgt->sgl;
-	} else {
-		buf->mem = vb2_plane_vaddr(vb, 0);
-	}
+	buf->sgt = vb2_dma_sg_plane_desc(vb, 0);
+	buf->sg = buf->sgt->sgl;
+	buf->mem = vb2_plane_vaddr(vb, 0);
 	buf->length = vb2_plane_size(vb, 0);
 	if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		buf->bytesused = 0;
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index bb037fcc90e69e..5081eb3bc5484c 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -448,6 +448,9 @@ static void uvcg_video_pump(struct work_struct *work)
  */
 int uvcg_video_enable(struct uvc_video *video, int enable)
 {
+	struct uvc_device *uvc = video->uvc;
+	struct usb_composite_dev *cdev = uvc->func.config->cdev;
+	struct usb_gadget *gadget = cdev->gadget;
 	unsigned int i;
 	int ret;
 
@@ -479,9 +482,11 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
 	if (video->max_payload_size) {
 		video->encode = uvc_video_encode_bulk;
 		video->payload_size = 0;
-	} else
-		video->encode = video->queue.use_sg ?
+	} else {
+		video->encode = (video->queue.use_sg &&
+				 !(gadget->speed <= USB_SPEED_HIGH)) ?
 			uvc_video_encode_isoc_sg : uvc_video_encode_isoc;
+	}
 
 	video->req_int_count = 0;
 
-- 
2.30.2

