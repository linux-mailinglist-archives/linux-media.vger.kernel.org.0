Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24DAB67E2B1
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 12:08:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232874AbjA0LIX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Jan 2023 06:08:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbjA0LIU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Jan 2023 06:08:20 -0500
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69DBF12845
        for <linux-media@vger.kernel.org>; Fri, 27 Jan 2023 03:08:18 -0800 (PST)
Received: by mail-vs1-xe2c.google.com with SMTP id v127so4880410vsb.12
        for <linux-media@vger.kernel.org>; Fri, 27 Jan 2023 03:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YZMaaGccVbf4dUiSpsUSk6NZBaGIurSDnRo3QUqlxs4=;
        b=nBjS28Sq5+eVKkkn410mvHLyvKXN7AHIY6Sa8EuGvCQs4jfDgixsyrLSXzfSLj9MrT
         +qqUBKuqDYshSXrKtCaoplzXMSuyhFM7J0NX7bcwGxQxLA0PyaGDQLWJDLicVgyMP9zJ
         Q98Mqyn9Fo1IrrFnSwzoXm02M9abf773Qgc1RZWy7fW1bRzxpyAE0gNle/WLueQQlfRB
         mhI3ToXHk2n9VjlH06icAPbQD6/QElUKUfDv4BST7h5f3s4IV3hLyul3CVlXvzDlaMd8
         wAAH5c7ILbWMggiI0+SZ6hFJ5mJCt1QiMrzJxF3Ka3/UqYJaXoGl9lVsAd7fk3oEwRXF
         XZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YZMaaGccVbf4dUiSpsUSk6NZBaGIurSDnRo3QUqlxs4=;
        b=1t8oAKZ9MQPBSHizocvDxW0U9w/l9v/FMif9SsbBav5hIb9GmPZ+Amjo/5z6a0kNHR
         GcNviL0GCF1C5a+RGfz0+v1B7fxfc4OTvkMS+QBds68xXjnRf7KibWvvpi49A9pSYgIN
         RzadmCNXFEK9mpxg63NFYKUizfA+NrVJPf/1P2RmM6HN1EfZkhN2PeyjQlqJnSAfx0cc
         x9UPcXAYxJOZ2AHnGnVsYAk6q2cRzHzkYwqkYaniHY1FSzLr9xpI2H+edE2wDFewEsqu
         8roUGBZ6S6/F0UVw9vKR2Pgn5yNJAkLovJP1klUzhJDKHX0XJs3yiMOyL89S1lW7uCrh
         wBAw==
X-Gm-Message-State: AO0yUKV72uLy2cMyT9ZLl3uun0bAbKSSfoi94lPGUpzdM7INqsc1jRUX
        Cntf/klbh+5LKtq+oaJ9/BQZJ49/2VfYnD/X0w7ytyXVAONOJ8Cy
X-Google-Smtp-Source: AK7set9XeQpc1mwuRJJUv9b4G8E++g4dWU4Nx1I+OwcL4y9Fnpm3nYIXe0iBgOmuq5TNRDbaXbXXlVyCmmBYNlNGzaE=
X-Received: by 2002:a67:df8f:0:b0:3eb:2024:bda9 with SMTP id
 x15-20020a67df8f000000b003eb2024bda9mr840521vsk.45.1674817697465; Fri, 27 Jan
 2023 03:08:17 -0800 (PST)
MIME-Version: 1.0
References: <20230117100603.51631-1-jacopo.mondi@ideasonboard.com>
 <Y9KTkSqgyxJbvsj9@kekkonen.localdomain> <CAPY8ntCWUSbvUKziuq0ABX2vOGJyCwtQN7MEt5LXQf0yKpfMKA@mail.gmail.com>
 <Y9Kj//mOE9Fq6ZXb@kekkonen.localdomain> <20230126173138.5mqxgy3tukug4n5u@uno.localdomain>
 <CAPY8ntDpHzf-ptpi-B_CVguQBFA3UjECYu3KAfYj_hzJsWzzZA@mail.gmail.com> <20230126200328.4ziwowchr2ir4smu@uno.localdomain>
In-Reply-To: <20230126200328.4ziwowchr2ir4smu@uno.localdomain>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 27 Jan 2023 11:08:00 +0000
Message-ID: <CAPY8ntDTbC6W3inPHdPhPv8_69U2NgEMMjtu7vWGAE=6gFDsHg@mail.gmail.com>
Subject: Re: [PATCH 0/3] media: imx258: Remove rotation=<80 requirement
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Robert Mader <robert.mader@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

