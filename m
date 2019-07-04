Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 747905F7D6
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2019 14:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727684AbfGDMRO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jul 2019 08:17:14 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53482 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727675AbfGDMRO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jul 2019 08:17:14 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82C1224B;
        Thu,  4 Jul 2019 14:17:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1562242632;
        bh=eqWu4GVvTv6gURlzvDBaBF/isxMgPM/LQZarqxosd7c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=htdypw1q+crM4Val3UuLaMF12+KetfGJxYO1yGYea1tu0Uaa9kVHmPHyCQz5Xd/pT
         Jwyvu77MX+SD2IvD4DPTs8oSOZbdeBA4QFLPn4sb3P9nYWRhSywusVeaie6CjcHqoL
         jIfbc+CQa/P31tJFiKrKLxdbKtnkyWmZZUxU4aW0=
Date:   Thu, 4 Jul 2019 15:16:52 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 4/4] rcar-vin: Always setup controls when opening
 video device
Message-ID: <20190704121652.GD6569@pendragon.ideasonboard.com>
References: <20190704015817.17083-1-niklas.soderlund+renesas@ragnatech.se>
 <20190704015817.17083-5-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190704015817.17083-5-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Thu, Jul 04, 2019 at 03:58:17AM +0200, Niklas Söderlund wrote:
> Now that both Gen2 (device centric) and Gen3 (media device centric)
> modes of this driver have controls it make sens to call

s/sens/sense/

> v4l2_ctrl_handler_setup() unconditionally when opening the video device.

Not only does it make sense, but it's required by 3/4. I think you
should explain why in the commit message. Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 30 ++++++++++-----------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index f8b6ec4408b2f5fa..cbf5d8cd6db32d77 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -789,26 +789,26 @@ static int rvin_open(struct file *file)
>  	if (ret)
>  		goto err_unlock;
>  
> -	if (vin->info->use_mc) {
> +	if (vin->info->use_mc)
>  		ret = v4l2_pipeline_pm_use(&vin->vdev.entity, 1);
> -		if (ret < 0)
> -			goto err_open;
> -	} else {
> -		if (v4l2_fh_is_singular_file(file)) {
> -			ret = rvin_power_parallel(vin, true);
> -			if (ret < 0)
> -				goto err_open;
> +	else if (v4l2_fh_is_singular_file(file))
> +		ret = rvin_power_parallel(vin, true);
> +
> +	if (ret < 0)
> +		goto err_open;
> +
> +	ret = v4l2_ctrl_handler_setup(&vin->ctrl_handler);
> +	if (ret)
> +		goto err_power;
>  
> -			ret = v4l2_ctrl_handler_setup(&vin->ctrl_handler);
> -			if (ret)
> -				goto err_parallel;
> -		}
> -	}
>  	mutex_unlock(&vin->lock);
>  
>  	return 0;
> -err_parallel:
> -	rvin_power_parallel(vin, false);
> +err_power:
> +	if (vin->info->use_mc)
> +		v4l2_pipeline_pm_use(&vin->vdev.entity, 0);
> +	else if (v4l2_fh_is_singular_file(file))
> +		rvin_power_parallel(vin, false);
>  err_open:
>  	v4l2_fh_release(file);
>  err_unlock:

-- 
Regards,

Laurent Pinchart
