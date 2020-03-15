Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C9CD185C78
	for <lists+linux-media@lfdr.de>; Sun, 15 Mar 2020 13:54:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728532AbgCOMyG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Mar 2020 08:54:06 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39512 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728522AbgCOMyG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Mar 2020 08:54:06 -0400
Received: by mail-lf1-f66.google.com with SMTP id j15so11681414lfk.6;
        Sun, 15 Mar 2020 05:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1MwTYDSMkQGM4p1A9KGg+VT/DsDNrrQYfUwwT/ZLztU=;
        b=PVW4lwLpvpoZzOqZEqmL2rZNklnr+mBEBTHrm1U2oQCXugYZUXMn73hg0zr7nZEt6Q
         sa3RQTuWbDvP0p0KvC1A7Gs5Yxz+w2LZndSmver+ZGSD+6U8QK94OOo3Zo9sQahuheqp
         xR0j1sNV3Fx/WHx2Hv0HHhtcMnfTLI2ys7PhowwjQseAHffjF8gG499vHraH5AMvGp/N
         SPsYkIl+fr8LQywgtxdCjfRXRmzWQY21RunzhrW2Jt6y5NlZob96SiCUy8omR/uhKOl+
         saj+Ox1dwqeHNc83t87f3Wk++i2PZcgAGKDCPGfNcxvjht9KUu+NgnkYS+FVHX7NXSbZ
         LKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1MwTYDSMkQGM4p1A9KGg+VT/DsDNrrQYfUwwT/ZLztU=;
        b=VRvmw7AMeQP8woYrKSwTUYQHC6aDTcShej1h0JLCVRGbWgF9TmaC32JECSru5FjGq0
         stHRPt41mfnWJnfaWgZHhczhHsqngqiLOL1Af+ajLcvV1IS7Ov01mwSfJAShwsAV8s4R
         tXozW+AZTBwNnDRJPz5tlYypuALPEqZA9St/YXBbe+ssdL++mUNM10l2+7EMOnOy1amG
         1CqXHPPbTAvB6eNAXusWn4OOxSBe0dHcESeS1Q72jcPjUvKgExo/TiUK/gdVAnAQgVIT
         oQgIgjwZjOBr64qA1uVX5GesHslNjsovGz78qV4NidsnHKOfMh+/B9g/AsfIsomNi+07
         O/hg==
X-Gm-Message-State: ANhLgQ1VKqR7NEoAkkzmRpkqt/71xXPocwKdyD8CL02cpx+l7My+0BUL
        /ln5SudCxU5akGD/o8pgVgXcrIx2
X-Google-Smtp-Source: ADFU+vuEFH5q0NH5MzntAYyZmI1FtKlcUtANyZyUjRv2GKKy4RBWpfNo0pevPKgB8YDmuRJlHyHK/A==
X-Received: by 2002:a19:cbd5:: with SMTP id b204mr608821lfg.203.1584276843012;
        Sun, 15 Mar 2020 05:54:03 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id v200sm4187853lfa.48.2020.03.15.05.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2020 05:54:02 -0700 (PDT)
Subject: Re: [RFC PATCH v4 8/8] arm64: tegra: Add Tegra VI CSI support in
 device tree
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, helen.koike@collabora.com, sboyd@kernel.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1584236766-24819-1-git-send-email-skomatineni@nvidia.com>
 <1584236766-24819-9-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b4bbcc1d-d38c-14c5-7205-2f7657ab8712@gmail.com>
Date:   Sun, 15 Mar 2020 15:54:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1584236766-24819-9-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

15.03.2020 04:46, Sowjanya Komatineni пишет:
> Tegra210 contains VI controller for video input capture from MIPI
> CSI camera sensors and also supports built-in test pattern generator.
> 
> CSI ports can be one-to-one mapped to VI channels for capturing from
> an external sensor or from built-in test pattern generator.
> 
> This patch adds support for VI and CSI and enables them in Tegra210
> device tree.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---

Hello Sowjanya,

...
> +
> +			pd_venc: venc {
> +				clocks = <&tegra_car TEGRA210_CLK_VI>,
> +					 <&tegra_car TEGRA210_CLK_CSI>;
> +				resets = <&tegra_car 20>,

What is the clock #20?

> +					 <&tegra_car TEGRA210_CLK_CSI>,
> +					 <&mc TEGRA210_MC_RESET_VI>;

Does this order means that memory controller will be reset *after*
resetting the CSI/VI hardware? This is incorrect reset sequence.

The memory controller reset should be kept asserted during of the time
of the hardware resetting procedure.

The correct sequence should be as follows:

1. Assert MC
2. Reset VI
3. Deassert MC
