Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0818816809
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2019 18:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbfEGQjs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 May 2019 12:39:48 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:52366 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726458AbfEGQjs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 May 2019 12:39:48 -0400
Received: (qmail 5705 invoked by uid 2102); 7 May 2019 12:39:47 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 7 May 2019 12:39:47 -0400
Date:   Tue, 7 May 2019 12:39:47 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     mchehab@kernel.org
cc:     andreyknvl@google.com,
        Kernel development list <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        <syzkaller-bugs@googlegroups.com>, <wen.yang99@zte.com.cn>
Subject: [PATCH] media: usb: siano: Fix general protection fault in smsusb
In-Reply-To: <0000000000004a08f805883ead54@google.com>
Message-ID: <Pine.LNX.4.44L0.1905071237310.1632-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The syzkaller USB fuzzer found a general-protection-fault bug in the
smsusb part of the Siano DVB driver.  The fault occurs during probe
because the driver assumes without checking that the device has both
IN and OUT endpoints and the IN endpoint is ep1.

By slightly rearranging the driver's initialization code, we can make
the appropriate checks early on and thus avoid the problem.  If the
expected endpoints aren't present, the new code safely returns -ENODEV
from the probe routine.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Reported-and-tested-by: syzbot+53f029db71c19a47325a@syzkaller.appspotmail.com
CC: <stable@vger.kernel.org>

---


[as1897]


 drivers/media/usb/siano/smsusb.c |   33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

Index: usb-devel/drivers/media/usb/siano/smsusb.c
===================================================================
--- usb-devel.orig/drivers/media/usb/siano/smsusb.c
+++ usb-devel/drivers/media/usb/siano/smsusb.c
@@ -400,6 +400,7 @@ static int smsusb_init_device(struct usb
 	struct smsusb_device_t *dev;
 	void *mdev;
 	int i, rc;
+	int in_maxp;
 
 	/* create device object */
 	dev = kzalloc(sizeof(struct smsusb_device_t), GFP_KERNEL);
@@ -411,6 +412,24 @@ static int smsusb_init_device(struct usb
 	dev->udev = interface_to_usbdev(intf);
 	dev->state = SMSUSB_DISCONNECTED;
 
+	for (i = 0; i < intf->cur_altsetting->desc.bNumEndpoints; i++) {
+		struct usb_endpoint_descriptor *desc =
+				&intf->cur_altsetting->endpoint[i].desc;
+
+		if (desc->bEndpointAddress & USB_DIR_IN) {
+			dev->in_ep = desc->bEndpointAddress;
+			in_maxp = usb_endpoint_maxp(desc);
+		} else {
+			dev->out_ep = desc->bEndpointAddress;
+		}
+	}
+
+	pr_debug("in_ep = %02x, out_ep = %02x\n", dev->in_ep, dev->out_ep);
+	if (!dev->in_ep || !dev->out_ep) {	/* Missing endpoints? */
+		smsusb_term_device(intf);
+		return -ENODEV;
+	}
+
 	params.device_type = sms_get_board(board_id)->type;
 
 	switch (params.device_type) {
@@ -425,24 +444,12 @@ static int smsusb_init_device(struct usb
 		/* fall-thru */
 	default:
 		dev->buffer_size = USB2_BUFFER_SIZE;
-		dev->response_alignment =
-		    le16_to_cpu(dev->udev->ep_in[1]->desc.wMaxPacketSize) -
-		    sizeof(struct sms_msg_hdr);
+		dev->response_alignment = in_maxp - sizeof(struct sms_msg_hdr);
 
 		params.flags |= SMS_DEVICE_FAMILY2;
 		break;
 	}
 
-	for (i = 0; i < intf->cur_altsetting->desc.bNumEndpoints; i++) {
-		if (intf->cur_altsetting->endpoint[i].desc. bEndpointAddress & USB_DIR_IN)
-			dev->in_ep = intf->cur_altsetting->endpoint[i].desc.bEndpointAddress;
-		else
-			dev->out_ep = intf->cur_altsetting->endpoint[i].desc.bEndpointAddress;
-	}
-
-	pr_debug("in_ep = %02x, out_ep = %02x\n",
-		dev->in_ep, dev->out_ep);
-
 	params.device = &dev->udev->dev;
 	params.usb_device = dev->udev;
 	params.buffer_size = dev->buffer_size;

