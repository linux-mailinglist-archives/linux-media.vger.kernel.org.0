Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F37D22E7A14
	for <lists+linux-media@lfdr.de>; Wed, 30 Dec 2020 15:57:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbgL3O5O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Dec 2020 09:57:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725853AbgL3O5N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Dec 2020 09:57:13 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07CD6C061799;
        Wed, 30 Dec 2020 06:56:32 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id y19so37997942lfa.13;
        Wed, 30 Dec 2020 06:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0U/3l2R/FqwbzeCe0bIFbSAR6mJKbOIzSVkvfhl/Js8=;
        b=L5HLkr9WfhVAUPpunjEjaBQBUl1SlW/zUa5O1VDTRHUBdAxB+/HWrJ8GTcGCsF7mWO
         jel4JTGI4sJHATbOPY2XRlk82AhD92G5EShm59syyPsbyXRC6CAgoynITJGCI7+lFoOJ
         +dE+2O9gdBFrC94ljSMv9aR/2vIPUYsetKfpgKpwXYFulpQAA+rX0JUiL9MKb2gPS8g/
         a2Gyez6We5e3I87NlBGkD6YUnUjAnV246QogA89sf84uan1KmmQrFDut1Jl3FzZSqVeb
         j9F6Ep46eJ6oht7szUO90Kq+IKBdD8OA01xvHwsbL0aa7MlsihfPr64TIiKyPGupP+ed
         DINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0U/3l2R/FqwbzeCe0bIFbSAR6mJKbOIzSVkvfhl/Js8=;
        b=j0gHOLHhS3fW8y22SFOyfznt9jQt9sH0M5yOdWkLDgDexC/U4gk09bBhLohCQhK/01
         zNgUI1KxQZR8aGSOnW9XIZC4g7J8bfTsO6Ch5uDRKz2JhY54uQWJclftRh9GfMbjnR7u
         iPBTX4vi+l4EYvYpaaB6a6r3C5MAc9bIfgl7EUvoRu17hE7MK4oeKLzZPfX2aJFx0Y4I
         p9h+M6Uo7i2XlfrJ31h0i36pjuQFbt+W8sbD7tz8QESn5OB03mAPLMOG/5ayQ1HieRTT
         ZJf+RR7CQ4QmXDO469b6jdcsKqfmiBsd6duHFUwwVTeBn9GAtHzjlvE40I1HZLw8dCx2
         owbQ==
X-Gm-Message-State: AOAM531hvJMDBRhXX2AuBhH9o4CBqvYYc/HN85vDrq3pgCq+P9yCXs03
        bmr5KJcmXjlv9gQc6QzbN90KVuQl+OM=
X-Google-Smtp-Source: ABdhPJxdcNRH3UKPiAgxGLAONS9JS5ghRNZ2hrGFDfGyakfQGnF6WF4EeDtjyRL5+3uSyAGBKXvc5w==
X-Received: by 2002:a2e:b80c:: with SMTP id u12mr25529775ljo.490.1609340191355;
        Wed, 30 Dec 2020 06:56:31 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id u22sm4247296lfu.46.2020.12.30.06.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Dec 2020 06:56:30 -0800 (PST)
Subject: Re: [PATCH v2 23/48] soc/tegra: pmc: Pulse resets after removing
 power clamp
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
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
        Michael Turquette <mturquette@baylibre.com>
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-24-digetx@gmail.com>
Message-ID: <c21796c2-0278-66bc-5e68-cae03ca950ca@gmail.com>
Date:   Wed, 30 Dec 2020 17:56:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201217180638.22748-24-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

17.12.2020 21:06, Dmitry Osipenko пишет:
> The GR3D1 hardware unit needs to pulse hardware reset after removing power
> clamp, otherwise reset won't be deasserted. Hence give reset a pulse after
> removing the clamp. This stayed unnoticed previously because power
> management wasn't supported by the 3D driver until recently and all power
> gates are usually ungated after bootloader by default.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/soc/tegra/pmc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index fd2ba3c59178..985373ce52b1 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -654,6 +654,14 @@ static int tegra_powergate_power_up(struct tegra_powergate *pg,
>  
>  	usleep_range(10, 20);
>  
> +	/*
> +	 * Some hardware blocks may need a 0->1->0 reset pulse in order
> +	 * to propagate the reset, Tegra30 3D1 is one example.
> +	 */
> +	err = reset_control_reset(pg->reset);
> +	if (err)
> +		goto powergate_off;
> +
>  	if (pg->pmc->soc->needs_mbist_war)
>  		err = tegra210_clk_handle_mbist_war(pg->id);
>  	if (err)
> 

After some more testing, I found that 3D1 is reset properly if its
memory client is placed in reset before power domain is turned off. The
memory client resetting is completely missed in v2. I'll improve it in
v3 and then this PMC workaround-patch won't be needed anymore.
