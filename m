Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2C7E72C933
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 17:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238976AbjFLPDc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jun 2023 11:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239125AbjFLPDU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jun 2023 11:03:20 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3F6512A
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 08:03:16 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4EDDCE6;
        Mon, 12 Jun 2023 17:02:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686582166;
        bh=JiBKenmc0qLgxvsgMp3ckM2LDQTU7vw9WVW4FvPd8DE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oNFqVnI0GHO9GAoIjDGv0aQ7Um6fhHxawe3EUFwNZHPvyz2ifTC9CpGgOYLFUadHR
         jRjTMbkpqNdWTxfAzLBhVvV1AmO+/zcjjjOf0xmcNUsIFCPeAHfZuzTqghlqJ8rnzV
         P7kPgmaR0t4B/SkQ7tIpwBzSu87gPG66J9pMAfb0=
Date:   Mon, 12 Jun 2023 18:03:15 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH 1/3] media: Add MIPI CCI register access helper functions
Message-ID: <20230612150315.GE23921@pendragon.ideasonboard.com>
References: <20230606165808.70751-1-hdegoede@redhat.com>
 <20230606165808.70751-2-hdegoede@redhat.com>
 <20230607181855.GM5058@pendragon.ideasonboard.com>
 <b558aac9-0a34-ecca-57b0-d132af8cdefb@redhat.com>
 <20230608102725.GN5058@pendragon.ideasonboard.com>
 <ZIG1CRWigbnSJQG8@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZIG1CRWigbnSJQG8@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Thu, Jun 08, 2023 at 11:01:29AM +0000, Sakari Ailus wrote:
