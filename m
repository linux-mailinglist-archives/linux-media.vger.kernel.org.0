Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C29321B6856
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 01:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728918AbgDWXOa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 19:14:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729479AbgDWXOT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 19:14:19 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C232C09B042;
        Thu, 23 Apr 2020 16:14:19 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id g10so6096098lfj.13;
        Thu, 23 Apr 2020 16:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YRuoGWBm60Ii1Hz2Hs8uoVmT49CmJ2kNwtRsaLhZyPk=;
        b=oowz3YAOdDRngqN1HXPgdgqmGuXVtRIwtRmLratteFjeAb/MNO3GPg1iaM4lM9kmlh
         nyN0LovgArhQl073nyf8e8id1FGl1wd46DvPbmR2AU84BmJNPUH6Tgj8aTXSpW/lvocY
         RXvJyilmh6ELh6o9Db3ngyoEZopMt2Jlhk9o0SImlLAnsfG5CVZpImvp/e5YDKYqBAvA
         UN5jXF3/2D/Z1USxATXw43EqpA9m+IVfavyuIqkVZ/zyoaHJTLfcKKFwMwEElFP7Z6wz
         JLQXOIDlX/k4CxmYeK0mAlBWqrmKpInS8XLJDHJFvy+2Mt1bkQAGwUS55z9a2f2Y6gYn
         BUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YRuoGWBm60Ii1Hz2Hs8uoVmT49CmJ2kNwtRsaLhZyPk=;
        b=jEA6GN8UQsCT93F3FrUpjWXbH2zYAlWvWUaOa4aRaGjhwdncNYEPFMgt14mt2FGyW0
         9Qh4teszx1/Q1A6AV4SlHB/P5oa6ubwgmlWoYH5H51aJw7LL7S5Bfeqs2jGok4GkoHsi
         AA31awTKrPopcC2mKV2TKHn0ek2b19Zeiblk3wFrGC8lr645Mni59MlVtBZ+zZ9OP61K
         UeXaBj1jsVnDRxSJizX0C9Oqeqg62W3+IE8EDA84BkjcjyDmtFk14gn84YmjwuXlN5px
         Ov2alhXcOR6kxA4QOpNDc894TlLBM6hfWwwmGVX3Am90sQPSXHeqQ09BemTBq8bHInKp
         Gnhw==
X-Gm-Message-State: AGi0PuagydLfmBUpSUyuz+JBWzjBaJIkaQ0FA8BMj1rwnIg6kX/U5nek
        UQXt4D1B/E3x8BRCKLC9AOIP0MIw
X-Google-Smtp-Source: APiQypIgGycQG0qsCtKXxcVeP09vCZNM3Vf3YxVFG5Ht9Hb1dQLMIeBxXmy8ybcEH1rpoQWVcxf12g==
X-Received: by 2002:a19:550a:: with SMTP id n10mr3954299lfe.143.1587683657588;
        Thu, 23 Apr 2020 16:14:17 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id j13sm3085298lfb.19.2020.04.23.16.14.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2020 16:14:17 -0700 (PDT)
Subject: Re: [RFC PATCH v9 6/9] media: tegra: Add Tegra210 Video input driver
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, frankc@nvidia.com, sakari.ailus@iki.fi,
        helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1587536339-4030-1-git-send-email-skomatineni@nvidia.com>
 <1587536339-4030-7-git-send-email-skomatineni@nvidia.com>
 <ae6dfd6b-4b0b-db73-54cf-a16e59476f38@xs4all.nl>
 <3115a959-045e-7b27-94fb-a11a8b5f4a6a@nvidia.com>
 <db413479-1557-3c40-ecb2-5a0c657065b6@gmail.com>
 <843d1276-1281-7f02-ce08-d0dad52bb681@nvidia.com>
 <42820cd8-e157-4cbe-9e3a-25afb7deb0cf@gmail.com>
Message-ID: <a4f5a84f-b893-cade-adeb-23637ea133c2@gmail.com>
Date:   Fri, 24 Apr 2020 02:14:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <42820cd8-e157-4cbe-9e3a-25afb7deb0cf@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

