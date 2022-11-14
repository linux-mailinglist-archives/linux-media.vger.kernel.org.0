Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9AA4628249
	for <lists+linux-media@lfdr.de>; Mon, 14 Nov 2022 15:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235655AbiKNOU5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Nov 2022 09:20:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236316AbiKNOUz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Nov 2022 09:20:55 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1F90264AF
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 06:20:53 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id f5so28697836ejc.5
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 06:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mpDNcQogoRH91FE2XPdh8Pf5SXaJ20FZy6vsy4EAD9Y=;
        b=g4jysZ+CDlUAgcFqqjwj30g7oHVU/S47F+97DJQwEljp7VugnxnG0Xm45wTfINAFFw
         b8PGHS1utBRnsQ3h/WAqjAw6Bb1ItNjLxKYzMoC8w/p+4PiwcG09Nlmg4U7U0fVii+KO
         FJIitekF0uTsCbL19SYzd+mHHEKjKT/lSISLJjIJW2rugKF4FK1OzxPcEBiwvDayJ+AQ
         ufUDVSOLb0imiaL6/2xo1SwZJ4r4BwiG0suwnymWX9PeiZKNW6P2IzdMfA0TB2d1GdaD
         6Afi+v3300Mn9S3RlGdL4LCoSkMq00DpmVWc9g5PhmYfqfLShBuzHncb3+OBhB+k9G3t
         Ekbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mpDNcQogoRH91FE2XPdh8Pf5SXaJ20FZy6vsy4EAD9Y=;
        b=4aayfyWwTnAtZxEFzgfUl1jxf58S1Uzs/INMhojx2fukI1Z8WXLyvYPTa5bV5q1J28
         jT9YqOUGPmSNAIO3iomSKYwCfcqhr5h59cMXXrOw0DFRGICyo/2MnSOgmAu+kg7WR0Y7
         OziwSbv6Vx+0TZQ8kv7kKz1br4cPzSj0vP9IqdJCcInZZPI2SBTgsXfyb0ZI33OmcP3S
         /Wf1MCKYRYtZ7lOw8G59+lxRWAEHuDeQUWGohBRTVCDsXhppy95DKBOsuBJSksssE+O7
         qHMqg3jpJokOEslpfxfA5mjBOvLCXdQTK/kuJK7gvIWGjV9GxsxtOx1/swvISpYp1ZFi
         J6eg==
X-Gm-Message-State: ANoB5pmjqvaXx4qfiy6oNeZl7eUcU7S6dnTKzjmqEkbo+ZpdwVhVfr8z
        Jo0lYwL2Z+G5hDatT43FkWH2/5lxdmnGLKNfdg7BSA==
X-Google-Smtp-Source: AA0mqf7MJTwMPn+Ju9tbd+DyePSJ1Y4vTecXR9yZJSyepSZkPpKL9mJV/3HkE/uIagS8vayMUzn7gzHywnJrbLEsZu0=
X-Received: by 2002:a17:906:3ac3:b0:7af:da0:aebe with SMTP id
 z3-20020a1709063ac300b007af0da0aebemr1647112ejd.723.1668435652356; Mon, 14
 Nov 2022 06:20:52 -0800 (PST)
MIME-Version: 1.0
References: <20221107204959.37691-1-jacopo@jmondi.org> <20221107204959.37691-2-jacopo@jmondi.org>
 <CAPY8ntDJVJftyxRsRg+cdbPfLpFXP4Mijy8F5ZOWLTtPqUt-LA@mail.gmail.com>
 <20221108120243.smg54xeqv5dmyect@uno.localdomain> <CAPY8ntCqHGTRFiGOP1BbYE7VDCGAvm9aQSWYZD7Ky2S8WGVdXQ@mail.gmail.com>
 <20221113130643.ibktofj6wqgoks4r@uno.localdomain>
In-Reply-To: <20221113130643.ibktofj6wqgoks4r@uno.localdomain>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 14 Nov 2022 14:20:36 +0000
Message-ID: <CAPY8ntBPosjaqnDXH7ZTPtRdXkLxkmTOtAwMCkD49w0WFH_LZw@mail.gmail.com>
Subject: Re: [PATCH 1/3] Documentation: media: camera-sensor: Correct frame interval
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
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

