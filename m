Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36C85732CB4
	for <lists+linux-media@lfdr.de>; Fri, 16 Jun 2023 12:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240201AbjFPKDY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jun 2023 06:03:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234228AbjFPKDX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jun 2023 06:03:23 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3AD42D67
        for <linux-media@vger.kernel.org>; Fri, 16 Jun 2023 03:03:20 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-51a324beca6so681065a12.1
        for <linux-media@vger.kernel.org>; Fri, 16 Jun 2023 03:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686909799; x=1689501799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ol1yaTRIxYZfE9n+nF3Wi864s6Luc3ic3fOohQqxuRs=;
        b=AoFBCToNhb9JCSHxwpfz2wU9cUJK6BkPJvsjY9nBqIu6Kil4Ky1oB1u7fzk8ZZi5ca
         Q3sHZau6W45vvdf+jrJVFZcyUf3NKXbt+ne3UTCQamg5K1KBL7OWq1sMy9Jc92FdWcoI
         f+O9je45T+YMxslReBZlxkA/4XHPVd0a4Ab1bZKtkHzUocyH8vVKRuUjnY3sJDF5/gIw
         iFAFluAOM42v8u2jR8SvswGcfeGvfWi3Brxg92q7mVDefBx3A+sLJ0z0njZNZfmE2/jg
         LJrsMuVnITgahLyzc6gf0utpJrjZTTRtz/+4TQ7VFIIKM5gT3XZyyq9wU/s2Xp+rUa0X
         Om8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686909799; x=1689501799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ol1yaTRIxYZfE9n+nF3Wi864s6Luc3ic3fOohQqxuRs=;
        b=hZ3Ff/8Kes13ZiERd5M2nn/QSQYtupnR3a8bPIIDz7b49NwaGZjj3bArcZOwAoUuo7
         J/gsPu9EcAfDGXRWmrs3hzGUVt+337hjlvV0UQchY3brRTMV3zffqGj02zq0LYuxVYfT
         5bHsdsVvL3gNP3poRLPb6gt7Yij7HRNL9YdUA/hF/4giPF2z6HntF0f+2JzFhEM1OCgF
         0lVYjGIjaFp+1zDY0fBwGYUIZfVY2qxqGwXdwjLff5SVwV3NxkPq06KCVaNQUQ5Y3c2n
         meCDUIKLNqWTNm8Iw+Mv9Ip7LySrLQoTBhuxGW6+fZyoocprxTClnQLhPSQ4l4lJihO8
         SSMQ==
X-Gm-Message-State: AC+VfDx33XWcP+ukNi1AdUh3MGeXGy9nRr8CH7U7chyntswLop7bow2J
        X7F0JpotFM8O3Od1WI0d4xY=
X-Google-Smtp-Source: ACHHUZ7S6rWa4Nh4Gx4qFTl6VBRBhIk8+QquaL+rKXtF6YI5YGGSgHG08pXzvW70lbX9InQ6CQUoWw==
X-Received: by 2002:a17:907:7245:b0:982:a454:6d24 with SMTP id ds5-20020a170907724500b00982a4546d24mr1474359ejc.74.1686909799066;
        Fri, 16 Jun 2023 03:03:19 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-2-39-142-242.cust.vodafonedsl.it. [2.39.142.242])
        by smtp.gmail.com with ESMTPSA id z12-20020a17090655cc00b009785e09db91sm10523307ejp.26.2023.06.16.03.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 03:03:18 -0700 (PDT)
Date:   Fri, 16 Jun 2023 12:03:16 +0200
From:   Tommaso Merciai <tomm.merciai@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        linux-media@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 1/5] media: Add MIPI CCI register access helper
 functions
Message-ID: <ZIwzZAmJa8UMtiZW@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20230615111322.68204-1-hdegoede@redhat.com>
 <20230615111322.68204-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615111322.68204-2-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,
Thanks for your patch!

I'm working on top of this for my alvium driver.
All seems fine on my side testing your new API. :)

Great Job! :)

Here are my tags:

Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>
Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>

Regards,
Tommaso

