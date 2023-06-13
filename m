Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3AAE72E04A
	for <lists+linux-media@lfdr.de>; Tue, 13 Jun 2023 13:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241791AbjFMLDA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jun 2023 07:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239863AbjFMLC7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jun 2023 07:02:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F32FE52
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 04:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686654133;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ow+FjqcQ0Uj51qvV8xsI9bQJm+Wxo0EbXiSXPwMbH3c=;
        b=VopM6dZhCqJDfd0cdkMcGKne1RYjohu/64gnJnrglW5bAuZwGquOdGwWf55ne+mOcpo6bf
        iLLfPnw3QstKwB8pBfMI0PI0oFfGKwuZ2wFY36TNlFjlmEmtTq6tiVeOy0Mf8RY/QLFEcf
        GLIDFB///pbMzbm0gmuzI8OHcJUg3YU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-mFpt4g0NMwyi_aDi8WMd-A-1; Tue, 13 Jun 2023 07:02:11 -0400
X-MC-Unique: mFpt4g0NMwyi_aDi8WMd-A-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5149ab05081so4391559a12.2
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 04:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686654130; x=1689246130;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ow+FjqcQ0Uj51qvV8xsI9bQJm+Wxo0EbXiSXPwMbH3c=;
        b=d583gkWSZ9bpFBL9EJN2rl5EmsnXcHs0UgJwLPwzkk9u7xVJYIyyN9pU2usZn2xidt
         DXyjTv4kNJt0w3yc917y7r9z1DCHjTpiLVAQgkpceOiWn5QAmyVacjEOu5WrraD8dum5
         hOsduOPxeTQtKm2Dn09Y4Spf92R0Exsl3S4WyhBGhQaU+ac3t4azD1ZMoip52NqSOQmi
         Ib4JxYHioQAxjro6Z2MeBdTPus3/fdXbBfCbxAvgX59kPCkKabOxZ/iY/IswncHTHcEa
         TlRFPiw6HN+bfrTWnyWTfvRxiTnJk/+YMSyh7RN77v6Z9RBuCSGMdZBbe5eTCF6zTQBJ
         Temg==
X-Gm-Message-State: AC+VfDy7tHAThMA46TdvyKxDGbgE2/kNk6iq4wXlZSjRh6/s/iMrvP8+
        frFNkOq7eEmmv3MMbS81+ZtX3QbZhFlKgcTIdtN0NVb0l1dzX7h0xBJysJJTXLXWfKQaFovLTQx
        X2/oWIdlJ72+ggNcny90igak=
X-Received: by 2002:a05:6402:1106:b0:50d:fba2:7265 with SMTP id u6-20020a056402110600b0050dfba27265mr7220127edv.16.1686654130222;
        Tue, 13 Jun 2023 04:02:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4UNGDecrSFepZZtmpFy1OLT1r8hsa2RWOGU1o2ZL/k4XJbnUHcSo/HzjwXsG0i/E1hPOMsJQ==
X-Received: by 2002:a05:6402:1106:b0:50d:fba2:7265 with SMTP id u6-20020a056402110600b0050dfba27265mr7220110edv.16.1686654129920;
        Tue, 13 Jun 2023 04:02:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a25-20020aa7d919000000b00511aea132b9sm6304622edr.3.2023.06.13.04.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 04:02:09 -0700 (PDT)
Message-ID: <a1549a2b-4fc7-b12d-42af-7ebdb916bac3@redhat.com>
Date:   Tue, 13 Jun 2023 13:02:08 +0200
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
References: <20230612141632.5232-1-hdegoede@redhat.com>
 <20230612141632.5232-2-hdegoede@redhat.com>
 <1b87ee9f-8de8-6923-111d-a9d889451d80@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <1b87ee9f-8de8-6923-111d-a9d889451d80@linux.intel.com>
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

On 6/13/23 10:10, Ilpo Järvinen wrote:
> On Mon, 12 Jun 2023, Hans de Goede wrote:
> 
>> The INT3472 discrete code assumes that the ACPI GPIO resources are
>> in the same order as the pin-info _DSM entries.
>>
>> The returned pin-info includes the pin-number in bits 15-8. Add a check
>> that this matches with the ACPI GPIO resource pin-number in case
>> the assumption is not true with some ACPI tables.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/platform/x86/intel/int3472/discrete.c | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
>> index 4ef60883154d..c1132bbbff41 100644
>> --- a/drivers/platform/x86/intel/int3472/discrete.c
>> +++ b/drivers/platform/x86/intel/int3472/discrete.c
>> @@ -149,8 +149,8 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>>  {
>>  	struct int3472_discrete_device *int3472 = data;
>>  	struct acpi_resource_gpio *agpio;
>> +	u8 active_value, pin, type;
>>  	union acpi_object *obj;
>> -	u8 active_value, type;
>>  	const char *err_msg;
>>  	const char *func;
>>  	u32 polarity;
>> @@ -174,10 +174,18 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>>  		return 1;
>>  	}
>>  
>> +	/* Bits 7-0 contain the type/function of the pin */
>>  	type = obj->integer.value & 0xff;
>>  
>>  	int3472_get_func_and_polarity(type, &func, &polarity);
>>  
>> +	/* Bits 15-8 contain the pin-number on the GPIO chip */
>> +	pin = (obj->integer.value >> 8) & 0xff;
>> +	if (pin != agpio->pin_table[0])
>> +		dev_warn(int3472->dev, "%s %s pin number mismatch _DSM %d resource %d\n",
>> +			 func, agpio->resource_source.string_ptr, pin,
>> +			 agpio->pin_table[0]);
>> +
>>  	/* If bits 31-24 of the _DSM entry are all 0 then the signal is inverted */
>>  	active_value = (obj->integer.value >> 24) & 0xff;
>>  	if (!active_value)
>>
> 
> These changes made me wonder why there aren't defines for the fields? 
> And then FIELD_GET() used to read the field. Most of those comments 
> would be documented by the define name itself.

That is a good idea for v2 I'll add a new 1/2 adding defines + switching
the existing cases to FIELD_GET() and I'll also switch to FIELD_GET()
here for v2.

Regards,

Hans




