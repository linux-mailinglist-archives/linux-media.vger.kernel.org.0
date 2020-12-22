Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0C292E0F07
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 20:40:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbgLVTkH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 14:40:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbgLVTkH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 14:40:07 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E868BC0613D3;
        Tue, 22 Dec 2020 11:39:26 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id o13so34669925lfr.3;
        Tue, 22 Dec 2020 11:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AXmwUpuWNJn38cCoFNVuvHMmW9DPfBIkbJHgySbTrrw=;
        b=qhbp83oxkp+XKHpp/ipG3+4cYLILpTA8B3LPXYULko36eEYzEuLQ6PIIkqkjjp8jca
         F8zkjPrGbcKZlopCxg9/W8ccSpILDTeoZDhOs8SqSe0WnuKj1Rg8MkCvV/Y+xPVr4/T2
         bySWKhGFfBl9ztrnVtCscB1PK+uxrauYIT98LJ+e3cnfQGmSp+uOGOrKcGkCDXu53Htd
         FWOlK/EGCABxVZIgoJzsN6DzFDiyMH7NjRPDpJKpl7ACruUSNzwurgEMRHJiOARXRjid
         n3DcfHOJotZPDU/dmSbiZD+2y999MlbTquJMsSHAf8Ia5pGCUqSphvVBwzsiLeVpUkR9
         wzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AXmwUpuWNJn38cCoFNVuvHMmW9DPfBIkbJHgySbTrrw=;
        b=sVFC+8tfxEpaNV4al8tHznbkjsY3hSUbMd1xpePAnkdvGIy03RU/ES1Cj5lfSKTFjL
         F1mJ+tOtzFWAtMGJSlaMCuvOmUuWaxbrVDCYVPJ0sNUXrD18mPTgmxeczqWJgpJXcovO
         qw0OHP+/ietr0yBa0/r0aXu6E3ArDnwMpXctULbedl3Ds70C9a3M1bHFXJ36o1/CxZcJ
         IwDEtO9P5FqksTEPCEyY9wmcf9I+ZW3Q49k5k462s4idp9uy+9Jq+xnborSicuF+q8Zs
         B+wBlqpya4uH9Yclcd6/9EmBxckguApAA0whZYRqqVwKxyU/Iie8/GwkN0R1cVAvN/vQ
         ZUMA==
X-Gm-Message-State: AOAM533oTi0E0T8SflgXrgmamF15VScFQGglhqfmiwCXq8fV+bI1e5Wp
        E13T3iUO1zXVcso0s1oI0pvyvflshjc=
X-Google-Smtp-Source: ABdhPJyfrGeIpedHRTkfPq2OVXdao1RLts2GM3W0hdHjDi2n640b5Lr3eO6uGqFDdIWm1uuJlaO1/g==
X-Received: by 2002:a19:5e5b:: with SMTP id z27mr9862776lfi.143.1608665965040;
        Tue, 22 Dec 2020 11:39:25 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id f24sm2769025lfc.231.2020.12.22.11.39.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Dec 2020 11:39:24 -0800 (PST)
Subject: Re: [PATCH v2 28/48] soc/tegra: Introduce core power domain driver
From:   Dmitry Osipenko <digetx@gmail.com>
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
 <20201217180638.22748-29-digetx@gmail.com>
 <20201222064029.duuzcsj53rt7xzvt@vireshk-i7>
 <c130f78d-3d97-9b26-be77-951fee0d8680@gmail.com>
Message-ID: <3a5c00e5-2cdd-35ce-2714-d4ffbf9d516a@gmail.com>
Date:   Tue, 22 Dec 2020 22:39:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <c130f78d-3d97-9b26-be77-951fee0d8680@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

22.12.2020 22:21, Dmitry Osipenko пишет:
>>> +	if (IS_ERR(opp)) {
>>> +		dev_err(&genpd->dev, "failed to find OPP for level %u: %pe\n",
>>> +			level, opp);
>>> +		return PTR_ERR(opp);
>>> +	}
>>> +
>>> +	err = dev_pm_opp_set_voltage(&genpd->dev, opp);
>> IIUC, you implemented this callback because you want to use the voltage triplet
>> present in the OPP table ?
>>
>> And so you are setting the regulator ("power") later in this patch ?
> yes
> 
>> I am not in favor of implementing this routine, as it just adds a wrapper above
>> the regulator API. What you should be doing rather is get the regulator by
>> yourself here (instead of depending on the OPP core). And then you can do
>> dev_pm_opp_get_voltage() here and set the voltage yourself. You may want to
>> implement a version supporting triplet here though for the same.
>>
>> And you won't require the sync version of the API as well then.
>>
> That's what I initially did for this driver. I don't mind to revert back
> to the initial variant in v3, it appeared to me that it will be nicer
> and cleaner to have OPP API managing everything here.

I forgot one important detail (why the initial variant wasn't good)..
OPP entries that have unsupportable voltages should be filtered out and
OPP core performs the filtering only if regulator is assigned to the OPP
table.

If regulator is assigned to the OPP table, then we need to use OPP API
for driving the regulator, hence that's why I added
dev_pm_opp_sync_regulators() and dev_pm_opp_set_voltage().

Perhaps it should be possible to add dev_pm_opp_get_regulator() that
will return the OPP table regulator in order to allow driver to use the
regulator directly. But I'm not sure whether this is a much better
option than the opp_sync_regulators() and opp_set_voltage() APIs.
