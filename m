Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 330FF173A6B
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2020 15:56:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbgB1Ozp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Feb 2020 09:55:45 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35702 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726682AbgB1Ozo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Feb 2020 09:55:44 -0500
Received: by mail-wr1-f66.google.com with SMTP id r7so3304087wro.2
        for <linux-media@vger.kernel.org>; Fri, 28 Feb 2020 06:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xGS5E2ij2aXZmAzDZgbLote3FIscLuyNLJZj/fAHfoY=;
        b=B62jc43uVwB+e901ispu1vxFEQ7Wp1qg7mVXscpz1axaQGsSYsbePkXeBjW+oxF8GH
         9kcxgVsM3USCw66QCdbhF6eKsrZVQpmWmXV7woHotQm4cHAFZdEsbyW00STfy8dj672h
         n7MirNd559c3v6aCr0yazVzMv49m9N5Oyc71VPKvIT24PQow/vZ29KULyQZKfrd4YDtj
         fPNl+/jspNdD3tzDigKNl0QF94yeaPcrr1M5zqmM7somJGwxEMXZ/3pl+BTX5Q+oJZwp
         qRW8+S6e9lft+CvnDvCceg5HR7evBrBnNL5WAhSa7z6O3hPUfx/p12VODfPNXysADgo+
         UNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xGS5E2ij2aXZmAzDZgbLote3FIscLuyNLJZj/fAHfoY=;
        b=Zse0tiWtHA34zLVhjoE9L2OU65ykcQHO9IeCZTbQm15ZgeOny/sgfAvbey2FxPenYp
         bWvpxNQZdemt9+iG7/PeDbNbtDC37TGi7UnW7XPMJpbqGG1lRDqePe4nSwXf4wYHuO36
         NrEw3bJf5SBosNhiNazYufJc8jL9MhjMw8MM4o53u2BMSDOZK9hLahRdIE3G8mhj6Hd/
         ltENMzTouSCNByiah0ASledUCNh8H8dlUFlSwoO0H18kByPNYZlRPLuw9it6c0YOJgAA
         WdYhrZdOTsaHQO+RwIDrkNrGXUHE+xLROR+mWfmY2UQ21SQP/wFgQgzhbhBbBb6WoJEs
         e1fQ==
X-Gm-Message-State: APjAAAVsdEwxzgrBZ9f/+WcoCFPhRF1OvSJy+2AFPRYtLxdgUYGnNmbm
        7fUxsbFdRrTeb03X4OYKTh0oRzXQoet4vFFsSo9K9A==
X-Google-Smtp-Source: APXvYqzgmFzHYyLRQoXsMIusyYo0s0nDR+ALWz0qQnJfNjhpYVKzH75PuAjjImnefSFuWpO2ab0zHaKimik2QW5Wbls=
X-Received: by 2002:adf:e542:: with SMTP id z2mr5471702wrm.150.1582901742631;
 Fri, 28 Feb 2020 06:55:42 -0800 (PST)
MIME-Version: 1.0
References: <20200227151752.21985-1-eugen.hristev@microchip.com>
 <CAPY8ntB17QjCSyefwTrMhudwkiFYT_5x3i1=KjzFv+p6tbrQEA@mail.gmail.com>
 <c6c1082d-3f40-c709-39cf-d1547f0c0308@microchip.com> <CAPY8ntDrsEJboMr2=Phce=mT6DJpivhE--L00qd4uecF81AXkg@mail.gmail.com>
 <4d89fcc2-07bb-f83d-94e2-d0c3c1520471@microchip.com>
