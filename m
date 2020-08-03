Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34FD923A261
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 11:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgHCJ65 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 05:58:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725968AbgHCJ65 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Aug 2020 05:58:57 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D345C06174A
        for <linux-media@vger.kernel.org>; Mon,  3 Aug 2020 02:58:57 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id b6so33589415wrs.11
        for <linux-media@vger.kernel.org>; Mon, 03 Aug 2020 02:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fk/8iyRZ6r4HjB+Kw1uzDbjimyFRO8jWb83tQILJlDc=;
        b=srHlFP3GBi1w1GogyFwQHTURSNovQaHOntCxE2M1i/Io9WLSN4/KyY0S+jvieK6tzu
         X6FF9Ak9WClV0vLuydYYwDYB34YF5g8jXA28ziSlvZOwbAA+oKZOxRDStmJ/3wiZ1uAa
         v7ePZHh4G73ruF3MvwrwuNHlNrkxZFXNzMo45EFxgs8hg1dsq5grdb+2DYOR/IKmknI2
         8bZ603Kh1MVrwFxqLPaeVGfbSmm4onzn/fuPs7cQpnocdRXzFnB6Ifk2PHHMsgeQQJrQ
         lMHNUmmTZ2s/5hZtwdtOzyIlnIsmXf2krWJ0p1McRaHhFiiXRjYNp6uejRzxZ1HbgKQl
         L2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fk/8iyRZ6r4HjB+Kw1uzDbjimyFRO8jWb83tQILJlDc=;
        b=mJ0rcVSLvk+5YJN0yeDVGBCQJ76/sBIekQ9Ascoj7hR919f5sGNDm7ScyxtsAaba/f
         vRzIRNDamvOGqgMB4FD7PwYS0IB9EKjrAn4dOQECilylQmpQ1e3KFlx1v/1LgggFDqlV
         iJ9O8e+l4FAtP8JxTkoyF4cB5QAKvgcHSFS8XdJ0yLPoGjWar/rdlMT7zlvKuT65Zz/+
         XwxxzF/Wyi8r/0yNyLwDwy1u2pbYODDxMyLMZK3iVzmbo1p9l33eXLtyIdtyq8zN4xoL
         E9wf85VqQe6XA8iKH1+unka2+E7xVrj1mAhKtiocWEdkvtrcRC4auil6Enw/tmeZXU+Y
         HXtg==
X-Gm-Message-State: AOAM530+CEl5dkS5AJ/vdq2XmoH+RbFxSi+yKul+qhKGb63jjH/nZ4wY
        2ME7REniZrImhf67tUgeHBmhjruGzGkjBf+LNrqE8g==
X-Google-Smtp-Source: ABdhPJwBnH6e0p1/0G1a7YfKMU805vvQJUOeFGYoMdlLHIbT5vImj7/EGEbkGgcZAf4jXojSRFTa887RmWhmxOnZHgU=
X-Received: by 2002:a5d:5383:: with SMTP id d3mr14376312wrv.42.1596448735618;
 Mon, 03 Aug 2020 02:58:55 -0700 (PDT)
MIME-Version: 1.0
References: <b580ac9d-5ae4-29ce-c81a-a1f98b1d953b@xs4all.nl> <20200801111903.zt2d2djusjdh27vc@uno.localdomain>
In-Reply-To: <20200801111903.zt2d2djusjdh27vc@uno.localdomain>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 3 Aug 2020 10:58:39 +0100
Message-ID: <CAPY8ntA3FtOELrbKL0hfR_c9fyoC_pLSv4sa0PUiME_ywq3WBw@mail.gmail.com>
Subject: Re: [libcamera-devel] [PATCH] imx219: selection compliance fixes
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Naushir Patuck <naush@raspberrypi.com>,
        libcamera-devel@lists.libcamera.org,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo, Hans, and Laurent.

