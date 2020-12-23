Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0DA02E21A2
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 21:41:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbgLWUj3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Dec 2020 15:39:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727498AbgLWUj2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Dec 2020 15:39:28 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FC16C061794;
        Wed, 23 Dec 2020 12:38:48 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 23so253318lfg.10;
        Wed, 23 Dec 2020 12:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BZZtJhCkWZc0cTu4suSdN5Dy6qe4mWg5o8z0m1xWmmw=;
        b=ryiTXp95qJn3hFRmeJjFriZA3fRZe1LJkWmcStreS7S1HQzZvQ0MFhnfpf8nwhNZ+4
         byR/kGF7kq8hlx5i8bOSUk5NbfdQl49IIHl5VzTJhFAUygr8vLTNhJ6H9Fr/z4s+Who0
         JSriRDvMEt/sMeC73CcldS07HXFoDDBz34L54otuUG5Pah50GAz4ZCG0agHFcRBy4X2B
         uyI9p6Hg2CYCO7Yg+T9pERyUpRZJUMR2bvIpKnby2t9wroelhS9PxVj2Q6pIuSrKlNIU
         RU2TtFLooW88UoEwgf+7Giff7nBqFk13MWhzd5vTNj//iXu3ditDHhkIaXA/gzp/AW4E
         TNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BZZtJhCkWZc0cTu4suSdN5Dy6qe4mWg5o8z0m1xWmmw=;
        b=Aq94JeFAYshv6j108td46upSWxVu9zLt/MGZlJYnooKT0lOlCzDN7nj2Hv2YMn32AG
         bU2xbfSIrlqAfZHnafJ+mtp1OvNTbVgReX2ZZRjPf2pRtOMu80wYtv/w/9PoKQ/Es3el
         4r92PUNXIO73w0oNVw4LDto8n6p1tOf5QrhYSsWb/fLMB+tBNJv11SVs8CAS+6QqwPtV
         ZxmVdx28yPCLPA08duTgHVNXnkbmCZe767PuRcrlzIDip4rtq+JmjuASbuTmCLAFueZS
         +DFlmK4R+ig2PJFEr3qrBFXhzYrDgKJQPz57vEa2HJuATx3uyk7xVNpiRjQNeebmUMHb
         kZsg==
X-Gm-Message-State: AOAM532bnOiVHX+G8DcQp346vfIAblsi2ewfiQXdfROjCKDEqykXai9C
        TyWeIjD5C4qDE6q76Qh+xbrEReT3t8Y=
X-Google-Smtp-Source: ABdhPJwfBMyGf+UGyLbLjeTseB6B9wXUQfbXnzUgDrthVMBm31fXo34JrVL1gowO+ssG8p2R1uqvrg==
X-Received: by 2002:a19:f718:: with SMTP id z24mr12249722lfe.532.1608755926503;
        Wed, 23 Dec 2020 12:38:46 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id z3sm3378258lfj.140.2020.12.23.12.38.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Dec 2020 12:38:46 -0800 (PST)
Subject: Re: [PATCH v2 15/48] opp: Support set_opp() customization without
 requiring to use regulators
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
 <20201217180638.22748-16-digetx@gmail.com>
 <20201223060101.v2qihvvgsmpahg24@vireshk-i7>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ea025b0f-bb2a-d075-4c8e-45831fa9cd93@gmail.com>
Date:   Wed, 23 Dec 2020 23:38:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201223060101.v2qihvvgsmpahg24@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

23.12.2020 09:01, Viresh Kumar пишет:
> On 17-12-20, 21:06, Dmitry Osipenko wrote:
>> Support set_opp() customization without requiring to use regulators. This
>> is needed by drivers which want to use dev_pm_opp_set_rate() for changing
>> rates of a multiple clocks and don't need to touch regulator.
>>
>> One example is NVIDIA Tegra30/114 SoCs which have two sibling 3D hardware
>> units which should be use to the same clock rate, meanwhile voltage
>> scaling is done using a power domain. In this case OPP table doesn't have
>> a regulator, causing a NULL dereference in _set_opp_custom().
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/opp/core.c | 16 ++++++++++++----
>>  1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
>> index 3d02fe33630b..625dae7a5ecb 100644
>> --- a/drivers/opp/core.c
>> +++ b/drivers/opp/core.c
>> @@ -828,17 +828,25 @@ static int _set_opp_custom(const struct opp_table *opp_table,
>>  			   struct dev_pm_opp_supply *old_supply,
>>  			   struct dev_pm_opp_supply *new_supply)
>>  {
>> -	struct dev_pm_set_opp_data *data;
>> +	struct dev_pm_set_opp_data *data, tmp_data;
>> +	unsigned int regulator_count;
>>  	int size;
>>  
>> -	data = opp_table->set_opp_data;
>> +	if (opp_table->set_opp_data) {
>> +		data = opp_table->set_opp_data;
>> +		regulator_count = opp_table->regulator_count;
>> +	} else {
>> +		data = &tmp_data;
>> +		regulator_count = 0;
>> +	}
>> +
> 
> We should use the same structure, you can add some checks but not replace the
> structure altogether.

Well, there is no "same structure", the opp_table->set_opp_data is NULL
there.

I can re-write it like this if it looks better to you:

static int _set_opp_custom(...)
{
	struct dev_pm_set_opp_data *data;
	unsigned int regulator_count;
	int size;

+	if (!opp_table->set_opp_data) {
+		struct dev_pm_set_opp_data freq_data = {};
+
+		freq_data.dev = dev;
+		freq_data.clk = opp_table->clk;
+		freq_data.new_opp.rate = freq;
+		freq_data.old_opp.rate = old_freq;
+
+		return opp_table->set_opp(&freq_data);
+	}
