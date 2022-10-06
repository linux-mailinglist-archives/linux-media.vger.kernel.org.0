Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 483B15F697C
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 16:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbiJFOWF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 10:22:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbiJFOWE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 10:22:04 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79FB6DAC
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 07:22:01 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id k2so4968957ejr.2
        for <linux-media@vger.kernel.org>; Thu, 06 Oct 2022 07:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i3gY8p+pY4KO3kwI07p7kGAf690Y9B7dF7dICd1uAOU=;
        b=WFIis/n48QSi++tS1b1nXi1/ur9Z8/W6/bJfAcGG1u6iTYMAhAuZDvaQYwyPtsyqlH
         YhecVGCmltG4fi+ulPOQ/Nvzp3seE31JhVz/CWQP3RPqulqWreEBn9DrBD513XYXTFvD
         CoGhm/+cCaMQOexkVtdjv77rbc8vAVhUDFceGZfYhgwB9ME/yWFrZ4hJtl+MReNjXFNT
         IdK7/ZsiH3mAC8hLuLT3vuYrwwyEsb23ghiccbuIdaFXHj8a+do/YBPaEnXxOn4X3DXr
         2KHaDyg5kMd2wB/ULCOXmeOHmGYI0kQSz2lZhpdSLjMQKrB3GEoNwnXKdM0q4Dh4dE08
         76vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i3gY8p+pY4KO3kwI07p7kGAf690Y9B7dF7dICd1uAOU=;
        b=4GuhjqfyeCmesHNRt6Xd6Aa6/ZsqHqnwONl2D3IG8PDK4mKvmSHa2RGhsZZUQ+iymb
         noqpKLF+wZCJ6B9XYi0pQMJx73MO3Sw7H4K8cdMZKT3S20MIIYcBJeJaQ+yLDPcWsM02
         sb2UqU9GgoZw06U8Q/jw/1I8jU68IA4Bn2lNKZZWMms/TBp8MCXxXk9rDYGDBAgV8fHA
         z+3UBoa/7/wGgDBTBauyNH+P3ftimRbtuGFlkNqUPPc0sCfr8S01sjVvBRWyEyJx6s0c
         ZMtmGZksBJjKpaFdJyNQRDAiqT9HmqEOd2QvuFcUWg66FUetNAVSWrcJ08zi4TFBGOaz
         UhaA==
X-Gm-Message-State: ACrzQf0ppFpJ94zzo6z3eIBk/IUWsKr9R4Dlx9PN/Lv3kWipMJgzCaiR
        RQuep2zy2X3ecOfWWwyKryVFtUltef0QABlDNEf55GT/zlwoTw==
X-Google-Smtp-Source: AMsMyM51HC5CpnMa3ueQEzXGK3eWXa9lJK1UWhYWOnHe96c4/1GjC+eoz0olh0uyLOVi8VECaifPXPbW7FfgdyZR45U=
X-Received: by 2002:a17:907:2703:b0:78d:2f6e:3add with SMTP id
 w3-20020a170907270300b0078d2f6e3addmr101185ejk.154.1665066119999; Thu, 06 Oct
 2022 07:21:59 -0700 (PDT)
MIME-Version: 1.0
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
 <20221005152809.3785786-12-dave.stevenson@raspberrypi.com> <20221006093828.ib6s5jw2blapmywi@uno.localdomain>
In-Reply-To: <20221006093828.ib6s5jw2blapmywi@uno.localdomain>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 6 Oct 2022 15:21:43 +0100
Message-ID: <CAPY8ntCCpMZtG-eJQ8cgd_GO06ZDP32oRK8mGrZKGMU2W401Dg@mail.gmail.com>
Subject: Re: [PATCH 11/16] media: i2c: ov9282: Add HFLIP and VFLIP support
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
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

cc Sakari for policy view.

On Thu, 6 Oct 2022 at 10:38, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hi Dave
>
> On Wed, Oct 05, 2022 at 04:28:04PM +0100, Dave Stevenson wrote:
> > Adds support for V4L2_CID_HFLIP and V4L2_CID_VFLIP to allow
> > flipping the image.
> >
> > The driver previously enabled H & V flips in the register table,
> > therefore the controls default to the same settings to avoid
> > changing the behaviour.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/ov9282.c | 52 +++++++++++++++++++++++++++++++++++---
> >  1 file changed, 49 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index 5ddef6e2b3ac..12cbe401fd78 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -46,6 +46,10 @@
> >  /* Group hold register */
> >  #define OV9282_REG_HOLD              0x3308
> >
> > +#define OV9282_REG_TIMING_FORMAT_1   0x3820
> > +#define OV9282_REG_TIMING_FORMAT_2   0x3821
> > +#define OV9282_FLIP_BIT                      BIT(2)
> > +
>
> Can we remove them from the list of common registers or do those
> registers contains other settings which might get lost ?

They also contain the binning information, so generally best to keep
them in the mode list. (640x400 mode added later makes use of
binning).

