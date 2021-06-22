Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD36E3AFFC1
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 10:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbhFVJBz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 05:01:55 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38978 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbhFVJBz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 05:01:55 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 94003A66;
        Tue, 22 Jun 2021 10:59:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624352378;
        bh=VcxbAVy6sx0qJVOGKisGyAr001hL6g7pdjYxikO+wxk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QDyg7vt+1RcjcL2piOCIx4VKEwgDx8bby98wW45SJq23oecrk9Mj/6Hyl0Tz/do2v
         MYWLF9u9688DEJgrmaIkyBmmjWJGGabwnpnZdweOru5CSLG2dsQExXIwpRbd7SphtY
         k5oe91dHfLg1kenA4LlSFWLnWL9TllnndaB9AiEs=
Date:   Tue, 22 Jun 2021 11:59:10 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: uvc: limit max bandwidth for HDMI capture
Message-ID: <YNGmXmxMIXpq7I83@pendragon.ideasonboard.com>
References: <b791d5874c83663505cbd4f74907ac38d00bb727.1612206534.git.mchehab+huawei@kernel.org>
 <YNDY4iesZGF+7Cr0@pendragon.ideasonboard.com>
 <20210622102948.47b86fbe@coco.lan>
 <CAPY8ntAkb_57Nk_8UR-d_uR+juPigLKWwCAxoFzuCSKwETYpQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntAkb_57Nk_8UR-d_uR+juPigLKWwCAxoFzuCSKwETYpQg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 22, 2021 at 09:50:37AM +0100, Dave Stevenson wrote:
> On Tue, 22 Jun 2021 at 09:29, Mauro Carvalho Chehab wrote:
> > Em Mon, 21 Jun 2021 21:22:26 +0300 Laurent Pinchart escreveu:
> >
> > > Hi Mauro,
> > >
> > > Thank you for the patch.
> >
> > Thanks for reviewing it!
> >
> > >
> > > On Mon, Feb 01, 2021 at 08:08:59PM +0100, Mauro Carvalho Chehab wrote:
> > > > This device:
> > > >         534d:2109 MacroSilicon
> > > >
> > > > Announces that it supports several frame intervals for
> > > > their resolutions for MJPEG compression:
> > > >
> > > >         VideoStreaming Interface Descriptor:
> > > >         bLength                            46
> > > >         bDescriptorType                    36
> > > >         bDescriptorSubtype                  7 (FRAME_MJPEG)
> > > >         bFrameIndex                         1
> > > >         bmCapabilities                   0x00
> > > >           Still image unsupported
> > > >         wWidth                           1920
> > > >         wHeight                          1080
> > > >         dwMinBitRate                   768000
> > > >         dwMaxBitRate                196608000
> > > >         dwMaxVideoFrameBufferSize     4147200
> > > >         dwDefaultFrameInterval         166666
> > > >         bFrameIntervalType                  5
> > > >         dwFrameInterval( 0)            166666
> > > >         dwFrameInterval( 1)            333333
> > > >         dwFrameInterval( 2)            400000
> > > >         dwFrameInterval( 3)            500000
> > > >         dwFrameInterval( 4)           1000000
> > > >
> > > > However, the highest frame interval (166666), which means 60 fps
> > > > is not supported. For such resolution, the maximum interval
> > > > is, instead 333333 (30 fps).
> > >
> > > What happens if you try to select it ?
> >
> > Basically, URBs get lost: they cause apps like qv4l2 to crash
> > sometimes, with:
> >
> >         v4l-convert: libjpeg error: Corrupt JPEG data: premature end of data segment
> >
> > The image keeps blinking, and part of the image is replaced by
> > white noise.
> >
> > Clearly, it tries to send more data than the maximum available bandwidth
> > on this chipset.
> 
> What platform are you running this on?
> I've previously encountered a USB3 camera module where the datastream
> was VERY bursty. The memcpy of the data from URB to V4L2 buffer took
> long enough that sometimes the module didn't have an URB to fill at
> the appropriate moment, and it dropped data. I seem to recall
> increasing UVC_URBS from the default of 5 to 10 to handle the peak
> data rate without loss, but it may have been higher still. This was on
> a ~1.5GHz Atom processor, so not lacking in performance.
> 
> I wonder if the same is true in your case. If it's MJPEG compressed
> then the peak rate may again be high. Just a thought.

It's worth investigating indeed. How often are URBs dropped ? Does it
occur for every frame, or once in a while ?

> > Sent a v2 addressing the issues you pointed.

-- 
Regards,

Laurent Pinchart
