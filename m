Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16BFA469921
	for <lists+linux-media@lfdr.de>; Mon,  6 Dec 2021 15:37:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344440AbhLFOkj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Dec 2021 09:40:39 -0500
Received: from gofer.mess.org ([88.97.38.141]:47105 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244773AbhLFOki (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Dec 2021 09:40:38 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 804C6C63C2; Mon,  6 Dec 2021 14:37:08 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1638801428; bh=TykkLm2xhObcuB/rvpCHJh5+X02KEjytZ8xm8kqjk4M=;
        h=From:To:Subject:Date:From;
        b=n2LYW03VSOymtIzYrwYTokFZO4i3zC4rhrDajNH6kJneY+KWAiJIGcD8LZjd1E8uX
         yyuZPp0ew97sSDyFxCgbiUB3DjfikAIR6iZlw+IaKhzByNgEJVJdWh3q+gpUasuV1g
         dyGn9IMi7Wz/7FM/mzQydgsVZ0l67hRALIVc78kNNyS1tjqAYmj3nSVww4mhQlu0BX
         27LXsGRU2cD++/D1gopCmL1rBioy75htF5m1au72BK8mO24N3Ym6qMteHNlBl9VBCH
         i9k7HH9z998rycujuVjRri6NvLot6renIUdNd+fWBCwnOW6gp5DO5faS/hdnwk8x4k
         SSuASY6Lawumw==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/2] media: streamzap: remove unused struct members
Date:   Mon,  6 Dec 2021 14:37:07 +0000
Message-Id: <3756e0cf7c64858510531867a9c10dbd80c1ee40.1638801410.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These struct members do not serve any purpose.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/streamzap.c | 36 ++++++++++++++----------------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/drivers/media/rc/streamzap.c b/drivers/media/rc/streamzap.c
index 4d3670d2a913..39856af16305 100644
--- a/drivers/media/rc/streamzap.c
+++ b/drivers/media/rc/streamzap.c
@@ -66,9 +66,6 @@ struct streamzap_ir {
 	struct device *dev;
 
 	/* usb */
-	struct usb_device	*usbdev;
-	struct usb_interface	*interface;
-	struct usb_endpoint_descriptor *endpoint;
 	struct urb		*urb_in;
 
 	/* buffer & dma */
@@ -85,7 +82,6 @@ struct streamzap_ir {
 	/* start time of signal; necessary for gap tracking */
 	ktime_t			signal_last;
 	ktime_t			signal_start;
-	bool			timeout_enabled;
 
 	char			phys[64];
 };
@@ -240,8 +236,7 @@ static void streamzap_callback(struct urb *urb)
 					.duration = sz->rdev->timeout
 				};
 				sz->idle = true;
-				if (sz->timeout_enabled)
-					sz_push(sz, rawir);
+				sz_push(sz, rawir);
 			} else {
 				sz_push_full_space(sz, sz->buf_in[i]);
 			}
@@ -263,7 +258,8 @@ static void streamzap_callback(struct urb *urb)
 	usb_submit_urb(urb, GFP_ATOMIC);
 }
 