> >  #define OV9282_REG_MIPI_CTRL00       0x4800
> >  #define OV9282_GATED_CLOCK   BIT(5)
> >
> > @@ -440,6 +444,38 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
> >       return ret;
> >  }
> >
> > +static int ov9282_set_ctrl_hflip(struct ov9282 *ov9282, int value)
> > +{
> > +     u32 current_val;
> > +     int ret = ov9282_read_reg(ov9282, OV9282_REG_TIMING_FORMAT_2, 1,
> > +                               &current_val);
> > +     if (!ret) {
> > +             if (value)
> > +                     current_val |= OV9282_FLIP_BIT;
> > +             else
> > +                     current_val &= ~OV9282_FLIP_BIT;
> > +             return ov9282_write_reg(ov9282, OV9282_REG_TIMING_FORMAT_2, 1,
> > +                                     current_val);
> > +     }
> > +     return ret;
>
> Or simply
>
>         int ret = ov9282_read_reg(ov9282, OV9282_REG_TIMING_FORMAT_2, 1,
>                         &current_val);
>         if (ret)
>                 return ret;
>
>         if (value)
>                 current_val |= OV9282_FLIP_BIT;
>         else
>                 current_val &= ~OV9282_FLIP_BIT;
>
>         return ov9282_write_reg(ov9282, OV9282_REG_TIMING_FORMAT_2, 1,
>                                 current_val);
>

Done

> > +}
> > +
> > +static int ov9282_set_ctrl_vflip(struct ov9282 *ov9282, int value)
> > +{
> > +     u32 current_val;
> > +     int ret = ov9282_read_reg(ov9282, OV9282_REG_TIMING_FORMAT_1, 1,
> > +                               &current_val);
> > +     if (!ret) {
> > +             if (value)
> > +                     current_val |= OV9282_FLIP_BIT;
> > +             else
> > +                     current_val &= ~OV9282_FLIP_BIT;
> > +             return ov9282_write_reg(ov9282, OV9282_REG_TIMING_FORMAT_1, 1,
> > +                                     current_val);
> > +     }
> > +     return ret;
> > +}
> > +
> >  /**
> >   * ov9282_set_ctrl() - Set subdevice control
> >   * @ctrl: pointer to v4l2_ctrl structure
> > @@ -484,7 +520,6 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
> >
> >       switch (ctrl->id) {
> >       case V4L2_CID_EXPOSURE:
> > -
>
> Unrelated and possibly part of the previous patch ?
>
> >               exposure = ctrl->val;
> >               analog_gain = ov9282->again_ctrl->val;
> >
> > @@ -493,12 +528,17 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
> >
> >               ret = ov9282_update_exp_gain(ov9282, exposure, analog_gain);
> >
> > -
>
> same here
>
> >               break;
> >       case V4L2_CID_VBLANK:
> >               lpfr = ov9282->vblank + ov9282->cur_mode->height;
> >               ret = ov9282_write_reg(ov9282, OV9282_REG_LPFR, 2, lpfr);
> >               break;
> > +     case V4L2_CID_HFLIP:
> > +             ret = ov9282_set_ctrl_hflip(ov9282, ctrl->val);
> > +             break;
> > +     case V4L2_CID_VFLIP:
> > +             ret = ov9282_set_ctrl_vflip(ov9282, ctrl->val);
> > +             break;
> >       default:
> >               dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
> >               ret = -EINVAL;
> > @@ -996,7 +1036,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> >       u32 lpfr;
> >       int ret;
> >
> > -     ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
> > +     ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
> >       if (ret)
> >               return ret;
> >
> > @@ -1030,6 +1070,12 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
> >                                               mode->vblank_max,
> >                                               1, mode->vblank);
> >
> > +     v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_VFLIP,
> > +                       0, 1, 1, 1);
> > +
> > +     v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_HFLIP,
> > +                       0, 1, 1, 1);
>
> By default 0x3820 and 0x3821 are initialized to 0x3c and 0x84 which
> have BIT(2) set, so the image is "flipped" by default to compensate
> the sensor mounting orientation. For users though the image appears
> "not flipped", and if they have to set the control to 0 to flip it it
> would feel a bit weird. Should the logic be inverted ? ie setting the
> FLIP controls value to 1 results in BIT(2) being cleared ?

This comes back to my comment at the Dublin Media Summit of wanting
fully featured drivers instead of product specific ones.

Drivers have been accepted with no flip controls and some form of
inversion buried in the registers. I'll acknowledge that restrictions
on datasheets makes it almost impossible for reviewers to pick up on
this, but we could push for flip controls to be mandatory in future if
the sensor supports it.
Looking at imx258 we again have a hardcoded rotation of 180degrees[1],
and it won't even probe if a "rotation" property isn't set to 180 [2].
It seems to be almost normal for the company who submitted both imx258
and ov9282 drivers that their sensors are inverted.

I guess the question really comes down to how HFLIP and VFLIP should
be defined. Are they relative to the platform, or relative to the
sensor vendor's definition? If relative to the platform, then do we
merge in V4L2_CID_CAMERA_SENSOR_ROTATION somehow?
With Bayer sensors it gets even more confusing as the flips typically
change the Bayer order, so someone referencing the datasheet will
start scratching their head over why they're getting BGGR when they
haven't asked for flips despite the datasheet saying the sensor is
RGGB.

Perhaps a more general discussion on how to handle these cases of
adding HFLIP and VFLIP is warranted.

If necessary then I'll drop this patch for now, but some path for
adding these features needs to be formulated. OV7251 is next on my
list to send patches, and then IMX258, so the subject will come up
again very soon.

  Dave

[1] https://github.com/torvalds/linux/blob/master/drivers/media/i2c/imx258.c#L968
[2] https://github.com/torvalds/linux/blob/master/drivers/media/i2c/imx258.c#L1283

> > +
> >       /* Read only controls */
> >       v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_PIXEL_RATE,
> >                         OV9282_PIXEL_RATE, OV9282_PIXEL_RATE, 1,
> > --
> > 2.34.1
> >
