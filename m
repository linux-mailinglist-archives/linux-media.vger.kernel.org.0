Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57F7C2E2189
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 21:38:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729081AbgLWUhN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Dec 2020 15:37:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbgLWUhN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Dec 2020 15:37:13 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B002C061794;
        Wed, 23 Dec 2020 12:36:32 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id y19so200975lfa.13;
        Wed, 23 Dec 2020 12:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=z8D0v9w6eLHS5d5x0vZY+QzqYtTC2mP/fYl8494giiU=;
        b=HadHxSMLhDZhkJqBkxDVtRCRHgzsranQMuvvPkCW8ZvWERI0I/IV3jmYhrnnUiBMI+
         7bhhS0TCu++x3528jZkIg0GBh93HvAHa4m5GFYkt4lut2M+43qdrkbdbQymCHGAvtZwS
         gPa9zaEGRLx854V8GzVDPvoNJd/vl09zAQV4+eIvWEF9DfOM/DN+IVabjMlyg7bFptR3
         peW/KIS0flnlEUh9OP1v+48hjIhLMv1IqpfCsHwsT5faZmJPdepA2s80mn0eUyUHOa0I
         zE3A8fT2QV1G2b1n/M8N0awGXrQEuf+3I6INY8xv14mX3oKWJIO6Mv1Ys47bGKcm+cBi
         Mqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z8D0v9w6eLHS5d5x0vZY+QzqYtTC2mP/fYl8494giiU=;
        b=NuFCPNAWMAGI2tvpGe3rm55rQCqnA719GLlwIbLfehNtvyZu96my/rVq9V81m5YYrs
         lNXl47ht+bNJG2IWLj5jIROh89w4ZI4s3+mtrgTzlFd2VxCzlC29Nnoc4hj5DpgBGP1G
         JEYEHjhOHtj/PtdvDDI2wGzktFSJ7oBc0Wthf/c6JH6xTlFwUp4koY0HFqNjJmZmaY4L
         bs0lwY7GrROJB3zfgPDZQNvK066t5kIUULkqGt+6NuxjvVro7JVXTpIsoX6nGg20d3bc
         iQMnMR8rvXS/nArfrz2aMsnMWYdFfQmQWW/+pFOR4Zfi3WdTe4SFF+sU1J3yNYg1qV2j
         2LMg==
X-Gm-Message-State: AOAM532IP10rLSQwk+rem++JU87ftuhB6mXWK8p43GI5mOlIbfJ913xL
        oQGPToTiEGA6rIOITtiRGotdLErq6sM=
X-Google-Smtp-Source: ABdhPJysbMlvfYnsC/QFSGO0Bwu3xJ1EeyAih0QH/oKOK6cjPT+k0t3f+Uj1mCTnFpE6RS2H9psSPA==
X-Received: by 2002:a2e:980f:: with SMTP id a15mr12009304ljj.301.1608755790793;
        Wed, 23 Dec 2020 12:36:30 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id y20sm3658851lji.86.2020.12.23.12.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Dec 2020 12:36:30 -0800 (PST)
Subject: Re: [PATCH v2 19/48] opp: Fix adding OPP entries in a wrong order if
 rate is unavailable
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-20-digetx@gmail.com>
 <20201222091255.wentz5hyt726qezg@vireshk-i7>
 <db6273e6-8406-b7ae-b51d-48ceb6d21962@gmail.com>
 <20201223043443.rklw5er6hck3gl4y@vireshk-i7>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7688d6b9-52a2-d30f-123f-43c01e03b968@gmail.com>
Date:   Wed, 23 Dec 2020 23:36:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201223043443.rklw5er6hck3gl4y@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

23.12.2020 07:34, Viresh Kumar пишет:
> On 22-12-20, 22:19, Dmitry Osipenko wrote:
>> 22.12.2020 12:12, Viresh Kumar пишет:
>>> On 17-12-20, 21:06, Dmitry Osipenko wrote:
>>>> Fix adding OPP entries in a wrong (opposite) order if OPP rate is
>>>> unavailable. The OPP comparison is erroneously skipped if OPP rate is
>>>> missing, thus OPPs are left unsorted.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>> ---
>>>>  drivers/opp/core.c | 23 ++++++++++++-----------
>>>>  drivers/opp/opp.h  |  2 +-
>>>>  2 files changed, 13 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
>>>> index 34f7e530d941..5c7f130a8de2 100644
>>>> --- a/drivers/opp/core.c
>>>> +++ b/drivers/opp/core.c
>>>> @@ -1531,9 +1531,10 @@ static bool _opp_supported_by_regulators(struct dev_pm_opp *opp,
>>>>  	return true;
>>>>  }
>>>>  
>>>> -int _opp_compare_key(struct dev_pm_opp *opp1, struct dev_pm_opp *opp2)
>>>> +int _opp_compare_key(struct dev_pm_opp *opp1, struct dev_pm_opp *opp2,
>>>> +		     bool rate_not_available)
>>>>  {
>>>> -	if (opp1->rate != opp2->rate)
>>>> +	if (!rate_not_available && opp1->rate != opp2->rate)
>>>
>>> rate will be 0 for both the OPPs here if rate_not_available is true and so this
>>> change shouldn't be required.
>>
>> The rate_not_available is negated in the condition. This change is
>> required because both rates are 0 and then we should proceed to the
>> levels comparison.
> 
> Won't that happen without this patch ?

No

