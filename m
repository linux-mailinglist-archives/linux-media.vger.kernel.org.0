Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E65E950A275
	for <lists+linux-media@lfdr.de>; Thu, 21 Apr 2022 16:29:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389445AbiDUOaq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 10:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389318AbiDUOad (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 10:30:33 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C72D403D1
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 07:27:38 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id s25so6712571edi.13
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 07:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ALCyP2i1UbxZ7KCYJSxJM+jgx2i9XcgHldOg0Ow0n84=;
        b=jWdNIcuojmoZOUtv0jyku7MINQjYc+4/szwHu9NAT/kgeyYt97t/S9pIGpOf6oWzNw
         wK2zmGm70WuJjPJqxnyC0wYEnealRLvxIMUN5KVwPpxRiFOeov4a6KMbCyDXv2Kr0dS9
         sDBSQwnA79Zce3DHeMJL6tCCriv5wD8HhXYp8osc+TRZWchei4fhjQXN8N5mIxNGYXI5
         Ya1uCjn++94ipjSkxOhZQxrWIir7HEkvTTDtZKa98t204tJoENhv87FL738q1R27jO4O
         aasNCT2MyOxbAqA1d6SwPuGQYR5LNOekt1r7F78D37JLXuP1KckCshIragbwa36ouoiv
         Bl7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ALCyP2i1UbxZ7KCYJSxJM+jgx2i9XcgHldOg0Ow0n84=;
        b=gaBkRo/lCKhGZ3Ai4hbTIG2yr2xKa2dRzHnW9dhK4Zj5Xu0q50Yyj9JnMmrpGdwLoa
         I+PM7m2uAKm7XZUEeE+0sXGDDOcQ6rw8C2NCob01/kZvNDDNoxe9n7rJD3PpKxw/BFpW
         jQGyf7aqa6tTu3qxZJKNrQIz/7eFUkUDI4c4mkZrYOeqEv3HVo+pwN731b68P8AUlbtQ
         9M2lcbOQKTB3vtmqPnEdjCKhOYb1HLi+rSgNmgYwCwBEtDK/SL4+kOp8rTvqX+nl9akn
         3lU1dgj0BN4P9xvxBjkzxOF3cfGFmjqofBQpa0z1sUGKcyLrvGZyrKVncgVwr/J1CdqJ
         MjzQ==
X-Gm-Message-State: AOAM531D6D8yNPOt2Ia1z/UuJ0YD+6QkKmVpgYkm9oFqwYOgM9HTBTh0
        CWgs/anG6grXM2iC38o4OnbE+Mb4whIk9MUK2L0ffw==
X-Google-Smtp-Source: ABdhPJyx06vp8Pqx1CoBJUbYqsFWvYiGUuYBPIRIRYJ9CBT4qbkMdv+3B0/ljghI9d0dUZDebawA6HxjuKqDTbXv+gQ=
X-Received: by 2002:a05:6402:330c:b0:423:e13a:4bf with SMTP id
 e12-20020a056402330c00b00423e13a04bfmr23750718eda.235.1650551257110; Thu, 21
 Apr 2022 07:27:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAPY8ntA06L1Xsph79sv9t7MiDSNeSO2vADevuXZdXQdhWpSmow@mail.gmail.com>
 <CAPY8ntD6GZJ0oCDe1fQ8Pf+X+nY3nB0RcrAX-JxTiO0QiTUVPg@mail.gmail.com> <YlVEOjiGZZSnvMU3@pendragon.ideasonboard.com>
In-Reply-To: <YlVEOjiGZZSnvMU3@pendragon.ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 21 Apr 2022 15:27:20 +0100
Message-ID: <CAPY8ntCAK4re-wsWc10Yywa+x+8JTrv4ZfnvvZHuH72-4pboBg@mail.gmail.com>
Subject: Re: [libcamera-devel] Using the Selection API with image sensors for
 arbitrary cropping
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera devel <libcamera-devel@lists.libcamera.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

Sorry for my late reply here - I've been off sick for the last week.

On Tue, 12 Apr 2022 at 10:20, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Dave,
>
> (CC'ing Sakari)
>
> Sorry for the late reply. This is the kind of topic where I always hope
> someone will beat me to it and I won't have to reply :-)
>
> On Tue, Apr 05, 2022 at 12:37:56PM +0100, Dave Stevenson via libcamera-devel wrote:
> > On Thu, 17 Mar 2022 at 17:47, Dave Stevenson wrote:
> > >
> > > Hi All
> > >
> > > I'm trying to tally the selection API documentation for image sensors
> > > with implementing it in practice, specifically over arbitrary cropping
> > > on the sensor.
> > >
> > > I've had a downstream PR for IMX219 that adds support for the
> > > selection API to allow arbitrary cropping and selection of binning
> > > mode [1].
> > >
> > > The docs for "Writing camera sensor drivers" [2] lists the two options
> > > as either freely configurable via multiple subdevices, or register
> > > based. It doesn't apparently cover just cropping (there is no scaler
> > > on IMX219), but there is the IMX274 driver that implements setting the
> > > sensor cropping via the selection API [3].
> > >
> > > The current IMX219 register-based modes are
> > > - 3280x2464 up to 15fps
> > > - 1920x1080 up to 30fps as a crop of the 3280x2464 mode
> > > - 1640x1232 up to 40fps, 2x2 binned
> > > - 640x480 up to 200fps, "special" 2x2 binning and cropped.
> > >
> > > The main issue is that implementing the selection API reduces the
> > > number of modes that can be selected directly via set_fmt to the base
> > > 3280x2464 and 1640x1232. Surely that constitutes a regression as use
> > > cases that did work now don't, and therefore it is not acceptable.
> > > 3280x2464 can't run at 30fps, therefore we can't easily get a 1080p30
> > > source without additional knowledge of modes and crop settings.
> > >
> > > So how should the selection API be implemented without introducing regressions?
> > > Is it permitted to enumerate the extra modes as before and have them
> > > update the crop rectangle? The docs [4] say not:
> > > "Drivers shall set the active crop rectangle to the default when the
> > > driver is first loaded, but not later."
> > > which leaves a bit of a quandry.
> > >
> > > If we do drop the existing modes it just pushes the problem of which
> > > modes to select onto the client. Most likely you end up with an
> > > extended sensor specific helper in libcamera with a list of modes and
> > > the framerates that each can achieve, pretty much identical to the
> > > list of modes in the kernel at present.
> > > Any other clients are forced to jump through similar hoops (unlikely
> > > to happen), or we rename it to Video 4 Libcamera 2 ;-)
> > >
> > > Making that shift also means that selecting the special binning mode
> > > has to be done via some other heuristics. AIUI it's optimised for high
> > > frame rates so that's possible (but not nice).
> > >
> > > Guidance sought please.
>
> Good description of a complex problem. I'm afraid I have no ready-made
> answer that will solve all issues. If we were to forget about history
> and API compatibility, I'm sure we could design a decent API to expose
> the capabilities of camera sensors to userspace. Unfortunately, we
> can't, but none of the options I can think of will preserve the API.
>
> I'm tempted to design something decent going forward, and move older
> drivers to the new API over time as needed, with backward-compatibility
> handled as a module option or even by forking and duplicating drivers.
> It's messy, but keeping the status quo is even worse, we have lots of
> drivers that expose the same features in many different ways. It's
> becoming impossible to handle in any decent way in userspace.

That seems like a longer term proposition.
It sounds like converting to use the selection API largely isn't
possible at present, so I'll keep these as downstream patches, and
allow S_FMT to update the crop.

Thanks
  Dave

> > A gentle ping on this.
> >
> > At present I'm going to ignore the spec and allow setting the format
> > to update the crop. That way we retain the modes and avoid regression,
> > but allow those who wish to set an arbitrary selection to do so.
> >
> >   Dave
> >
> > > Thanks
> > >   Dave
> > >
> > > [1] https://github.com/raspberrypi/linux/pull/4935
> > > [2] https://www.kernel.org/doc/html/latest/driver-api/media/camera-sensor.html#frame-size
> > > [3] https://github.com/torvalds/linux/blob/master/drivers/media/i2c/imx274.c
> > > [4] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/selection-api-configuration.html#configuration-of-video-capture
>
> --
> Regards,
>
> Laurent Pinchart