> On Thu, Jun 08, 2023 at 01:27:25PM +0300, Laurent Pinchart wrote:
> > On Wed, Jun 07, 2023 at 09:01:40PM +0200, Hans de Goede wrote:
> > > On 6/7/23 20:18, Laurent Pinchart wrote:
> > > > On Tue, Jun 06, 2023 at 06:58:06PM +0200, Hans de Goede wrote:
> > > >> The CSI2 specification specifies a standard method to access camera sensor
> > > >> registers called "Camera Control Interface (CCI)".
> > > >>
> > > >> This uses either 8 or 16 bit (big-endian wire order) register addresses
> > > >> and supports 8, 16, 24 or 32 bit (big-endian wire order) register widths.
> > > > 
> > > > I think there are some sensors that also have 64-bit registers, but we
> > > > can deal with that later.
> > > > 
> > > >> Currently a lot of Linux camera sensor drivers all have their own custom
> > > >> helpers for this, often copy and pasted from other drivers.
> > > >>
> > > >> Add a set of generic helpers for this so that all sensor drivers can
> > > >> switch to a single common implementation.
> > > >>
> > > >> These helpers take an extra optional "int *err" function parameter,
> > > >> this can be used to chain a bunch of register accesses together with
> > > >> only a single error check at the end, rather then needing to error
> > > >> check each individual register access. The first failing call will
> > > >> set the contents of err to a non 0 value and all other calls will
> > > >> then become no-ops.
> > > >>
> > > >> Link: https://lore.kernel.org/linux-media/59aefa7f-7bf9-6736-6040-39551329cd0a@redhat.com/
> > > >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > > >> ---
> > > >>  Documentation/driver-api/media/v4l2-cci.rst  |   5 +
> > > >>  Documentation/driver-api/media/v4l2-core.rst |   1 +
> > > >>  drivers/media/v4l2-core/Kconfig              |   5 +
> > > >>  drivers/media/v4l2-core/Makefile             |   1 +
> > > >>  drivers/media/v4l2-core/v4l2-cci.c           | 142 +++++++++++++++++++
> > > >>  include/media/v4l2-cci.h                     | 109 ++++++++++++++
> > > >>  6 files changed, 263 insertions(+)
> > > >>  create mode 100644 Documentation/driver-api/media/v4l2-cci.rst
> > > >>  create mode 100644 drivers/media/v4l2-core/v4l2-cci.c
> > > >>  create mode 100644 include/media/v4l2-cci.h
> > > >>
> > > >> diff --git a/Documentation/driver-api/media/v4l2-cci.rst b/Documentation/driver-api/media/v4l2-cci.rst
> > > >> new file mode 100644
> > > >> index 000000000000..dd297a40ed20
> > > >> --- /dev/null
> > > >> +++ b/Documentation/driver-api/media/v4l2-cci.rst
> > > >> @@ -0,0 +1,5 @@
> > > >> +.. SPDX-License-Identifier: GPL-2.0
> > > >> +
> > > >> +V4L2 CCI kAPI
> > > >> +^^^^^^^^^^^^^
> > > >> +.. kernel-doc:: include/media/v4l2-cci.h
> > > >> diff --git a/Documentation/driver-api/media/v4l2-core.rst b/Documentation/driver-api/media/v4l2-core.rst
> > > >> index 1a8c4a5f256b..239045ecc8f4 100644
> > > >> --- a/Documentation/driver-api/media/v4l2-core.rst
> > > >> +++ b/Documentation/driver-api/media/v4l2-core.rst
> > > >> @@ -22,6 +22,7 @@ Video4Linux devices
> > > >>      v4l2-mem2mem
> > > >>      v4l2-async
> > > >>      v4l2-fwnode
> > > >> +    v4l2-cci
> > > >>      v4l2-rect
> > > >>      v4l2-tuner
> > > >>      v4l2-common
> > > >> diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
> > > >> index 348559bc2468..523ba243261d 100644
> > > >> --- a/drivers/media/v4l2-core/Kconfig
> > > >> +++ b/drivers/media/v4l2-core/Kconfig
> > > >> @@ -74,6 +74,11 @@ config V4L2_FWNODE
> > > >>  config V4L2_ASYNC
> > > >>  	tristate
> > > >>  
> > > >> +config V4L2_CCI
> > > >> +	tristate
> > > >> +	depends on I2C
> > > >> +	select REGMAP_I2C
> > > >> +
> > > >>  # Used by drivers that need Videobuf modules
> > > >>  config VIDEOBUF_GEN
> > > >>  	tristate
> > > >> diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
> > > >> index 41d91bd10cf2..be2551705755 100644
> > > >> --- a/drivers/media/v4l2-core/Makefile
> > > >> +++ b/drivers/media/v4l2-core/Makefile
> > > >> @@ -25,6 +25,7 @@ videodev-$(CONFIG_VIDEO_V4L2_I2C) += v4l2-i2c.o
> > > >>  # (e. g. LC_ALL=C sort Makefile)
> > > >>  
> > > >>  obj-$(CONFIG_V4L2_ASYNC) += v4l2-async.o
> > > >> +obj-$(CONFIG_V4L2_CCI) += v4l2-cci.o
> > > >>  obj-$(CONFIG_V4L2_FLASH_LED_CLASS) += v4l2-flash-led-class.o
> > > >>  obj-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
> > > >>  obj-$(CONFIG_V4L2_H264) += v4l2-h264.o
> > > >> diff --git a/drivers/media/v4l2-core/v4l2-cci.c b/drivers/media/v4l2-core/v4l2-cci.c
> > > >> new file mode 100644
> > > >> index 000000000000..21207d137dbe
> > > >> --- /dev/null
> > > >> +++ b/drivers/media/v4l2-core/v4l2-cci.c
> > > >> @@ -0,0 +1,142 @@
> > > >> +// SPDX-License-Identifier: GPL-2.0
> > > >> +/*
> > > >> + * MIPI Camera Control Interface (CCI) register access helpers.
> > > >> + *
> > > >> + * Copyright (C) 2023 Hans de Goede <hansg@kernel.org>
> > > >> + */
> > > >> +
> > > >> +#include <linux/delay.h>
> > > >> +#include <linux/dev_printk.h>
> > > >> +#include <linux/module.h>
> > > >> +#include <linux/regmap.h>
> > > >> +
> > > >> +#include <media/v4l2-cci.h>
> > > >> +
> > > >> +int cci_read(struct regmap *map, u32 reg, u32 *val, int *err)
> > > >> +{
> > > >> +	int i, len, ret;
> > > >> +	u8 buf[4];
> > > >> +
> > > >> +	if (err && *err)
> > > >> +		return *err;
> > > >> +
> > > >> +	/* Set len to register width in bytes */
> > > >> +	len = ((reg & CCI_REG_WIDTH_MASK) >> CCI_REG_WIDTH_SHIFT) + 1;
> > > >> +	reg &= CCI_REG_ADDR_MASK;
> > > >> +
> > > >> +	ret = regmap_bulk_read(map, reg, buf, len);
> > > >> +	if (ret) {
> > > >> +		dev_err(regmap_get_device(map), "Error reading reg 0x%4x: %d\n", reg, ret);
> > > >> +		if (err)
> > > >> +			*err = ret;
> > > >> +
> > > >> +		return ret;
> > > >> +	}
> > > >> +
> > > >> +	*val = 0;
> > > >> +	for (i = 0; i < len; i++) {
> > > >> +		*val <<= 8;
> > > >> +		*val |= buf[i];
> > > >> +	}
> > > >> +
> > > >> +	return 0;
> > > >> +}
> > > >> +EXPORT_SYMBOL_GPL(cci_read);
> > > >> +
> > > >> +int cci_write(struct regmap *map, u32 reg, u32 val, int *err)
> > > >> +{
> > > >> +	int i, len, ret;
> > > >> +	u8 buf[4];
> > > >> +
> > > >> +	if (err && *err)
> > > >> +		return *err;
> > > >> +
> > > >> +	/* Set len to register width in bytes */
> > > >> +	len = ((reg & CCI_REG_WIDTH_MASK) >> CCI_REG_WIDTH_SHIFT) + 1;
> > > >> +	reg &= CCI_REG_ADDR_MASK;
> > > >> +
> > > >> +	for (i = 0; i < len; i++) {
> > > >> +		buf[len - i - 1] = val & 0xff;
> > > >> +		val >>= 8;
> > > >> +	}
> > > >> +
> > > >> +	ret = regmap_bulk_write(map, reg, buf, len);
> > > >> +	if (ret) {
> > > >> +		dev_err(regmap_get_device(map), "Error writing reg 0x%4x: %d\n", reg, ret);
> > > >> +		if (err)
> > > >> +			*err = ret;
> > > >> +	}
> > > >> +
> > > >> +	return ret;
> > > >> +}
> > > >> +EXPORT_SYMBOL_GPL(cci_write);
> > > >> +
> > > >> +int cci_update_bits(struct regmap *map, u32 reg, u32 mask, u32 val, int *err)
> > > >> +{
> > > >> +	int width, ret;
> > > >> +	u32 readval;
> > > >> +
> > > >> +	if (err && *err)
> > > >> +		return *err;
> > > >> +
> > > >> +	/*
> > > >> +	 * For single byte updates use regmap_update_bits(), this uses
> > > >> +	 * the regmap-lock to protect against other read-modify-writes racing.
> > > >> +	 */
> > > >> +	width = (reg & CCI_REG_WIDTH_MASK) >> CCI_REG_WIDTH_SHIFT;
> > > >> +	if (width == cci_reg_8) {
> > > >> +		reg &= CCI_REG_ADDR_MASK;
> > > >> +		ret = regmap_update_bits(map, reg, mask, val);
> > > >> +		if (ret) {
> > > >> +			dev_err(regmap_get_device(map), "Error updating reg 0x%4x: %d\n", reg, ret);
> > > >> +			if (err)
> > > >> +				*err = ret;
> > > >> +		}
> > > >> +
> > > >> +		return ret;
> > > >> +	}
> > > >> +
> > > >> +	ret = cci_read(map, reg, &readval, err);
> > > >> +	if (ret)
> > > >> +		return ret;
> > > >> +
> > > >> +	val = (readval & ~mask) | (val & mask);
> > > >> +
> > > >> +	return cci_write(map, reg, val, err);
> > > > 
> > > > Unless I'm mistaken, the regmap cache isn't used. This makes update
> > > > operations fairly costly due to the read. Could that be improved ?
> > > 
> > > The problem is that some registers may be volatile,
> > > think e.g. expsoure on a sensor where auto-exposure is supported.
> > > 
> > > So normally drivers which want to use regmap caching, also
> > > provide a whole bunch of tables describing the registers
> > > (lists of volatile + list of writable + list of readable
> > > registers).
> > > 
> > > So enabling caching is not trivial. I think that it would be best
> > > for drivers which want that to supply their own regmap_config config
> > > and directly call devm_regmap_init_i2c() if they then use
> > > the resulting regmaps with the existing cci_* helpers then caching
> > > will be used automatically.
> > 
> > Would there be a way to use the cache for update operations (as I think
> > we can consider that registers used in those operations won't be
> > volatile), and bypass it for standalone reads ?
> 
> Could we rely on regmap on this? It provides a way to tell which registers
> are volatile. Very few of these drivers would get any benefit from caching
> anyway (or even use update_bits()).

Yes we could I suppose. I've never been a big fan of that part of the
regmap API as it's cumbersome to use when dealing with devices that have
lots of registers, like camera sensors usually do. Volatile registers
tend to be scattered around the address space, making the volatile_table
lookup inefficient, and the volatile_reg function wouldn't be great
either. I could live with that I suppose, but given that I think we can
expect read-modify-write operations to never operate on a volatile
register, and plain read operations to nearly always do (with the
exception of read-only version registers that are read once at probe
time only), it would be a bit of a shame to rely on the less efficient
regmap volatile support.

> > > >> +}
> > > >> +EXPORT_SYMBOL_GPL(cci_update_bits);
> > > >> +
> > > >> +int cci_multi_reg_write(struct regmap *map, const struct reg_sequence *regs, int num_regs, int *err)
> > > >> +{
> > > >> +	int i, ret;
> > > >> +
> > > >> +	if (err && *err)
> > > >> +		return *err;
> > > >> +
> > > >> +	for (i = 0; i < num_regs; i++) {
> > > >> +		ret = cci_write(map, regs[i].reg, regs[i].def, err);
> > > >> +		if (ret)
> > > >> +			return ret;
> > > >> +
> > > >> +		if (regs[i].delay_us)
> > > >> +			fsleep(regs[i].delay_us);
> > > > 
> > > > Do you have an immediate need for this ? If not, I'd drop support for
> > > > the delay, and add it later when and if needed. It will be easier to
> > > > discuss the API and use cases with a real user.
> > > 
> > > This is a 1:1 mirror of regmap_multi_reg_write() note this uses
> > > the existing struct reg_sequence delay_us field and the:
> > > 
> > > 		if (regs[i].delay_us)
> > > 			fsleep(regs[i].delay_us);
> > > 
> > > is copied from the implementation of regmap_multi_reg_write()
> > 
> > The reason why I don't like it much as that such delays are often hacks
> > hidden in the middle of register arrays that should in many cases be
> > handled differently. I was hoping that, by not supporting them yet,
> > we'll have an easier time to get drivers right. Maybe I'm wrong.
> 
> It's not uncommon for a sensor to require e.g. a given amount of time to
> recover from software reset. Then again, embedding software in a register
> list can hardly be described as a good practice. There maybe other such
> cases, too.

That's exactly my concern, I'd like to avoid giving an easy option for
people to embed reset actions in a large registers table :-) I don't
object to the feature if we find valid use cases for it.

> But the field already exists in the struct. I don't object acting based on
> its contents as such.
> 
> > > >> +	}
> > > >> +
> > > >> +	return 0;
> > > >> +}
> > > >> +EXPORT_SYMBOL_GPL(cci_multi_reg_write);
> > > >> +
> > > >> +struct regmap *cci_regmap_init_i2c(struct i2c_client *client, int reg_addr_bits)
> > > >> +{
> > > >> +	struct regmap_config config = {
> > > >> +		.reg_bits = reg_addr_bits,
> > > >> +		.val_bits = 8,
> > > >> +		.reg_format_endian = REGMAP_ENDIAN_BIG,
> > > >> +	};
> > > >> +
> > > >> +	return devm_regmap_init_i2c(client, &config);
> > > >> +}
> > > >> +EXPORT_SYMBOL_GPL(cci_regmap_init_i2c);
> > > >> +
> > > >> +MODULE_LICENSE("GPL");
> > > >> +MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
> > > >> diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
> > > >> new file mode 100644
> > > >> index 000000000000..69b8a7c4a013
> > > >> --- /dev/null
> > > >> +++ b/include/media/v4l2-cci.h
> > > >> @@ -0,0 +1,109 @@
> > > >> +/* SPDX-License-Identifier: GPL-2.0 */
> > > >> +/*
> > > >> + * MIPI Camera Control Interface (CCI) register access helpers.
> > > >> + *
> > > >> + * Copyright (C) 2023 Hans de Goede <hansg@kernel.org>
> > > >> + */
> > > >> +#ifndef _V4L2_CCI_H
> > > >> +#define _V4L2_CCI_H
> > > >> +
> > > >> +#include <linux/regmap.h>
> > > >> +#include <linux/types.h>
> > > >> +
> > > >> +/*
> > > >> + * Note cci_reg_8 deliberately is 0, not 1, so that raw
> > > >> + * (not wrapped in a CCI_REG*() macro) register addresses
> > > >> + * do 8 bit wide accesses. This allows unchanged use of register
> > > >> + * initialization lists of raw address, value pairs which only
> > > >> + * do 8 bit width accesses. Which makes porting drivers easier.
> > > > 
> > > > It does, but at the same time, it prevents catching errors caused by
> > > > incorrect register macros. I'm tempted to consider that catching those
> > > > errors is more important.
> > > > 
> > > >> + */
> > > >> +enum cci_reg_type {
> > > >> +	cci_reg_8 = 0,
> > > >> +	cci_reg_16,
> > > >> +	cci_reg_24,
> > > >> +	cci_reg_32,
> > > >> +};
> > > >> +
> > > >> +/*
> > > >> + * Macros to define register address with the register width encoded
> > > >> + * into the higher bits. CCI_REG8() is a no-op so its use is optional.
> > > > 
> > > > Even if it's a no-op I'd prefer making its use mandatory. It makes
> > > > driver code more explicit, and eases catching issues during review.
> > > 
> > > The problem is that almost all sensor drivers contain long list
> > > of register-address, -val pairs which they send to their own custom
> > > regmap_multi_reg_write()
> > >
> > > See e.g. the drivers/media/i2c/imx219.c (to stick with the imx
> > > theme from your imx290 request) this has a lot of quite long
> > > struct imx219_reg arrays with raw initializers.
> > > 
> > > Often some or all of these registers in such list are
> > > undocumented (if we have access to a datasheet at all),
> > > so we simply don't know the register width.
> > > 
> > > So arguably adding CCI_REG8(x) around all the addresses
> > > here is wrong, since this suggests we know the register
> > > width.
> > > 
> > > With the current proposal to have 0 mean both unset and 8bit
> > > width this kinda register lists just work and converting
> > > the driver becomes just a matter of replacing e.g.
> > > imx219_write_regs() with cci_multi_reg_write().
> > > 
> > > Where as otherwise we would need to add CCI_REG8(x)
> > > around the addresses which:
> > > 
> > > a) Suggests we actually know the register width which
> > >    we often do not know at all
> > > 
> > > b) causes a ton of needless churn
> > > 
> > > so I would very much prefer to keep this as as and
> > > allow unmarked register addresses.
> > > 
> > > As for the CCI_REG8(x) being useful as an annotation
> > > during review you are of course free to enforce its
> > > use during review. And note that I did use it for
> > > all the OV2680_REG_FOO defines in both ov2680 conversions.
> > > 
> > > I do agree enforcing its use makes sense for individual
> > > register address defines. The reason to make it optional
> > > and the place where I want it to be optional is for
> > > the array of raw register-addr + initializer-val pairs
> > > case.
> > 
> > For register arrays, I'm fine with that. For register macros, I don't
> > want to see
> > 
> > #define MY_WELL_DEFINED_8B_REG		0x1234
> > 
> > For those I want drivers to use CCI_REG8(). It seems we're on the same
> > page :-)
> 
> For a register list based sensor driver, I don't really mind even missing
> this in the register lists. Using that macro doesn't help when the problem
> really is a very long list of random-looking numbers.

I think we agree here, the place where I want to see the macros being
used without exceptions is when accessing individual registers.

> Better drivers should of course use the macro.

-- 
Regards,

Laurent Pinchart
