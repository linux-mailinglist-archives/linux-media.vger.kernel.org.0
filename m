Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 758C861156A
	for <lists+linux-media@lfdr.de>; Fri, 28 Oct 2022 17:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbiJ1PEF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Oct 2022 11:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231168AbiJ1PEE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Oct 2022 11:04:04 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8D2A20751F
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 08:04:02 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id 13so13623068ejn.3
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 08:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EiLK3m5xrtyFe8qUjG+rA/Hy+J9ZBYFUIuW3q4PSUZs=;
        b=X768VnmJTlZ82jUG+ghi2LYaxZsZ8XcFUOsWwoPTe8neaj90C8FSn6F1txcfzmn8To
         lRSGgtwyC66yJmm3lbeaSKL+hkT1tkjo3YxVvRn3gRw1GY+FwSmh5OlLC/GNrzDb1Abw
         6S6TJ5H2QKg3nN8qw4rccvikDfLPoUaoEjsr7puXp/dXqTQ3v+UTY9wKXgktlE/KgT6c
         6fIhNK7HgdAEMIijDtEN4nqoU0H2saAvxfehDf7cK1z8ENtyn5hIPr91gR4bYSjrl2go
         DpGV9OOKm1ZwMM4sV327M0BCT9+I2gvuJmxsSCs4JpnJ7xpoyLsYNQk/mcyQP/t0KC3o
         Ja6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EiLK3m5xrtyFe8qUjG+rA/Hy+J9ZBYFUIuW3q4PSUZs=;
        b=DYqSghlb1v6mdyU4xVOCAdScdMy2mfRWDucCg1xRFwc4uuXVGKrVFvp2VkK38b31UO
         ZPAqOm94U2ghHc5Ae5ToTbq71yc32N5ymgaOJ+NzWIWsZ9cf0QOTLVPFGJwSNf2S/cn9
         psZ36qB0B3NrlHGSA1IWIJAedMDODPytY+YNhqTG9erDvXQFw1UDn9MsE0wDFED86b/Z
         pjFA9x7OjQLX/xPO/DwRtb1/oE1tBhSilyiAaCUILB4MRXzNQW5h7T2aU8/KPsNIxOyL
         3BD5FRcaEX80W9Mx4AeYMjUoQmckewFImMm3TTM0VjyMH3X7C9q+IPqt4UfFzV6F8Y33
         sUCg==
X-Gm-Message-State: ACrzQf29D5CS6LzTHFHv8Y5T7/3i7n9rsvZLc01jEyC2T+hMkuyebryY
        gZv3wFMExxYjWQSBC6P7HmzKVJrTl5MUwGI+6is1m9yqohK1/w==
X-Google-Smtp-Source: AMsMyM5KCCXWN2GenJCKeBHJzebP2shTsxkna2ouvWTmd/1Lwxwepp3OmBz+LhM5iFQUply2RQdbhpJuJwbcpQ7cHZc=
X-Received: by 2002:a17:906:cc0e:b0:7ad:a4c4:8745 with SMTP id
 ml14-20020a170906cc0e00b007ada4c48745mr1701078ejb.175.1666969441246; Fri, 28
 Oct 2022 08:04:01 -0700 (PDT)
MIME-Version: 1.0
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
 <20221005152809.3785786-9-dave.stevenson@raspberrypi.com> <Y1jgDsmgXZYx0rZf@valkosipuli.retiisi.eu>
 <CAPY8ntD1EobB87z0grc7DU=y_Mj0Q8xHF0wAK9C3eQHfec6Zjg@mail.gmail.com> <Y1vnjwRg1sh6Y/GQ@valkosipuli.retiisi.eu>
In-Reply-To: <Y1vnjwRg1sh6Y/GQ@valkosipuli.retiisi.eu>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 28 Oct 2022 16:03:45 +0100
Message-ID: <CAPY8ntAXdVuKk6WRhoqyapbtjh5Y1TXqn4MJ1_iU2op7QEOgqg@mail.gmail.com>
Subject: Re: [PATCH 08/16] media: i2c: ov9282: Add selection for CSI2 clock mode
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
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

Hi Sakari

