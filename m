Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6422E062C
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 07:43:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgLVGmu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 01:42:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbgLVGmu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 01:42:50 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36926C061257
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 22:41:45 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id w6so7916655pfu.1
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 22:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mdb8ubeZUDajJW+FcHgYac1dD8MByc7AxGNoAnUULbI=;
        b=npm8TWA8O2hsE4I05GLXYUgOLq1zgQjekB/Y4euzum/q0sfwISRV8ojNFw9xBetHYG
         evQHh7Im53EF1KPazTUM6tG5aazhT/xA3W29tAzWofCmWnBLUvHwm07XeX/ejN4ZKNp+
         GG1EIaznfaIPh04fh8Vuf5DnthO72+88HGixBcUWvlVGWbNtuglnZU0e7Z08HgxGdv8S
         NU/vtGF3TDtC2JLVLs4AZIpRX70hZbTJkcb96VBSFOPBpkbXmP1YGrK7ObL+Aiz9SArD
         8vn+yrLPGr5ZiIMK5ZKv0qTkSfbBMVYVUkMsjTy7Z0aDg9Kb2OysaSGaZdGGmigLzN/I
         S2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mdb8ubeZUDajJW+FcHgYac1dD8MByc7AxGNoAnUULbI=;
        b=eaKnwrVPQ0SgOFcZJnLMxG3ajMoQ40xe8eNxRvpKwrU0ysxcLc6Jd+fQVMpSM9XRT7
         zq7GYs61OD0nqo6G8KSCE2UAHmyNMhIxZhmdJaGteu1uHcTIyIwxC3+eTqlcKmL7RdtZ
         Fz1MjBvR/YRgoD0PjcupK2DKjnB6SqxTVB8TCIt7rrSSzRvAECgEwOtDLvE2PSFxaeU/
         1Ln21FSU7+7f2F9VCNb1KNlI82xFbezIrYxurlWM5i+fBWmCmN5j3fS6uqEpSqr/e7IV
         ijl0ml7I9EqgbukDW7df0wiTHcz45e9PCeokpqTFd3/KHP39CaYhrnb4cEZDEMB/98m1
         M2ag==
X-Gm-Message-State: AOAM530VV1OWxvz21xnKOx1sdYN8120lipulA57nBJtB45w9AWVyAmXB
        UHj47PgkFDaC9awZWUgbOtKL2Q==
X-Google-Smtp-Source: ABdhPJw7BD4Js7XMjl68MHqDPRxBWn/XxIVoOlLeKMWzpyH+qOtOrTPdNalPZDEVDwvJf8LazuKUiw==
X-Received: by 2002:a63:2265:: with SMTP id t37mr18196221pgm.336.1608619304758;
        Mon, 21 Dec 2020 22:41:44 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id x1sm18440611pfc.112.2020.12.21.22.41.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Dec 2020 22:41:44 -0800 (PST)
Date:   Tue, 22 Dec 2020 12:11:42 +0530
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
Subject: Re: [PATCH v2 10/48] opp: Add dev_pm_opp_set_voltage()
Message-ID: <20201222064142.pidafbhcbrecz57z@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-11-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-11-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17-12-20, 21:06, Dmitry Osipenko wrote:
> Add dev_pm_opp_set_voltage() which allows OPP table users to set voltage
> in accordance to a given OPP. In particular this is needed for driving
> voltage of a generic power domain which uses OPPs and doesn't have a
> clock.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

We shouldn't be doing this, details in patch 28.

-- 
viresh
