Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0A757203DA
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 15:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235107AbjFBN7G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 09:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234960AbjFBN7F (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 09:59:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE9EB18C
        for <linux-media@vger.kernel.org>; Fri,  2 Jun 2023 06:59:04 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126156168104.26.openmobile.ne.jp [126.156.168.104])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3E8C427C;
        Fri,  2 Jun 2023 15:58:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685714321;
        bh=2PqDGuqhQ5r1RWSTDflcJCKZRUoSyG4x4hMXYIwMtlA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WYEkyS9dILj2/LijY1d0PjJQj+lYfINFdTDp0pmjv9DAvd5OtGc1uJ9q8puZPGRlQ
         orp+bwu5Qf+WwdEZhL/CKSM5oYeAECZOioUOHh6RxoezaKt88+o670kY+SWP3xyLJn
         1grg15B7v3NlxsknphbdxpZfMRfliz9TzFx65Vac=
Date:   Fri, 2 Jun 2023 16:59:01 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH 1/1] Revert "media: uvcvideo: Limit power line control
 for Acer EasyCamera"
Message-ID: <20230602135901.GC24855@pendragon.ideasonboard.com>
References: <20230602131919.3363606-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230602131919.3363606-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Fri, Jun 02, 2023 at 04:19:19PM +0300, Sakari Ailus wrote:
> This reverts commit 5dd0eab84ae9a4b292baf1ad02e1a273c475cd04.
> 
> Revert this patch as it has been merged twice. The earlier merged commit
> is 81e78a6fc320 ("media: uvcvideo: Limit power line control for Acer
> EasyCamera").
> 
> Reported-by: Dmitry Perchanov <dmitry.perchanov@intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Oops, my bad.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_driver.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 7aefa76a42b31..42ff9795f7000 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2997,15 +2997,6 @@ static const struct usb_device_id uvc_ids[] = {
>  	  .bInterfaceProtocol	= 0,
>  	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
>  	/* Acer EasyCamera */
> -	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> -				| USB_DEVICE_ID_MATCH_INT_INFO,
> -	  .idVendor		= 0x5986,
> -	  .idProduct		= 0x1180,
> -	  .bInterfaceClass	= USB_CLASS_VIDEO,
> -	  .bInterfaceSubClass	= 1,
> -	  .bInterfaceProtocol	= 0,
> -	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
> -	/* Acer EasyCamera */
>  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>  				| USB_DEVICE_ID_MATCH_INT_INFO,
>  	  .idVendor		= 0x5986,

-- 
Regards,

Laurent Pinchart
