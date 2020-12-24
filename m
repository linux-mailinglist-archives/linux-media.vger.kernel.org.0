Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA2812E26B8
	for <lists+linux-media@lfdr.de>; Thu, 24 Dec 2020 13:16:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728439AbgLXMOq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Dec 2020 07:14:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727114AbgLXMOp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Dec 2020 07:14:45 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02C7BC0617A6;
        Thu, 24 Dec 2020 04:14:05 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id o13so4394522lfr.3;
        Thu, 24 Dec 2020 04:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=56xAzTWTQQ5e5SGZuO7IksvEZZ4TGll9FyZCHqwaIyI=;
        b=IEomQfiR8gvwpl9AJ1ADx1wLAiBTpBe0MzDzBHrVnyksFAtoCQusyt2aOpddZtgnt0
         G2xrtk7dkAbPh5mrBpegI3zf7dejgxqz8zhdkTojfBT5HjUiBLt6rBGSE5riltq/UOKr
         3ZKU17K+r+LGVo70URY/QRisS+jbgdr71ZJH5blzCGp5+H4gymXTDKfWnCB9KDIcl+HM
         T4HCqn3iAd24R4Z9GQoCK9zagFdGfHbYb5fdrnMoYTtBGpdwl9FSDpYdZD074Gbqtp4/
         p1NmX52oYCijEX+U1K+BtSTXWdk/xK9mxVFoLZQ+izHlWVXianvWcZvnwwq9UECfsz1T
         g4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=56xAzTWTQQ5e5SGZuO7IksvEZZ4TGll9FyZCHqwaIyI=;
        b=uVoqfgfzt/1IW+KBohVGNkK2BOz3Zsk1KlPmBUDLUReY2CQCaBJ0JL8swgeTvYXVZP
         Yf0EpDCRyDXbw0mdZ4lw2t9A63cwGpmlxD9YdeAZFj0BavHe4noN74aYqKuKTcglGptq
         FakQRyg5Z54LAAuc3lX+keZYa1XYOw5zxz89iUDPhDIsrYoa8ulV0NC79SXBBfVCR5CY
         MAf+FfwmOnX3R8w59s/DfrSyrGgs34HQOuAz+MAkX+FbzYoBuFa4YWC/a/0tW+xNAokb
         zIbKRUmcvR2jSq2vqeGUgc70LzIou7i0D7O9cy+mRDhJwl6xZwX9k/rJMJAmfYu+BApO
         K0Zw==
X-Gm-Message-State: AOAM5302y+5LZh6f3iACoV75LKy+nggYYd+ws03ZarM+8j+2yvXsMVUg
        Axk3AoVvSysyWBuYZiXn0sex4jSajqc=
X-Google-Smtp-Source: ABdhPJxP11G59ZBkHMu4vd9Pr+ZWgnwRAd9GQgXayLcOGdnmuBtZJBd/bU3MOd1t2CqE+vlRVXlXOw==
X-Received: by 2002:a2e:80d4:: with SMTP id r20mr10520885ljg.495.1608812043389;
        Thu, 24 Dec 2020 04:14:03 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id c142sm3572365lfg.309.2020.12.24.04.14.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Dec 2020 04:14:02 -0800 (PST)
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
 <7688d6b9-52a2-d30f-123f-43c01e03b968@gmail.com>
 <20201224062826.frppxddfinjomfui@vireshk-i7>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fa54a097-7edd-89af-6233-1e71c131668c@gmail.com>
Date:   Thu, 24 Dec 2020 15:14:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201224062826.frppxddfinjomfui@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

24.12.2020 09:28, Viresh Kumar пишет:
> On 23-12-20, 23:36, Dmitry Osipenko wrote:
>> 23.12.2020 07:34, Viresh Kumar пишет:
>>> On 22-12-20, 22:19, Dmitry Osipenko wrote:
>>>> 22.12.2020 12:12, Viresh Kumar пишет:
>>>>> rate will be 0 for both the OPPs here if rate_not_available is true and so this
>>>>> change shouldn't be required.
>>>>
>>>> The rate_not_available is negated in the condition. This change is
>>>> required because both rates are 0 and then we should proceed to the
>>>> levels comparison.
>>>
>>> Won't that happen without this patch ?
>>
>> No
> 
> This is how the code looks like currently:
> 
> int _opp_compare_key(struct dev_pm_opp *opp1, struct dev_pm_opp *opp2)
> {
> 	if (opp1->rate != opp2->rate)
> 		return opp1->rate < opp2->rate ? -1 : 1;
> 	if (opp1->bandwidth && opp2->bandwidth &&
> 	    opp1->bandwidth[0].peak != opp2->bandwidth[0].peak)
> 		return opp1->bandwidth[0].peak < opp2->bandwidth[0].peak ? -1 : 1;
> 	if (opp1->level != opp2->level)
> 		return opp1->level < opp2->level ? -1 : 1;
> 	return 0;
> }
> 
> Lets consider the case you are focussing on, where rate is 0 for both the OPPs,
> bandwidth isn't there and we want to run the level comparison here.
> 
> Since both the rates are 0, (opp1->rate != opp2->rate) will fail and so we will
> move to bandwidth check which will fail too. And so we will get to the level
> comparison.
> 
> What am I missing here ? I am sure there is something for sure as you won't have
> missed this..
> 

Ah, you're right. It was me who was missing something as I see now,
after taking a closer look and trying to implement yours suggestion, my
bad. I'll improve this patch in the next revision, thanks!