-static struct rc_dev *streamzap_init_rc_dev(struct streamzap_ir *sz)
+static struct rc_dev *streamzap_init_rc_dev(struct streamzap_ir *sz,
+					    struct usb_device *usbdev)
 {
 	struct rc_dev *rdev;
 	struct device *dev = sz->dev;
@@ -273,12 +269,12 @@ static struct rc_dev *streamzap_init_rc_dev(struct streamzap_ir *sz)
 	if (!rdev)
 		goto out;
 
-	usb_make_path(sz->usbdev, sz->phys, sizeof(sz->phys));
+	usb_make_path(usbdev, sz->phys, sizeof(sz->phys));
 	strlcat(sz->phys, "/input0", sizeof(sz->phys));
 
 	rdev->device_name = "Streamzap PC Remote Infrared Receiver";
 	rdev->input_phys = sz->phys;
-	usb_to_input_id(sz->usbdev, &rdev->input_id);
+	usb_to_input_id(usbdev, &rdev->input_id);
 	rdev->dev.parent = dev;
 	rdev->priv = sz;
 	rdev->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
@@ -310,6 +306,7 @@ static int streamzap_probe(struct usb_interface *intf,
 			   const struct usb_device_id *id)
 {
 	struct usb_device *usbdev = interface_to_usbdev(intf);
+	struct usb_endpoint_descriptor *endpoint;
 	struct usb_host_interface *iface_host;
 	struct streamzap_ir *sz = NULL;
 	int retval = -ENOMEM;
@@ -320,9 +317,6 @@ static int streamzap_probe(struct usb_interface *intf,
 	if (!sz)
 		return -ENOMEM;
 
-	sz->usbdev = usbdev;
-	sz->interface = intf;
-
 	/* Check to ensure endpoint information matches requirements */
 	iface_host = intf->cur_altsetting;
 
@@ -333,22 +327,22 @@ static int streamzap_probe(struct usb_interface *intf,
 		goto free_sz;
 	}
 
-	sz->endpoint = &(iface_host->endpoint[0].desc);
-	if (!usb_endpoint_dir_in(sz->endpoint)) {
+	endpoint = &iface_host->endpoint[0].desc;
+	if (!usb_endpoint_dir_in(endpoint)) {
 		dev_err(&intf->dev, "%s: endpoint doesn't match input device 02%02x\n",
-			__func__, sz->endpoint->bEndpointAddress);
+			__func__, endpoint->bEndpointAddress);
 		retval = -ENODEV;
 		goto free_sz;
 	}
 
-	if (!usb_endpoint_xfer_int(sz->endpoint)) {
+	if (!usb_endpoint_xfer_int(endpoint)) {
 		dev_err(&intf->dev, "%s: endpoint attributes don't match xfer 02%02x\n",
-			__func__, sz->endpoint->bmAttributes);
+			__func__, endpoint->bmAttributes);
 		retval = -ENODEV;
 		goto free_sz;
 	}
 
-	pipe = usb_rcvintpipe(usbdev, sz->endpoint->bEndpointAddress);
+	pipe = usb_rcvintpipe(usbdev, endpoint->bEndpointAddress);
 	maxp = usb_maxpacket(usbdev, pipe, usb_pipeout(pipe));
 
 	if (maxp == 0) {
@@ -370,14 +364,13 @@ static int streamzap_probe(struct usb_interface *intf,
 	sz->dev = &intf->dev;
 	sz->buf_in_len = maxp;
 
-	sz->rdev = streamzap_init_rc_dev(sz);
+	sz->rdev = streamzap_init_rc_dev(sz, usbdev);
 	if (!sz->rdev)
 		goto rc_dev_fail;
 
 	sz->idle = true;
 	sz->decoder_state = PulseSpace;
 	/* FIXME: don't yet have a way to set this */
-	sz->timeout_enabled = true;
 	sz->rdev->timeout = SZ_TIMEOUT * SZ_RESOLUTION;
 	#if 0
 	/* not yet supported, depends on patches from maxim */
@@ -391,7 +384,7 @@ static int streamzap_probe(struct usb_interface *intf,
 	/* Complete final initialisations */
 	usb_fill_int_urb(sz->urb_in, usbdev, pipe, sz->buf_in,
 			 maxp, (usb_complete_t)streamzap_callback,
-			 sz, sz->endpoint->bInterval);
+			 sz, endpoint->bInterval);
 	sz->urb_in->transfer_dma = sz->dma_in;
 	sz->urb_in->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
 
@@ -432,7 +425,6 @@ static void streamzap_disconnect(struct usb_interface *interface)
 	if (!sz)
 		return;
 
-	sz->usbdev = NULL;
 	rc_unregister_device(sz->rdev);
 	usb_kill_urb(sz->urb_in);
 	usb_free_urb(sz->urb_in);
-- 
2.33.1

