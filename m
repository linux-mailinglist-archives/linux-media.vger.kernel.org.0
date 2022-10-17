Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8466015F0
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 20:07:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbiJQSHn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 14:07:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230483AbiJQSHm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 14:07:42 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABB115C958
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 11:07:37 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id m15so17172719edb.13
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 11:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tRecpXVLC2UalbdI87A3eP17BXEJBH67cZGDcYxlQ8A=;
        b=QMCicVI12hzh1TDuieMYl1p37vuOBsN73RKHiTlWmdIT9XCMwHkI1w2eZEfOUtAxI0
         zq7ny5vqHvkZ6Rf5RovoYy4oc7ahSwrsndrHnzLOZgMK847sIJvEo4yEKQpH3ZsidVxy
         jnvdrt/EC5HFfYpoJ72zMy89ozrqMNfEHxKwBXlIEQhQZh8vhhxbPE5jgllJHXxDy7ux
         s9MR5JfRe+7PtiLKS4BEjQGQPSLP/UW9Lx/satSU0PC0f2Q7A7JdBScmvmQwP9iB08F8
         Qxgud5aRLoCNOYJ/y6MBu7p0h1rqDEYBDLHAxZ2aOQDU5BRuFCAmyFZSV8xsMFkBvQE1
         UNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tRecpXVLC2UalbdI87A3eP17BXEJBH67cZGDcYxlQ8A=;
        b=h0oL0aBOcAcNmWYhPUryB+ZnkOxlBCWau8+oVTjnJ6J6+SU9n29rBaFglabEoORFh6
         GX79tYManp62eWAtqEGMumf93+m/UrrG/c+lgH+s9zLMOmksOTSKM947B7OGE2hRQzOw
         1CgUWbjCE3bnj2fBgKNF718JaCfV7ctyUSElD35WxV0NveUax8StuPyScqmDIOMxRhBU
         UzI9IwcetY4TSjCNBH7UiAzLkC+lOwP7CfmW9Aex2ABOh5Bjrq0yG9dH4tbJKxiuWmNK
         aJ6ToQFwYR91tp5bNas9eEskeXw05k+uZoM+xs+BvdKf13WD3UJOj9MCCMKXsSpL0nRN
         39QQ==
X-Gm-Message-State: ACrzQf1r3/weZoQj03ng/g2GaZigu9pE9EPnA5hlRa5KwEGGdM+uUJ+o
        2SYdJvDtp+Ey8jBRr4yCd0Mc3VkKg1b9jz5xRLCCIfU3FuLqtw==
X-Google-Smtp-Source: AMsMyM7dZLYAvsYKaiHcK23Fu3sEjjPrtL9vvucGjRKBuIlnx4zkPsOI7jA6pIFv4lQduC5tDQaANuju99z9qWMbWZo=
X-Received: by 2002:aa7:c60a:0:b0:458:d707:117 with SMTP id
 h10-20020aa7c60a000000b00458d7070117mr11543244edq.258.1666030056252; Mon, 17
 Oct 2022 11:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
 <YwQpT5JpyfXBEIVE@pendragon.ideasonboard.com> <CAPY8ntAsJNOAJ2te2vQSK6AeXj8LyB6Krepc88FL=6U6O9zb2g@mail.gmail.com>
 <Y0uYhiny89r9J8//@pendragon.ideasonboard.com> <CAPY8ntDJ0-hLSHWtX5+bHaDR9quu=usP1+gaHFcZupAHtQYAFg@mail.gmail.com>
In-Reply-To: <CAPY8ntDJ0-hLSHWtX5+bHaDR9quu=usP1+gaHFcZupAHtQYAFg@mail.gmail.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 17 Oct 2022 19:07:20 +0100
Message-ID: <CAPY8ntDm8VSDT1DhvdRmOjUbq3feQ61MN6XQ70p1ZX4d+JwA_g@mail.gmail.com>
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

Hi Laurent

On Sun, 16 Oct 2022 at 08:34, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Laurent
>
> On Sun, 16 Oct 2022 at 06:37, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Dave,
> >
> > On Mon, Oct 10, 2022 at 11:31:33AM +0100, Dave Stevenson wrote:
> > > Hi Laurent
> > >
> > > Do you have plans for a v2 on this patch set? I also have a number of
> > > patches for imx290 and there's little point in causing grief to each
> > > other with conflicts.
> > > Or I could take the non-controversial patches from your set and send a
> > > combined patch set?
> >
> > I'm working on a v2, I'll send it shortly. Do I assume correctly you'll
> > submit IMX327 support on top ? :-)
>
> Thanks - I'll review it tomorrow and sort my patches on top again.

