Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (unknown [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E09BF5F654F
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 13:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbiJFLj5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 07:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbiJFLjz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 07:39:55 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC58111456
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 04:39:53 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id z3so1410028edc.10
        for <linux-media@vger.kernel.org>; Thu, 06 Oct 2022 04:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ry5yy/U5zRLrvSMPhfjEs+IsEqReF9PE4xYV0Xpet5U=;
        b=cR53HOtHYJA4pEiIlREtylUfum0N6e9gr2/EvV1EbUTXDH10KVf8+Xgabwy8ZDVZ20
         Lfw8nViRx/eD8Bk0/F/hPkNqui8xiCouZ4uM52IWzZDIlB+SG4AXbi3iQ99nWfMi2/uL
         rc/lwnOnlyecRL1cRgaRun/nTzkVVAEJzgLP3bo2p2g7eM1dsCYbexXZ4bPooH0M+CIy
         IRHnkFa20LQAPGMnrshf4WyOtc7XYRIX/l6VWonZ7ZnpL65FvFZeHxmfrQrZml5sa1qn
         sU6jepmHlqCHYeOLQYH8E0fhPzzlX/Ozc5lyknXkMq7qM8AGhlJLWJYjHNDAzxXPpbAh
         LSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ry5yy/U5zRLrvSMPhfjEs+IsEqReF9PE4xYV0Xpet5U=;
        b=5e6bhF56SlWMufPBJQyAHGdCKuTYkaWDGLlvWvhYoTftYJsi2n8QNZ5AltR+7W4lBp
         yCEXCJxrJ/MtnhjAE9JpPES6WHytZXUuAI//E2WeYzPmsUZJGFLA4BPT9MK7CpXSy/L/
         QO+W7ycXoTSnNEOjrLZhKth5Tjn0zYC5RBABopwR6kayg4YZc/DUAUMX5aEGSgOhhZ7j
         7gGa5MyCtpfWLww1m7QU4cDs6SYbPOcMu5H1dS7Iys7fxSeFTbww5HDdy17KwDz3DcOl
         p7BbfDlPqFlG+CxkNVYIF9M6Y5Dc2JNnpPUukLt1FF+AI0r+OvHawoqACk3tp0thtR1K
         +S0Q==
X-Gm-Message-State: ACrzQf3ZA6FBbZQplmEDqZ518CCr8YKMzDrpj7ePCLqf7dVLZ5VGM3qj
        Uau8oXiDAzgDVKNg/UHZ9gKMWT7Ix6Oi6BiyGfUSJv2mFUQQMQ==
X-Google-Smtp-Source: AMsMyM4MdFF55CsGlkzc4RLzxW6ja1XSKZySQxyDK8gEfrwIjLXLQLQVFTctxFa7imEbnGtlsyNdTJVTQEKTlcp0dKs=
X-Received: by 2002:a05:6402:c4d:b0:457:99ec:1837 with SMTP id
 cs13-20020a0564020c4d00b0045799ec1837mr4213411edb.86.1665056392290; Thu, 06
 Oct 2022 04:39:52 -0700 (PDT)
MIME-Version: 1.0
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
 <20221005152809.3785786-14-dave.stevenson@raspberrypi.com> <20221006094341.hz3lvo5vqrf3voas@uno.localdomain>
In-Reply-To: <20221006094341.hz3lvo5vqrf3voas@uno.localdomain>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 6 Oct 2022 12:39:35 +0100
Message-ID: <CAPY8ntAY=361=jYCn-pvBJpzWOypg4HejL1yZuC6kDO9QfzGow@mail.gmail.com>
Subject: Re: [PATCH 13/16] media: i2c: ov9282: Add selection API calls for
 cropping info
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

Thanks for the review.

On Thu, 6 Oct 2022 at 10:43, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hi Dave
>
> On Wed, Oct 05, 2022 at 04:28:06PM +0100, Dave Stevenson wrote:
> > As required by libcamera, add the relevant cropping targets
> > to report which portion of the sensor is being read out in
> > any mode.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/ov9282.c | 75 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 75 insertions(+)
> >
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index 8e86aa7e4b2a..d892f53fb1ea 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -67,6 +67,17 @@
> >  #define OV9282_PIXEL_RATE    (OV9282_LINK_FREQ * 2 * \
> >                                OV9282_NUM_DATA_LANES / 10)
> >
> > +/*
> > + * OV9282 native and active pixel array size.
> > + * 8 dummy rows/columns on each edge of a 1280x800 active array
> > + */
> > +#define OV9282_NATIVE_WIDTH          1296U
> > +#define OV9282_NATIVE_HEIGHT         816U
> > +#define OV9282_PIXEL_ARRAY_LEFT              8U
> > +#define OV9282_PIXEL_ARRAY_TOP               8U
> > +#define OV9282_PIXEL_ARRAY_WIDTH     1280U
> > +#define OV9282_PIXEL_ARRAY_HEIGHT    800U
> > +
> >  #define OV9282_REG_MIN               0x00
> >  #define OV9282_REG_MAX               0xfffff
> >
> > @@ -118,6 +129,7 @@ struct ov9282_mode {
> >       u32 vblank_min;
> >       u32 vblank_max;
> >       u32 link_freq_idx;
> > +     struct v4l2_rect crop;
> >       struct ov9282_reg_list reg_list;
> >  };
> >
> > @@ -280,6 +292,16 @@ static const struct ov9282_mode supported_modes[] = {
> >               .vblank_min = 41,
> >               .vblank_max = 51540,
> >               .link_freq_idx = 0,
> > +             .crop = {
> > +                     /*
> > +                      * Note that this mode takes the top 720 lines from the
> > +                      * 800 of the sensor. It does not take a middle crop.
> > +                      */
> > +                     .left = OV9282_PIXEL_ARRAY_LEFT,
> > +                     .top = OV9282_PIXEL_ARRAY_TOP,
> > +                     .width = 1280,
> > +                     .height = 720
> > +             },
> >               .reg_list = {
> >                       .num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
> >                       .regs = mode_1280x720_regs,
> > @@ -719,6 +741,58 @@ static int ov9282_init_pad_cfg(struct v4l2_subdev *sd,
> >       return ov9282_set_pad_format(sd, sd_state, &fmt);
> >  }
> >
> > +static const struct v4l2_rect *
> > +__ov9282_get_pad_crop(struct ov9282 *ov9282,
> > +                   struct v4l2_subdev_state *sd_state,
> > +                   unsigned int pad, enum v4l2_subdev_format_whence which)
> > +{
> > +     switch (which) {
> > +     case V4L2_SUBDEV_FORMAT_TRY:
> > +             return v4l2_subdev_get_try_crop(&ov9282->sd, sd_state, pad);
> > +     case V4L2_SUBDEV_FORMAT_ACTIVE:
> > +             return &ov9282->cur_mode->crop;
> > +     }
> > +
> > +     return NULL;
> > +}
> > +
> > +static int ov9282_get_selection(struct v4l2_subdev *sd,
> > +                             struct v4l2_subdev_state *sd_state,
> > +                             struct v4l2_subdev_selection *sel)
> > +{
> > +     switch (sel->target) {
> > +     case V4L2_SEL_TGT_CROP: {
> > +             struct ov9282 *ov9282 = to_ov9282(sd);
> > +
> > +             mutex_lock(&ov9282->mutex);
>
> As there's no set_selection, do we need the mutex here ?

__ov9282_get_pad_crop is looking at the current mode, so the mutex is
against ov9282_set_pad_format changing the mode.

You'll find the same pattern in imx214, imx219, ov5640, ov5647,
ov8865, and hopefully all other sensor drivers implementing
get_selection for V4L2_SEL_TGT_CROP.

  Dave

> > +             sel->r = *__ov9282_get_pad_crop(ov9282, sd_state, sel->pad,
> > +                                             sel->which);
> > +             mutex_unlock(&ov9282->mutex);
> > +
> > +             return 0;
> > +     }
> > +
> > +     case V4L2_SEL_TGT_NATIVE_SIZE:
> > +             sel->r.top = 0;
> > +             sel->r.left = 0;
> > +             sel->r.width = OV9282_NATIVE_WIDTH;
> > +             sel->r.height = OV9282_NATIVE_HEIGHT;
> > +
> > +             return 0;
> > +
> > +     case V4L2_SEL_TGT_CROP_DEFAULT:
> > +     case V4L2_SEL_TGT_CROP_BOUNDS:
> > +             sel->r.top = OV9282_PIXEL_ARRAY_TOP;
> > +             sel->r.left = OV9282_PIXEL_ARRAY_LEFT;
> > +             sel->r.width = OV9282_PIXEL_ARRAY_WIDTH;
> > +             sel->r.height = OV9282_PIXEL_ARRAY_HEIGHT;
> > +
> > +             return 0;
> > +     }
> > +
> > +     return -EINVAL;
> > +}
> > +
> >  /**
> >   * ov9282_start_streaming() - Start sensor stream
> >   * @ov9282: pointer to ov9282 device
> > @@ -963,6 +1037,7 @@ static const struct v4l2_subdev_pad_ops ov9282_pad_ops = {
> >       .enum_frame_size = ov9282_enum_frame_size,
> >       .get_fmt = ov9282_get_pad_format,
> >       .set_fmt = ov9282_set_pad_format,
> > +     .get_selection = ov9282_get_selection,
> >  };
> >
> >  static const struct v4l2_subdev_ops ov9282_subdev_ops = {
> > --
> > 2.34.1
> >
