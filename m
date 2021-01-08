Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B723C2EF44C
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 15:58:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbhAHO5a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 09:57:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbhAHO53 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 09:57:29 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD2BDC061381
        for <linux-media@vger.kernel.org>; Fri,  8 Jan 2021 06:56:49 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id c12so6379687pfo.10
        for <linux-media@vger.kernel.org>; Fri, 08 Jan 2021 06:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lOruavMXBM9YJW3Cl1WVKcPlZc3Ntq5ehBLz53stx7k=;
        b=sN3EC0fnlmeQYHrUGbd+C1XCut7xCRyBiyh5dpwBEjPgDSUfhbNe7OaAa6bOpL/vfu
         fyV6qX5Ddkv+Ea5+yY7JfNI6oaNZdGn176t5w3pnw2d7/HpvgWrxoe4bZlLGWhy9hrbt
         rg0Yvw/GOQOnN1kieNlQ4y68ZpsGVPb2y12NLHpNahrJ5cQKIYkjZewNLwTgfUs7uf3u
         Rgj6lnm9K2vbMqOJTZpwJc0MX3+3mxQG3P07CfwJecPD5daI9plTAfcSslvnWBDQgafZ
         SDQuxHm+87UqvhgiowQIGvtGNj+WaPZ+x1uwaKbkNOg9tzJb8+W6vwmOpP7kSq1kG9u1
         XlOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lOruavMXBM9YJW3Cl1WVKcPlZc3Ntq5ehBLz53stx7k=;
        b=WbI+rjO8I2AsYG5E55/PIw6vNUBshNW8ZwCCb833sKfyEpJW9AzEFVz+iCkYgzhe5c
         FU0Cvkbookz9a8A1VyhsxUSdcKjuXqKnQfqsL1n90VanbNzPwd52Xdls/4OO9FQEKlFQ
         yJLCDnCqkM2TE+NQwrBINlizWzHsjBuSnSQmjdfKmRH58EcHXeOZn0F5vqo/7ewVhQyS
         MYp1t5z4Ohr9WQK8/QfGBmrr1reHqn+SRfh6/B0LZtPCYKyCQh6euU7pffbGn0ereX6p
         zjyDS0CjHYMiEa4qdJmTSE/6vFLi2DhLjP2BPCpn16GRrCNSn8KHaVR5lmVDRwqC5dEG
         Mt0g==
X-Gm-Message-State: AOAM532x/65sJshQEyNq8VrowYKko+ZzlI4ndGdjqsVrZxMUxdZbmCD1
        KInmqn4NmnMz/w+BLvJJQR2P7xjvW7w/25beud2WFA==
X-Google-Smtp-Source: ABdhPJyS6cH4Si8XAHzGskxyWqkaWtORgC+HwhVYx7EvpHEmVecv6nu7SvyhnX2T3fw7GLHQwHFsBIGQzp5psAC18Zw=
X-Received: by 2002:a63:e049:: with SMTP id n9mr7376704pgj.339.1610117809336;
 Fri, 08 Jan 2021 06:56:49 -0800 (PST)
MIME-Version: 1.0
References: <20210107142123.639477-1-robert.foss@linaro.org>
 <CAAFQd5BVSNGDV7ZkiVpZwbfTfRLJmNvopMQFnQno+CDs+bo3Gg@mail.gmail.com>
 <6ec75d88-0cd5-79cc-6413-81f169b5e976@linaro.org> <ce4ce8ea-853b-1b15-4c1f-2490c252c2ad@linaro.org>
