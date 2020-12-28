Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8B42E347C
	for <lists+linux-media@lfdr.de>; Mon, 28 Dec 2020 07:25:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728006AbgL1GYD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Dec 2020 01:24:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728003AbgL1GYD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Dec 2020 01:24:03 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6430CC06179A
        for <linux-media@vger.kernel.org>; Sun, 27 Dec 2020 22:22:59 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id y8so5170912plp.8
        for <linux-media@vger.kernel.org>; Sun, 27 Dec 2020 22:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bBQaI4eroTRmm0x4+2Q+qEFawwLNxWB2aEwv9ebwMhs=;
        b=cPdP7kkh/2GQAzg0cOAkSgg+4Z/Q6YFPDrT8cPEIWgPQcde3qUGxURpjfO6E1bHDX5
         X3avIcaIwpZe0l5RjuLs76tegwm2PWF2nIR/3NFqEyoyL7mMQKM38y/oXu8UPBoXDCBe
         owAlPnx2QEhE97fGYccJS79yI+KQx2U4UXdsmGweTOUwrLsDu9pmHU4Huwoutx9pTsoP
         8diXqSx2xAX1gQQbPKkftl20krrAxVSUChxQV7zKgsn7WSoMJGr4Sq7KmuEZCIbsqfdm
         KKxISWBxSfoIxY6pIT71NfdMH7ym7iMSKRQNzxwpLFNAeRNw43wKsq5DXii3GeV4pWs7
         Va4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bBQaI4eroTRmm0x4+2Q+qEFawwLNxWB2aEwv9ebwMhs=;
        b=P+5d+ha8glbQJDXlSjbrxJ97pkNoyn7WiUP3BspP7Wb4Ti61j9OWsW9d/ZIVQ+y+b0
         E/FUVduzYvjBNnnKEZ5I+lEnKT3o4AU07wizfVFv7Rr6fw8mQj8GX1/zMzBJUJf7wDRS
         LGgt2aZHXXjUlzijWrYTT8atboz5QJXALNJeQV/vVx/r/CQ4OEl3yNHXMBvY9hybx9ZV
         HQ6UV61CdXxiP02E/X7qJ26G8TDUfELVU4AethwAa+IEgsu4R+GmM7klWErjsPcR60cj
         AJa69tkGu7bgqlJdT7uS0chfBXKbCVzks5xU1TNeYciFcXW+7D2ZiWGqLOqN0VYNa/D3
         q4ng==
X-Gm-Message-State: AOAM530Zxp2R1GptoCR+fbQBxqAo7tQMJfcqAcQfN2yqN6hBrgqqNrfs
        pA/jQM4sbQgmt1B2i4w5U/76SQ==
X-Google-Smtp-Source: ABdhPJz34QQgPHpCVQubAmFzTB4NyEMYwCvkashDNlLU+9Me4PGHkK6SRqtiBSWyGNrVtvJ0I4RJeA==
X-Received: by 2002:a17:902:7291:b029:dc:c69:e985 with SMTP id d17-20020a1709027291b02900dc0c69e985mr20695263pll.33.1609136577345;
        Sun, 27 Dec 2020 22:22:57 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id q70sm13313850pja.39.2020.12.27.22.22.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Dec 2020 22:22:56 -0800 (PST)
Date:   Mon, 28 Dec 2020 11:52:54 +0530
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
Message-ID: <20201228062254.ui727ka2ftijov4m@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-12-digetx@gmail.com>
 <20201222064253.x7vsurh7q5k7qzb5@vireshk-i7>
 <fd7b9f42-d0a7-45eb-2a17-d46779011c58@gmail.com>
 <20201223041931.klnppy4fu3sdgtsz@vireshk-i7>
 <f00e0c74-8d9a-d3d3-81bb-3ac25a74175d@gmail.com>
 <20201224064339.zngidobhstnlu2a3@vireshk-i7>
 <780db190-d93d-3bca-4819-790010f82c62@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <780db190-d93d-3bca-4819-790010f82c62@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24-12-20, 16:00, Dmitry Osipenko wrote:
> In a device driver I want to set PD to the lowest performance state by
> removing the performance vote when dev_pm_opp_set_rate(dev, 0) is
> invoked by the driver.
> 
> The OPP core already does this, but if OPP levels don't start from 0 in
> a device-tree for PD, then it currently doesn't work since there is a
> need to get a rounded-up performance state because
> dev_pm_opp_set_voltage() takes OPP entry for the argument (patches 9 and
> 28).
> 
> The PD powering off and performance-changes are separate from each other
> in the GENPD core. The GENPD core automatically turns off domain when
> all devices within the domain are suspended by system-suspend or RPM.
> 
> The performance state of a power domain is controlled solely by a device
> driver. GENPD core only aggregates the performance requests, it doesn't
> change the performance state of a domain by itself when device is
> suspended or resumed, IIUC this is intentional. And I want to put domain
> into lowest performance state when device is suspended.

Right, so if you really want to just drop the performance vote, then with a
value of 0 for the performance state the call will reach to your genpd's
callback ->set_performance_state(). Just as dev_pm_opp_set_rate() accepts the
frequency to be 0, I would expect dev_pm_opp_set_rate() to accept opp argument
as NULL and in that case set voltage to 0 and do regulator_disable() as well.
Won't that work better than going for the lowest voltage ?

-- 
viresh
