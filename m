Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7742D2E26C7
	for <lists+linux-media@lfdr.de>; Thu, 24 Dec 2020 13:17:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbgLXMR0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Dec 2020 07:17:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727039AbgLXMR0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Dec 2020 07:17:26 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66AE9C061794;
        Thu, 24 Dec 2020 04:16:45 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id l11so4447875lfg.0;
        Thu, 24 Dec 2020 04:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aBLJJg+bzbWbulXzWEitNJ5042asREQNv3cmv9hVKiA=;
        b=JJuUSYdMpRe4neER0nnPgTpAPimiRI1Igwq+UpeDahgwudF1GCXX8kQ9WPifh+7+rE
         ns6OdiZdklf9VJoAnwAIpFuFP4soAjlbIn1wKb3lMOLTswsKwQS6wkrGtvHUUduAhIR7
         xTS0ENwDMGzO1p7nvwvV9whAs0T5WkC6vFtKzk+FV6KWULbCWssULHHLIuTPwqtTLOP7
         50lmQv/rwlVR4UDetNofZ4dJKnmTquUMRtMeLimaCumiMVuw5zIGpcPia8nF/7F4+HeG
         KSaiTeEKZgA/vi4p4i0umtKkbryQkR9R/MCG0HSKYHf5WH0l1k5XdA113l+wSElI4Qyw
         73DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aBLJJg+bzbWbulXzWEitNJ5042asREQNv3cmv9hVKiA=;
        b=Eg/eziSYHkv2chCS/F+OsfbcCKfOmif92ssNXTBcsWG7qsM6PxvNNQrGwLR4/mNK7Y
         4YRJI5hn6GaXM24s5mHJlGhR2wv20xJYRxesMQ0YrjCtxUtXSxKzfgTOXcimTdv17QXB
         hQguL/pPCrYHgfJZZQ7J3STWlHKAH6uT5os1w9DlSnZxuyGE6LOfr92PPjMxh7gEQ+PC
         PlnHCQ09SgvgGSL54O/GN+RY5EePmQa7ZL2RME9vF4kFGe2pBqBdVXSROYB0BVqPhoMf
         Df+z8nqw95DJx/DbiuleuJCYD5o2ctlT41YIadnQlkdFfktwaXI0JbfGYOdortOd/nuf
         YSIQ==
X-Gm-Message-State: AOAM530YIrD5l0i6U5XAabYcBSnZgfpY6mGHU/Ctl7v7JMGcIElElP1L
        EJEhdENo95fh3SsPNaddTq1olUQjHe0=
X-Google-Smtp-Source: ABdhPJwqnQyO8QLk/YiNUUylyZroRpd4i08hKXJxtramIT73WqKFf+cxMjJwIeVnmd7ZHuojM/4uMw==
X-Received: by 2002:a19:7ec9:: with SMTP id z192mr13717595lfc.50.1608812203827;
        Thu, 24 Dec 2020 04:16:43 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id x70sm3283612lfa.224.2020.12.24.04.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Dec 2020 04:16:43 -0800 (PST)
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
 <ea025b0f-bb2a-d075-4c8e-45831fa9cd93@gmail.com>
 <20201224041025.mlxsbl2yrxyqt7yh@vireshk-i7>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <236f9306-97a5-5f17-9689-a6e04c052b7a@gmail.com>
Date:   Thu, 24 Dec 2020 15:16:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201224041025.mlxsbl2yrxyqt7yh@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

24.12.2020 07:10, Viresh Kumar пишет:
> On 23-12-20, 23:38, Dmitry Osipenko wrote:
>> Well, there is no "same structure", the opp_table->set_opp_data is NULL
>> there.
> 
> Right, I saw that yesterday. What I meant was that we need to start allocating
> the structure for this case now.
> 

Okay, that will be a bit bigger change than this v2. I'll try it
implement yours suggestion in the next revision, thanks.
