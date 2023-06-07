Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61010725865
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 10:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239203AbjFGIrx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 04:47:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234914AbjFGIrv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 04:47:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E9DF18F
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 01:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686127623;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fV4foV4mB8MkLGfuSAFW2ufvdYLONT6TLGvoUv/XQek=;
        b=hPqZdsxxz6mHE38/QVHbu+XoImKoZPpijvY6CHUSOeb/hDnOR5LQ/3f+uht64nsxazFPOH
        dLA4r5Kc7Xqsb/xC2dhwJshu5dtoWJS1T0LBQ1vuXfb4gHwMGAPRsMGH7yKt0TCgmhYTh/
        EQLzMTW3bYHyWArzNy+X0nVvSy+tsSE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-MIlDpweeOnCmMs46D9smGA-1; Wed, 07 Jun 2023 04:47:02 -0400
X-MC-Unique: MIlDpweeOnCmMs46D9smGA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5149e1bd242so548332a12.3
        for <linux-media@vger.kernel.org>; Wed, 07 Jun 2023 01:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686127621; x=1688719621;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fV4foV4mB8MkLGfuSAFW2ufvdYLONT6TLGvoUv/XQek=;
        b=Ic4doW7CwZrm2RuVIMxHEj3KCbJVyzAATF9k7WnODmyOadhANUFc7GEsLaLttuigpk
         jexam76qkE3hJ6afDZrTSxtc/oUKsBd8REedkTXPll9m44OJckp8dfiU9OJzALcDPAik
         bNVkWLAAyjMA1rdTy/u+QFfqrakJaAO8CFvm7SUg7vYv8ldw0EYc7Hzqpm3lCBzZ6rr4
         Myj+8qLcWzAtz9Meb1qOPZ0n8r2exW8V1DSfHDzZ1zEwPca+G3jJzL+Wa0PIrT+V8qxc
         mPr/Bd5EujZZWF//0hLYGAogq8GRnxSlqWVSSJCcUt3ScbfLWvwvGwWjyHv95CgzW1sb
         Uk5Q==
X-Gm-Message-State: AC+VfDzz0H9JIekPiuHD2Ht3or37X3F/sFHdKdN8Lvi9l566Wc6gv1a7
        ucJ5WNiJ9zsoB5btYr7xti9hLZ9062LPPwQMpZfD5r4iSyH1gE1zSQ2g/fCh3wShuOV1ev8iNPt
        sCas8SrZPvqNLlU+r+xwHqbU=
X-Received: by 2002:aa7:ce04:0:b0:50b:c397:bbac with SMTP id d4-20020aa7ce04000000b0050bc397bbacmr4102428edv.29.1686127620847;
        Wed, 07 Jun 2023 01:47:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6MH7dWG+aF3S/JhrzQVuKenM/xlx8fm4TUACsh3BAeFgiIdcs2xp3iJ9w31dB6SjVZxqstNg==
X-Received: by 2002:aa7:ce04:0:b0:50b:c397:bbac with SMTP id d4-20020aa7ce04000000b0050bc397bbacmr4102418edv.29.1686127620536;
        Wed, 07 Jun 2023 01:47:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u16-20020aa7d550000000b005149c3fa632sm6008000edr.13.2023.06.07.01.46.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 01:46:59 -0700 (PDT)
Message-ID: <18c5eed5-e2f0-73ff-3c58-c43223e6f4ac@redhat.com>
Date:   Wed, 7 Jun 2023 10:46:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/3] media: Add MIPI CCI register access helper functions
Content-Language: en-US, nl
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org
References: <20230606165808.70751-1-hdegoede@redhat.com>
 <20230606165808.70751-2-hdegoede@redhat.com>
 <ZIA2ste/694cokGH@kekkonen.localdomain>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZIA2ste/694cokGH@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 6/7/23 09:50, Sakari Ailus wrote:
> Hi Hans,
> 
> Thank you for the patchset.
> 
> On Tue, Jun 06, 2023 at 06:58:06PM +0200, Hans de Goede wrote:
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
>>  Documentation/driver-api/media/v4l2-cci.rst  |   5 +
>>  Documentation/driver-api/media/v4l2-core.rst |   1 +
>>  drivers/media/v4l2-core/Kconfig              |   5 +
>>  drivers/media/v4l2-core/Makefile             |   1 +
>>  drivers/media/v4l2-core/v4l2-cci.c           | 142 +++++++++++++++++++
>>  include/media/v4l2-cci.h                     | 109 ++++++++++++++
>>  6 files changed, 263 insertions(+)
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
>> +	select REGMAP_I2C
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
>> index 000000000000..21207d137dbe
>> --- /dev/null
>> +++ b/drivers/media/v4l2-core/v4l2-cci.c
>> @@ -0,0 +1,142 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * MIPI Camera Control Interface (CCI) register access helpers.
>> + *
>> + * Copyright (C) 2023 Hans de Goede <hansg@kernel.org>
>> + */
>> +
>> +#include <linux/delay.h>
>> +#include <linux/dev_printk.h>
>> +#include <linux/module.h>
>> +#include <linux/regmap.h>
>> +
>> +#include <media/v4l2-cci.h>
>> +
>> +int cci_read(struct regmap *map, u32 reg, u32 *val, int *err)
>> +{
>> +	int i, len, ret;
> 
> Could i and len be unsigned?

Andy suggested replacing the for-loop below with:

	switch (len)
	case 1:
		*val = buf[0];
		break;
	case 2:
		*val = get_unaligned_be16(buf);
		break;
	case 3:
		*val = __get_unaligned_be24(buf);
		break;
	case 4:
		*val = get_unaligned_be32(buf);
		break;
	}

