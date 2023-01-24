Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0DCA679682
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 12:22:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233659AbjAXLWn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 06:22:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbjAXLWm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 06:22:42 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9A2D113ED
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 03:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674559314;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YyWC9+iXp4qN29Yv+9Db1J8gLKkp9OA4jb9YKepjYqs=;
        b=D8tEjoP6r8bZqmbAXk3IgvkQeKiupMswWcY6sRm62pnpp0cAw0bGP2FQVobRewiEgKaIcp
        DtZ1sJZZHJEJ6TdzA2vonwyhgQrlQgIiyQEQrbWW0AiF2EXGGE6BD9jLfyCcfD9BCgs9Az
        IpHw9M5/8DFD6isdrf2+4jdbvPBKdLA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-86-sJQt8PebMkayLT5Wm9vApg-1; Tue, 24 Jan 2023 06:21:53 -0500
X-MC-Unique: sJQt8PebMkayLT5Wm9vApg-1
Received: by mail-ed1-f72.google.com with SMTP id b15-20020a056402350f00b0049e42713e2bso10394776edd.0
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 03:21:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YyWC9+iXp4qN29Yv+9Db1J8gLKkp9OA4jb9YKepjYqs=;
        b=KiXn8WbYsJ9B+0InJp30KLLKsocYJ88Rnqnwb6fi+GUoJNAY24JBMQTT259MKw03d+
         FqSh3prSFm6QTAjYcR+ss5Q7qMLqI3RxiXKBTtBOrIvhKJ6TH3evXKKeM71T6bU9oDdg
         CmbZWQ3vRrNHf9I/d98Tp5y1CyXefMeeDjMIsopiwDupCowfCwQU4eyG+PjoX3vwiXFD
         UiJoVKnCQ3Rid2Dyqv5kqu57+5mZJTPAWKLrarswn92ygINCTrsgwY/2+QmZewHOkP4Y
         2+N479kDHr1dRocVUoC74huNp2nclMO3XslQHhAPAS30KuHa3vpaE75FSGd8oZUMauYu
         rUjg==
X-Gm-Message-State: AFqh2kp5qRdf0Vj4KjD4vIx17Mr56NRsYBgSBXokCmc6C11LDDYimTfr
        3OzCzryHGCH701bwq5WTfUb7YmvN6iYeuC2SXo6hxoP0/RjkEKxAi2Qx719kXNUEETPVI76iFBX
        eL/iqWk9ACo481WbyqVtGEBI=
X-Received: by 2002:a17:907:8b92:b0:877:6a03:9aa4 with SMTP id tb18-20020a1709078b9200b008776a039aa4mr24790436ejc.72.1674559312111;
        Tue, 24 Jan 2023 03:21:52 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs07mfhckg9oKDq9eqCsiL6H4J/IkjunM1m7fYkT6F/3s7M4sH88IlW81bc7N6VlmsGdO7+Ig==
X-Received: by 2002:a17:907:8b92:b0:877:6a03:9aa4 with SMTP id tb18-20020a1709078b9200b008776a039aa4mr24790421ejc.72.1674559311856;
        Tue, 24 Jan 2023 03:21:51 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a21-20020aa7d915000000b004a028d443f9sm781418edr.55.2023.01.24.03.21.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 03:21:51 -0800 (PST)
Message-ID: <c5a0df74-d2a0-0795-5185-06582be7f0b6@redhat.com>
Date:   Tue, 24 Jan 2023 12:21:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Content-Language: en-US, nl
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-29-hdegoede@redhat.com>
 <Y87NchQIfQ3zah+4@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y87NchQIfQ3zah+4@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 1/23/23 19:09, Andy Shevchenko wrote:
> On Mon, Jan 23, 2023 at 01:51:36PM +0100, Hans de Goede wrote:
>> The following drivers under drivers/media/i2c: ov08x40.c, ov13858.c,
>> ov13b10.c, ov2680.c, ov2685.c, ov2740.c, ov4689.c, ov5670.c,
>> ov5675.c, ov5695.c, ov8856.c, ov9282.c and ov9734.c,
>>
>> as well as various "atomisp" sensor drivers in drivers/staging, *all*
>> use register access helpers with the following function prototypes:
>>
>> int ovxxxx_read_reg(struct ovxxxx_dev *sensor, u16 reg,
>>                     unsigned int len, u32 *val);
>>
>> int ovxxxx_write_reg(struct ovxxxx_dev *sensor, u16 reg,
>>                      unsigned int len, u32 val);
>>
>> To read/write registers on Omnivision OVxxxx image sensors wich expect
>> a 16 bit register address in big-endian format and which have 1-3 byte
>> wide registers, in big-endian format (for the higher width registers).
>>
>> Add a new ovxxxx_16bit_addr_reg_helpers.h header file with static inline
>> versions of these register access helpers, so that this code duplication
>> can be removed.
> 
> ...
> 
>> +#include <asm/unaligned.h>
> 
> Usually we put linux/* followed by asm/*.

Ack.

> 
>> +#include <linux/dev_printk.h>
>> +#include <linux/i2c.h>
>> +
>> +static inline int ovxxxx_read_reg(struct i2c_client *client, u16 reg,
>> +				  unsigned int len, u32 *val)
>> +{
>> +	struct i2c_msg msgs[2];
> 
>> +	u8 addr_buf[2] = { reg >> 8, reg & 0xff };
> 
> Let's use unaligned.h or byteorder/generic.h?
> 
> 	__be16 addr_buf = cpu_to_be16(reg);

Ack.

> 
>> +	u8 data_buf[4] = { 0, };
> 
> 0, is not needed.
> 
>> +	int ret;
>> +
>> +	if (len > 4)
>> +		return -EINVAL;
>> +
>> +	msgs[0].addr = client->addr;
>> +	msgs[0].flags = 0;
>> +	msgs[0].len = ARRAY_SIZE(addr_buf);
>> +	msgs[0].buf = addr_buf;
> 
> 	msgs[0].buf = &addr_buf;
> 
>> +	msgs[1].addr = client->addr;
>> +	msgs[1].flags = I2C_M_RD;
>> +	msgs[1].len = len;
> 
>> +	msgs[1].buf = &data_buf[4 - len];
> 
> This trick I don't like. Can we have like other driver have it, i.e. switch
> case for the possible length and explicit usage of the endian conversion calls?

This new header (which is intended to eventually be used in many other
ovXXXX drivers too) is modeled after the reg access helpers
in drivers/media/i2c/ov*.c

And those do use be16 for the addr_buf in some cases, so I'm fine
with changing that. But non of them do a switch-case on len,
instead they all use similar tricks as this code (which was
copied from drivers/media/i2c/ov2680.c) does.

So I would prefer to keep this as is, so that the new
ovxxxx_16bit_addr_reg_helpers.h code is more like the code which
it intends to replace.

Regards,

Hans



> 
>> +	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
>> +	if (ret != ARRAY_SIZE(msgs)) {
>> +		dev_err(&client->dev, "read error: reg=0x%4x: %d\n", reg, ret);
>> +		return -EIO;
>> +	}
>> +
>> +	*val = get_unaligned_be32(data_buf);
>> +
>> +	return 0;
>> +}
>> +
>> +#define ovxxxx_read_reg8(s, r, v)	ovxxxx_read_reg(s, r, 1, v)
>> +#define ovxxxx_read_reg16(s, r, v)	ovxxxx_read_reg(s, r, 2, v)
>> +#define ovxxxx_read_reg24(s, r, v)	ovxxxx_read_reg(s, r, 3, v)
>> +
>> +static inline int ovxxxx_write_reg(struct i2c_client *client, u16 reg,
>> +				   unsigned int len, u32 val)
>> +{
>> +	u8 buf[6];
>> +	int ret;
>> +
>> +	if (len > 4)
>> +		return -EINVAL;
> 
>> +	put_unaligned_be16(reg, buf);
>> +	put_unaligned_be32(val << (8 * (4 - len)), buf + 2);
> 
> Something similar here?
> 
>> +	ret = i2c_master_send(client, buf, len + 2);
>> +	if (ret != len + 2) {
>> +		dev_err(&client->dev, "write error: reg=0x%4x: %d\n", reg, ret);
>> +		return -EIO;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +#define ovxxxx_write_reg8(s, r, v)	ovxxxx_write_reg(s, r, 1, v)
>> +#define ovxxxx_write_reg16(s, r, v)	ovxxxx_write_reg(s, r, 2, v)
>> +#define ovxxxx_write_reg24(s, r, v)	ovxxxx_write_reg(s, r, 3, v)
>> +
>> +static inline int ovxxxx_mod_reg(struct i2c_client *client, u16 reg, u8 mask, u8 val)
>> +{
>> +	u32 readval;
>> +	int ret;
>> +
>> +	ret = ovxxxx_read_reg8(client, reg, &readval);
>> +	if (ret < 0)
>> +		return ret;
> 
>> +	readval &= ~mask;
>> +	val &= mask;
>> +	val |= readval;
> 
> Usual pattern:
> 
> 	val = (readval & ~mask) | (val & mask);
> 
>> +	return ovxxxx_write_reg8(client, reg, val);
>> +}
> 