In-Reply-To: <4d89fcc2-07bb-f83d-94e2-d0c3c1520471@microchip.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 28 Feb 2020 14:55:25 +0000
Message-ID: <CAPY8ntDmQuzqWfkq_4+Jvc8BFzQh+XnVMt0ZyNBbzmk4GEPnfg@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx219: add support for enum frame interval
To:     Eugen.Hristev@microchip.com
Cc:     Andrey Konovalov <andrey.konovalov@linaro.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 28 Feb 2020 at 14:34, <Eugen.Hristev@microchip.com> wrote:
>
> On 28.02.2020 16:16, Dave Stevenson wrote:
> > On Fri, 28 Feb 2020 at 14:05, <Eugen.Hristev@microchip.com> wrote:
> >>
> >> On 28.02.2020 15:44, Dave Stevenson wrote:
> >>> Hi Eugen.
> >>>
> >>> On Thu, 27 Feb 2020 at 15:19, Eugen Hristev <eugen.hristev@microchip.com> wrote:
> >>>>
> >>>> Add support for enum frame intervals IOCTL.
> >>>> The current supported framerates are only available as comments inside
> >>>> the code.
> >>>> Add support for VIDIOC_ENUM_FRAMEINTERVALS as the enum_frame_interval
> >>>> callback as pad ops.
> >>>>
> >>>>    # v4l2-ctl --list-frameintervals width=1920,height=1080,pixelformat=RG10
> >>>>    ioctl: VIDIOC_ENUM_FRAMEINTERVALS
> >>>>           Interval: Discrete 0.067s (15.000 fps)
> >>>>           Interval: Discrete 0.033s (30.000 fps)
> >>>>           Interval: Discrete 0.033s (30.000 fps)
> >>>
> >>> But the frame rates are not discrete. You have frame rate control via
> >>> V4L2_CID_VBLANK, which can be used in conjunction with V4L2_CID_HBLANK
> >>> and V4L2_CID_PIXEL_RATE to determine actual frame period.
> >>>
> >>> See https://linuxtv.org/downloads/v4l-dvb-apis-new/uapi/v4l/ext-ctrls-image-source.html?highlight=v4l2_cid_vblank
> >>> I believe this is the preferred route to doing frame rate control on
> >>> image sensors. I assume someone will correct me if I'm wrong on that.
> >>
> >>
> >> Okay... , I was guided towards this by the comments in the code, saying
> >> that the three supported modes are at a constant frame per second...
> >>
> >> Those comments are wrong then ?
> >
> > Yes, the comments for each of the modes (eg "/* 8MPix 15fps mode */")
> > probably shouldn't have the frame rate in them. I don't see any other
> > references. Those frame rates are the defaults only, as set via eg
> > IMX219_VTS_15FPS.
> >
> > I originally wrote the driver without frame rate control, and the
> > comments obviously didn't get updated when VTS/HTS support was added
> > :-/
>
> So in my understanding, actually, to get actual frame rate, we should
> use another control, and the enum frame intervals is actually impossible
> to use, since the sensor supports a multitude of frame rates, and it
> would be egregious to enumerate them all.
>
> Is this the case ?
>
> My idea was that v4l2-ctl --list-formats-ext will not show anything
> related to frame rate. So using this command, will only get the
> resolution, but don't know what to expect in terms of frame rate.
> Wouldn't be useful to implement this 'default' frame rate in this IOCTL ?

I'll defer to Sakari or others on the original reasoning behind it. I
was basing imx219 on other recently merged Bayer sensor drivers.

Having individual control of HTS and VTS allows slightly finer control
of exactly how the sensor frames. It also matches with exposure time
being set in lines, therefore you need to know the time per horizontal
line to convert from units of time.
If the driver were implementing ENUM_FRAME_INTERVALS / [S|G]_PARM then
you'd still need to support HTS/VTS for exposure, so why duplicate
settings?

