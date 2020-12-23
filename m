Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7FCC2E1812
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 05:20:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbgLWEUS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 23:20:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbgLWEUS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 23:20:18 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47496C0613D6
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 20:19:38 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id x126so9652209pfc.7
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 20:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=26Fr+AtJaqoWMCq9NSUD8XDm547WXau8kIa+Po3ijaQ=;
        b=sT3RPi0cmSySv3TpxqXakwSZd4+TeVAbgUtHRhhkr9zD2oKndQhh3nAF2ZWRKFEwst
         fxL85ZuUBFNAQ5onTZ3nMEdhsWGrllkYRYl1tGbri1cjmNeEdBXqoR00oFAdZlinf2sG
         i3trnl1FImHrkHWsQjqfYqktVg5C0p9hGp3zMs/4X0+liPYJ7Fj35h7EVOzzqMQQ4BmP
         NoOLT9BhfddUa5brM8O18Y39e3dDinW3tOqST333s6BHhsMhvIuY7sARBYQPtJaNRvta
         GBJlJv49y/k+55A3aNfm4MsUIuzj/qy5vzUrSvfzWGdcTkTePTwKJsgOch7YgnJiucC7
         W3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=26Fr+AtJaqoWMCq9NSUD8XDm547WXau8kIa+Po3ijaQ=;
        b=fXszC8/5KcZIV/gtZP/pw+EN/uRTDxibn9YF44k0wQ+fQQnUdNV93AB9SBRGF9aqYQ
         VX2GVg/FnDQVwkg7UtMjiIf4lDntZ/nRFfJs7GEGM3bWdgJFX6UTkY3SwiX4Ku4867W8
         lsWPR5JiKVpCeL3jm5mEr04DIwwSOC29A7AeOLUTumgrMir1ojSVY48kPeCS0a1/3B2q
         pGHxDxvo0vgfvq+s24Q5EFo9bqQ6G+rAS9IijMA9QhF0ciZh1EcGMfY2SALZj9Omvmbr
         ZACNDTZecBlEA+gkeDUckRwxNx8lyRZYJtNIEhKjOkMSe/lD0S7i1jCORpaDUuOKqmX2
         5t3A==
X-Gm-Message-State: AOAM533e/9TIEdOmaB0wPoWBqYnkn9zNwWoj8u3kjWnbMj34H61k2jeO
        ksyifvtz69x7DNv5bpfyMw6IDw==
X-Google-Smtp-Source: ABdhPJz3XTw78JGZT3bqt2E1D4SaVZTnIQudWjGvtEJkaUATY8WvaXe+1UR/zVBvhFKdu72MF7n3JA==
X-Received: by 2002:a63:c205:: with SMTP id b5mr310031pgd.281.1608697177622;
        Tue, 22 Dec 2020 20:19:37 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id j23sm2918258pgj.34.2020.12.22.20.19.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Dec 2020 20:19:36 -0800 (PST)
Date:   Wed, 23 Dec 2020 09:49:31 +0530
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
Subject: Re: [PATCH v2 11/48] opp: Add dev_pm_opp_find_level_ceil()
Message-ID: <20201223041931.klnppy4fu3sdgtsz@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-12-digetx@gmail.com>
 <20201222064253.x7vsurh7q5k7qzb5@vireshk-i7>
 <fd7b9f42-d0a7-45eb-2a17-d46779011c58@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd7b9f42-d0a7-45eb-2a17-d46779011c58@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22-12-20, 22:15, Dmitry Osipenko wrote:
> 22.12.2020 09:42, Viresh Kumar пишет:
> > On 17-12-20, 21:06, Dmitry Osipenko wrote:
> >> Add a ceil version of the dev_pm_opp_find_level(). It's handy to have if
> >> levels don't start from 0 in OPP table and zero usually means a minimal
> >> level.
> >>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > 
> > Why doesn't the exact version work for you here ?
> > 
> 
> The exact version won't find OPP for level=0 if levels don't start with
> 0, where 0 means that minimal level is desired.

Right, but why do you need to send 0 for your platform ?

-- 
viresh
