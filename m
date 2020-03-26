Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 992551941E1
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 15:47:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727931AbgCZOrq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 10:47:46 -0400
Received: from retiisi.org.uk ([95.216.213.190]:35046 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727547AbgCZOrq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 10:47:46 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id EA1C4634C90;
        Thu, 26 Mar 2020 16:47:26 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jHTn4-0000iB-0A; Thu, 26 Mar 2020 16:47:26 +0200
Date:   Thu, 26 Mar 2020 16:47:25 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [v2 2/3] media: ov8856: Add devicetree support
Message-ID: <20200326144725.GA2394@valkosipuli.retiisi.org.uk>
References: <20200313110350.10864-1-robert.foss@linaro.org>
 <20200313110350.10864-3-robert.foss@linaro.org>
 <20200313121746.GC5730@valkosipuli.retiisi.org.uk>
 <CAG3jFytpx8_+DKhUVZnUFeMYK82Z1hFWcEnbyD0=4a8p3ojteg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG3jFytpx8_+DKhUVZnUFeMYK82Z1hFWcEnbyD0=4a8p3ojteg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

On Thu, Mar 26, 2020 at 12:56:37PM +0100, Robert Foss wrote:
...
> > > +static int __ov8856_power_on(struct ov8856 *ov8856)
> > > +{
> > > +     struct i2c_client *client = v4l2_get_subdevdata(&ov8856->sd);
> > > +     int ret;
> > > +
> > > +     ret = clk_prepare_enable(ov8856->xvclk);
> > > +     if (ret < 0) {
> > > +             dev_err(&client->dev, "failed to enable xvclk\n");
> > > +             return ret;
> > > +     }
> > > +
> > > +     gpiod_set_value_cansleep(ov8856->reset_gpio, GPIOD_OUT_HIGH);
> > > +
> > > +     ret = regulator_bulk_enable(ARRAY_SIZE(ov8856_supply_names),
> > > +                                 ov8856->supplies);
> > > +     if (ret < 0) {
> > > +             dev_err(&client->dev, "failed to enable regulators\n");
> > > +             goto disable_clk;
> > > +     }
> > > +
> > > +     gpiod_set_value_cansleep(ov8856->reset_gpio, GPIOD_OUT_LOW);
> > > +
> > > +     usleep_range(1500, 1800);
> >
> > I think you could omit the delay on ACPI based systems. Or just bail out
> > early in that case.
> 
> I'll add a check for reset_gpio being NULL, and skip the sleep for that case.

There could also be a regulator but no GPIO.

I think if you don't have either, then certainly there's no need for a
delay.

...

> > > +             ov8856->xvclk = NULL;
> > > +     } else if (IS_ERR(ov8856->xvclk)) {
> > > +             dev_err(&client->dev, "could not get xvclk clock (%ld)\n",
> > > +                     PTR_ERR(ov8856->xvclk));
> > > +             return PTR_ERR(ov8856->xvclk);
> > > +     }
> > > +
> > > +     ret = clk_set_rate(ov8856->xvclk, OV8856_XVCLK_24);
> >
> > This should either come from platform data, or perhaps it'd be even better
> > to get the clock rate and use assigned-clock-rates. I guess that's
> > preferred nowadays.
> 
> I'm a bit unsure about what this would look like.
> 
> Are you thinking something like the way ext_clk is used in smiapp_core.c?
> I went ahead and implemented support for retrieving and storing
> 'clock-rates' during the ov8856_check_hwcfg() call, and then setting
> the rate to the configured rate during probing.

With assigned-clock-rates, you can simply use clk_get_rate().

As you get the actual rate, it could be somewhat off of the intended one.

-- 
Kind regards,

Sakari Ailus
