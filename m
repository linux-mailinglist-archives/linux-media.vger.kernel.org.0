Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9B92990E
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2019 15:35:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403821AbfEXNfu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 May 2019 09:35:50 -0400
Received: from casper.infradead.org ([85.118.1.10]:56308 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403804AbfEXNfu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 May 2019 09:35:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=a84L9ZynbQTHP9MHDmUi2uab2LrEajX0zeKKzUoHR2Q=; b=QbNFbzbaVGx6nDE4Lt/gz/ontH
        mryLBk30+Ei/1aJ+mmhUQ1nwSoK+Py0cZktjf95fKVLP0ih2qCetBqumwAPZ3v9hvga8J/u12VOsz
        wFi+JwWMK3ZMvFf/WHD8qCexM6jX0O6LKU8b+ka+TM8Xd9igf8AIzEuu91xScDMK9qQ7WQYz07wlG
        TdPelpbWfdjxSj1WSXwumK1MacDG7AWnyZvKhmxIl/YWXUj5unKVWShDq38fDFgU5zM9KPc3Cn74W
        NLqjEzHu1Q2rAsc2qy6QCf6WI11FyYoYaoQNTJviuZrQP0QGneB+DzhTgL3jLGdU2wL5dzxCj1D4J
        9HSKYaAQ==;
Received: from 177.97.63.247.dynamic.adsl.gvt.net.br ([177.97.63.247] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hUAML-00007l-4G; Fri, 24 May 2019 13:35:45 +0000
Date:   Fri, 24 May 2019 10:35:40 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     andreyknvl@google.com,
        Kernel development list <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        <syzkaller-bugs@googlegroups.com>, <wen.yang99@zte.com.cn>
Subject: Re: [PATCH] media: usb: siano: Fix general protection fault in
 smsusb
Message-ID: <20190524103540.250a69e7@coco.lan>
In-Reply-To: <Pine.LNX.4.44L0.1905071237310.1632-100000@iolanthe.rowland.org>
References: <0000000000004a08f805883ead54@google.com>
        <Pine.LNX.4.44L0.1905071237310.1632-100000@iolanthe.rowland.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 7 May 2019 12:39:47 -0400 (EDT)
Alan Stern <stern@rowland.harvard.edu> escreveu:

> The syzkaller USB fuzzer found a general-protection-fault bug in the
> smsusb part of the Siano DVB driver.  The fault occurs during probe
> because the driver assumes without checking that the device has both
> IN and OUT endpoints and the IN endpoint is ep1.
> 
> By slightly rearranging the driver's initialization code, we can make
> the appropriate checks early on and thus avoid the problem.  If the
> expected endpoints aren't present, the new code safely returns -ENODEV
> from the probe routine.
> 
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Reported-and-tested-by: syzbot+53f029db71c19a47325a@syzkaller.appspotmail.com
> CC: <stable@vger.kernel.org>
> 
> ---
> 
> 
> [as1897]
> 
> 
>  drivers/media/usb/siano/smsusb.c |   33 ++++++++++++++++++++-------------
>  1 file changed, 20 insertions(+), 13 deletions(-)
> 
> Index: usb-devel/drivers/media/usb/siano/smsusb.c
> ===================================================================
> --- usb-devel.orig/drivers/media/usb/siano/smsusb.c
> +++ usb-devel/drivers/media/usb/siano/smsusb.c
> @@ -400,6 +400,7 @@ static int smsusb_init_device(struct usb
>  	struct smsusb_device_t *dev;
>  	void *mdev;
>  	int i, rc;
> +	int in_maxp;
>  
>  	/* create device object */
>  	dev = kzalloc(sizeof(struct smsusb_device_t), GFP_KERNEL);
> @@ -411,6 +412,24 @@ static int smsusb_init_device(struct usb
>  	dev->udev = interface_to_usbdev(intf);
>  	dev->state = SMSUSB_DISCONNECTED;
>  
> +	for (i = 0; i < intf->cur_altsetting->desc.bNumEndpoints; i++) {
> +		struct usb_endpoint_descriptor *desc =
> +				&intf->cur_altsetting->endpoint[i].desc;
> +
> +		if (desc->bEndpointAddress & USB_DIR_IN) {
> +			dev->in_ep = desc->bEndpointAddress;
> +			in_maxp = usb_endpoint_maxp(desc);
> +		} else {
> +			dev->out_ep = desc->bEndpointAddress;
> +		}
> +	}
> +
> +	pr_debug("in_ep = %02x, out_ep = %02x\n", dev->in_ep, dev->out_ep);
> +	if (!dev->in_ep || !dev->out_ep) {	/* Missing endpoints? */
> +		smsusb_term_device(intf);
> +		return -ENODEV;
> +	}
> +
>  	params.device_type = sms_get_board(board_id)->type;
>  
>  	switch (params.device_type) {
> @@ -425,24 +444,12 @@ static int smsusb_init_device(struct usb
>  		/* fall-thru */
>  	default:
>  		dev->buffer_size = USB2_BUFFER_SIZE;
> -		dev->response_alignment =
> -		    le16_to_cpu(dev->udev->ep_in[1]->desc.wMaxPacketSize) -
> -		    sizeof(struct sms_msg_hdr);
> +		dev->response_alignment = in_maxp - sizeof(struct sms_msg_hdr);
>  
>  		params.flags |= SMS_DEVICE_FAMILY2;
>  		break;
>  	}
>  
> -	for (i = 0; i < intf->cur_altsetting->desc.bNumEndpoints; i++) {
> -		if (intf->cur_altsetting->endpoint[i].desc. bEndpointAddress & USB_DIR_IN)
> -			dev->in_ep = intf->cur_altsetting->endpoint[i].desc.bEndpointAddress;
> -		else
> -			dev->out_ep = intf->cur_altsetting->endpoint[i].desc.bEndpointAddress;
> -	}
> -
> -	pr_debug("in_ep = %02x, out_ep = %02x\n",
> -		dev->in_ep, dev->out_ep);
> -
>  	params.device = &dev->udev->dev;
>  	params.usb_device = dev->udev;
>  	params.buffer_size = dev->buffer_size;
> 

Patch looks correct, and I'm applying it. It exposes another potential
problem though: what happens if sizeof(desc.wMaxPacketSize) < sizeof(struct sms_msg_hdr)?

I'm enclosing a followup patch that should solve this situation
(and clean up a sparse warning).

Thanks,
Mauro

[PATCH] media: smsusb: better handle optional alignment

Most Siano devices require an alignment for the response.

Changeset f3be52b0056a ("media: usb: siano: Fix general protection fault in smsusb")
changed the logic with gets such aligment, but it now produces a
sparce warning:

drivers/media/usb/siano/smsusb.c: In function 'smsusb_init_device':
drivers/media/usb/siano/smsusb.c:447:37: warning: 'in_maxp' may be used uninitialized in this function [-Wmaybe-uninitialized]
  447 |   dev->response_alignment = in_maxp - sizeof(struct sms_msg_hdr);
      |                             ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~

The sparse message itself is bogus, but a broken (or fake) USB
eeprom could produce a negative value for response_alignment.

So, change the code in order to check if the result is not
negative.

Fixes: f3be52b0056a ("media: usb: siano: Fix general protection fault in smsusb")
CC: <stable@vger.kernel.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/smsusb.c
index 27ad14a3f831..e39f3f40dfdd 100644
--- a/drivers/media/usb/siano/smsusb.c
+++ b/drivers/media/usb/siano/smsusb.c
@@ -400,7 +400,7 @@ static int smsusb_init_device(struct usb_interface *intf, int board_id)
 	struct smsusb_device_t *dev;
 	void *mdev;
 	int i, rc;
-	int in_maxp;
+	int align = 0;
 
 	/* create device object */
 	dev = kzalloc(sizeof(struct smsusb_device_t), GFP_KERNEL);
@@ -418,14 +418,14 @@ static int smsusb_init_device(struct usb_interface *intf, int board_id)
 
 		if (desc->bEndpointAddress & USB_DIR_IN) {
 			dev->in_ep = desc->bEndpointAddress;
-			in_maxp = usb_endpoint_maxp(desc);
+			align = usb_endpoint_maxp(desc) - sizeof(struct sms_msg_hdr);
 		} else {
 			dev->out_ep = desc->bEndpointAddress;
 		}
 	}
 
 	pr_debug("in_ep = %02x, out_ep = %02x\n", dev->in_ep, dev->out_ep);
-	if (!dev->in_ep || !dev->out_ep) {	/* Missing endpoints? */
+	if (!dev->in_ep || !dev->out_ep || align < 0) {  /* Missing endpoints? */
 		smsusb_term_device(intf);
 		return -ENODEV;
 	}
@@ -444,7 +444,7 @@ static int smsusb_init_device(struct usb_interface *intf, int board_id)
 		/* fall-thru */
 	default:
 		dev->buffer_size = USB2_BUFFER_SIZE;
-		dev->response_alignment = in_maxp - sizeof(struct sms_msg_hdr);
+		dev->response_alignment = align;
 
 		params.flags |= SMS_DEVICE_FAMILY2;
 		break;