On Sat, 1 Aug 2020 at 12:15, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hi Hans, Laurent,
>
>     sorry, long email, contains a few things on the general definition
>     of the selection target, a question for libcamera, and a few more
>     details at the end.
>
> Adding Sakari, libcamera ml, Ricardo which helped with the
> definition of pixel array properties in libcamera recently and
> Dave and Naush as this sensor is the RPi camera module v2 and some
> information on the sensor come from their BSP.

Thanks for cc'ing me in but I'll say that this seems to be a framework
question rather than specifically an IMX219 thing. I'll therefore
leave it to those with far more knowledge on how things are expected
to work within V4L2 to decide how this is meant to work, and how it
should all be defined (and documented!). I have no particular views on
it.

  Dave

> On Thu, Jul 02, 2020 at 03:50:04PM +0200, Hans Verkuil wrote:
> > The top/left crop coordinates were 0, 0 instead of 8, 8 in the
> > supported_modes array. This was a mismatch with the default values,
> > so this is corrected. Found with v4l2-compliance.
> >
> > Also add V4L2_SEL_TGT_CROP_BOUNDS support: CROP_DEFAULT and CROP_BOUNDS
> > always go together. Found with v4l2-compliance.
>
> Let me try to summarize the outcome of the discussion
>
> 1) All selection rectangles are defined in respect to the NATIVE_SIZE
>    target, which returns the full pixel array size, which includes
>    readable and non-readable pixels. It's top-left corner is in
>    position (0,0)
>
> 3) CROP_BOUND returns the portion of the full pixel array which can be
>    read out, including optical black pixels, and is defined in respect
>    to the full pixel array size
>
> 2) CROP_DEFAULT returns the portion of the readable part of the pixel array
>    which contains valid image data (aka 'active' pixels). It is again
>    defined in respect to the full pixel array rectangle returned by
>    NATIVE_SIZE target.
>
> With an ack on my understanding, I think it's worth expanding the
> target documentation a bit. As I've said I've been hesitant in doing
> so, as those targets do not only apply to image sensors, but I think a
> section that goes like "If the sub-device represents and image sensor
> then the V4L2_SEL_TGT_.. target represents ... "
>
> Laurent: this will have some impact on libcamera as well
> https://git.linuxtv.org/libcamera.git/tree/src/libcamera/camera_sensor.cpp#n503
> When we read the analogCrop rectangle, we decided it is defined in
> respect to the active portion of the pixel array (CROP_DEFAULT) and
> not from the full pixel array size (NATIVE_SIZE).
>
> We then should:
> 1) Back-track on our decision to have analog crop defined in respect
> to the active part and decide it should be defined in respect to the
> full pixel array: this has implications on the existing IPAs that
> assume what we have defined
>
> 2) Adjust the analogCrop rectangle by subtracting to its sizes the
> values reported by TGT_CROP_DEFAULT.top and TGT_CROP_DEFAULT.left.
>
> I would got for 2) what's your opinion ?
>
> On this specific patch:
>
> >
> > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > ---
> >  drivers/media/i2c/imx219.c | 17 +++++++++--------
> >  1 file changed, 9 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 0a546b8e466c..935e2a258ce5 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -473,8 +473,8 @@ static const struct imx219_mode supported_modes[] = {
> >               .width = 3280,
> >               .height = 2464,
> >               .crop = {
> > -                     .left = 0,
> > -                     .top = 0,
> > +                     .left = 8,
> > +                     .top = 8,
>
> we have
> #define IMX219_PIXEL_ARRAY_LEFT         8U
> #define IMX219_PIXEL_ARRAY_TOP          8U
>
> Which I would then re-name IMX219_ACTIVE_ARRAY_LEFT and
> IMX219_ACTIVE_ARRAY_TOP and re-use it there
>
>
> >                       .width = 3280,
> >                       .height = 2464
> >               },
> > @@ -489,8 +489,8 @@ static const struct imx219_mode supported_modes[] = {
> >               .width = 1920,
> >               .height = 1080,
> >               .crop = {
> > -                     .left = 680,
> > -                     .top = 692,
> > +                     .left = 8 + 680,
> > +                     .top = 8 + 692,
> >                       .width = 1920,
> >                       .height = 1080
> >               },
> > @@ -505,8 +505,8 @@ static const struct imx219_mode supported_modes[] = {
> >               .width = 1640,
> >               .height = 1232,
> >               .crop = {
> > -                     .left = 0,
> > -                     .top = 0,
> > +                     .left = 8,
> > +                     .top = 8,
> >                       .width = 3280,
> >                       .height = 2464
> >               },
> > @@ -521,8 +521,8 @@ static const struct imx219_mode supported_modes[] = {
> >               .width = 640,
> >               .height = 480,
> >               .crop = {
> > -                     .left = 1000,
> > -                     .top = 752,
> > +                     .left = 8 + 1000,
> > +                     .top = 8 + 752,
> >                       .width = 1280,
> >                       .height = 960
> >               },
> > @@ -1014,6 +1014,7 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
> >               return 0;
> >
> >       case V4L2_SEL_TGT_CROP_DEFAULT:
> > +     case V4L2_SEL_TGT_CROP_BOUNDS:
>
> I think this is fine and that's my reasoning:
>
> The IMAX219 pixel array is documented as
>
>         /-------------- 3296 -------------------/
>          8                                     8
>         +---------------------------------------+    /
>         |IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII| 8  |
>         |IpppppppppppppppppppppppppppppppppppppI|    |
>         |IpppppppppppppppppppppppppppppppppppppI|    |
>         |IpppppppppppppppppppppppppppppppppppppI|    |
>         |IpppppppppppppppppppppppppppppppppppppI|    |
>         |IpppppppppppppppppppppppppppppppppppppI|    |
>         |IpppppppppppppppppppppppppppppppppppppI|    |
>
>                             ....                    2480
>
>         |IpppppppppppppppppppppppppppppppppppppI|    |
>         |IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII|    |
>         |IoooooooooooooooooooooooooooooooooooooI| 16 |
>         |IOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOI| 16 |
>         |IoooooooooooooooooooooooooooooooooooooI| 8  |
>         +---------------------------------------+    /
>
> Where:
>         I = invalid active area
>         p = valid pixels
>         o = Invalid OB area
>         O = Valid OB area
>         Effective area = 3296x2480
>         Active area = 3280x2464
>
> The 'active area' is then sorrounded by 8 invalid rows, 8 invalid
> cols at the beginning and the end, and followed by 8 more invalid
> rows. Then, 16 invalid black rows follow, then 16 -valid- black
> rows, then 8 invalid black rows again.
>
> My understanding is that the whole effective area is sent on the bus,
> as the CSI-2 timings report the sizes of the 'effective' area to be
> the whole 3296x2480 matrix, and assigns a CSI-2 data-type to the
> "Valid OB area" while sets the DataType for invalid areas to Null.
>
> However the registers that select the analog crop work on the 'active
> area' only, so there is not way to select "I want the Valid OB area"
> only, as the whole 'effective area' is sent on the bus and the CSI-2
> receivers filters on the DataType to discard the 'Invalid' lines (to
> which a Null DataType is assigned) and capture image data ('active area')
> and eventually 'Valid black' pixels (which have a data type assigned).
>
> All of this to say, there's no point in reporting a TGT_BOUND larger
> that the active area, as the user cannot select portions outside of it
> through the S_SELECTION API, but can only instruct it's CSI-2 receiver
> to filter-in the data it desires, which I think we're missing an API
> for.
>
> Hans: would you like to go ahead with this patch, or should I take
> over and change the libcamera part that parses these properties in one
> go ?
>
> Thanks
>   j
>
> >               sel->r.top = IMX219_PIXEL_ARRAY_TOP;
> >               sel->r.left = IMX219_PIXEL_ARRAY_LEFT;
> >               sel->r.width = IMX219_PIXEL_ARRAY_WIDTH;
> > --
> > 2.27.0
> >
> _______________________________________________
> libcamera-devel mailing list
> libcamera-devel@lists.libcamera.org
> https://lists.libcamera.org/listinfo/libcamera-devel
