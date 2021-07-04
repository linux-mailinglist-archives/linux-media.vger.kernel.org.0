Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 663503BAD42
	for <lists+linux-media@lfdr.de>; Sun,  4 Jul 2021 15:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbhGDOBa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Jul 2021 10:01:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbhGDOBa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 4 Jul 2021 10:01:30 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3909C061762
        for <linux-media@vger.kernel.org>; Sun,  4 Jul 2021 06:58:54 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id l5so1957219wrv.7
        for <linux-media@vger.kernel.org>; Sun, 04 Jul 2021 06:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AQp+opcq8gKahHvP9xyG0B5OrrQoXI1GxKEWqLoPG1E=;
        b=FbKISM2e7MQ51yyaYUj98jeO01Q0NDunyeh7W8VVpfZl2ubo2g0zRVYLdbLBCGQ+Xv
         XgW/VGkggmLuozDqQ3DEzlaoutdOVheqyASkjiAHLlxqSnfPUT4smAdUnyXUxErMYMtl
         8Q6jCrMID7CTuExd9ADmdqFWQVCKZ2Xm3M6iLJUaQgiKcstMmB7i4C6q8hFT/urU7MHS
         tCerCqXuLjGYYlyzF75iRw5jNyker3nyw+qpGNc4cpq47UTQy6hM16o7h3mRED0VEcKH
         uiWNDeAsCoS4TQOI3iBbNP8Gpg60LvCCb06t8YFo9QDwkS6Q9n+Cg8SO0mDncWag1QNs
         Opow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AQp+opcq8gKahHvP9xyG0B5OrrQoXI1GxKEWqLoPG1E=;
        b=ectTTDjD+l6nSfTsph355YNDnFjOmFiK5wBaK7eNESb7hsi2YdB7ZzseK8w1L6hAww
         Ep/9y/jkmuAHIXzzIDq2qbs050lzYAt32XGVPBiCXlw0InA3hA5x9+hvDfEqix7Epwjk
         /PNvlne6tEl5wZilXEUFYaUtnsPIFm9ORG4pkOBWOlmL8SaF7ddnjegaNouxg3T66D+Y
         yoy3lK4MksAtnXVPes5d2d8G0nxL9EqiQXIZ3TaaL3zL7Do2kM0p+Ll41Q47y24qu7T0
         QZ8m3LpFQVZyjfZ09GU6k839NecndQQiDODwhO53ff5TifZfWwUi9C7LLFN3WQm0brKQ
         w5tw==
X-Gm-Message-State: AOAM532tt2EP4lLc5Dja3/22PP0ed756V7dR8jAI4wfWpkLXQ50L+IZG
        JZuzxa6Lti1PgLyvWMQRu1nLfA==
X-Google-Smtp-Source: ABdhPJz/t34HslG9IT4Y2TOgh3bGEgA26fcbsJ9fAOTaI/Azfert+18zeswp4GuFFt5o/71bW/6lag==
X-Received: by 2002:a5d:4711:: with SMTP id y17mr10477374wrq.355.1625407133253;
        Sun, 04 Jul 2021 06:58:53 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y66sm9361205wmy.39.2021.07.04.06.58.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jul 2021 06:58:52 -0700 (PDT)
Subject: Re: [V3] venus: helper: do not set constrained parameters for UBWC
To:     Bryan O'Donoghue <pure.logic@nexus-software.ie>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, dikshita@codeaurora.org
References: <1625202979-23232-1-git-send-email-mansur@codeaurora.org>
 <3c3051aa-c897-266e-9648-ca6be933fda0@nexus-software.ie>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <f2fd05a9-3aaf-1679-f152-90c30326dadd@linaro.org>
Date:   Sun, 4 Jul 2021 15:00:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <3c3051aa-c897-266e-9648-ca6be933fda0@nexus-software.ie>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/07/2021 15:00, Bryan O'Donoghue wrote:
> On 02/07/2021 06:16, Mansur Alisha Shaik wrote:
>> plane constraints firmware interface is to override the default
> 
> nitpick this should be "Plane constraints"
> 
>> alignment for a given color format. By default venus hardware has
>> alignments as 128x32, but NV12 was defined differently to meet
>> various usecases. Compressed NV12 has always been aligned as 128x32,
>> hence not needed to override the default alignment.
>>
>> Fixes: bc28936bbba9 ("media: venus: helpers, hfi, vdec: Set actual 
>> plane constraints to FW")
>> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
>>
>> Changes in V3:
>> - Elaborated commit message as per comments by Bryan
>> - As per Bryan comment alligned fixes in single line.
>> ---
>>   drivers/media/platform/qcom/venus/helpers.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/venus/helpers.c 
>> b/drivers/media/platform/qcom/venus/helpers.c
>> index 1fe6d46..601ee3e 100644
>> --- a/drivers/media/platform/qcom/venus/helpers.c
>> +++ b/drivers/media/platform/qcom/venus/helpers.c
>> @@ -1137,8 +1137,12 @@ int venus_helper_set_format_constraints(struct 
>> venus_inst *inst)
>>       if (!IS_V6(inst->core))
>>           return 0;
>> +    if (inst->opb_fmt == HFI_COLOR_FORMAT_NV12_UBWC)
>> +        return 0;
>> +
>>       pconstraint.buffer_type = HFI_BUFFER_OUTPUT2;
>>       pconstraint.num_planes = 2;
>> +
> 
> zap this newline, its not adding anything to your patch
> 
>>       pconstraint.plane_format[0].stride_multiples = 128;
>>       pconstraint.plane_format[0].max_stride = 8192;
>>       pconstraint.plane_format[0].min_plane_buffer_height_multiple = 32;
>>
> 
> then please add my
> 
> "Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>"
> 
> ---
> bod

Sorry sent from wrong email address

"Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>"
