Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C17D66AC65
	for <lists+linux-media@lfdr.de>; Sat, 14 Jan 2023 17:03:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbjANQDX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Jan 2023 11:03:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229918AbjANQDW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Jan 2023 11:03:22 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C6F3901D
        for <linux-media@vger.kernel.org>; Sat, 14 Jan 2023 08:03:20 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF896308;
        Sat, 14 Jan 2023 17:03:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673712198;
        bh=m/E+tt6O4IAX1FMT8NEgVYTsDrsNL4bTN+MgkbQ/Ydc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XOgSR75DbvehG1HvEgxFZY7sQBb4plRom0SaSKIepPCJuTpk1n5aXx9HrKrFP52FO
         R9GwaXsuTei7lI9v82bpGEwQNh/hrguy7s3Nz7iOm9HnhP6puVecbP9Ip/GIFoG5Nu
         bi9086aG4sRSyn1IhsOKe0TRykLng21jMrU3ROyI=
Date:   Sat, 14 Jan 2023 18:03:18 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH 00/19] media: i2c: imx290: Miscellaneous improvements
Message-ID: <Y8LSRsJBH5opwMhg@pendragon.ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
 <YwQpT5JpyfXBEIVE@pendragon.ideasonboard.com>
 <CAPY8ntAsJNOAJ2te2vQSK6AeXj8LyB6Krepc88FL=6U6O9zb2g@mail.gmail.com>
 <Y0uYhiny89r9J8//@pendragon.ideasonboard.com>
 <CAPY8ntDJ0-hLSHWtX5+bHaDR9quu=usP1+gaHFcZupAHtQYAFg@mail.gmail.com>
 <CAPY8ntDm8VSDT1DhvdRmOjUbq3feQ61MN6XQ70p1ZX4d+JwA_g@mail.gmail.com>
 <Y0/SXOIXf3CGjNuv@valkosipuli.retiisi.eu>
 <CAPY8ntBnKFj5eZJspEDE9S7TN9TLpJiQjdb-nQsQ=+JjQhxyXg@mail.gmail.com>
 <Y0/7Me00bcX/8juC@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y0/7Me00bcX/8juC@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Wed, Oct 19, 2022 at 04:27:13PM +0300, Sakari Ailus wrote:
