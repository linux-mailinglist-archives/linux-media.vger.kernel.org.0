Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D2BE2DF682
	for <lists+linux-media@lfdr.de>; Sun, 20 Dec 2020 19:35:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726950AbgLTSfV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Dec 2020 13:35:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbgLTSfV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Dec 2020 13:35:21 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3B27C061282;
        Sun, 20 Dec 2020 10:34:40 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id o19so18498603lfo.1;
        Sun, 20 Dec 2020 10:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SVuAJrANiRaA9JvhqiN+Qpg12pt/XXaO5N8Q251ZVXo=;
        b=g0YfBv9Y+Z4Ov6uvvyMmMSO8QAxEodnSGt1Q/xrtSeNlNNvJ6Ei1bxSeMtyZFxaS32
         GMwB4oYAfVNQf3wXSpVheHoh3hMtvQ+WUqfdkBuyyXBmUnV+RW0pU3nTdQfpXMH29oWO
         wHrVouS3H6dIYVB0SEnAXa/QscIJsEHYk+A14ko1+NqCFxl3tbY87Q+4nt70E5RFaUit
         9Avj1QU3w1reztQzSCkIKGo4lWQXodMzg1ETMVsg3/4j1v1iFnPb/KcnypCyrHVFB7kf
         KC7pvLRBNrazpYLxKOXxLwabcFIY8JQIUecHoWVbMfurUqxJhtY3Jsr7ovlkuNPblO76
         1qGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SVuAJrANiRaA9JvhqiN+Qpg12pt/XXaO5N8Q251ZVXo=;
        b=DuKfSzI5X1rGSEO29vzPV9FQDc3ZkVTasQQHOlqMs/0lyTBlCsU2r0BbtcpSW8ubPF
         sW9D6iXr2kLVTsbMSF6YeZArDei2kR5VIGPKuR0icwiJ2z5mfbWLPXdl62HwREkxtrqw
         xKGM+M3ss7lg73rNx5r1+f6ee8yl7c2nEZpK6TeVn+e/9XwqzgOgBrYov+sLIq+phJc9
         el6eo1VlVq/FBB8CGHINgF7tM9cTnb/pOGJnXxoq+srAgIs3rU/YcMr2CsJF1CeM7c5H
         e1k64nmGFUDsNjR7zWcqmYzD36K5T2HRCuxyW/k7ULrJhpwJDrWUMlW/wB4cC/6nRmTK
         6uyg==
X-Gm-Message-State: AOAM530xe5SwVlrP7CwQAyEk7ViCN2IcrXUQTHOlywlIro5v5gM2eYiU
        69hvjIf5Lj/HiOr96sqdCyjG+4JSJm4=
X-Google-Smtp-Source: ABdhPJysdwKJBGLnQ8yhCh1b1/dODKQ+0Vt3EPS6VcrkoitE53cyd/UT9rBF7QWyBhAxqnAW0Mp/1A==
X-Received: by 2002:a2e:240f:: with SMTP id k15mr5679769ljk.506.1608489278886;
        Sun, 20 Dec 2020 10:34:38 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id z26sm1890253ljn.98.2020.12.20.10.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Dec 2020 10:34:38 -0800 (PST)
Subject: Re: [PATCH v2 41/48] memory: tegra20-emc: Use
 devm_tegra_core_dev_init_opp_table()
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
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
 <20201217180638.22748-42-digetx@gmail.com> <20201219110216.GB5323@kozik-lap>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ea983cb9-c15a-2de2-ba14-35597bdcb2b8@gmail.com>
Date:   Sun, 20 Dec 2020 21:34:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201219110216.GB5323@kozik-lap>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

19.12.2020 14:02, Krzysztof Kozlowski пишет:
> On Thu, Dec 17, 2020 at 09:06:31PM +0300, Dmitry Osipenko wrote:
>> Use common devm_tegra_core_dev_init_opp_table() helper for the OPP table
>> initialization.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/memory/tegra/tegra20-emc.c | 57 +++---------------------------
>>  1 file changed, 4 insertions(+), 53 deletions(-)
> 
> If there was no more Tegra MC work planned, this could easily go via
> Tegra SoC tree. However I expect still work of your interconnect
> patches, so maybe it's better to stick these in same tree.

I'll re-send the remaining interconnect patches soon.

> In such case I would need a stable tag with the
> devm_tegra_core_dev_init_opp_table() helper for memory controller tree.

Perhaps will be better to drop these memory changes for now from this
series since they are optional, i.e. memory drivers will work properly
because voltage changes are done by the OPP core and these patches just
replace the duplicated code with a new common helper which doesn't add
new features to the memory drivers. It should be fine to get back to
these memory patches once interconnect patchset will be fully merged.
I'll take it into account in v3, thanks.
