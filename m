Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C0F02E4223
	for <lists+linux-media@lfdr.de>; Mon, 28 Dec 2020 16:18:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437296AbgL1PRg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Dec 2020 10:17:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437278AbgL1OEH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Dec 2020 09:04:07 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBA96C06179B;
        Mon, 28 Dec 2020 06:03:26 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id b26so24049748lff.9;
        Mon, 28 Dec 2020 06:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4qvAPOSnb3gCPzAXuw8OIJYZA27uuHy18ix0nvJW1CU=;
        b=bl3r2U9yXYFzTcL+MMt8/u3WC03Tv2y9aGpfMDF+N5t5SOd8te41chnr2P+tYXgxap
         qwi67ZrMGeBXFF6i2U1/h8fpFscRnAJlA+bG6BE++9jg1sJirjaO75C7ygUTfOp9iHPc
         Yars2YYOMCQH/+4lrFdWgHgHubxtlUGfSVWkGmuTDRDCNETQoRFqyJm1yOemv2j+fOXU
         5/WBa1SGMKBukcACZnAJkY1bpWqyZu0kDtPBWL8qeKDNz7QV8CxI3OuE7812UUrxl/Ya
         aAvrf8QxKJLq4+dD8I+H5iaFUT2AaRAEOFTZRmLcbpirb4b1hMFAXt64Gu5605ULqSGz
         0zSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4qvAPOSnb3gCPzAXuw8OIJYZA27uuHy18ix0nvJW1CU=;
        b=na61UGSU/DZ0aenfWKJYKOyIzvSAOVDZiPphjqKuOeplwGhHkrph8xmMg/IZuyCQL5
         hSGAWhJnZcSSoOf3Bql9CR9O3aL1Z5P73a7Wh8UUAECogRSe4BsWwM6b/I21U6qEAxy/
         lRCrRg76Qf2RTEUzzbfw0o2C2jlcS+WGwSQNrOr2pMbcNyXff2wB7e9m5EQ96qFm8vFa
         HbfWYnlmuJ9Ra2A7iDKOucMrj+cmrKdI9MXglVP1Yi3J3RDXJaz4Y+zFXWch7Wbet0vj
         QcHmNgVXUu5iqG6K+JqKuFOd5mTPDS22jaLMoMASXxwOD3uX+5ZitXGkpQdokxUZRNSo
         v8CQ==
X-Gm-Message-State: AOAM531MIWHKrI2gdOXoPt8jjktN5MgdJUjd5RnmPmBssS0GUpbaIMXS
        cyq2Mu57A0isWLm/5Vo5dKKBWfGWEIQ=
X-Google-Smtp-Source: ABdhPJzUpl1/di7tj7MASZGrGRvUabOdas4lVkZNDhVFRvZuxbYB/Sicx781pXRzuHaMyLMY0tnsEQ==
X-Received: by 2002:a19:ccc9:: with SMTP id c192mr12718066lfg.98.1609164205141;
        Mon, 28 Dec 2020 06:03:25 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id d23sm5324052lfl.115.2020.12.28.06.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Dec 2020 06:03:24 -0800 (PST)
Subject: Re: [PATCH v2 11/48] opp: Add dev_pm_opp_find_level_ceil()
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
 <20201217180638.22748-12-digetx@gmail.com>
 <20201222064253.x7vsurh7q5k7qzb5@vireshk-i7>
 <fd7b9f42-d0a7-45eb-2a17-d46779011c58@gmail.com>
 <20201223041931.klnppy4fu3sdgtsz@vireshk-i7>
 <f00e0c74-8d9a-d3d3-81bb-3ac25a74175d@gmail.com>
 <20201224064339.zngidobhstnlu2a3@vireshk-i7>
 <780db190-d93d-3bca-4819-790010f82c62@gmail.com>
 <20201228062254.ui727ka2ftijov4m@vireshk-i7>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c4a6336f-e7e6-b23e-4d60-a41d8e09aef3@gmail.com>
Date:   Mon, 28 Dec 2020 17:03:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201228062254.ui727ka2ftijov4m@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

28.12.2020 09:22, Viresh Kumar пишет:
> On 24-12-20, 16:00, Dmitry Osipenko wrote:
>> In a device driver I want to set PD to the lowest performance state by
>> removing the performance vote when dev_pm_opp_set_rate(dev, 0) is
>> invoked by the driver.
>>
>> The OPP core already does this, but if OPP levels don't start from 0 in
>> a device-tree for PD, then it currently doesn't work since there is a
>> need to get a rounded-up performance state because
>> dev_pm_opp_set_voltage() takes OPP entry for the argument (patches 9 and
>> 28).
>>
>> The PD powering off and performance-changes are separate from each other
>> in the GENPD core. The GENPD core automatically turns off domain when
>> all devices within the domain are suspended by system-suspend or RPM.
>>
>> The performance state of a power domain is controlled solely by a device
>> driver. GENPD core only aggregates the performance requests, it doesn't
>> change the performance state of a domain by itself when device is
>> suspended or resumed, IIUC this is intentional. And I want to put domain
>> into lowest performance state when device is suspended.
> 
> Right, so if you really want to just drop the performance vote, then with a
> value of 0 for the performance state the call will reach to your genpd's
> callback ->set_performance_state(). Just as dev_pm_opp_set_rate() accepts the
> frequency to be 0, I would expect dev_pm_opp_set_rate() to accept opp argument
> as NULL and in that case set voltage to 0 and do regulator_disable() as well.
> Won't that work better than going for the lowest voltage ?
> 

We can make dev_pm_opp_set_voltage() to accept OPP=NULL in order to
disable the regulator, like it's done for dev_pm_opp_set_rate(dev, 0).
Although, I don't need this kind of behaviour for the Tegra PD driver,
and thus, would prefer to leave this for somebody else to implement in
the future, once it will be really needed.

Still we need the dev_pm_opp_find_level_ceil() because level=0 means
that we want to set PD to the lowest (minimal) performance state, i.e.
it doesn't necessarily mean that we want to set the voltage to 0 and
disable the PD entirely. GENPD has a separate controls for on/off.
