Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3097978966B
	for <lists+linux-media@lfdr.de>; Sat, 26 Aug 2023 14:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232585AbjHZMBk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Aug 2023 08:01:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232553AbjHZMBO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Aug 2023 08:01:14 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 304D82106
        for <linux-media@vger.kernel.org>; Sat, 26 Aug 2023 05:01:12 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-31c65820134so1383798f8f.1
        for <linux-media@vger.kernel.org>; Sat, 26 Aug 2023 05:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693051270; x=1693656070;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e+eXhSLXNHLuKFt2icjQRayN++XPNyHMO23BkpT9qXs=;
        b=QBZ1aRW+Jvn9WmlAu+k1+kQwoCSSdwwmmEm0IAMO9TCmEjHItgrzOi68gapWu04sRv
         uKtvicQVQntJA6zPAo9fBYlVsszYiijCbl1AtWh8lN1hDW2rAluovtjeuRo1eY2FZ79N
         mn2H9NpMNE11qssin0ZvkveSI42uEZrxvmsuec/WDX2cRdpddQTUVWT54+CniNwmHqY0
         XlynGdmCWEna6bHw4t2jM9Rthp1va97glxMM79bMSeI/413167gdfE4sMpODRhZS05PH
         SsLqyVmaUifi9bfko/vFH5Er4eafP/EjwRaBt6SUaKlO2qy8tPIybqVdEbgyFHWSggEo
         lLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693051270; x=1693656070;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e+eXhSLXNHLuKFt2icjQRayN++XPNyHMO23BkpT9qXs=;
        b=XsMDfC51xMX3b80BoISleP/i2e3pPYXzCiK+2ZlHud1QF2z2uPmhWBeqbtGq37ssjQ
         aHWh+IEZlJk3Ah7DeWlzCjndWJVbeWzcHnKAcGo+JMX1EpgughpNwiwWuvRDS9yQ68cS
         av0gD8RIwC20XeYJf8oWQWgq4vAyEy6zLhHXH7jgYLyyi+Y38V6S/J+WLZR5eNJsqwc3
         pIsa7VOjmtzXh8U3wA4x7YDEWchCRFzEsLScJ7RwtCmw1RSoVFFNmtVlCllYwclHDkMl
         T9hZsRGTQxLXXlyiTmhmUrahEaf+GXC36k3rLUrNmnjSZFEoVuQ3AWGmDbedf5eeRQnP
         VsfA==
X-Gm-Message-State: AOJu0Yy/QZcoNcfYJM1wLEiEoMzmTunV/UtScrpineMHIiHRb/F55AEY
        VZsLcWmfgb+CTqvlENZD7eS3PQ==
X-Google-Smtp-Source: AGHT+IFLgsWKdStlVhda9fqyPdXPeQSSaaflr542G+HPqKuxcCkunXN6CVt496YzsQX/p/FvAwVgJw==
X-Received: by 2002:adf:e5c4:0:b0:31a:e73f:3fe3 with SMTP id a4-20020adfe5c4000000b0031ae73f3fe3mr14891596wrn.34.1693051270454;
        Sat, 26 Aug 2023 05:01:10 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id j4-20020a5d4644000000b003179d7ed4f3sm4779867wrs.12.2023.08.26.05.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Aug 2023 05:01:09 -0700 (PDT)
Message-ID: <b2f8285d-30af-c8b1-92ce-f9370ac55a98@linaro.org>
Date:   Sat, 26 Aug 2023 13:01:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 07/15] media: qcom: camss: Capture VFE CSID dependency
 in a helper function
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>, rfoss@kernel.org,
        todor.too@gmail.com, agross@kernel.org, andersson@kernel.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230823104444.1954663-1-bryan.odonoghue@linaro.org>
 <20230823104444.1954663-8-bryan.odonoghue@linaro.org>
 <a84f33f5-cf46-48ef-a9a9-01acb926c145@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <a84f33f5-cf46-48ef-a9a9-01acb926c145@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/08/2023 11:02, Konrad Dybcio wrote:
> On 23.08.2023 12:44, Bryan O'Donoghue wrote:
>>  From sdm845 onwards we need to ensure the VFE is powered on prior to
>> switching on the CSID.
> And what's the symptom if we fail to ensure this? How can someone
> adding support for another platform tell whether the match-list
> should be expanded?

That person has to understand the dependency.

The first version of this patch >= SDM845 would mitigate needing to know 
to expand the list.

Rather than revisit that discussion, I will amend the commit log.

> 
>>
>> Alternatively we could model up the GDSCs and clocks the CSID needs
>> without the VFE but, there's a real question of the legitimacy of such a
>> use-case.
>>
>> For now drawing a line at sdm845 and switching on the associated VFEs is
>> a perfectly valid thing to do.
>>
>> Rather than continually extend out this clause for at least two new SoCs
>> with this same model - making the vfe_get/vfe_put path start to look
>> like spaghetti we can encoded the dependency in a helper function.
>>
>> Use csid_depends_vfe() for this purpose.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   .../media/platform/qcom/camss/camss-csid.c    | 20 +++++++++++++++++--
>>   1 file changed, 18 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
>> index 08991b070bd61..fd04ed112b564 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
>> @@ -146,6 +146,22 @@ static int csid_set_clock_rates(struct csid_device *csid)
>>   	return 0;
>>   }
>>   
>> +static bool csid_depends_vfe(u32 version)
> toggle_vfe_before_csid?

If that's clearer np.

>> +{
>> +	bool ret = false;
>> +
>> +	switch (version) {
>> +	case CAMSS_845:
>> +	case CAMSS_8250:
>> +		ret = true;
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +
>> +	return ret;
> I'm not sure if it would be okay with like C conventions and
> stuff, but this can be made shorter by returning from within
> the switch statement

Yes but you still need the explicit return at the end of the function or 
from memory at least some of the compiler/static analysis or checkpatch 
stuff - I forget which - will complain.

---
bod

