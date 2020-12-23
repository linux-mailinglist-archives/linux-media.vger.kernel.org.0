Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9B82E21B9
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 21:49:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728893AbgLWUs4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Dec 2020 15:48:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727008AbgLWUsz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Dec 2020 15:48:55 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07D52C061794;
        Wed, 23 Dec 2020 12:48:15 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id y19so264107lfa.13;
        Wed, 23 Dec 2020 12:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XAOZFX5PmO3BnjJ+pCRmO9VP1XkSYch3y2iUGGqB3o8=;
        b=Hkvv+mPSRToI5mHA8J6YUX4CFXMXssDIGtVj6ay0ksThjJWupHF+KIutY8dH4sL7ed
         du7+7yoSg/YOCXgiTfEyg4CyB2NpnVsLGJ89dV9SqoWOqPUSKFl+2NZOIeKzMxyTNXs6
         pvuhxNC+RAkVqtQKrSVHWh94rQCm6AEAARMEmMKIyG0Cczj8D1kgdOX+ldMR9yzqHekC
         yDjSgnsDvou5/c8J+cRX0bs8foGprzKYHTXElxVD89Q6W5OlGffGLeI2A5ZfRV+Jo9KY
         pbKavgg6wX3W4BZM+XSfnGSMohsNPFg6mW2yFVUGZi/CUBKgPDlW8uQkMqeBWYVO60Tr
         617g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XAOZFX5PmO3BnjJ+pCRmO9VP1XkSYch3y2iUGGqB3o8=;
        b=opHhOoBo6o1iBkav+nH8tcemcb/Zx0j2dojejo2H+WTXqdXRbf8pzXh0+7LmgGaMXr
         GXiuvVziVskZw2caR0nG6D1vjI/EKysfroZdjysu+iGSzd4DbMd/fq8Q5XERXGKBbPXP
         c0SY+GvEugGU7mCo888BrlGzauCPU+tcbgbHQZ2JxtGgsU8FNEbwCZE1jBPKiheXqoZc
         H3Sxkv4owq1jK5i9nr9ThkkpY9looqLoea80v0LXngQEab/zmwnLN+tuENuws4QjBHol
         4HWGwVnEkJxwarH24EudL11g32DA/oPygC2U+FtYy0EfcsovCSb8B95+mS0+rVTaT15a
         bVXQ==
X-Gm-Message-State: AOAM531L8s4WaTBAarwdtNuNHlnxQZq7IXa8qIhS+/VoIAo2Axu9zC5b
        7Wrlmx8SHlRqFsO/zvCoEi/vky6/liw=
X-Google-Smtp-Source: ABdhPJzjYrLYkWsalFBLSailKegbFX3ZOqy7cBTjqEzJ0UJwKuOkOkF6TKPSPxQv5z+pj73dmBDjnA==
X-Received: by 2002:a2e:9053:: with SMTP id n19mr10022964ljg.283.1608756493408;
        Wed, 23 Dec 2020 12:48:13 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id n8sm3351553lfi.48.2020.12.23.12.48.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Dec 2020 12:48:12 -0800 (PST)
Subject: Re: [PATCH v2 14/48] opp: Filter out OPPs based on availability of a
 required-OPP
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
 <20201217180638.22748-15-digetx@gmail.com>
 <20201222085940.y625zxee4tevbqm5@vireshk-i7>
 <9ed8bde3-f7b5-025c-c038-87f35ea39e5f@gmail.com>
 <20201223042200.ey2azaqizazrz6bp@vireshk-i7>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3c6a1e43-02c7-30d3-3aee-fde1dbf76472@gmail.com>
Date:   Wed, 23 Dec 2020 23:48:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201223042200.ey2azaqizazrz6bp@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

23.12.2020 07:22, Viresh Kumar пишет:
> On 22-12-20, 22:17, Dmitry Osipenko wrote:
>> 22.12.2020 11:59, Viresh Kumar пишет:
>>> On 17-12-20, 21:06, Dmitry Osipenko wrote:
>>>> A required OPP may not be available, and thus, all OPPs which are using
>>>> this required OPP should be unavailable too.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>> ---
>>>>  drivers/opp/core.c | 11 ++++++++++-
>>>>  1 file changed, 10 insertions(+), 1 deletion(-)
>>>
>>> Please send a separate patchset for fixes, as these can also go to 5.11 itself.
>>
>> Alright, although I don't think that this patch fixes any problems for
>> existing OPP users.
> 
> Because nobody is using this feature, but otherwise this is a fix for me.
> 
>>>> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
>>>> index d9feb7639598..3d02fe33630b 100644
>>>> --- a/drivers/opp/core.c
>>>> +++ b/drivers/opp/core.c
>>>> @@ -1588,7 +1588,7 @@ int _opp_add(struct device *dev, struct dev_pm_opp *new_opp,
>>>>  	     struct opp_table *opp_table, bool rate_not_available)
>>>>  {
>>>>  	struct list_head *head;
>>>> -	int ret;
>>>> +	int i, ret;
>>>>  
>>>>  	mutex_lock(&opp_table->lock);
>>>>  	head = &opp_table->opp_list;
>>>> @@ -1615,6 +1615,15 @@ int _opp_add(struct device *dev, struct dev_pm_opp *new_opp,
>>>>  			 __func__, new_opp->rate);
>>>>  	}
>>>>  
>>>> +	for (i = 0; i < opp_table->required_opp_count && new_opp->available; i++) {
>>>> +		if (new_opp->required_opps[i]->available)
>>>> +			continue;
>>>> +
>>>> +		new_opp->available = false;
>>>> +		dev_warn(dev, "%s: OPP not supported by required OPP %pOF (%lu)\n",
>>>> +			 __func__, new_opp->required_opps[i]->np, new_opp->rate);
>>>
>>> Why not just break from here ?
>>
>> The new_opp could be already marked as unavailable by a previous voltage
>> check, hence this loop should be skipped entirely in that case.
> 
> Then add a separate check for that before the loop as we don't need that check
> on every iteration here.
> 

Perhaps the break will be a better option in this case, since it won't
hurt at all to print the additional message even if OPP was already
disabled by another check. I'll update it in next revision, thanks.
