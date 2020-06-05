Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F09D31EF111
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2020 08:00:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726068AbgFEGAx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jun 2020 02:00:53 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:16714 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726021AbgFEGAx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jun 2020 02:00:53 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ed9df320001>; Thu, 04 Jun 2020 22:59:14 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 04 Jun 2020 23:00:53 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 04 Jun 2020 23:00:53 -0700
Received: from [10.26.75.201] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Jun
 2020 06:00:49 +0000
Subject: Re: [PATCH] media: staging: tegra-vde: add missing
 pm_runtime_put_autosuspend
To:     Navid Emamdoost <navid.emamdoost@gmail.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <devel@driverdev.osuosl.org>, <linux-kernel@vger.kernel.org>
CC:     <emamd001@umn.edu>, <wu000273@umn.edu>, <kjlu@umn.edu>,
        <smccaman@umn.edu>
References: <20200602054841.15746-1-navid.emamdoost@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <7061eb81-c00c-9978-5e4b-f9896c0ffd5e@nvidia.com>
Date:   Fri, 5 Jun 2020 07:00:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200602054841.15746-1-navid.emamdoost@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1591336754; bh=0dUrBQuoU0VRakO1MH9S67i+J3/nQDDpMEAcgsefyrU=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=R2Vq88wUbD09A+WcyBIhBotOM28XgztvZhV8dSXRV85oGVoan2uEgy1pSjb3Holxt
         PvIsxh7u7siC7ICTBTkp+RRjCSDJ17jxniW5x/LqC8+sy/xSRamXN1pcd3DQGpoyUE
         oSQ2GQ4Et0c32vMLlCHe2mYcxvHnoZ1pxHZTRNIOWlriT750mG73hET133SuVnQn9P
         t/zp6OrtY/4DkBAZQlMFcxwxJHcbTD5D6hVbvYAH7U8QAEC2bhCsU45h5JUVHdpGtg
         Ht/FOCL/0+Q/ZdMo4937jJhuU7DmdlB2Lgj1MCKiPWZ6DXVYWm78r4CCA8aLtrChA+
         ZcQyme+ON5FcQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 02/06/2020 06:48, Navid Emamdoost wrote:
> Call to pm_runtime_get_sync increments counter even in case of
> failure leading to incorrect ref count.
> Call pm_runtime_put_autosuspend if pm_runtime_get_sync fails.
> 
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> ---
>  drivers/staging/media/tegra-vde/vde.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
> index d3e63512a765..52cdd4a91e93 100644
> --- a/drivers/staging/media/tegra-vde/vde.c
> +++ b/drivers/staging/media/tegra-vde/vde.c
> @@ -776,8 +776,10 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
>  		goto release_dpb_frames;
>  
>  	ret = pm_runtime_get_sync(dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put_autosuspend(dev);
>  		goto unlock;
> +	}
>  
>  	/*
>  	 * We rely on the VDE registers reset value, otherwise VDE

Please use the put in the error path.

Jon

-- 
nvpublic
