Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E3DA3F427F
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 02:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234182AbhHWASB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Aug 2021 20:18:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233168AbhHWASB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Aug 2021 20:18:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92D23C061575;
        Sun, 22 Aug 2021 17:17:19 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD1414A3;
        Mon, 23 Aug 2021 02:17:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1629677837;
        bh=osKWlDzoazsolox9ksTzJGfooLhnTyelaSWgwmBWTwA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b6o6Kr9Su4YVNz5eLCGen3E7JnBBoMnwXzqARwv1B7AvBoZlNtNmnq9rKf9UQ3oy0
         jxCnicvzxzN5aaoxDLwPtFK5cyykKHNY0OapY3pzYxzYyvF4Teo+ALLPSq4qvZmMml
         bVj3bk57BbqKO7M48q745eGtrJ1AlaTWPiNsKFks=
Date:   Mon, 23 Aug 2021 03:17:08 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, Hans Verkuil <hans.verkuil@cisco.com>
Subject: Re: [PATCH v10 19/21] uvcvideo: don't spam the log in
 uvc_ctrl_restore_values()
Message-ID: <YSLpBFLdeTzH0gmp@pendragon.ideasonboard.com>
References: <20210618122923.385938-1-ribalda@chromium.org>
 <20210618122923.385938-20-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210618122923.385938-20-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Jun 18, 2021 at 02:29:21PM +0200, Ricardo Ribalda wrote:
> From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> Don't report the restored controls with dev_info, use dev_dbg instead.
> This prevents a lot of noise in the kernel log.
> 
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>

The author and SoB line don't match. Which one should I update ?

> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 11c25d4b5c20..da44d5c0b9ad 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2153,10 +2153,10 @@ int uvc_ctrl_restore_values(struct uvc_device *dev)
>  			if (!ctrl->initialized || !ctrl->modified ||
>  			    (ctrl->info.flags & UVC_CTRL_FLAG_RESTORE) == 0)
>  				continue;
> -			dev_info(&dev->udev->dev,
> -				 "restoring control %pUl/%u/%u\n",
> -				 ctrl->info.entity, ctrl->info.index,
> -				 ctrl->info.selector);
> +			dev_dbg(&dev->udev->dev,
> +				"restoring control %pUl/%u/%u\n",
> +				ctrl->info.entity, ctrl->info.index,
> +				ctrl->info.selector);
>  			ctrl->dirty = 1;
>  		}
>  

-- 
Regards,

Laurent Pinchart
