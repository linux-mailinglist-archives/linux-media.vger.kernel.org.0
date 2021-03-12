Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FDA9338433
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 03:57:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231467AbhCLC4t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 21:56:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231278AbhCLC4i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 21:56:38 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B20EC061574
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 18:56:38 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id t5-20020a1c77050000b029010e62cea9deso14296796wmi.0
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 18:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zh4S1eYfLvZ+SM76i9hM56kCFW9DsFt3lLk9qmmoL0c=;
        b=ZAUJ5qqdAUJ4HpU95oqrxnI5otMx1Ge6zjFZfT6v4Qs6Yb1WiJfiJIy0JfD6RECfxj
         FmKftU0ExMlMbpZEHl1rnTiwG/biZXNoaY5GtqRht/Kzj9Q0ljhuT5gUumb/J2ujgbLi
         E+6HkmLmqU2+y4hRwTNfX5j0bIQcH3DIXrqX/+v4kn8/y4J2EC9PQFNHtZVv9K/cXC8M
         eyL0TaOamLL9/8CMxInUhvFyK+7f02r2RqLh2tluERGvbYujcZzOmHsjng5LcFNLcSRX
         5B4J39JmsmVcZXy7OGyjEVw8V3elxVBJnqNtIPvI8JLAhpEgD8r1tn8B0SLwcr+h9Zqx
         +tfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zh4S1eYfLvZ+SM76i9hM56kCFW9DsFt3lLk9qmmoL0c=;
        b=h9LqRzVB4FDhtPdshE3X7THE+8ChC3m/rSqTldg+NvbA0vyVRUFKGPiE9u8b3tCry4
         mG6Vt7hG36H4HUTsNlcn0iH1u4QtcZsjUu5VoErjouLA2pHHbt/YNF81cUW49y1Hm5W3
         Idzo+GFGX9VYcQ6I1Jis9gWMNNpXs5IBrxSTpIlMv5le8eTz7p0XaSrfdZGUTb8EIoYH
         mzxxwOKj4T2E7XKGSCU3OcU7Ja8jQ7ClsGIYRsA0jjtDi5z3OSRCPcuxm1Aq5uv6yCPG
         FJBIFFDBlZRtoBpIsuzDP8y6RLJ39blN5PU8vpjbGgodUZW8G8t9SpXM+wRMwk0LnZuV
         Sc/g==
X-Gm-Message-State: AOAM530eCW2RKgj/m2xKCZweTcRV+rKft0Pq+z6XSiA0tx6yNbT9iRzl
        AdYhlrU1Kk5XCQk6dr93IDzB6Q==
X-Google-Smtp-Source: ABdhPJwkwY43z1yR7fFGUQYYeiZyXp6uECxmc4nzXFOwu0kDQ8jAh4H6XuBtf1lKKySovvZhch+PSA==
X-Received: by 2002:a05:600c:2109:: with SMTP id u9mr10850766wml.44.1615517795224;
        Thu, 11 Mar 2021 18:56:35 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 21sm660305wme.6.2021.03.11.18.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Mar 2021 18:56:34 -0800 (PST)
Subject: Re: [PATCH 22/25] media: venus: helpers, hfi, vdec: Set actual plane
 constraints to FW
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     dikshita@codeaurora.org, jonathan@marek.ca, vgarodia@codeaurora.org
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
 <20210222160300.1811121-23-bryan.odonoghue@linaro.org>
 <ce6b3821-7121-e894-ebaf-e718a551ac6d@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <86f80428-f779-7f3a-17b9-c9e7d53472fb@linaro.org>
Date:   Fri, 12 Mar 2021 02:58:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <ce6b3821-7121-e894-ebaf-e718a551ac6d@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/02/2021 08:00, Stanimir Varbanov wrote:
> 
> 
> On 2/22/21 6:02 PM, Bryan O'Donoghue wrote:
>> From: Dikshita Agarwal <dikshita@codeaurora.org>
>>
>> Set actual plane alignments to FW with
>> HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO to calculate
>> correct buffer size.
>>
>> bod: Fixed fall-through error in pkt_session_set_property_6xx() switch
>>
>> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   drivers/media/platform/qcom/venus/helpers.c  | 21 ++++++++++++++++++++
>>   drivers/media/platform/qcom/venus/helpers.h  |  1 +
>>   drivers/media/platform/qcom/venus/hfi_cmds.c | 13 ++++++++++++
>>   drivers/media/platform/qcom/venus/vdec.c     |  4 ++++
>>   4 files changed, 39 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
>> index f0413236a56f..49c52ef1084a 100644
>> --- a/drivers/media/platform/qcom/venus/helpers.c
>> +++ b/drivers/media/platform/qcom/venus/helpers.c
>> @@ -1113,6 +1113,27 @@ int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode)
>>   }
>>   EXPORT_SYMBOL_GPL(venus_helper_set_work_mode);
>>   
>> +int venus_helper_set_format_constraints(struct venus_inst *inst)
>> +{
>> +	const u32 ptype = HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO;
>> +	struct hfi_uncompressed_plane_actual_constraints_info pconstraint;
>> +
>> +	pconstraint.buffer_type = HFI_BUFFER_OUTPUT2;
>> +	pconstraint.num_planes = 2;
>> +	pconstraint.plane_format[0].stride_multiples = 128;
>> +	pconstraint.plane_format[0].max_stride = 8192;
>> +	pconstraint.plane_format[0].min_plane_buffer_height_multiple = 32;
>> +	pconstraint.plane_format[0].buffer_alignment = 256;
>> +
>> +	pconstraint.plane_format[1].stride_multiples = 128;
>> +	pconstraint.plane_format[1].max_stride = 8192;
>> +	pconstraint.plane_format[1].min_plane_buffer_height_multiple = 16;
>> +	pconstraint.plane_format[1].buffer_alignment = 256;
>> +
>> +	return hfi_session_set_property(inst, ptype, &pconstraint);
> 
> I wonder shouldn't we set this property for v6 only? Or mark this
> property as not supported for v1 up to v4.  Otherwise, I would expect
> regressions on the older v1 - v4.

BTW you're right, this breaks 1xx.
