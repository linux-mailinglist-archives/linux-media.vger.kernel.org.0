Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 701F35F6560
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 13:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbiJFLqt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 07:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiJFLqs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 07:46:48 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DC5A9D52B
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 04:46:46 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id qw20so3324579ejc.8
        for <linux-media@vger.kernel.org>; Thu, 06 Oct 2022 04:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=la6FrWdqCi2Ko0sdH66CNZ5pFdSD+Niu9nHvL1G97xs=;
        b=PJdUgGarWp2gnHdWQvUuTuVQVuxZnEfCCKlFEtI2uROzK6FzgLgVpJ0znXc6aWeJH2
         xEk+/yPVRTVYld/PfzoZiz/n1Hewx+bSFetKc5mWGvUAa6PzT6oQ41Dz6aZ2Vjdyjq9h
         RWugq1w08mPRSmPGQcD+t9Pc1vq52CdoR7DfyVV+K7aMrcA0bk/eDq3hOIdx5wT8EYrC
         ZxjLwPC/Z07jU2zWmtQUQguo2SLA0k0ZxuKyJ5Vkgfbt0r5qZI1tlX34aSxUF4+ONRFp
         +FKeus2d53f6SXKXsFjyMPP4WX+EiOC48c6OG5YD4dhApAy8EHV+njE1iEtG5ZPdtC0G
         D8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=la6FrWdqCi2Ko0sdH66CNZ5pFdSD+Niu9nHvL1G97xs=;
        b=OES79Abo1kODktthyIu4UqtP99gNpA2rF5RMh7+A/4i5/Ra6rkLX9eKG6/u1xRe2o0
         Tk/r1W2/BgcCo/9nEaCkMsq5GYBASI0OQEVZZUNw1hQRGmoEOm+Fp2jzIK0djHniitjz
         swet3osONnxKp+VfhPHtx8IKnr02r9QsQr8nJewQCumuUjisR4JAgUZnENYuZqw7izOF
         JLZ8Zm8+Rn5itxm8YlpmBJZfsScWgUBZ07HZROZUg7cUjXLQEVTbc8QXMEqxQJ9V7nvT
         nr1OlqwAlB03yiOCHAL5mkiXrmcQv8D1uZx7GzP1PZBEV5tdjA+VZy+eXxn2ktkA+UtS
         zjNg==
X-Gm-Message-State: ACrzQf0uVWxDZwIb2njMavue9tAfTIbJp0olA1sVeEAXQSgbmhphl+uG
        4ecxVr5AIhRP8wZ/lrgoTtNI1xs64/R8G3AjynC2SZ/YXAk=
X-Google-Smtp-Source: AMsMyM5JCOzE56CJ/QEbZkyHg3YAeFPgDMJ9O+/nBd7g4J+2oHhAJPLy47pPu/xacDMnkfMFtWIULRn/bmQW0kT24B8=
X-Received: by 2002:a17:907:8b0f:b0:783:6169:5bc5 with SMTP id
 sz15-20020a1709078b0f00b0078361695bc5mr3787772ejc.200.1665056804525; Thu, 06
 Oct 2022 04:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
 <20221005152809.3785786-15-dave.stevenson@raspberrypi.com> <20221006094818.setqogqevtjpfvo6@uno.localdomain>
In-Reply-To: <20221006094818.setqogqevtjpfvo6@uno.localdomain>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 6 Oct 2022 12:46:28 +0100
Message-ID: <CAPY8ntD0O=Ob5LcpOUU3NERhe00F3wzQJBTyhERQ1LCkyXTRug@mail.gmail.com>
Subject: Re: [PATCH 14/16] media: i2c: ov9282: Add support for 1280x800 and
 640x400 modes
To:     Jacopo Mondi <jacopo@jmondi.org>
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

Hi Jacopo

Thanks for the review

