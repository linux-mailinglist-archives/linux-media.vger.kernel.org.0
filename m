Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4253F613760
	for <lists+linux-media@lfdr.de>; Mon, 31 Oct 2022 14:06:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbiJaNGi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Oct 2022 09:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231273AbiJaNGh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Oct 2022 09:06:37 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41E802700
        for <linux-media@vger.kernel.org>; Mon, 31 Oct 2022 06:06:36 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkxjnptf9d2bpn7gcmbty-3.rev.dnainternet.fi [IPv6:2001:14ba:44ce:b640:9d1d:82c5:eca2:5060])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4784B1B00043;
        Mon, 31 Oct 2022 15:06:32 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1667221592;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8ObjimdZgkm9sb5KBr2zkxWJJeqSisR5yfEaOdoZPNI=;
        b=o+6nAcwMbUW5hC+oetJ+0Hx/8INN/aJlsFO8oGh0vaF/zdVW7/2bUheOG27zSfYzrd51kZ
        8DaPlpT5qadqirzTAs0meNcgZ1M41885f8sU+uGnAsooOqS2hSh2ZRcfeSkYdhz1tcuC9k
        U51L4LDDuxPf9HuZaYWKrYnBoDg8FTDOIw9ijHr9KPy0pGuDPzmOpOAti2Cg+s067qDmdB
        CCMtkyaRCsXmsZhddgEiVSpXDkATJJDX0lHJd9zyZyTQ8fhbNvjMKTyM6NskrdiDXFBsQ7
        yIFwZMLZurrnLD7WGPDsP0BO3PpbE6izkm2CyCWid3v1v4YNZJT0XNmIyqLNCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1667221592;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8ObjimdZgkm9sb5KBr2zkxWJJeqSisR5yfEaOdoZPNI=;
        b=OcRos64F7qCAgzLFhAo06c6YSYnsd7cdeaB/kTMTJDO5cxnxeh/WX0LLvM8IJI6M7ACOof
        5xkkC+WvigUPxNpneppq4JXRpXr7IhjYb+3UwKZ4QSgishKIpeWMw0MGvP8NAVEjLHk0Xa
        iQSEjRwum2a/1G1e+UEvN6R3GDsBwFGlfrkhIfUtrLhuSZJ3DSDKkuwIsRJTHz0UcmqVeo
        WmjKVODSqdv4BLI2pQAcTqqLKo3aTvQx3MdMKoHlmjRmRoApAzTSJHnp6TgZ3bzlSMxUMc
        xshO7QiNgjc0Zqf1BX0wjtdyRfozLVVDvkiRHf1D7NBLGx1qKS1JftPL965gHQ==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1667221592; a=rsa-sha256;
        cv=none;
        b=dvxnnTmp6AbGkq4h9jKHZEoXPUeJQxnIrjLdwuLjJsgMYl/qtnbYxVklwP9zCp8iUcdCE4
        anX9f4EZtCNYvJdsDpnHgPCYCwmA7Y/kNk3egwqSvB5/0BbljpBHoMdeHeB0Zhbc3GPOo4
        xorlhweSMAUhP3neu+kBkXuhWDFT0NpfKSkNeOjmuR7RWJGrf6N5ufdlN0zowmwfihwMbL
        eOmTaeg3NLJH1L7OjeVMWTYVeMfu/0yLIL5AvOnDp7MbD2EaMZX4jcuaRHk7C9OVtsaMU2
        UkIu60j6JbVPY/qUl36Klv2V6aoJjPWIUihenB6eCLYrbzRumfuCHdUVJWf5LA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id C2144634C96;
        Mon, 31 Oct 2022 15:06:31 +0200 (EET)
Date:   Mon, 31 Oct 2022 15:06:31 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 08/16] media: i2c: ov9282: Add selection for CSI2 clock
 mode
Message-ID: <Y1/IV/1+DOCm4hFM@valkosipuli.retiisi.eu>
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
 <20221005152809.3785786-9-dave.stevenson@raspberrypi.com>
 <Y1jgDsmgXZYx0rZf@valkosipuli.retiisi.eu>
 <CAPY8ntD1EobB87z0grc7DU=y_Mj0Q8xHF0wAK9C3eQHfec6Zjg@mail.gmail.com>
 <Y1vnjwRg1sh6Y/GQ@valkosipuli.retiisi.eu>
 <CAPY8ntAXdVuKk6WRhoqyapbtjh5Y1TXqn4MJ1_iU2op7QEOgqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntAXdVuKk6WRhoqyapbtjh5Y1TXqn4MJ1_iU2op7QEOgqg@mail.gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Fri, Oct 28, 2022 at 04:03:45PM +0100, Dave Stevenson wrote:
