Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82C1868919D
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 09:09:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232645AbjBCII3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 03:08:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232123AbjBCIHu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 03:07:50 -0500
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0125A953D0
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 00:06:02 -0800 (PST)
Received: by mail-vs1-xe33.google.com with SMTP id k6so4576159vsk.1
        for <linux-media@vger.kernel.org>; Fri, 03 Feb 2023 00:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zy1Tkj2KlUAK2zkw2K13kCwH41d8aba2+4qlXOS5A34=;
        b=IIYbFaQNudKTUfx6s/xLUJlmoMRPhrIqCoFYx8XaTYE9xMmnZJELrbQPk/3FJqe2YT
         RMgneU5TGLyjcaegdfAzCsgzYsgP/neWQivLc8oiuEsXIMJiXkBW8GeaammfHf0dEJHD
         +rxppWTxPY64Z6+Obd8gFt8DYyKrXRFwfqXipPb8P11X44gQRaWjjqwrITQrXcfgz9wA
         uOefna46M5oFufFzVdWCkcB5a8mlUZt7OCojdYQCbrHPwdniWW01T5VIwnjbQUprF2gJ
         F4vnw9yxiWl22zGZMfWr+8BAU7mRB4wdveshVsj5q+rmMJ3Z8nYtEPKfRMPsnLLYp4PE
         bgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zy1Tkj2KlUAK2zkw2K13kCwH41d8aba2+4qlXOS5A34=;
        b=Jd/Co/NvKTe9jFjNSAYgsTK6uuv30R1tkXWXcGon6Pb4NACvJj9GSBQJARIUI4rez7
         IC9kI6JRwNgdKtzwFbWGOd4SGFBfQu5Jwin517jnJh0oiaa/Pe3/806ywJe+/gcbgbUL
         ljWObE7+TRYNxTeMAVKkYvUUA6tDekPkQR9iCdMe5hQM2TZbm7UYud3tZ1g8kpnaqzsK
         qUoj9lQ6QKgyGWT7Acm4cZir18x9hv6OPilRJOzGsfPGinwyYBdDZ0uIXEXp/Sqm29hv
         XoGtz5xdHc2ddHRcvlGxBs11893tKC7k12lt8E+U/Dg+uQbIXJdR5C2W9hr/skdp7Ipl
         N6Sw==
X-Gm-Message-State: AO0yUKUec5D8pVt1KPURJ+Sq6PO4XPXUaRMpc4tb3y76eSgh1zrq3c6e
        hbzPY2AZqbR4AQHSVUGViYB03TYvCHt7mBBaLC7PtK1PxrUq0UQM
X-Google-Smtp-Source: AK7set803sC+3lPb35JJbkjaAZH3KsLfab3OjAx1VXfkU98o5ZD3BG8NhoONRILl3fxpIgGmUFYeIWT7w9LTQ+OlceY=
X-Received: by 2002:a05:6102:3005:b0:3eb:2024:bda9 with SMTP id
 s5-20020a056102300500b003eb2024bda9mr1575505vsa.45.1675411561973; Fri, 03 Feb
 2023 00:06:01 -0800 (PST)
MIME-Version: 1.0
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
 <20230131192016.3476937-8-dave.stevenson@raspberrypi.com> <8218660.NyiUUSuA9g@steina-w>
In-Reply-To: <8218660.NyiUUSuA9g@steina-w>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 3 Feb 2023 08:05:44 +0000
Message-ID: <CAPY8ntD=L1Mj7yyBfuX0JtTeiL2pTiZ9nd0QCbCC6zDv96EDZg@mail.gmail.com>
Subject: Re: [PATCH 07/11] media: i2c: imx290: Convert V4L2_CID_HBLANK to read/write
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
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

Hi Alexander

