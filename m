Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33AFE38E7A3
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 15:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233016AbhEXNbW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 09:31:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233059AbhEXNa6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 09:30:58 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CC73C061348;
        Mon, 24 May 2021 06:29:27 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id f12so33601186ljp.2;
        Mon, 24 May 2021 06:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xQ4af4RoffHiZWw1odnbmrmEK8rRB0AB3mboCujvWr8=;
        b=ICZbNAWSmmLc5SIJU/wxuITZR48alw2/TOGNeyM5P9n6LBeiok57tfHX7v66B2RyOh
         tCzNHxVyqMSrJbUJTzISJV7zFWmaFZPoQG5R6S4pL2Gp5uyZeBi8LZ0Q6VFYHpBbyMIo
         mdUL/vQETA/tnuFe9UVaDOYfjD+wSxaUIGymegy0rXM2yrpkmG44xJHw5lVnFG67KL+x
         cnjTg7NiLvW08G0auT1GgfZz+ReiRx451jgNFTEFipOE6Wh/Wx1auHxzar+iDK1NL1k2
         5tkqygLl5YjGYKoGiybYDDv8gTLY62owIr/PfjemwhRwSY9Ta9KGyxFixXyG+wZVmhME
         wJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xQ4af4RoffHiZWw1odnbmrmEK8rRB0AB3mboCujvWr8=;
        b=GtPTa46Cpt6gtfnQPiNnj5zl4pKST8iiiBWJ5sz1kEU/t4HChnS3fVftHbwDYWw3AE
         IfqC7LDPApiCzojv5Xlk3tPNOsBdC7qknsmg108/qaWUrApKpaaUi1Q+/OGohfcZ/sUN
         dlUfTcGTriZGQVSg2XE4fuCnHtkHj49LlHi5dg5N89mHA75gn0H0GK+fL1jC+MNfhTH4
         8G9bSrohxbCrqgB8o/4Har3NZS8njwXMcTkVzpI4pIrcxJdTjkeT8WTF5gKmuiG7OpLN
         iODh7wbXVNnfvK+jQt0qwADpbS/FvMpRMwKR/qrjfWuobwP99oxU8k+93kvK1hjPQJC/
         Pr0g==
X-Gm-Message-State: AOAM532KN82nOxqvFygfAFrCcDpmyLlVadl3/hfc3YB9Jt/pkw+/0Ha0
        7KpWy9wQRwWczVW7SF74TZw=
X-Google-Smtp-Source: ABdhPJwpliZ1bhzHrIn6k8dsn+ajuWurlDphmzkpHPvq//PUv6RJ3XDWfGrujfj76UVdbRyCyvLAcg==
X-Received: by 2002:a2e:92c8:: with SMTP id k8mr16866516ljh.100.1621862966377;
        Mon, 24 May 2021 06:29:26 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-110.dynamic.spd-mgts.ru. [109.252.193.110])
        by smtp.googlemail.com with ESMTPSA id h12sm1753363ljh.130.2021.05.24.06.29.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 May 2021 06:29:26 -0700 (PDT)
Subject: Re: [PATCH -next] media: staging: tegra-vde: Fix error return code in
 tegra_vde_probe()
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
References: <20210524133550.2363884-1-weiyongjun1@huawei.com>
 <db911ac9-2d08-ae30-03ea-dfb7db964441@gmail.com>
Message-ID: <1e05ad22-c4d8-c443-5377-7cd9db024cb9@gmail.com>
Date:   Mon, 24 May 2021 16:29:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <db911ac9-2d08-ae30-03ea-dfb7db964441@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

24.05.2021 16:27, Dmitry Osipenko пишет:
> 24.05.2021 16:35, Wei Yongjun пишет:
>> Fix to return a negative error code from the error handling
>> case instead of 0, as done elsewhere in this function.
>>
>> Fixes: dc8276b78917 ("staging: media: tegra-vde: use pm_runtime_resume_and_get()")
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>> ---
>>  drivers/staging/media/tegra-vde/vde.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
>> index e025b69776f2..321d14ba2e56 100644
>> --- a/drivers/staging/media/tegra-vde/vde.c
>> +++ b/drivers/staging/media/tegra-vde/vde.c
>> @@ -1071,7 +1071,8 @@ static int tegra_vde_probe(struct platform_device *pdev)
>>  	 * power-cycle it in order to put hardware into a predictable lower
>>  	 * power state.
>>  	 */
>> -	if (pm_runtime_resume_and_get(dev) < 0)
>> +	err = pm_runtime_resume_and_get(dev);
>> +	if (err < 0)
>>  		goto err_pm_runtime;
>>  
>>  	pm_runtime_put(dev);
>>
> 
> pm_runtime_resume_and_get() doesn't return positive values, the previous
> variant was okay.
> 
> You should also version your patches and add changelog.
> 

Ah, sorry. The other patch is from Yang Yingliang.
