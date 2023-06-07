Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6592D725819
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 10:41:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238959AbjFGIla (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 04:41:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238902AbjFGIl2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 04:41:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B678519BB
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 01:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686127238;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ucX2HDKd3N5qoeW7zhQeWcT1M+4Apjv32J477mDUExM=;
        b=beFLbYZ9YcsjDvdIVOAz2lgn4l4Y5NccYZRWSsWXJ/kyBem9y5YhQD8xKpegPAEC5l77Ax
        uVPPa2oaAnoAxfXAaNVZ5SZw1u6K5FUcFDnS68nRHKizX//9i2ToWmavelY+Y7LXYpPHey
        i3CIVzE3VbEIJ5jcUsyAt646/9EXUrs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-3yQ7VdGyMVq4yse256Zi-w-1; Wed, 07 Jun 2023 04:40:37 -0400
X-MC-Unique: 3yQ7VdGyMVq4yse256Zi-w-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-977d4b0d9e3so283025566b.0
        for <linux-media@vger.kernel.org>; Wed, 07 Jun 2023 01:40:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686127236; x=1688719236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ucX2HDKd3N5qoeW7zhQeWcT1M+4Apjv32J477mDUExM=;
        b=F9uY/HnXpix3AEDYbjyc0w3kdroQkOB/J4MSCw7/ddaqWQDzIU+1bVrWmhmMCDCYIk
         YQEW7CMArREuDJEO6u1LodP0IkRXrmu/gjIGjvUB/JeX8izpk/kwMGmTQ7u28Afc2eq7
         FChXAb2hToeAvU1RLvX6HCLe5sPYk2Z6z/o3Ny9ynWDMFJUtozxIE7+ab9QvHhcG/OE+
         MbBR7trhZp7soEoN+FkR49Ju9MI0aIKxsKBpTEIOkES1F+Lmpbs7d/6OKHgtdZL5cv1K
         is24N5cWu1LIvRPSE7+p2C3XCqBjdw3nRXe2d07SilhVh+Fa23MwmHO26s3hXLZaTk4N
         et7Q==
X-Gm-Message-State: AC+VfDzPbA3FL95rl2KkR19Uv7n546qME7okcLcntq6qtDoCVjehSJkW
        Epy0HSpkEgYUrVhzyuRv9wtBqvTF6G0erRF40IfZQqroNkHJLWHA9ENB8fR54NUC3UHRzEkE4tI
        XuNksP7XMjIkTdQ/CSW1Uyik=
X-Received: by 2002:a17:907:c1f:b0:965:d17b:26d with SMTP id ga31-20020a1709070c1f00b00965d17b026dmr5121426ejc.35.1686127236446;
        Wed, 07 Jun 2023 01:40:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5TgNjkgTRPHSS8cNMd362Gtn7MPSPptPDcOc1a76kLrYWtJMwIFcFnv98CZBwILMsb9jlwww==
X-Received: by 2002:a17:907:c1f:b0:965:d17b:26d with SMTP id ga31-20020a1709070c1f00b00965d17b026dmr5121399ejc.35.1686127236087;
        Wed, 07 Jun 2023 01:40:36 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id r4-20020a17090638c400b009584c5bcbc7sm6533055ejd.49.2023.06.07.01.40.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 01:40:35 -0700 (PDT)
Message-ID: <0760b8ba-0091-5270-5e46-9787a910bd6f@redhat.com>
Date:   Wed, 7 Jun 2023 10:40:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/3] media: Add MIPI CCI register access helper functions
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org
References: <20230606165808.70751-1-hdegoede@redhat.com>
 <20230606165808.70751-2-hdegoede@redhat.com>
 <CAHp75Vd6TPfZhPEDUdAj0Y7G8fQDPKQhmcY_tDWmN7VHBpXL0w@mail.gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vd6TPfZhPEDUdAj0Y7G8fQDPKQhmcY_tDWmN7VHBpXL0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 6/6/23 22:43, Andy Shevchenko wrote:
