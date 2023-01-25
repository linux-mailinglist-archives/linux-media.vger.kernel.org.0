Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C1D467B5DD
	for <lists+linux-media@lfdr.de>; Wed, 25 Jan 2023 16:28:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236029AbjAYP2A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Jan 2023 10:28:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234913AbjAYP17 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Jan 2023 10:27:59 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE57BE394;
        Wed, 25 Jan 2023 07:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674660475; x=1706196475;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MhIuUNx9z28qVaLvlB986dpfICFybCjatufmu7Wo/d4=;
  b=AA/PP2SqwmdvtqJmLQLRqriGiboFxJnb73tSgVnono5I4PAz19fJE2fV
   sLB/s7gpBEYvYf68R1EfbI36oYCuqjXOxwR7CGojkU4fZq/ZL9HSw4Bnu
   safxEN4HMbOizGv62FpP4UdWwWKha55pPqOk2wLGq27jf5rjzHW8kGkFf
   LC3/0/bbLRdRbshwLYR3GgG2dJS0PnTile+gHf5O6VN1rX/LVc61GSfvg
   N0c6HtJz/v6yZkHbP2wgXu3IhUOSdDte+WO8xARxRn7ajsDHJj5ggrGey
   jvtMCnRV9w6ISWgDAVSL9mUi3XccOXXxDMrPVMn+wxkX+xvUy/87dBqrz
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="306241980"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; 
   d="scan'208";a="306241980"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2023 07:27:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="725896466"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; 
   d="scan'208";a="725896466"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 25 Jan 2023 07:27:49 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pKhgg-00Euyy-2v;
        Wed, 25 Jan 2023 17:27:46 +0200
Date:   Wed, 25 Jan 2023 17:27:46 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Shawn Tu <shawnx.tu@intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v7 5/7] media: i2c: add DS90UB960 driver
Message-ID: <Y9FKcoVlgUWR4rhn@smile.fi.intel.com>
References: <20230118124031.788940-1-tomi.valkeinen@ideasonboard.com>
 <20230118124031.788940-6-tomi.valkeinen@ideasonboard.com>
 <Y8gUuqLBXsXQoNUC@smile.fi.intel.com>
 <aba49d82-c76f-7ff2-751c-d1be7b8f3bca@ideasonboard.com>
 <Y8rFh6zO7Hp9mLxE@smile.fi.intel.com>
 <4286abe2-f23f-d4c9-ef18-f351af7a3a8b@ideasonboard.com>
 <Y9EcRlooHwIjOqiZ@smile.fi.intel.com>
 <cad92dbb-43ef-fa8c-1962-13c4a8578899@ideasonboard.com>
 <Y9FBlMl4b3l1zVck@smile.fi.intel.com>
 <5d208710-f284-e6e9-18dc-f5ef63a9ea44@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d208710-f284-e6e9-18dc-f5ef63a9ea44@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 25, 2023 at 05:14:59PM +0200, Tomi Valkeinen wrote:
> On 25/01/2023 16:49, Andy Shevchenko wrote:
> > On Wed, Jan 25, 2023 at 03:33:35PM +0200, Tomi Valkeinen wrote:
> > > On 25/01/2023 14:10, Andy Shevchenko wrote:
> > > > On Wed, Jan 25, 2023 at 01:15:34PM +0200, Tomi Valkeinen wrote:
> > > > > On 20/01/2023 18:47, Andy Shevchenko wrote:

...

> > > > > > > > > +	ret = fwnode_property_read_u32(link_fwnode, "ti,eq-level", &eq_level);
> > > > > > > > > +	if (ret) {
> > > > > > > > > +		if (ret != -EINVAL) {
> > > > > > > > > +			dev_err(dev, "rx%u: failed to read 'ti,eq-level': %d\n",
> > > > > > > > > +				nport, ret);
> > > > > > > > > +			return ret;
> > > > > > > > > +		}
> > > > > > 
> > > > > > This seems like trying to handle special cases, if you want it to be optional,
> > > > > > why not ignoring all errors?
> > > > > 
> > > > > I don't follow. Why would we ignore all errors even if the property is
> > > > > optional? If there's a failure in reading the property, or checking if it
> > > > > exists or not, surely that's an actual error to be handled, not to be
> > > > > ignored?
> > > > 
> > > > What the problem to ignore them?
> > > 
> > > Well, probably nothing will explode if we just ignore them. But... Why would
> > > we ignore them?
> > > 
> > > > But if you are really pedantic about it, perhaps the proper way is to add
> > > > 
> > > > fwnode_property_*_optional()
> > > > 
> > > > APIs to the set where you take default and return 0 in case default had been
> > > > used for the absent property.
> > > 
> > > Perhaps, but I don't have a default value here.
> > 
> > It's impossible. You have one. 0 is also can be default.
> 
> No, I either have the value ("eq-level"), or it's undefined, not used,
> doesn't exist. There's no default eq-level.
> 
> > > In any case, I'm not quite sure what you are arguing here. Is it just that
> > > you don't think the error check is necessary and should be dropped?
> > 
> > Yes, I do not see the value of these complex error checking.
> > Dropping that makes it KISS. I.o.w. why do we care about errors
> > if the property is optional? Make it mandatory otherwise.
> 
> If the call fails, there's an error somewhere. Maybe the user tried to
> define eq-level, but something is wrong. Isn't it better to catch that
> error, rather than ignoring it, leaving the user wonder why things don't
> work as he expects?

I expressed my opinion, if you and maintainers think otherwise, fine.
I don't won't spend more time on this :-)

