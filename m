Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAC193D719F
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 10:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236027AbhG0Iza (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 04:55:30 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58114 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235933AbhG0Iza (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 04:55:30 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E3079EE;
        Tue, 27 Jul 2021 10:55:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627376129;
        bh=CqnFaU7NLWxpNv54vQ2L3zf7YFw2qMytUnVjU2L+JRo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AQ3S6nY4jozOvTNCcbqJAWIqPAF+QOXHuiKDdzXJjVqgh0XpWNBuCi0xvkgEh2NCt
         yiRzB2UFbqwx6HcHh17VJWPecMxglZAW0TDSs3v3kuLZVW/D9bLkJUc163qIi/drMU
         9GFbecQFMmG2SvNkCH9kwIq9ggLb70pFwK54yVhY=
Date:   Tue, 27 Jul 2021 11:55:23 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     mchehab@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] soc/tegra: bpmp: Remove unused including
 <linux/version.h>
Message-ID: <YP/J+xrGR1bO6tt8@pendragon.ideasonboard.com>
References: <20210727054228.809-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210727054228.809-1-caihuoqing@baidu.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Cai,

Thank you for the patch.

On Tue, Jul 27, 2021 at 01:42:28PM +0800, Cai Huoqing wrote:
> Remove including <linux/version.h> that don't need it.
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 1 -

For the uvcvideo driver,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

As this patch combines changes to two different subsystems, should I
assume you'll get it merged as a tree-wide change and that I can forget
about it ? If that's not right, then it may be best to split the patch
in two.

>  drivers/soc/tegra/powergate-bpmp.c | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 9a791d8ef200..b1b055784f8d 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -16,7 +16,6 @@
>  #include <linux/videodev2.h>
>  #include <linux/vmalloc.h>
>  #include <linux/wait.h>
> -#include <linux/version.h>
>  #include <asm/unaligned.h>
>  
>  #include <media/v4l2-common.h>
> diff --git a/drivers/soc/tegra/powergate-bpmp.c b/drivers/soc/tegra/powergate-bpmp.c
> index 06c792bafca5..8eaf50d0b6af 100644
> --- a/drivers/soc/tegra/powergate-bpmp.c
> +++ b/drivers/soc/tegra/powergate-bpmp.c
> @@ -7,7 +7,6 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/slab.h>
> -#include <linux/version.h>
>  
>  #include <soc/tegra/bpmp.h>
>  #include <soc/tegra/bpmp-abi.h>

-- 
Regards,

Laurent Pinchart
