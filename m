Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C98073096A
	for <lists+linux-media@lfdr.de>; Wed, 14 Jun 2023 22:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233546AbjFNUtG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jun 2023 16:49:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232957AbjFNUtF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 16:49:05 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36F932686
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 13:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686775743; x=1718311743;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nOP4Y+HzL4iA5aR7Erh+yWFF5RrWMi2saflK72MbpAk=;
  b=fLgSXhKtWHe/Bfm0m0zTIbWAJXV6b5C4abCWBvszMsSqTg9FXqz3sORj
   uvBCVPzTX3EY2T2J0l3kPuO+0OodQG8jNpB9c8Ephydk13I8WIkf7oe4O
   IY30HBhwv6bFMjanim0gJF+EfcSZJN+3ENEV8z46A5y/wftOUoJ9YvfVI
   blhTYxg+zC7baHIBHH7PMo8nbuRqH/tGxXvDtlv9pfLXOn2CJ6uznL2sC
   htm7OCubWAk7Z45BcRbwwmeaxMYqI3LdDl7fgcfGwGoDvOe5eX3DVH7jE
   uUIzH8XoQVyfqDRXhtPmv6pY2GnAn8p9zEn5SUb6Sr5TxhMaXxwkpiYfs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="361211114"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="361211114"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 13:49:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="689521430"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="689521430"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 13:49:00 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id C295A120C62;
        Wed, 14 Jun 2023 23:39:56 +0300 (EEST)
Date:   Wed, 14 Jun 2023 20:39:56 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/5] media: Add MIPI CCI register access helper
 functions
Message-ID: <ZIolnOxs29H8EUmC@kekkonen.localdomain>
References: <20230614192343.57280-1-hdegoede@redhat.com>
 <20230614192343.57280-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230614192343.57280-2-hdegoede@redhat.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the update.

On Wed, Jun 14, 2023 at 09:23:39PM +0200, Hans de Goede wrote:
> The CSI2 specification specifies a standard method to access camera sensor
> registers called "Camera Control Interface (CCI)".
> 
> This uses either 8 or 16 bit (big-endian wire order) register addresses
> and supports 8, 16, 24 or 32 bit (big-endian wire order) register widths.
> 
> Currently a lot of Linux camera sensor drivers all have their own custom
> helpers for this, often copy and pasted from other drivers.
> 
> Add a set of generic helpers for this so that all sensor drivers can
> switch to a single common implementation.
> 
> These helpers take an extra optional "int *err" function parameter,
> this can be used to chain a bunch of register accesses together with
> only a single error check at the end, rather then needing to error
> check each individual register access. The first failing call will
> set the contents of err to a non 0 value and all other calls will
> then become no-ops.
> 
> Link: https://lore.kernel.org/linux-media/59aefa7f-7bf9-6736-6040-39551329cd0a@redhat.com/
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Drop cci_reg_type enum
> - Make having an encoded reg-width mandatory rather then using 0 to encode
>   8 bit width making reg-addresses without an encoded width default to
>   a width of 8
> - Add support for 64 bit wide registers
> - Introduce a new cci_reg_sequence struct with 64 bit reg values for 64 bit
>   support and without the delay_us field
> - Various kerneldoc updates
> - Stop supporting delays in cci_multi_reg_write()
> - Some includes cleanups
> - Disable regmap locking
> ---
>  Documentation/driver-api/media/v4l2-cci.rst  |   5 +
>  Documentation/driver-api/media/v4l2-core.rst |   1 +
>  drivers/media/v4l2-core/Kconfig              |   5 +
>  drivers/media/v4l2-core/Makefile             |   1 +
>  drivers/media/v4l2-core/v4l2-cci.c           | 157 +++++++++++++++++++
>  include/media/v4l2-cci.h                     | 121 ++++++++++++++
>  6 files changed, 290 insertions(+)
>  create mode 100644 Documentation/driver-api/media/v4l2-cci.rst
>  create mode 100644 drivers/media/v4l2-core/v4l2-cci.c
>  create mode 100644 include/media/v4l2-cci.h
> 
> diff --git a/Documentation/driver-api/media/v4l2-cci.rst b/Documentation/driver-api/media/v4l2-cci.rst
> new file mode 100644
> index 000000000000..dd297a40ed20
> --- /dev/null
> +++ b/Documentation/driver-api/media/v4l2-cci.rst
> @@ -0,0 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +V4L2 CCI kAPI
> +^^^^^^^^^^^^^
> +.. kernel-doc:: include/media/v4l2-cci.h
> diff --git a/Documentation/driver-api/media/v4l2-core.rst b/Documentation/driver-api/media/v4l2-core.rst
> index 1a8c4a5f256b..239045ecc8f4 100644
> --- a/Documentation/driver-api/media/v4l2-core.rst
> +++ b/Documentation/driver-api/media/v4l2-core.rst
> @@ -22,6 +22,7 @@ Video4Linux devices
>      v4l2-mem2mem
>      v4l2-async
>      v4l2-fwnode
> +    v4l2-cci
>      v4l2-rect
>      v4l2-tuner
>      v4l2-common
> diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
> index 348559bc2468..523ba243261d 100644
> --- a/drivers/media/v4l2-core/Kconfig
> +++ b/drivers/media/v4l2-core/Kconfig
> @@ -74,6 +74,11 @@ config V4L2_FWNODE
>  config V4L2_ASYNC
>  	tristate
>  
> +config V4L2_CCI
> +	tristate
> +	depends on I2C

