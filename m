Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8724173129A
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 10:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244844AbjFOIrk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 04:47:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245056AbjFOIrK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 04:47:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5724294E
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 01:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686818742;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tC0k7da3slZmE6HvVwSAFEh2cWFGgwwMQKbuufqtqt0=;
        b=RVQD9rJCU7cVOroKy7a3XmCeyG5xTSFpyQGWEatdqYpxE6GHDIv0LY9H72GTluFY8Q+Rhe
        HT3BN/ql6QTd9PWLkR0Na/JbH7RTgnOSmv5EaL9wb8CSYK1/J+rPxYt75uMnJlXmvfeh9x
        cgB5MSQ7Tj0jG4YEZq+Npep5PrwWVyc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-tOkzY0jUPp2vcS5tFdp8jg-1; Thu, 15 Jun 2023 04:45:40 -0400
X-MC-Unique: tOkzY0jUPp2vcS5tFdp8jg-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-50daa85e940so6981565a12.0
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 01:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686818738; x=1689410738;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tC0k7da3slZmE6HvVwSAFEh2cWFGgwwMQKbuufqtqt0=;
        b=LU+dmKptxIyyF4HWBxFqM7I9hvk92QTMf5eUF7ZxuazwOuJE82bkdoOb9N3aJ5zPvR
         zMqvelqAbqGcKWsSks+RIVCVJIacGK1dUfJAXlbshdoIeAdiakvpTZOk5F7YO/eSNpBk
         AucwrLoPiLzdcQODW7FKKv2VDCsqVjR1kSMLw+Y7JvTKTTpi44ocqD/xq4rCyKj69fDC
         ErWbjU+YICAVYir44WCNWqyRqnNLD7Jb3JGXeh4tMERubdMCmMZpWGrrfNSoc8WFTAiD
         7KjIWogfXDn0Cd+M6q9Jc3AzUnZIHGprkW5IZWOSbH1lkM41JkTBAtT94uGUO8OZVydA
         gxHw==
X-Gm-Message-State: AC+VfDy6qr7cgdnCxg2b7R0YGgpUPbXU6KP76QN3bj6Fz7H8kzyi1L8j
        TfYDHLI91FaDfef52awduLoEtcrRa70nNBiXUYnp/5lPix/5Lbx+/PIu8LQBth2bOkbifSWmJl1
        YXCUuJSsytJ0H8x+Yhug06rRZs+oaImc=
X-Received: by 2002:a50:fb8c:0:b0:518:7a57:8f5 with SMTP id e12-20020a50fb8c000000b005187a5708f5mr4128056edq.21.1686818737818;
        Thu, 15 Jun 2023 01:45:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ71ytctMPjDp/NowsQzCX5hl5IlWx4aGrtU0fhRpDcQYcQh4EY3zYWlQTx8W7QBBRvT2QAzFg==
X-Received: by 2002:a50:fb8c:0:b0:518:7a57:8f5 with SMTP id e12-20020a50fb8c000000b005187a5708f5mr4128037edq.21.1686818737265;
        Thu, 15 Jun 2023 01:45:37 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id z7-20020aa7d407000000b0051a2c7f5b0fsm296738edq.88.2023.06.15.01.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 01:45:36 -0700 (PDT)
Message-ID: <4c9b2cec-e026-e527-2253-fc541ec85d05@redhat.com>
Date:   Thu, 15 Jun 2023 10:45:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/5] media: Add MIPI CCI register access helper
 functions
Content-Language: en-US, nl
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        linux-media@vger.kernel.org
References: <20230614192343.57280-1-hdegoede@redhat.com>
 <20230614192343.57280-2-hdegoede@redhat.com>
 <ZIolnOxs29H8EUmC@kekkonen.localdomain>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZIolnOxs29H8EUmC@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 6/14/23 22:39, Sakari Ailus wrote:
