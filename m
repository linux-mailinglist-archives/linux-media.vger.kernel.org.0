Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41B5B67D0CB
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 17:01:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232442AbjAZQBd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 11:01:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232440AbjAZQB2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 11:01:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD9DB4957F
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 08:01:24 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A5022B3;
        Thu, 26 Jan 2023 17:01:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674748882;
        bh=iNyVqgXjMqso3GYmS2mKslx9prory9GAO5xhF6Yb0es=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sDq9pgL44Dagt7nwnIJOQupIzniNq+451ILrJyE3JpmTlG2e/iUF8fbW6fWknBQzj
         Ra4ksLrF3THFM4rqE7wohtT9qoTOPlxg/rmTj4fudb09cbPRXQyGGNAD/rbYoGtls2
         94U6j1hlx9ez2hqy0kQjj/LgQFgXkWodx67vob7A=
Date:   Thu, 26 Jan 2023 18:01:18 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Robert Mader <robert.mader@collabora.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 0/3] media: imx258: Remove rotation=<80 requirement
Message-ID: <Y9Kjzm2PqSRBuoBT@pendragon.ideasonboard.com>
References: <20230117100603.51631-1-jacopo.mondi@ideasonboard.com>
 <Y9KTkSqgyxJbvsj9@kekkonen.localdomain>
 <CAPY8ntCWUSbvUKziuq0ABX2vOGJyCwtQN7MEt5LXQf0yKpfMKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntCWUSbvUKziuq0ABX2vOGJyCwtQN7MEt5LXQf0yKpfMKA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Thu, Jan 26, 2023 at 03:48:04PM +0000, Dave Stevenson wrote:
> On Thu, 26 Jan 2023 at 14:52, Sakari Ailus wrote:
> > On Tue, Jan 17, 2023 at 11:06:00AM +0100, Jacopo Mondi wrote:
> > > Currently the imx258 driver requires to have the 'rotation' device node
> > > property specified in DTS with a fixed value of 180 degrees.
> > >
> > > The "rotation" fwnode device property is intended to allow specify the
> > > sensor's physical mounting rotation, so that it can be exposed through
> > > the read-only V4L2_CID_CAMERA_SENSOR_ROTATION control and applications
> > > can decide how to compensate for that.
> > >
> > > The imx258 driver has read-only VFLIP and HFLIP enabled, resulting in
> > > a 180 degrees image rotation being produced by the sensor. But this
> > > doesn't imply that the physical mounting rotation should match the
> > > driver's implementation.
> > >
> > > I took into the series Robert's patch that register device node properties and
> > > on top of that register flips controls, in order to remove the hard requirement
> > > of the 180 degrees rotation property presence.
> >
> > Reconsidering these patches after the flipping vs. rotation discussion,
> > they seem fine. The only thing I'd like to see, after removing the rotation
> > property check, would be to add support for the actual flipping controls.
> > I'm pretty sure they can be found in the same registers as on CCS --- the
> > rest of the registers look very much like that. Would you like to send a
> > patch? :-)
> 
> Yes it is register 0x0101, bits 0 (H) & 1 (V).
> 
> Do watch out as there are register errors in the driver. Currently
> Y_ADD_STA is set to 0, and Y_ADD_END to 3118, giving 3119 lines total.
> That means that when you initially implement flips the Bayer order
> won't change, but you change the field of view by one line.
> The start and end values also break the requirements listed in the
> datasheets for STA/END values being multiples of X (table 4-2 of the
> datasheet). Correcting that will change the Bayer order when inverted.
> Does that count as a regression to userspace? I hope not. Memory says
> that if you don't correct Y_ADD_END then some of the binned modes
> misbehave.

As long as the driver reports the correct bayer pattern, it should be
fine.

Interactions between formats and flip controls is something we still
need to clarify. I plan to have a follow-up discussion on this with
Jacopo and Sakari after sending documentation patches for the
interactions between rotation and flips. If you would like to join the
fun, please let me know.

Also, if you have any comment on the rotation & flip discussion notes,
and especially if there's anything that doesn't seem right to you,
feedback would be appreciated. If everything is good, you can just ack
the documentation patches when I'll post them :-)

> I have been through this loop before as Soho Enterprise [1] make an
> IMX258 board for the Pi. I haven't upstreamed the patches [2] though
> (sorry).

Thanks for sharing the branch.

> [1] https://soho-enterprise.com/
> [2] https://github.com/raspberrypi/linux/commits/rpi-5.15.y/drivers/media/i2c/imx258.c

-- 
Regards,

Laurent Pinchart
