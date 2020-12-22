Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D0AF2E0EB0
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 20:17:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727245AbgLVTP2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 14:15:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbgLVTP0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 14:15:26 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38973C061793;
        Tue, 22 Dec 2020 11:14:46 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id b26so24996601lff.9;
        Tue, 22 Dec 2020 11:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JeqU2hjek5wLw0+7xrlLc11caNI578OgYNY2jwkqzNY=;
        b=bHwBuHMIyebkzyuUuOWBtzvheNh3xobf36Fa7wYQWSsb5947FwMxh5EXX1ORm+eEbW
         9s5TZRAW81SHivJZRvgjBliVL48suJOSz1Q3fByGDaGgZSnCbxhaiAyXQaEZBI91Yzfk
         Da8F8JtXO/zjgcfIz/rgqYIhHzUMN4koFL/LTO+qm6b0E4aQxq5kQ5cCtBnX91oQRcbd
         G9iKKoovYg35LssxUr4eWNW7/z6lzqiVA17GKXw1DgN7UnKw56gr4BczhuG99aRzMmZF
         7jXf+V/o4Q+Dp0H9EG+kujNeGdrVmzHpfpd/8stsHWBUWPBM1U+22zpgewqWife2rV0Z
         M8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JeqU2hjek5wLw0+7xrlLc11caNI578OgYNY2jwkqzNY=;
        b=JPSw9parOMMJyI3jfGuE1pUkgUj1rnA6RUFzUXY1u2g5tx94r5bb/4Ofk30muOAw98
         rjx7fYUO4bJBCjWLxl85L0m6cSsMQEFWJ/5m4NImNg3tpjB6DF8MnQ8jX85RCn9kaBTC
         l0rjMqP/BQruz3DfNT7S3wEi9OMqrLZt93DoJI9lY/ziWBZxh1ZMpAMOv7phkOm+hVyS
         xAk04urJhsxTA21J1JCgSQCQlndEnXeJ9xX4Fd9YMeEjtzIkP0rWLa2V4koOIcRWdQU/
         JMWhmpVksQnOcp5XoB8Afqe2wEauC4ULq0t0I9ndpqaAiB9j6AiMvyRpo+GyMBa9Gk/y
         Ll0w==
X-Gm-Message-State: AOAM532MH9MEpk7M9ZfBCi0I5HYaVv0oYXuf75ZbKzdnsGR81lA1reEW
        Y9cqxlFI1FU9wOObm88G92Pzdohi2L8=
X-Google-Smtp-Source: ABdhPJxaybHg4decfemE6k9xrHb2rcpd4r/utxUsMuqV39rH7BRNKVoTVuvzmCmXKUkMGne9zGMDhg==
X-Received: by 2002:a19:6447:: with SMTP id b7mr9495186lfj.206.1608664484582;
        Tue, 22 Dec 2020 11:14:44 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id x8sm2779029lfn.226.2020.12.22.11.14.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Dec 2020 11:14:44 -0800 (PST)
Subject: Re: [PATCH v2 13/48] opp: Add resource-managed versions of OPP API
 functions
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
 <20201217180638.22748-14-digetx@gmail.com>
 <20201222085556.kce4dcwumk4u6ttm@vireshk-i7>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0ffd2ada-b279-a319-5d5c-b2bf1a49ca35@gmail.com>
Date:   Tue, 22 Dec 2020 22:14:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201222085556.kce4dcwumk4u6ttm@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

22.12.2020 11:55, Viresh Kumar пишет:
> On 17-12-20, 21:06, Dmitry Osipenko wrote:
>> Add resource-managed versions of OPP API functions. This removes a need
>> from drivers to store and manage OPP table pointers.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/opp/core.c     | 173 +++++++++++++++++++++++++++++++++++++++++
>>  drivers/opp/of.c       |  25 ++++++
>>  include/linux/pm_opp.h |  51 ++++++++++++
>>  3 files changed, 249 insertions(+)
> 
> Please send a patchset of its own for this patch, along with updates to all the
> existing code that can make use of these.
> 

ok