> > > > > > > > > +	} else if (eq_level > UB960_MAX_EQ_LEVEL) {
> > > > > > > > > +		dev_err(dev, "rx%u: illegal 'ti,eq-level' value: %d\n", nport,
> > > > > > > > > +			eq_level);
> > > > > > 
> > > > > > This part is a validation of DT again, but we discussed above this.
> > > > > > 
> > > > > > > > > +	} else {
> > > > > > > > > +		rxport->eq.manual_eq = true;
> > > > > > > > > +		rxport->eq.manual.eq_level = eq_level;
> > > > > > > > > +	}

...

> > > > > > > > > +struct ds90ub9xx_platform_data {
> > > > > > > > > +	u32 port;
> > > > > > > > > +	struct i2c_atr *atr;
> > > > > > > > > +	unsigned long bc_rate;
> > > > > > > > 
> > > > > > > > Not sure why we need this to be public except, probably, atr...
> > > > > > > 
> > > > > > > The port and atr are used by the serializers, for atr. The bc_rate is used
> > > > > > > by the serializers to figure out the clocking (they may use the FPD-Link's
> > > > > > > frequency internally).
> > > > > > 
> > > > > > The plain numbers can be passed as device properties. That's why the question
> > > > > > about platform data. Platform data in general is discouraged to be used in a
> > > > > > new code.
> > > > > 
> > > > > Device properties, as in, coming from DT?
> > > > 
> > > >   From anywhere.
> > > > 
> > > > > The port could be in the DT, but
> > > > > the others are not hardware properties.
> > > > 
> > > > Why do we need them? For example, bc_rate.
> > > 
> > > The atr pointer is needed so that the serializers (ub913, ub953) can add
> > > their i2c adapter to the deserializer's i2c-atr. The port is also needed for
> > > that.
> > > 
> > > The bc rate (back-channel rate) is the FPD-Link back-channel rate which the
> > > serializers use for various functionalities. At the moment only the ub953
> > > uses it for calculating an output clock rate.
> > > 
> > > The bc-rate could be implemented using the clock framework, even if it's not
> > > quite a plain clock. I had that code at some point, but it felt a bit off
> > > and as we needed the pdata for the ATR, I added the bc-rate there.
> > 
> > And I don't see why it is not a property of the device.
> 
> It with a "property of the device" you mean a hardware property, it's not
> because we don't know it, it can be changed at runtime. It's not supposed to
> change after probing the serializer, but up to that point it can change.

Yes, which is still property of the device, isn't it?

> > > > > Yes, I don't like using platform data. We need some way to pass information
> > > > > between the drivers.
> > > > 
> > > > Device properties allow that and targeting to remove the legacy platform data
> > > > in zillions of the drivers.
> > > 
> > > Do you have any pointers to guide me into the right direction? I couldn't
> > > find anything with some grepping and googling.
> > > 
> > > If you mean "device properties" as in ACPI, and so similar to DT properties,
> > > aren't those hardware properties? Only the port here is about the hardware.
> > 
> > About hardware, or PCB, or as quirks for missing DT/ACPI/any FW properties,
> > like clock rates.
> > 
> > The Linux kernel layer for that is called software nodes. The rough
> > approximation to see where and how it's being used can be achieved
> > by grepping for specific macros:
> > 
> > 	git grep -lw PROPERTY_ENTRY_.*
> > 
> > E.g. arch/arm/mach-tegra/board-paz00.c tegra_paz00_wifikill_init()
> > implementation.
> 
> Thanks, I'll have a look. But I presume we can only pass "plain" values, so
> it won't work for the ATR pointer anyway.

Yes, that's what I have told at the very beginning when answering to your
patch.

But I probably don't understand the ATR structure and what exactly we need to
pass to it, perhaps it also can be replaced with properties (note, that we have
some interesting ones that called references, which is an alternative to DT
phandle).

-- 
With Best Regards,
Andy Shevchenko