I've reworked my patches on top of yours. It gives r/w VBLANK and
HBLANK, and corrects PIXEL_RATE.
I'm testing on our 6.0 branch, but
https://github.com/6by9/linux/commits/linuxtv_imx290/drivers/media/i2c
is against the linux-media branch.

I've messed something up in the "media: i2c: imx290: Support 60fps in
2 lane operation" patch at present - I'm looking into what has gone
wrong, as the earlier versions of that patch worked fine. The branch
will get force-pushed once I've fixed it.

> This driver is effectively IMX327 - max 1920x1080@60fps in 12 bit.
>
> IMX290 adds a 1920x1080@120fps 10bit only mode which isn't currently
> supported by the driver. I have patches to add 10bit support, but I
> don't increase the frame rate in them.
>
> IMX462 adds that 1920x1080@120fps mode in both 10 and 12 bit, but
> again I haven't looked at adding support, partly as I don't have a
> datasheet for that variant. I may see if the change for 120fps 10bit
> on imx290 works in 12 bit mode for IMX462.
> For IMX290, 1080p120 needs a link frequency of 445.5MHz on 4 lanes to
> be supported (2 lanes not permitted), so there will be more link
> frequency messing required to support it. The basic numbers say that
> is fast enough for 12bit as well, so there's hope.

I guess seeing as I'm messing with the clock setup, I may as well keep
going and look at the 120fps modes. It's a little trickier as the Pi
ISP will be on the edge at those rates, but it should be good enough.

There is an awkward question with regard link-frequencies. Is there a
need to support multiple sets of link-frequency, or do we support any
set of 2?
ie for imx290, on 4 lanes do we want:
- 891Mbit/s for 1080p120 10bit
- 445.5Mbit/s for 1080p60 10 or 12 bit
- 594Mbit/s for 720p120 10bit
- 297Mbit/s for 720p60 10 and 12 bit
all to be present in DT?
If only 891 and 594 then you're limited to 10 bit images, but
otherwise it should be fully functional. The max frame interval would
be half that of 445.5 and 297 though, so there are compromises, but
who/what then controls the link_frequency to switch between the
ranges?

I can see another can of worms being opened here!

  Dave

>   Dave
>
> > > On Tue, 23 Aug 2022 at 02:12, Laurent Pinchart wrote:
> > > >
> > > > Hi Sakari,
> > > >
> > > > Could you already pick up patches 01/19, 02/19, 04/19, 05/19 and 06/19
> > > > in your tree ? Your opinion on 03/19 woud be appreciated too, I think
> > > > it's a candidate for merge as well.
> > > >
> > > > On Thu, Jul 21, 2022 at 11:35:21AM +0300, Laurent Pinchart wrote:
> > > > > Hello,
> > > > >
> > > > > This patch series gathers miscellaneous improvements for the imx290
> > > > > driver. The most notable changes on the kernel side is patch 07/19 that
> > > > > simplifies register access, and on the userspace API side patches 14/19,
> > > > > 15/19 and 18/19 that extend the driver with controls and selection
> > > > > rectangles required by libcamera.
> > > > >
> > > > > Laurent Pinchart (19):
> > > > >   media: i2c: imx290: Use device lock for the control handler
> > > > >   media: i2c: imx290: Print error code when I2C transfer fails
> > > > >   media: i2c: imx290: Specify HMAX values in decimal
> > > > >   media: i2c: imx290: Replace macro with explicit ARRAY_SIZE()
> > > > >   media: i2c: imx290: Drop imx290_write_buffered_reg()
> > > > >   media: i2c: imx290: Drop regmap cache
> > > > >   media: i2c: imx290: Support variable-sized registers
> > > > >   media: i2c: imx290: Correct register sizes
> > > > >   media: i2c: imx290: Simplify error handling when writing registers
> > > > >   media: i2c: imx290: Define more register macros
> > > > >   media: i2c: imx290: Add exposure time control
> > > > >   media: i2c: imx290: Fix max gain value
> > > > >   media: i2c: imx290: Split control initialization to separate function
> > > > >   media: i2c: imx290: Implement HBLANK and VBLANK controls
> > > > >   media: i2c: imx290: Create controls for fwnode properties
> > > > >   media: i2c: imx290: Move registers with fixed value to init array
> > > > >   media: i2c: imx290: Factor out format retrieval to separate function
> > > > >   media: i2c: imx290: Add crop selection targets support
> > > > >   media: i2c: imx290: Replace GAIN control with ANALOGUE_GAIN
> > > > >
> > > > >  drivers/media/i2c/imx290.c | 781 ++++++++++++++++++++++---------------
> > > > >  1 file changed, 458 insertions(+), 323 deletions(-)
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
