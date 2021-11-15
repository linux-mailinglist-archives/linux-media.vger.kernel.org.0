Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6276450504
	for <lists+linux-media@lfdr.de>; Mon, 15 Nov 2021 14:09:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231537AbhKONMM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 08:12:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231559AbhKONMK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 08:12:10 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A4E4C061570
        for <linux-media@vger.kernel.org>; Mon, 15 Nov 2021 05:09:15 -0800 (PST)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E078D3E;
        Mon, 15 Nov 2021 14:09:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636981753;
        bh=2RrvJFbk/lP7cv+7UqJvJAb1xOv/M5vk+6oBp7ZX26U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UrZylXQh82o1cUatZvkisbu00H28+UrL2ap91+eQedBGWimxliQP1fxg6JujbfUAq
         G2vRGd52ZSRQIpqoxDXv3liVsz/2M135uldX7t6Gk9qeGO7ZtyMttJJmhaMJ4LbplJ
         kEiupqsCaVTHQSuEreMIRM3SQPUe3KblGnBROL9g=
Date:   Mon, 15 Nov 2021 15:08:51 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        libcamera devel <libcamera-devel@lists.libcamera.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [libcamera-devel] Fwd: Surface Go VCM type (was: Need to pass
 acpi_enforce_resources=lax on the Surface Go (version1))
Message-ID: <YZJb4ysFMo7SrU5T@pendragon.ideasonboard.com>
References: <495cbb6b-656d-6c3b-669a-f4b588e970cc@redhat.com>
 <a26f70ae-203e-99fd-8e4d-484af6f207f7@gmail.com>
 <4c7b9d72-4634-ea1d-5fff-bf17c3834b72@redhat.com>
 <CAPY8ntBZpZjecHNCMf-eMefcp2EgmbqkXMt4p=UeOe0n-o8WrA@mail.gmail.com>
 <6e832988-4810-fe59-7357-886b286697a0@redhat.com>
 <CAPY8ntB3pT4EqornywTtqcn4_iD-QUHPkApq=nb3XCc+6CuepA@mail.gmail.com>
 <YY2Ta34aTqFKPYnS@pendragon.ideasonboard.com>
 <CAPY8ntABHNcgO4iVOryYZsdePVvjTiddZJCBah60LuzSXkL3PA@mail.gmail.com>
 <YY5GIFudxS81q/Qp@pendragon.ideasonboard.com>
 <163673951781.2655227.7332330114458584174@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <163673951781.2655227.7332330114458584174@Monstersaurus>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Fri, Nov 12, 2021 at 05:51:57PM +0000, Kieran Bingham wrote:
> Quoting Laurent Pinchart (2021-11-12 10:46:56)
> > On Fri, Nov 12, 2021 at 10:32:31AM +0000, Dave Stevenson wrote:
> > > On Thu, 11 Nov 2021 at 22:04, Laurent Pinchart wrote:
> > > > On Thu, Nov 11, 2021 at 07:30:39PM +0000, Dave Stevenson wrote:
> 
> <big snip>
> 
> > > Refcount the users. Opening the subdev counts as one, and streaming
> > > counts as one. You can now hold the power on if you wish to do so.
> > > 
> > > It's the "let userspace worry about it" that worries me. The same
> > > approach was taken with MC, and it was a pain in the neck for users
> > > until libcamera comes along a decade later.
> > > IMHO V4L2 as an API should be fit for purpose and usable with or
> > > without libcamera.
> > 
> > It really depends on the type of device I'm afraid :-) If you want to
> > capture processed image with a raw bayer sensor on RPi, you need to
> > control the ISP, and the 3A algorithms need to run in userspace. For
> > other types of devices, going straight to the kernel API is easier (and
> > can sometimes be preferred).
> > 
> > At the end of the day, I don't think it makes much of a difference
> > though. Once the libcamera API stabilizes, the library gets packaged by
> > distributions and applications start using it (or possibly even through
> > pipewire), nobody will complain about MC anymore :-) The important part,
> 
> I don't really want to pull this thread further away from $SUBJECT .. but:
> 
> Unfortunately, I don't think that's true.
> 
> We've still got a long way to go!
> 
> libcamera isn't enough to cover all MC use cases. The RPi for instance
> has the ability to capture HDMI in through the CSI2 receiver with a
> TC358743 or such. This won't need an IPA or 3a, but might want to go
> through the ISP for scaling or format conversions...

I was indeed mostly thinking about the camera use cases, as we were
discussing lens control. There's certainly more than that, with a need
to at least configure the unicam MC pipeline to capture from, for
instance, an HDMI-to-CSI-2 converter. This isn't something that
libcamera was designed for, and I don't know whether the use case could
be retrofitted, or if a different userspace framework would be better.

> Some time ago, I started to explore how we could handle 'easily'
> capturing non-camera devices. But it was not in scope for libcamera.
> 
> > in my opinion, is to handle the complexity somewhere in a framework so
> > that applications don't have to do so manually.
> 
> Yes, the complexity needs to be handled somewhere. Applications
> should be able to work with a generic interface and get their video
> frames. But right now - I don't think applications have this, and key
> areas needed for supporting that are not under development or even
> consideration yet as far as I can tell.

-- 
Regards,

Laurent Pinchart