> On Wed, Oct 19, 2022 at 12:38:21PM +0100, Dave Stevenson wrote:
> > On Wed, 19 Oct 2022 at 11:33, Sakari Ailus wrote:
> > > On Mon, Oct 17, 2022 at 07:07:20PM +0100, Dave Stevenson wrote:
> > > > On Sun, 16 Oct 2022 at 08:34, Dave Stevenson wrote:
> > > > > On Sun, 16 Oct 2022 at 06:37, Laurent Pinchart wrote:
> > > > > > On Mon, Oct 10, 2022 at 11:31:33AM +0100, Dave Stevenson wrote:
> > > > > > > Hi Laurent
> > > > > > >
> > > > > > > Do you have plans for a v2 on this patch set? I also have a number of
> > > > > > > patches for imx290 and there's little point in causing grief to each
> > > > > > > other with conflicts.
> > > > > > > Or I could take the non-controversial patches from your set and send a
> > > > > > > combined patch set?
> > > > > >
> > > > > > I'm working on a v2, I'll send it shortly. Do I assume correctly you'll
> > > > > > submit IMX327 support on top ? :-)
> > > > >
> > > > > Thanks - I'll review it tomorrow and sort my patches on top again.
> > > >
> > > > I've reworked my patches on top of yours. It gives r/w VBLANK and
> > > > HBLANK, and corrects PIXEL_RATE.
> > > > I'm testing on our 6.0 branch, but
> > > > https://github.com/6by9/linux/commits/linuxtv_imx290/drivers/media/i2c
> > > > is against the linux-media branch.
> > > >
> > > > I've messed something up in the "media: i2c: imx290: Support 60fps in
> > > > 2 lane operation" patch at present - I'm looking into what has gone
> > > > wrong, as the earlier versions of that patch worked fine. The branch
> > > > will get force-pushed once I've fixed it.
> > > >
> > > > > This driver is effectively IMX327 - max 1920x1080@60fps in 12 bit.
> > > > >
> > > > > IMX290 adds a 1920x1080@120fps 10bit only mode which isn't currently
> > > > > supported by the driver. I have patches to add 10bit support, but I
> > > > > don't increase the frame rate in them.
> > > > >
> > > > > IMX462 adds that 1920x1080@120fps mode in both 10 and 12 bit, but
> > > > > again I haven't looked at adding support, partly as I don't have a
> > > > > datasheet for that variant. I may see if the change for 120fps 10bit
> > > > > on imx290 works in 12 bit mode for IMX462.
> > > > > For IMX290, 1080p120 needs a link frequency of 445.5MHz on 4 lanes to
> > > > > be supported (2 lanes not permitted), so there will be more link
> > > > > frequency messing required to support it. The basic numbers say that
> > > > > is fast enough for 12bit as well, so there's hope.
> > > >
> > > > I guess seeing as I'm messing with the clock setup, I may as well keep
> > > > going and look at the 120fps modes. It's a little trickier as the Pi
> > > > ISP will be on the edge at those rates, but it should be good enough.
> > > >
> > > > There is an awkward question with regard link-frequencies. Is there a
> > > > need to support multiple sets of link-frequency, or do we support any
> > > > set of 2?
> > > > ie for imx290, on 4 lanes do we want:
> > > > - 891Mbit/s for 1080p120 10bit
> > > > - 445.5Mbit/s for 1080p60 10 or 12 bit
> > > > - 594Mbit/s for 720p120 10bit
> > > > - 297Mbit/s for 720p60 10 and 12 bit
> > > > all to be present in DT?
> > > > If only 891 and 594 then you're limited to 10 bit images, but
> > > > otherwise it should be fully functional. The max frame interval would
> > > > be half that of 445.5 and 297 though, so there are compromises, but
> > > > who/what then controls the link_frequency to switch between the
> > > > ranges?
> > >
> > > It's up to the user space to set that control in a general case. I guess
> > > there are no specific rules on how many you should put to DT, but generally
> > > those that are useful should be there.
> > 
> > Does the driver have to support multiple sets of link frequencies
> > simultaneously?
> 
> It's up to the driver. A driver may support fewer features than the
> hardware allows, and with sensors this is commonly the case. So I don't
> think this would be special somehow. Of course if a driver supports just
> one and the DT has more, the end result may not be desirable in terms of
> what actually works.
> 
> With e.g. CCS the user can choose any link frequency for which there is a
> valid PLL tree configuration with current settings. Depending on e.g. the
> bit depth, for instance, some frequencies may be unavailable.
> 
> > The way the driver is currently written you have one link freq for
> > 1080p and one for 720p (2/3rds the rate used for 1080p). You could
> > retain using only 2 link frequencies at a time.
> > 
> > If DT/ACPI gives us 222.75MHz and 148.5MHz on 4 lanes, or 445.5MHz and
> > 297MHz on 2 lanes, with IMX327, IMX290 or IMX462, then use the current
> > configuration that can do 0.03 to 60fps as RAW10 or RAW12.
> > If DT/ACPI gives us 445.5MHz and 297MHz on 4 lanes and are on an
> > IMX290 (not IMX327), then use a new configuration that can do 0.06 to
> > 120fps as RAW10 only.
> > If DT/ACPI gives us 445.5MHz and 297MHz on 4 lanes and are on an
> > IMX462, then use a new configuration that can do 0.06 to 120fps as
> > RAW10 or RAW12.
> > If the configuration doesn't fall into any of these categories, then
> > it is rejected.
> 
> Seems reasonable.
> 
> > Whoever is putting together the DT/ACPI for the device can then choose
> > whether they value the lower minimum frame rate and RAW12, or the
> > higher frame rate but are prepared to sacrifice RAW12. (As we use
> > dtoverlays, we can add overrides so that person is the end user).
> > Trying to cram that lot in so that it can all be used simultaneously
> > will get quite ugly - the register configuration is not quite as
> > simple as one might hope, and you'd be filtering the permitted modes
> > and bit depths all over the place.
> > 
> > As I mentioned at the Media Summit in Dublin I've had users wanting
> > IMX462 for astronomy use cases, so halving the max exposure time by
> > dropping the current max 60fps configuration won't be popular. I guess
> > you could incorrectly use an IMX327 compatible string in the DT when
> > using an IMX290/462 to force the behaviour, but that feels even more
> > of a hack.
> > 
> > > I wonder why 12 bpp output isn't possible at the double frequency. Of
> > > course it is possible the sensor's clock tree makes that impossible but it
> > > is still unusual.
> > 
> > It is a little weird. As noted in the later emails, I have put
> > together settings to get 120fps running, and have tried it on both
> > IMX462 and IMX290.
> > 
> > 720p120 RAW12 works fine on both, as do 720p120 and 1080p120 in RAW10.
> > However 1080p120 RAW12 doesn't work on either, so I suspect it is
> > something in the CSI2 block configuration that can't quite hit that
> > data rate without further changes. I'll see if Sony wants to be
> > friendly with datasheets for the IMX462.
> 
> The receiver block driver could refuse to streamon if the pixel rate * bpp
> is too high. But I understand in this case it shouldn't be a limitation.
> And it doesn't really help the user to find which configurations would
> work.
> 
> > > > I can see another can of worms being opened here!
> > >
> > > If this is what the sensor does, how else it should be operated?
> > 
> > As above, link frequency remains read only based on DT or ACPI, and
> > that then restricts the configurations that are possible.
> > 
> > I've never seen a good userspace example of using
> > V4L2_CID_LINK_FREQUENCY, so without that it always seems to be a
> > setting that is generally only used by the CSI-2 receiver to adapt
> > appropriately to the data rate.
> > To my mind it falls into the same category as binning and cropping -
> > it's lovely to expose the full feature set, but that is just passing
> > the buck to some heuristics in userspace. Generally the user of the
> > camera doesn't care (they just want their camera to work) so
> > realistically you're looking at libcamera, and it doesn't necessarily
> > have sufficient information about the sensor or use case to make a
> > good decision.
> 
> The CCS driver changes the link frequency based on other configuration
> (mbus code) if the selected one cannot be used.
> 
> As this is a board specific configuration, fixing these values for a sensor
> is not a feasible approach in libcamera.

I'm with Dave here, I've never seen a good example of how userspace
should use the V4L2_CID_LINK_FREQUENCY control, or even of how the
frequencies listed in DT should be picked (for sensors that can
accommodate a wide range of link frequencies). Sakari, as you've been
the one who pushed for control of the link frequency from userspace,
could you enlighten us ? :-)

-- 
Regards,

Laurent Pinchart
