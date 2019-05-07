Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AC9315F70
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2019 10:34:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbfEGIed (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 May 2019 04:34:33 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45502 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbfEGIed (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 May 2019 04:34:33 -0400
Received: by mail-lj1-f194.google.com with SMTP id r76so2443825lja.12;
        Tue, 07 May 2019 01:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JVwysLC6toX2nyIeQoEP1UKJSN5udlnWwblQh6x6pT0=;
        b=blBmAm0OpW0B8WbcjIwqSDGTJPb31Qdt4XuH8z7CduanKt2BUn5kSaigkD4c9Kg312
         sH/xHeR3T3xUDXfDGoVeCLuN4enVw8dKX2D1leq5Xq9s64a0xrV5VJDQc01gliPUKkrH
         tF+b2nywJHI2r9DN7047vIv8qS/4cKYJwL+5d9pYgejRuI2sYrpp9ict5Y+ZFGVW6b8+
         9O+YTyDVSZFNBroSM1hdWwaEOwhSXkqTbBREpJuI6yPt+u/MxrJ8oQFG04P+2kjSyLkD
         Q22BbCU6WpN2qH0jkccnr7RZYyUNwKnsHa2Z14cK/yfQrFjc0OVQ4nt+TUUb52VqG3eT
         ANfg==
X-Gm-Message-State: APjAAAXq4Tz6lTMBbNxVoueHOP8yPOG+IlimPocF7tJdqAiDakvBvjlF
        6gG4jKtInlP/w8UudyAgV4Y=
X-Google-Smtp-Source: APXvYqz2fBtz+GXsvkihKxsOKNeL6Kpuy9x3cAuWG48o19KNu9qW6OyOXPHMXK2/1GINfd/FZYqRTQ==
X-Received: by 2002:a2e:3311:: with SMTP id d17mr16663969ljc.52.1557218071028;
        Tue, 07 May 2019 01:34:31 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id d23sm2820976ljj.38.2019.05.07.01.34.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 01:34:29 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@kernel.org>)
        id 1hNvYU-0006uI-C9; Tue, 07 May 2019 10:34:30 +0200
Date:   Tue, 7 May 2019 10:34:30 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     syzbot <syzbot+53f029db71c19a47325a@syzkaller.appspotmail.com>,
        andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com,
        wen.yang99@zte.com.cn
Subject: Re: general protection fault in smsusb_init_device
Message-ID: <20190507083430.GD4333@localhost>
References: <0000000000008d89900586ccd37b@google.com>
 <Pine.LNX.4.44L0.1905061638380.1585-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1905061638380.1585-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 06, 2019 at 04:41:41PM -0400, Alan Stern wrote:
> On Thu, 18 Apr 2019, syzbot wrote:
> 
> > Hello,
> > 
> > syzbot found the following crash on:
> > 
> > HEAD commit:    d34f9519 usb-fuzzer: main usb gadget fuzzer driver
> > git tree:       https://github.com/google/kasan/tree/usb-fuzzer
> > console output: https://syzkaller.appspot.com/x/log.txt?x=128ec3fd200000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=c73d1bb5aeaeae20
> > dashboard link: https://syzkaller.appspot.com/bug?extid=53f029db71c19a47325a
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16138e67200000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=128dddbf200000
> > 
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+53f029db71c19a47325a@syzkaller.appspotmail.com
> > 
> > usb 1-1: config 0 descriptor??
> > usb 1-1: string descriptor 0 read error: -71
> > smsusb:smsusb_probe: board id=18, interface number 0
> > kasan: CONFIG_KASAN_INLINE enabled
> > kasan: GPF could be caused by NULL-ptr deref or user memory access
> > general protection fault: 0000 [#1] SMP KASAN PTI
> > CPU: 1 PID: 22 Comm: kworker/1:1 Not tainted 5.1.0-rc5-319617-gd34f951 #4
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
> > Google 01/01/2011
> > Workqueue: usb_hub_wq hub_event
> > RIP: 0010:smsusb_init_device+0x366/0x937  
> > drivers/media/usb/siano/smsusb.c:429
> 
> The driver assumes endpoint 1in exists, and doesn't check the existence 
> of the endpoints it uses.
> 
> Alan Stern
> 
> 
> #syz test: https://github.com/google/kasan.git usb-fuzzer
> 
>  drivers/media/usb/siano/smsusb.c |   32 +++++++++++++++++++-------------
>  1 file changed, 19 insertions(+), 13 deletions(-)
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
> @@ -411,6 +412,23 @@ static int smsusb_init_device(struct usb
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
> +	pr_debug("in_ep = %02x, out_ep = %02x\n",
> +		dev->in_ep, dev->out_ep);
> +	if (!dev->in_ep || !dev->out_ep)	/* Missing endpoints? */
> +		return -EINVAL;

Looks like you're now leaking dev here, and so is the current code in
the later error paths.

Since this return value will be returned from probe, you may want to use
-ENXIO or -ENODEV instead of -EINVAL.

Looks good otherwise.

Johan
