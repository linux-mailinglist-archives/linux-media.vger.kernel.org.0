Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A40C1602D3B
	for <lists+linux-media@lfdr.de>; Tue, 18 Oct 2022 15:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230520AbiJRNnv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Oct 2022 09:43:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbiJRNnu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Oct 2022 09:43:50 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B04CFCD5DA
        for <linux-media@vger.kernel.org>; Tue, 18 Oct 2022 06:43:47 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id e18so20486285edj.3
        for <linux-media@vger.kernel.org>; Tue, 18 Oct 2022 06:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yEcjpWuUxusjm189Rz+dB5rGI9FF42NYghY8KHu2wcA=;
        b=UAekHIE+QN0zK9VRYyfV13w6JUBqwjeIw+O+zokNX65xCbhJmSjYAD3+VI+wS2xHBd
         9+NrLhHf3J5HIFrjlJq12Z8wLy2I30S/Ri1hemCmOvolkauwct1J7klROVwWC1xMJsVz
         n6RbZol9znCem52B/h+YMY0LcysE2GsGiI7a1qeaGYrHRWZlyrvpCeiLr28WlQ3uK7bh
         GNSoD7jQSl+rhUZk0EWlOxiJi4EZrH7zXsxbCzaKQI1/GmcYp8VgrjVD7F8MvJeq1CVa
         1nY001uaun0z2HnjQ8iAiSRywICcV/3mG5izRkoQSZeOzYAZbA+TYRPXLSMDUz91GQmp
         kVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yEcjpWuUxusjm189Rz+dB5rGI9FF42NYghY8KHu2wcA=;
        b=3KfKYU32LSUVzpDiP4uJmxH+Ef+wH9NwkA1CztAR3JGrVuOznoTxk5xlTL7j5K0APE
         f3og5IMpC6XluTjN0UFRD1OG/9UJB3IyL3IHzKrzi3mkfnQKGi2z7q/rS2fQbEUNZwBQ
         Ndh+NO69q4YUjjkS2SFyzoIsa02Ros5VfYAq4hOwMB4hVZjWi/oP1Zqm6EsUJoAw8MH3
         2Gp1Xg33ZS5D/FQhsWxH/GS4sVet7ZVjkKLQ44mesS25nzcqZx6t3c0jv5mDQC7WLMT3
         Eeo3jbG9leZi0FSsf5YzbTA1uO7xrCiorI02jIi5guvysVs91BQv65lYQhAijJ/VqiB2
         aE0w==
X-Gm-Message-State: ACrzQf3PtwbXHcTrgA9eURQrtB+HrqC2dXgg9o8lf+jND86yLw/T1k5+
        bxXGI8RWLdRH3hdDbeLpAERrOycm6ughji9O1UzXTQ==
X-Google-Smtp-Source: AMsMyM7UJa77qhYdUByVfF3j3S7kZDhM2M9VtitEIBPhfH8paoyJquTi11y/x8pqbSZxOvl+cHq2ku3XaoafUyfxJq4=
X-Received: by 2002:a05:6402:190e:b0:45c:d10a:4c1a with SMTP id
 e14-20020a056402190e00b0045cd10a4c1amr2690702edz.345.1666100626183; Tue, 18
 Oct 2022 06:43:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
 <YwQpT5JpyfXBEIVE@pendragon.ideasonboard.com> <CAPY8ntAsJNOAJ2te2vQSK6AeXj8LyB6Krepc88FL=6U6O9zb2g@mail.gmail.com>
 <Y0uYhiny89r9J8//@pendragon.ideasonboard.com> <CAPY8ntDJ0-hLSHWtX5+bHaDR9quu=usP1+gaHFcZupAHtQYAFg@mail.gmail.com>
 <CAPY8ntDm8VSDT1DhvdRmOjUbq3feQ61MN6XQ70p1ZX4d+JwA_g@mail.gmail.com>
In-Reply-To: <CAPY8ntDm8VSDT1DhvdRmOjUbq3feQ61MN6XQ70p1ZX4d+JwA_g@mail.gmail.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 18 Oct 2022 14:43:30 +0100
Message-ID: <CAPY8ntBPhYAh7XqM_oHwNxa5KgqFFdRcFUhn8HVO0+XHgWHkiA@mail.gmail.com>
Subject: Re: [PATCH 00/19] media: i2c: imx290: Miscellaneous improvements
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 17 Oct 2022 at 19:07, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Laurent
>
> On Sun, 16 Oct 2022 at 08:34, Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > Hi Laurent
> >
> > On Sun, 16 Oct 2022 at 06:37, Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > Hi Dave,
> > >
> > > On Mon, Oct 10, 2022 at 11:31:33AM +0100, Dave Stevenson wrote:
> > > > Hi Laurent
> > > >
> > > > Do you have plans for a v2 on this patch set? I also have a number of
> > > > patches for imx290 and there's little point in causing grief to each
> > > > other with conflicts.
> > > > Or I could take the non-controversial patches from your set and send a
> > > > combined patch set?
> > >
> > > I'm working on a v2, I'll send it shortly. Do I assume correctly you'll
> > > submit IMX327 support on top ? :-)
> >
> > Thanks - I'll review it tomorrow and sort my patches on top again.
>
> I've reworked my patches on top of yours. It gives r/w VBLANK and
> HBLANK, and corrects PIXEL_RATE.
> I'm testing on our 6.0 branch, but
> https://github.com/6by9/linux/commits/linuxtv_imx290/drivers/media/i2c
> is against the linux-media branch.
>
> I've messed something up in the "media: i2c: imx290: Support 60fps in
> 2 lane operation" patch at present - I'm looking into what has gone
> wrong, as the earlier versions of that patch worked fine. The branch
> will get force-pushed once I've fixed it.

