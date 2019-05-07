Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3AA51663B
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2019 17:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbfEGPH2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 May 2019 11:07:28 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39417 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbfEGPH1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 May 2019 11:07:27 -0400
Received: by mail-lj1-f196.google.com with SMTP id q10so14674135ljc.6;
        Tue, 07 May 2019 08:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Xp/CFTnCntNL718RZBE1t6TOjNAgSDPcc69Aq4PftC0=;
        b=VZV9OdWAXWpNLgYqSijb8DJpVIUQtljYEol+X70RHLqKnPiwsj2BeKg6rvp48ivOHe
         wxP2gSvGjHoiKDu347zIjkPsC8OJr9Knl1zfgfCmTTbDQXkxzPvEWk/8FzORzQ/33WDr
         Zm0gV/inaEnCOxpRgTiPs6C7W9y0YcSYKgo3DRRfoMkV3MFd/5aHPZLdJNQ9ErtHyhau
         glqkyTBkhSwHlcdx4nF6tBI2rWP+3JWDvU2Tf78Fw1C1C0uD0XDphUHNVrkek3974G8o
         sXizSSUCycq/eJRfvh9oxHFwyOzxXGFpuZgiWA3kHyN/fgoH74I8wtjUgZhFnxuMMESD
         YvPQ==
X-Gm-Message-State: APjAAAXKO7uwgPpii5NuE48QTzy5kp1IGb/4GWWsHEahzGYJG+S4Mj5j
        jg0vOCfnnTpJLhCMUBoxhB0=
X-Google-Smtp-Source: APXvYqwZuquZubbjwTDIWF3T6DNz6fB1XmF6DU/2TQniv247cfrvU6HXLZ8GerzNEO0PwLoLLWw0Ow==
X-Received: by 2002:a2e:5b18:: with SMTP id p24mr4265728ljb.50.1557241645461;
        Tue, 07 May 2019 08:07:25 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id x6sm3327063lfn.74.2019.05.07.08.07.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 08:07:23 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@kernel.org>)
        id 1hO1gj-0004fP-5D; Tue, 07 May 2019 17:07:25 +0200
Date:   Tue, 7 May 2019 17:07:25 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Johan Hovold <johan@kernel.org>,
        syzbot <syzbot+53f029db71c19a47325a@syzkaller.appspotmail.com>,
        andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com,
        wen.yang99@zte.com.cn
Subject: Re: general protection fault in smsusb_init_device
Message-ID: <20190507150725.GB29016@localhost>
References: <20190507083430.GD4333@localhost>
 <Pine.LNX.4.44L0.1905071035450.1632-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1905071035450.1632-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 07, 2019 at 10:42:58AM -0400, Alan Stern wrote:
> On Tue, 7 May 2019, Johan Hovold wrote:

> > > @@ -411,6 +412,23 @@ static int smsusb_init_device(struct usb
> > >  	dev->udev = interface_to_usbdev(intf);
> > >  	dev->state = SMSUSB_DISCONNECTED;
> > >  
> > > +	for (i = 0; i < intf->cur_altsetting->desc.bNumEndpoints; i++) {
> > > +		struct usb_endpoint_descriptor *desc =
> > > +				&intf->cur_altsetting->endpoint[i].desc;
> > > +
> > > +		if (desc->bEndpointAddress & USB_DIR_IN) {
> > > +			dev->in_ep = desc->bEndpointAddress;
> > > +			in_maxp = usb_endpoint_maxp(desc);
> > > +		} else {
> > > +			dev->out_ep = desc->bEndpointAddress;
> > > +		}
> > > +	}
> > > +
> > > +	pr_debug("in_ep = %02x, out_ep = %02x\n",
> > > +		dev->in_ep, dev->out_ep);
> > > +	if (!dev->in_ep || !dev->out_ep)	/* Missing endpoints? */
> > > +		return -EINVAL;
> > 
> > Looks like you're now leaking dev here, and so is the current code in
> > the later error paths.
> > 
> > Since this return value will be returned from probe, you may want to use
> > -ENXIO or -ENODEV instead of -EINVAL.
> > 
> > Looks good otherwise.
> 
> Thanks for the review.  You're right about the memory leak (although 
> you're wrong about the later error paths: smsusb_term_device() 
> deallocates dev).

Indeed, I missed the free in smsusb_term_device(). Sorry about that.

Johan
