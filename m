Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DC7472C98D
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 17:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236803AbjFLPQE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jun 2023 11:16:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234310AbjFLPQD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jun 2023 11:16:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 699E58F
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 08:16:01 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5318FE4;
        Mon, 12 Jun 2023 17:15:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686582930;
        bh=1yUArWEb4M6ZzLbj8hNkoyTneC2dE6WU2HFfBunQ3aI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gRrerg9w6LkArx8m5EJLMfIWwhQVyRWkV9AsSoPBOo603JSLRIt+SOQHob6LoQg4u
         VOXHuzBzcHax7D+Yo/kyy4gLkLMF5HMnSwgD2X1B5bkNtfsSmElgsU3LkXQzt2izOO
         r1qw6nMkJWRlv5oB5X/yxKPDJ9RAkIY/usBF8VqM=
Date:   Mon, 12 Jun 2023 18:16:00 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH 1/3] media: Add MIPI CCI register access helper functions
Message-ID: <20230612151600.GF23921@pendragon.ideasonboard.com>
References: <20230606165808.70751-1-hdegoede@redhat.com>
 <20230606165808.70751-2-hdegoede@redhat.com>
 <20230607181855.GM5058@pendragon.ideasonboard.com>
 <b558aac9-0a34-ecca-57b0-d132af8cdefb@redhat.com>
 <20230608102725.GN5058@pendragon.ideasonboard.com>
 <cb020702-a112-22ad-39aa-56417633fc56@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cb020702-a112-22ad-39aa-56417633fc56@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Jun 12, 2023 at 03:48:01PM +0200, Hans de Goede wrote:
