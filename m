Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE236638D83
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 16:35:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbiKYPfB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 10:35:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbiKYPe6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 10:34:58 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C41FC2F006
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 07:34:57 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oyaj9-0005nu-KE; Fri, 25 Nov 2022 16:34:55 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oyaj8-000Frf-0X; Fri, 25 Nov 2022 16:34:54 +0100
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oyaj8-001Rde-5y; Fri, 25 Nov 2022 16:34:54 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de, stable <stable@kernel.org>
Subject: [PATCH v2 2/2] usb: gadget: uvc: limit isoc_sg to super speed gadgets
Date:   Fri, 25 Nov 2022 16:34:50 +0100
Message-Id: <20221125153450.344392-2-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221125153450.344392-1-m.grzeschik@pengutronix.de>
References: <20221125153450.344392-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When calling uvc_video_encode_isoc_sg the function is preparing the sg payload
by setting the sglist pointers of the videobuffer for the request. The usb
gadget driver then is parsing the sg list and uses each sg entry to send in one
urb to the host. Because of the unrelated buffer of the uvc header that buffer
has to be send separately in an extra sg entry.

When it comes to transfers with an limited payload (e.g. the maximum of 3kB for
high-speed) this extra payload handling is not justified. A simple memcpy of
the header and payload is usually faster and does not come with that extra
runtime overhead.

This patch is changing the uvc_video_encode_isoc_sg encode function only to be
used for super speed gadgets.

Cc: stable <stable@kernel.org>
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v2: - left the sg assignment in uvc_buffer_sg under the test for use_sg
          - rephrased the commit message

 drivers/usb/gadget/function/uvc_queue.c | 3 +--
 drivers/usb/gadget/function/uvc_video.c | 9 +++++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
index 0aa3d7e1f3cc32..0abb1763faf1b6 100644
--- a/drivers/usb/gadget/function/uvc_queue.c
+++ b/drivers/usb/gadget/function/uvc_queue.c
@@ -87,9 +87,8 @@ static int uvc_buffer_prepare(struct vb2_buffer *vb)
 	if (queue->use_sg) {
 		buf->sgt = vb2_dma_sg_plane_desc(vb, 0);
 		buf->sg = buf->sgt->sgl;
-	} else {
-		buf->mem = vb2_plane_vaddr(vb, 0);
 	}
+	buf->mem = vb2_plane_vaddr(vb, 0);
 	buf->length = vb2_plane_size(vb, 0);
 	if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		buf->bytesused = 0;
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index dd1c6b2ca7c6f3..b6ea600b011185 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -459,6 +459,9 @@ static void uvcg_video_pump(struct work_struct *work)
  */
 int uvcg_video_enable(struct uvc_video *video, int enable)
 {
+	struct uvc_device *uvc = video->uvc;
+	struct usb_composite_dev *cdev = uvc->func.config->cdev;
+	struct usb_gadget *gadget = cdev->gadget;
 	unsigned int i;
 	int ret;
 
@@ -490,9 +493,11 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
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

