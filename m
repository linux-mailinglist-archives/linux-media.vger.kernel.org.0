Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A23A2E0EA7
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 20:17:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726374AbgLVTPT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 14:15:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbgLVTPT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 14:15:19 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAE0FC0613D3;
        Tue, 22 Dec 2020 11:14:38 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id h205so34504600lfd.5;
        Tue, 22 Dec 2020 11:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XzA+IxTqOiwjX/OrglCXeb/ESpno+XzmysujmIzCZFM=;
        b=h6Un3O0GRIs20IfATLi+caPIyTbxDAcApXIG4ly+tb+Ff/AsSFUMzbqRg8x3QcB6R+
         /lifUSEyU9TWfJc8mLHdB9d8Y9qRGestdhGRPway3GOSGQ8cuy0pUSKXN4e5DxzEnKwD
         fYR1YIf05Ra2zD+xV/OtVJhAAejE7qDSsealn/k6wRndcA+Kr9Qd5G4O+fFM4ffhZQx5
         iWL+fsem7uxnvLNF9sQvi3DoxjBI8dadxS+frkf0ytoCPFY3u7CLr3wTEKUDK5cvpLd6
         ZVfYRe9qC4R3pywKEw8dY8c5wQiJMnxeiGLjUsFSzmvoCygv4r2QJhnbSecDGxF5TC88
         NxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XzA+IxTqOiwjX/OrglCXeb/ESpno+XzmysujmIzCZFM=;
        b=mxRyKaHhw8JLtrsmCztk+L2LgV2k5I1RawRq6ffS17EYZ8AzTVYLhUumcfkmpqoYSI
         z1rU6J4r8CI8ZXPJ/ZRlQLn7fFpTZWuXA+22KhyZN0890I2MCGjP1KfQ4WkzHJiUXcGs
         IACHg8wVGbpVGg7S8N6qePHEkKVeLtRwud2HNPa35eKs+ENp7eANZRmiI8XDcUyeHJf0
         DHKhxOgLRE6ahG5IE0xv6By9LMj4dcd4269NfqN3afMy+Nsz0WCAsepylWv/oyFHf53i
         JwvEaoBkRbzYPPns5DKGwOvazy6wgJt2juNod9xVJtMMQv06b/Anr1h/VcYL1BwlfdXj
         6IkQ==
X-Gm-Message-State: AOAM530UVhNoqLklICcRvPD7DytYECgJKnKZhO999HXc8VVW9EPSWTeX
        9brciDyNgx7ir3baqG1p5/DqKHXetT0=
X-Google-Smtp-Source: ABdhPJx7qPXV3sur6eNMVZg5jfo2nbqg0IGWfAP0Kv+mCCycwkuquOyLrOc/kJVZYxAbFZWEAV5uLg==
X-Received: by 2002:a2e:a366:: with SMTP id i6mr10568406ljn.427.1608664477207;
        Tue, 22 Dec 2020 11:14:37 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id h23sm3018460ljh.115.2020.12.22.11.14.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Dec 2020 11:14:36 -0800 (PST)
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
 <c0976db7-ae66-740c-d95f-501d81c99fa0@gmail.com>
 <20201222091558.mhqf4oytviwc6b3h@vireshk-i7>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6281108a-5d76-bf6e-13ea-e27808c829b9@gmail.com>
Date:   Tue, 22 Dec 2020 22:14:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201222091558.mhqf4oytviwc6b3h@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

22.12.2020 12:15, Viresh Kumar пишет:
> On 18-12-20, 16:51, Dmitry Osipenko wrote:
>> Alright, although I haven't pretended that v2 patches should be merged
>> right away since they are fundamentally different from v1, and thus, all
>> patches need to be reviewed first.
> 
> I agree. I have done some basic review for the stuff.

Thank you for the review.

>> If the current OPP changes look good to you, then please give yours r-b
>> to the patches. Thanks in advance!
> 
> r-b-y isn't required as they will go through my tree itself. So if everyone is
> happy with the idea, please submit the patches separately (fixes, improvements,
> devm_*, etc).

okay