> On 6/8/23 12:27, Laurent Pinchart wrote:
> > On Wed, Jun 07, 2023 at 09:01:40PM +0200, Hans de Goede wrote:
> >> On 6/7/23 20:18, Laurent Pinchart wrote:
> 
> <snip>
> 
> >>>> +int cci_update_bits(struct regmap *map, u32 reg, u32 mask, u32 val, int *err)
> >>>> +{
> >>>> +	int width, ret;
> >>>> +	u32 readval;
> >>>> +
> >>>> +	if (err && *err)
> >>>> +		return *err;
> >>>> +
> >>>> +	/*
> >>>> +	 * For single byte updates use regmap_update_bits(), this uses
> >>>> +	 * the regmap-lock to protect against other read-modify-writes racing.
> >>>> +	 */
> >>>> +	width = (reg & CCI_REG_WIDTH_MASK) >> CCI_REG_WIDTH_SHIFT;
> >>>> +	if (width == cci_reg_8) {
> >>>> +		reg &= CCI_REG_ADDR_MASK;
> >>>> +		ret = regmap_update_bits(map, reg, mask, val);
> >>>> +		if (ret) {
> >>>> +			dev_err(regmap_get_device(map), "Error updating reg 0x%4x: %d\n", reg, ret);
> >>>> +			if (err)
> >>>> +				*err = ret;
> >>>> +		}
> >>>> +
> >>>> +		return ret;
> >>>> +	}
> >>>> +
> >>>> +	ret = cci_read(map, reg, &readval, err);
> >>>> +	if (ret)
> >>>> +		return ret;
> >>>> +
> >>>> +	val = (readval & ~mask) | (val & mask);
> >>>> +
> >>>> +	return cci_write(map, reg, val, err);
> >>>
> >>> Unless I'm mistaken, the regmap cache isn't used. This makes update
> >>> operations fairly costly due to the read. Could that be improved ?
> >>
> >> The problem is that some registers may be volatile,
> >> think e.g. expsoure on a sensor where auto-exposure is supported.
> >>
> >> So normally drivers which want to use regmap caching, also
> >> provide a whole bunch of tables describing the registers
> >> (lists of volatile + list of writable + list of readable
> >> registers).
> >>
> >> So enabling caching is not trivial. I think that it would be best
> >> for drivers which want that to supply their own regmap_config config
> >> and directly call devm_regmap_init_i2c() if they then use
> >> the resulting regmaps with the existing cci_* helpers then caching
> >> will be used automatically.
> > 
> > Would there be a way to use the cache for update operations (as I think
> > we can consider that registers used in those operations won't be
> > volatile), and bypass it for standalone reads ?
> 
> There is not really a nice way to only use the cache for update operations.
> 
> I guess we could do something hacky like tell regmap to create a cache,
> then set the cache-bypass flag and drop the cache-bypass flag during
> update ops. But that really is abusing the regmap API.
> 
> Generally speaking update operations don't happen that often though,
> so IMHO hacking to get this cached is not worth it.

I2C reads are slow, so even if they're not very common, it would be nice
to avoid them. We can start without any caching and improve it later,
I'm fine with that.

> >>>> +}
> >>>> +EXPORT_SYMBOL_GPL(cci_update_bits);
> >>>> +
> >>>> +int cci_multi_reg_write(struct regmap *map, const struct reg_sequence *regs, int num_regs, int *err)
> >>>> +{
> >>>> +	int i, ret;
> >>>> +
> >>>> +	if (err && *err)
> >>>> +		return *err;
> >>>> +
> >>>> +	for (i = 0; i < num_regs; i++) {
> >>>> +		ret = cci_write(map, regs[i].reg, regs[i].def, err);
> >>>> +		if (ret)
> >>>> +			return ret;
> >>>> +
> >>>> +		if (regs[i].delay_us)
> >>>> +			fsleep(regs[i].delay_us);
> >>>
> >>> Do you have an immediate need for this ? If not, I'd drop support for
> >>> the delay, and add it later when and if needed. It will be easier to
> >>> discuss the API and use cases with a real user.
> >>
> >> This is a 1:1 mirror of regmap_multi_reg_write() note this uses
> >> the existing struct reg_sequence delay_us field and the:
> >>
> >> 		if (regs[i].delay_us)
> >> 			fsleep(regs[i].delay_us);
> >>
> >> is copied from the implementation of regmap_multi_reg_write()
> > 
> > The reason why I don't like it much as that such delays are often hacks
> > hidden in the middle of register arrays that should in many cases be
> > handled differently. I was hoping that, by not supporting them yet,
> > we'll have an easier time to get drivers right. Maybe I'm wrong.
> 
> I understand, but having this is more or less a downside of
> the choice to mirror the regmap API as close as possible.
> 
> As Sakari said, having the field there just to ignore it
> seems like a bad idea.

I'm not sure to agree here, if we see no valid use case for that field,
why would it be a bad idea to ignore it ? That shouldn't affect anyone.

> I think that this being abused is something to watch for during
> review, rather then enforcing it not being used in the CCI code.
>
> >>>> +	}
> >>>> +
> >>>> +	return 0;
> >>>> +}
> >>>> +EXPORT_SYMBOL_GPL(cci_multi_reg_write);
> >>>> +
> >>>> +struct regmap *cci_regmap_init_i2c(struct i2c_client *client, int reg_addr_bits)
> >>>> +{
> >>>> +	struct regmap_config config = {
> >>>> +		.reg_bits = reg_addr_bits,
> >>>> +		.val_bits = 8,
> >>>> +		.reg_format_endian = REGMAP_ENDIAN_BIG,
> >>>> +	};
> >>>> +
> >>>> +	return devm_regmap_init_i2c(client, &config);
> >>>> +}
> >>>> +EXPORT_SYMBOL_GPL(cci_regmap_init_i2c);
> >>>> +
> >>>> +MODULE_LICENSE("GPL");
> >>>> +MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
> >>>> diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
> >>>> new file mode 100644
> >>>> index 000000000000..69b8a7c4a013
> >>>> --- /dev/null
> >>>> +++ b/include/media/v4l2-cci.h
> >>>> @@ -0,0 +1,109 @@
> >>>> +/* SPDX-License-Identifier: GPL-2.0 */
> >>>> +/*
> >>>> + * MIPI Camera Control Interface (CCI) register access helpers.
> >>>> + *
> >>>> + * Copyright (C) 2023 Hans de Goede <hansg@kernel.org>
> >>>> + */
> >>>> +#ifndef _V4L2_CCI_H
> >>>> +#define _V4L2_CCI_H
> >>>> +
> >>>> +#include <linux/regmap.h>
> >>>> +#include <linux/types.h>
> >>>> +
> >>>> +/*
> >>>> + * Note cci_reg_8 deliberately is 0, not 1, so that raw
> >>>> + * (not wrapped in a CCI_REG*() macro) register addresses
> >>>> + * do 8 bit wide accesses. This allows unchanged use of register
> >>>> + * initialization lists of raw address, value pairs which only
> >>>> + * do 8 bit width accesses. Which makes porting drivers easier.
> >>>
> >>> It does, but at the same time, it prevents catching errors caused by
> >>> incorrect register macros. I'm tempted to consider that catching those
> >>> errors is more important.
> >>>
> >>>> + */
> >>>> +enum cci_reg_type {
> >>>> +	cci_reg_8 = 0,
> >>>> +	cci_reg_16,
> >>>> +	cci_reg_24,
> >>>> +	cci_reg_32,
> >>>> +};
> >>>> +
> >>>> +/*
> >>>> + * Macros to define register address with the register width encoded
> >>>> + * into the higher bits. CCI_REG8() is a no-op so its use is optional.
> >>>
> >>> Even if it's a no-op I'd prefer making its use mandatory. It makes
> >>> driver code more explicit, and eases catching issues during review.
> >>
> >> The problem is that almost all sensor drivers contain long list
> >> of register-address, -val pairs which they send to their own custom
> >> regmap_multi_reg_write()
> >>
> >> See e.g. the drivers/media/i2c/imx219.c (to stick with the imx
> >> theme from your imx290 request) this has a lot of quite long
> >> struct imx219_reg arrays with raw initializers.
> >>
> >> Often some or all of these registers in such list are
> >> undocumented (if we have access to a datasheet at all),
> >> so we simply don't know the register width.
> >>
> >> So arguably adding CCI_REG8(x) around all the addresses
> >> here is wrong, since this suggests we know the register
> >> width.
> >>
> >> With the current proposal to have 0 mean both unset and 8bit
> >> width this kinda register lists just work and converting
> >> the driver becomes just a matter of replacing e.g.
> >> imx219_write_regs() with cci_multi_reg_write().
> >>
> >> Where as otherwise we would need to add CCI_REG8(x)
> >> around the addresses which:
> >>
> >> a) Suggests we actually know the register width which
> >>    we often do not know at all
> >>
> >> b) causes a ton of needless churn
> >>
> >> so I would very much prefer to keep this as as and
> >> allow unmarked register addresses.
> >>
> >> As for the CCI_REG8(x) being useful as an annotation
> >> during review you are of course free to enforce its
> >> use during review. And note that I did use it for
> >> all the OV2680_REG_FOO defines in both ov2680 conversions.
> >>
> >> I do agree enforcing its use makes sense for individual
> >> register address defines. The reason to make it optional
> >> and the place where I want it to be optional is for
> >> the array of raw register-addr + initializer-val pairs
> >> case.
> > 
> > For register arrays, I'm fine with that. For register macros, I don't
> > want to see
> > 
> > #define MY_WELL_DEFINED_8B_REG		0x1234
> > 
> > For those I want drivers to use CCI_REG8(). It seems we're on the same
> > page :-)
> 
> Right, but if we want cci_multi_reg_write() to work with register
> arrays without the CCI_REG8() macros then the code needs to stay
> as is and we cannot enforce use of the macro by erroring out
> if it is not used.

Could we have an internal __cci_reg_write() that doesn't check the size,
and a cci_reg_write() wrapper that does ?

-- 
Regards,

Laurent Pinchart
