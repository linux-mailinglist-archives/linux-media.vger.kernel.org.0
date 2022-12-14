Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D89CC64C717
	for <lists+linux-media@lfdr.de>; Wed, 14 Dec 2022 11:30:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237758AbiLNKaR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Dec 2022 05:30:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237658AbiLNKaP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Dec 2022 05:30:15 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D760C1DA45;
        Wed, 14 Dec 2022 02:30:14 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3120C499;
        Wed, 14 Dec 2022 11:30:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671013813;
        bh=Q4o552nxaEFUqnO6dYuFe8n9mN8MobnM9M4IMyRfdnQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qpEy28CrqyiENyjJsxuAKwtcf3/I3C3+wy4xUK2RcOZ333dPMjYKIs1s6wSoFeN5x
         BRGEf2p+8eI5EAbnVXY0V++bAzRlbetdTMc7f77VvPFBud1LDXipJ43/BeRy1fdgsx
         078Y+Uo7Cr/ZSaoyq6HvymRpfO+eEJJkHo00FmFg=
Date:   Wed, 14 Dec 2022 12:30:10 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     gregkh@linuxfoundation.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 1/5] usb: uvc: move media/v4l2-uvc.h to usb/uvc.h
Message-ID: <Y5mlskhuWDjEHVnQ@pendragon.ideasonboard.com>
References: <20221212194716.2995569-1-m.grzeschik@pengutronix.de>
 <20221212194716.2995569-2-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221212194716.2995569-2-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

Thank you for the patch.

On Mon, Dec 12, 2022 at 08:47:12PM +0100, Michael Grzeschik wrote:
> Since the headerfile is only used in usb devices it is better
> placed with the other usb files.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_ctrl.c              | 2 +-
>  drivers/media/usb/uvc/uvc_driver.c            | 2 +-
>  drivers/usb/gadget/function/uvc_v4l2.c        | 2 +-
>  include/{media/v4l2-uvc.h => linux/usb/uvc.h} | 0
>  4 files changed, 3 insertions(+), 3 deletions(-)
>  rename include/{media/v4l2-uvc.h => linux/usb/uvc.h} (100%)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index c95a2229f4fa9f..454d4374990ea1 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -12,13 +12,13 @@
>  #include <linux/slab.h>
>  #include <linux/uaccess.h>
>  #include <linux/usb.h>
> +#include <linux/usb/uvc.h>
>  #include <linux/videodev2.h>
>  #include <linux/vmalloc.h>
>  #include <linux/wait.h>
>  #include <linux/workqueue.h>
>  #include <linux/atomic.h>
>  #include <media/v4l2-ctrls.h>
> -#include <media/v4l2-uvc.h>
>  
>  #include "uvcvideo.h"
>  
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 215fb483efb00b..13023cdd37e50b 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -13,6 +13,7 @@
>  #include <linux/module.h>
>  #include <linux/slab.h>
>  #include <linux/usb.h>
> +#include <linux/usb/uvc.h>
>  #include <linux/videodev2.h>
>  #include <linux/vmalloc.h>
>  #include <linux/wait.h>
> @@ -20,7 +21,6 @@
>  
>  #include <media/v4l2-common.h>
>  #include <media/v4l2-ioctl.h>
> -#include <media/v4l2-uvc.h>
>  
>  #include "uvcvideo.h"
>  
> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> index a189b08bba800d..7435df0cf2a847 100644
> --- a/drivers/usb/gadget/function/uvc_v4l2.c
> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
> @@ -11,6 +11,7 @@
>  #include <linux/kernel.h>
>  #include <linux/list.h>
>  #include <linux/usb/g_uvc.h>
> +#include <linux/usb/uvc.h>
>  #include <linux/videodev2.h>
>  #include <linux/vmalloc.h>
>  #include <linux/wait.h>
> @@ -18,7 +19,6 @@
>  #include <media/v4l2-dev.h>
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-ioctl.h>
> -#include <media/v4l2-uvc.h>
>  
>  #include "f_uvc.h"
>  #include "uvc.h"
> diff --git a/include/media/v4l2-uvc.h b/include/linux/usb/uvc.h
> similarity index 100%
> rename from include/media/v4l2-uvc.h
> rename to include/linux/usb/uvc.h

-- 
Regards,

Laurent Pinchart
