Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9C101B676A
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 01:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728023AbgDWXD0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 19:03:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbgDWXDZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 19:03:25 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BC8EC09B042;
        Thu, 23 Apr 2020 16:03:24 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id f11so3394651ljp.1;
        Thu, 23 Apr 2020 16:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EHTedemR8pmXLhnsEJcX4Ui2JiPWVL7bvYw9tgNumGA=;
        b=lvMKKHK6hvmmypcGmLwfT3pNIStC4VgCpxBvNtWwr1dRyl/ao3DfRAFYM6br0IX6vg
         JMXNJkrd8vh13Cr2e91C12abNCxoN1klLGjnhdIJV8tfSv0c1gHUsnfZpQyqpwXwnalY
         QksjSD1MhKZuqslZGXAwZigdTkJM+6bxKRvEKdVMaIlowwy7K9byIHvT1+U2+xOLD79S
         W/5ZJPUEHAHY1pjVZ0MzN6FSjnwDAJgLX0bgvh2jKgFB0E+r+5JAhGdDycg1YCFZ344Z
         gM5GkPfUTYTTN3QfN8VhfJjNVj+i1huvq2ypjpiRRX3TCpZTBRyDkZ23pajPhb3u1p+q
         wSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EHTedemR8pmXLhnsEJcX4Ui2JiPWVL7bvYw9tgNumGA=;
        b=r2tpw3u5hMFbB6FWYm0ye7xEF75qZPFNqJ6lJfzaKX4Nl1ruTcmfyt1sKqQroLYvuT
         hNcknLsk4SU4MP0g/prEI9rO+Tixcj9/PDcPiq9acV7ZiFRv9yzsRxNoGPqVGtJdchgV
         hKR4/bXlF6z6Uh+XyTGNNKQN6mdnv1JF1GmiYWcYWty5Fn/0/n2zdlKWEWCboYE45wZt
         +4CbaDXiFbBQares95CSTMLDNqbIkcRWKw1uSNkGP5d8esox3L9ALNGufq9l1M67WL63
         0/KbHOzHa7iwiAvbyuykfwT/qfFZrvPirV7aicIwTLFU/vVix0SRARuz85afgorfBFr9
         jpgw==
X-Gm-Message-State: AGi0PubiK9PtvJIaTQZaNWfRDNADWde0VgsjB56K+RelnfbSa69+YtEc
        TSHiWQIMfp6Rt+3JJ+afCloOKfso
X-Google-Smtp-Source: APiQypJ/h22J5dgUsL2f+P7xX7NJNczj0oupJRGbSXbQSfqf3u/c+NAk67CDq7jiZi4t8IrcNAwdrQ==
X-Received: by 2002:a2e:9b45:: with SMTP id o5mr3954544ljj.33.1587683001820;
        Thu, 23 Apr 2020 16:03:21 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id u9sm3022183ljl.33.2020.04.23.16.03.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2020 16:03:21 -0700 (PDT)
Subject: Re: [RFC PATCH v9 6/9] media: tegra: Add Tegra210 Video input driver
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <42820cd8-e157-4cbe-9e3a-25afb7deb0cf@gmail.com>
Date:   Fri, 24 Apr 2020 02:03:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <843d1276-1281-7f02-ce08-d0dad52bb681@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

