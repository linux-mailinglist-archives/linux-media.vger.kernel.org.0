Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47C931B8A0D
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 01:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726122AbgDYXkb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Apr 2020 19:40:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbgDYXkb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Apr 2020 19:40:31 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5077DC061A0C;
        Sat, 25 Apr 2020 16:40:29 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id e25so13770365ljg.5;
        Sat, 25 Apr 2020 16:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oXCFuXGcaBQ8WLAWH+/JLqoQs+neD+DHrlmOTu9tXL8=;
        b=IQbOXHlHkCu7gh8rfwhgj9HZNKCUQLeH2Lni5W3GzVszWa8GVfZbDBupilZJcN5XSG
         Tg9ri4i0ctVPq7q4UkOlDQ/udd4zzcwfDDxboqkdTsdJN0MaY+tyVBXLdBAJe/+7phW2
         tJJmabjvNQrLIUccyTaUtr5hrB1lFWkMyVOU5kb8mgOa8DXa7fs7ARtKwA4GbpgLTfe0
         gHVJWQi3Iug2DcW4T+8IhbDsmoQDe7NCDtCflC7YH+HdRlLf0XjsA0WAOvQS52bfHWGx
         UvNWEIvipjkVGE/pnJ2PikPmHtZ3zPS0HzY0f/CHGdbKor5E2pQbUbhpgMrghmDgcsJ9
         91dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oXCFuXGcaBQ8WLAWH+/JLqoQs+neD+DHrlmOTu9tXL8=;
        b=p1ILjsFsMedxcTYecuAqUb14z9srw9O31L7v9jSJTiwgOm1r80GCQVWQ6U6SdSNgxn
         7tAQrDwSH21Bgm07Qy69V3rwCbpC5fXTGwrd79f25VFSo7U4kJOe4rYsf0KQTwY+yl1m
         IqWL38U6jyDBOKNM4uB0YE49JaztbgtgfNPAJsuIi6pc0ZIGmqv2ZfxdxRk2t3kft98F
         2IgSQeKrlLz7fl+alPUErvlSKvTwxeWovrS5p5Lz2sHBRMzQY8bTNfxcT582nyDCRI9R
         0pZluz1ghdOP+IbCReu3Oda2muz16RCboE7IenPfXRfrcRL79EZ7frYiQJ8KlnNxj+jN
         MTEg==
X-Gm-Message-State: AGi0Pubc1gTeYtjaS/8HyiiabJsnFDPgfZ3MyVxejnShtz0mEUeJM+Vv
        mPBV20MrpzijWl9xx7QxYDQj7wiW
X-Google-Smtp-Source: APiQypLNo0neAkAtvVrRzROo1ho6aQk5r4PAgKk9VvmtcK5ppf92D3eFkbI75OLpWip6+gWq2ZpZ6w==
X-Received: by 2002:a2e:b1c9:: with SMTP id e9mr10343719lja.102.1587858027350;
        Sat, 25 Apr 2020 16:40:27 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id g3sm4210893ljk.27.2020.04.25.16.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2020 16:40:26 -0700 (PDT)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6568af00-3d65-4ddb-f003-7a4161d751a0@gmail.com>
Date:   Sun, 26 Apr 2020 02:40:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f6d62dde-9ab5-7001-0ff4-93ed70cb207f@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

26.04.2020 01:11, Sowjanya Komatineni пишет:
> 
> On 4/25/20 3:08 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 25.04.2020 01:00, Sowjanya Komatineni пишет:
>>> On 4/24/20 8:07 AM, Dmitry Osipenko wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> 24.04.2020 06:55, Sowjanya Komatineni пишет:
>>>>
>>>> Is this driver compiled as a single kernel module file?
>>>>
>>>>> +MODULE_AUTHOR("Sowjanya Komatineni <skomatineni@nvidia.com>");
>>>>> +MODULE_DESCRIPTION("NVIDIA Tegra CSI Device Driver");
>>>>> +MODULE_LICENSE("GPL v2");
>>>> ...
>>>>> +MODULE_AUTHOR("Sowjanya Komatineni <skomatineni@nvidia.com>");
>>>>> +MODULE_DESCRIPTION("NVIDIA Tegra Video Input Device Driver");
>>>>> +MODULE_LICENSE("GPL v2");
>>>> I don't think that these macros are needed in that case.
>>>> The video.c should be enough, isn't it?
>>> yes these can be removed
>> It will be nice to factor out the Tegra210-specific VI/CSI OPS into a
>> separate driver module (say tegra210-vi) to ease supporting of other
>> Tegra versions. Of course this could be done later on, although I
>> suppose the amount of hassle could be reduced if it's done from the
>> start.
> vi/csi.c are common drivers for all Tegras. All Tegra chip specific
> related programming for both vi and csi were already moved to Tegra210.c
> based on prior feedbacks.

Judging by the code's structure the VI/CSI drivers aren't planned to be
reused by older pre-Terga210 SoCs, correct?

How much of the T210 code could be reused by T186/194?
