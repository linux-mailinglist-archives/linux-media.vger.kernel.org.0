Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 876D33B0844
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 17:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232063AbhFVPLR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 11:11:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231680AbhFVPLR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 11:11:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65AFAC061574;
        Tue, 22 Jun 2021 08:09:01 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB95CA66;
        Tue, 22 Jun 2021 17:08:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624374539;
        bh=2pDnCm7O9GyOVIYVG3X2XH3bprI4H6NKF6rdw3LcqBc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u6mS5/GsI9LUmTaFjb3Xa1xCC0VFUuIUBg+3MdPq6m56yf+erM9HiO3NMZ1pF3Itf
         C/UyqHKK209a/eyHznN9nBKywEa1jgQh3XoVSzUCXB/qOlHh2MNY+29YLJLnbK9Zac
         obt8RbIB29Bf3boEMysyTof/a9JMW65K1hUKLmNI=
Date:   Tue, 22 Jun 2021 18:08:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-subdev: fix some NULL vs IS_ERR() checks
Message-ID: <YNH87qd4eJOR296R@pendragon.ideasonboard.com>
References: <YNH0WU7BcQ/60UNG@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YNH0WU7BcQ/60UNG@mwanda>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

Thank you for the patch.

On Tue, Jun 22, 2021 at 05:31:53PM +0300, Dan Carpenter wrote:
> The v4l2_subdev_alloc_state() function returns error pointers, it
> doesn't return NULL.

It's funny you send this patch today, I've been thinking about the exact
same issue yesterday, albeit more globally, when trying to figure out if
a function I called returned NULL or an error pointer on error.

Would it make to create an __err_ptr annotation to mark functions that
return an error pointer ? This would both give a simple indication to
the user and allow tools such as smatch to detect errors.

> Fixes: 0d346d2a6f54 ("media: v4l2-subdev: add subdev-wide state struct")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Mauro, can you pick this patch up ?

> ---
>  drivers/media/platform/vsp1/vsp1_entity.c | 4 ++--
>  drivers/staging/media/tegra-video/vi.c | 4 ++--
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 4 ++--
>  3 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/vsp1/vsp1_entity.c b/drivers/media/platform/vsp1/vsp1_entity.c
> index 6f51e5c75543..823c15facd1b 100644
> --- a/drivers/media/platform/vsp1/vsp1_entity.c
> +++ b/drivers/media/platform/vsp1/vsp1_entity.c
> @@ -676,9 +676,9 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
>  	 * rectangles.
>  	 */
>  	entity->config = v4l2_subdev_alloc_state(&entity->subdev);
> -	if (entity->config == NULL) {
> +	if (IS_ERR(entity->config)) {
>  		media_entity_cleanup(&entity->subdev.entity);
> -		return -ENOMEM;
> +		return PTR_ERR(entity->config);
>  	}
>  
>  	return 0;
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
> index 89709cd06d4d..d321790b07d9 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -508,8 +508,8 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
>  		return -ENODEV;
>  
>  	sd_state = v4l2_subdev_alloc_state(subdev);
> -	if (!sd_state)
> -		return -ENOMEM;
> +	if (IS_ERR(sd_state))
> +		return PTR_ERR(sd_state);
>  	/*
>  	 * Retrieve the format information and if requested format isn't
>  	 * supported, keep the current format.
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index cca15a10c0b3..0d141155f0e3 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -253,8 +253,8 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
>  	int ret;
>  
>  	sd_state = v4l2_subdev_alloc_state(sd);
> -	if (sd_state == NULL)
> -		return -ENOMEM;
> +	if (IS_ERR(sd_state))
> +		return PTR_ERR(sd_state);
>  
>  	if (!rvin_format_from_pixel(vin, pix->pixelformat))
>  		pix->pixelformat = RVIN_DEFAULT_FORMAT;

-- 
Regards,

Laurent Pinchart
