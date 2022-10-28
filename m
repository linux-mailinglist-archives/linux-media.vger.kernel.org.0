Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7553611209
	for <lists+linux-media@lfdr.de>; Fri, 28 Oct 2022 14:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbiJ1M6K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Oct 2022 08:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiJ1M6H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Oct 2022 08:58:07 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FC7A1C39DE
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 05:58:05 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id l11so6559948edb.4
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 05:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JbcLwJIFAJwh8L2dzlAGZjWoI8MKj7bv0uwBEq+dgwI=;
        b=OVXRb5olIGyE+oBYxkkw+eUUInC/ZF2uyIFDpSCPydLdMPyu+p0j1uZov+SvsEONCo
         TzHZy6SHafGkgcXGtz2SlsCfNp6s0Nk2f6tgr8Uc3tlpF7uKd868Q1TD0nX1XyIqcBCI
         FljyvaCidecx84B/7+mWAFx4UePM3ls+nQVaTY4a/S065+rj6PKaHGynorMurKwgu1fR
         f9fjrZbugzgZtHWZSWxP5qOzUCSVonVg7VZPNu+HKTWCA2PcTRps/nVzeyCbx4h9WNqd
         Md8i5KfvMi6+dSDH1K/vygjcqna769MMVSksddyNc6tIU7La40ZNpyFeeWnOONUCl05a
         ruWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JbcLwJIFAJwh8L2dzlAGZjWoI8MKj7bv0uwBEq+dgwI=;
        b=2PM6gYe93w6RAW2s85JHTQBVPVOoatDK36pePtlf904MUZpdGM6+gU6f06YeMzNIjF
         4UgB2dKcgxdD9AkEMyNfbIaZtZOf8dqVi7Q1hK6fOkICn5IqWe6iQqYR+GybNfNIollr
         pnU8MlSHTI0JSHl+xwTKQf4S+XhCdOHdUOwcspI+3ZzlWCAtNyhxCiw2B+hI6IWo90Lm
         KLQIoqNp/Oxib6HEpVqvJ54odZtAHzDy8f27hk/0AYbhHOMEit/+GvNx2HQLAL6e8LIU
         U4Ww5IoDHLlVdlHzekOWjGLJHkWfDORb8K6LENhbQAmxmH3cBL/5WNIbFm0ZWEK4pNum
         Q0bg==
X-Gm-Message-State: ACrzQf3B80Nkcamt/BNYf6wRV+kp9L988+wzjFMfmfzld8/qCwXPphTi
        cTE9SsCY4dP85NVxKSU1EmfzYFO5nNURRGpn2wYXRQ==
X-Google-Smtp-Source: AMsMyM6UdB9KSElUnI7XhigDUkBvO6YxG39k/iABezKEqByFfSGgy45IMByQaK7jQXFztJkZfnJGSQzFNnTuynPy8D0=
X-Received: by 2002:a05:6402:c07:b0:461:87ab:78aa with SMTP id
 co7-20020a0564020c0700b0046187ab78aamr30182914edb.258.1666961883768; Fri, 28
 Oct 2022 05:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
 <20221005152809.3785786-9-dave.stevenson@raspberrypi.com> <Y1jgDsmgXZYx0rZf@valkosipuli.retiisi.eu>
In-Reply-To: <Y1jgDsmgXZYx0rZf@valkosipuli.retiisi.eu>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 28 Oct 2022 13:57:48 +0100
Message-ID: <CAPY8ntD1EobB87z0grc7DU=y_Mj0Q8xHF0wAK9C3eQHfec6Zjg@mail.gmail.com>
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

On Wed, 26 Oct 2022 at 08:21, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Dave,
>
> On Wed, Oct 05, 2022 at 04:28:01PM +0100, Dave Stevenson wrote:
> > The sensor supports either having the CSI2 clock lane free
> > running, or gated when there is no packet to transmit.
> > The driver only selected gated (non-continuous) clock mode.
> >
> > Add code to allow fwnode to configure whether the clock is
> > gated or free running.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/ov9282.c | 16 +++++++++++++++-
> >  1 file changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index abb1223c0260..334b31af34a4 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -46,6 +46,9 @@
> >  /* Group hold register */
> >  #define OV9282_REG_HOLD              0x3308
> >
> > +#define OV9282_REG_MIPI_CTRL00       0x4800
> > +#define OV9282_GATED_CLOCK   BIT(5)
> > +
> >  /* Input clock rate */
> >  #define OV9282_INCLK_RATE    24000000
> >
> > @@ -138,6 +141,7 @@ struct ov9282 {
> >       struct clk *inclk;
> >       struct regulator_bulk_data supplies[OV9282_NUM_SUPPLIES];
> >       struct v4l2_ctrl_handler ctrl_handler;
> > +     bool noncontinuous_clock;
> >       struct v4l2_ctrl *link_freq_ctrl;
> >       struct v4l2_ctrl *hblank_ctrl;
> >       struct v4l2_ctrl *vblank_ctrl;
> > @@ -211,7 +215,6 @@ static const struct ov9282_reg common_regs[] = {
> >       {0x4601, 0x04},
> >       {0x470f, 0x00},
> >       {0x4f07, 0x00},
> > -     {0x4800, 0x20},
> >       {0x5000, 0x9f},
> >       {0x5001, 0x00},
> >       {0x5e00, 0x00},
> > @@ -684,6 +687,14 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
> >               return ret;
> >       }
> >
> > +     ret = ov9282_write_reg(ov9282, OV9282_REG_MIPI_CTRL00, 1,
> > +                            ov9282->noncontinuous_clock ?
> > +                                     OV9282_GATED_CLOCK : 0);
>
> Wouldn't this better fit for power on?

It can be done in ov9282_power_on, but is then totally redundantly set
when powering the sensor up to read the ID during initial probe.
Doing so also means there needs to be a great big warning never to
change the driver and hit the software reset via writing 0x01 to
register 0x0103 as part of any register array (very common in many
other sensor drivers).

I'll move it and add a comment before the register tables.

  Dave

> > +     if (ret) {
> > +             dev_err(ov9282->dev, "fail to write MIPI_CTRL00");
> > +             return ret;
> > +     }
> > +
> >       /* Write sensor mode registers */
> >       reg_list = &ov9282->cur_mode->reg_list;
> >       ret = ov9282_write_regs(ov9282, reg_list->regs, reg_list->num_of_regs);
> > @@ -861,6 +872,9 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
> >       if (ret)
> >               return ret;
> >
> > +     ov9282->noncontinuous_clock =
> > +             bus_cfg.bus.mipi_csi2.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
> > +
> >       if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV9282_NUM_DATA_LANES) {
> >               dev_err(ov9282->dev,
> >                       "number of CSI2 data lanes %d is not supported",
>
> --
> Kind regards,
>
> Sakari Ailus
