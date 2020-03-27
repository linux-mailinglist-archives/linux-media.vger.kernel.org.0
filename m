Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A45A195822
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2020 14:37:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727345AbgC0Nh3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Mar 2020 09:37:29 -0400
Received: from retiisi.org.uk ([95.216.213.190]:45640 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726275AbgC0Nh3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Mar 2020 09:37:29 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 14E41634C90;
        Fri, 27 Mar 2020 15:37:06 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jHpAX-0000og-4s; Fri, 27 Mar 2020 15:37:05 +0200
Date:   Fri, 27 Mar 2020 15:37:05 +0200
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
Message-ID: <20200327133705.GC2394@valkosipuli.retiisi.org.uk>
References: <20200313110350.10864-1-robert.foss@linaro.org>
 <20200313110350.10864-3-robert.foss@linaro.org>
 <20200313121746.GC5730@valkosipuli.retiisi.org.uk>
 <CAG3jFytpx8_+DKhUVZnUFeMYK82Z1hFWcEnbyD0=4a8p3ojteg@mail.gmail.com>
 <20200326144725.GA2394@valkosipuli.retiisi.org.uk>
 <CAG3jFyu=HOsWNeRFC2t4HjzYrFrLjsbXzAm4+zD50Xq48mqzcw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG3jFyu=HOsWNeRFC2t4HjzYrFrLjsbXzAm4+zD50Xq48mqzcw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

On Fri, Mar 27, 2020 at 11:32:29AM +0100, Robert Foss wrote:
> On Thu, 26 Mar 2020 at 15:47, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> >
> > Hi Robert,
> >
> > On Thu, Mar 26, 2020 at 12:56:37PM +0100, Robert Foss wrote:
> > ...
> > > > > +static int __ov8856_power_on(struct ov8856 *ov8856)
> > > > > +{
> > > > > +     struct i2c_client *client = v4l2_get_subdevdata(&ov8856->sd);
> > > > > +     int ret;
> > > > > +
> > > > > +     ret = clk_prepare_enable(ov8856->xvclk);
> > > > > +     if (ret < 0) {
> > > > > +             dev_err(&client->dev, "failed to enable xvclk\n");
> > > > > +             return ret;
> > > > > +     }
> > > > > +
> > > > > +     gpiod_set_value_cansleep(ov8856->reset_gpio, GPIOD_OUT_HIGH);
> > > > > +
> > > > > +     ret = regulator_bulk_enable(ARRAY_SIZE(ov8856_supply_names),
> > > > > +                                 ov8856->supplies);
> > > > > +     if (ret < 0) {
> > > > > +             dev_err(&client->dev, "failed to enable regulators\n");
> > > > > +             goto disable_clk;
> > > > > +     }
> > > > > +
> > > > > +     gpiod_set_value_cansleep(ov8856->reset_gpio, GPIOD_OUT_LOW);
> > > > > +
> > > > > +     usleep_range(1500, 1800);
> > > >
> > > > I think you could omit the delay on ACPI based systems. Or just bail out
> > > > early in that case.
> > >
> > > I'll add a check for reset_gpio being NULL, and skip the sleep for that case.
> >
> > There could also be a regulator but no GPIO.
> >
> > I think if you don't have either, then certainly there's no need for a
> > delay.
> 
> Removing the delay if no action is taken makes sense, but I'm not sure
> how best to do it.
> If there are no regulators dummy ones are created automatically, which
> makes distinguishing between a little bit cumbersome. The regulator
> structs could of course all be inspected, and if all are dummy ones,
> the delay could be skipped. But is there a neater way of doing this?
> Manually inspecting the regs strikes me as a bit inelegant.

I guess the cleanest, easy way to make this right, albeit slightly
unoptimal in very rare cases where you have none of the above resources in
a DT system, is to bail out if you're running on an ACPI based system.

I.e. checking for e.g. is_acpi_node(dev->fwnode).

-- 
Sakari Ailus