On Sun, 13 Nov 2022 at 13:06, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hi Dave
>
> On Thu, Nov 10, 2022 at 07:38:29AM +0000, Dave Stevenson wrote:
> > Hi Jacopo
> >
> > On Tue, 8 Nov 2022 at 12:02, Jacopo Mondi <jacopo@jmondi.org> wrote:
> > >
> > > Hi Dave
> > >    thanks for the reply
> > >
> > > On Tue, Nov 08, 2022 at 11:41:58AM +0000, Dave Stevenson wrote:
> > > > Hi Jacopo.
> > > >
> > > > On Mon, 7 Nov 2022 at 20:50, Jacopo Mondi <jacopo@jmondi.org> wrote:
> > > > >
> > > > > The formula to compute the frame interval uses the analogue crop
> > > > > rectangle dimensions to compute the total frame size in conjunction with
> > > > > blankings.
> > > > >
> > > > > Horizontal and vertical blankings are realized by extending the time
> > > > > interval during which no valid pixels are sent on the bus between
> > > > > visible lines and between consecutive frames, whose size is smaller than
> > > > > the analogue crop rectangle if any additional cropping or pixel
> > > > > subsampling is applied on the sensor processing pipeline.
> > > > >
> > > > > Correct the documentation to use the visible line length and frame
> > > > > height instead of the analogue crop dimensions.
> > > >
> > > > I'll defer to Sakari on this, but I think the original text is correct.
> > > >
> > > > Consider something like CCS where you have a separate array with
> > > > analogue crop, and then binning and scaling steps. AIUI the pixel rate
> > > > and [HV]BLANK will be defined for the array, not on the binned and
> > > > scaled values which finally give the visible frame. See [1].
> > > >
> > > > For the majority of sensors where analogue cropping, binning, and
> > > > scaling are not broken out separately, then it may well have been
> > > > incorrectly implemented as they do often look at the output
> > > > width/height. Should they be using the w/h values returned by
> > > > V4L2_SEL_TGT_CROP on V4L2_SUBDEV_FORMAT_ACTIVE for the sensor modes
> > > > instead? Quite probably, but that also makes the userspace more
> > > > complex (and probably needs fixing).
> > >
> > > More or less this was my reasoning, please see the cover letter.
> >
> >  A thought came to me on this one.
> > If defined as the output width/height of the subdev implementing the
> > blanking controls, then both CCS and the majority are correct as they
> > are.
>
> I presume so as well..
>
> >
> > Doing so also avoids a load of mess in drivers where H & V binning
> > each double the pixel rate if VBLANK/HBLANK are with regard the
> > analogue cropped area, which results in more controls to update in the
> > driver, and more to reread in userspace.
> >
>
> So do you think I should continue using the "analogue crop rectangle"
> in the documentation as the reference for blankings calculations even
> if most drivers do not actually use it ? IOW drop the first patch and
> use a more generic

I was thinking along the lines of:

frame interval = (subdevice output width + horizontal blanking) *
 (subdevice output height + vertical blanking) / pixel rate

Just checking and CCS appears to have 3 subdevices:
pixel_array -> binner -> scaler -> (OUTPUT).
V4L2_CID_VBLANK exists on the pixel array, and therefore defining it
as the width/height on the output of that subdev is the same as
specifying "analogue crop rectangle".

> "The new maximum limit for the controls should be re-calculated using the
> newly applied s/visibile width and heigh/dimensions/"
>
> in 2/3 ?

IMHO Patch 2/3 doesn't need to specify the basis on which the range
should be recomputed - there may be sensors that don't follow the
common pattern.
You ought to say that the minimum value can change as well, eg if you
change binning settings whilst changing mode then often the required
minimum (H or V) is altered.

  Dave

> Thanks for the review ;)
>
> > Cheers.
> >   Dave
> >
> > > >
> > > >   Dave
> > > >
> > > > [1] https://github.com/torvalds/linux/blob/master/drivers/media/i2c/ccs/ccs-core.c#L734
> > > >
> > > > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > > > ---
> > > > >  Documentation/driver-api/media/camera-sensor.rst | 7 +++----
> > > > >  1 file changed, 3 insertions(+), 4 deletions(-)
> > > > >
> > > > > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> > > > > index c7d4891bd24e..bb7d62db4cd1 100644
> > > > > --- a/Documentation/driver-api/media/camera-sensor.rst
> > > > > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > > > > @@ -87,12 +87,11 @@ less all modern raw camera sensors.
> > > > >
> > > > >  The frame interval is calculated using the following equation::
> > > > >
> > > > > -       frame interval = (analogue crop width + horizontal blanking) *
> > > > > -                        (analogue crop height + vertical blanking) / pixel rate
> > > > > +       frame interval = (visible width + horizontal blanking) *
> > > > > +                        (visibile height + vertical blanking) / pixel rate
> > > > >
> > > > >  The formula is bus independent and is applicable for raw timing parameters on
> > > > > -large variety of devices beyond camera sensors. Devices that have no analogue
> > > > > -crop, use the full source image size, i.e. pixel array size.
> > > > > +large variety of devices beyond camera sensors.
> > > > >
> > > > >  Horizontal and vertical blanking are specified by ``V4L2_CID_HBLANK`` and
> > > > >  ``V4L2_CID_VBLANK``, respectively. The unit of the ``V4L2_CID_HBLANK`` control
> > > > > --
> > > > > 2.38.1
> > > > >
