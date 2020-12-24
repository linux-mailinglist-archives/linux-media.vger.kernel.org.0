Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 157942E2426
	for <lists+linux-media@lfdr.de>; Thu, 24 Dec 2020 05:11:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgLXELK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Dec 2020 23:11:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbgLXELJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Dec 2020 23:11:09 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D2BCC06179C
        for <linux-media@vger.kernel.org>; Wed, 23 Dec 2020 20:10:29 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id z21so848664pgj.4
        for <linux-media@vger.kernel.org>; Wed, 23 Dec 2020 20:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ikVtzUE4uXfeBqBtO4dtx3e4Xq8je8+SD0cDc4uZBxs=;
        b=xKGy+n1lH2OICjFJVUJHiGY8JDjFs+zA4vzxAXCrDFU5l1ZTdld+A8Dk+fxxlBFKgV
         E5eTKopVBqQdPsabWi5F9J/MB+2RweNkKJA1c0sbK6mCgzTnGBOjkv+GqmMLoGYyu06a
         ttpiVX3Z/L0LrlZD/4+woKfb/vMPCPF3T1xEccKhgioNE8CzX8igBpfeY1gMcA4Qg9rv
         Ss6rrRCqT7Sk981NvHHGrFAi9IRp2TL7qu6Ba/gO3G7fUcc4yRkVj93tiPezXSd9aNKo
         dnFyrclYl+eyqxmrRvvK1Bya4PdheEaOLJsOwz+YPu0I+RU1N2lZffE0lmArD5KkOuec
         MNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ikVtzUE4uXfeBqBtO4dtx3e4Xq8je8+SD0cDc4uZBxs=;
        b=h6428cqeShoiTNhqCgbxWwcPaIysbfuFyQ9x8bMrG23xBo8jauTugqrW1kV2DNlGgW
         Yy0HyVwUcsDQ5goZrODdG2pHOP+/0AGzid5Rbc1J4nxJbZQ23Pj7GgrSxyRHj5BHZhYd
         pJyLh9vmjfY3Q9kCQ5D85hrMPOcgKIWD1xodZsmcGP41iKNhveUOK4ndqheXngl5l1w4
         Es89qCyzzj+4jVLkITPbFdKy0Chenyzlfk3rgVLzzyZNO8Ws7pH0z/S90YZB2ra8ZACj
         lgR/5shIjet4OxhYoLA7zVWbri1tmZRlhNpsSYaph8JHP/hYtgwoiCOA/4BLmIeN/owF
         W9kA==
X-Gm-Message-State: AOAM532Ubfxs68yDJbZi6axmhIe38qW+fEe+0htHUyc9tvVpPyBaVdl4
        pCaTovwQttOh5pDrI1thTqSN8w==
X-Google-Smtp-Source: ABdhPJxF6QsBhYJyHEedTrrFWO0Opl0+2E1UHe5wyQBjNtRXMjwHp5sAJCn6P8PZcaaJH8z8YxT1Gw==
X-Received: by 2002:a62:644c:0:b029:1a1:f568:d2d9 with SMTP id y73-20020a62644c0000b02901a1f568d2d9mr26738163pfb.64.1608783028602;
        Wed, 23 Dec 2020 20:10:28 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id s5sm1012447pju.9.2020.12.23.20.10.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Dec 2020 20:10:27 -0800 (PST)
Date:   Thu, 24 Dec 2020 09:40:25 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
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
Subject: Re: [PATCH v2 15/48] opp: Support set_opp() customization without
 requiring to use regulators
Message-ID: <20201224041025.mlxsbl2yrxyqt7yh@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-16-digetx@gmail.com>
 <20201223060101.v2qihvvgsmpahg24@vireshk-i7>
 <ea025b0f-bb2a-d075-4c8e-45831fa9cd93@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea025b0f-bb2a-d075-4c8e-45831fa9cd93@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23-12-20, 23:38, Dmitry Osipenko wrote:
> Well, there is no "same structure", the opp_table->set_opp_data is NULL
> there.

Right, I saw that yesterday. What I meant was that we need to start allocating
the structure for this case now.

-- 
viresh
