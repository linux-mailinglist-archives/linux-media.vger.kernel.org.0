Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC1977CDE6
	for <lists+linux-media@lfdr.de>; Tue, 15 Aug 2023 16:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236872AbjHOOQv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Aug 2023 10:16:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237529AbjHOOQf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Aug 2023 10:16:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD552199A
        for <linux-media@vger.kernel.org>; Tue, 15 Aug 2023 07:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692108945;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Z+aDWoMePUWJcM8XBPiIBzKHpO5++GApl3nawab2y5U=;
        b=hrmk7t9s7kdEzVlJ8RCnP9AEQYwVIV/WxtXUflR7mstLWUAK3fEU04geS7vszBqddCz1vf
        HhtjvX64mWTc+fBw29V4D+XolXmDwAAyZeQeg96F7yilymXWolSZD0MFndfnC43+91T58w
        2pNpykmooS8HRVBqe/9rv1Yy2Wa+SsE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-245-DsgxKgyDMgmrzEItgkoXpw-1; Tue, 15 Aug 2023 10:15:43 -0400
X-MC-Unique: DsgxKgyDMgmrzEItgkoXpw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-94a34a0b75eso322009066b.1
        for <linux-media@vger.kernel.org>; Tue, 15 Aug 2023 07:15:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692108941; x=1692713741;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+aDWoMePUWJcM8XBPiIBzKHpO5++GApl3nawab2y5U=;
        b=KvBnNw4K740OZ/ePzSgttUZS87qOtNKTHoeNMrSUJ/dhk6512mWc3LxxXdmvLExsGx
         j145sljdCq3HwfZBnjWIZNyuLkgIE7t5UYClw3Z5pQVRWFDkZOihihoNuY3U/Q1J0FJC
         sfTRtI74Ff2vVgpQvnwqJAvzSKz8d6wdiaqjUgq0Djn2ihLE/cpdNDnNVX7PLGzz8eFd
         x1dxX1EeDDjLdtVEX/aoVo1FZ+X3fuKjzP7L7H4RWS7Pavqs3qrTMQCc2zxy/2Nelq3R
         DWa0PbAA2/T5YOmDNZ7kslBIYl57960+fc7+k+U62qAVUp+r8Ly7z1eTSSv/8u2NKyhp
         +g0Q==
X-Gm-Message-State: AOJu0YzJkRyT9QCo3g7r0bC+Y4oCkG55B6DPKPY7R+RFwyV5pSxS/ITC
        c+dfxvTxVfOxC0OStNEqZ+jrVmpxP3plvOTZSpzAGRXpT11/bNUmqgPhI8asnNiYj1zfMbO8N9A
        tlqNyfU0HTDkBSwaIfHQ9ml8=
X-Received: by 2002:a17:906:3112:b0:99c:ca27:c447 with SMTP id 18-20020a170906311200b0099cca27c447mr9001109ejx.43.1692108941642;
        Tue, 15 Aug 2023 07:15:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXwFUSp8n1oac8G25mPErNh4cLtlS6AviFuxgSDh6/Sd79dVMS28UBFl4EtXQ1ldgsfYSb+A==
X-Received: by 2002:a17:906:3112:b0:99c:ca27:c447 with SMTP id 18-20020a170906311200b0099cca27c447mr9001091ejx.43.1692108941270;
        Tue, 15 Aug 2023 07:15:41 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id z8-20020a170906814800b0099d798a6bb5sm5754657ejw.67.2023.08.15.07.15.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 07:15:40 -0700 (PDT)
Message-ID: <6e13f1d6-190a-eb2a-8dfc-2f9d35c7bc24@redhat.com>
Date:   Tue, 15 Aug 2023 16:15:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 3/5] media: imx290: Convert to new CCI register access
 helpers
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
References: <20230627125109.52354-1-hdegoede@redhat.com>
 <20230627125109.52354-4-hdegoede@redhat.com>
 <20230815131539.GA9702@pendragon.ideasonboard.com>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230815131539.GA9702@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 8/15/23 15:15, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Tue, Jun 27, 2023 at 02:51:06PM +0200, Hans de Goede wrote:
>> Use the new comon CCI register access helpers to replace the private
>> register access helpers in the imx290 driver.
>>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Note:
>> 1. This is untested
>> 2. For reviewers: all the IMX290_REG_?BIT defines in both the register
>> address defines as well as in various reg-sequences were automatically
>> changed using search replace.
>> ---
>> Changes in v3:
>> - Fixed a couple of lines > 80 chars
>>
>> Changes in v2:
>> - New patch in v2 of this series
>> ---
>>  drivers/media/i2c/Kconfig  |   1 +
>>  drivers/media/i2c/imx290.c | 360 +++++++++++++++----------------------
>>  2 files changed, 150 insertions(+), 211 deletions(-)
> 
> [snip]
> 
>> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
>> index b3f832e9d7e1..e78c7b91ae72 100644
>> --- a/drivers/media/i2c/imx290.c
>> +++ b/drivers/media/i2c/imx290.c
>> @@ -21,91 +21,86 @@
> 
> [snip]
> 
>> @@ -615,63 +605,15 @@ imx290_format_info(const struct imx290 *imx290, u32 code)
>>  	return NULL;
>>  }
>>  
>> -/* -----------------------------------------------------------------------------
>> - * Register access
>> - */
>> -
>> -static int __always_unused imx290_read(struct imx290 *imx290, u32 addr, u32 *value)
>> -{
>> -	u8 data[3] = { 0, 0, 0 };
>> -	int ret;
>> -
>> -	ret = regmap_raw_read(imx290->regmap, addr & IMX290_REG_ADDR_MASK,
>> -			      data, (addr >> IMX290_REG_SIZE_SHIFT) & 3);
>> -	if (ret < 0) {
>> -		dev_err(imx290->dev, "%u-bit read from 0x%04x failed: %d\n",
>> -			((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
>> -			 addr & IMX290_REG_ADDR_MASK, ret);
>> -		return ret;
>> -	}
>> -
>> -	*value = get_unaligned_le24(data);
>> -	return 0;
>> -}
>> -
>> -static int imx290_write(struct imx290 *imx290, u32 addr, u32 value, int *err)
>> -{
>> -	u8 data[3];
>> -	int ret;
>> -
>> -	if (err && *err)
>> -		return *err;
>> -
>> -	put_unaligned_le24(value, data);
> 
> We seem to be having a problem here, as the CCI helpers unconditionally
> use big endian for the data :-(

That is because that is what the specification says, from the MIPI CSI spec:

"""
6.3.2 The Transmission Byte Order for Multi-byte Register Values

This is a normative section.

The first byte of a CCI message is always the MS byte of a multi-byte register and the last byte is always the LS byte.
"""

So it seems that the IMX sensors are special here and it might be best to just revert the conversion to the CCI helpers?

Alternative would be to make devm_cci_regmap_init_i2c() return a newly allocated struct
which contains both a struct regmap * and a long flags and make the helpers take a pointer to that struct, combined with adding an endianess flag to the flags member.

Regards,

Hans



> 
>> -
>> -	ret = regmap_raw_write(imx290->regmap, addr & IMX290_REG_ADDR_MASK,
>> -			       data, (addr >> IMX290_REG_SIZE_SHIFT) & 3);
>> -	if (ret < 0) {
>> -		dev_err(imx290->dev, "%u-bit write to 0x%04x failed: %d\n",
>> -			((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
>> -			 addr & IMX290_REG_ADDR_MASK, ret);
>> -		if (err)
>> -			*err = ret;
>> -	}
>> -
>> -	return ret;
>> -}
>> -
> 
> [snip]
> 

