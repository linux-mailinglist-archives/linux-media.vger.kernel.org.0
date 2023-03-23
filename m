Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 793986C66DF
	for <lists+linux-media@lfdr.de>; Thu, 23 Mar 2023 12:41:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231495AbjCWLlg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Mar 2023 07:41:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjCWLld (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Mar 2023 07:41:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BDA31A978
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 04:41:33 -0700 (PDT)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1pfJJz-0007OB-0Q; Thu, 23 Mar 2023 12:41:31 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu, 23 Mar 2023 12:41:10 +0100
Subject: [PATCH 2/8] usb: gadget: uvc: fix return code of REQBUFS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230323-uvc-gadget-cleanup-v1-2-e41f0c5d9d8e@pengutronix.de>
References: <20230323-uvc-gadget-cleanup-v1-0-e41f0c5d9d8e@pengutronix.de>
In-Reply-To: <20230323-uvc-gadget-cleanup-v1-0-e41f0c5d9d8e@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.11.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On success, VIDIOC_REQBUFS should return 0, not the number of allocated
buffers. As uvcg_alloc_buffers() is directly called by regbufs, it has
to return the correct error codes.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/usb/gadget/function/uvc_queue.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
index 0aa3d7e1f3cc..f14f75b93aaa 100644
--- a/drivers/usb/gadget/function/uvc_queue.c
+++ b/drivers/usb/gadget/function/uvc_queue.c
@@ -179,11 +179,7 @@ void uvcg_free_buffers(struct uvc_video_queue *queue)
 int uvcg_alloc_buffers(struct uvc_video_queue *queue,
 			      struct v4l2_requestbuffers *rb)
 {
-	int ret;
-
-	ret = vb2_reqbufs(&queue->queue, rb);
-
-	return ret ? ret : rb->count;
+	return vb2_reqbufs(&queue->queue, rb);
 }
 
 int uvcg_query_buffer(struct uvc_video_queue *queue, struct v4l2_buffer *buf)

-- 
2.30.2