> On Tue, Jun 6, 2023 at 7:58 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
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
> 
> ...
> 
>> +#include <linux/delay.h>
>> +#include <linux/dev_printk.h>
>> +#include <linux/module.h>
>> +#include <linux/regmap.h>
> 
> + types.h
> 
>> +#include <media/v4l2-cci.h>
> 
>> +int cci_read(struct regmap *map, u32 reg, u32 *val, int *err)
>> +{
>> +       int i, len, ret;
>> +       u8 buf[4];
>> +
>> +       if (err && *err)
>> +               return *err;
>> +
>> +       /* Set len to register width in bytes */
>> +       len = ((reg & CCI_REG_WIDTH_MASK) >> CCI_REG_WIDTH_SHIFT) + 1;
>> +       reg &= CCI_REG_ADDR_MASK;
>> +
>> +       ret = regmap_bulk_read(map, reg, buf, len);
>> +       if (ret) {
>> +               dev_err(regmap_get_device(map), "Error reading reg 0x%4x: %d\n", reg, ret);
>> +               if (err)
>> +                       *err = ret;
>> +
>> +               return ret;
>> +       }
>> +
>> +       *val = 0;
>> +       for (i = 0; i < len; i++) {
>> +               *val <<= 8;
>> +               *val |= buf[i];
>> +       }
> 
> I really prefer to see put_unaligned() here depending on the length.
> Note, that on some CPUs it might be one assembly instruction or even
> none, depending on how the result is going to be used.

Ok, so you mean changing it to something like this:

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

?

		

> 
>> +       return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(cci_read);
> 
> Can we have it namespaced?

I'm not sure if having just these 5 symbols in their own namespace is worth it. SO far the media subsystem is not using module/symbol namespacing at all.

Sakari, Laurent, any opinions on this ?



>> +int cci_write(struct regmap *map, u32 reg, u32 val, int *err)
>> +{
>> +       int i, len, ret;
>> +       u8 buf[4];
>> +
>> +       if (err && *err)
>> +               return *err;
>> +
>> +       /* Set len to register width in bytes */
>> +       len = ((reg & CCI_REG_WIDTH_MASK) >> CCI_REG_WIDTH_SHIFT) + 1;
>> +       reg &= CCI_REG_ADDR_MASK;
>> +
>> +       for (i = 0; i < len; i++) {
>> +               buf[len - i - 1] = val & 0xff;
>> +               val >>= 8;
>> +       }
>> +
>> +       ret = regmap_bulk_write(map, reg, buf, len);
>> +       if (ret) {
>> +               dev_err(regmap_get_device(map), "Error writing reg 0x%4x: %d\n", reg, ret);
>> +               if (err)
>> +                       *err = ret;
>> +       }
>> +
>> +       return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(cci_write);
> 
> Same comments as per above function.
> 
> ...
> 
>> +               if (regs[i].delay_us)
> 
> I'm wondering why fsleep() doesn't have this check? Or does it?
> 
>> +                       fsleep(regs[i].delay_us);
> 
> ...
> 
>> +struct regmap *cci_regmap_init_i2c(struct i2c_client *client, int reg_addr_bits)
>> +{
>> +       struct regmap_config config = {
>> +               .reg_bits = reg_addr_bits,
>> +               .val_bits = 8,
>> +               .reg_format_endian = REGMAP_ENDIAN_BIG,
> 
> Is the lock required?
> If so, how is it helpful?

Interesting questions sensor drivers typically already do
their own locking.

So I guess we could indeed tell regmap to skip locking here.

Sakari, Laurent any opinion on this ?

> Can we move this outside as static const?

No, because reg_bits is not const.



>> +       };
>> +
>> +       return devm_regmap_init_i2c(client, &config);
>> +}
> 
> ...
> 
>> +#ifndef _V4L2_CCI_H
>> +#define _V4L2_CCI_H
> 
> + bits.h
> 
>> +#include <linux/regmap.h>
> 
> Not used, rather requires forward declarations of
> 
> struct regmap
> struct reg_sequence

Ack, I'll change this for the next version.

> Also note missing i2c_client forward declaration.

That was also taken care of by regmap.h.

> 
>> +#include <linux/types.h>
>> +
>> +/*
>> + * Note cci_reg_8 deliberately is 0, not 1, so that raw
>> + * (not wrapped in a CCI_REG*() macro) register addresses
>> + * do 8 bit wide accesses. This allows unchanged use of register
>> + * initialization lists of raw address, value pairs which only
>> + * do 8 bit width accesses. Which makes porting drivers easier.
>> + */
>> +enum cci_reg_type {
>> +       cci_reg_8 = 0,
> 
> But this is guaranteed by the C standard... See also below.
> 
>> +       cci_reg_16,
> 
> But this one becomes 1, so the above comment doesn't clarify why it's
> okay to have it 1 and not 2.

Basically the idea is that the enum value is the reg-width in bytes - 1
where the - 1 is there so that cci_reg_8 = 0 .

Regards,

Hans


