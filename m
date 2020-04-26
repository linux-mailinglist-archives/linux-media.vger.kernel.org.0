Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB8DC1B8B57
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 04:38:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726117AbgDZCik (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Apr 2020 22:38:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726087AbgDZCik (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Apr 2020 22:38:40 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D48A2C061A0C;
        Sat, 25 Apr 2020 19:38:39 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id u6so13925626ljl.6;
        Sat, 25 Apr 2020 19:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IymlWt36MWWCKO6nTuTKcOHqO6ekl2KVehne9ghoAnE=;
        b=eNkDBWqq0GfN63tC2NANK0uk+ezAGAgI1Valwr4suAJJhguogWDl0Pe2ok6utbymnM
         4wUKgQqZqlgPDiI39B/QEMaScIRquiQZXrO/6rejtgEbi15BEEzLPFzirC943w1JKVoG
         9TDC1t2SIyVfU9SKsyPocL+Iiy/5Qr0Dpv907fE3epxqnNDITlUPKVXyPjkIIxg/UrO6
         PHa/f5Md+qhpe79ZmEuMNFR5dQqp1dCWp/u1IZkqwvU4LzEP8s4XuCItaZUIWb/lMYTV
         cE7bjejwqpq+IXQz8R6DcLomUx/65KWN2xrvMlgK/vo9Hf+DvwlepVjdBxiPItsGy2C7
         NPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IymlWt36MWWCKO6nTuTKcOHqO6ekl2KVehne9ghoAnE=;
        b=K+AGfGbvYc97LF6w40YmCsh+gXwllZsN7oud9OVgpz1i6MFfSbcdm+ie3v2QzRA7ZG
         qR4wRpHsBB4t76UyjqJ21/HsceT3eLLFKSTwgEvNMqPT1I+eWWB69d2WisrxDtSIGtmt
         /CJSNdB+4Ews7Uh0mFhMimFJa5j6NLxesK3iBCX6cJ707BszSsYdjrlqsVjLQAGE7fTw
         A4lzPr+23gIFsKfvQLvNZ8NQ/HVeID2/PW/MjWd1/4K8Q+xXxFl8ypwY+75hz50WWwfA
         u8kt6BL0iPAvb0D8xxpVXTmzeQJZSiEU2c3qv3+1XSmwYmS5CUIXx8707lujAiYIAiJo
         SPZQ==
X-Gm-Message-State: AGi0PuY358SEu43mkvUoOOs8TcWFPYZuL8Yz6rJulkVnlWVyj5bT3ns3
        K5OwsvCN6XHH3R/dBDANxGKabqRE
X-Google-Smtp-Source: APiQypLHvPGnMNh5Iu4Srlk24LWcuGEmvE564qeS9hU2QeplkYLybfJiTztPRJZXhJofotA+fUlYCg==
X-Received: by 2002:a2e:7308:: with SMTP id o8mr10236640ljc.16.1587868717052;
        Sat, 25 Apr 2020 19:38:37 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id d23sm7957238ljg.90.2020.04.25.19.38.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2020 19:38:36 -0700 (PDT)
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, frankc@nvidia.com, sakari.ailus@iki.fi,
        helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
 <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
 <6ca93ff9-ca59-544f-767c-4355d01a5c20@gmail.com>
 <62546d1f-eca5-06be-2bc2-e45ccd53830a@xs4all.nl>
 <50fd1016-ca8b-ec5d-e5a8-f257138b152e@gmail.com>
 <658c4232-94d9-3051-8c93-bff7046cf5f2@nvidia.com>
 <03426915-25ea-69b4-bc64-f87f3046d33f@nvidia.com>
 <aabaecc4-3494-0137-7d2b-853304bfa68b@gmail.com>
 <09f20441-fec6-7496-2edc-c69db535e441@nvidia.com>
 <61799fab-858c-8b0d-ba7d-846cd041e044@gmail.com>
 <3a9707b5-b260-6137-f475-fc88d271010f@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a7407ed7-f35e-b3e9-ad26-3e83f0ed462b@gmail.com>
Date:   Sun, 26 Apr 2020 05:38:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3a9707b5-b260-6137-f475-fc88d271010f@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

26.04.2020 05:19, Sowjanya Komatineni пишет:
> 
> On 4/25/20 7:10 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 26.04.2020 04:43, Sowjanya Komatineni пишет:
>> ...
>>>> It looks to me that at least all those hardcoded HW format IDs do not
>>>> match the older SoCs.
>>> TPG hard coded formats are supported on prior Tegra.
>>>
>>> Other supported formats are SoC dependent and  part of soc data in the
>>> driver already.
>> But I don't see where that SoC-dependent definition is made in
>> terga210.c. That tegra_image_format enum looks T210-specific, isn't it?
>>
>> ...
> 
> Video formats which are SoC variants are made soc specific in driver
> already tegra_vi_soc structure member video_formats
> 
> tegra_image_format enum is same for T210 and T186
> 
> For T194, enums will be diff and will have diff TEGRA194_VIDEO_FORMAT
> using corresponding Tegra194 video format enums
But it is also not the same for older SoCs, correct? All the
T210-specific things should be separated better, unique parts shouldn't
be kept in the common code.

Hence the tegra_image_format should be renamed to tegra210_image_format
and moved out to t210.h, since it's not common. But then you'll probably
need to rename all TEGRA_ defines to TEGRA210_ to make t210.h reusable
by T186.

Also, in the end it may not worth the effort to share anything at all,
it could be cleaner to have a bit of duplication. Although, I have no
idea how T186 code will look like and what other parts of T210 could be
reused by T186. All this needs to be taken into account in order to
avoid struggling with the code's reshuffling in the future.