> Hi Hans,
> 
> Thank you for the update.
> 
> On Wed, Jun 14, 2023 at 09:23:39PM +0200, Hans de Goede wrote:
>> The CSI2 specification specifies a standard method to access camera sensor
>> registers called "Camera Control Interface (CCI)".
>>
>> This uses either 8 or 16 bit (big-endian wire order) register addresses
>> and supports 8, 16, 24 or 32 bit (big-endian wire order) register widths.
>>
>> Currently a lot of Linux camera sensor drivers all have their own custom
>> helpers for this, often copy and pasted from other drivers.
>>
>> Add a set of generic helpers for this so that all sensor drivers can
>> switch to a single common implementation.
>>
>> These helpers take an extra optional "int *err" function parameter,
>> this can be used to chain a bunch of register accesses together with
>> only a single error check at the end, rather then needing to error
>> check each individual register access. The first failing call will
>> set the contents of err to a non 0 value and all other calls will
>> then become no-ops.
>>
>> Link: https://lore.kernel.org/linux-media/59aefa7f-7bf9-6736-6040-39551329cd0a@redhat.com/
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v2:
>> - Drop cci_reg_type enum
>> - Make having an encoded reg-width mandatory rather then using 0 to encode
>>   8 bit width making reg-addresses without an encoded width default to
>>   a width of 8
>> - Add support for 64 bit wide registers
>> - Introduce a new cci_reg_sequence struct with 64 bit reg values for 64 bit
>>   support and without the delay_us field
>> - Various kerneldoc updates
>> - Stop supporting delays in cci_multi_reg_write()
>> - Some includes cleanups
>> - Disable regmap locking
>> ---
>>  Documentation/driver-api/media/v4l2-cci.rst  |   5 +
>>  Documentation/driver-api/media/v4l2-core.rst |   1 +
>>  drivers/media/v4l2-core/Kconfig              |   5 +
>>  drivers/media/v4l2-core/Makefile             |   1 +
>>  drivers/media/v4l2-core/v4l2-cci.c           | 157 +++++++++++++++++++
>>  include/media/v4l2-cci.h                     | 121 ++++++++++++++
>>  6 files changed, 290 insertions(+)
>>  create mode 100644 Documentation/driver-api/media/v4l2-cci.rst
>>  create mode 100644 drivers/media/v4l2-core/v4l2-cci.c
>>  create mode 100644 include/media/v4l2-cci.h
>>
>> diff --git a/Documentation/driver-api/media/v4l2-cci.rst b/Documentation/driver-api/media/v4l2-cci.rst
>> new file mode 100644
>> index 000000000000..dd297a40ed20
>> --- /dev/null
>> +++ b/Documentation/driver-api/media/v4l2-cci.rst
>> @@ -0,0 +1,5 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +V4L2 CCI kAPI
>> +^^^^^^^^^^^^^
>> +.. kernel-doc:: include/media/v4l2-cci.h
>> diff --git a/Documentation/driver-api/media/v4l2-core.rst b/Documentation/driver-api/media/v4l2-core.rst
>> index 1a8c4a5f256b..239045ecc8f4 100644
>> --- a/Documentation/driver-api/media/v4l2-core.rst
>> +++ b/Documentation/driver-api/media/v4l2-core.rst
>> @@ -22,6 +22,7 @@ Video4Linux devices
>>      v4l2-mem2mem
>>      v4l2-async
>>      v4l2-fwnode
>> +    v4l2-cci
>>      v4l2-rect
>>      v4l2-tuner
>>      v4l2-common
>> diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
>> index 348559bc2468..523ba243261d 100644
>> --- a/drivers/media/v4l2-core/Kconfig
>> +++ b/drivers/media/v4l2-core/Kconfig
>> @@ -74,6 +74,11 @@ config V4L2_FWNODE
>>  config V4L2_ASYNC
>>  	tristate
>>  
>> +config V4L2_CCI
>> +	tristate
>> +	depends on I2C
> 
> This won't do anything if the dependent driver will select V4L2_CCI, will
> it? I'd let the sensor driver depend on I2C instead. CCI is also supported
> on I3C, for instance.

It will cause a Kconfig error if the dependent driver does not depend
on I2C. Kconfig items doing select MUST depend on all the depends on
of the items they are selecting; and (continued below)

> 
>> +	select REGMAP_I2C
> 
> This is a good question.
> 
> How about adding V4L2_CCI_I2C that would select REGMAP_I2C?

v4l2-cci.ko uses the devm_regmap_init_i2c() symbol, so
REGMAP_I2C must be enabled when V4L2_CCI is enabled and
REGMAP_I2C is a symbol which should be selected rather
then depended on when necessary.

