Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E93B4FDC8F
	for <lists+linux-media@lfdr.de>; Tue, 12 Apr 2022 13:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234379AbiDLKcM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Apr 2022 06:32:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379496AbiDLKTn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Apr 2022 06:19:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 735123A18F
        for <linux-media@vger.kernel.org>; Tue, 12 Apr 2022 02:19:58 -0700 (PDT)
Received: from pendragon.ideasonboard.com (153.162-64-87.adsl-dyn.isp.belgacom.be [87.64.162.153])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A1F525B;
        Tue, 12 Apr 2022 11:19:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1649755196;
        bh=MsQwv2bss410d0/tWROSDz9GbPrZPVTU3xveR1CWisI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dlY82du1U0t4tlcck4qXavUaoiVa8x/R+hHeZbZLU18AmXTwKF9v0Sqx6kZKVVImL
         nhFl0lMlSyK6akSY2hPso0iOt0UyvQpharTxU3FdaRDRR8dTLDs9FKb/CedXjxtyz+
         93b23RGh4vgtciX/rLNITysFiYzw54q8rEXs5240=
Date:   Tue, 12 Apr 2022 12:19:54 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera devel <libcamera-devel@lists.libcamera.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [libcamera-devel] Using the Selection API with image sensors for
 arbitrary cropping
Message-ID: <YlVEOjiGZZSnvMU3@pendragon.ideasonboard.com>
References: <CAPY8ntA06L1Xsph79sv9t7MiDSNeSO2vADevuXZdXQdhWpSmow@mail.gmail.com>
 <CAPY8ntD6GZJ0oCDe1fQ8Pf+X+nY3nB0RcrAX-JxTiO0QiTUVPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntD6GZJ0oCDe1fQ8Pf+X+nY3nB0RcrAX-JxTiO0QiTUVPg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

(CC'ing Sakari)

Sorry for the late reply. This is the kind of topic where I always hope
someone will beat me to it and I won't have to reply :-)

On Tue, Apr 05, 2022 at 12:37:56PM +0100, Dave Stevenson via libcamera-devel wrote:
> On Thu, 17 Mar 2022 at 17:47, Dave Stevenson wrote:
> >
> > Hi All
> >
> > I'm trying to tally the selection API documentation for image sensors
> > with implementing it in practice, specifically over arbitrary cropping
> > on the sensor.
> >
> > I've had a downstream PR for IMX219 that adds support for the
> > selection API to allow arbitrary cropping and selection of binning
> > mode [1].
> >
> > The docs for "Writing camera sensor drivers" [2] lists the two options
> > as either freely configurable via multiple subdevices, or register
> > based. It doesn't apparently cover just cropping (there is no scaler
> > on IMX219), but there is the IMX274 driver that implements setting the
> > sensor cropping via the selection API [3].
> >
> > The current IMX219 register-based modes are
> > - 3280x2464 up to 15fps
> > - 1920x1080 up to 30fps as a crop of the 3280x2464 mode
> > - 1640x1232 up to 40fps, 2x2 binned
> > - 640x480 up to 200fps, "special" 2x2 binning and cropped.
> >
> > The main issue is that implementing the selection API reduces the
> > number of modes that can be selected directly via set_fmt to the base
> > 3280x2464 and 1640x1232. Surely that constitutes a regression as use
> > cases that did work now don't, and therefore it is not acceptable.
> > 3280x2464 can't run at 30fps, therefore we can't easily get a 1080p30
> > source without additional knowledge of modes and crop settings.
> >
> > So how should the selection API be implemented without introducing regressions?
> > Is it permitted to enumerate the extra modes as before and have them
> > update the crop rectangle? The docs [4] say not:
> > "Drivers shall set the active crop rectangle to the default when the
> > driver is first loaded, but not later."
> > which leaves a bit of a quandry.
> >
> > If we do drop the existing modes it just pushes the problem of which
> > modes to select onto the client. Most likely you end up with an
> > extended sensor specific helper in libcamera with a list of modes and
> > the framerates that each can achieve, pretty much identical to the
> > list of modes in the kernel at present.
> > Any other clients are forced to jump through similar hoops (unlikely
> > to happen), or we rename it to Video 4 Libcamera 2 ;-)
> >
> > Making that shift also means that selecting the special binning mode
> > has to be done via some other heuristics. AIUI it's optimised for high
> > frame rates so that's possible (but not nice).
> >
> > Guidance sought please.

Good description of a complex problem. I'm afraid I have no ready-made
answer that will solve all issues. If we were to forget about history
and API compatibility, I'm sure we could design a decent API to expose
the capabilities of camera sensors to userspace. Unfortunately, we
can't, but none of the options I can think of will preserve the API.

I'm tempted to design something decent going forward, and move older
drivers to the new API over time as needed, with backward-compatibility
handled as a module option or even by forking and duplicating drivers.
It's messy, but keeping the status quo is even worse, we have lots of
drivers that expose the same features in many different ways. It's
becoming impossible to handle in any decent way in userspace.

> A gentle ping on this.
> 
> At present I'm going to ignore the spec and allow setting the format
> to update the crop. That way we retain the modes and avoid regression,
> but allow those who wish to set an arbitrary selection to do so.
> 
>   Dave
> 
> > Thanks
> >   Dave
> >
> > [1] https://github.com/raspberrypi/linux/pull/4935
> > [2] https://www.kernel.org/doc/html/latest/driver-api/media/camera-sensor.html#frame-size
> > [3] https://github.com/torvalds/linux/blob/master/drivers/media/i2c/imx274.c
> > [4] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/selection-api-configuration.html#configuration-of-video-capture

-- 
Regards,

Laurent Pinchart
