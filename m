Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94E55731913
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 14:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239852AbjFOMj7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 08:39:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244794AbjFOMjk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 08:39:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ECDF1FE4
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 05:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686832735;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8yM6D8AUc9N+Ldej96SWMed4oCEHLB4RH+xHyBtfrzA=;
        b=WFI7w1fqYVLHqliA+G40Vvc+tQ2sfRpgNapVwJUYroWeEPozeQBb7R4QwhE6OQlwTBGNDb
        RcIh7MxmFZ9vG6AQbfX0THEYfLfr9ml6uC64oIB2FCpUQB5WMlCHSgZhItCEUAwMTnWCXH
        89UpAO01dLu0qR0Su/wyuvVW3Jilm2I=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-JrvO_3X4OieckOZ7Ja6YtQ-1; Thu, 15 Jun 2023 08:38:54 -0400
X-MC-Unique: JrvO_3X4OieckOZ7Ja6YtQ-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-4f513a3d01eso6018477e87.0
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 05:38:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686832732; x=1689424732;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8yM6D8AUc9N+Ldej96SWMed4oCEHLB4RH+xHyBtfrzA=;
        b=YOkU+9LTmBecbY9bNEWw5lOvl9JZ6LXPd6AGIi9BaKaw0hb6uz/CTAjJ6CA2LKV5q0
         FpbAu30a4qRLv10qKZ6PM8iK96wCRarp5soaxSKFg+NkHi9QwoI9Sq5oM0tANFamQ/9K
         5ZVFU7FWAgZDCcFtqA91vBqfzQ0Spchok40ETVuv1wDUY+aFgSlc900p+lSRHED+qcAW
         6uVIv/jemTQJQjvmU93Kmhf4fgvOhfBhddngT7MfkZVp8LfD/zzybeqs3Lsgk2hLHVz+
         Dx2Kt76K/06euXW2Y/s2cwZ2LEG6+xwsHejq1x3EqMl2dDhp0a+dorngjvOPV/a5nM8D
         a+wA==
X-Gm-Message-State: AC+VfDzbZUiBHfygu21oV+v9YBW50ePu2SJAp16knadnq2lsY9pxPJ2H
        TG7aO5Xxg52RUHG/lqufquTdi/n2uu0jGk34KCsRJOnKSnPgCd2y1z0L9lAQ4HZezOHy2xIn7L0
        JJNjWotvvnN0l+nU8U9NB9+w=
X-Received: by 2002:a19:6611:0:b0:4f4:b783:8556 with SMTP id a17-20020a196611000000b004f4b7838556mr8689411lfc.66.1686832732686;
        Thu, 15 Jun 2023 05:38:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5uGTwpWuECFkXy/BbpM7EmyXCDXMgcLUCDzrQkNpa4Gv1rRaxYHyr7qb/sUIWOihHi+gklnQ==
X-Received: by 2002:a19:6611:0:b0:4f4:b783:8556 with SMTP id a17-20020a196611000000b004f4b7838556mr8689396lfc.66.1686832732366;
        Thu, 15 Jun 2023 05:38:52 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id e24-20020a170906081800b009786c8249d6sm9511551ejd.175.2023.06.15.05.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 05:38:51 -0700 (PDT)
Message-ID: <db9417e4-b79f-6a7c-40b5-bc23075a86d1@redhat.com>
Date:   Thu, 15 Jun 2023 14:38:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] platform/x86: int3472: discrete: Log a warning if the
 pin-numbers don't match
Content-Language: en-US, nl
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Dan Scally <dan.scally@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
References: <20230613110810.240193-1-hdegoede@redhat.com>
 <20230613110810.240193-2-hdegoede@redhat.com>
 <c821a4e0-ff2f-1b8d-a0fa-aadc9c541b6f@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <c821a4e0-ff2f-1b8d-a0fa-aadc9c541b6f@linux.intel.com>
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

On 6/13/23 13:17, Ilpo Järvinen wrote:
> On Tue, 13 Jun 2023, Hans de Goede wrote:
> 
>> The INT3472 discrete code assumes that the ACPI GPIO resources are
>> in the same order as the pin-info _DSM entries.
>>
>> The returned pin-info includes the pin-number in bits 15-8. Add a check
>> that this matches with the ACPI GPIO resource pin-number in case
>> the assumption is not true with some ACPI tables.
>>
>> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/platform/x86/intel/int3472/discrete.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
>> index a31964076883..850f306214c7 100644
>> --- a/drivers/platform/x86/intel/int3472/discrete.c
>> +++ b/drivers/platform/x86/intel/int3472/discrete.c
>> @@ -154,8 +154,8 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>>  {
>>  	struct int3472_discrete_device *int3472 = data;
>>  	struct acpi_resource_gpio *agpio;
>> +	u8 active_value, pin, type;
>>  	union acpi_object *obj;
>> -	u8 active_value, type;
>>  	const char *err_msg;
>>  	const char *func;
>>  	u32 polarity;
>> @@ -183,6 +183,12 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>>  
>>  	int3472_get_func_and_polarity(type, &func, &polarity);
>>  
>> +	pin = FIELD_GET(INT3472_GPIO_DSM_PIN, obj->integer.value);
>> +	if (pin != agpio->pin_table[0])
>> +		dev_warn(int3472->dev, "%s %s pin number mismatch _DSM %d resource %d\n",
>> +			 func, agpio->resource_source.string_ptr, pin,
>> +			 agpio->pin_table[0]);
>> +
>>  	active_value = FIELD_GET(INT3472_GPIO_DSM_SENSOR_ON_VAL, obj->integer.value);
>>  	if (!active_value)
>>  		polarity ^= GPIO_ACTIVE_LOW;
> 
> For both 1 and 2,
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Thank you.

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans



