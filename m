Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E1EC977B3
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 13:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727270AbfHULFt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 07:05:49 -0400
Received: from mga09.intel.com ([134.134.136.24]:46163 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726825AbfHULFt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 07:05:49 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Aug 2019 04:05:48 -0700
X-IronPort-AV: E=Sophos;i="5.64,412,1559545200"; 
   d="scan'208";a="378910592"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Aug 2019 04:05:45 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 1884A208DD; Wed, 21 Aug 2019 14:05:43 +0300 (EEST)
Date:   Wed, 21 Aug 2019 14:05:43 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     dongchun.zhu@mediatek.com, mchehab@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, drinkcat@chromium.org,
        matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V3, 2/2] media: i2c: Add Omnivision OV02A10 camera sensor driver
Message-ID: <20190821110542.GD31967@paasikivi.fi.intel.com>
References: <20190819034331.13098-1-dongchun.zhu@mediatek.com>
 <20190819034331.13098-3-dongchun.zhu@mediatek.com>
 <20190821103038.GA148543@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190821103038.GA148543@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On Wed, Aug 21, 2019 at 07:30:38PM +0900, Tomasz Figa wrote:
...
> > +
> > +/*
> > + * xvclk 24Mhz
> 
> This seems to assume 24MHz, but the driver allows a range in probe. Is that
> correct?

I think it'd be better to check for an exact frequency: this is board
specific and its exact value is known.

...

> > +static int __ov02a10_power_on(struct ov02a10 *ov02a10)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> > +	struct device *dev = &client->dev;
> > +	int ret;
> > +
> > +	ret = clk_prepare_enable(ov02a10->xvclk);
> > +	if (ret < 0) {
> > +		dev_err(dev, "Failed to enable xvclk\n");
> > +		return ret;
> > +	}
> 
> Is it really correct to enable the clock before the regulators?
> 
> According to the datasheet, it should be:
>  - PD pin HIGH,
>  - nRST pin LOW,
>  - DVDDIO and AVDD28 power up and stabilize,
>  - clock enabled,
>  - min 5 ms delay,
>  - PD pin LOW,
>  - min 4 ms delay,
>  - nRST pin HIGH,
>  - min 5 ms delay,
>  - I2C interface ready.
> 
> > +
> > +	/* Note: set 0 is high, set 1 is low */
> 
> Why is that? If there is some inverter on the way that should be handled
> outside of this driver. (GPIO DT bindings have flags for this purpose.
> 
> If the pins are nRESET and nPOWERDOWN in the hardware datasheet, we should
> call them like this in the driver too (+/- the lowercase and underscore
> convention).
> 
> According to the datasheet, the reset pin is called RST and inverted, so we should
> call it n_rst, but the powerdown signal, called PD, is not inverted, so pd
> would be the right name.

For what it's worth sensors generally have xshutdown (or reset) pin that is
active high. Looking at the code, it is not the case here. It's a bit odd
since the usual arrangement saves power when the camera is not in use; it's
not a lot but still. Oh well.

...

> > +static struct i2c_driver ov02a10_i2c_driver = {
> > +	.driver = {
> > +		.name = "ov02a10",
> > +		.pm = &ov02a10_pm_ops,
> > +		.of_match_table = ov02a10_of_match,
> 
> Please use of_match_ptr() wrapper.

Not really needed; the driver does expect regulators, GPIOs etc., but by
leaving out of_match_ptr(), the driver will also probe on ACPI based
systems.

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
