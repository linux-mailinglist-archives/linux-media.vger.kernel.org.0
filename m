Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F38F5446138
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 10:14:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232068AbhKEJQm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Nov 2021 05:16:42 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:56263 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbhKEJQl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Nov 2021 05:16:41 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 8DB1B1C0008;
        Fri,  5 Nov 2021 09:13:52 +0000 (UTC)
Date:   Fri, 5 Nov 2021 10:14:44 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        robh+dt@kernel.org, nicolas.ferre@microchip.com
Subject: Re: [PATCH 06/21] media: atmel: atmel-isc: replace video device name
 with module name
Message-ID: <20211105091444.tfwsspkuficczrav@uno.localdomain>
References: <20211022075247.518880-1-eugen.hristev@microchip.com>
 <20211022075247.518880-7-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211022075247.518880-7-eugen.hristev@microchip.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugen

On Fri, Oct 22, 2021 at 10:52:32AM +0300, Eugen Hristev wrote:
> To have consistency with future media controller development,
> replace the video device name with KBUILD_MODNAME.
>
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>

Makes sense to me
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j

> ---
>  drivers/media/platform/atmel/atmel-isc-base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
> index f532fd03e807..f3e89a892373 100644
> --- a/drivers/media/platform/atmel/atmel-isc-base.c
> +++ b/drivers/media/platform/atmel/atmel-isc-base.c
> @@ -1887,7 +1887,7 @@ static int isc_async_complete(struct v4l2_async_notifier *notifier)
>  	}
>
>  	/* Register video device */
> -	strscpy(vdev->name, "microchip-isc", sizeof(vdev->name));
> +	strscpy(vdev->name, KBUILD_MODNAME, sizeof(vdev->name));
>  	vdev->release		= video_device_release_empty;
>  	vdev->fops		= &isc_fops;
>  	vdev->ioctl_ops		= &isc_ioctl_ops;
> --
> 2.25.1
>
