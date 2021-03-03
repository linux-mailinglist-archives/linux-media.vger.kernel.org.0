Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9AB332C758
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386073AbhCDAbj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:31:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1448167AbhCCPYJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 10:24:09 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31205C061765
        for <linux-media@vger.kernel.org>; Wed,  3 Mar 2021 07:23:05 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC83B8CA;
        Wed,  3 Mar 2021 16:23:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1614784981;
        bh=/ylU94f9ZGTp9DPXT7GOyQe/NSmXrbsi5MAFWYJecqM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OEbDsgQwiPpr0h0xDXadOI90msrlAfZD4NlGLM7pryetcJHHRUVanOyj1xHnhCgSP
         udXayQLqIx0e5oOUwJckPm4c2qbgMKsMTTtE6NF8Voy36C80jTAGpIBBzDPLl3mNi8
         o5q1aIf4B8XhR6zi3Dyq6HzY93LVWT0ElSLkK2ss=
Date:   Wed, 3 Mar 2021 17:22:31 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
Subject: Re: [PATCH v3 24/24] media: ti-vpe: cal: Implement media controller
 centric API
Message-ID: <YD+ptwH0g79zLzIn@pendragon.ideasonboard.com>
References: <20201206235353.26968-1-laurent.pinchart@ideasonboard.com>
 <20201206235353.26968-25-laurent.pinchart@ideasonboard.com>
 <d3a0f5e3-d94a-8c67-63e7-b5dfb5f8ea5d@xs4all.nl>
 <X87AHVETKz0CrzQq@pendragon.ideasonboard.com>
 <7792f746-7e49-006c-e02d-bc36a48d3247@xs4all.nl>
 <X8+mq486bL/St/vT@pendragon.ideasonboard.com>
 <1edba432-ff1f-bcd0-5b39-11fa10d904a2@ideasonboard.com>
 <836243a0-6c8c-25a2-2551-ac9a5faab807@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <836243a0-6c8c-25a2-2551-ac9a5faab807@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, Mar 03, 2021 at 04:15:37PM +0100, Hans Verkuil wrote:
> On 15/02/2021 16:23, Tomi Valkeinen wrote:
> > On 08/12/2020 18:15, Laurent Pinchart wrote:
> > 
> >>>>> I noticed that this defaults to video centric.
> >>>>>
> >>>>> To come back to the discussion of the v2 of this patch, I believe we
> >>>>> need to decide what to do here so we have a good template for future
> >>>>> drivers that need this.
> >>>>>
> >>>>> My opinion is that you want a Kconfig option to set the default for
> >>>>> this, so this becomes something like this:
> >>>>>
> >>>>> bool cal_mc_api = CONFIG_TI_CAL_MC_API;
> >>>>>
> >>>>> What do you think?
> >>>>>
> >>>>> I will make a PR for v5.12 for patches 1-23, but I would like to have this
> >>>>> remaining issue resolved before merging this final patch.
> >>>>>
> >>>>> I do think that a Kconfig option is very desirable, but whether the default
> >>>>> of this option should be y or n is less clear. Since this driver has always
> >>>>> been video-centric I can imagine that it makes sense to set it to n. But
> >>>>> for e.g. a new driver like the tegra-video driver (currently in staging),
> >>>>> it would make sense to set it to y since it is a new driver. Ditto for the
> >>>>> rpi camera driver.
> >>>>
> >>>> For this driver I think video-centric mode is the best default to start
> >>>> with, to avoid changing the behaviour all of a sudden. We can switch it
> >>>> to MC-centric by default later if desired, after userspace gets a chance
> >>>> to adapt.
> >>>
> >>> Fair enough.
> >>>
> >>>>> In that case the rule would be that for new mainline drivers the default
> >>>>> should always be y (MC-centric), but if the driver was already in mainline
> >>>>> and MC support is added (like for this driver), then the default remains n
> >>>>> for backwards compatibility.
> >>>>
> >>>> I think that for new drivers we shouldn't support video-centric mode at
> >>>> all. It should only be supported in downstream (vendor) kernels, and
> >>>> only if backward compatibility with existing userspace needs to be
> >>>> ensured. The unicam driver, for instance, fits in that category. Drivers
> >>>> whose development is ongoing (or hasn't started) should only use the MC
> >>>> API. Whether the option should be y or n by default would then be a
> >>>> vendor decision, it wouldn't affect upstream.
> >>>
> >>> No, that I strongly disagree with. Vendors would have to carry those patches
> >>> for a long time, and if past experience is any guide, they will mess it up.
> >>> Or even refuse to upgrade to the mainline code because it is too much hassle
> >>> and instead keep using their own driver.
> >>>
> >>> In my opinion the mainline driver should be MC-centric, and it is up to the
> >>> vendor to decide whether video-centric is also supported: this should only
> >>> be done if there is a long history of video-centric behavior in the past.
> >>> In that case a Kconfig option is needed to select MC, and in the mainline
> >>> kernel this should default to y for such new drivers.
> >>>
> >>> In both Raspbian and Linux4Tegra video-centric has been the norm for many
> >>> years, so there are many userspace applications that expect that behavior.
> >>> You want those distros to use the mainline driver (eventually...) since
> >>> those distros are widely used so you also get a large installed base and
> >>> (hopefully) bug reports and bug fixes for the driver. If you decide to
> >>> require the distro to carry a patch to turn a driver into a video-centric
> >>> variant, then I am afraid they will not bother upgrading to the mainline
> >>> driver and just keep their own driver.
> >>
> >> For Raspberry Pi, and the Unicam driver in particular, that won't be
> >> possible. A video-centric API will require quite a few hacks that
> >> shouldn't be upstreamed, in particular to support multiple CSI-2 data
> >> types. The current implementation uses two sink pad in the CSI-2
> >> receiver subdevs to model the image and embedded data multiplexed over
> >> the CSI-2 virtual channel. This requires corresponding changes to sensor
> >> drivers to use two source pads. Sakari has reviewed this, and the
> >> implementation will need to move to the V4L2 multiplexed streams support
> >> API (which has been proposed but not merged yet), and I can't see this
> >> working well with a video-centric approach.
> >>
> >> I suspect the same would apply to any CSI-2 receiver, and thus to Tegra
> >> as well, but I can't comment on that as I'm not familiar with the
> >> hardware and driver.
> >>
> >>> In any case, I really like your approach, all I want is a Kconfig option
> >>> and it is good to go.
> > 
> > Waking up this thread, as I'm writing new patches based on these =).
> > 
> > For this series, afaiu there are no open questions. We can add a kconfig
> > option to choose the default option (in addition to the module
> > parameter), and as discussed, this one should default to video mode.
> 
> Can someone make a v4 of this patch? It would be nice to get this last
> remaining patch merged.

I'll work on this.

> > For new drivers, I think we should require support for MC (and default
> > to MC), but leave the decision about video support to the
> > vendor/developer. 
> 
> Makes sense.
> 
> > I have the same concerns as Hans if we reject new
> > drivers with video support by default.
> > Then again, I think it's sensible to require the video support to be...
> > well, "sensible". The code for video support should be quite
> > straightforward and simple. It should be a valid reason to reject the
> > driver if the driver tries to support complex HW setups with video model
> > and ends up creating all kinds of hacks which are not needed with MC.
> > (the Unicam case Laurent described above sounds like this).
> 
> And there is a grey area between 'sensible' and 'not sensible'. If there
> is already a large video-centric ecosystem, then there is a good reason
> to allow for more complexity to avoid distros forking the driver.

I don't think generic distros will care. We're talking about SoC drivers
here, coming from a downstream kernel, so it's only the vendor's
ecosystem that matters, and whether they want to support both in their
camera stack or move it to MC-only.

> I guess I would have to see the complexity to be able to say if it is
> worth it in my opinion (which I am sure differs from other people's
> opinion!).

-- 
Regards,

Laurent Pinchart