On Fri, 28 Oct 2022 at 15:30, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Dave,
>
> On Fri, Oct 28, 2022 at 01:57:48PM +0100, Dave Stevenson wrote:
> > Hi Sakari
> >
> > On Wed, 26 Oct 2022 at 08:21, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> > >
> > > Hi Dave,
> > >
> > > On Wed, Oct 05, 2022 at 04:28:01PM +0100, Dave Stevenson wrote:
> > > > The sensor supports either having the CSI2 clock lane free
> > > > running, or gated when there is no packet to transmit.
> > > > The driver only selected gated (non-continuous) clock mode.
> > > >
> > > > Add code to allow fwnode to configure whether the clock is
> > > > gated or free running.
> > > >
> > > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > ---
> > > >  drivers/media/i2c/ov9282.c | 16 +++++++++++++++-
> > > >  1 file changed, 15 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > > > index abb1223c0260..334b31af34a4 100644
> > > > --- a/drivers/media/i2c/ov9282.c
> > > > +++ b/drivers/media/i2c/ov9282.c
> > > > @@ -46,6 +46,9 @@
> > > >  /* Group hold register */
> > > >  #define OV9282_REG_HOLD              0x3308
> > > >
> > > > +#define OV9282_REG_MIPI_CTRL00       0x4800
> > > > +#define OV9282_GATED_CLOCK   BIT(5)
> > > > +
> > > >  /* Input clock rate */
> > > >  #define OV9282_INCLK_RATE    24000000
> > > >
> > > > @@ -138,6 +141,7 @@ struct ov9282 {
> > > >       struct clk *inclk;
> > > >       struct regulator_bulk_data supplies[OV9282_NUM_SUPPLIES];
> > > >       struct v4l2_ctrl_handler ctrl_handler;
> > > > +     bool noncontinuous_clock;
> > > >       struct v4l2_ctrl *link_freq_ctrl;
> > > >       struct v4l2_ctrl *hblank_ctrl;
> > > >       struct v4l2_ctrl *vblank_ctrl;
> > > > @@ -211,7 +215,6 @@ static const struct ov9282_reg common_regs[] = {
> > > >       {0x4601, 0x04},
> > > >       {0x470f, 0x00},
> > > >       {0x4f07, 0x00},
> > > > -     {0x4800, 0x20},
> > > >       {0x5000, 0x9f},
> > > >       {0x5001, 0x00},
> > > >       {0x5e00, 0x00},
> > > > @@ -684,6 +687,14 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
> > > >               return ret;
> > > >       }
> > > >
> > > > +     ret = ov9282_write_reg(ov9282, OV9282_REG_MIPI_CTRL00, 1,
> > > > +                            ov9282->noncontinuous_clock ?
> > > > +                                     OV9282_GATED_CLOCK : 0);
> > >
> > > Wouldn't this better fit for power on?
> >
> > It can be done in ov9282_power_on, but is then totally redundantly set
> > when powering the sensor up to read the ID during initial probe.
>
> This is the same also when streaming is enabled and disabled multiple times
> while the sensor is powered on. Although without autosuspend this may be
> unlikely.
>
> > Doing so also means there needs to be a great big warning never to
> > change the driver and hit the software reset via writing 0x01 to
> > register 0x0103 as part of any register array (very common in many
> > other sensor drivers).
>
> If there's a desire to reset the sensor after powering it up, that should
> be done as the first thing after power-up. Setting non-continuous clock
> isn't anything special here.

I'm only looking at existing drivers in mainline as there is no clear
documentation on do's and don't's within sensor drivers (I know
writing good documentation is hard).
ov7251 [1] reset in ov7251_global_init_setting
ov8856 [2] reset in the lane config tables
ov5695 [3] reset in ov5695_global_regs
ov2740 [4] reset in mipi_data_rate_720mbps
ov13858 [5] explicit reset in ov13858_start_streaming
ov13b10 [6] explicit reset in ov13b10_start_streaming

In my book that's a common enough pattern in mainline drivers for it
to be worth warning against introducing it when it will cause quirky
behaviour.

[1] https://github.com/torvalds/linux/blob/master/drivers/media/i2c/ov7251.c#L238
[2] https://github.com/torvalds/linux/blob/master/drivers/media/i2c/ov8856.c#L167
[3] https://github.com/torvalds/linux/blob/master/drivers/media/i2c/ov5695.c#L128
[4] https://github.com/torvalds/linux/blob/master/drivers/media/i2c/ov2740.c#L127
[5] https://github.com/torvalds/linux/blob/master/drivers/media/i2c/ov13858.c#L1421
[6] https://github.com/torvalds/linux/blob/master/drivers/media/i2c/ov13b10.c#L1033

> But that's up to you. I guess lane configuration etc. is part of the big
> register lists.

Only 2 data lanes are currently supported by the driver.
Bit 5 of 0x3039 in theory allows you to drop to 1 lane, but I've not
got it to work. I suspect further clock tree changes are required.

A 400MHz link freq (800Mbit/s/lane) is already required for the max
1280x800@120fps.
Dropping to 1 lane therefore either requires reducing the max frame
rate, or potentially running at 800MHz link freq, which is well in
excess of the earlier versions of CSI-2 spec (500MHz or 1Gbit/s). IMHO
It's not worth pursuing.

  Dave

> >
> > I'll move it and add a comment before the register tables.
>
> I think it's unnecessary.
>
> --
> Kind regards,
>
> Sakari Ailus
