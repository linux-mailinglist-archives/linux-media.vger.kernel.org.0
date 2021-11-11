Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B0A644D994
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 16:51:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234023AbhKKPyh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 10:54:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233075AbhKKPyg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 10:54:36 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAA0CC061766
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 07:51:46 -0800 (PST)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 791A3292;
        Thu, 11 Nov 2021 16:51:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636645904;
        bh=OIk80XiSaJVgOHOEauFOo+DEOId50i2wp9aGo078ITg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gOxznymt2jI9wmoegDQKhiIruCxU4ksagBhN6UwH24zOi/yBvnzKdSGAn1HBEwwSE
         rMHxTVaGskal6Cf/WfLsG5SdCsNkqjhA8t12y5vPbt5T0OfRYJ7MChMjLzuPdph/WS
         DqJleIoarpxq468h9NkA1jImYLO9NXlDpkHkBql8=
Date:   Thu, 11 Nov 2021 17:51:22 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Daniel Scally <djrscally@gmail.com>, Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera-devel@lists.libcamera.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: Fwd: Surface Go VCM type (was: Need to pass
 acpi_enforce_resources=lax on the Surface Go (version1))
Message-ID: <YY07+u1Rim5ogkGt@pendragon.ideasonboard.com>
References: <58dabc46-211c-844d-3ed3-fd2411936d6d@gmail.com>
 <b0a6a762-3445-7c61-3510-6bd493f8e0fa@redhat.com>
 <d0f969f6-e029-7c28-17ce-79b8228ddaee@gmail.com>
 <b77cf78f-ea5e-adcc-a1b8-8cff77ebf847@gmail.com>
 <bbfb4bd6-871a-eb14-653c-64c05c22e165@redhat.com>
 <29bf3454-2f82-7791-2aa2-c5e1cb5610a5@gmail.com>
 <6ee7c491-4636-8819-c954-dfc6abcfd1a5@gmail.com>
 <495cbb6b-656d-6c3b-669a-f4b588e970cc@redhat.com>
 <a26f70ae-203e-99fd-8e4d-484af6f207f7@gmail.com>
 <4c7b9d72-4634-ea1d-5fff-bf17c3834b72@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4c7b9d72-4634-ea1d-5fff-bf17c3834b72@redhat.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 11, 2021 at 04:23:38PM +0100, Hans de Goede wrote:
> On 11/11/21 12:18, Daniel Scally wrote:
> 
> <snip>
> 
> >>> One problem I'm experiencing
> >>> is that the focus position I set isn't maintained; it holds for a couple
> >>> of seconds and then resets to the "normal" focus...this happens when the
> >>> .close() callback for the driver is called, which happens right after
> >>> the control value is applied. All the other VCM drivers in the kernel
> >>> power down on .close() so I did the same>
> >> Right, I believe that this is fine though, we expect people to use
> >> libcamera with this and once libcamera gets autofocus support, then
> >> I would expect libcamera to keep the fd open the entire time while
> >> streaming.
> > 
> > 
> > OK - as long as that's how it works then I agree that this is fine as is
> > yes.
> 
> So I've just picked up an old project of mine, called gtk-v4l which
> is a nice simply v4l2 controls applet and patches it up to also
> work on v4l-subdevs:
> 
> https://github.com/jwrdegoede/gtk-v4l/
> 
> So now you can run:
> 
> sudo gtk-v4l -d /dev/v4l-subdev8
> 
> And it will give you a slider to control the focus; and as
> a bonus it keeps the v4l-subdev open, so no more runtime-pm
> issue :)
> 
> >> What is necessary is some way for libcamera to:
> >>
> >> 1. See if there is a VCM which belongs to the sensor; and
> >> 2. If there is a VCM figure out which v4l2-subdev it is.
> >>
> >> Also see this email thread, where Hans Verkuil came to the
> >> conclusion that this info is currently missing from the MC
> >> representation (link is to the conclusion):
> >>
> >> https://lists.libcamera.org/pipermail/libcamera-devel/2021-October/026144.html
> > 
> > 
> > Yeah I read through that thread too, and had a brief chat with Laurent
> > about it. My plan was to add a new type of link called an "ancillary
> > link" between two entities, and automatically create those in
> > match_notify() based on the function field of the matching entities, and
> > expose them as part of the media graph. I've started working on that but
> > not progressed far enough to share anything.
> 
> Sounds good.
> 
> > Libcamera would need
> > updating with support for that too though.
> 
> Right I think libcamera will need updating no matter what, first we
> need to comeup with a userspace API for this.
> 
> Although I guess it would be good to also write libcamera patches
> once the kernel patches are ready, but not yet merged, to make
> sure the API is usable without problems by libcamera.

I strongly agree with this. We're moving towards mandating a libcamera
implementation to get new APIs merged in the kernel.

-- 
Regards,

Laurent Pinchart
