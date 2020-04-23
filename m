Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8E511B674A
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 00:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727970AbgDWWzc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 18:55:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbgDWWzb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 18:55:31 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B4ADC09B042;
        Thu, 23 Apr 2020 15:55:31 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id l11so6115187lfc.5;
        Thu, 23 Apr 2020 15:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PB7rgoDy5himItCOeLRz+eJgO6V/+5SjwACH9dxFOS8=;
        b=aN7rt3UIPEbwz86wPCY/biZV3eDrFUXJbo+AaudyFeoIhg/WaOWaQUC130cluTbu1D
         5zzdaf6VPlHcMfH14O6U+7XYt38+4RE8xxM+O1MaGHEzxqmaCxSaKLXiI3OfX/bNSMAU
         5qDovelvda2hts/VNp6TuxHN/s1HOKd98U3KArTOB4gzgHJSSWUk+5KDQ/VZMz5qnGbz
         qx7uV2CrRv5xca7/v9eVc6xaIgWW1ErTsRwW8/vzElQI7W6NaEIvKAyanScvamGWkL+f
         6YXKRefckfC3gmKhpAdTJcSWbvrRbIWdOXQYW/t+3TeMqRzTjgd0YLq0d4ccgT1JyaLG
         cb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PB7rgoDy5himItCOeLRz+eJgO6V/+5SjwACH9dxFOS8=;
        b=aPTEaMbsEvvkN3MipKY9RB5bWcUGHTBW9VGZMw7ZqD+Bt0QHfiXxHrhsns3OvxxW/9
         bGosyaYZdcc+E24gVzGi8CnHNxiULcP1fuEj9YbdAH7pQStrSaNvozkC5SZq0sgAmduO
         v1VdguWH3gVeDeASB/hgwvA3DYbo+g59HpuARZ4JUONH+DISXUVzI6tnb94ZEXa/0f69
         ZbFjpegve79BVhuarEhmISqob/dzY05urOz5Dy0QWP9d+AcM5gtuc4Q3y2BcIuwvo3+3
         VTPIIvCHrtJnY7NEPaUaEGWQFiyxmlj9i7LeCIMWPA+jbpgeyIZis+SX4bHMkUcb32bX
         iCfA==
X-Gm-Message-State: AGi0Pua1qOkLvofSGyH/jxDL3CevyDV5hrC1n85AR9eMxhcUGt41yyZJ
        ymPZybvYcw1677sf2CpLKvnDxXhA
X-Google-Smtp-Source: APiQypKt7gl9kf0Oj/Qig0AndoFuPk6CxjR5cFrqCFCDkuFpS7P2OyXlK+y7KJrvL+ZyzfPGgsXn5w==
X-Received: by 2002:a19:5f04:: with SMTP id t4mr3959503lfb.208.1587682529523;
        Thu, 23 Apr 2020 15:55:29 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id b28sm2952013ljo.1.2020.04.23.15.55.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2020 15:55:28 -0700 (PDT)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <db413479-1557-3c40-ecb2-5a0c657065b6@gmail.com>
Date:   Fri, 24 Apr 2020 01:55:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3115a959-045e-7b27-94fb-a11a8b5f4a6a@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

23.04.2020 19:50, Sowjanya Komatineni пишет:
> 
> On 4/23/20 12:48 AM, Hans Verkuil wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> On 22/04/2020 08:18, Sowjanya Komatineni wrote:
>>> Tegra210 contains a powerful Video Input (VI) hardware controller
>>> which can support up to 6 MIPI CSI camera sensors.
>>>
>>> Each Tegra CSI port can be one-to-one mapped to VI channel and can
>>> capture from an external camera sensor connected to CSI or from
>>> built-in test pattern generator.
>>>
>>> Tegra210 supports built-in test pattern generator from CSI to VI.
>>>
>>> This patch adds a v4l2 capture driver with media interface for
>>> Tegra210 built-in CSI to VI test pattern generator.
>>>
>>> This patch includes TPG support only and all the video pipeline
>>> configuration happens through the video device node.
>>>
>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>>   drivers/staging/media/Kconfig          |    2 +
>>>   drivers/staging/media/Makefile         |    1 +
>>>   drivers/staging/media/tegra/Kconfig    |   13 +
>>>   drivers/staging/media/tegra/Makefile   |    8 +
>>>   drivers/staging/media/tegra/TODO       |   10 +
>>>   drivers/staging/media/tegra/common.h   |  262 ++++++++
>>>   drivers/staging/media/tegra/csi.c      |  606 +++++++++++++++++
>>>   drivers/staging/media/tegra/csi.h      |  149 +++++
>>>   drivers/staging/media/tegra/tegra210.c |  709 ++++++++++++++++++++
>>>   drivers/staging/media/tegra/tegra210.h |  190 ++++++
>>>   drivers/staging/media/tegra/vi.c       | 1132
>>> ++++++++++++++++++++++++++++++++
>>>   drivers/staging/media/tegra/vi.h       |   83 +++
>>>   drivers/staging/media/tegra/video.c    |  153 +++++
>>>   drivers/staging/media/tegra/video.h    |   34 +
>>>   14 files changed, 3352 insertions(+)
>>>   create mode 100644 drivers/staging/media/tegra/Kconfig
>>>   create mode 100644 drivers/staging/media/tegra/Makefile
>>>   create mode 100644 drivers/staging/media/tegra/TODO
>>>   create mode 100644 drivers/staging/media/tegra/common.h
>>>   create mode 100644 drivers/staging/media/tegra/csi.c
>>>   create mode 100644 drivers/staging/media/tegra/csi.h
>>>   create mode 100644 drivers/staging/media/tegra/tegra210.c
>>>   create mode 100644 drivers/staging/media/tegra/tegra210.h
>>>   create mode 100644 drivers/staging/media/tegra/vi.c
>>>   create mode 100644 drivers/staging/media/tegra/vi.h
>>>   create mode 100644 drivers/staging/media/tegra/video.c
>>>   create mode 100644 drivers/staging/media/tegra/video.h
>> With 'make menuconfig' I get this:
>>
>> scripts/kconfig/mconf  Kconfig
>>
>> WARNING: unmet direct dependencies detected for TEGRA_HOST1X
>>    Depends on [n]: HAS_IOMEM [=y] && (ARCH_TEGRA || ARM &&
>> COMPILE_TEST [=y])
>>    Selected by [y]:
>>    - VIDEO_TEGRA [=y] && STAGING [=y] && STAGING_MEDIA [=y] &&
>> MEDIA_SUPPORT [=y] && (ARCH_TEGRA || COMPILE_TEST [=y])
>>
>> This is an x86_64 build with COMPILE_TEST set. I can provide my full
>> .config if you need it.
>>
>> CONFIG_TEGRA_HOST1X=y
>> CONFIG_VIDEO_TEGRA=y
>>
>> Regards,
>>
>>          Hans
> 
> Hi Hans,
> 
> In v7, changed Kconfig to remove ARM. But looks like we should limit
> 
> TEGRA_HOST1X also limits compile to ARM only so running VIDEO_TEGRA on
> x86_64 shows above warning.
> 
> We should limit compile to ARM for CONFIG_VIDEO_TEGRA.
> 
> Will update CONFIG_VIDEO_TEGRA dependency to use ARM && COMPILE_TEST
> like I had in previous version. Sorry about this.
> 
> 
> Also, I see some changes went into latest linux-next staging media
> Kconfig, So, will have my patches on top of today's linux-next.

VIDEO_TEGRA should depend on TEGRA_HOST1X and not select it.

depends on (ARCH_TEGRA && TEGRA_HOST1X) || COMPILE_TEST