This won't do anything if the dependent driver will select V4L2_CCI, will
it? I'd let the sensor driver depend on I2C instead. CCI is also supported
on I3C, for instance.

> +	select REGMAP_I2C

This is a good question.

How about adding V4L2_CCI_I2C that would select REGMAP_I2C?

> +
>  # Used by drivers that need Videobuf modules
>  config VIDEOBUF_GEN
>  	tristate
> diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
> index 41d91bd10cf2..be2551705755 100644
> --- a/drivers/media/v4l2-core/Makefile
> +++ b/drivers/media/v4l2-core/Makefile
> @@ -25,6 +25,7 @@ videodev-$(CONFIG_VIDEO_V4L2_I2C) += v4l2-i2c.o
>  # (e. g. LC_ALL=C sort Makefile)
>  
>  obj-$(CONFIG_V4L2_ASYNC) += v4l2-async.o
> +obj-$(CONFIG_V4L2_CCI) += v4l2-cci.o
>  obj-$(CONFIG_V4L2_FLASH_LED_CLASS) += v4l2-flash-led-class.o
>  obj-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
>  obj-$(CONFIG_V4L2_H264) += v4l2-h264.o
> diff --git a/drivers/media/v4l2-core/v4l2-cci.c b/drivers/media/v4l2-core/v4l2-cci.c
> new file mode 100644
> index 000000000000..94764f3ebc6c
> --- /dev/null
> +++ b/drivers/media/v4l2-core/v4l2-cci.c
> @@ -0,0 +1,157 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * MIPI Camera Control Interface (CCI) register access helpers.
> + *
> + * Copyright (C) 2023 Hans de Goede <hansg@kernel.org>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/delay.h>
> +#include <linux/dev_printk.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +
> +#include <asm/unaligned.h>
> +
> +#include <media/v4l2-cci.h>
> +
> +int cci_read(struct regmap *map, u32 reg, u64 *val, int *err)
> +{
> +	int len, ret;

len would look better unsigned.

> +	u8 buf[8];
> +
> +	if (err && *err)
> +		return *err;
> +
> +	len = FIELD_GET(CCI_REG_WIDTH_MASK, reg);
> +	reg = FIELD_GET(CCI_REG_ADDR_MASK, reg);
> +
> +	ret = regmap_bulk_read(map, reg, buf, len);
> +	if (ret) {
> +		dev_err(regmap_get_device(map), "Error reading reg 0x%4x: %d\n", reg, ret);
> +		goto out;
> +	}
> +
> +	switch (len) {
> +	case 1:
> +		*val = buf[0];
> +		break;
> +	case 2:
> +		*val = get_unaligned_be16(buf);
> +		break;
> +	case 3:
> +		*val = get_unaligned_be24(buf);
> +		break;
> +	case 4:
> +		*val = get_unaligned_be32(buf);
> +		break;
> +	case 8:
> +		*val = get_unaligned_be64(buf);
> +		break;
> +	default:
> +		dev_err(regmap_get_device(map), "Error invalid reg-width %d for reg 0x%04x\n",
> +			len, reg);
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +out:
> +	if (ret && err)
> +		*err = ret;
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(cci_read);
> +
> +int cci_write(struct regmap *map, u32 reg, u64 val, int *err)
> +{
> +	int len, ret;

Same here.

> +	u8 buf[8];
> +
> +	if (err && *err)
> +		return *err;
> +
> +	len = FIELD_GET(CCI_REG_WIDTH_MASK, reg);
> +	reg = FIELD_GET(CCI_REG_ADDR_MASK, reg);
> +
> +	switch (len) {
> +	case 1:
> +		buf[0] = val;
> +		break;
> +	case 2:
> +		put_unaligned_be16(val, buf);
> +		break;
> +	case 3:
> +		put_unaligned_be24(val, buf);
> +		break;
> +	case 4:
> +		put_unaligned_be32(val, buf);
> +		break;
> +	case 8:
> +		put_unaligned_be64(val, buf);
> +		break;
> +	default:
> +		dev_err(regmap_get_device(map), "Error invalid reg-width %d for reg 0x%04x\n",
> +			len, reg);
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	ret = regmap_bulk_write(map, reg, buf, len);
> +	if (ret)
> +		dev_err(regmap_get_device(map), "Error writing reg 0x%4x: %d\n", reg, ret);
> +
> +out:
> +	if (ret && err)
> +		*err = ret;
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(cci_write);
> +
> +int cci_update_bits(struct regmap *map, u32 reg, u64 mask, u64 val, int *err)
> +{
> +	u64 readval;
> +	int ret;
> +
> +	ret = cci_read(map, reg, &readval, err);
> +	if (ret)
> +		return ret;
> +
> +	val = (readval & ~mask) | (val & mask);
> +
> +	return cci_write(map, reg, val, err);
> +}
> +EXPORT_SYMBOL_GPL(cci_update_bits);
> +
> +int cci_multi_reg_write(struct regmap *map, const struct cci_reg_sequence *regs,
> +			int num_regs, int *err)
> +{
> +	int i, ret;

unsigned int i?

Same for num_regs.

> +
> +	for (i = 0; i < num_regs; i++) {
> +		ret = cci_write(map, regs[i].reg, regs[i].val, err);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(cci_multi_reg_write);
> +
> +struct regmap *cci_regmap_init_i2c(struct i2c_client *client, int reg_addr_bits)
> +{
> +	struct regmap_config config = {
> +		.reg_bits = reg_addr_bits,
> +		.val_bits = 8,
> +		.reg_format_endian = REGMAP_ENDIAN_BIG,
> +		.disable_locking = true,
> +	};
> +
> +	return devm_regmap_init_i2c(client, &config);
> +}
> +EXPORT_SYMBOL_GPL(cci_regmap_init_i2c);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
> diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
> new file mode 100644
> index 000000000000..5d8fdff086db
> --- /dev/null
> +++ b/include/media/v4l2-cci.h
> @@ -0,0 +1,121 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * MIPI Camera Control Interface (CCI) register access helpers.
> + *
> + * Copyright (C) 2023 Hans de Goede <hansg@kernel.org>
> + */
> +#ifndef _V4L2_CCI_H
> +#define _V4L2_CCI_H
> +
> +#include <linux/types.h>
> +
> +struct i2c_client;
> +struct reg_sequence;
> +struct regmap;
> +
> +/**
> + * struct cci_reg_sequence - An individual write from a sequence of CCI writes
> + *
> + * @reg: Register address, use CCI_REG#() macros to encode reg width
> + * @val: Register value
> + *
> + * Register/value pairs for sequences of writes.
> + */
> +struct cci_reg_sequence {
> +	u32 reg;
> +	u64 val;
> +};
> +
> +/*
> + * Macros to define register address with the register width encoded
> + * into the higher bits.
> + */
> +#define CCI_REG_ADDR_MASK		GENMASK(15, 0)
> +#define CCI_REG_WIDTH_SHIFT		16
> +#define CCI_REG_WIDTH_MASK		GENMASK(19, 16)
> +
> +#define CCI_REG8(x)			((1 << CCI_REG_WIDTH_SHIFT) | (x))
> +#define CCI_REG16(x)			((2 << CCI_REG_WIDTH_SHIFT) | (x))
> +#define CCI_REG24(x)			((3 << CCI_REG_WIDTH_SHIFT) | (x))
> +#define CCI_REG32(x)			((4 << CCI_REG_WIDTH_SHIFT) | (x))
> +#define CCI_REG64(x)			((8 << CCI_REG_WIDTH_SHIFT) | (x))
> +
> +/**
> + * cci_read() - Read a value from a single CCI register
> + *
> + * @map: Register map to read from
> + * @reg: Register address to read, use CCI_REG#() macros to encode reg width
> + * @val: Pointer to store read value
> + * @err: optional pointer to store errors, if a previous error is set
> + *       then the read will be skipped
> + *
> + * Return: %0 on success or a negative error code on failure.
> + */
> +int cci_read(struct regmap *map, u32 reg, u64 *val, int *err);
> +
> +/**
> + * cci_write() - Write a value to a single CCI register
> + *
> + * @map: Register map to write to
> + * @reg: Register address to write, use CCI_REG#() macros to encode reg width
> + * @val: Value to be written
> + * @err: optional pointer to store errors, if a previous error is set
> + *       then the write will be skipped
> + *
> + * Return: %0 on success or a negative error code on failure.
> + */
> +int cci_write(struct regmap *map, u32 reg, u64 val, int *err);
> +
> +/**
> + * cci_update_bits() - Perform a read/modify/write cycle on a single CCI register
> + *
> + * @map: Register map to update
> + * @reg: Register address to update, use CCI_REG#() macros to encode reg width
> + * @mask: Bitmask to change
> + * @val: New value for bitmask
> + * @err: optional pointer to store errors, if a previous error is set
> + *       then the update will be skipped
> + *
> + * Note this uses read-modify-write to update the bits, atomicity wrt other
> + * cci_*() register access functions is NOT guaranteed.
> + *
> + * Return: %0 on success or a negative error code on failure.
> + */
> +int cci_update_bits(struct regmap *map, u32 reg, u64 mask, u64 val, int *err);
> +
> +/**
> + * cci_multi_reg_write() - Write multiple registers to the device
> + *
> + * @map: Register map to write to
> + * @regs: Array of structures containing register-address, value pairs to be written
> + *        register-addresses use CCI_REG#() macros to encode reg width
> + * @num_regs: Number of registers to write
> + * @err: optional pointer to store errors, if a previous error is set
> + *       then the write will be skipped
> + *
> + * Write multiple registers to the device where the set of register, value
> + * pairs are supplied in any order, possibly not all in a single range.
> + *
> + * Use of the CCI_REG#() macros to encode reg width is mandatory.
> + *
> + * For raw lists of register-address, -value pairs with only 8 bit
> + * wide writes regmap_multi_reg_write() can be used instead.
> + *
> + * Return: %0 on success or a negative error code on failure.
> + */
> +int cci_multi_reg_write(struct regmap *map, const struct cci_reg_sequence *regs,
> +			int num_regs, int *err);
> +
> +/**
> + * cci_regmap_init_i2c() - Create regmap to use with cci_*() register access functions
> + *
> + * @client: i2c_client to create the regmap for
> + * @reg_addr_bits: register address width to use (8 or 16)
> + *
> + * Note the memory for the created regmap is devm() managed, tied to the client.
> + *
> + * Return: %0 on success or a negative error code on failure.
> + */
> +struct regmap *cci_regmap_init_i2c(struct i2c_client *client, int reg_addr_bits);
> +
> +#endif

Could you run

	./scripts/checkpatch.pl --strict --max-line-length=80

on this?

-- 
Kind regards,

Sakari Ailus
