Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A948A165ED
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2019 16:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbfEGOm7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 May 2019 10:42:59 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:51814 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726337AbfEGOm7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 May 2019 10:42:59 -0400
Received: (qmail 2035 invoked by uid 2102); 7 May 2019 10:42:58 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 7 May 2019 10:42:58 -0400
Date:   Tue, 7 May 2019 10:42:58 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Johan Hovold <johan@kernel.org>
cc:     syzbot <syzbot+53f029db71c19a47325a@syzkaller.appspotmail.com>,
        <andreyknvl@google.com>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <mchehab@kernel.org>, <syzkaller-bugs@googlegroups.com>,
        <wen.yang99@zte.com.cn>
Subject: Re: general protection fault in smsusb_init_device
In-Reply-To: <20190507083430.GD4333@localhost>
Message-ID: <Pine.LNX.4.44L0.1905071035450.1632-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 7 May 2019, Johan Hovold wrote:

> On Mon, May 06, 2019 at 04:41:41PM -0400, Alan Stern wrote:
> > On Thu, 18 Apr 2019, syzbot wrote:
> > 
> > > Hello,
> > > 
> > > syzbot found the following crash on:
> > > 
> > > HEAD commit:    d34f9519 usb-fuzzer: main usb gadget fuzzer driver
> > > git tree:       https://github.com/google/kasan/tree/usb-fuzzer
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=128ec3fd200000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=c73d1bb5aeaeae20
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=53f029db71c19a47325a
> > > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16138e67200000
> > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=128dddbf200000
> > > 
> > > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > > Reported-by: syzbot+53f029db71c19a47325a@syzkaller.appspotmail.com
> > > 
> > > usb 1-1: config 0 descriptor??
> > > usb 1-1: string descriptor 0 read error: -71
> > > smsusb:smsusb_probe: board id=18, interface number 0
> > > kasan: CONFIG_KASAN_INLINE enabled
> > > kasan: GPF could be caused by NULL-ptr deref or user memory access
> > > general protection fault: 0000 [#1] SMP KASAN PTI
> > > CPU: 1 PID: 22 Comm: kworker/1:1 Not tainted 5.1.0-rc5-319617-gd34f951 #4
> > > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
> > > Google 01/01/2011
> > > Workqueue: usb_hub_wq hub_event
> > > RIP: 0010:smsusb_init_device+0x366/0x937  
> > > drivers/media/usb/siano/smsusb.c:429
> > 
> > The driver assumes endpoint 1in exists, and doesn't check the existence 
> > of the endpoints it uses.
> > 
> > Alan Stern
> > 
> > 
> > #syz test: https://github.com/google/kasan.git usb-fuzzer
> > 
> >  drivers/media/usb/siano/smsusb.c |   32 +++++++++++++++++++-------------
> >  1 file changed, 19 insertions(+), 13 deletions(-)
> > 
> > Index: usb-devel/drivers/media/usb/siano/smsusb.c
> > ===================================================================
> > --- usb-devel.orig/drivers/media/usb/siano/smsusb.c
> > +++ usb-devel/drivers/media/usb/siano/smsusb.c
> > @@ -400,6 +400,7 @@ static int smsusb_init_device(struct usb
> >  	struct smsusb_device_t *dev;
> >  	void *mdev;
> >  	int i, rc;
> > +	int in_maxp;
> >  
> >  	/* create device object */
> >  	dev = kzalloc(sizeof(struct smsusb_device_t), GFP_KERNEL);
> > @@ -411,6 +412,23 @@ static int smsusb_init_device(struct usb
> >  	dev->udev = interface_to_usbdev(intf);
> >  	dev->state = SMSUSB_DISCONNECTED;
> >  
> > +	for (i = 0; i < intf->cur_altsetting->desc.bNumEndpoints; i++) {
> > +		struct usb_endpoint_descriptor *desc =
> > +				&intf->cur_altsetting->endpoint[i].desc;
> > +
> > +		if (desc->bEndpointAddress & USB_DIR_IN) {
> > +			dev->in_ep = desc->bEndpointAddress;
> > +			in_maxp = usb_endpoint_maxp(desc);
> > +		} else {
> > +			dev->out_ep = desc->bEndpointAddress;
> > +		}
> > +	}
> > +
> > +	pr_debug("in_ep = %02x, out_ep = %02x\n",
> > +		dev->in_ep, dev->out_ep);
> > +	if (!dev->in_ep || !dev->out_ep)	/* Missing endpoints? */
> > +		return -EINVAL;
> 
> Looks like you're now leaking dev here, and so is the current code in
> the later error paths.
> 
> Since this return value will be returned from probe, you may want to use
> -ENXIO or -ENODEV instead of -EINVAL.
> 
> Looks good otherwise.

Thanks for the review.  You're right about the memory leak (although 
you're wrong about the later error paths: smsusb_term_device() 
deallocates dev).  And -ENODEV does seem like a better return code.

I'll update the patch as you suggest.

Alan Stern