In-Reply-To: <ce4ce8ea-853b-1b15-4c1f-2490c252c2ad@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Fri, 8 Jan 2021 15:56:38 +0100
Message-ID: <CAG3jFyv=yv=da9d6vzqYC944FkHFrmLYBUUKFPFKsOuh8pij2w@mail.gmail.com>
Subject: Re: [PATCH v2] media: ov8856: Fix Bayer format dependance on mode
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Tomasz Figa <tfiga@google.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 8 Jan 2021 at 12:28, Andrey Konovalov
<andrey.konovalov@linaro.org> wrote:
>
> Hi Robert,
>
> On 08.01.2021 13:46, Andrey Konovalov wrote:
> > Hi Robert and Tomasz,
> >
> > On 08.01.2021 12:49, Tomasz Figa wrote:
> >> Hi Robert,
> >>
> >> On Thu, Jan 7, 2021 at 11:21 PM Robert Foss <robert.foss@linaro.org> wrote:
> >>>
> >>> The Bayer GRBG10 mode used for earlier modes 3280x2460 and
> >>> 1640x1232 isn't the mode output by the sensor for the
> >>> 3264x2448 and 1632x1224 modes.
> >>>
> >>> Switch from MEDIA_BUS_FMT_SGRBG10_1X10 to MEDIA_BUS_FMT_SBGGR10_1X10
> >>> for 3264x2448 & 1632x1224 modes.
> >>>
> >>> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> >>> ---
> >>>
> >>> Changes since v1:
> >>>   - Sakari: Added mode information to ov8856_mode struct
> >>>   - Sakari: enum_mbus_code updated
> >>>
> >>>   drivers/media/i2c/ov8856.c | 24 ++++++++++++++++++------
> >>>   1 file changed, 18 insertions(+), 6 deletions(-)
> >>>
> >>> diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
> >>> index 2f4ceaa80593..7cd83564585c 100644
> >>> --- a/drivers/media/i2c/ov8856.c
> >>> +++ b/drivers/media/i2c/ov8856.c
> >>> @@ -126,6 +126,9 @@ struct ov8856_mode {
> >>>
> >>>          /* Sensor register settings for this resolution */
> >>>          const struct ov8856_reg_list reg_list;
> >>> +
> >>> +       /* MEDIA_BUS_FMT for this mode */
> >>> +       u32 code;
> >>>   };
> >>>
> >>>   static const struct ov8856_reg mipi_data_rate_720mbps[] = {
> >>> @@ -942,6 +945,11 @@ static const char * const ov8856_test_pattern_menu[] = {
> >>>          "Bottom-Top Darker Color Bar"
> >>>   };
> >>>
> >>> +static const u32 ov8856_formats[] = {
> >>> +       MEDIA_BUS_FMT_SBGGR10_1X10,
> >>> +       MEDIA_BUS_FMT_SGRBG10_1X10,
> >>> +};
> >>> +
> >>>   static const s64 link_freq_menu_items[] = {
> >>>          OV8856_LINK_FREQ_360MHZ,
> >>>          OV8856_LINK_FREQ_180MHZ
> >>> @@ -974,6 +982,7 @@ static const struct ov8856_mode supported_modes[] = {
> >>>                          .regs = mode_3280x2464_regs,
> >>>                  },
> >>>                  .link_freq_index = OV8856_LINK_FREQ_720MBPS,
> >>> +               .code = MEDIA_BUS_FMT_SGRBG10_1X10,
> >>>          },
> >>>          {
> >>>                  .width = 3264,
> >>> @@ -986,6 +995,7 @@ static const struct ov8856_mode supported_modes[] = {
> >>>                          .regs = mode_3264x2448_regs,
> >>>                  },
> >>>                  .link_freq_index = OV8856_LINK_FREQ_720MBPS,
> >>> +               .code = MEDIA_BUS_FMT_SBGGR10_1X10,
> >>>          },
> >>>          {
> >>>                  .width = 1640,
> >>> @@ -998,6 +1008,7 @@ static const struct ov8856_mode supported_modes[] = {
> >>>                          .regs = mode_1640x1232_regs,
> >>>                  },
> >>>                  .link_freq_index = OV8856_LINK_FREQ_360MBPS,
> >>> +               .code = MEDIA_BUS_FMT_SGRBG10_1X10,
> >>>          },
> >>>          {
> >>>                  .width = 1632,
> >>> @@ -1010,6 +1021,7 @@ static const struct ov8856_mode supported_modes[] = {
> >>>                          .regs = mode_1632x1224_regs,
> >>>                  },
> >>>                  .link_freq_index = OV8856_LINK_FREQ_360MBPS,
> >>> +               .code = MEDIA_BUS_FMT_SBGGR10_1X10,
> >>>          }
> >>>   };
> >>>
> >>> @@ -1281,8 +1293,8 @@ static void ov8856_update_pad_format(const struct ov8856_mode *mode,
> >>>   {
> >>>          fmt->width = mode->width;
> >>>          fmt->height = mode->height;
> >>> -       fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> >>>          fmt->field = V4L2_FIELD_NONE;
> >>> +       fmt->code = mode->code;
> >>>   }
> >>>
> >>>   static int ov8856_start_streaming(struct ov8856 *ov8856)
> >>> @@ -1519,11 +1531,10 @@ static int ov8856_enum_mbus_code(struct v4l2_subdev *sd,
> >>>                                   struct v4l2_subdev_pad_config *cfg,
> >>>                                   struct v4l2_subdev_mbus_code_enum *code)
> >>>   {
> >>> -       /* Only one bayer order GRBG is supported */
> >>> -       if (code->index > 0)
> >>> +       if (code->index >= ARRAY_SIZE(ov8856_formats))
> >>>                  return -EINVAL;
> >>>
> >>> -       code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> >>> +       code->code = ov8856_formats[code->index];
> >>>
> >>>          return 0;
> >>>   }
> >>> @@ -1532,10 +1543,11 @@ static int ov8856_enum_frame_size(struct v4l2_subdev *sd,
> >>>                                    struct v4l2_subdev_pad_config *cfg,
> >>>                                    struct v4l2_subdev_frame_size_enum *fse)
> >>>   {
> >>> -       if (fse->index >= ARRAY_SIZE(supported_modes))
> >>> +       if ((fse->code != ov8856_formats[0]) &&
> >>> +           (fse->code != ov8856_formats[1]))
> >>
> >> Shouldn't this be validated against the current mode? I guess it's the
> >> question about which part of the state takes precedence - the mbus
> >> code or the frame size.
> >
> > The docs [1] say "enumerate all frame sizes supported by a sub-device on the given pad
> > for the given media bus format". It doesn't seem to mention the current mode. But the
> > frame sizes reported should be filtered by the mbus code, and this patch misses that
> > if I read it correct.
> >
> > But this situation when the mbus code depends on the mode (on the resolution in fact)...
> > Yes, if we read the pixels from a rectangle smaller than the active area, we can change
> > the bayer order by moving this "read-out" rectangle by one pixel along x, y, or both x
> > and y axes. But wouldn't it be better if we try to review the register setting for the
> > current modes so that the bayer order would be the same for all the modes?
>
> This untested change should make the 3264x2448 and 1632x1224 modes to use
> the GRBG bayer order (I would prefer BGGR as this is the "native" order of the pixel
> array, but GRBG appeared in the driver first):
>
> diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
> index d8cefd3d4045..b337f729d5e3 100644
> --- a/drivers/media/i2c/ov8856.c
> +++ b/drivers/media/i2c/ov8856.c
> @@ -428,7 +428,7 @@ static const struct ov8856_reg mode_3264x2448_regs[] = {
>          {0x3810, 0x00},
>          {0x3811, 0x04},
>          {0x3812, 0x00},
> -       {0x3813, 0x02},
> +       {0x3813, 0x01},
>          {0x3814, 0x01},
>          {0x3815, 0x01},
>          {0x3816, 0x00},
> @@ -821,7 +821,7 @@ static const struct ov8856_reg mode_1632x1224_regs[] = {
>          {0x3810, 0x00},
>          {0x3811, 0x02},
>          {0x3812, 0x00},
> -       {0x3813, 0x02},
> +       {0x3813, 0x01},
>          {0x3814, 0x03},
>          {0x3815, 0x01},
>          {0x3816, 0x00},
>
>

This seems like the most elegant solution possible, thanks for suggesting it.
I'll verify that it works as expected on the db845c.
