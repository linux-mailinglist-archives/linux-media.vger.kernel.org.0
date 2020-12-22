Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEB9A2E0EB6
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 20:17:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727498AbgLVTQf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 14:16:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbgLVTQf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 14:16:35 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C436C0613D3;
        Tue, 22 Dec 2020 11:15:54 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id y19so34370117lfa.13;
        Tue, 22 Dec 2020 11:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bPx7EE6PSbCPkDarnx0nbSqX4DyTXsuDpEiN7AF5ASk=;
        b=by5CwRSkj7I1IIVMvp0X5QOxMswVE4c93suYm7juykVfkZccthrQYR/1LHg5tNX9Fs
         G5RwLCFfqZuGdA/NMT84/GKhThuNV13dgCCXDs/xbrTgpQc5HAhUTsSNzuw3OAt9hmPF
         rCBS/+GhCjpuMIBVDAodHt0e2K5MCFdMyRJCUenuFRI69khvLmnFtCssyFBTVA8mgAI3
         +P71mriOwhz3yEpqEecEZB4c63IhIbysXU/t4EmQ7A6e7VqHYmWGP4lyIkwrmWQ8nyWi
         oYy5aN+2WIyhWj0VJdqnrFFB/kKhcNWdk3BD+639Sf/Qe3l2191KixQ85whWtQvBNbO5
         Japg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bPx7EE6PSbCPkDarnx0nbSqX4DyTXsuDpEiN7AF5ASk=;
        b=Fey+j64ifXLO4xycxCn46C77SC3vQCqakx1dN2M4ltplYRSRYXHk3t9I4GKaYL3yre
         aX2bWLliU0t+mpjQUzpTuHvy4JLziPq3Rhgfh0NGXvDyaYLIeEUI7sX30BKmz80gpEa6
         PWQDg2so5FFTRSaRtC0T4mGf0TnzjRv26GdYXWQoAUDgVagjjGthsOm+9TMr/sMyklz1
         lRhE06/bTo5S9EdARs4ii+e89T3B58J7/YYh4Afu9lp2i2I6x8ruYksXAOXFP/cXV94K
         LZirK0YLYWQZrpE3nkPBAlKtRGZ67SlVLmhAhGlRWjSDs8dD0i4CZa1+jy8cPHTGkf22
         2zvg==
X-Gm-Message-State: AOAM533z1ki7FDtSI3gKT4R+EJ7jWKBEXQMe36fvAc4xRQlcnP/fJpKV
        Tt7XTd0S/Dxk60gnxier6lpAzo9yoR4=
X-Google-Smtp-Source: ABdhPJzHaWjDXUMak9w+Uk5NxxvdBfxwblLdXjwl2xjCH+RslfqzQ0040C+FqW1K8XqCgG6Upk0xGA==
X-Received: by 2002:a2e:9847:: with SMTP id e7mr10954928ljj.388.1608664553007;
        Tue, 22 Dec 2020 11:15:53 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id f23sm2788410lfh.196.2020.12.22.11.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Dec 2020 11:15:52 -0800 (PST)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fd7b9f42-d0a7-45eb-2a17-d46779011c58@gmail.com>
Date:   Tue, 22 Dec 2020 22:15:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201222064253.x7vsurh7q5k7qzb5@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

22.12.2020 09:42, Viresh Kumar пишет:
> On 17-12-20, 21:06, Dmitry Osipenko wrote:
>> Add a ceil version of the dev_pm_opp_find_level(). It's handy to have if
>> levels don't start from 0 in OPP table and zero usually means a minimal
>> level.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> 
> Why doesn't the exact version work for you here ?
> 

The exact version won't find OPP for level=0 if levels don't start with
0, where 0 means that minimal level is desired.
