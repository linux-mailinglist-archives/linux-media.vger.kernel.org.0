Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76BED2DE37F
	for <lists+linux-media@lfdr.de>; Fri, 18 Dec 2020 14:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726212AbgLRNwS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Dec 2020 08:52:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgLRNwR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Dec 2020 08:52:17 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25989C0617A7;
        Fri, 18 Dec 2020 05:51:37 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id h205so5601449lfd.5;
        Fri, 18 Dec 2020 05:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ud+ydgJ9az3Hiu3dG94tCj+AH/qmY9t585UF2V6T/f4=;
        b=YU3/c4y3sS1EheZWjrflGG0HpXjJJh+/DPVIl2CatwZ1345AQ4Ps9XE9KOttvWkWfB
         peJI/hYVrD79Qiu/52g+nyfaJH2iQHi9fESs9e7PSVrJLQHc07zXPCiP3ITLCpVWAREv
         qwx9cAfmpQTao8nPDvEfblvcaXemydgisPKlrfX9PihSCkXKt7/1dRn16B8ThPctm/CV
         ZH9TO87G8fCVtoY3YnsNGa1q53+i9enUSbke6lKkziiXHDIDgowFL/nbnOhxBRVQBjvP
         JCPfR7HU53ThAtkHaJ4/gZyc3fVHY+CWI8lg+84lqNnatqsSbuTO6NpiZ7ccnulU64Z/
         2C0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ud+ydgJ9az3Hiu3dG94tCj+AH/qmY9t585UF2V6T/f4=;
        b=lRDInVLcDNe+Hdd52RtIPM9wOfU2EG64lMYcYCK7tM4w+mFZoyo1w3KWDxk3DFmmE3
         53X/qJSyYzWPyOKhfhDT9G/jtXFccQsReJESSL6T0ZWFwccJAPtKcqzeeeOLTBgQ6Vg8
         S5sI12Rxxendj0lAPx9ZXJOXHXFNVe7snLJmiwFMTg0zOxIFE+yXy52lDKqBYNGWEvy4
         oNTPj9UNk1pZsG3Xlu0dzkx6z2wUxtr6oqiGlE5p8K81C2bXfiARed9yK8jO2OiY4tAR
         Eka6XFOMWV6B0rq4xYLwQ3GfWqNcyjHsKzUc6NCFgkh5UMRkmJwswllYTrByNT9+GnEo
         nX0w==
X-Gm-Message-State: AOAM531knDPYfEq9aFiDCXD4/nW3cwY31qgZ9GG8xt/G/J1G/w8/CVzC
        BWkRwC6ZUCdej8JefMFf0Apt3tfNZyw=
X-Google-Smtp-Source: ABdhPJwlBZ8Blm2A+JOtuSZuYrjATZyxdK51+2jHdPBCMrrfUZ3Pxpve0dGkaB8ZmDWkCYbAToxNUg==
X-Received: by 2002:a2e:b896:: with SMTP id r22mr1801148ljp.442.1608299495548;
        Fri, 18 Dec 2020 05:51:35 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id i10sm934975lfd.202.2020.12.18.05.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Dec 2020 05:51:34 -0800 (PST)
Subject: Re: [PATCH v2 00/48] Introduce core voltage scaling for NVIDIA
 Tegra20/30 SoCs
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
 <20201218071455.vdeozvvnmkjtrejt@vireshk-i7>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c0976db7-ae66-740c-d95f-501d81c99fa0@gmail.com>
Date:   Fri, 18 Dec 2020 16:51:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201218071455.vdeozvvnmkjtrejt@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

18.12.2020 10:14, Viresh Kumar пишет:
> On 17-12-20, 21:05, Dmitry Osipenko wrote:
>> Introduce core voltage scaling for NVIDIA Tegra20/30 SoCs, which reduces
>> power consumption and heating of the Tegra chips. Tegra SoC has multiple
>> hardware units which belong to a core power domain of the SoC and share
>> the core voltage. The voltage must be selected in accordance to a minimum
>> requirement of every core hardware unit.
> 
> Please submit the OPP changes separately (alone), it will never get
> merged this way. Send fixes at the top, any features you want later in
> the series. It is fine for you to base your series of patches which
> are under review, you just need to mention that in your cover letter
> for your platform's patchset.
> 

Alright, although I haven't pretended that v2 patches should be merged
right away since they are fundamentally different from v1, and thus, all
patches need to be reviewed first.

If the current OPP changes look good to you, then please give yours r-b
to the patches. Thanks in advance!
