Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D96B218170C
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 12:49:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729185AbgCKLtl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 07:49:41 -0400
Received: from retiisi.org.uk ([95.216.213.190]:40214 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729165AbgCKLtl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 07:49:41 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 0450A634C87;
        Wed, 11 Mar 2020 13:48:48 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jBzqy-0001Rt-6p; Wed, 11 Mar 2020 13:48:48 +0200
Date:   Wed, 11 Mar 2020 13:48:48 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        ben.kao@intel.com, mchehab@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, matthias.bgg@gmail.com, davem@davemloft.net,
        gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [v1 2/3] media: ov8856: Add devicetree support
Message-ID: <20200311114848.GJ2619@valkosipuli.retiisi.org.uk>
References: <20200310134603.30260-1-robert.foss@linaro.org>
 <20200310134603.30260-3-robert.foss@linaro.org>
 <20200310142652.GK1922688@smile.fi.intel.com>
 <CAG3jFyu5S1H=r6pV92tc_a2LoCUnhb0mDbOegP2BCO8a5C1nVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG3jFyu5S1H=r6pV92tc_a2LoCUnhb0mDbOegP2BCO8a5C1nVg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

On Tue, Mar 10, 2020 at 04:55:20PM +0100, Robert Foss wrote:
> Hi Andy,
> 
> On Tue, 10 Mar 2020 at 15:26, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Tue, Mar 10, 2020 at 02:46:02PM +0100, Robert Foss wrote:
> > > Add devicetree match table, and enable ov8856_probe()
> > > to initialize power, clocks and reset pins.
> >
> > ...
> >
> > > +#define OV8856_NUM_SUPPLIES ARRAY_SIZE(ov8856_supply_names)
> >
> > Use ARRAY_SIZE() directly.
> 
> Ack.
> 
> >
> > Have you seen Sakari's comments?
> > Sakari, do I have déją vu or you indeed commented this driver?
> 
> Yes, I may have missed some part of it, so please tell me if I have.
> 
> There is a patchset floating around that implements a larger chunk of
> functionality,
> including a couple of new modes. This is based on that series.

Please see earlier comments given against an earlier variant of this set.
They're on LMML.

> 
> >
> > ...
> >
> > > +     gpiod_set_value_cansleep(ov8856->n_shutdn_gpio, GPIOD_OUT_LOW);
> >
> > > +     gpiod_set_value_cansleep(ov8856->n_shutdn_gpio, GPIOD_OUT_HIGH);
> >
> > Yes, seems this one is inverted.
> >
> > ...
> >
> > > +{
> > > +     gpiod_set_value_cansleep(ov8856->n_shutdn_gpio, GPIOD_OUT_LOW);
> > > +     regulator_bulk_disable(OV8856_NUM_SUPPLIES, ov8856->supplies);
> > > +     clk_disable_unprepare(ov8856->xvclk);
> > > +}
> > > +
> > > +
> >
> > One blank line is enough.
> >
> > ...
> >
> > > +     ov8856->xvclk = devm_clk_get(&client->dev, "xvclk");
> > > +     if (IS_ERR(ov8856->xvclk)) {
> > > +             dev_err(&client->dev, "failed to get xvclk\n");
> > > +             return -EINVAL;
> > > +     }
> >
> > Previously it worked without clock provider, now you make a dependency.
> >
> > This won't work.
> 
> So the ideal behavior would be to only use the xclk if it is provided?

See e.g. the smiapp driver on how to do this so it continues to work on
ACPI.

I think it'd be also appropriate to add the usleep() after lifting reset
only if the reset GPIO is defined for the device.

Also do consider dropping some people from the distribution. For many this
is just noise.

-- 
Kind regards,

Sakari Ailus
