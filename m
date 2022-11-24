Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B548638020
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 21:21:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbiKXUVa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 15:21:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiKXUV3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 15:21:29 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13D4E976DF
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 12:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669321235;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Y7SgGz8B6Itg0j9xWA1UexLrHBvcMI06ThigEcp9530=;
        b=LTCGPqszEay47BFlHsw7GqpG95M+1wp2GWl3NG6wNIpTlxhVn0LF7tZt/4i+omhP6XtxvE
        GN4htKYmafGuAJaz5cjIqPakkj+F5rHZfolRcpLJUAO3Z+8UbWbQhFyLELTFFgqGU+VZBl
        bCGtbhJgADs/jnqYPgxa8UPsacZxRl4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-107-EDHix18mNpqYlj-u0B3s8A-1; Thu, 24 Nov 2022 15:20:33 -0500
X-MC-Unique: EDHix18mNpqYlj-u0B3s8A-1
Received: by mail-ed1-f71.google.com with SMTP id j9-20020a05640211c900b004698365dc84so1391970edw.0
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 12:20:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7SgGz8B6Itg0j9xWA1UexLrHBvcMI06ThigEcp9530=;
        b=J3wdhLXRinLR3SGfUo52TtYH1A+WKEjHa/NmWeAyWIzNvdqYkBn8sDQqJ3vefrXBBP
         S3Y0ld+iObg7cSPmVZv2cN9/0AhU+/IDLzxsA8d83roY4EIMtjWss2UmPCkqWNLh2nwb
         TEoTEbKPd1s0kOZxazYtEMkMHm5OzAPWM9dDDuWblKA6/wwS+KWruvlgaoqc5CgA/Ld9
         OQjZHtEqvIOSDZWr0cfrO9tHKjBaW/NMVZqyU4T0I50nWnH4BAFxFO8ZOzCshAAfoJSD
         Oxq7wf4HVJpCbKnt85cbBHV7Otg+euqgEa/mQ2XNUgTnAzluUFhzfSWKqRyjymqsgshF
         7rLw==
X-Gm-Message-State: ANoB5pmje8VnT9JDQFdGwnT8SpS1J6oGYaJbYQBiEhVpET8vFu21poYO
        SWJguEiFwNkcY+Hk4lIZnwKDPO5ZRtWXd87Xx6RCCAcvc9aqFUsGpqPNSSaKqB+8vMR3HpIFPfS
        g7DTK7Kmg/WjED5Gy9td1hJU=
X-Received: by 2002:a17:906:b04c:b0:78d:9b0a:7b0b with SMTP id bj12-20020a170906b04c00b0078d9b0a7b0bmr29173951ejb.197.1669321232604;
        Thu, 24 Nov 2022 12:20:32 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7aYxRRn2N/AP15AOTenR50qeEFUz3yRXR9+Y57bevOqG6qDVO9U9yDbFFScm6v+dsE9ySLVQ==
X-Received: by 2002:a17:906:b04c:b0:78d:9b0a:7b0b with SMTP id bj12-20020a170906b04c00b0078d9b0a7b0bmr29173939ejb.197.1669321232424;
        Thu, 24 Nov 2022 12:20:32 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id c9-20020aa7d609000000b0046150ee13besm884315edr.65.2022.11.24.12.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 12:20:31 -0800 (PST)
Message-ID: <e82b11bf-a872-a83e-6b02-7acfedcaf24b@redhat.com>
Date:   Thu, 24 Nov 2022 21:20:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/3] platform/x86: int3472/discrete: Refactor GPIO to
 sensor mapping
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221124200007.390901-1-hdegoede@redhat.com>
 <20221124200007.390901-2-hdegoede@redhat.com>
 <CAHp75VdWWXCvHnVaE3pYuntXyeP7zPOc6PpcQaXWFkEEPf+QxA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdWWXCvHnVaE3pYuntXyeP7zPOc6PpcQaXWFkEEPf+QxA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Thank you for the reviews!

On 11/24/22 21:09, Andy Shevchenko wrote:
> On Thu, Nov 24, 2022 at 10:00 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Make the GPIO to sensor mapping more generic and fold the
>> INT3472_GPIO_TYPE_RESET and INT3472_GPIO_TYPE_POWERDOWN cases into
>> a single generic case.
>>
>> This is a preparation patch for further GPIO mapping changes.
> 
> ...
> 
>> +static const char *int3472_dsm_type_to_func(u8 type)
>> +{
>> +       switch (type) {
>> +       case INT3472_GPIO_TYPE_RESET:
>> +               return "reset";
>> +       case INT3472_GPIO_TYPE_POWERDOWN:
>> +               return "powerdown";
>> +       case INT3472_GPIO_TYPE_CLK_ENABLE:
>> +               return "clken";
>> +       case INT3472_GPIO_TYPE_PRIVACY_LED:
>> +               return "pled";
>> +       case INT3472_GPIO_TYPE_POWER_ENABLE:
>> +               return "power-enable";
> 
> default:
>   return "unknown";
> 
> ?
> 
>> +       }
>> +
>> +       return "unknown";
>> +}
> 

In the passed some compiler versions complained about the non-void
function not ending with a return statement.

I guess I can give your variant a try (I agree it is more readable)
and of we get compiler warnings we can switch back.

I'll fix this up in the next version or when merging this,
depending on further feedback on the series.

Regards,

Hans