On Thu, 26 Jan 2023 at 20:03, Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Hi David
>
> On Thu, Jan 26, 2023 at 05:58:30PM +0000, Dave Stevenson wrote:
> > Hi Jacopo
> >
> > On Thu, 26 Jan 2023 at 17:31, Jacopo Mondi
> > <jacopo.mondi@ideasonboard.com> wrote:
> > >
> > > Hello
> > >
> > > On Thu, Jan 26, 2023 at 06:02:07PM +0200, Sakari Ailus wrote:
> > > > Hi Dave,
> > > >
> > > > On Thu, Jan 26, 2023 at 03:48:04PM +0000, Dave Stevenson wrote:
> > > > > Hi Jacopo and Sakari
> > > > >
> > > > > On Thu, 26 Jan 2023 at 14:52, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > > > > >
> > > > > > Hi Jacopo,
> > > > > >
> > > > > > On Tue, Jan 17, 2023 at 11:06:00AM +0100, Jacopo Mondi wrote:
> > > > > > > Currently the imx258 driver requires to have the 'rotation' device node
> > > > > > > property specified in DTS with a fixed value of 180 degrees.
> > > > > > >
> > > > > > > The "rotation" fwnode device property is intended to allow specify the
> > > > > > > sensor's physical mounting rotation, so that it can be exposed through
> > > > > > > the read-only V4L2_CID_CAMERA_SENSOR_ROTATION control and applications
> > > > > > > can decide how to compensate for that.
> > > > > > >
> > > > > > > The imx258 driver has read-only VFLIP and HFLIP enabled, resulting in
> > > > > > > a 180 degrees image rotation being produced by the sensor. But this
> > > > > > > doesn't imply that the physical mounting rotation should match the
> > > > > > > driver's implementation.
> > > > > > >
> > > > > > > I took into the series Robert's patch that register device node properties and
> > > > > > > on top of that register flips controls, in order to remove the hard requirement
> > > > > > > of the 180 degrees rotation property presence.
> > > > > >
> > > > > > Reconsidering these patches after the flipping vs. rotation discussion,
> > > > > > they seem fine. The only thing I'd like to see, after removing the rotation
> > > > > > property check, would be to add support for the actual flipping controls.
> > > > > > I'm pretty sure they can be found in the same registers as on CCS --- the
> > > > > > rest of the registers look very much like that. Would you like to send a
> > > > > > patch? :-)
> > > > >
> > > > > Yes it is register 0x0101, bits 0 (H) & 1 (V).
> > > > >
> > > > > Do watch out as there are register errors in the driver. Currently
> > > > > Y_ADD_STA is set to 0, and Y_ADD_END to 3118, giving 3119 lines total.
> > > >
> > > > Yes, this is the problem with register list based drivers. Well spotted.
> > > >
> > > > I remember one driver for a Toshiba sensor using value of 5 for a register
> > > > the range of which was 2--10, but only even values were allowed. It worked
> > > > nonetheless... oh well.
> > > >
> > > > I wonder if this sensor would work better with the CCS driver
> > > >
> > > > > That means that when you initially implement flips the Bayer order
> > > > > won't change, but you change the field of view by one line.
> > > > > The start and end values also break the requirements listed in the
> > > > > datasheets for STA/END values being multiples of X (table 4-2 of the
> > > > > datasheet). Correcting that will change the Bayer order when inverted.
> > > > > Does that count as a regression to userspace? I hope not. Memory says
> > > > > that if you don't correct Y_ADD_END then some of the binned modes
> > > > > misbehave.
> > > >
> > > > Most sensors also require even values for the ?_ADDR_START registers (and
> > > > odd for the _ADDR_END registers). Using an invalid value sometimes might
> > > > work, too, but only testing will tell.
> > > >
> > > > >
> > > > > I have been through this loop before as Soho Enterprise [1] make an
> > > > > IMX258 board for the Pi. I haven't upstreamed the patches [2] though
> > > > > (sorry).
> > > >
> > > > It'd be nice if both worked with the same driver.
> > > >
> > >
> > > There are a lot of interesting changes in here that would be worth
> > > upstreaming
> > > https://github.com/raspberrypi/linux/commits/rpi-5.15.y/drivers/media/i2c/imx258.c
> >
> > I do feel a little guilty for not upstreaming these patches myself,
> > but I'm currently not being given any time to do so. Perhaps I'll take
> > an afternoon off and blitz a load of patches (imx258, imx290, and
> > ov7251 for a start).
> >
> > Obviously that branch is based on 5.15. I was going to say that the
> > rpi-6.2.y branch may be a better source, however it looks like all the
> > commits got squashed :-(
> >
> > > I would prefer if we can get these three easy patches of minr in and
> > > then start shoveling the good stuff from the rpi repo ?
> > >
> > > Otherwise I can plumb flip support in with the current wrong totals
> > > which, if I understand you right, doesn't require changing the bayer
> > > patter order ?
> >
> > Memory says VFLIP won't currently change Bayer order, but I think HFLIP will.
> > If it is permitted to merge the current read-only FLIP patches, then
> > I'd suggest doing that initially.
> >
> > Out of interest, do you have a user of imx258, or is this just as clean ups?
> > It may be possible to get a sample from Soho Enterprises if you
> > explain your involvement in libcamera. They're generally very
> > approachable.
> >
>
> Thanks for the hint.
>
> I'm using the imx258 on the PinephonePro, so I have a testing device.
>
> I don't see a tuning file for the sensor in libcamera, does Soho
> Enterprise ever published one ?

I don't recall having seen a final tuning file for imx258, but it
would be for the Pi IPA anyway which would make it less applicable for
the PinephonePro.
They've been making a number of modules, and I need to encourage them
to upstream their drivers and tunings. Their main guy is ex-Sony, so
he's fairly hot on image quality and tuning, but has turned to me for
a moderate amount of the kernel side detail.

It looks like https://forums.raspberrypi.com/viewtopic.php?t=331819
was our forum thread discussing imx258. The incorrect register
settings were giving white lines on the edges of the images,
particularly on the binned modes.
I have no information on HDR or PDAF for imx258, although I do know
both are different from IMX708. Also note that PDAF is optional in the
module, so shielded pixel correction needs to be correctly set for the
module.

Feel free to shout if you need me to test any driver changes, although
I'll keep an eye out for any imx258 patches anyway.

  Dave

> >   Dave
> >
> > >
> > > > --
> > > > Kind regards,
> > > >
> > > > Sakari Ailus
