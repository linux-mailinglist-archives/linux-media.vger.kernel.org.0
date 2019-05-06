Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD96715501
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2019 22:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbfEFUlm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 May 2019 16:41:42 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:52512 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726438AbfEFUlm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 May 2019 16:41:42 -0400
Received: (qmail 5462 invoked by uid 2102); 6 May 2019 16:41:41 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 6 May 2019 16:41:41 -0400
Date:   Mon, 6 May 2019 16:41:41 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     syzbot <syzbot+53f029db71c19a47325a@syzkaller.appspotmail.com>
cc:     andreyknvl@google.com, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <mchehab@kernel.org>, <syzkaller-bugs@googlegroups.com>,
        <wen.yang99@zte.com.cn>
Subject: Re: general protection fault in smsusb_init_device
In-Reply-To: <0000000000008d89900586ccd37b@google.com>
Message-ID: <Pine.LNX.4.44L0.1905061638380.1585-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 18 Apr 2019, syzbot wrote:

> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    d34f9519 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan/tree/usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=128ec3fd200000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=c73d1bb5aeaeae20
> dashboard link: https://syzkaller.appspot.com/bug?extid=53f029db71c19a47325a
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16138e67200000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=128dddbf200000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+53f029db71c19a47325a@syzkaller.appspotmail.com
> 
> usb 1-1: config 0 descriptor??
> usb 1-1: string descriptor 0 read error: -71
> smsusb:smsusb_probe: board id=18, interface number 0
> kasan: CONFIG_KASAN_INLINE enabled
> kasan: GPF could be caused by NULL-ptr deref or user memory access
> general protection fault: 0000 [#1] SMP KASAN PTI
> CPU: 1 PID: 22 Comm: kworker/1:1 Not tainted 5.1.0-rc5-319617-gd34f951 #4
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
> Google 01/01/2011
> Workqueue: usb_hub_wq hub_event
> RIP: 0010:smsusb_init_device+0x366/0x937  
> drivers/media/usb/siano/smsusb.c:429

The driver assumes endpoint 1in exists, and doesn't check the existence 
of the endpoints it uses.

Alan Stern


#syz test: https://github.com/google/kasan.git usb-fuzzer

 drivers/media/usb/siano/smsusb.c |   32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

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
@@ -411,6 +412,23 @@ static int smsusb_init_device(struct usb
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
+	pr_debug("in_ep = %02x, out_ep = %02x\n",
+		dev->in_ep, dev->out_ep);
+	if (!dev->in_ep || !dev->out_ep)	/* Missing endpoints? */
+		return -EINVAL;
+
 	params.device_type = sms_get_board(board_id)->type;
 
 	switch (params.device_type) {
@@ -425,24 +443,12 @@ static int smsusb_init_device(struct usb
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

