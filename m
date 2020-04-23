Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC40B1B675C
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 00:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727864AbgDWW7Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 18:59:24 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:16665 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726632AbgDWW7X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 18:59:23 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea21dbe0000>; Thu, 23 Apr 2020 15:59:10 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 23 Apr 2020 15:59:23 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 23 Apr 2020 15:59:23 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Apr
 2020 22:59:23 +0000
Received: from [10.2.165.49] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Apr
 2020 22:59:22 +0000
Subject: Re: [RFC PATCH v9 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <sakari.ailus@iki.fi>,
        <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1587536339-4030-1-git-send-email-skomatineni@nvidia.com>
 <1587536339-4030-7-git-send-email-skomatineni@nvidia.com>
 <ae6dfd6b-4b0b-db73-54cf-a16e59476f38@xs4all.nl>
 <3115a959-045e-7b27-94fb-a11a8b5f4a6a@nvidia.com>
 <db413479-1557-3c40-ecb2-5a0c657065b6@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <843d1276-1281-7f02-ce08-d0dad52bb681@nvidia.com>
Date:   Thu, 23 Apr 2020 15:59:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <db413479-1557-3c40-ecb2-5a0c657065b6@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587682751; bh=RI0kJ3AGzoip+FKYoq7/Zfox+0bxzRVuBZ/UiOfO/6Q=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=PwhaHkh3ZfdltpPCXmxtMirnM+Tdvz8OK50WYJCFX6seFpzm5OlV42K4QVrbCyEiQ
         HyCZDzan3lIidx/mqWdP1J1g4/qfeb7MkajJA3JUPBwW0UlzZGs9IT9p2fijtbYUS8
         8q2+CoTWtzFN+0lhSn8oCCg7NSTJiQ4o16lHZNP6Uc9b3nsYnZN20PCb+ABzA4wKuG
         q4c2OfmGS9IWxo6ylzuTdMA/DZlE9fnGCY7iLojftl+9DWhsMgTktYIpif6feQhV6k
         +WK4OoG/TJ8GbWqgdui/PJ3gKEiwVmjm47oSg5i1xOBFxnXdP2m4mdwAFMPSCV01qp
         rGhXtCVQEZs3w==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/23/20 3:55 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 23.04.2020 19:50, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 4/23/20 12:48 AM, Hans Verkuil wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> On 22/04/2020 08:18, Sowjanya Komatineni wrote:
>>>> Tegra210 contains a powerful Video Input (VI) hardware controller
>>>> which can support up to 6 MIPI CSI camera sensors.
>>>>
>>>> Each Tegra CSI port can be one-to-one mapped to VI channel and can
>>>> capture from an external camera sensor connected to CSI or from
>>>> built-in test pattern generator.
>>>>
>>>> Tegra210 supports built-in test pattern generator from CSI to VI.
>>>>
>>>> This patch adds a v4l2 capture driver with media interface for
>>>> Tegra210 built-in CSI to VI test pattern generator.
>>>>
>>>> This patch includes TPG support only and all the video pipeline
>>>> configuration happens through the video device node.
>>>>
>>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>> ---
>>>>    drivers/staging/media/Kconfig          |=C2=A0=C2=A0=C2=A0 2 +
>>>>    drivers/staging/media/Makefile         |=C2=A0=C2=A0=C2=A0 1 +
>>>>    drivers/staging/media/tegra/Kconfig    |=C2=A0=C2=A0 13 +
>>>>    drivers/staging/media/tegra/Makefile   |=C2=A0=C2=A0=C2=A0 8 +
>>>>    drivers/staging/media/tegra/TODO       |=C2=A0=C2=A0 10 +
>>>>    drivers/staging/media/tegra/common.h   |=C2=A0 262 ++++++++
>>>>    drivers/staging/media/tegra/csi.c      |=C2=A0 606 ++++++++++++++++=
+
>>>>    drivers/staging/media/tegra/csi.h      |=C2=A0 149 +++++
>>>>    drivers/staging/media/tegra/tegra210.c |=C2=A0 709 ++++++++++++++++=
++++
>>>>    drivers/staging/media/tegra/tegra210.h |=C2=A0 190 ++++++
>>>>    drivers/staging/media/tegra/vi.c       | 1132
>>>> ++++++++++++++++++++++++++++++++
>>>>    drivers/staging/media/tegra/vi.h       |=C2=A0=C2=A0 83 +++
>>>>    drivers/staging/media/tegra/video.c    |=C2=A0 153 +++++
>>>>    drivers/staging/media/tegra/video.h    |=C2=A0=C2=A0 34 +
>>>>    14 files changed, 3352 insertions(+)
>>>>    create mode 100644 drivers/staging/media/tegra/Kconfig
>>>>    create mode 100644 drivers/staging/media/tegra/Makefile
>>>>    create mode 100644 drivers/staging/media/tegra/TODO
>>>>    create mode 100644 drivers/staging/media/tegra/common.h
>>>>    create mode 100644 drivers/staging/media/tegra/csi.c
>>>>    create mode 100644 drivers/staging/media/tegra/csi.h
>>>>    create mode 100644 drivers/staging/media/tegra/tegra210.c
>>>>    create mode 100644 drivers/staging/media/tegra/tegra210.h
>>>>    create mode 100644 drivers/staging/media/tegra/vi.c
>>>>    create mode 100644 drivers/staging/media/tegra/vi.h
>>>>    create mode 100644 drivers/staging/media/tegra/video.c
>>>>    create mode 100644 drivers/staging/media/tegra/video.h
>>> With 'make menuconfig' I get this:
>>>
>>> scripts/kconfig/mconf  Kconfig
>>>
>>> WARNING: unmet direct dependencies detected for TEGRA_HOST1X
>>>     Depends on [n]: HAS_IOMEM [=3Dy] && (ARCH_TEGRA || ARM &&
>>> COMPILE_TEST [=3Dy])
>>>     Selected by [y]:
>>>     - VIDEO_TEGRA [=3Dy] && STAGING [=3Dy] && STAGING_MEDIA [=3Dy] &&
>>> MEDIA_SUPPORT [=3Dy] && (ARCH_TEGRA || COMPILE_TEST [=3Dy])
>>>
>>> This is an x86_64 build with COMPILE_TEST set. I can provide my full
>>> .config if you need it.
>>>
>>> CONFIG_TEGRA_HOST1X=3Dy
>>> CONFIG_VIDEO_TEGRA=3Dy
>>>
>>> Regards,
>>>
>>>           Hans
>> Hi Hans,
>>
>> In v7, changed Kconfig to remove ARM. But looks like we should limit
>>
>> TEGRA_HOST1X also limits compile to ARM only so running VIDEO_TEGRA on
>> x86_64 shows above warning.
>>
>> We should limit compile to ARM for CONFIG_VIDEO_TEGRA.
>>
>> Will update CONFIG_VIDEO_TEGRA dependency to use ARM && COMPILE_TEST
>> like I had in previous version. Sorry about this.
>>
>>
>> Also, I see some changes went into latest linux-next staging media
>> Kconfig, So, will have my patches on top of today's linux-next.
> VIDEO_TEGRA should depend on TEGRA_HOST1X and not select it.
>
> depends on (ARCH_TEGRA && TEGRA_HOST1X) || COMPILE_TEST

Was selecting it to auto-select Tegra host1x when video_tegra is enabled.

Yes, can use depends on