24.04.2020 02:03, Dmitry Osipenko пишет:
> 24.04.2020 01:59, Sowjanya Komatineni пишет:
>>
>> On 4/23/20 3:55 PM, Dmitry Osipenko wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> 23.04.2020 19:50, Sowjanya Komatineni пишет:
>>>> On 4/23/20 12:48 AM, Hans Verkuil wrote:
>>>>> External email: Use caution opening links or attachments
>>>>>
>>>>>
>>>>> On 22/04/2020 08:18, Sowjanya Komatineni wrote:
>>>>>> Tegra210 contains a powerful Video Input (VI) hardware controller
>>>>>> which can support up to 6 MIPI CSI camera sensors.
>>>>>>
>>>>>> Each Tegra CSI port can be one-to-one mapped to VI channel and can
>>>>>> capture from an external camera sensor connected to CSI or from
>>>>>> built-in test pattern generator.
>>>>>>
>>>>>> Tegra210 supports built-in test pattern generator from CSI to VI.
>>>>>>
>>>>>> This patch adds a v4l2 capture driver with media interface for
>>>>>> Tegra210 built-in CSI to VI test pattern generator.
>>>>>>
>>>>>> This patch includes TPG support only and all the video pipeline
>>>>>> configuration happens through the video device node.
>>>>>>
>>>>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>>> ---
>>>>>>    drivers/staging/media/Kconfig          |    2 +
>>>>>>    drivers/staging/media/Makefile         |    1 +
>>>>>>    drivers/staging/media/tegra/Kconfig    |   13 +
>>>>>>    drivers/staging/media/tegra/Makefile   |    8 +
>>>>>>    drivers/staging/media/tegra/TODO       |   10 +
>>>>>>    drivers/staging/media/tegra/common.h   |  262 ++++++++
>>>>>>    drivers/staging/media/tegra/csi.c      |  606 +++++++++++++++++
>>>>>>    drivers/staging/media/tegra/csi.h      |  149 +++++
>>>>>>    drivers/staging/media/tegra/tegra210.c |  709 ++++++++++++++++++++
>>>>>>    drivers/staging/media/tegra/tegra210.h |  190 ++++++
>>>>>>    drivers/staging/media/tegra/vi.c       | 1132
>>>>>> ++++++++++++++++++++++++++++++++
>>>>>>    drivers/staging/media/tegra/vi.h       |   83 +++
>>>>>>    drivers/staging/media/tegra/video.c    |  153 +++++
>>>>>>    drivers/staging/media/tegra/video.h    |   34 +
>>>>>>    14 files changed, 3352 insertions(+)
>>>>>>    create mode 100644 drivers/staging/media/tegra/Kconfig
>>>>>>    create mode 100644 drivers/staging/media/tegra/Makefile
>>>>>>    create mode 100644 drivers/staging/media/tegra/TODO
>>>>>>    create mode 100644 drivers/staging/media/tegra/common.h
>>>>>>    create mode 100644 drivers/staging/media/tegra/csi.c
>>>>>>    create mode 100644 drivers/staging/media/tegra/csi.h
>>>>>>    create mode 100644 drivers/staging/media/tegra/tegra210.c
>>>>>>    create mode 100644 drivers/staging/media/tegra/tegra210.h
>>>>>>    create mode 100644 drivers/staging/media/tegra/vi.c
>>>>>>    create mode 100644 drivers/staging/media/tegra/vi.h
>>>>>>    create mode 100644 drivers/staging/media/tegra/video.c
>>>>>>    create mode 100644 drivers/staging/media/tegra/video.h
>>>>> With 'make menuconfig' I get this:
>>>>>
>>>>> scripts/kconfig/mconf  Kconfig
>>>>>
>>>>> WARNING: unmet direct dependencies detected for TEGRA_HOST1X
>>>>>     Depends on [n]: HAS_IOMEM [=y] && (ARCH_TEGRA || ARM &&
>>>>> COMPILE_TEST [=y])
>>>>>     Selected by [y]:
>>>>>     - VIDEO_TEGRA [=y] && STAGING [=y] && STAGING_MEDIA [=y] &&
>>>>> MEDIA_SUPPORT [=y] && (ARCH_TEGRA || COMPILE_TEST [=y])
>>>>>
>>>>> This is an x86_64 build with COMPILE_TEST set. I can provide my full
>>>>> .config if you need it.
>>>>>
>>>>> CONFIG_TEGRA_HOST1X=y
>>>>> CONFIG_VIDEO_TEGRA=y
>>>>>
>>>>> Regards,
>>>>>
>>>>>           Hans
>>>> Hi Hans,
>>>>
>>>> In v7, changed Kconfig to remove ARM. But looks like we should limit
>>>>
>>>> TEGRA_HOST1X also limits compile to ARM only so running VIDEO_TEGRA on
>>>> x86_64 shows above warning.
>>>>
>>>> We should limit compile to ARM for CONFIG_VIDEO_TEGRA.
>>>>
>>>> Will update CONFIG_VIDEO_TEGRA dependency to use ARM && COMPILE_TEST
>>>> like I had in previous version. Sorry about this.
>>>>
>>>>
>>>> Also, I see some changes went into latest linux-next staging media
>>>> Kconfig, So, will have my patches on top of today's linux-next.
>>> VIDEO_TEGRA should depend on TEGRA_HOST1X and not select it.
>>>
>>> depends on (ARCH_TEGRA && TEGRA_HOST1X) || COMPILE_TEST
>>
>> Was selecting it to auto-select Tegra host1x when video_tegra is enabled.
>>
>> Yes, can use depends on
>>
> 
> BTW, perhaps ARCH_TEGRA and COMPILE_TEST aren't needed since
> TEGRA_HOST1X already depends on them, so just:
> 
> depends on TEGRA_HOST1X
> 

Although, I guess TEGRA_HOST1X isn't really needed for compile-testing,
and thus, it won't hurt to drop that dependency for testing:

depends on TEGRA_HOST1X || COMPILE_TEST