Then i goes away. What do you think about doing it like
this instead ?

> 
>> +	u8 buf[4];
>> +
>> +	if (err && *err)
>> +		return *err;
>> +
>> +	/* Set len to register width in bytes */
>> +	len = ((reg & CCI_REG_WIDTH_MASK) >> CCI_REG_WIDTH_SHIFT) + 1;
>> +	reg &= CCI_REG_ADDR_MASK;
>> +
>> +	ret = regmap_bulk_read(map, reg, buf, len);
>> +	if (ret) {
>> +		dev_err(regmap_get_device(map), "Error reading reg 0x%4x: %d\n", reg, ret);
>> +		if (err)
>> +			*err = ret;
>> +
>> +		return ret;
>> +	}
>> +
>> +	*val = 0;
>> +	for (i = 0; i < len; i++) {
>> +		*val <<= 8;
>> +		*val |= buf[i];
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(cci_read);
>> +
>> +int cci_write(struct regmap *map, u32 reg, u32 val, int *err)
>> +{
>> +	int i, len, ret;
> 
> Same here.
> 
>> +	u8 buf[4];
>> +
>> +	if (err && *err)
>> +		return *err;
>> +
>> +	/* Set len to register width in bytes */
>> +	len = ((reg & CCI_REG_WIDTH_MASK) >> CCI_REG_WIDTH_SHIFT) + 1;
>> +	reg &= CCI_REG_ADDR_MASK;
>> +
>> +	for (i = 0; i < len; i++) {
>> +		buf[len - i - 1] = val & 0xff;
>> +		val >>= 8;
>> +	}
>> +
>> +	ret = regmap_bulk_write(map, reg, buf, len);
>> +	if (ret) {
>> +		dev_err(regmap_get_device(map), "Error writing reg 0x%4x: %d\n", reg, ret);
>> +		if (err)
>> +			*err = ret;
>> +	}
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(cci_write);
>> +
>> +int cci_update_bits(struct regmap *map, u32 reg, u32 mask, u32 val, int *err)
>> +{
>> +	int width, ret;
>> +	u32 readval;
>> +
>> +	if (err && *err)
>> +		return *err;
>> +
>> +	/*
>> +	 * For single byte updates use regmap_update_bits(), this uses
>> +	 * the regmap-lock to protect against other read-modify-writes racing.
>> +	 */
>> +	width = (reg & CCI_REG_WIDTH_MASK) >> CCI_REG_WIDTH_SHIFT;
>> +	if (width == cci_reg_8) {
>> +		reg &= CCI_REG_ADDR_MASK;
>> +		ret = regmap_update_bits(map, reg, mask, val);
>> +		if (ret) {
>> +			dev_err(regmap_get_device(map), "Error updating reg 0x%4x: %d\n", reg, ret);
>> +			if (err)
>> +				*err = ret;
>> +		}
>> +
>> +		return ret;
>> +	}
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
>> +int cci_multi_reg_write(struct regmap *map, const struct reg_sequence *regs, int num_regs, int *err)
>> +{
>> +	int i, ret;
>> +
>> +	if (err && *err)
>> +		return *err;
>> +
>> +	for (i = 0; i < num_regs; i++) {
>> +		ret = cci_write(map, regs[i].reg, regs[i].def, err);
>> +		if (ret)
>> +			return ret;
>> +
>> +		if (regs[i].delay_us)
>> +			fsleep(regs[i].delay_us);
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
>> +	};
>> +
>> +	return devm_regmap_init_i2c(client, &config);
>> +}
>> +EXPORT_SYMBOL_GPL(cci_regmap_init_i2c);
> 
> Bulk write functions would be nice, too: CCI does not limit access to
> register-like targets.

For bulk writing encoding the register width into the address
makes no sense, so we would need to specify in the documentation
that only raw register addresses are accepted and that the write
is always done in bytes.

At which point we are basically adding a 1:1 wrapper around
regmap_bulk_write(). So I think it would be better for sensor
drivers which need this to just use regmap_bulk_write()
directly.

Regards,

Hans