> Hi Sakari
> 
> On Fri, 28 Oct 2022 at 15:30, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> >
> > Hi Dave,
> >
> > On Fri, Oct 28, 2022 at 01:57:48PM +0100, Dave Stevenson wrote:
> > > Hi Sakari
> > >
> > > On Wed, 26 Oct 2022 at 08:21, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> > > >
> > > > Hi Dave,
> > > >
> > > > On Wed, Oct 05, 2022 at 04:28:01PM +0100, Dave Stevenson wrote:
> > > > > The sensor supports either having the CSI2 clock lane free
> > > > > running, or gated when there is no packet to transmit.
> > > > > The driver only selected gated (non-continuous) clock mode.
> > > > >
> > > > > Add code to allow fwnode to configure whether the clock is
> > > > > gated or free running.
> > > > >
> > > > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > > ---
> > > > >  drivers/media/i2c/ov9282.c | 16 +++++++++++++++-
> > > > >  1 file changed, 15 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > > > > index abb1223c0260..334b31af34a4 100644
> > > > > --- a/drivers/media/i2c/ov9282.c
> > > > > +++ b/drivers/media/i2c/ov9282.c
> > > > > @@ -46,6 +46,9 @@
> > > > >  /* Group hold register */
> > > > >  #define OV9282_REG_HOLD              0x3308
> > > > >
> > > > > +#define OV9282_REG_MIPI_CTRL00       0x4800
> > > > > +#define OV9282_GATED_CLOCK   BIT(5)
> > > > > +
> > > > >  /* Input clock rate */
> > > > >  #define OV9282_INCLK_RATE    24000000
> > > > >
> > > > > @@ -138,6 +141,7 @@ struct ov9282 {
> > > > >       struct clk *inclk;
> > > > >       struct regulator_bulk_data supplies[OV9282_NUM_SUPPLIES];
> > > > >       struct v4l2_ctrl_handler ctrl_handler;
> > > > > +     bool noncontinuous_clock;
> > > > >       struct v4l2_ctrl *link_freq_ctrl;
> > > > >       struct v4l2_ctrl *hblank_ctrl;
> > > > >       struct v4l2_ctrl *vblank_ctrl;
> > > > > @@ -211,7 +215,6 @@ static const struct ov9282_reg common_regs[] = {
> > > > >       {0x4601, 0x04},
> > > > >       {0x470f, 0x00},
> > > > >       {0x4f07, 0x00},
> > > > > -     {0x4800, 0x20},
> > > > >       {0x5000, 0x9f},
> > > > >       {0x5001, 0x00},
> > > > >       {0x5e00, 0x00},
> > > > > @@ -684,6 +687,14 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
> > > > >               return ret;
> > > > >       }
> > > > >
> > > > > +     ret = ov9282_write_reg(ov9282, OV9282_REG_MIPI_CTRL00, 1,
> > > > > +                            ov9282->noncontinuous_clock ?
> > > > > +                                     OV9282_GATED_CLOCK : 0);
> > > >
> > > > Wouldn't this better fit for power on?
> > >
> > > It can be done in ov9282_power_on, but is then totally redundantly set
> > > when powering the sensor up to read the ID during initial probe.
> >
> > This is the same also when streaming is enabled and disabled multiple times
> > while the sensor is powered on. Although without autosuspend this may be
> > unlikely.
> >
> > > Doing so also means there needs to be a great big warning never to
> > > change the driver and hit the software reset via writing 0x01 to
> > > register 0x0103 as part of any register array (very common in many
> > > other sensor drivers).
> >
> > If there's a desire to reset the sensor after powering it up, that should
> > be done as the first thing after power-up. Setting non-continuous clock
> > isn't anything special here.
> 
> I'm only looking at existing drivers in mainline as there is no clear
> documentation on do's and don't's within sensor drivers (I know
> writing good documentation is hard).
> ov7251 [1] reset in ov7251_global_init_setting
> ov8856 [2] reset in the lane config tables
> ov5695 [3] reset in ov5695_global_regs
> ov2740 [4] reset in mipi_data_rate_720mbps
> ov13858 [5] explicit reset in ov13858_start_streaming
> ov13b10 [6] explicit reset in ov13b10_start_streaming
> 
> In my book that's a common enough pattern in mainline drivers for it
> to be worth warning against introducing it when it will cause quirky
> behaviour.
> 
> [1] https://github.com/torvalds/linux/blob/master/drivers/media/i2c/ov7251.c#L238
> [2] https://github.com/torvalds/linux/blob/master/drivers/media/i2c/ov8856.c#L167
> [3] https://github.com/torvalds/linux/blob/master/drivers/media/i2c/ov5695.c#L128
> [4] https://github.com/torvalds/linux/blob/master/drivers/media/i2c/ov2740.c#L127
> [5] https://github.com/torvalds/linux/blob/master/drivers/media/i2c/ov13858.c#L1421
> [6] https://github.com/torvalds/linux/blob/master/drivers/media/i2c/ov13b10.c#L1033

Well, register list based sensor drivers are hardly exemplary in this
respect. Some drivers reset the device after resuming it, some do not.

As noted, it's up to you.

> 
> > But that's up to you. I guess lane configuration etc. is part of the big
> > register lists.
> 
> Only 2 data lanes are currently supported by the driver.
> Bit 5 of 0x3039 in theory allows you to drop to 1 lane, but I've not
> got it to work. I suspect further clock tree changes are required.
> 
> A 400MHz link freq (800Mbit/s/lane) is already required for the max
> 1280x800@120fps.
> Dropping to 1 lane therefore either requires reducing the max frame
> rate, or potentially running at 800MHz link freq, which is well in
> excess of the earlier versions of CSI-2 spec (500MHz or 1Gbit/s). IMHO
> It's not worth pursuing.

Works for me.

-- 
Kind regards,

Sakari Ailus
