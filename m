Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BF2B3FF9B3
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 06:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232227AbhICE4A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Sep 2021 00:56:00 -0400
Received: from lgeamrelo13.lge.com ([156.147.23.53]:44722 "EHLO
        lgeamrelo11.lge.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S231705AbhICE4A (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Sep 2021 00:56:00 -0400
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
        by 156.147.23.53 with ESMTP; 3 Sep 2021 13:54:58 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: kyeongdon.kim@lge.com
Received: from unknown (HELO localhost.localdomain) (10.159.40.99)
        by 156.147.1.121 with ESMTP; 3 Sep 2021 13:54:58 +0900
X-Original-SENDERIP: 10.159.40.99
X-Original-MAILFROM: kyeongdon.kim@lge.com
From:   Kyeongdon Kim <kyeongdon.kim@lge.com>
To:     laurent.pinchart@ideasonboard.com
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kyeongdon Kim <kyeongdon.kim@lge.com>
Subject: [PATCH v2] media: uvcvideo: use dynamic allocation for uvc_copy_op
Date:   Fri,  3 Sep 2021 13:54:56 +0900
Message-Id: <20210903045456.83301-1-kyeongdon.kim@lge.com>
X-Mailer: git-send-email 2.10.2
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are some issues to handle frame throughput with camera devices

Using devices:
- Logitech Webcam
- Intel(R) RealSense(TM) Depth Camera

To improve efficiency, and maximise throughput,
use dynamic allocation for uvc_copy_op.

Change from struct uvc_copy_op copy_operations[UVC_MAX_PACKETS];
to struct uvc_copy_op *copy_operations;

Now, only tested bulk video options.

On test device & own debug log to check frame duration(us),
refer to test result the below:

Use copy_operations[UVC_MAX_PACKETS]
[UVC] Check time duration(us) : 54732 / 66000
[UVC] Check time duration(us) : 57452 / 66000
[UVC] Check time duration(us) : 57413 / 66000
[UVC] Check time duration(us) : 56713 / 66000
[UVC] Check time duration(us) : 57967 / 66000

Use *copy_operations
[UVC] Check time duration(us) : 30804 / 66000
[UVC] Check time duration(us) : 38642 / 66000
[UVC] Check time duration(us) : 26011 / 66000
[UVC] Check time duration(us) : 30116 / 66000
[UVC] Check time duration(us) : 29265 / 66000

Signed-off-by: Kyeongdon Kim <kyeongdon.kim@lge.com>
---
 drivers/media/usb/uvc/uvc_video.c | 55 ++++++++++++++++++++++++++++++++++++---
 drivers/media/usb/uvc/uvcvideo.h  |  3 ++-
 2 files changed, 54 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index e164646..3a7c131 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1614,6 +1614,36 @@ static void uvc_video_complete(struct urb *urb)
 	queue_work(stream->async_wq, &uvc_urb->work);
 }
 
+static void uvc_free_urb_cop(struct uvc_streaming *stream)
+{
+	struct uvc_urb *uvc_urb;
+
+	for_each_uvc_urb(uvc_urb, stream) {
+		if (uvc_urb->copy_operations) {
+			kfree(uvc_urb->copy_operations);
+			uvc_urb->copy_operations = NULL;
+		}
+	}
+}
+
+static int uvc_alloc_urb_cop(struct uvc_streaming *stream, gfp_t gfp_flags)
+{
+	int max_packet = stream->urb_max_packets;
+	struct uvc_urb *uvc_urb;
+
+	for_each_uvc_urb(uvc_urb, stream) {
+		uvc_urb->copy_operations
+				= kcalloc(max_packet, sizeof(struct uvc_copy_op), gfp_flags);
+		if (uvc_urb->copy_operations == NULL)
+			goto error;
+	}
+	return 0;
+error:
+	uvc_free_urb_cop(stream);
+
+	return -ENOMEM;
+}
+
 /*
  * Free transfer buffers.
  */
@@ -1687,8 +1717,8 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
 	 * payloads across multiple URBs.
 	 */
 	npackets = DIV_ROUND_UP(size, psize);
-	if (npackets > UVC_MAX_PACKETS)
-		npackets = UVC_MAX_PACKETS;
+	if (npackets > stream->urb_max_packets)
+		npackets = stream->urb_max_packets;
 
 	/* Retry allocations until one succeed. */
 	for (; npackets > 1; npackets /= 2) {
@@ -1744,8 +1774,10 @@ static void uvc_video_stop_transfer(struct uvc_streaming *stream,
 		uvc_urb->urb = NULL;
 	}
 
-	if (free_buffers)
+	if (free_buffers) {
 		uvc_free_urb_buffers(stream);
+		uvc_free_urb_cop(stream);
+	}
 }
 
 /*
@@ -1790,10 +1822,18 @@ static int uvc_init_video_isoc(struct uvc_streaming *stream,
 	psize = uvc_endpoint_max_bpi(stream->dev->udev, ep);
 	size = stream->ctrl.dwMaxVideoFrameSize;
 
+	stream->urb_max_packets = UVC_MAX_PACKETS;
+
 	npackets = uvc_alloc_urb_buffers(stream, size, psize, gfp_flags);
 	if (npackets == 0)
 		return -ENOMEM;
 
+	if (uvc_alloc_urb_cop(stream, gfp_flags) != 0) {
+		uvc_dbg(stream->dev, VIDEO,
+				"Failed to init URBs copy operations.\n");
+		return -ENOMEM;
+	}
+
 	size = npackets * psize;
 
 	for_each_uvc_urb(uvc_urb, stream) {
@@ -1842,11 +1882,18 @@ static int uvc_init_video_bulk(struct uvc_streaming *stream,
 	psize = usb_endpoint_maxp(&ep->desc);
 	size = stream->ctrl.dwMaxPayloadTransferSize;
 	stream->bulk.max_payload_size = size;
+	stream->urb_max_packets = DIV_ROUND_UP(size, psize);
 
 	npackets = uvc_alloc_urb_buffers(stream, size, psize, gfp_flags);
 	if (npackets == 0)
 		return -ENOMEM;
 
+	if (uvc_alloc_urb_cop(stream, gfp_flags) != 0) {
+		uvc_dbg(stream->dev, VIDEO,
+				"Failed to init URBs copy operations.\n");
+		return -ENOMEM;
+	}
+
 	size = npackets * psize;
 
 	if (usb_endpoint_dir_in(&ep->desc))
@@ -2147,6 +2194,8 @@ int uvc_video_init(struct uvc_streaming *stream)
 		}
 	}
 
+	stream->urb_max_packets = UVC_MAX_PACKETS;
+
 	/* Prepare asynchronous work items. */
 	for_each_uvc_urb(uvc_urb, stream)
 		INIT_WORK(&uvc_urb->work, uvc_video_copy_data_work);
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index cce5e38..00cf6c9 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -561,7 +561,7 @@ struct uvc_urb {
 	struct sg_table *sgt;
 
 	unsigned int async_operations;
-	struct uvc_copy_op copy_operations[UVC_MAX_PACKETS];
+	struct uvc_copy_op *copy_operations;
 	struct work_struct work;
 };
 
@@ -616,6 +616,7 @@ struct uvc_streaming {
 
 	struct uvc_urb uvc_urb[UVC_URBS];
 	unsigned int urb_size;
+	unsigned int urb_max_packets;
 
 	u32 sequence;
 	u8 last_fid;
-- 
2.10.2

