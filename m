Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04C6030F643
	for <lists+linux-media@lfdr.de>; Thu,  4 Feb 2021 16:30:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237289AbhBDP2Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Feb 2021 10:28:25 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:39758 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237173AbhBDP2B (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Feb 2021 10:28:01 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB48A510;
        Thu,  4 Feb 2021 16:27:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1612452432;
        bh=/M00cMP3jhXBcnxz4JKhkZcY8RsBO764x3zX8fWOFHk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YCaCs+wkL4HR8bHEb9BeaEEL1HV9b/tm57uXaiwQNHraiV0WeLdFRaUPyEruQBD7W
         yDWDCuRS1fbujZ1/fsOaAzm+Ts+UnnkWFxODuu4hJ2w/XuUMJ5PP1xmmuIeS18OXUA
         nqVjh1kFJpDfkw2G38qkS6XGJs5wEmraJRK8tuFA=
Date:   Thu, 4 Feb 2021 17:26:49 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH resend] uvc: strncpy -> strscpy
Message-ID: <YBwSObgdqKSop0KV@pendragon.ideasonboard.com>
References: <4ecb8867-6678-aa1a-3d86-65f815d34f5b@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4ecb8867-6678-aa1a-3d86-65f815d34f5b@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Mon, Feb 01, 2021 at 09:40:56AM +0100, Hans Verkuil wrote:
> The use of strncpy is discouraged, use strscpy instead.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Please feel free to pick this patch for your fixes pull request as I
have no other pending UVC patches.

> ---
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 1abc122a0977..30ef2a3110f7 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1553,7 +1553,7 @@ static int uvc_gpio_parse(struct uvc_device *dev)
>  	unit->gpio.bmControls[0] = 1;
>  	unit->get_cur = uvc_gpio_get_cur;
>  	unit->get_info = uvc_gpio_get_info;
> -	strncpy(unit->name, "GPIO", sizeof(unit->name) - 1);
> +	strscpy(unit->name, "GPIO", sizeof(unit->name));
> 
>  	list_add_tail(&unit->list, &dev->entities);
> 

-- 
Regards,

Laurent Pinchart
