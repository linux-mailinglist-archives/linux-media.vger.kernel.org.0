Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99C40614715
	for <lists+linux-media@lfdr.de>; Tue,  1 Nov 2022 10:44:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbiKAJoy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Nov 2022 05:44:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbiKAJop (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Nov 2022 05:44:45 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BFFC2A8
        for <linux-media@vger.kernel.org>; Tue,  1 Nov 2022 02:44:44 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id A5BBA1C0009;
        Tue,  1 Nov 2022 09:44:40 +0000 (UTC)
Date:   Tue, 1 Nov 2022 10:44:39 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi
Subject: Re: [PATCH v2 14/16] media: i2c: ov9282: Add support for 1280x800
 and 640x400 modes
Message-ID: <20221101094439.jqkeg7j5trxzlyir@uno.localdomain>
References: <20221028160902.2696973-1-dave.stevenson@raspberrypi.com>
 <20221028160902.2696973-15-dave.stevenson@raspberrypi.com>
 <20221031102819.sm3u4hom3tuddtax@uno.localdomain>
 <CAPY8ntDUpk2ysUo_gLXvkjP9JbWa2w9p3iRgSMnppmadoLpBAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntDUpk2ysUo_gLXvkjP9JbWa2w9p3iRgSMnppmadoLpBAg@mail.gmail.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Mon, Oct 31, 2022 at 12:09:46PM +0000, Dave Stevenson wrote:
> Hi Jacopo
>
> On Mon, 31 Oct 2022 at 10:28, Jacopo Mondi <jacopo@jmondi.org> wrote:
> >
> > Hi Dave
> >
> >
> > On Fri, Oct 28, 2022 at 05:09:00PM +0100, Dave Stevenson wrote:
> > > Adds register settings for additional modes.
> > >
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > ---
> > >  drivers/media/i2c/ov9282.c | 103 ++++++++++++++++++++++++++++++++++++-
> > >  1 file changed, 102 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > > index a520d9fef0cb..c169b532ec8b 100644
> > > --- a/drivers/media/i2c/ov9282.c
> > > +++ b/drivers/media/i2c/ov9282.c
> > > @@ -246,11 +246,44 @@ struct ov9282_reg_list common_regs_list = {
> > >       .regs = common_regs,
> > >  };
> > >
> > > -#define MODE_1280_720                0
> > > +#define MODE_1280_800                0
> > > +#define MODE_1280_720                1
> > > +#define MODE_640_400         2
> > >
> > >  #define DEFAULT_MODE         MODE_1280_720
> > >
> > >  /* Sensor mode registers */
> > > +static const struct ov9282_reg mode_1280x800_regs[] = {
> > > +     {0x3778, 0x00},
> > > +     {0x3800, 0x00},
> > > +     {0x3801, 0x00},
> > > +     {0x3802, 0x00},
> > > +     {0x3803, 0x00},
> > > +     {0x3804, 0x05},
> > > +     {0x3805, 0x0f},
> > > +     {0x3806, 0x03},
> > > +     {0x3807, 0x2f},
> > > +     {0x3808, 0x05},
> > > +     {0x3809, 0x00},
> > > +     {0x380a, 0x03},
> > > +     {0x380b, 0x20},
> > > +     {0x3810, 0x00},
> > > +     {0x3811, 0x08},
> > > +     {0x3812, 0x00},
> > > +     {0x3813, 0x08},
> > > +     {0x3814, 0x11},
> > > +     {0x3815, 0x11},
> > > +     {0x3820, 0x40},
> > > +     {0x3821, 0x00},
> > > +     {0x4003, 0x40},
> > > +     {0x4008, 0x04},
> > > +     {0x4009, 0x0b},
> > > +     {0x400c, 0x00},
> > > +     {0x400d, 0x07},
> > > +     {0x4507, 0x00},
> > > +     {0x4509, 0x00},
> > > +};
> > > +
> > >  static const struct ov9282_reg mode_1280x720_regs[] = {
> > >       {0x3778, 0x00},
> > >       {0x3800, 0x00},
> > > @@ -282,8 +315,57 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
> > >       {0x4509, 0x80},
> > >  };
> > >
> > > +static const struct ov9282_reg mode_640x400_regs[] = {
> > > +     {0x3778, 0x10},
> > > +     {0x3800, 0x00},
> > > +     {0x3801, 0x00},
> > > +     {0x3802, 0x00},
> > > +     {0x3803, 0x00},
> > > +     {0x3804, 0x05},
> > > +     {0x3805, 0x0f},
> > > +     {0x3806, 0x03},
> > > +     {0x3807, 0x2f},
> > > +     {0x3808, 0x02},
> > > +     {0x3809, 0x80},
> > > +     {0x380a, 0x01},
> > > +     {0x380b, 0x90},
> > > +     {0x3810, 0x00},
> > > +     {0x3811, 0x04},
> > > +     {0x3812, 0x00},
> > > +     {0x3813, 0x04},
> > > +     {0x3814, 0x31},
> > > +     {0x3815, 0x22},
> > > +     {0x3820, 0x60},
> > > +     {0x3821, 0x01},
> > > +     {0x4008, 0x02},
> > > +     {0x4009, 0x05},
> > > +     {0x400c, 0x00},
> > > +     {0x400d, 0x03},
> > > +     {0x4507, 0x03},
> > > +     {0x4509, 0x80},
> > > +};
> > > +
> > >  /* Supported sensor mode configurations */
> > >  static const struct ov9282_mode supported_modes[] = {
> > > +     [MODE_1280_800] = {
> > > +             .width = 1280,
> > > +             .height = 800,
> > > +             .hblank_min = { 250, 176 },
> > > +             .vblank = 1022,
> > > +             .vblank_min = 110,
> > > +             .vblank_max = 51540,
> > > +             .link_freq_idx = 0,
> > > +             .crop = {
> > > +                     .left = OV9282_PIXEL_ARRAY_LEFT,
> > > +                     .top = OV9282_PIXEL_ARRAY_TOP,
> > > +                     .width = 1280,
> > > +                     .height = 800
> > > +             },
> > > +             .reg_list = {
> > > +                     .num_of_regs = ARRAY_SIZE(mode_1280x800_regs),
> > > +                     .regs = mode_1280x800_regs,
> > > +             },
> > > +     },
> > >       [MODE_1280_720] = {
> > >               .width = 1280,
> > >               .height = 720,
> > > @@ -307,6 +389,25 @@ static const struct ov9282_mode supported_modes[] = {
> > >                       .regs = mode_1280x720_regs,
> > >               },
> > >       },
> > > +     [MODE_640_400] = {
> > > +             .width = 640,
> > > +             .height = 400,
> > > +             .hblank_min = { 890, 816 },
> > > +             .vblank = 1022,
> > > +             .vblank_min = 22,
> > > +             .vblank_max = 51540,
> >
> > While hblank_min is adapated to match the limits for full resolution
> > mode (1280 + 250 - 640 = 890; same for the 816 non-continuous version)
> > vblank_min is shrinked, giving a min frame length of (400 + 22)
> > compared to the full-res min frame length of (800 + 110). Is this
> > intentional ?
>
> I adapted the Rockchip driver [1] ages ago and we had been using that
> with extensions in our vendor kernel. With Alexander posting the
> patches to this ov9282 driver to add ov9281 support, I looked at
> porting the extra functionality I had there.
>
> I added the 640x400 mode to the vendor driver back in Nov 2020 [2]
> with a min/default vts of 421. This was then corrected in July 2022
> with [3] as VTS 421 actually gave 130fps instead of the expected
> ~261fps.
>
> The datasheet doesn't give a minimum height for the VBLANK period,
> therefore empirical testing is the best we can do in this case.
>
> It may be possible to reduce vblank_min for the other modes, but I
> haven't verified that. The datasheet lists the default for registers
> 0x380E/F as 0x38e or 910, giving VBLANK as 110, and resulting in
> 120fps. As the sensor is advertised as having a maximum transfer rate
> of 1280 x 800: 120fps, exceeding that would probably be foolish.
>

Ok, so vblank_min = 21 "breaks" streaming by halving the framerate,
while vblank_min = 22 works as expected.

It would be great to record that 22 is obtained by sperimental results
in the commit message, or in a comment here and not by documentation ?

Anyway, the series is tagged and Sakari is about to collect it, so no
need to resend, but if you have to...

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>


>   Dave
>
> [1] https://github.com/rockchip-linux/kernel/blob/develop-4.4/drivers/media/i2c/ov9281.c
> [2] https://github.com/raspberrypi/linux/pull/3968
> [3] https://github.com/raspberrypi/linux/pull/5082
>
> > > +             .link_freq_idx = 0,
> > > +             .crop = {
> > > +                     .left = OV9282_PIXEL_ARRAY_LEFT,
> > > +                     .top = OV9282_PIXEL_ARRAY_TOP,
> > > +                     .width = 1280,
> > > +                     .height = 800
> > > +             },
> > > +             .reg_list = {
> > > +                     .num_of_regs = ARRAY_SIZE(mode_640x400_regs),
> > > +                     .regs = mode_640x400_regs,
> > > +             },
> > > +     },
> > >  };
> > >
> > >  /**
> > > --
> > > 2.34.1
> > >
