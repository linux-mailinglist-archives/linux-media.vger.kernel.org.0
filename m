Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB6117399C
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2020 15:17:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726838AbgB1ORF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Feb 2020 09:17:05 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40896 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726527AbgB1ORF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Feb 2020 09:17:05 -0500
Received: by mail-wm1-f67.google.com with SMTP id d138so1753282wmd.5
        for <linux-media@vger.kernel.org>; Fri, 28 Feb 2020 06:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8QBm7R3xlxAhuSE+0uXBIZCibfmQ8WAvm9KSgI2y8Bg=;
        b=MgTFEFGYRxO35Y/TnfH8vIhaghe+pJo9d8ygiKI2Gq1cWTmgnwgCN4mq3VY7oFRDJo
         ifeXfd6kg8sCy2IOYl7JuGKJyXJQuI5X44eGzJnfFbMfBwHNbo9Nvghd4dAXYDVIL9cZ
         JgbopiJIykDDSWmXeed0OZlhPvWLZT6Ohp/Ki6l5pzzIajkRgsVba4Sqav4ArGi0TLUE
         ec+dGKDjqKXukIJS0MSxJ/0CByOnX6YeCcVEH8RgwC5wEYrXHJBslASnpf8YsyjfsyjZ
         oXqmLZhMwFyGsUj2ObNoX+GbLrsdo9gb6mzqqtP1Dw9v61Q+Z37mn6lOg7fcXwN0bykf
         7lYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8QBm7R3xlxAhuSE+0uXBIZCibfmQ8WAvm9KSgI2y8Bg=;
        b=ZTzv4fXaXkQBQrXYwi1vtvna+TU8LkEfkm8eJYexrvbSp2bjOQcrBbfrbXcYJin2/w
         +znlJTNSUCrq1RJdI+5t8yCYDdu7wHjSlPjlNDlI4uS6iBXkjqulLt745jLYfNqH71WJ
         evSg3QjVNb9dI2KXIPLgFY7+ptVBb4hEbbIUhXHOSChUECKSbayNL3c56ER9CKaFBtrG
         KEm6Q7KBCec0fbEHSTSrSfUFpJYLyNX8wo4EnQGY13ZJIBb8d+Dm5E6WiAgEpMddMZzo
         krLBmmLMzNMdRwqNUGTHT6j6PzwsOqNrz/1hohjByFVmt2BbCw2jeRpevuH91IEIn4wS
         TkHA==
X-Gm-Message-State: APjAAAWfHRJTHD8DGEasfmP5OHyFe8SVACxRsho3+s6ulDk+Kh+oCUeo
        Ij6LvhFcXDx3oiGhxMkZBEZ5R57gGUwum9Euociw9w==
X-Google-Smtp-Source: APXvYqxkHCB48+pxrOHcVJDSE17+Ga5BNvqMpU2fc84KSi05R7xzvp9lc8Qsjf1VrpUlF9tG4tBm1doUOShD6w0xhUU=
X-Received: by 2002:a05:600c:2c48:: with SMTP id r8mr4810726wmg.183.1582899423068;
 Fri, 28 Feb 2020 06:17:03 -0800 (PST)
MIME-Version: 1.0
References: <20200227151752.21985-1-eugen.hristev@microchip.com>
 <CAPY8ntB17QjCSyefwTrMhudwkiFYT_5x3i1=KjzFv+p6tbrQEA@mail.gmail.com> <c6c1082d-3f40-c709-39cf-d1547f0c0308@microchip.com>
In-Reply-To: <c6c1082d-3f40-c709-39cf-d1547f0c0308@microchip.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 28 Feb 2020 14:16:45 +0000
Message-ID: <CAPY8ntDrsEJboMr2=Phce=mT6DJpivhE--L00qd4uecF81AXkg@mail.gmail.com>
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

On Fri, 28 Feb 2020 at 14:05, <Eugen.Hristev@microchip.com> wrote:
>
> On 28.02.2020 15:44, Dave Stevenson wrote:
> > Hi Eugen.
> >
> > On Thu, 27 Feb 2020 at 15:19, Eugen Hristev <eugen.hristev@microchip.com> wrote:
> >>
> >> Add support for enum frame intervals IOCTL.
> >> The current supported framerates are only available as comments inside
> >> the code.
> >> Add support for VIDIOC_ENUM_FRAMEINTERVALS as the enum_frame_interval
> >> callback as pad ops.
> >>
> >>   # v4l2-ctl --list-frameintervals width=1920,height=1080,pixelformat=RG10
> >>   ioctl: VIDIOC_ENUM_FRAMEINTERVALS
> >>          Interval: Discrete 0.067s (15.000 fps)
> >>          Interval: Discrete 0.033s (30.000 fps)
> >>          Interval: Discrete 0.033s (30.000 fps)
> >
> > But the frame rates are not discrete. You have frame rate control via
> > V4L2_CID_VBLANK, which can be used in conjunction with V4L2_CID_HBLANK
> > and V4L2_CID_PIXEL_RATE to determine actual frame period.
> >
> > See https://linuxtv.org/downloads/v4l-dvb-apis-new/uapi/v4l/ext-ctrls-image-source.html?highlight=v4l2_cid_vblank
> > I believe this is the preferred route to doing frame rate control on
> > image sensors. I assume someone will correct me if I'm wrong on that.
>
>
> Okay... , I was guided towards this by the comments in the code, saying
> that the three supported modes are at a constant frame per second...
>
> Those comments are wrong then ?

