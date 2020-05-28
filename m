Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E8671E6E7B
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 00:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436907AbgE1WQy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 18:16:54 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:11952 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436722AbgE1WQx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 18:16:53 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ed038480000>; Thu, 28 May 2020 15:16:40 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 28 May 2020 15:16:52 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 28 May 2020 15:16:52 -0700
Received: from [10.2.165.30] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 28 May
 2020 22:16:51 +0000
Subject: Re: [PATCH] staging: tegra-video: fix V4L2 dependency
To:     Arnd Bergmann <arnd@arndb.de>, <soc@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     Thierry Reding <treding@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <devel@driverdev.osuosl.org>, <linux-kernel@vger.kernel.org>
References: <20200527221327.3339232-1-arnd@arndb.de>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <18bd4587-2dd9-dfae-110d-7dfa0378c84d@nvidia.com>
Date:   Thu, 28 May 2020 15:16:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200527221327.3339232-1-arnd@arndb.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1590704200; bh=KRzV9XAoyrXw+hQeehBeTuzVXVGZIKME8Bedl58yFSs=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=r5fl4xdqNc4K6HuHfzbSjNVFNdH2Ypwrct9hbAzN7915HhzPM2fb3qlXl4ROaUF66
         Zx58SJLHvzFa7eiN5OaKVZVjT3ha0jqniUMoqTv4fGYhBH60pMLFpinqYctaBvfRZf
         HvXGhBaoHTn3vwEXXrZkRKRvxTUZJCwd4mSoR1i5vlwx40LlEzIdYkVvSgDFdjW18e
         Z5JvwJYvh1EBSECNe2mYvdY+G4kK57w7PdijtRIr7eu2ONHTePwpDySYdxNvWA8t7l
         sUgXKjX2UHXRhEkz8RIrJUim2I7Vhxyx/uTszuBWdWPs7GuW0ceBq/LLCVYIPCj77e
         bUVSFjLslZfIg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 5/27/20 3:13 PM, Arnd Bergmann wrote:
> Rather than using a dependency on VIDEO_V4L2, this driver uses
> "select", which fails when other dependencies are missing:
>
> WARNING: unmet direct dependencies detected for VIDEO_V4L2
>    Depends on [n]: MEDIA_SUPPORT [=y] && (I2C [=y] || I2C [=y]=n) && VIDEO_DEV [=n]
>    Selected by [y]:
>    - VIDEO_TEGRA [=y] && STAGING [=y] && STAGING_MEDIA [=y] && MEDIA_SUPPORT [=y] && TEGRA_HOST1X [=y]
> (plus an endless stream of link errors for other drivers that
> depend on VIDEO_V4L2 but are now lacking their dependencies)
>
> Fixes: 3d8a97eabef0 ("media: tegra-video: Add Tegra210 Video input driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/staging/media/tegra-video/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/media/tegra-video/Kconfig b/drivers/staging/media/tegra-video/Kconfig
> index 3f03b5b39e6c..f6c61ec74386 100644
> --- a/drivers/staging/media/tegra-video/Kconfig
> +++ b/drivers/staging/media/tegra-video/Kconfig
> @@ -2,7 +2,7 @@
>   config VIDEO_TEGRA
>   	tristate "NVIDIA Tegra VI driver"
>   	depends on TEGRA_HOST1X
> -	select VIDEO_V4L2
> +	depends on VIDEO_V4L2
>   	select MEDIA_CONTROLLER
>   	select VIDEOBUF2_DMA_CONTIG
>   	help
Acked-by: Sowjanya Komatineni <skomatineni@nvidia.com>
