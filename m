Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67A4C19DE81
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 21:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728456AbgDCTVX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 15:21:23 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:43599 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728276AbgDCTVX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 15:21:23 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jKRsO-00058t-IJ; Fri, 03 Apr 2020 21:21:12 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1jKRsJ-0007x6-Ff; Fri, 03 Apr 2020 21:21:07 +0200
Date:   Fri, 3 Apr 2020 21:21:07 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 1/3] media: dt-bindings: ov8856: Document YAML bindings
Message-ID: <20200403192107.gbzkdumoefuwtsln@pengutronix.de>
References: <20200331133346.372517-1-robert.foss@linaro.org>
 <20200331133346.372517-2-robert.foss@linaro.org>
 <20200331151253.q6ody3erhvsabznz@pengutronix.de>
 <CAG3jFyvBmfwoSoKxZJPh2VcJe2aCYGWRRNmkuky3wU2jOsRwBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG3jFyvBmfwoSoKxZJPh2VcJe2aCYGWRRNmkuky3wU2jOsRwBQ@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 21:13:24 up 140 days, 10:31, 156 users,  load average: 0.08, 0.05,
 0.02
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

On 20-04-02 11:57, Robert Foss wrote:
> 'Hey Marco,
> 
> On Tue, 31 Mar 2020 at 17:13, Marco Felsch <m.felsch@pengutronix.de> wrote:

...

> > > +  assigned-clocks:
> > > +    description:
> > > +      Input clock for the sensor.
> > > +
> > > +  assigned-clock-rates:
> > > +    description:
> > > +      Frequency of the xvclk clock in Hertz.
> >
> > Also this isn't related to the chip. You need this because you are using
> > a qcom platform which provides the clock.
> >
> > IMHO you only need to specify the clock. You can get the frequency with
> > the clk_get_rate() function.
> 
> The way I understood this, was that clk_get_rate() would fetch the
> clock rate as defined by the 'assigned-clock-rates'
> Is this not the case? And if so, what rate would cllk_get_rate()
> actually retrieve?
> 

You're right clk_get_rate() should be used to get the current clk rate
but assigned-cock-rates only applies to your setup where the host
supplies the clk. This is not the case ff we connect a simple external
osc which provides a static (not adjustable) ckl.

...

> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +    #include <dt-bindings/clock/qcom,camcc-sdm845.h>
> >
> > IMHO we should avoid examples with hardware specific includes.
> 
> The HW specific include is used for the clocks property.
> clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
> 
> Is there a non hw specific clock that would be better to use for examples?

Yes, just use:

  clocks = <&cam_osc>;

The dt-validation provides dummy hooks for such phandles.

Regards,
  Marco

> 
> >
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
> > > +            pinctrl-names = "default";
> > > +            pinctrl-0 = <&clk_24m_cam>;
> > > +
> > > +            clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
> > > +            clock-names = "xvclk";
> > > +            clock-frequency = <19200000>;
> > > +            assigned-clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
> > > +            assigned-clock-rates = <19200000>;
> > > +
> > > +            avdd-supply = <&mt6358_vcama2_reg>;
> > > +            dvdd-supply = <&mt6358_vcamd_reg>;
> > > +            dovdd-supply = <&mt6358_vcamio_reg>;
> > > +
> > > +            port {
> > > +                wcam_out: endpoint {
> > > +                    remote-endpoint = <&mipi_in_wcam>;
> > > +                    clock-lanes = <0>;
> > > +                    data-lanes = <1 2 3 4>;
> > > +                    link-frequencies = /bits/ 64 <360000000 180000000>;
> >
> > Should we add the link-frequencies as optional param?
> >
> > Regards,
> >   Marco
> >
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > > +...
> > > \ No newline at end of file
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index a6fbdf354d34..0f99e863978a 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -12355,6 +12355,7 @@ L:    linux-media@vger.kernel.org
> > >  T:   git git://linuxtv.org/media_tree.git
> > >  S:   Maintained
> > >  F:   drivers/media/i2c/ov8856.c
> > > +F:   Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> > >
> > >  OMNIVISION OV9650 SENSOR DRIVER
> > >  M:   Sakari Ailus <sakari.ailus@linux.intel.com>
> > > --
> > > 2.25.1
> > >
> > >
> >
> > --
> > Pengutronix e.K.                           |                             |
> > Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> > 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
