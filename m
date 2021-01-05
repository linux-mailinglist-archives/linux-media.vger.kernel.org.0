Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 736B42EB11D
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 18:12:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728833AbhAERL5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 12:11:57 -0500
Received: from mail-wr1-f48.google.com ([209.85.221.48]:40751 "EHLO
        mail-wr1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727036AbhAERL5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 12:11:57 -0500
Received: by mail-wr1-f48.google.com with SMTP id 91so36879706wrj.7;
        Tue, 05 Jan 2021 09:11:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VnFj1rkcJWvtzQFI6dETJ2tJwVrz2a5nNVgi09YeJXc=;
        b=BGBqSKaeWeXo3Dc8mD/CH0CHrKflfbFzeWfE9TPNPjpijohQnUpIEuibf+xKRFMpNs
         pbwFutUp7GomgmRT8G+sKFiSyF15wbZobs3khI0aJU8abZFkqkGDgxgXBhXi6K1J+cwf
         YSzuHaBplD4EtLHiDxDGt0PsEkU1zjnlyyjN5ulBhSs1B1oLEQsVllwtHOdDgWcrg64o
         /soa/DcMhWQhwUFRxnmd+s6sdGd5cocrdzmqDiJF4csgEhQ5OKuetLKtET8KPMreh0ZT
         mt5D77cqmSm7e3XOrwvqblGuPayifgSSG51CcgVe6y8+bj6hOB2wWXmvrljR5u20bZwr
         H6Pg==
X-Gm-Message-State: AOAM5311dMQZS7WTcWWR5o/DBgY2/g33m+tLzpkFJ1fSgHfsnVYyqgRh
        8w1ckSCVFGA9F292VxTCp1g=
X-Google-Smtp-Source: ABdhPJzS2tnUNQsATQJa8H0cqybMnT7xhuS0Tkf5JkW0sqRFgMdJGyc8820QQRayohYw3nqJBZqzFA==
X-Received: by 2002:adf:94c7:: with SMTP id 65mr492225wrr.423.1609866674773;
        Tue, 05 Jan 2021 09:11:14 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id n12sm632321wrg.76.2021.01.05.09.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 09:11:13 -0800 (PST)
Date:   Tue, 5 Jan 2021 18:11:11 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
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
Subject: Re: [PATCH v2 00/48] Introduce core voltage scaling for NVIDIA
 Tegra20/30 SoCs
Message-ID: <20210105171111.GC26301@kozik-lap>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 17, 2020 at 09:05:50PM +0300, Dmitry Osipenko wrote:
> Introduce core voltage scaling for NVIDIA Tegra20/30 SoCs, which reduces
> power consumption and heating of the Tegra chips. Tegra SoC has multiple
> hardware units which belong to a core power domain of the SoC and share
> the core voltage. The voltage must be selected in accordance to a minimum
> requirement of every core hardware unit.
> 
> The minimum core voltage requirement depends on:
> 
>   1. Clock enable state of a hardware unit.
>   2. Clock frequency.
>   3. Unit's internal idling/active state.
> 
> This series is tested on Acer A500 (T20), AC100 (T20), Nexus 7 (T30),
> Ouya (T30), TK1 (T124) and some others. I also added voltage scaling to
> the Ventana (T20) and Cardhu (T30) boards which are tested by NVIDIA's CI
> farm. Tegra30 is now couple degrees cooler on Nexus 7 and stays cool on
> Ouya (instead of becoming burning hot) while system is idling. It should
> be possible to improve this further by implementing a more advanced power
> management features for the kernel drivers.
> 
> The DVFS support is opt-in for all boards, meaning that older DTBs will
> continue to work like they did it before this series. It should be possible
> to easily add the core voltage scaling support for Tegra114+ SoCs based on
> this grounding work later on, if anyone will want to implement it.

The same comment as for your interconnect work: for sets touching
multiple systems please mention the dependencies between patches in the
cover letter. Not as a reply to such remark like I make here, but as a
separate entry in the cover letter.

Best regards,
Krzysztof