On Thu, Jun 15, 2023 at 01:13:18PM +0200, Hans de Goede wrote:
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
> only a single error check at the end, rather than needing to error
> check each individual register access. The first failing call will
> set the contents of err to a non 0 value and all other calls will
> then become no-ops.
> 
> Link: https://lore.kernel.org/linux-media/59aefa7f-7bf9-6736-6040-39551329cd0a@redhat.com/
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v3
> - Use unsigned int instead of int in a couple of places
> - Run + fix checkpatch.pl --strict --max-line-length=80
> - Rename cci_regmap_init_i2c() to devm_cci_regmap_init_i2c()
> - Some small kerneldoc text tweaks
> 
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
>  drivers/media/v4l2-core/v4l2-cci.c           | 163 +++++++++++++++++++
>  include/media/v4l2-cci.h                     | 123 ++++++++++++++
>  6 files changed, 298 insertions(+)
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
> +	select REGMAP_I2C
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
> index 000000000000..de1e59b2ebde
> --- /dev/null
> +++ b/drivers/media/v4l2-core/v4l2-cci.c
> @@ -0,0 +1,163 @@
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
> +	unsigned int len;
> +	u8 buf[8];
> +	int ret;
> +
> +	if (err && *err)
> +		return *err;
> +
> +	len = FIELD_GET(CCI_REG_WIDTH_MASK, reg);
> +	reg = FIELD_GET(CCI_REG_ADDR_MASK, reg);
> +
> +	ret = regmap_bulk_read(map, reg, buf, len);
> +	if (ret) {
> +		dev_err(regmap_get_device(map), "Error reading reg 0x%4x: %d\n",
> +			reg, ret);
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
> +		dev_err(regmap_get_device(map), "Error invalid reg-width %u for reg 0x%04x\n",
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
> +	unsigned int len;
> +	u8 buf[8];
> +	int ret;
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
> +		dev_err(regmap_get_device(map), "Error invalid reg-width %u for reg 0x%04x\n",
> +			len, reg);
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	ret = regmap_bulk_write(map, reg, buf, len);
> +	if (ret)
> +		dev_err(regmap_get_device(map), "Error writing reg 0x%4x: %d\n",
> +			reg, ret);
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
> +			unsigned int num_regs, int *err)
> +{
> +	unsigned int i;
> +	int ret;
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
> +struct regmap *devm_cci_regmap_init_i2c(struct i2c_client *client,
> +					int reg_addr_bits)
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
> +EXPORT_SYMBOL_GPL(devm_cci_regmap_init_i2c);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
> diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
> new file mode 100644
> index 000000000000..de5eb8c2a575
> --- /dev/null
> +++ b/include/media/v4l2-cci.h
> @@ -0,0 +1,123 @@
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
> + * @err: Optional pointer to store errors, if a previous error is set
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
> + * @err: Optional pointer to store errors, if a previous error is set
> + *       then the write will be skipped
> + *
> + * Return: %0 on success or a negative error code on failure.
> + */
> +int cci_write(struct regmap *map, u32 reg, u64 val, int *err);
> +
> +/**
> + * cci_update_bits() - Perform a read/modify/write cycle on
> + *                     a single CCI register
> + *
> + * @map: Register map to update
> + * @reg: Register address to update, use CCI_REG#() macros to encode reg width
> + * @mask: Bitmask to change
> + * @val: New value for bitmask
> + * @err: Optional pointer to store errors, if a previous error is set
> + *       then the update will be skipped
> + *
> + * Note this uses read-modify-write to update the bits, atomicity with regards
> + * to other cci_*() register access functions is NOT guaranteed.
> + *
> + * Return: %0 on success or a negative error code on failure.
> + */
> +int cci_update_bits(struct regmap *map, u32 reg, u64 mask, u64 val, int *err);
> +
> +/**
> + * cci_multi_reg_write() - Write multiple registers to the device
> + *
> + * @map: Register map to write to
> + * @regs: Array of structures containing register-address, -value pairs to be
> + *        written, register-addresses use CCI_REG#() macros to encode reg width
> + * @num_regs: Number of registers to write
> + * @err: Optional pointer to store errors, if a previous error is set
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
> +			unsigned int num_regs, int *err);
> +
> +/**
> + * devm_cci_regmap_init_i2c() - Create regmap to use with cci_*() register
> + *                              access functions
> + *
> + * @client: i2c_client to create the regmap for
> + * @reg_addr_bits: register address width to use (8 or 16)
> + *
> + * Note the memory for the created regmap is devm() managed, tied to the client.
> + *
> + * Return: %0 on success or a negative error code on failure.
> + */
> +struct regmap *devm_cci_regmap_init_i2c(struct i2c_client *client,
> +					int reg_addr_bits);
> +
> +#endif
> -- 
> 2.40.1
> 
