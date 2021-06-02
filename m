Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73FBA3985B7
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 11:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231375AbhFBJy6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 05:54:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbhFBJy6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Jun 2021 05:54:58 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88B0EC061756
        for <linux-media@vger.kernel.org>; Wed,  2 Jun 2021 02:53:15 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id cb9so2209769edb.1
        for <linux-media@vger.kernel.org>; Wed, 02 Jun 2021 02:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=R+UA/QItNObeMQQscZ4ivUcRFeqMf57DAC45WgOVgmY=;
        b=b0rR34OP4uOaXepns0xG74caSrzPD9qMYG1pa3l8duCvyQLD3BLgAOFJ1sqAQCNdja
         2+CIRHJzfULinBmSF+djnPdbv11fJK5nSTnFYSe/N4o9xal5rbRnNFqUbpi0p+jxoWs4
         ZXzFL2ndKx/uLucPEjaue4bPpGhuugMG6TyrOXyPCxtJYX6vhDPq/3MPYbCSPQyRwsSl
         7HCBsFWbkg88xUJ5ns0Tf0RWDUYOgMAkaLMsRew4e9/2+/NvP4v/IasGKo5dQRvlmI8w
         vXWp+erbEry7ULfFkfhCg8/igaOcKxsqLQ27u8Y7FD9szVtpdaj1hQ09nHIWc57ToeXs
         1j5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R+UA/QItNObeMQQscZ4ivUcRFeqMf57DAC45WgOVgmY=;
        b=i5r9LVaSZjJscR4bfAiGXsfceVrCaEMawq+SlF1jCUFXItmhJTfbKT5uQR5YtHtQWo
         H7Y1M8mdLIRVSJfSmanTMFFThrVtZcJhaM61avTVv3vyq1L1ziSLjpgz5LkXg2bAoIMJ
         dPlxo/qO2BnoMjdOE5vLtb0sEyM2T8gdTGgApwG6GURpPHZk9RucSFDRByCzJ+VakNC/
         3Zgovr4UfEQhFUAJJJCHzUi289nycDj7ar6dofpa+bu1Owalx7oUFkl7L8a87i3b6nYG
         uPrDm+UQtRK3ZJtmqMlhDHLh8sLheyqZDafcepCxD9a8QxDmKZ6oSbzL4kw9cNTHZvAO
         WVYQ==
X-Gm-Message-State: AOAM5309t0N1505F1QspwjkNmhiyBVWQ22As5LexH7wiWIMuqHYD/M8K
        SMlrl0+Qf9dkYWe5yr8HW4r1jQ==
X-Google-Smtp-Source: ABdhPJzjmZwyiiQ+KS0RDNdqHKOItIOjEgtddjOKgTLB4VV8zjvl9jry6WRY4MJ8NH7jnQJCjNHb9Q==
X-Received: by 2002:aa7:d755:: with SMTP id a21mr18386424eds.146.1622627594218;
        Wed, 02 Jun 2021 02:53:14 -0700 (PDT)
Received: from [192.168.1.28] (hst-221-100.medicom.bg. [84.238.221.100])
        by smtp.googlemail.com with ESMTPSA id d11sm935808ede.74.2021.06.02.02.53.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jun 2021 02:53:13 -0700 (PDT)
Subject: Re: [PATCH] venus: helper: do not set constrained format for UBWC
To:     Bryan O'Donoghue <pure.logic@nexus-software.ie>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, dikshita@codeaurora.org
References: <1622195288-18541-1-git-send-email-mansur@codeaurora.org>
 <a66e00f2-af3a-9550-0779-625152cc2719@nexus-software.ie>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <17aaec56-bfad-63a6-b1c4-7562dedb3137@linaro.org>
Date:   Wed, 2 Jun 2021 12:53:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a66e00f2-af3a-9550-0779-625152cc2719@nexus-software.ie>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Mansur, could you answer to Bryan's comments?

On 5/28/21 8:23 PM, Bryan O'Donoghue wrote:
> On 28/05/2021 10:48, Mansur Alisha Shaik wrote:
>> Do not set constrained format explicitly for UBWC
>>
>> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> 
> Could you give a little bit more detail on why, what the side effects are ?
> 
> Should this be a Fixes: ?
> 
>> ---
>>   drivers/media/platform/qcom/venus/helpers.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/venus/helpers.c
>> b/drivers/media/platform/qcom/venus/helpers.c
>> index b813d6dba..e4b8a2a 100644
>> --- a/drivers/media/platform/qcom/venus/helpers.c
>> +++ b/drivers/media/platform/qcom/venus/helpers.c
>> @@ -1138,8 +1138,12 @@ int venus_helper_set_format_constraints(struct
>> venus_inst *inst)
>>       if (!IS_V6(inst->core))
>>           return 0;
>>   +    if (inst->opb_fmt == HFI_COLOR_FORMAT_NV12_UBWC)
>> +        return 0;
>> +
>>       pconstraint.buffer_type = HFI_BUFFER_OUTPUT2;
>>       pconstraint.num_planes = 2;
>> +
> 
> Additional newline should be removed.
> 
>>       pconstraint.plane_format[0].stride_multiples = 128;
>>       pconstraint.plane_format[0].max_stride = 8192;
>>       pconstraint.plane_format[0].min_plane_buffer_height_multiple = 32;
>>
> 
> ---
> bod

-- 
regards,
Stan