> Thanks for explanations
> >
> >> Thanks for replying,
> >>
> >> Eugen
> >>
> >>>
> >>>     Dave
> >>>
> >>>> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> >>>> ---
> >>>>
> >>>> Hello,
> >>>>
> >>>> This is on top of Sakari's tree in linuxtv.org
> >>>>
> >>>> Thanks
> >>>> Eugen
> >>>>
> >>>>    drivers/media/i2c/imx219.c | 27 +++++++++++++++++++++++++++
> >>>>    1 file changed, 27 insertions(+)
> >>>>
> >>>> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> >>>> index f1effb5a5f66..17fcedd4edb6 100644
> >>>> --- a/drivers/media/i2c/imx219.c
> >>>> +++ b/drivers/media/i2c/imx219.c
> >>>> @@ -127,6 +127,8 @@ struct imx219_mode {
> >>>>           unsigned int width;
> >>>>           /* Frame height */
> >>>>           unsigned int height;
> >>>> +       /* Frame rate */
> >>>> +       u8 fps;
> >>>>
> >>>>           /* V-timing */
> >>>>           unsigned int vts_def;
> >>>> @@ -381,6 +383,7 @@ static const struct imx219_mode supported_modes[] = {
> >>>>                   /* 8MPix 15fps mode */
> >>>>                   .width = 3280,
> >>>>                   .height = 2464,
> >>>> +               .fps = 15,
> >>>>                   .vts_def = IMX219_VTS_15FPS,
> >>>>                   .reg_list = {
> >>>>                           .num_of_regs = ARRAY_SIZE(mode_3280x2464_regs),
> >>>> @@ -391,6 +394,7 @@ static const struct imx219_mode supported_modes[] = {
> >>>>                   /* 1080P 30fps cropped */
> >>>>                   .width = 1920,
> >>>>                   .height = 1080,
> >>>> +               .fps = 30,
> >>>>                   .vts_def = IMX219_VTS_30FPS_1080P,
> >>>>                   .reg_list = {
> >>>>                           .num_of_regs = ARRAY_SIZE(mode_1920_1080_regs),
> >>>> @@ -401,6 +405,7 @@ static const struct imx219_mode supported_modes[] = {
> >>>>                   /* 2x2 binned 30fps mode */
> >>>>                   .width = 1640,
> >>>>                   .height = 1232,
> >>>> +               .fps = 30,
> >>>>                   .vts_def = IMX219_VTS_30FPS_BINNED,
> >>>>                   .reg_list = {
> >>>>                           .num_of_regs = ARRAY_SIZE(mode_1640_1232_regs),
> >>>> @@ -680,6 +685,27 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
> >>>>           return 0;
> >>>>    }
> >>>>
> >>>> +static int imx219_enum_frame_interval(struct v4l2_subdev *sd,
> >>>> +                                     struct v4l2_subdev_pad_config *cfg,
> >>>> +                                     struct v4l2_subdev_frame_interval_enum *fie)
> >>>> +{
> >>>> +       struct imx219 *imx219 = to_imx219(sd);
> >>>> +
> >>>> +       if (fie->index >= ARRAY_SIZE(supported_modes))
> >>>> +               return -EINVAL;
> >>>> +
> >>>> +       if (fie->code != imx219_get_format_code(imx219))
> >>>> +               return -EINVAL;
> >>>> +
> >>>> +       if (fie->pad)
> >>>> +               return -EINVAL;
> >>>> +
> >>>> +       fie->interval.numerator = 1;
> >>>> +       fie->interval.denominator = supported_modes[fie->index].fps;
> >>>> +
> >>>> +       return 0;
> >>>> +}
> >>>> +
> >>>>    static void imx219_reset_colorspace(struct v4l2_mbus_framefmt *fmt)
> >>>>    {
> >>>>           fmt->colorspace = V4L2_COLORSPACE_SRGB;
> >>>> @@ -1004,6 +1030,7 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
> >>>>           .get_fmt = imx219_get_pad_format,
> >>>>           .set_fmt = imx219_set_pad_format,
> >>>>           .enum_frame_size = imx219_enum_frame_size,
> >>>> +       .enum_frame_interval = imx219_enum_frame_interval,
> >>>>    };
> >>>>
> >>>>    static const struct v4l2_subdev_ops imx219_subdev_ops = {
> >>>> --
> >>>> 2.20.1
> >>>>
> >>
>
