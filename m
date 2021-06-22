Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BBA23AFFED
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 11:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbhFVJLi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 05:11:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:52890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229668AbhFVJLh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 05:11:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A0BBF61042;
        Tue, 22 Jun 2021 09:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624352962;
        bh=kXlr3NuFZIiS6C2/Tvp2HisngAJr5CpIbQqdUwUbGpw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=FH4ZF3iUBsshRcftok0BQOBtvLORl0itit5jig7WmqTpL5jTv4zzMIgRGRHV06CIE
         ONTty12WVNKHZnccwgCbf98KeDzios4M79WQr3YWeM30Gz/qNRqJm1z+vxeUgXBKQa
         PDZPf1VoFZoiEmxrznTPKHKOVdVyLbKwB3NFUbtZHmYl+/JdkDq3y27/b00AtXh1IJ
         f+11/lOeyfcjKvu9pm/RJNEhOnBrpz8vawaVQWZtC5Ukop6CCZO0b4l7GjOZ6RuQpF
         uBI0KA5A0gEmN9EREOmmfW1McU5iqZuPqJ6XQkwSL3wujteDw2r5qL9nlU7WVSjYxW
         OHo+DfQgAQ59g==
Date:   Tue, 22 Jun 2021 11:09:17 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: uvc: limit max bandwidth for HDMI capture
Message-ID: <20210622110917.11c737fc@coco.lan>
In-Reply-To: <YNGmXmxMIXpq7I83@pendragon.ideasonboard.com>
References: <b791d5874c83663505cbd4f74907ac38d00bb727.1612206534.git.mchehab+huawei@kernel.org>
        <YNDY4iesZGF+7Cr0@pendragon.ideasonboard.com>
        <20210622102948.47b86fbe@coco.lan>
        <CAPY8ntAkb_57Nk_8UR-d_uR+juPigLKWwCAxoFzuCSKwETYpQg@mail.gmail.com>
        <YNGmXmxMIXpq7I83@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 22 Jun 2021 11:59:10 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> On Tue, Jun 22, 2021 at 09:50:37AM +0100, Dave Stevenson wrote:
> > On Tue, 22 Jun 2021 at 09:29, Mauro Carvalho Chehab wrote:  
> > > Em Mon, 21 Jun 2021 21:22:26 +0300 Laurent Pinchart escreveu:
> > >  
> > > > Hi Mauro,
> > > >
> > > > Thank you for the patch.  
> > >
> > > Thanks for reviewing it!
> > >  
> > > >
> > > > On Mon, Feb 01, 2021 at 08:08:59PM +0100, Mauro Carvalho Chehab wrote:  
> > > > > This device:
> > > > >         534d:2109 MacroSilicon
> > > > >
> > > > > Announces that it supports several frame intervals for
> > > > > their resolutions for MJPEG compression:
> > > > >
> > > > >         VideoStreaming Interface Descriptor:
> > > > >         bLength                            46
> > > > >         bDescriptorType                    36
> > > > >         bDescriptorSubtype                  7 (FRAME_MJPEG)
> > > > >         bFrameIndex                         1
> > > > >         bmCapabilities                   0x00
> > > > >           Still image unsupported
> > > > >         wWidth                           1920
> > > > >         wHeight                          1080
> > > > >         dwMinBitRate                   768000
> > > > >         dwMaxBitRate                196608000
> > > > >         dwMaxVideoFrameBufferSize     4147200
> > > > >         dwDefaultFrameInterval         166666
> > > > >         bFrameIntervalType                  5
> > > > >         dwFrameInterval( 0)            166666
> > > > >         dwFrameInterval( 1)            333333
> > > > >         dwFrameInterval( 2)            400000
> > > > >         dwFrameInterval( 3)            500000
> > > > >         dwFrameInterval( 4)           1000000
> > > > >
> > > > > However, the highest frame interval (166666), which means 60 fps
> > > > > is not supported. For such resolution, the maximum interval
> > > > > is, instead 333333 (30 fps).  
> > > >
> > > > What happens if you try to select it ?  
> > >
> > > Basically, URBs get lost: they cause apps like qv4l2 to crash
> > > sometimes, with:
> > >
> > >         v4l-convert: libjpeg error: Corrupt JPEG data: premature end of data segment
> > >
> > > The image keeps blinking, and part of the image is replaced by
> > > white noise.
> > >
> > > Clearly, it tries to send more data than the maximum available bandwidth
> > > on this chipset.  
> > 
> > What platform are you running this on?
> > I've previously encountered a USB3 camera module where the datastream
> > was VERY bursty. The memcpy of the data from URB to V4L2 buffer took
> > long enough that sometimes the module didn't have an URB to fill at
> > the appropriate moment, and it dropped data. I seem to recall
> > increasing UVC_URBS from the default of 5 to 10 to handle the peak
> > data rate without loss, but it may have been higher still. This was on
> > a ~1.5GHz Atom processor, so not lacking in performance.
> > 
> > I wonder if the same is true in your case. If it's MJPEG compressed
> > then the peak rate may again be high. Just a thought.  
> 
> It's worth investigating indeed. How often are URBs dropped ? Does it
> occur for every frame, or once in a while ?

It occurs on every frame. Monitoring the traffic with usbtop shows
that about the same amount of data is shown when selecting 30 or 60
fps.

Btw, the manual of the device clearly says that it supports only 30
fps at the maximum resolution.

What's happening is that the USB descriptors are not correct.

Btw, this is the device:

	https://www.amazon.de/-/en/gp/product/B088NWWSKN

I'm basically using it (together with a Logitech nano receiver) as
a cheap KVM device :-)

Thanks,
Mauro
