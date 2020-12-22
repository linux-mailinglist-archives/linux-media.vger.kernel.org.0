Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0772E0ED8
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 20:21:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727761AbgLVTUL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 14:20:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727298AbgLVTUK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 14:20:10 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22759C0613D3;
        Tue, 22 Dec 2020 11:19:30 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id a12so34548474lfl.6;
        Tue, 22 Dec 2020 11:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ulrdoVbGsjwhkH0t5gig0hbyBd9UYXc8gP96903YDxw=;
        b=TfyVQnVt/DSKdLojw95WJ4Y3kr9B3JreJXSNeZLBEluhzjCcPf6K2C/ui4C3A+RAcn
         NzqrO2ZQ73TaLD5uGBoTA4sttmca1xpwHqU863FtGcUC88cxmEAsuxQikrmwuidA4uCP
         nm3AAm9TZcl214JdJVxmbY480arDu40d/ZRO/LMZqIPpdTU56ZnmabVMuRGGAvhILYBZ
         Lo8a4O4xH2G8xK6eSxS2dJykl50tEw6QNTNuUIOxtAh5QuaHw5oC9C+9K8KQXGYHYHDU
         yCrcC+UxT5hZUbtUNDzWRin0i+Cl3uko4BCCxLbueXyFERpjQkeXnBMSkzUwEXUzI6/8
         3Csg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ulrdoVbGsjwhkH0t5gig0hbyBd9UYXc8gP96903YDxw=;
        b=dsoeetUwex5UebJxUv84mb4Vs1xaKKF2Q9XEKlDDB/PAxF+LhRd9kq2qOyO91XkuWZ
         FH6jXitwHL23gonl/VgJNPxPaZE8z2zPiU3T2+DqMMqfrlc57sS4xU2Qc95guptKGaH4
         9PotBAowkweOIoLdOnAzPHizf59JUpUcRWxT4WMOdknjfn3GzUyMbVYZX/sg+Ez1IcZM
         jdIbM67HA/TpVjT+dSxXTcK9QmygC4+X0Wnf42VVaP9SLEPC8cj3ze8IpMP8uxILUiBb
         XM8EW7iRRryWKLjmvh9d+tUimbR2FWvPjFPz6pm7SvZTcdnalCek9YtFAoYBdvOiIz5K
         iWxg==
X-Gm-Message-State: AOAM5336fVnJPkK6YjvMNVhV2LwICm871pRIORHsGwDFEvK8gHgtqEBY
        3gbcJC0Qw2v3gd/BWvppGe+z6DyelkI=
X-Google-Smtp-Source: ABdhPJyniuH4JIVLYX09aJTJXG2DPOZ3u4RjQh1NfGfdwzaSui65HwnwuqSmtJhso1bwXfgrrij1mg==
X-Received: by 2002:ac2:46e4:: with SMTP id q4mr8665320lfo.413.1608664768348;
        Tue, 22 Dec 2020 11:19:28 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id w6sm3032131lji.74.2020.12.22.11.19.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Dec 2020 11:19:27 -0800 (PST)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <db6273e6-8406-b7ae-b51d-48ceb6d21962@gmail.com>
Date:   Tue, 22 Dec 2020 22:19:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201222091255.wentz5hyt726qezg@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

22.12.2020 12:12, Viresh Kumar пишет:
> On 17-12-20, 21:06, Dmitry Osipenko wrote:
>> Fix adding OPP entries in a wrong (opposite) order if OPP rate is
>> unavailable. The OPP comparison is erroneously skipped if OPP rate is
>> missing, thus OPPs are left unsorted.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/opp/core.c | 23 ++++++++++++-----------
>>  drivers/opp/opp.h  |  2 +-
>>  2 files changed, 13 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
>> index 34f7e530d941..5c7f130a8de2 100644
>> --- a/drivers/opp/core.c
>> +++ b/drivers/opp/core.c
>> @@ -1531,9 +1531,10 @@ static bool _opp_supported_by_regulators(struct dev_pm_opp *opp,
>>  	return true;
>>  }
>>  
>> -int _opp_compare_key(struct dev_pm_opp *opp1, struct dev_pm_opp *opp2)
>> +int _opp_compare_key(struct dev_pm_opp *opp1, struct dev_pm_opp *opp2,
>> +		     bool rate_not_available)
>>  {
>> -	if (opp1->rate != opp2->rate)
>> +	if (!rate_not_available && opp1->rate != opp2->rate)
> 
> rate will be 0 for both the OPPs here if rate_not_available is true and so this
> change shouldn't be required.

The rate_not_available is negated in the condition. This change is
required because both rates are 0 and then we should proceed to the
levels comparison.

I guess it's not clear by looking at this patch, please see a full
version of the function:

int _opp_compare_key(struct dev_pm_opp *opp1, struct dev_pm_opp *opp2,
         bool rate_not_available)
{
  if (!rate_not_available && opp1->rate != opp2->rate)
    return opp1->rate < opp2->rate ? -1 : 1;
  if (opp1->bandwidth && opp2->bandwidth &&
      opp1->bandwidth[0].peak != opp2->bandwidth[0].peak)
    return opp1->bandwidth[0].peak < opp2->bandwidth[0].peak ? -1 : 1;
  if (opp1->level != opp2->level)
    return opp1->level < opp2->level ? -1 : 1;
  return 0;
}

Perhaps we could check whether opp1->rate=0, like it's done for the
opp1->bandwidth. I'll consider this variant for v3, thanks.

