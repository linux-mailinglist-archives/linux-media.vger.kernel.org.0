Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E6941C703E
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 14:26:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727933AbgEFM0e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 08:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725985AbgEFM0e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 08:26:34 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05103C061A0F
        for <linux-media@vger.kernel.org>; Wed,  6 May 2020 05:26:33 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jWJ84-0004dl-4N; Wed, 06 May 2020 14:26:24 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jWJ80-0008SB-9H; Wed, 06 May 2020 14:26:20 +0200
Date:   Wed, 6 May 2020 14:26:20 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Maxime Ripard <maxime@cerno.tech>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Fabio Estevam <festevam@gmail.com>,
        Ben Kao <ben.kao@intel.com>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v10 1/3] media: dt-bindings: ov8856: Document YAML
 bindings
Message-ID: <20200506122620.GN18755@pengutronix.de>
References: <20200505100129.104673-1-robert.foss@linaro.org>
 <20200505100129.104673-2-robert.foss@linaro.org>
 <1588679279.8804.133.camel@mhfsdcap03>
 <CAG3jFyvo3gmO3zLRUKQEdgRkmzvvvMTzDKV-LZAeKYFdOfCnEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG3jFyvo3gmO3zLRUKQEdgRkmzvvvMTzDKV-LZAeKYFdOfCnEw@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:15:18 up 74 days, 23:32, 107 users,  load average: 0.43, 0.98,
 4.24
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20-05-06 13:29, Robert Foss wrote:
> Hey Dongchun,
> 
> Thanks for having a look at this series.
> 
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +
> > > +    i2c {
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        ov8856: camera@10 {
> > > +            compatible = "ovti,ov8856";
> > > +            reg = <0x10>;
> > > +
> > > +            reset-gpios = <&pio 111 GPIO_ACTIVE_LOW>;
> >
> > Apologies for missing to follow the earlier discussion related to this.
> > I noticed the GPIO flag para and __ov8856_power_on() are aligned using
> > ACTIVE_LOW.
> >
> > But from the datasheet, XSHUTDN pin is active-high for OV8856.
> > It means devm_gpiod_get API (in probe func) should use GPIOD_OUT_LOW to
> > initialize the GPIO as output with a value of 0.
> > Otherwise it should use GPIOD_OUT_HIGH.
> >
> > There is one case for GPIO_ACTIVE_LOW setting:
> > https://patchwork.linuxtv.org/patch/63460/
> > https://patchwork.linuxtv.org/patch/63461/
> 
> We went back and forth about this a few times, and I switched to this
> gpio setting after having worked through the device probing reset gpio
> toggling. Semantically it seemed easier to understand in the driver,
> since the gpio is called reset and not !shutdown.

IMHO you can keep your version. DTs are part of the system integration.
What if one system has a invert logic infront of the gpio input.. The
system integrator needs to read and to understand the schematic
correctly to pick the correct value.

> Looking into devm_gpiod_get_optional(), the flag argument
> GPIOD_OUT_LOW or HIGH for that matter is actually not used initialize

The good think about gpiod is that it care about logic values not
physical/electrical values. If you set GPIOD_OUT_HIGH then the reset is
asserted, whatever asserted means electrical.

Regards,
  Marco

> the output, but only used for an exclusivity check.
> https://elixir.bootlin.com/linux/latest/source/drivers/gpio/gpiolib-devres.c#L109
> 
> If you prefer, I can invert the logic again. To me making the reset
> gpio active resulting in the device being actually reset seems like
> the most intuitive and easy to understand option.
> The different OmniVision drivers seem to have different approaches to
> this. The ov9640 driver for example is doing what this series
> currently is doing.
> 
> >
> > Sakari, Tomasz, am I right?
> >
> > > +            pinctrl-names = "default";
> > > +            pinctrl-0 = <&clk_24m_cam>;
> > > +
> > > +            clocks = <&cam_osc>;
> > > +            clock-names = "xvclk";
> > > +            clock-frequency = <19200000>;
> > > +
> > > +            avdd-supply = <&mt6358_vcama2_reg>;
> > > +            dvdd-supply = <&mt6358_vcamd_reg>;
> > > +            dovdd-supply = <&mt6358_vcamio_reg>;
> > > +
> > > +            port {
> > > +                wcam_out: endpoint {
> > > +                    remote-endpoint = <&mipi_in_wcam>;
> > > +                    data-lanes = <1 2 3 4>;
> > > +                    link-frequencies = /bits/ 64 <360000000>;
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > > +...
> > > \ No newline at end of file
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 26f281d9f32a..84b262afd13d 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -12489,6 +12489,7 @@ L:    linux-media@vger.kernel.org
> > >  S:   Maintained
> > >  T:   git git://linuxtv.org/media_tree.git
> > >  F:   drivers/media/i2c/ov8856.c
> > > +F:   Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> > >
> >
> > Had you run parse-maintainers.pl?
> > The new item is supposed to be arranged in alphabetical order.
> 
> No, I have not. But upon running it now, it doesn't make suggest any
> changes. But let me order the files manually in the next revision.
> 
> However, I noticed I removed the wrong person from the maintainers
> file in this revision.
> So, I'll correct that and add you Dongchun as the maintainer if that's ok.
> 
> >
> > >  OMNIVISION OV9640 SENSOR DRIVER
> > >  M:   Petr Cvek <petrcvekcz@gmail.com>
> >
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
