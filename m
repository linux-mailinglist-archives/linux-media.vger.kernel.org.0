Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 225BC611498
	for <lists+linux-media@lfdr.de>; Fri, 28 Oct 2022 16:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbiJ1Oaz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Oct 2022 10:30:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbiJ1Oat (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Oct 2022 10:30:49 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0876852E6C
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 07:30:43 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkxjnptf9d2bpn7gcmbty-3.rev.dnainternet.fi [IPv6:2001:14ba:44ce:b640:9d1d:82c5:eca2:5060])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 0DD771B001A3;
        Fri, 28 Oct 2022 17:30:40 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1666967440;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=YIk6cD53mPiUemGbJQB20bjdtybP6AAZKR/3gq1IF8U=;
        b=Yav3ZI+CSusIIgerrS93bMdMH4ojnY+rIyuS+b/GLgJ1pb6c6piUXVAeyzLuepNwDGVIYD
        okYOulGktlimw4YsAEPHbgymGqP9sv5s8T8LYMSOab2LdGUAgGfRtEfRNedgPz+9fjpiUx
        zNzdDyw2/jX5m0+rJs7yERVis8o6+tX8x7ral65+fftjxdLvpiww0ClmnIoQZeieX0XVA5
        jf+Idz0tppCyQyeVvEVEA5CITkkI3L0Ue/ENU6EjfKHFWWVB9PGxOnk0VRuE7nlcdvjhcU
        rmdvfAzswoH8QRrlsWdyH1pBqBVef+d4vgE/tQN8RPS2DhBYUKaQUrbz2mrIFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1666967440;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=YIk6cD53mPiUemGbJQB20bjdtybP6AAZKR/3gq1IF8U=;
        b=U3a5VpRCVBFj5RxkG82l0x+/dOuoHti8YUwM/16LnPCvw7JVm138ai0j2smiSx7fpRGVto
        XvZSkBEc1j2HC7EdQOXRrOjyhRDNxFUQ684XfbTQ5QQnIY4T6in7Ye+JMaPb4mX+fOTEQv
        7Ktgo1qDOyc28TCQDCDjvOKrkYTZtM22wwytEOjLsWWHojaZIM7jpydxeKQjqJVIq1kvhl
        Nzwx0NNZaNH5FS6jnYoXecxKpo85QlY3zwwYFrN30r9dKKrg8IwttFqaEYa320CGcO0bOt
        VhyDixaa767nkEWF7UOS1v5GEaev7zRnKqeaAiPvgbwRCYKThzptmv/3Jo+9Nw==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1666967440; a=rsa-sha256;
        cv=none;
        b=QrhWgeh2T+FQFViDIqIx9Ytxv7G+oyqd/VZk31+zCO/doH/X2oP4wNTqQ7qMBcPnjAtvon
        PTXf57n9bWyflJqFfGp7K5dwsFJVaw9f92udTownFyiyEeLPNybqgEDT8ijVomroie8/3b
        CF0pLFtUYyfQFdXp4RTDSBMNZ8ul0zaZShu1OicwVIgajSFJCbH/lJeaw6OI4r0NlYrD1e
        MLVgEnn8wDOLWHIPEZFMg4f9TKj+/qzahE0Ow7wEIAq/E7DQo+cHS+DsdZdO9KhEqwwINz
        oh4TKFlZhNgR2JyEJ+7ZNjeVVw8aeRfGa3Ykp+cyGxnZv2nEh2ZnufPgzuKzrQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A6C81634DAD;
        Fri, 28 Oct 2022 17:30:39 +0300 (EEST)
Date:   Fri, 28 Oct 2022 17:30:39 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 08/16] media: i2c: ov9282: Add selection for CSI2 clock
 mode
Message-ID: <Y1vnjwRg1sh6Y/GQ@valkosipuli.retiisi.eu>
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
 <20221005152809.3785786-9-dave.stevenson@raspberrypi.com>
 <Y1jgDsmgXZYx0rZf@valkosipuli.retiisi.eu>
 <CAPY8ntD1EobB87z0grc7DU=y_Mj0Q8xHF0wAK9C3eQHfec6Zjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntD1EobB87z0grc7DU=y_Mj0Q8xHF0wAK9C3eQHfec6Zjg@mail.gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Fri, Oct 28, 2022 at 01:57:48PM +0100, Dave Stevenson wrote:
> Hi Sakari
> 
> On Wed, 26 Oct 2022 at 08:21, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> >
> > Hi Dave,
> >
> > On Wed, Oct 05, 2022 at 04:28:01PM +0100, Dave Stevenson wrote:
> > > The sensor supports either having the CSI2 clock lane free
> > > running, or gated when there is no packet to transmit.
> > > The driver only selected gated (non-continuous) clock mode.
> > >
> > > Add code to allow fwnode to configure whether the clock is
> > > gated or free running.
> > >
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > ---
> > >  drivers/media/i2c/ov9282.c | 16 +++++++++++++++-
> > >  1 file changed, 15 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > > index abb1223c0260..334b31af34a4 100644
> > > --- a/drivers/media/i2c/ov9282.c
> > > +++ b/drivers/media/i2c/ov9282.c
> > > @@ -46,6 +46,9 @@
> > >  /* Group hold register */
> > >  #define OV9282_REG_HOLD              0x3308
> > >
> > > +#define OV9282_REG_MIPI_CTRL00       0x4800
> > > +#define OV9282_GATED_CLOCK   BIT(5)
> > > +
> > >  /* Input clock rate */
> > >  #define OV9282_INCLK_RATE    24000000
> > >
> > > @@ -138,6 +141,7 @@ struct ov9282 {
> > >       struct clk *inclk;
> > >       struct regulator_bulk_data supplies[OV9282_NUM_SUPPLIES];
> > >       struct v4l2_ctrl_handler ctrl_handler;
> > > +     bool noncontinuous_clock;
> > >       struct v4l2_ctrl *link_freq_ctrl;
> > >       struct v4l2_ctrl *hblank_ctrl;
> > >       struct v4l2_ctrl *vblank_ctrl;
> > > @@ -211,7 +215,6 @@ static const struct ov9282_reg common_regs[] = {
> > >       {0x4601, 0x04},
> > >       {0x470f, 0x00},
> > >       {0x4f07, 0x00},
> > > -     {0x4800, 0x20},
> > >       {0x5000, 0x9f},
> > >       {0x5001, 0x00},
> > >       {0x5e00, 0x00},
> > > @@ -684,6 +687,14 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
> > >               return ret;
> > >       }
> > >
> > > +     ret = ov9282_write_reg(ov9282, OV9282_REG_MIPI_CTRL00, 1,
> > > +                            ov9282->noncontinuous_clock ?
> > > +                                     OV9282_GATED_CLOCK : 0);
> >
> > Wouldn't this better fit for power on?
> 
> It can be done in ov9282_power_on, but is then totally redundantly set
> when powering the sensor up to read the ID during initial probe.

This is the same also when streaming is enabled and disabled multiple times
while the sensor is powered on. Although without autosuspend this may be
unlikely.

> Doing so also means there needs to be a great big warning never to
> change the driver and hit the software reset via writing 0x01 to
> register 0x0103 as part of any register array (very common in many
> other sensor drivers).

If there's a desire to reset the sensor after powering it up, that should
be done as the first thing after power-up. Setting non-continuous clock
isn't anything special here.

But that's up to you. I guess lane configuration etc. is part of the big
register lists.

> 
> I'll move it and add a comment before the register tables.

I think it's unnecessary.

-- 
Kind regards,

Sakari Ailus
