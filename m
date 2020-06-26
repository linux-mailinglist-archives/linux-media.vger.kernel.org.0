Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0F3B20BAD7
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 23:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725832AbgFZVCA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 17:02:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgFZVB7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 17:01:59 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CA48C03E979
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 14:01:59 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id g20so7713522edm.4
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 14:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LXYsPzxFqoIvncAosoNMRVHsqqhFjqQaZzr24JDv6GU=;
        b=NkxXjwkadDehAxKBt5qCyqwJyMFjmm/tsHOXqKWLWtzcy08j6wps8G9hI84I2QbI7v
         JmPlb/jN0cduge6+zra8/rgtL1+VK0S8hNlbMgSv++L1OXl007Qgil5l6t2HYzNs2Fjv
         lKOEST9O7PwzOnyo7s1M+grpXcRcpYNaK8HJO7Xn+IyE4sfdot72A0q4TtrtOOs1eJpa
         Cu6xnc0AxSAzv0OVXC58pW5Z1HP/B7EKMvEiujSD7ZDggQool5FV/RdZ+HoKFrL67X39
         Hzmubt8ojRcl4Cbv3nsfwA7ejoobNmg3XQtNNJakalPzYE9PWqShM/bJsqWa3kA8g07d
         XqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LXYsPzxFqoIvncAosoNMRVHsqqhFjqQaZzr24JDv6GU=;
        b=cCB5xcIkjbP7zSYjEuVJK/LelFKK7/ZHQqP53fAhDacx6zE9w49Nkgxo6MS4g6+Ehn
         C3dVqGz+OcZ2qKR7HR2PZii2WvTIju4OEC1tTsNgwWQXo5KkPiHF2js45RKIIRHX/xn4
         akX67+Y0BqMHgt0Krp4EyRWo+CODJpdlVS8/mqF3xjnrwbMSeR4eTsH8fel7DI4uHhWq
         GZAwB1hLgHBxlhebd4VCp4JkDeNHG+L/tvGiufuj76M44pEghisfsaC4uBP3KYr1KEHi
         AdT/qQj1i+drmbVwhQzvLty+/MG5F9YVupf/9nF6W6ypJIL31fNpKlPFwt/00wT+1o4E
         Vb2g==
X-Gm-Message-State: AOAM533+br45KCt3Yf8DVE6rZUHYchYWfzK6MiXRWV7YItkXCQtPsNUO
        fJBox7KsPw6HLJ4o+7RX/NN7/M1710gFug==
X-Google-Smtp-Source: ABdhPJz4VyPgTDG4D3ybw9iMwdqQtilkEccK+e+ObiNd3vOfbKOSHwpWfeZklQ7XDUsrmMUMFhiOUQ==
X-Received: by 2002:a50:a721:: with SMTP id h30mr5397597edc.153.1593205317868;
        Fri, 26 Jun 2020 14:01:57 -0700 (PDT)
Received: from [192.168.1.4] (212-5-158-166.ip.btc-net.bg. [212.5.158.166])
        by smtp.googlemail.com with ESMTPSA id u19sm13890982edd.62.2020.06.26.14.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2020 14:01:57 -0700 (PDT)
Subject: Re: [PATCH] [v2] media: venus: core: Fix runtime PM imbalance in
 venus_probe
To:     dinghao.liu@zju.edu.cn
Cc:     kjlu@umn.edu, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200624063024.17059-1-dinghao.liu@zju.edu.cn>
 <812ead80-766b-1dad-1447-ffab5d7d2ee8@linaro.org>
 <35c749cf.28af7.172ee1e4ac3.Coremail.dinghao.liu@zju.edu.cn>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <f49040ee-a5c5-c106-2b51-cd48646306b0@linaro.org>
Date:   Sat, 27 Jun 2020 00:01:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <35c749cf.28af7.172ee1e4ac3.Coremail.dinghao.liu@zju.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 6/26/20 3:54 AM, dinghao.liu@zju.edu.cn wrote:
> 
>> Hi Dinghao,
>>
>> On 6/24/20 9:30 AM, Dinghao Liu wrote:
>>> pm_runtime_get_sync() increments the runtime PM usage counter even
>>> when it returns an error code. Thus a pairing decrement is needed on
>>> the error handling path to keep the counter balanced. For other error
>>> paths after this call, things are the same.
>>>
>>> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
>>> ---
>>>
>>> Changelog:
>>>
>>> v2: - Add pm_runtime_get_noresume() on failure of
>>>       pm_runtime_put_sync() to balance PM counter instead of
>>>       releasing everything here.

Could you reword this and add it to the patch description.

>>
>> You are adding pm_runtime_get_noresume in pm_runtime_put_sync error path
>> but the patch description is referring to pm_runtime_get_sync. I'm confused.
>>
> 
> When pm_runtime_put_sync failed, the control flow will jump to 
> err_dev_unregister, where has already been a pm_runtime_put_noidle. 
> If we don't add an extra pm_runtime_get_noresume here, we will 
> decrease PM usage counter twice.
> 
> Anyway, this may seem a little strange. Do you have a better
> strategy to reorder the labels?

No, it looks fine. With above addition to patch description:

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

> 
> Regards,
> Dinghao
> 
>>> ---
>>>  drivers/media/platform/qcom/venus/core.c | 5 ++++-
>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>>> index 203c6538044f..b0b932bf8c02 100644
>>> --- a/drivers/media/platform/qcom/venus/core.c
>>> +++ b/drivers/media/platform/qcom/venus/core.c
>>> @@ -287,8 +287,10 @@ static int venus_probe(struct platform_device *pdev)
>>>  		goto err_core_deinit;
>>>  
>>>  	ret = pm_runtime_put_sync(dev);
>>> -	if (ret)
>>> +	if (ret) {
>>> +		pm_runtime_get_noresume(dev);
>>>  		goto err_dev_unregister;
>>> +	}
>>>  
>>>  	return 0;
>>>  
>>> @@ -299,6 +301,7 @@ static int venus_probe(struct platform_device *pdev)
>>>  err_venus_shutdown:
>>>  	venus_shutdown(core);
>>>  err_runtime_disable:
>>> +	pm_runtime_put_noidle(dev);
>>>  	pm_runtime_set_suspended(dev);
>>>  	pm_runtime_disable(dev);
>>>  	hfi_destroy(core);
>>>
>>
>> -- 
>> regards,
>> Stan

-- 
regards,
Stan