On Thu, 6 Oct 2022 at 10:48, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> On Wed, Oct 05, 2022 at 04:28:07PM +0100, Dave Stevenson wrote:
> > Adds register settings for additional modes.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/ov9282.c | 97 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 97 insertions(+)
> >
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index d892f53fb1ea..ec1599488f21 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -251,6 +251,37 @@ struct ov9282_reg_list common_regs_list = {
> >  };
> >
> >  /* Sensor mode registers */
> > +static const struct ov9282_reg mode_1280x800_regs[] = {
> > +     {0x3778, 0x00},
> > +     {0x3800, 0x00},
> > +     {0x3801, 0x00},
> > +     {0x3802, 0x00},
> > +     {0x3803, 0x00},
> > +     {0x3804, 0x05},
> > +     {0x3805, 0x0f},
> > +     {0x3806, 0x03},
> > +     {0x3807, 0x2f},
> > +     {0x3808, 0x05},
> > +     {0x3809, 0x00},
> > +     {0x380a, 0x03},
> > +     {0x380b, 0x20},
> > +     {0x3810, 0x00},
> > +     {0x3811, 0x08},
> > +     {0x3812, 0x00},
> > +     {0x3813, 0x08},
> > +     {0x3814, 0x11},
> > +     {0x3815, 0x11},
> > +     {0x3820, 0x40},
> > +     {0x3821, 0x00},
> > +     {0x4003, 0x40},
> > +     {0x4008, 0x04},
> > +     {0x4009, 0x0b},
> > +     {0x400c, 0x00},
> > +     {0x400d, 0x07},
> > +     {0x4507, 0x00},
> > +     {0x4509, 0x00},
> > +};
> > +
> >  static const struct ov9282_reg mode_1280x720_regs[] = {
> >       {0x3778, 0x00},
> >       {0x3800, 0x00},
> > @@ -282,6 +313,36 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
> >       {0x4509, 0x80},
> >  };
> >
> > +static const struct ov9282_reg mode_640x400_regs[] = {
> > +     {0x3778, 0x10},
> > +     {0x3800, 0x00},
> > +     {0x3801, 0x00},
> > +     {0x3802, 0x00},
> > +     {0x3803, 0x00},
> > +     {0x3804, 0x05},
> > +     {0x3805, 0x0f},
>
> I assume this mode is then binned as the analog crop rectangle is the
> same as the other modes, right ?

Yes, it is binned.
0x3820 bit 1 controls vertical binning. 0x3821 bit 0 is horizontal
binning. These are the same registers that control flips, hence the
flip handler having to read-modify-write.

> > +     {0x3806, 0x03},
> > +     {0x3807, 0x2f},
> > +     {0x3808, 0x02},
> > +     {0x3809, 0x80},
> > +     {0x380a, 0x01},
> > +     {0x380b, 0x90},
> > +     {0x3810, 0x00},
> > +     {0x3811, 0x04},
> > +     {0x3812, 0x00},
> > +     {0x3813, 0x04},
> > +     {0x3814, 0x31},
> > +     {0x3815, 0x22},
> > +     {0x3820, 0x60},
> > +     {0x3821, 0x01},
> > +     {0x4008, 0x02},
> > +     {0x4009, 0x05},
> > +     {0x400c, 0x00},
> > +     {0x400d, 0x03},
> > +     {0x4507, 0x03},
> > +     {0x4509, 0x80},
> > +};
> > +
> >  /* Supported sensor mode configurations */
> >  static const struct ov9282_mode supported_modes[] = {
> >       {
> > @@ -306,6 +367,42 @@ static const struct ov9282_mode supported_modes[] = {
> >                       .num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
> >                       .regs = mode_1280x720_regs,
> >               },
> > +     }, {
> > +             .width = 1280,
> > +             .height = 800,
> > +             .hblank_min = { 250, 176 },
> > +             .vblank = 1022,
> > +             .vblank_min = 110,
> > +             .vblank_max = 51540,
> > +             .link_freq_idx = 0,
> > +             .crop = {
> > +                     .left = OV9282_PIXEL_ARRAY_LEFT,
> > +                     .top = OV9282_PIXEL_ARRAY_TOP,
> > +                     .width = 1280,
> > +                     .height = 800
> > +             },
> > +             .reg_list = {
> > +                     .num_of_regs = ARRAY_SIZE(mode_1280x800_regs),
> > +                     .regs = mode_1280x800_regs,
> > +             },
> > +     }, {
> > +             .width = 640,
> > +             .height = 400,
> > +             .hblank_min = { 890, 816 },
> > +             .vblank = 1022,
> > +             .vblank_min = 22,
> > +             .vblank_max = 51540,
> > +             .link_freq_idx = 0,
> > +             .crop = {
> > +                     .left = OV9282_PIXEL_ARRAY_LEFT,
> > +                     .top = OV9282_PIXEL_ARRAY_TOP,
> > +                     .width = 1280,
> > +                     .height = 800
> > +             },
>
> This seems to confirm it.
>
> I would have ordered them, but this will change the default mode
> unless we define its index and use it at initialization time

Yes, I didn't want to change the default mode, although why the
existing mode was a non-centred crop I have no idea!

I'm happy to add a define or enum for each mode, initialise this table
using them, and then have a define for which mode is the default. That
removes any ambiguity, and means the table can be ordered.

  Dave
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
>
> Thanks
>   j
>
> > +             .reg_list = {
> > +                     .num_of_regs = ARRAY_SIZE(mode_640x400_regs),
> > +                     .regs = mode_640x400_regs,
> > +             },
> >       },
> >  };
> >
> > --
> > 2.34.1
> >