> 
>> +
>>  # Used by drivers that need Videobuf modules
>>  config VIDEOBUF_GEN
>>  	tristate
>> diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
>> index 41d91bd10cf2..be2551705755 100644
>> --- a/drivers/media/v4l2-core/Makefile
>> +++ b/drivers/media/v4l2-core/Makefile
>> @@ -25,6 +25,7 @@ videodev-$(CONFIG_VIDEO_V4L2_I2C) += v4l2-i2c.o
>>  # (e. g. LC_ALL=C sort Makefile)
>>  
>>  obj-$(CONFIG_V4L2_ASYNC) += v4l2-async.o
>> +obj-$(CONFIG_V4L2_CCI) += v4l2-cci.o
>>  obj-$(CONFIG_V4L2_FLASH_LED_CLASS) += v4l2-flash-led-class.o
>>  obj-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
>>  obj-$(CONFIG_V4L2_H264) += v4l2-h264.o
>> diff --git a/drivers/media/v4l2-core/v4l2-cci.c b/drivers/media/v4l2-core/v4l2-cci.c
>> new file mode 100644
>> index 000000000000..94764f3ebc6c
>> --- /dev/null
>> +++ b/drivers/media/v4l2-core/v4l2-cci.c
>> @@ -0,0 +1,157 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * MIPI Camera Control Interface (CCI) register access helpers.
>> + *
>> + * Copyright (C) 2023 Hans de Goede <hansg@kernel.org>
>> + */
>> +
>> +#include <linux/bitfield.h>
>> +#include <linux/delay.h>
>> +#include <linux/dev_printk.h>
>> +#include <linux/module.h>
>> +#include <linux/regmap.h>
>> +#include <linux/types.h>
>> +
>> +#include <asm/unaligned.h>
>> +
>> +#include <media/v4l2-cci.h>
>> +
>> +int cci_read(struct regmap *map, u32 reg, u64 *val, int *err)
>> +{
>> +	int len, ret;
> 
> len would look better unsigned.

Ok, I'll fix this for v3 and the same for the other unsigned
remarks.


>> +	u8 buf[8];
>> +
>> +	if (err && *err)
>> +		return *err;
>> +
>> +	len = FIELD_GET(CCI_REG_WIDTH_MASK, reg);
>> +	reg = FIELD_GET(CCI_REG_ADDR_MASK, reg);
>> +
>> +	ret = regmap_bulk_read(map, reg, buf, len);
>> +	if (ret) {
>> +		dev_err(regmap_get_device(map), "Error reading reg 0x%4x: %d\n", reg, ret);
>> +		goto out;
>> +	}
>> +
>> +	switch (len) {
>> +	case 1:
>> +		*val = buf[0];
>> +		break;
>> +	case 2:
>> +		*val = get_unaligned_be16(buf);
>> +		break;
>> +	case 3:
>> +		*val = get_unaligned_be24(buf);
>> +		break;
>> +	case 4:
>> +		*val = get_unaligned_be32(buf);
>> +		break;
>> +	case 8:
>> +		*val = get_unaligned_be64(buf);
>> +		break;
>> +	default:
>> +		dev_err(regmap_get_device(map), "Error invalid reg-width %d for reg 0x%04x\n",
>> +			len, reg);
>> +		ret = -EINVAL;
>> +		break;
>> +	}
>> +
>> +out:
>> +	if (ret && err)
>> +		*err = ret;
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(cci_read);
>> +
>> +int cci_write(struct regmap *map, u32 reg, u64 val, int *err)
>> +{
>> +	int len, ret;
> 
> Same here.
> 
>> +	u8 buf[8];
>> +
>> +	if (err && *err)
>> +		return *err;
>> +
>> +	len = FIELD_GET(CCI_REG_WIDTH_MASK, reg);
>> +	reg = FIELD_GET(CCI_REG_ADDR_MASK, reg);
>> +
>> +	switch (len) {
>> +	case 1:
>> +		buf[0] = val;
>> +		break;
>> +	case 2:
>> +		put_unaligned_be16(val, buf);
>> +		break;
>> +	case 3:
>> +		put_unaligned_be24(val, buf);
>> +		break;
>> +	case 4:
>> +		put_unaligned_be32(val, buf);
>> +		break;
>> +	case 8:
>> +		put_unaligned_be64(val, buf);
>> +		break;
>> +	default:
>> +		dev_err(regmap_get_device(map), "Error invalid reg-width %d for reg 0x%04x\n",
>> +			len, reg);
>> +		ret = -EINVAL;
>> +		goto out;
>> +	}
>> +
>> +	ret = regmap_bulk_write(map, reg, buf, len);
>> +	if (ret)
>> +		dev_err(regmap_get_device(map), "Error writing reg 0x%4x: %d\n", reg, ret);
>> +
>> +out:
>> +	if (ret && err)
>> +		*err = ret;
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(cci_write);
>> +
>> +int cci_update_bits(struct regmap *map, u32 reg, u64 mask, u64 val, int *err)
>> +{
>> +	u64 readval;
>> +	int ret;
>> +
>> +	ret = cci_read(map, reg, &readval, err);
>> +	if (ret)
>> +		return ret;
>> +
>> +	val = (readval & ~mask) | (val & mask);
>> +
>> +	return cci_write(map, reg, val, err);
>> +}
>> +EXPORT_SYMBOL_GPL(cci_update_bits);
>> +
>> +int cci_multi_reg_write(struct regmap *map, const struct cci_reg_sequence *regs,
>> +			int num_regs, int *err)
>> +{
>> +	int i, ret;
> 
> unsigned int i?
> 
> Same for num_regs.
> 
>> +
>> +	for (i = 0; i < num_regs; i++) {
>> +		ret = cci_write(map, regs[i].reg, regs[i].val, err);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(cci_multi_reg_write);
>> +
>> +struct regmap *cci_regmap_init_i2c(struct i2c_client *client, int reg_addr_bits)
>> +{
>> +	struct regmap_config config = {
>> +		.reg_bits = reg_addr_bits,
>> +		.val_bits = 8,
>> +		.reg_format_endian = REGMAP_ENDIAN_BIG,
>> +		.disable_locking = true,
>> +	};
>> +
>> +	return devm_regmap_init_i2c(client, &config);
>> +}
>> +EXPORT_SYMBOL_GPL(cci_regmap_init_i2c);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
>> diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
>> new file mode 100644
>> index 000000000000..5d8fdff086db
>> --- /dev/null
>> +++ b/include/media/v4l2-cci.h
>> @@ -0,0 +1,121 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * MIPI Camera Control Interface (CCI) register access helpers.
>> + *
>> + * Copyright (C) 2023 Hans de Goede <hansg@kernel.org>
>> + */
>> +#ifndef _V4L2_CCI_H
>> +#define _V4L2_CCI_H
>> +
>> +#include <linux/types.h>
>> +
>> +struct i2c_client;
>> +struct reg_sequence;
>> +struct regmap;
>> +
>> +/**
>> + * struct cci_reg_sequence - An individual write from a sequence of CCI writes
>> + *
>> + * @reg: Register address, use CCI_REG#() macros to encode reg width
>> + * @val: Register value
>> + *
>> + * Register/value pairs for sequences of writes.
>> + */
>> +struct cci_reg_sequence {
>> +	u32 reg;
>> +	u64 val;
>> +};
>> +
>> +/*
>> + * Macros to define register address with the register width encoded
>> + * into the higher bits.
>> + */
>> +#define CCI_REG_ADDR_MASK		GENMASK(15, 0)
>> +#define CCI_REG_WIDTH_SHIFT		16
>> +#define CCI_REG_WIDTH_MASK		GENMASK(19, 16)
>> +
>> +#define CCI_REG8(x)			((1 << CCI_REG_WIDTH_SHIFT) | (x))
>> +#define CCI_REG16(x)			((2 << CCI_REG_WIDTH_SHIFT) | (x))
>> +#define CCI_REG24(x)			((3 << CCI_REG_WIDTH_SHIFT) | (x))
>> +#define CCI_REG32(x)			((4 << CCI_REG_WIDTH_SHIFT) | (x))
>> +#define CCI_REG64(x)			((8 << CCI_REG_WIDTH_SHIFT) | (x))
>> +
>> +/**
>> + * cci_read() - Read a value from a single CCI register
>> + *
>> + * @map: Register map to read from
>> + * @reg: Register address to read, use CCI_REG#() macros to encode reg width
>> + * @val: Pointer to store read value
>> + * @err: optional pointer to store errors, if a previous error is set
>> + *       then the read will be skipped
>> + *
>> + * Return: %0 on success or a negative error code on failure.
>> + */
>> +int cci_read(struct regmap *map, u32 reg, u64 *val, int *err);
>> +
>> +/**
>> + * cci_write() - Write a value to a single CCI register
>> + *
>> + * @map: Register map to write to
>> + * @reg: Register address to write, use CCI_REG#() macros to encode reg width
>> + * @val: Value to be written
>> + * @err: optional pointer to store errors, if a previous error is set
>> + *       then the write will be skipped
>> + *
>> + * Return: %0 on success or a negative error code on failure.
>> + */
>> +int cci_write(struct regmap *map, u32 reg, u64 val, int *err);
>> +
>> +/**
>> + * cci_update_bits() - Perform a read/modify/write cycle on a single CCI register
>> + *
>> + * @map: Register map to update
>> + * @reg: Register address to update, use CCI_REG#() macros to encode reg width
>> + * @mask: Bitmask to change
>> + * @val: New value for bitmask
>> + * @err: optional pointer to store errors, if a previous error is set
>> + *       then the update will be skipped
>> + *
>> + * Note this uses read-modify-write to update the bits, atomicity wrt other
>> + * cci_*() register access functions is NOT guaranteed.
>> + *
>> + * Return: %0 on success or a negative error code on failure.
>> + */
>> +int cci_update_bits(struct regmap *map, u32 reg, u64 mask, u64 val, int *err);
>> +
>> +/**
>> + * cci_multi_reg_write() - Write multiple registers to the device
>> + *
>> + * @map: Register map to write to
>> + * @regs: Array of structures containing register-address, value pairs to be written
>> + *        register-addresses use CCI_REG#() macros to encode reg width
>> + * @num_regs: Number of registers to write
>> + * @err: optional pointer to store errors, if a previous error is set
>> + *       then the write will be skipped
>> + *
>> + * Write multiple registers to the device where the set of register, value
>> + * pairs are supplied in any order, possibly not all in a single range.
>> + *
>> + * Use of the CCI_REG#() macros to encode reg width is mandatory.
>> + *
>> + * For raw lists of register-address, -value pairs with only 8 bit
>> + * wide writes regmap_multi_reg_write() can be used instead.
>> + *
>> + * Return: %0 on success or a negative error code on failure.
>> + */
>> +int cci_multi_reg_write(struct regmap *map, const struct cci_reg_sequence *regs,
>> +			int num_regs, int *err);
>> +
>> +/**
>> + * cci_regmap_init_i2c() - Create regmap to use with cci_*() register access functions
>> + *
>> + * @client: i2c_client to create the regmap for
>> + * @reg_addr_bits: register address width to use (8 or 16)
>> + *
>> + * Note the memory for the created regmap is devm() managed, tied to the client.
>> + *
>> + * Return: %0 on success or a negative error code on failure.
>> + */
>> +struct regmap *cci_regmap_init_i2c(struct i2c_client *client, int reg_addr_bits);
>> +
>> +#endif
> 
> Could you run
> 
> 	./scripts/checkpatch.pl --strict --max-line-length=80
> 
> on this?

As I mentioned during the v1 review where you also asked about
the 80 column limit, can we first please have an official
decision what the column limit is for drivers/media and then
also document this somewhere?

Also note that you are asking me to modify the checkpatch
default max-line-length here. So basically you are deviating
from the official kernel coding style standards here.

You are asking for 80 columns. Andy often adds review remarks
along the lines of:

"this can fit on a single line" assuming the now official 100
chars hard limit.

And I cannot make both you and Andy happy at the same time.
So please pick a limit, *document it* and then stick with it.

This current inconsistency between reviewers is unhelpful.

My personal opinion on this is that sometimes going over
80 chars actually results in better readable code,
so I have a slight preference to just stick with the kernel
default of 100 chars. Sticking to the kernel default also
makes life a lot easier for people contributing to multiple
subsystems. So my vote goes to sticking with the new
kernel default of 100 chars.

I'm happy to adjust this patch-set to fit everything in
80 chars, but can we please first get some clarity on
what actual column limit we want for drivers/media ?

Regards,

Hans




