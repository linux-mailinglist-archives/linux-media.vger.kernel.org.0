Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F132844613A
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 10:15:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232425AbhKEJRr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Nov 2021 05:17:47 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:38747 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbhKEJRq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Nov 2021 05:17:46 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id C17DA20000A;
        Fri,  5 Nov 2021 09:15:03 +0000 (UTC)
Date:   Fri, 5 Nov 2021 10:15:55 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        robh+dt@kernel.org, nicolas.ferre@microchip.com
Subject: Re: [PATCH 07/21] media: atmel: atmel-sama7g5-isc: fix ispck leftover
Message-ID: <20211105091555.evrbyrt3lsvy7fpj@uno.localdomain>
References: <20211022075247.518880-1-eugen.hristev@microchip.com>
 <20211022075247.518880-8-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211022075247.518880-8-eugen.hristev@microchip.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugen,

On Fri, Oct 22, 2021 at 10:52:33AM +0300, Eugen Hristev wrote:
> The ispck is not used for sama7g5 variant of the ISC.
> Calls to ispck have to be removed also from module insert/removal.
>
> Fixes: d7f26849ed7c ("media: atmel: fix the ispck initialization")
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j

> ---
>  drivers/media/platform/atmel/atmel-sama7g5-isc.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/media/platform/atmel/atmel-sama7g5-isc.c b/drivers/media/platform/atmel/atmel-sama7g5-isc.c
> index 9c05acafd072..6a5d3f7ce75e 100644
> --- a/drivers/media/platform/atmel/atmel-sama7g5-isc.c
> +++ b/drivers/media/platform/atmel/atmel-sama7g5-isc.c
> @@ -555,7 +555,6 @@ static int microchip_xisc_remove(struct platform_device *pdev)
>
>  	v4l2_device_unregister(&isc->v4l2_dev);
>
> -	clk_disable_unprepare(isc->ispck);
>  	clk_disable_unprepare(isc->hclock);
>
>  	isc_clk_cleanup(isc);
> @@ -567,7 +566,6 @@ static int __maybe_unused xisc_runtime_suspend(struct device *dev)
>  {
>  	struct isc_device *isc = dev_get_drvdata(dev);
>
> -	clk_disable_unprepare(isc->ispck);
>  	clk_disable_unprepare(isc->hclock);
>
>  	return 0;
> @@ -582,10 +580,6 @@ static int __maybe_unused xisc_runtime_resume(struct device *dev)
>  	if (ret)
>  		return ret;
>
> -	ret = clk_prepare_enable(isc->ispck);
> -	if (ret)
> -		clk_disable_unprepare(isc->hclock);
> -
>  	return ret;
>  }
>
> --
> 2.25.1
>
