Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF39567D335
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 18:31:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbjAZRbs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 12:31:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230371AbjAZRbr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 12:31:47 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9BE469B07
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 09:31:42 -0800 (PST)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F1EC0975;
        Thu, 26 Jan 2023 18:31:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674754301;
        bh=pANjRCDsCrZqftU/o1zimyKO9wnqXe4I3ribi3RfGdk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nIa5g8fWUC10C5NCWJfDb6Wwun+MEGIax6ze0iij657LXtLsINsfrJeZ3k5O4m344
         uYJ3x4PcZTv1dvf7giXxRB0p4XG3NKbudd9IMjwKL464brKHdyfn293HhIEyW81G4G
         LYx2LpvZX/flo7CUhMT7RmnerpcP9f071FDEnv/I=
Date:   Thu, 26 Jan 2023 18:31:38 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Robert Mader <robert.mader@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 0/3] media: imx258: Remove rotation=<80 requirement
Message-ID: <20230126173138.5mqxgy3tukug4n5u@uno.localdomain>
References: <20230117100603.51631-1-jacopo.mondi@ideasonboard.com>
 <Y9KTkSqgyxJbvsj9@kekkonen.localdomain>
 <CAPY8ntCWUSbvUKziuq0ABX2vOGJyCwtQN7MEt5LXQf0yKpfMKA@mail.gmail.com>
 <Y9Kj//mOE9Fq6ZXb@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y9Kj//mOE9Fq6ZXb@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello

On Thu, Jan 26, 2023 at 06:02:07PM +0200, Sakari Ailus wrote:
> Hi Dave,
>
> On Thu, Jan 26, 2023 at 03:48:04PM +0000, Dave Stevenson wrote:
> > Hi Jacopo and Sakari
> >
> > On Thu, 26 Jan 2023 at 14:52, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Jacopo,
> > >
> > > On Tue, Jan 17, 2023 at 11:06:00AM +0100, Jacopo Mondi wrote:
> > > > Currently the imx258 driver requires to have the 'rotation' device node
> > > > property specified in DTS with a fixed value of 180 degrees.
> > > >
> > > > The "rotation" fwnode device property is intended to allow specify the
> > > > sensor's physical mounting rotation, so that it can be exposed through
> > > > the read-only V4L2_CID_CAMERA_SENSOR_ROTATION control and applications
> > > > can decide how to compensate for that.
> > > >
> > > > The imx258 driver has read-only VFLIP and HFLIP enabled, resulting in
> > > > a 180 degrees image rotation being produced by the sensor. But this
> > > > doesn't imply that the physical mounting rotation should match the
> > > > driver's implementation.
> > > >
> > > > I took into the series Robert's patch that register device node properties and
> > > > on top of that register flips controls, in order to remove the hard requirement
> > > > of the 180 degrees rotation property presence.
> > >
> > > Reconsidering these patches after the flipping vs. rotation discussion,
> > > they seem fine. The only thing I'd like to see, after removing the rotation
> > > property check, would be to add support for the actual flipping controls.
> > > I'm pretty sure they can be found in the same registers as on CCS --- the
> > > rest of the registers look very much like that. Would you like to send a
> > > patch? :-)
> >
> > Yes it is register 0x0101, bits 0 (H) & 1 (V).
> >
> > Do watch out as there are register errors in the driver. Currently
> > Y_ADD_STA is set to 0, and Y_ADD_END to 3118, giving 3119 lines total.
>
> Yes, this is the problem with register list based drivers. Well spotted.
>
> I remember one driver for a Toshiba sensor using value of 5 for a register
> the range of which was 2--10, but only even values were allowed. It worked
> nonetheless... oh well.
>
> I wonder if this sensor would work better with the CCS driver
>
> > That means that when you initially implement flips the Bayer order
> > won't change, but you change the field of view by one line.
> > The start and end values also break the requirements listed in the
> > datasheets for STA/END values being multiples of X (table 4-2 of the
> > datasheet). Correcting that will change the Bayer order when inverted.
> > Does that count as a regression to userspace? I hope not. Memory says
> > that if you don't correct Y_ADD_END then some of the binned modes
> > misbehave.
>
> Most sensors also require even values for the ?_ADDR_START registers (and
> odd for the _ADDR_END registers). Using an invalid value sometimes might
> work, too, but only testing will tell.
>
> >
> > I have been through this loop before as Soho Enterprise [1] make an
> > IMX258 board for the Pi. I haven't upstreamed the patches [2] though
> > (sorry).
>
> It'd be nice if both worked with the same driver.
>

There are a lot of interesting changes in here that would be worth
upstreaming
https://github.com/raspberrypi/linux/commits/rpi-5.15.y/drivers/media/i2c/imx258.c

I would prefer if we can get these three easy patches of minr in and
then start shoveling the good stuff from the rpi repo ?

Otherwise I can plumb flip support in with the current wrong totals
which, if I understand you right, doesn't require changing the bayer
patter order ?


> --
> Kind regards,
>
> Sakari Ailus