Sorted and branch updated.
1080p or 720p, up to 60fps, 10 or 12bit, on 2 or 4 lanes all working.

> > This driver is effectively IMX327 - max 1920x1080@60fps in 12 bit.
> >
> > IMX290 adds a 1920x1080@120fps 10bit only mode which isn't currently
> > supported by the driver. I have patches to add 10bit support, but I
> > don't increase the frame rate in them.
> >
> > IMX462 adds that 1920x1080@120fps mode in both 10 and 12 bit, but
> > again I haven't looked at adding support, partly as I don't have a
> > datasheet for that variant. I may see if the change for 120fps 10bit
> > on imx290 works in 12 bit mode for IMX462.
> > For IMX290, 1080p120 needs a link frequency of 445.5MHz on 4 lanes to
> > be supported (2 lanes not permitted), so there will be more link
> > frequency messing required to support it. The basic numbers say that
> > is fast enough for 12bit as well, so there's hope.
>
> I guess seeing as I'm messing with the clock setup, I may as well keep
> going and look at the 120fps modes. It's a little trickier as the Pi
> ISP will be on the edge at those rates, but it should be good enough.

I've got 120fps working on an IMX462 as 720p 10 or 12bit, and as 1080p
10bit. 1080p 12 bit goes psychedelic!

From that I've noted that the CSI-2 TCLKPOST, THSZERO, THSPREPARE, etc
settings (0x3446-0x3455) are all common to a link frequency, so it
probably makes more sense to separate them out based on that. I'll
look to rework my 2 lane 60fps patch based on that, and then consider
extending it for 120fps.

As another quirk, the HMAX register switches to units of 2 pixels when
FR_SEL = 0 for 120fps. FR_SEL = 2 (30fps mode) and it's 1/2 a pixel.

  Dave

> There is an awkward question with regard link-frequencies. Is there a
> need to support multiple sets of link-frequency, or do we support any
> set of 2?
> ie for imx290, on 4 lanes do we want:
> - 891Mbit/s for 1080p120 10bit
> - 445.5Mbit/s for 1080p60 10 or 12 bit
> - 594Mbit/s for 720p120 10bit
> - 297Mbit/s for 720p60 10 and 12 bit
> all to be present in DT?
> If only 891 and 594 then you're limited to 10 bit images, but
> otherwise it should be fully functional. The max frame interval would
> be half that of 445.5 and 297 though, so there are compromises, but
> who/what then controls the link_frequency to switch between the
> ranges?
>
> I can see another can of worms being opened here!
>
>   Dave
>
> >   Dave
> >
> > > > On Tue, 23 Aug 2022 at 02:12, Laurent Pinchart wrote:
> > > > >
> > > > > Hi Sakari,
> > > > >
> > > > > Could you already pick up patches 01/19, 02/19, 04/19, 05/19 and 06/19
> > > > > in your tree ? Your opinion on 03/19 woud be appreciated too, I think
> > > > > it's a candidate for merge as well.
> > > > >
> > > > > On Thu, Jul 21, 2022 at 11:35:21AM +0300, Laurent Pinchart wrote:
> > > > > > Hello,
> > > > > >
> > > > > > This patch series gathers miscellaneous improvements for the imx290
> > > > > > driver. The most notable changes on the kernel side is patch 07/19 that
> > > > > > simplifies register access, and on the userspace API side patches 14/19,
> > > > > > 15/19 and 18/19 that extend the driver with controls and selection
> > > > > > rectangles required by libcamera.
> > > > > >
> > > > > > Laurent Pinchart (19):
> > > > > >   media: i2c: imx290: Use device lock for the control handler
> > > > > >   media: i2c: imx290: Print error code when I2C transfer fails
> > > > > >   media: i2c: imx290: Specify HMAX values in decimal
> > > > > >   media: i2c: imx290: Replace macro with explicit ARRAY_SIZE()
> > > > > >   media: i2c: imx290: Drop imx290_write_buffered_reg()
> > > > > >   media: i2c: imx290: Drop regmap cache
> > > > > >   media: i2c: imx290: Support variable-sized registers
> > > > > >   media: i2c: imx290: Correct register sizes
> > > > > >   media: i2c: imx290: Simplify error handling when writing registers
> > > > > >   media: i2c: imx290: Define more register macros
> > > > > >   media: i2c: imx290: Add exposure time control
> > > > > >   media: i2c: imx290: Fix max gain value
> > > > > >   media: i2c: imx290: Split control initialization to separate function
> > > > > >   media: i2c: imx290: Implement HBLANK and VBLANK controls
> > > > > >   media: i2c: imx290: Create controls for fwnode properties
> > > > > >   media: i2c: imx290: Move registers with fixed value to init array
> > > > > >   media: i2c: imx290: Factor out format retrieval to separate function
> > > > > >   media: i2c: imx290: Add crop selection targets support
> > > > > >   media: i2c: imx290: Replace GAIN control with ANALOGUE_GAIN
> > > > > >
> > > > > >  drivers/media/i2c/imx290.c | 781 ++++++++++++++++++++++---------------
> > > > > >  1 file changed, 458 insertions(+), 323 deletions(-)
> > >
> > > --
> > > Regards,
> > >
> > > Laurent Pinchart
