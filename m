Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 352A023F941
	for <lists+linux-media@lfdr.de>; Sun,  9 Aug 2020 00:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726009AbgHHWEs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Aug 2020 18:04:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgHHWEs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 Aug 2020 18:04:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1531C061756
        for <linux-media@vger.kernel.org>; Sat,  8 Aug 2020 15:04:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-78-184-nat.elisa-mobile.fi [85.76.78.184])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90F1BF9;
        Sun,  9 Aug 2020 00:04:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596924280;
        bh=/Ahnodr9RqbqcUOwUfhTd06mCNouczDt++/t+ejw0Po=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Kbq7pkBRQzU5SVvHPcAGZ+K7jXtRT/C4/wy/aXyh4qGPqgiZ3Buk+8Tqr8b1EAHPy
         2Z259suOzD5zxZbz8rBMhkkBMuONLujjPouxzCFRQtTmjxylX/aPqJc/nrxmK+CIPb
         8Xkag+BGeKOOxcI5nSgH2C212JEOHfPYFYerM0b8=
Date:   Sun, 9 Aug 2020 01:04:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     frederic.chen@mediatek.com
Cc:     hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com,
        tfiga@chromium.org, matthias.bgg@gmail.com, mchehab@kernel.org,
        yuzhao@chromium.org, zwisler@chromium.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com,
        sj.huang@mediatek.com, christie.yu@mediatek.com,
        linux-media@vger.kernel.org, srv_heupstream@mediatek.com
Subject: Re: [PATCH V2,1/1] media: mc-device.c: change
 media_device_request_alloc to match media_ioctl_info
Message-ID: <20200808220419.GY6186@pendragon.ideasonboard.com>
References: <20200806155822.3772-1-frederic.chen@mediatek.com>
 <20200806155822.3772-2-frederic.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200806155822.3772-2-frederic.chen@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Frederic,

Thank you for the patch.

On Thu, Aug 06, 2020 at 11:58:22PM +0800, frederic.chen@mediatek.com wrote:
> From: Frederic Chen <frederic.chen@mediatek.com>
> 
> We modified the type of media_device_request_alloc()'s second
> parameter from int* to void* so that it can match the interface
> defined in struct media_ioctl_info.
> 
> Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>

This looks fine to me.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/mc/mc-device.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> index da8088351135..6b66c2091bae 100644
> --- a/drivers/media/mc/mc-device.c
> +++ b/drivers/media/mc/mc-device.c
> @@ -370,9 +370,10 @@ static long media_device_get_topology(struct media_device *mdev, void *arg)
>  	return ret;
>  }
>  
> -static long media_device_request_alloc(struct media_device *mdev,
> -				       int *alloc_fd)
> +static long media_device_request_alloc(struct media_device *mdev, void *arg)
>  {
> +	int *alloc_fd = arg;
> +
>  #ifdef CONFIG_MEDIA_CONTROLLER_REQUEST_API
>  	if (!mdev->ops || !mdev->ops->req_validate || !mdev->ops->req_queue)
>  		return -ENOTTY;
> @@ -407,7 +408,7 @@ static long copy_arg_to_user(void __user *uarg, void *karg, unsigned int cmd)
>  #define MEDIA_IOC_ARG(__cmd, func, fl, from_user, to_user)		\
>  	[_IOC_NR(MEDIA_IOC_##__cmd)] = {				\
>  		.cmd = MEDIA_IOC_##__cmd,				\
> -		.fn = (long (*)(struct media_device *, void *))func,	\
> +		.fn = func,						\
>  		.flags = fl,						\
>  		.arg_from_user = from_user,				\
>  		.arg_to_user = to_user,					\

-- 
Regards,

Laurent Pinchart
