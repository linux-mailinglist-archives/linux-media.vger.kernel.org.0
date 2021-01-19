Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B4082FB3A5
	for <lists+linux-media@lfdr.de>; Tue, 19 Jan 2021 09:02:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730894AbhASIBp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 03:01:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729993AbhASIAZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 03:00:25 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24652C061757
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 23:59:44 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id p22so20351319edu.11
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 23:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=N3oQVFDD2OO6IL6zbge+VvrfxMcHQq0KNtK/qBzCFsc=;
        b=ztMy3qngkDrMUnpW5LjO0RrtrW1+iO2EdZShwfH9OGMSMH1DvX8DQl+t01HMwzpJcd
         zaDeTr+WAOP4d18I1QDsXKWPfXYmE1iXnTUigTuVREC3O0M4ZwB7Rih1hCaWxHh5eG6f
         702D3bKFvM9Ra+N7y0Ya6uiUKMCrE30Bvq7m0Kf5hS9JkuoV5kN6QUBqB9krrrKcqEoE
         CYjklsphNbYBh4OvltSurGJ+9aJY1P2R2flzdNtQlXXee958kkQZjDGQTnZI8XGV4gCS
         7BNaN8FOGIhMFLch9amf/WCo5vQ32KXDkNtLk8Nj5vZvB0ljyaNXyECurpaBjbxWfAhx
         NaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=N3oQVFDD2OO6IL6zbge+VvrfxMcHQq0KNtK/qBzCFsc=;
        b=DFlr4XrbULedbT+DAryoMX1R4THPKAh7cCbezOe0RKOak2uiuf9WfeyK9E+fWj/oBb
         MfZljucS7yEncaQow7vA8T1il9DBZhEw2LVYYBH+xMa0qjLyPjgROWd77iIw8hr5ECr8
         KURfCPTR6n0yrOv+n05bVcBo348Ufg2Pi8chrggcePyFO+74yNMaqG6C4+As7zhQaaF0
         7wU1yIZw3U9jtd/ggjXMuvyy+956hf5gnlZLg6VPfYWFkeS5Mo1jOazCRt3PTGQxi6TR
         DN9yGLtJ7MRSLzULOXpuK0zK7vWV2rlzaQNXtSZBwldEvRx1jp2lVZXvbrmEx1zWxjIi
         Z/NA==
X-Gm-Message-State: AOAM532xm3ARQZ4+ttYk7R//GWWrshDzlyB/hku6dP5Oog+/zDbepUZY
        QxCvZiozoFwCLTIszXetOqZrMQ0tFAX/vwl5
X-Google-Smtp-Source: ABdhPJymbSINexw7sN7HVMR/EmLkqH7Fm1TbDnwinCyGkk+du1UwghGE9kwKZnF2KerIX/MbQe9ceQ==
X-Received: by 2002:aa7:d5d5:: with SMTP id d21mr2445194eds.252.1611043182809;
        Mon, 18 Jan 2021 23:59:42 -0800 (PST)
Received: from [192.168.0.3] (hst-221-113.medicom.bg. [84.238.221.113])
        by smtp.googlemail.com with ESMTPSA id p3sm11731346edh.50.2021.01.18.23.59.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jan 2021 23:59:42 -0800 (PST)
Subject: Re: [PATCH] venus: core: Fix platform driver shutdown
To:     Shawn Guo <shawn.guo@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
References: <20201221095820.27192-1-stanimir.varbanov@linaro.org>
 <20210119074044.GB17701@dragon>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <72d85c1b-ec0b-3cf1-dbbc-6c4924e4beec@linaro.org>
Date:   Tue, 19 Jan 2021 09:59:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210119074044.GB17701@dragon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 1/19/21 9:40 AM, Shawn Guo wrote:
> On Mon, Dec 21, 2020 at 11:58:20AM +0200, Stanimir Varbanov wrote:
>> With TZ system reboot cannot finish successfully. To fix that
>> enable core clocks by runtime pm before TZ calls and disable
>> clocks after that.
>>
>> Fixes: 7399139be6b2 ("media: venus: core: add shutdown callback for venus")
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> 
> Hi Mauro,
> 
> Could you help pick this fix up?

Shawn, it is part of linux-next already.

> 
> Shawn
> 
>> ---
>>  drivers/media/platform/qcom/venus/core.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>> index bdd293faaad0..7233a7311757 100644
>> --- a/drivers/media/platform/qcom/venus/core.c
>> +++ b/drivers/media/platform/qcom/venus/core.c
>> @@ -349,8 +349,10 @@ static void venus_core_shutdown(struct platform_device *pdev)
>>  {
>>  	struct venus_core *core = platform_get_drvdata(pdev);
>>  
>> +	pm_runtime_get_sync(core->dev);
>>  	venus_shutdown(core);
>>  	venus_firmware_deinit(core);
>> +	pm_runtime_put_sync(core->dev);
>>  }
>>  
>>  static __maybe_unused int venus_runtime_suspend(struct device *dev)
>> -- 
>> 2.17.1
>>

-- 
regards,
Stan