Yes, the comments for each of the modes (eg "/* 8MPix 15fps mode */")
probably shouldn't have the frame rate in them. I don't see any other
references. Those frame rates are the defaults only, as set via eg
IMX219_VTS_15FPS.

I originally wrote the driver without frame rate control, and the
comments obviously didn't get updated when VTS/HTS support was added
:-/

> Thanks for replying,
>
> Eugen
>
> >
> >    Dave
> >
> >> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> >> ---
> >>
> >> Hello,
> >>
> >> This is on top of Sakari's tree in linuxtv.org
> >>
> >> Thanks
> >> Eugen
> >>
> >>   drivers/media/i2c/imx219.c | 27 +++++++++++++++++++++++++++
> >>   1 file changed, 27 insertions(+)
> >>
> >> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> >> index f1effb5a5f66..17fcedd4edb6 100644
> >> --- a/drivers/media/i2c/imx219.c
> >> +++ b/drivers/media/i2c/imx219.c
> >> @@ -127,6 +127,8 @@ struct imx219_mode {
> >>          unsigned int width;
> >>          /* Frame height */
> >>          unsigned int height;
> >> +       /* Frame rate */
> >> +       u8 fps;
> >>
> >>          /* V-timing */
> >>          unsigned int vts_def;
> >> @@ -381,6 +383,7 @@ static const struct imx219_mode supported_modes[] = {
> >>                  /* 8MPix 15fps mode */
> >>                  .width = 3280,
> >>                  .height = 2464,
> >> +               .fps = 15,
> >>                  .vts_def = IMX219_VTS_15FPS,
> >>                  .reg_list = {
> >>                          .num_of_regs = ARRAY_SIZE(mode_3280x2464_regs),
> >> @@ -391,6 +394,7 @@ static const struct imx219_mode supported_modes[] = {
> >>                  /* 1080P 30fps cropped */
> >>                  .width = 1920,
> >>                  .height = 1080,
> >> +               .fps = 30,
> >>                  .vts_def = IMX219_VTS_30FPS_1080P,
> >>                  .reg_list = {
> >>                          .num_of_regs = ARRAY_SIZE(mode_1920_1080_regs),
> >> @@ -401,6 +405,7 @@ static const struct imx219_mode supported_modes[] = {
> >>                  /* 2x2 binned 30fps mode */
> >>                  .width = 1640,
> >>                  .height = 1232,
> >> +               .fps = 30,
> >>                  .vts_def = IMX219_VTS_30FPS_BINNED,
> >>                  .reg_list = {
> >>                          .num_of_regs = ARRAY_SIZE(mode_1640_1232_regs),
> >> @@ -680,6 +685,27 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
> >>          return 0;
> >>   }
> >>
> >> +static int imx219_enum_frame_interval(struct v4l2_subdev *sd,
> >> +                                     struct v4l2_subdev_pad_config *cfg,
> >> +                                     struct v4l2_subdev_frame_interval_enum *fie)
> >> +{
> >> +       struct imx219 *imx219 = to_imx219(sd);
> >> +
> >> +       if (fie->index >= ARRAY_SIZE(supported_modes))
> >> +               return -EINVAL;
> >> +
> >> +       if (fie->code != imx219_get_format_code(imx219))
> >> +               return -EINVAL;
> >> +
> >> +       if (fie->pad)
> >> +               return -EINVAL;
> >> +
> >> +       fie->interval.numerator = 1;
> >> +       fie->interval.denominator = supported_modes[fie->index].fps;
> >> +
> >> +       return 0;
> >> +}
> >> +
> >>   static void imx219_reset_colorspace(struct v4l2_mbus_framefmt *fmt)
> >>   {
> >>          fmt->colorspace = V4L2_COLORSPACE_SRGB;
> >> @@ -1004,6 +1030,7 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
> >>          .get_fmt = imx219_get_pad_format,
> >>          .set_fmt = imx219_set_pad_format,
> >>          .enum_frame_size = imx219_enum_frame_size,
> >> +       .enum_frame_interval = imx219_enum_frame_interval,
> >>   };
> >>
> >>   static const struct v4l2_subdev_ops imx219_subdev_ops = {
> >> --
> >> 2.20.1
> >>
>