24.04.2020 01:59, Sowjanya Komatineni пишет:
> 
> On 4/23/20 3:55 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 23.04.2020 19:50, Sowjanya Komatineni пишет:
>>> On 4/23/20 12:48 AM, Hans Verkuil wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> On 22/04/2020 08:18, Sowjanya Komatineni wrote:
>>>>> Tegra210 contains a powerful Video Input (VI) hardware controller
>>>>> which can support up to 6 MIPI CSI camera sensors.
>>>>>
>>>>> Each Tegra CSI port can be one-to-one mapped to VI channel and can
>>>>> capture from an external camera sensor connected to CSI or from
>>>>> built-in test pattern generator.
>>>>>
>>>>> Tegra210 supports built-in test pattern generator from CSI to VI.
>>>>>
>>>>> This patch adds a v4l2 capture driver with media interface for
>>>>> Tegra210 built-in CSI to VI test pattern generator.
>>>>>
>>>>> This patch includes TPG support only and all the video pipeline
>>>>> configuration happens through the video device node.
>>>>>
>>>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>> ---
>>>>>    drivers/staging/media/Kconfig          |    2 +
>>>>>    drivers/staging/media/Makefile         |    1 +
>>>>>    drivers/staging/media/tegra/Kconfig    |   13 +
>>>>>    drivers/staging/media/tegra/Makefile   |    8 +
>>>>>    drivers/staging/media/tegra/TODO       |   10 +
>>>>>    drivers/staging/media/tegra/common.h   |  262 ++++++++
>>>>>    drivers/staging/media/tegra/csi.c      |  606 +++++++++++++++++
>>>>>    drivers/staging/media/tegra/csi.h      |  149 +++++
>>>>>    drivers/staging/media/tegra/tegra210.c |  709 ++++++++++++++++++++
>>>>>    drivers/staging/media/tegra/tegra210.h |  190 ++++++
>>>>>    drivers/staging/media/tegra/vi.c       | 1132
>>>>> ++++++++++++++++++++++++++++++++
>>>>>    drivers/staging/media/tegra/vi.h       |   83 +++
>>>>>    drivers/staging/media/tegra/video.c    |  153 +++++
>>>>>    drivers/staging/media/tegra/video.h    |   34 +
>>>>>    14 files changed, 3352 insertions(+)
>>>>>    create mode 100644 drivers/staging/media/tegra/Kconfig
>>>>>    create mode 100644 drivers/staging/media/tegra/Makefile
>>>>>    create mode 100644 drivers/staging/media/tegra/TODO
>>>>>    create mode 100644 drivers/staging/media/tegra/common.h
>>>>>    create mode 100644 drivers/staging/media/tegra/csi.c
>>>>>    create mode 100644 drivers/staging/media/tegra/csi.h
>>>>>    create mode 100644 drivers/staging/media/tegra/tegra210.c
>>>>>    create mode 100644 drivers/staging/media/tegra/tegra210.h
>>>>>    create mode 100644 drivers/staging/media/tegra/vi.c
>>>>>    create mode 100644 drivers/staging/media/tegra/vi.h
>>>>>    create mode 100644 drivers/staging/media/tegra/video.c
>>>>>    create mode 100644 drivers/staging/media/tegra/video.h
>>>> With 'make menuconfig' I get this:
>>>>
>>>> scripts/kconfig/mconf  Kconfig
>>>>
>>>> WARNING: unmet direct dependencies detected for TEGRA_HOST1X
>>>>     Depends on [n]: HAS_IOMEM [=y] && (ARCH_TEGRA || ARM &&
>>>> COMPILE_TEST [=y])
>>>>     Selected by [y]:
>>>>     - VIDEO_TEGRA [=y] && STAGING [=y] && STAGING_MEDIA [=y] &&
>>>> MEDIA_SUPPORT [=y] && (ARCH_TEGRA || COMPILE_TEST [=y])
>>>>
>>>> This is an x86_64 build with COMPILE_TEST set. I can provide my full
>>>> .config if you need it.
>>>>
>>>> CONFIG_TEGRA_HOST1X=y
>>>> CONFIG_VIDEO_TEGRA=y
>>>>
>>>> Regards,
>>>>
>>>>           Hans
>>> Hi Hans,
>>>
>>> In v7, changed Kconfig to remove ARM. But looks like we should limit
>>>
>>> TEGRA_HOST1X also limits compile to ARM only so running VIDEO_TEGRA on
>>> x86_64 shows above warning.
>>>
>>> We should limit compile to ARM for CONFIG_VIDEO_TEGRA.
>>>
>>> Will update CONFIG_VIDEO_TEGRA dependency to use ARM && COMPILE_TEST
>>> like I had in previous version. Sorry about this.
>>>
>>>
>>> Also, I see some changes went into latest linux-next staging media
>>> Kconfig, So, will have my patches on top of today's linux-next.
>> VIDEO_TEGRA should depend on TEGRA_HOST1X and not select it.
>>
>> depends on (ARCH_TEGRA && TEGRA_HOST1X) || COMPILE_TEST
> 
> Was selecting it to auto-select Tegra host1x when video_tegra is enabled.
> 
> Yes, can use depends on
> 

BTW, perhaps ARCH_TEGRA and COMPILE_TEST aren't needed since
TEGRA_HOST1X already depends on them, so just:

depends on TEGRA_HOST1X

