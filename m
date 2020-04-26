Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7491B8A5B
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 02:38:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbgDZAiv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Apr 2020 20:38:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725962AbgDZAiu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Apr 2020 20:38:50 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5995EC061A0C;
        Sat, 25 Apr 2020 17:38:50 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id f18so13808583lja.13;
        Sat, 25 Apr 2020 17:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=b66DarpJcv02SpJTC1AUkHTGXRvQAoN5p7YTkn4SOrg=;
        b=eneDK3+EqxggyWZZrGg5byWLO4Z5u5CLMe3f8ElX71JSEWq0J0WgRRtqtuZ6Eg4weu
         9ic3iYb0W2tb0ZKaBnxqQp0AVRHVZXBM5uBvwwCk2ZEL5fW67ZSfh3KxedGnhkHtzFxY
         nzHrX4EMveCwfTlj3KTYDQwlqZGzsIafDWsXwIl9ljZ7sacLQqj7CNJqz6z+fKkodXyT
         LcspseGIvqSSCvT1RwvrZYvuqVRYvUT/S5w/pgje73H+ubuKJOYZ/Cwi+EPqt5yGWtu4
         DLF4aaQqCdvMRPkfCdVczCNCD3QGf2ESqBqT0YsHR63khd6DIn4ZkB/fH5/2WCI9et1q
         q+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=b66DarpJcv02SpJTC1AUkHTGXRvQAoN5p7YTkn4SOrg=;
        b=hYkymdp/rB3v7EEO3SZaUMj1qjIZh5XHN/Da5iYAKQeXBUijHKDkNPgTmdBniabtm5
         NQJmUk/+YDKm9JXcAk3HXq54VmhTrGN0Tt4S3Ag+lpQQjNBB66Sy4GbE3Oo7hfEHUPEy
         zVSP48SEXpqSCwW1A/QGVZCMOxOP7M+ThNIMKaqBPLmCmLfRULedftwEYJUKojGwPdsp
         AFtVNhrQn8if/dbzA+XgAXnTRmwda82TddVIqstDGJ1QI4wQDtPa6nPJEewBt6BdqH7c
         j81eRth9mTHWXLx28oj+2i4hUQnmTpB+y8kt2FiXGt8vpBMc8uzztRLXmbH0W1Iu5LQ1
         +RLA==
X-Gm-Message-State: AGi0Pua/uoBUnnPqxoYL/mOh4BIPe5Hs+U/IMRbuanSHzc6lfTYes63d
        Z+TTfXaGwMlh1b4eIJKkwvQEUILw
X-Google-Smtp-Source: APiQypKUtX3briKvdTcW3p5cPGeR7L4P8nYGstj6plJAsaxEYnhm4L6KHOvvklQQgAyC/psy24cxwA==
X-Received: by 2002:a2e:571a:: with SMTP id l26mr9896181ljb.12.1587861528492;
        Sat, 25 Apr 2020 17:38:48 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id z21sm7065369ljh.42.2020.04.25.17.38.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2020 17:38:48 -0700 (PDT)
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
 <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
 <3155e0d2-94b0-6e0a-bf35-b3560c201039@gmail.com>
 <fffc09d1-a25f-2d6e-83bd-f7657dd2ff16@nvidia.com>
 <e5602c48-a73e-8e71-188d-6a53ebf8e4a4@gmail.com>
 <f6d62dde-9ab5-7001-0ff4-93ed70cb207f@nvidia.com>
 <6568af00-3d65-4ddb-f003-7a4161d751a0@gmail.com>
 <f3a122b9-3600-b1eb-be4f-39be79d979a5@nvidia.com>
 <5a6f61c6-2049-fb61-3a80-e729708b3fb8@gmail.com>
 <94d6d159-950a-ee78-05a2-c37fb8fb9873@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a9948c5e-4b12-fbf5-a096-fa7a64e3877b@gmail.com>
Date:   Sun, 26 Apr 2020 03:38:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <94d6d159-950a-ee78-05a2-c37fb8fb9873@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

26.04.2020 03:24, Sowjanya Komatineni пишет:
> 
> On 4/25/20 5:19 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 26.04.2020 02:44, Sowjanya Komatineni пишет:
>> ...
>>>> How much of the T210 code could be reused by T186/194?
>>> vi/csi are common driver where soc structure should be populated for
>>> T186/T194
>>>
>>> Tegra210.c can't be reused for Tegra186/t194 as programming seq is a
>>> whole lot diff
>>>
>> How are you going to separate Tegra210/186/194 drivers from each other?
>> I don't think you'll want to have one "fat" driver that covers all those
>> SoCs, won't you?
>>
>> In the end it should be three modules: tegra210-video.ko
>> tegra186-video.ko tegra194-video.ko.
>>
>> Using a per-SoC OPS doesn't allow you to do that because the "root"
>> driver will have to lookup OPS' code symbols of every SoC, and thus, the
>> unwanted driver modules will get auto-loaded if you'll try to factor out
>> the OPS into a separate driver modules.
> 
> tegra-video driver will be common for t210/186/194

Oh, well.

> we add corresponding compatibles to tegra-video and vi/csi drivers along
> with that need to add tegra186_vi_soc, tegra194_vi_soc and implement
> tegra186.c/tegra194.c
> 
> tegra-video driver updated for later tegra include updating drivers list
> and subdevs list to add t186/t194 compatibles