On Fri, 3 Feb 2023 at 07:19, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi Dave,
>
> thanks for the patch.
>
> Am Dienstag, 31. Januar 2023, 20:20:12 CET schrieb Dave Stevenson:
> > The driver exposed V4L2_CID_HBLANK as a read only control to allow
> > for exposure calculations and determination of the frame rate.
> >
> > Convert to a read/write control so that the frame rate can be
> > controlled.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/imx290.c | 33 +++++++++++++++++++--------------
> >  1 file changed, 19 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index 9ddd6382b127..9006be6e5e7c 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -47,6 +47,7 @@
> >  #define IMX290_GAIN
> IMX290_REG_8BIT(0x3014)
> >  #define IMX290_VMAX
> IMX290_REG_24BIT(0x3018)
> >  #define IMX290_HMAX
> IMX290_REG_16BIT(0x301c)
> > +#define IMX290_HMAX_MAX                                      0xffff
> >  #define IMX290_SHS1
> IMX290_REG_24BIT(0x3020)
> >  #define IMX290_WINWV_OB
> IMX290_REG_8BIT(0x303a)
> >  #define IMX290_WINPV
> IMX290_REG_16BIT(0x303c)
> > @@ -167,7 +168,7 @@ struct imx290_regval {
> >  struct imx290_mode {
> >       u32 width;
> >       u32 height;
> > -     u32 hmax;
> > +     u32 hmax_min;
> >       u8 link_freq_index;
> >
> >       const struct imx290_regval *data;
> > @@ -410,7 +411,7 @@ static const struct imx290_mode imx290_modes_2lanes[] =
> > { {
> >               .width = 1920,
> >               .height = 1080,
> > -             .hmax = 2200,
> > +             .hmax_min = 2200,
> >               .link_freq_index = FREQ_INDEX_1080P,
> >               .data = imx290_1080p_settings,
> >               .data_size = ARRAY_SIZE(imx290_1080p_settings),
> > @@ -418,7 +419,7 @@ static const struct imx290_mode imx290_modes_2lanes[] =
> > { {
> >               .width = 1280,
> >               .height = 720,
> > -             .hmax = 3300,
> > +             .hmax_min = 3300,
> >               .link_freq_index = FREQ_INDEX_720P,
> >               .data = imx290_720p_settings,
> >               .data_size = ARRAY_SIZE(imx290_720p_settings),
> > @@ -429,7 +430,7 @@ static const struct imx290_mode imx290_modes_4lanes[] =
> > { {
> >               .width = 1920,
> >               .height = 1080,
> > -             .hmax = 2200,
> > +             .hmax_min = 2200,
> >               .link_freq_index = FREQ_INDEX_1080P,
> >               .data = imx290_1080p_settings,
> >               .data_size = ARRAY_SIZE(imx290_1080p_settings),
> > @@ -437,7 +438,7 @@ static const struct imx290_mode imx290_modes_4lanes[] =
> > { {
> >               .width = 1280,
> >               .height = 720,
> > -             .hmax = 3300,
> > +             .hmax_min = 3300,
> >               .link_freq_index = FREQ_INDEX_720P,
> >               .data = imx290_720p_settings,
> >               .data_size = ARRAY_SIZE(imx290_720p_settings),
> > @@ -686,6 +687,12 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
>
> You will need to remove V4L2_CID_HBLANK on the immediately return check at the
> beginning of the function. Otherwise this setting will never reach the device.

What tree are you adding these patches to? I'm basing it on Sakari's
tree at [1] - he's issued a pull for it, so that should be in 6.3.

The only immediate return check at the start of imx290_set_ctrl is
if (ctrl->flags & V4L2_CTRL_FLAG_READ_ONLY)
   return 0;

The controls are no longer READ_ONLY, therefore they don't return early.
There is no case for V4L2_CID_HBLANK.

Does this also account for the difference you're reporting with V4L2_CID_VBLANK?

 Dave

[1] https://git.linuxtv.org/sailus/media_tree.git/tree/drivers/media/i2c/imx290.c#n567

> Best regards
> Alexander
>
> >               }
> >               break;
> >
> > +     case V4L2_CID_HBLANK:
> > +             ret = imx290_write(imx290, IMX290_HMAX,
> > +                                ctrl->val + imx290->current_mode-
> >width,
> > +                                NULL);
> > +             break;
> > +
> >       default:
> >               ret = -EINVAL;
> >               break;
> > @@ -716,12 +723,14 @@ static void imx290_ctrl_update(struct imx290 *imx290,
> >                              const struct v4l2_mbus_framefmt *format,
> >                              const struct imx290_mode *mode)
> >  {
> > -     unsigned int hblank = mode->hmax - mode->width;
> > +     unsigned int hblank_min = mode->hmax_min - mode->width;
> > +     unsigned int hblank_max = IMX290_HMAX_MAX - mode->width;
> >       unsigned int vblank = IMX290_VMAX_DEFAULT - mode->height;
> >
> >       __v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
> >
> > -     __v4l2_ctrl_modify_range(imx290->hblank, hblank, hblank, 1, hblank);
> > +     __v4l2_ctrl_modify_range(imx290->hblank, hblank_min, hblank_max, 1,
> > +                              hblank_min);
> >       __v4l2_ctrl_modify_range(imx290->vblank, vblank, vblank, 1, vblank);
> >  }
> >
> > @@ -778,10 +787,11 @@ static int imx290_ctrl_init(struct imx290 *imx290)
> >
> ARRAY_SIZE(imx290_test_pattern_menu) - 1,
> >                                    0, 0, imx290_test_pattern_menu);
> >
> > +     /*
> > +      * Actual range will be set from imx290_ctrl_update later in the
> probe.
> > +      */
> >       imx290->hblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> >                                          V4L2_CID_HBLANK, 1, 1, 1,
> 1);
> > -     if (imx290->hblank)
> > -             imx290->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> >
> >       imx290->vblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> >                                          V4L2_CID_VBLANK, 1, 1, 1,
> 1);
> > @@ -850,11 +860,6 @@ static int imx290_start_streaming(struct imx290
> > *imx290, return ret;
> >       }
> >
> > -     ret = imx290_write(imx290, IMX290_HMAX, imx290->current_mode->hmax,
> > -                        NULL);
> > -     if (ret)
> > -             return ret;
> > -
> >       /* Apply customized values from user */
> >       ret = __v4l2_ctrl_handler_setup(imx290->sd.ctrl_handler);
> >       if (ret) {
>
>
>
>
