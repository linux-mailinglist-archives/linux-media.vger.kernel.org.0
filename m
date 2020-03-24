Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C66BC191D16
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 23:48:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727438AbgCXWsz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 18:48:55 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41954 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727132AbgCXWsy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 18:48:54 -0400
Received: by mail-lf1-f67.google.com with SMTP id z23so193453lfh.8;
        Tue, 24 Mar 2020 15:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=06QnBWO8zn+cTFjJT/eh0pa58Q14fQa5v5+3FeRp3t4=;
        b=MO77Ne74Cfhjpls79rr17wj1ZBVWWXKzEDydAiRzRzdR8rt2wzq9QkOUNRDqH8Nw4a
         0XOzzDIMqB5y3xp9Pm7C0DNddLYqeBHlfCQJnWP+rw2fK7pTY65Ghozj7XudxNxjqiDV
         ZZHEt6WFDci88yVuLsuu3IP2hpcqfolekbDfS+eb9EqUTkzdRtcWYn2EDBWBsZ/U03sj
         OJYvghWrFCghsaY1KskSnUK3ugnFN+anw7uTkNxBPIIDoBIdXqjAgX6KwA+fRPIktoQV
         BUsENaVv+hTUl0foeDie69LuqXHgClu2egHLGet+bFBpNjfg8h+djRV5J8y9Os1cApLz
         eB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=06QnBWO8zn+cTFjJT/eh0pa58Q14fQa5v5+3FeRp3t4=;
        b=MCUeJWJNYq+xATQjT4VSvXmXy9hSocwLWsCtsdsI5JSiLaDO6TauHinsBlwghJ33df
         7LdSepLi17M9Jxx+I7dgdX+hKLz5+FSTkmhwpjVJ2+B71jVcFDjZieEl1uuWmiEu49tz
         aXEbGIHt5lhep00oiyQPZ1Vjf26U979bsv5Y5xWAkHvWSKC5SgXSlqMSqnozbV/R6B4w
         tlL/DiSJoZ/ie7eY+/GaYs/UcuVCI1WMKwPn6ld2Hp2bvLTkfIJjBNJlMWnXIBir/87y
         ieApfCRT1oA3P/8AQHV6zXmkk4ORjKDHpTdFmoEh1G0egxNybR41OsC329bh4FiYclPN
         s4IQ==
X-Gm-Message-State: ANhLgQ3nxSo69woSwN49wT7pxLe+kJV79Nk+OLApn/CWnOK1xggyK40M
        qt67z7maK06xK7G8tTRmwRHLfnyi
X-Google-Smtp-Source: ADFU+vuQcigS93PoEpzYdWodOt90VmZiOtPvZwRPlsbXFsu/ZgEPfg+RcDxU2teo88l133Vf2SbZVQ==
X-Received: by 2002:a05:6512:108a:: with SMTP id j10mr224570lfg.35.1585090132092;
        Tue, 24 Mar 2020 15:48:52 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id n23sm3143719lji.59.2020.03.24.15.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2020 15:48:51 -0700 (PDT)
Subject: Re: [RFC PATCH v5 9/9] arm64: tegra: Add Tegra VI CSI support in
 device tree
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1584985955-19101-1-git-send-email-skomatineni@nvidia.com>
 <1584985955-19101-10-git-send-email-skomatineni@nvidia.com>
 <672819ea-01d3-2eca-8bb7-84ffd64256d4@gmail.com>
 <a218142f-295e-6bd5-b1d7-47d9ab8eba3e@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fee09e1e-48a3-e0a0-12dc-9aeeb3438ded@gmail.com>
Date:   Wed, 25 Mar 2020 01:48:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <a218142f-295e-6bd5-b1d7-47d9ab8eba3e@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

25.03.2020 00:04, Sowjanya Komatineni пишет:
> 
> On 3/24/20 12:19 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 23.03.2020 20:52, Sowjanya Komatineni пишет:
>> ...
>>> +                     pd_venc: venc {
>>> +                             clocks = <&tegra_car TEGRA210_CLK_VI>,
>>> +                                      <&tegra_car TEGRA210_CLK_CSI>;
>>> +                             resets = <&mc TEGRA210_MC_RESET_VI>,
>> The MC resetting should be needed only for a hardware hot-resetting. It
>> should be wrong to add it to the power domain.
> TRM recommends to do MC client hot-reset during VE power gate and ungate.

Could you please tell what TRM it is and what's the page#?
