Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1D6668259
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 04:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727721AbfGOCvV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jul 2019 22:51:21 -0400
Received: from resqmta-ch2-01v.sys.comcast.net ([69.252.207.33]:35374 "EHLO
        resqmta-ch2-01v.sys.comcast.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726074AbfGOCvV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jul 2019 22:51:21 -0400
Received: from resomta-ch2-11v.sys.comcast.net ([69.252.207.107])
        by resqmta-ch2-01v.sys.comcast.net with ESMTP
        id mr5DhDYnmJ4bumr5DhExaY; Mon, 15 Jul 2019 02:51:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
        s=20190202a; t=1563159079;
        bh=dLNq7fjNFNyl0PjHENgOIFxLOASJ2Y4AXXdFaD1EiDo=;
        h=Received:Received:To:From:Subject:Message-ID:Date:MIME-Version:
         Content-Type;
        b=iIwlYwJCK2RPMLrYGIpobF6e/nHX768DC/0MMD75NFErxGz1F2ltosDgW2Y9fODSV
         UEY5kss2FXAQfMGVmjfO/oIs5PYx+2qzlfzUWEXxrkjY+hJp5AZxxMl7/UpYZlIWlP
         nmbPfLVHVRNnCnDWPROIZGClkHJTAHIg2w/L/dPPmwfhUkkUGclGLIwpuLNig15GEu
         /DTN6ACVvi8I0bEiNIt/o+FPjMyvuQrHknNQbBSMiGiKvkrngyZDzphAEyORwGDjdL
         KjpNgI1rvHXI1PZ9gIoXelZWPN/I70qshZPun4lqveTqjQXdEotE0Z86YAYZ70X0/Y
         8k+tMIo/rJpyQ==
Received: from [192.168.4.4] ([73.248.220.215])
        by resomta-ch2-11v.sys.comcast.net with ESMTPA
        id mr57h4R2fI3dLmr5Dh9Rwa; Mon, 15 Jul 2019 02:51:19 +0000
X-Xfinity-VAAS: gggruggvucftvghtrhhoucdtuddrgeduvddrheejgdefjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucevohhmtggrshhtqdftvghsihdpqfgfvfdppffquffrtefokffrnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefvhffukffffgggtgfgsehtjeertddtfeejnecuhfhrohhmpeetucfuuhhnuceorghsuddtfeefgiestghomhgtrghsthdrnhgvtheqnecukfhppeejfedrvdegkedrvddvtddrvdduheenucfrrghrrghmpehhvghloheplgduledvrdduieekrdegrdegngdpihhnvghtpeejfedrvdegkedrvddvtddrvdduhedpmhgrihhlfhhrohhmpegrshdutdeffeigsegtohhmtggrshhtrdhnvghtpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgvrghnsehmvghsshdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-Xfinity-VMeta: sc=-100;st=legit
To:     linux-media@vger.kernel.org
Cc:     sean@mess.org, Mauro Carvalho Chehab <mchehab@kernel.org>
From:   A Sun <as1033x@comcast.net>
Subject: [PATCH v1] [media] mceusb: USB reset device following USB clear halt
 error
Message-ID: <ce188a90-4036-60ed-c0a3-89ebdcc66e9c@comcast.net>
Date:   Sun, 14 Jul 2019 22:51:26 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


This patch supersedes
  [PATCH v2 3/3][media] mceusb: Show USB halt/stall error recovery

This patch schedules a USB reset device call following a USB clear
halt error. The issues solved, and patch implementation,
are similar to those found in
  drivers/hid/usbhid/hid-core.c.

As seen on very rare occasions approximately one time per month
(mceusb device 2304:0225 in this sample)
  Jul 27 2018 15:09:39
  [59388.696941] mceusb 1-1.1.2:1.0: Error: urb status = -32 (RX HALT)
  [59388.698838] mceusb 1-1.1.2:1.0: rx clear halt error -32
the device can get into RX or TX HALT state where usb_clear_halt()
also fails and also returns -EPIPE (HALT/STALL). After which, all
further mceusb device control and data I/O always fail with HALT/STALL.
Subsequently, the entire mceusb device no longer functions.
Cause and problem replication conditions remain unknown.

Further troubleshooting reveals usb_reset_device()
restores mceusb device operation.

Patch test 1:

Hot unplugging the mceusb device triggers USB RX HALT and
USB clear halt errors. A mceusb_dev_disconnect() call follows unplug.
This patch's reset device call invokes an extra
  mceusb_dev_probe()
  mceusb_dev_disconnect()
cycle, before the mceusb driver detaches.
The additional probe/disconnect verifies the patch's device reset
code executed.

But note this patch is for USB clear halt error cases not caused by
unplugging the mceusb device.

Patch test 2:

Simulate a RX HALT and a clear halt error with instrumented code in
the driver.
  Jul 12 2019 19:41:18
  [522745.263104] mceusb 1-1.3:1.0: set rx halt retval, 0
  [522745.263943] mceusb 1-1.3:1.0: Error: rx urb status = -32 (RX HALT)
  [522745.263970] mceusb 1-1.3:1.0: kevent 1 scheduled
  [522745.264016] mceusb 1-1.3:1.0: kevent handler called (flags 0x2)
  [522745.272883] mceusb 1-1.3:1.0: rx clear halt status = 0
  [522745.272917] mceusb 1-1.3:1.0: stuck RX HALT state requires USB Reset Device to clear
  [522745.273005] mceusb 1-1.3:1.0: mceusb_dev_disconnect called
  [522745.702815] usb 1-1.3: reset full-speed USB device number 14 using dwc_otg
  [522745.836812] mceusb 1-1.3:1.0: mceusb_dev_probe called
  [522745.836823] mceusb 1-1.3:1.0: acceptable bulk inbound endpoint found
  [522745.836832] mceusb 1-1.3:1.0: acceptable bulk outbound endpoint found
  ...
The result matches what is expected when the device gets into
a real rx clear halt error case by itself.
This is the same sequence of messages when manually invoking
the ./usbreset command line utility with an unpatched mceusb driver.

Signed-off-by: A Sun <as1033x@comcast.net>
---
 drivers/media/rc/mceusb.c | 67 ++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 55 insertions(+), 12 deletions(-)

diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
index efffb1795..2e86876f2 100644
--- a/drivers/media/rc/mceusb.c
+++ b/drivers/media/rc/mceusb.c
@@ -467,6 +467,7 @@ struct mceusb_dev {
 
 	/* usb */
 	struct usb_device *usbdev;
+	struct usb_interface *usbintf;
 	struct urb *urb_in;
 	unsigned int pipe_in;
 	struct usb_endpoint_descriptor *usb_ep_out;
@@ -523,6 +524,7 @@ struct mceusb_dev {
 	unsigned long kevent_flags;
 #		define EVENT_TX_HALT	0
 #		define EVENT_RX_HALT	1
+#		define EVENT_RST_PEND	31
 };
 
 /* MCE Device Command Strings, generally a port and command pair */
@@ -764,8 +766,15 @@ static void mceusb_dev_printdata(struct mceusb_dev *ir, u8 *buf, int buf_len,
 static void mceusb_defer_kevent(struct mceusb_dev *ir, int kevent)
 {
 	set_bit(kevent, &ir->kevent_flags);
+
+	if (test_bit(EVENT_RST_PEND, &ir->kevent_flags)) {
+		dev_dbg(ir->dev, "kevent %d dropped pending USB Reset Device",
+			kevent);
+		return;
+	}
+
 	if (!schedule_work(&ir->kevent))
-		dev_err(ir->dev, "kevent %d may have been dropped", kevent);
+		dev_dbg(ir->dev, "kevent %d already scheduled", kevent);
 	else
 		dev_dbg(ir->dev, "kevent %d scheduled", kevent);
 }
@@ -1404,28 +1413,59 @@ static void mceusb_deferred_kevent(struct work_struct *work)
 		container_of(work, struct mceusb_dev, kevent);
 	int status;
 
+	dev_err(ir->dev, "kevent handler called (flags 0x%lx)",
+		ir->kevent_flags);
+
+	if (test_bit(EVENT_RST_PEND, &ir->kevent_flags)) {
+		dev_err(ir->dev, "kevent handler canceled pending USB Reset Device");
+		return;
+	}
+
 	if (test_bit(EVENT_RX_HALT, &ir->kevent_flags)) {
 		usb_unlink_urb(ir->urb_in);
 		status = usb_clear_halt(ir->usbdev, ir->pipe_in);
+		dev_err(ir->dev, "rx clear halt status = %d", status);
 		if (status < 0) {
-			dev_err(ir->dev, "rx clear halt error %d",
-				status);
+			/*
+			 * Unable to clear RX halt/stall.
+			 * Will need to call usb_reset_device().
+			 */
+			dev_err(ir->dev,
+				"stuck RX HALT state requires USB Reset Device to clear");
+			usb_queue_reset_device(ir->usbintf);
+			set_bit(EVENT_RST_PEND, &ir->kevent_flags);
+			clear_bit(EVENT_RX_HALT, &ir->kevent_flags);
+
+			/* Cancel all other error events and handlers */
+			clear_bit(EVENT_TX_HALT, &ir->kevent_flags);
+			return;
 		}
 		clear_bit(EVENT_RX_HALT, &ir->kevent_flags);
-		if (status == 0) {
-			status = usb_submit_urb(ir->urb_in, GFP_KERNEL);
-			if (status < 0) {
-				dev_err(ir->dev,
-					"rx unhalt submit urb error %d",
-					status);
-			}
+		status = usb_submit_urb(ir->urb_in, GFP_KERNEL);
+		if (status < 0) {
+			dev_err(ir->dev, "rx unhalt submit urb error = %d",
+				status);
 		}
 	}
 
 	if (test_bit(EVENT_TX_HALT, &ir->kevent_flags)) {
 		status = usb_clear_halt(ir->usbdev, ir->pipe_out);
-		if (status < 0)
-			dev_err(ir->dev, "tx clear halt error %d", status);
+		dev_err(ir->dev, "tx clear halt status = %d", status);
+		if (status < 0) {
+			/*
+			 * Unable to clear TX halt/stall.
+			 * Will need to call usb_reset_device().
+			 */
+			dev_err(ir->dev,
+				"stuck TX HALT state requires USB Reset Device to clear");
+			usb_queue_reset_device(ir->usbintf);
+			set_bit(EVENT_RST_PEND, &ir->kevent_flags);
+			clear_bit(EVENT_TX_HALT, &ir->kevent_flags);
+
+			/* Cancel all other error events and handlers */
+			clear_bit(EVENT_RX_HALT, &ir->kevent_flags);
+			return;
+		}
 		clear_bit(EVENT_TX_HALT, &ir->kevent_flags);
 	}
 }
@@ -1589,6 +1629,7 @@ static int mceusb_dev_probe(struct usb_interface *intf,
 		goto urb_in_alloc_fail;
 	}
 
+	ir->usbintf = intf;
 	ir->usbdev = usb_get_dev(dev);
 	ir->dev = &intf->dev;
 	ir->len_in = maxp;
@@ -1696,6 +1737,8 @@ static void mceusb_dev_disconnect(struct usb_interface *intf)
 	struct usb_device *dev = interface_to_usbdev(intf);
 	struct mceusb_dev *ir = usb_get_intfdata(intf);
 
+	dev_dbg(&intf->dev, "%s called", __func__);
+
 	usb_set_intfdata(intf, NULL);
 
 	if (!ir)
-- 
2.11.0

