Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A47E64ECAF
	for <lists+linux-media@lfdr.de>; Fri, 16 Dec 2022 15:11:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbiLPOLT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Dec 2022 09:11:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230518AbiLPOLB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Dec 2022 09:11:01 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 971C926492
        for <linux-media@vger.kernel.org>; Fri, 16 Dec 2022 06:10:58 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id j4so3719745lfk.0
        for <linux-media@vger.kernel.org>; Fri, 16 Dec 2022 06:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kS8ZeKiUCR8+MYFNYax7Uf8MjHUAoKMQjTLTMCr4w04=;
        b=ODA2yDQpIwIz8f+EJj9tBTx0VnpbAaWWVL6Ah3mxoXk8euyygwoeB3A2qjaLcJZzHL
         pGzK3Q59cAjbvHbbv0uctr7DUC7Wfk1lOwoaxT5UlocpgLgAH+kKwu6slXeG1rLEG7Q1
         DXtsyd8cu+XmtQ7vTxCLCC1Xr0JBQlibPUsHQAEjPDe+J98pAXmD2UOndlcfvkrF9Zge
         aLWzN0sU8TeG7v3F75uCIfxkSf5TTqAxX5JWS5B0/BKPbYVriU7sOQ8464RU+zHymIRd
         eruP9VYx9GWyNbtIkS2E4sU1ErIJTLmQo4AYa4Y+we0kJ/2ot+QVcRU1bGnVK2qCQ0qX
         WfgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kS8ZeKiUCR8+MYFNYax7Uf8MjHUAoKMQjTLTMCr4w04=;
        b=avWFI/0yl+iP9MjJXXQqu3WKv6GP6plnVE1fkQ3e2HiBtVerT/N/ZDYkBDjQUmvRbR
         BfYI1KSoYFSloHQHO9RuUCeS8ZRB47ZD95IU/zxvDdiv+eOOkz6/nJCbp+BUYsHNrBRc
         Sr4anYuOmBatCZ4axJmGiKQWeRRvlLEXh3RagwRqIO8OH3EZTdtU/cXNg04Lqi6vBNlz
         fPn9gDgFaHjJJuSluN7CeGUwVi3wcX9zunTc8ctPtTw5aseC5ewdJ1ttblCZPGwBpAeJ
         U3yfrD7kVJwEiERT9tNTYYEQs6CURE1yC6Xu23i+t/2k5k6UJBCOSCVsWfxblP+qon2e
         qIlA==
X-Gm-Message-State: ANoB5pkLpNz34vTmt2c/WFH+e/teYBCwK3iHt9EA8FHDvcERe0U/NJNf
        fLt2ParQ6D0EqhiaDB9CKClj/Q==
X-Google-Smtp-Source: AA0mqf4Gbm4Fkka896QZfxdkrUWTv41o5l+be1bk/8yhvhmQbCZswzjIsP4TlZ0UEH9zI76S3f2CVg==
X-Received: by 2002:a05:6512:32cd:b0:4a4:7cab:3b99 with SMTP id f13-20020a05651232cd00b004a47cab3b99mr10010897lfg.8.1671199856780;
        Fri, 16 Dec 2022 06:10:56 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v20-20020a05651203b400b00494a2a0f6cfsm228619lfp.183.2022.12.16.06.10.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 06:10:56 -0800 (PST)
Message-ID: <51ef1ff4-db3d-64aa-aa9d-82f604a314c1@linaro.org>
Date:   Fri, 16 Dec 2022 15:10:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/3] media: ov5640: Handle delays when no reset_gpio set
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jai Luthra <j-luthra@ti.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20221216134409.6868-1-j-luthra@ti.com>
 <20221216134409.6868-2-j-luthra@ti.com>
 <Y5x5UbtLFDpFIoEp@paasikivi.fi.intel.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y5x5UbtLFDpFIoEp@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/12/2022 14:57, Sakari Ailus wrote:
> Hi Jai,
> 
> Thanks for the set.
> 
> On Fri, Dec 16, 2022 at 07:14:07PM +0530, Jai Luthra wrote:
>> Some module manufacturers [1][2] don't expose the RESETB gpio of the
>> sensor directly through the 15-pin FFC connector. Instead wiring ~PWDN
>> as a proxy reset with appropriate delays.
>>
>> In such cases, reset_gpio will not be available to the driver, but it
>> will still be toggled when the sensor is powered on, and thus we should
>> still honor the wait time of >= 5ms + 1ms + 20ms (see figure 2-3 in [3])
>> before attempting any i/o operations over SCCB.
>>
>> [1] https://digilent.com/reference/_media/reference/add-ons/pcam-5c/pcam_5c_sch.pdf
>> [2] https://www.alinx.com/public/upload/file/AN5641_User_Manual.pdf
>> [3] https://cdn.sparkfun.com/datasheets/Sensors/LightImaging/OV5640_datasheet.pdf
>>
>> Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>> ---
>>  drivers/media/i2c/ov5640.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
>> index e0f908af581b..4bb7bf557cfa 100644
>> --- a/drivers/media/i2c/ov5640.c
>> +++ b/drivers/media/i2c/ov5640.c
>> @@ -2466,6 +2466,7 @@ static int ov5640_set_power_on(struct ov5640_dev *sensor)
>>  
>>  	ov5640_reset(sensor);
>>  	ov5640_power(sensor, true);
>> +	usleep_range(26000, 30000);
> 
> I think you should only do this if you don't have RESETB pin.
> 
> I'm not sure how to best describe this in DT. It's not the same as if you
> didn't have RESETB GPIO.

Why it's not the same? I understand the RESETB pin is always there just
sometimes going to GPIO and sometimes to some other line.

Best regards,
Krzysztof

