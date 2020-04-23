Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70BD51B614E
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 18:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729763AbgDWQvA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 12:51:00 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:16536 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729673AbgDWQvA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 12:51:00 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea1c6fe0000>; Thu, 23 Apr 2020 09:49:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 23 Apr 2020 09:50:59 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 23 Apr 2020 09:50:59 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Apr
 2020 16:50:59 +0000
Received: from [10.2.165.49] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Apr
 2020 16:50:58 +0000
Subject: Re: [RFC PATCH v9 6/9] media: tegra: Add Tegra210 Video input driver
To:     Hans Verkuil <hverkuil@xs4all.nl>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <sakari.ailus@iki.fi>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1587536339-4030-1-git-send-email-skomatineni@nvidia.com>
 <1587536339-4030-7-git-send-email-skomatineni@nvidia.com>
 <ae6dfd6b-4b0b-db73-54cf-a16e59476f38@xs4all.nl>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <3115a959-045e-7b27-94fb-a11a8b5f4a6a@nvidia.com>
Date:   Thu, 23 Apr 2020 09:50:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ae6dfd6b-4b0b-db73-54cf-a16e59476f38@xs4all.nl>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587660543; bh=dej+/NPj9Zi1pabB1YDOATDwcPgl93oxjqVQvLEgeFI=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=AFFUb/gOdvlNFh1DMRIVqsHEiu2OxZA7yamw8sGomynyNEQHjU2gdH4D/+rYuHqzW
         GIE8dqx8IYgzpyoX8l8Xq9wTvP0fkBgIqmSUWljq4BsBGCshvTvhd4DDHKLOz2zvZs
         dCFHPknwxPg2f4a/rXS/H6paMn9MbEc4DsdqHaeok/pVCehqLD0knLBkIh4DbpiRwt
         juF5SVtaW6gsd9UosilztfUhUIxEx4gWkpM5qQUCpVc7iDEavnuhMEEMXGZuh7thla
         G7AeWdL8aB6c99SkEIgPAIrzhVYcDr6dpiunAdtX5Kx3iSSgXoGfJHOwWLbDMK93tx
         0ep0Na2OjP/IQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/23/20 12:48 AM, Hans Verkuil wrote:
> External email: Use caution opening links or attachments
>
>
> On 22/04/2020 08:18, Sowjanya Komatineni wrote:
>> Tegra210 contains a powerful Video Input (VI) hardware controller
>> which can support up to 6 MIPI CSI camera sensors.
>>
>> Each Tegra CSI port can be one-to-one mapped to VI channel and can
>> capture from an external camera sensor connected to CSI or from
>> built-in test pattern generator.
>>
>> Tegra210 supports built-in test pattern generator from CSI to VI.
>>
>> This patch adds a v4l2 capture driver with media interface for
>> Tegra210 built-in CSI to VI test pattern generator.
>>
>> This patch includes TPG support only and all the video pipeline
>> configuration happens through the video device node.
>>
>> Acked-by: Thierry Reding <treding@nvidia.com>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/staging/media/Kconfig          |    2 +
>>   drivers/staging/media/Makefile         |    1 +
>>   drivers/staging/media/tegra/Kconfig    |   13 +
>>   drivers/staging/media/tegra/Makefile   |    8 +
>>   drivers/staging/media/tegra/TODO       |   10 +
>>   drivers/staging/media/tegra/common.h   |  262 ++++++++
>>   drivers/staging/media/tegra/csi.c      |  606 +++++++++++++++++
>>   drivers/staging/media/tegra/csi.h      |  149 +++++
>>   drivers/staging/media/tegra/tegra210.c |  709 ++++++++++++++++++++
>>   drivers/staging/media/tegra/tegra210.h |  190 ++++++
>>   drivers/staging/media/tegra/vi.c       | 1132 ++++++++++++++++++++++++++++++++
>>   drivers/staging/media/tegra/vi.h       |   83 +++
>>   drivers/staging/media/tegra/video.c    |  153 +++++
>>   drivers/staging/media/tegra/video.h    |   34 +
>>   14 files changed, 3352 insertions(+)
>>   create mode 100644 drivers/staging/media/tegra/Kconfig
>>   create mode 100644 drivers/staging/media/tegra/Makefile
>>   create mode 100644 drivers/staging/media/tegra/TODO
>>   create mode 100644 drivers/staging/media/tegra/common.h
>>   create mode 100644 drivers/staging/media/tegra/csi.c
>>   create mode 100644 drivers/staging/media/tegra/csi.h
>>   create mode 100644 drivers/staging/media/tegra/tegra210.c
>>   create mode 100644 drivers/staging/media/tegra/tegra210.h
>>   create mode 100644 drivers/staging/media/tegra/vi.c
>>   create mode 100644 drivers/staging/media/tegra/vi.h
>>   create mode 100644 drivers/staging/media/tegra/video.c
>>   create mode 100644 drivers/staging/media/tegra/video.h
> With 'make menuconfig' I get this:
>
> scripts/kconfig/mconf  Kconfig
>
> WARNING: unmet direct dependencies detected for TEGRA_HOST1X
>    Depends on [n]: HAS_IOMEM [=y] && (ARCH_TEGRA || ARM && COMPILE_TEST [=y])
>    Selected by [y]:
>    - VIDEO_TEGRA [=y] && STAGING [=y] && STAGING_MEDIA [=y] && MEDIA_SUPPORT [=y] && (ARCH_TEGRA || COMPILE_TEST [=y])
>
> This is an x86_64 build with COMPILE_TEST set. I can provide my full .config if you need it.
>
> CONFIG_TEGRA_HOST1X=y
> CONFIG_VIDEO_TEGRA=y
>
> Regards,
>
>          Hans

Hi Hans,

In v7, changed Kconfig to remove ARM. But looks like we should limit

TEGRA_HOST1X also limits compile to ARM only so running VIDEO_TEGRA on 
x86_64 shows above warning.

We should limit compile to ARM for CONFIG_VIDEO_TEGRA.

Will update CONFIG_VIDEO_TEGRA dependency to use ARM && COMPILE_TEST 
like I had in previous version. Sorry about this.


Also, I see some changes went into latest linux-next staging media 
Kconfig, So, will have my patches on top of today's linux-next.

Thanks

Sowjanya


