Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 559752A0397
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 12:02:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbgJ3LCY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 07:02:24 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:35315 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725888AbgJ3LCX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 07:02:23 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id YSAjknxoLWvjMYSAnkH9ix; Fri, 30 Oct 2020 12:02:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604055741; bh=9wAKYtMKuaz2VLjYIa5xQW2SHXFnlEwWuHN2LUMl+w0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=e5HpHI80GU59ObCmyhkIqMrBAII/rntPAPre/+hg3Ql7D+jKAceFfP5Jm4nTvPxW2
         dDcpBspIIRIfBzoH2rF9QfPQVn+P1ijHR6qPxAqyQewQh6QdLeS1JxHgJpkqnNB4yR
         l6BUKeXy2LxWPgVvEgebIP0HVAZ+Lg0N4BFWw9qRopkadALSbZVMSrEo07X1KQ16rv
         OEjpXnsbQnpmu6wwCVPla6jinAyYulH9q3nsewE5Lv/6z4n4gx/lz4p3bNNFRgCwBg
         O7bTWIajd+H0SMLg2cugYF6be9m8mf9fy6ZKSnlwMRoPEE/hVyqghDIm7/Prz+a4wL
         zbyP2wH2gwZcg==
Subject: Re: [PATCH v1 1/2] gpu: host1x: Allow COMPILE_TEST to build host1x
 driver on all platforms
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <1601434958-29305-1-git-send-email-skomatineni@nvidia.com>
 <1601434958-29305-2-git-send-email-skomatineni@nvidia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b8dc62e4-902b-9b72-8b51-5f7480d01760@xs4all.nl>
Date:   Fri, 30 Oct 2020 12:02:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1601434958-29305-2-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfB8/zSD8BM3lIczgCja5xi8yPFCTRTGqgP/kcLpJU+kTHjKGNjGyIwAZp6HFlEjqbJaF4p2I5YtFWavsI3NLu1CmpWET7z/fymVb0fa867wHvO9qMwkY
 U0+j9PqLLHUvzqi5z/Mc+t49ZEnZRPQNQHHHroMlJ0NPPyPu2/H9lKBpc/AY4P8/vdHVKgz7VcI0r5a1MBuWVgeC3oIKdHlTer5K842PKobGhmdbpfyMONwh
 KZZoDhAii5m+ZY9jvO4KHHb1oAtto60i2ic1VeKqvbYNLw71132F4PeA4B8NhA6qyFAII5KkOsZSPGRraG5Afj1oxi27TYtMG9HMQS0V3LgmviBPSZ37ZLGN
 9pZklNVA2QTIj0R15tkr+zB+I0+/nQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thierry,

On 30/09/2020 05:02, Sowjanya Komatineni wrote:
> Tegra V4L2 driver has dependency on this host1x driver and currently
> host1x driver is allowed to build with COMPILE_TEST only on ARM and
> this also limits Tegra V4L2 driver building.
> 
> So, this patch allows building host1x driver with COMPILE_TEST on
> all platforms.

Can you Ack/Review this so I can merge both patches for v5.11?
If you prefer to merge this on your side, then I can Ack patch 2/2
as well, but I think it makes more sense if this goes through the
media subsystem.

Regards,

	Hans

> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/gpu/host1x/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/host1x/Kconfig b/drivers/gpu/host1x/Kconfig
> index 6dab94a..977a0ac 100644
> --- a/drivers/gpu/host1x/Kconfig
> +++ b/drivers/gpu/host1x/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config TEGRA_HOST1X
>  	tristate "NVIDIA Tegra host1x driver"
> -	depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
> +	depends on ARCH_TEGRA || COMPILE_TEST
>  	select IOMMU_IOVA
>  	help
>  	  Driver for the NVIDIA Tegra host1x hardware.
> 

