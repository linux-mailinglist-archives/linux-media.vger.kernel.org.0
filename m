Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBA5A5FB48
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2019 17:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726696AbfGDPzS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jul 2019 11:55:18 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58662 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbfGDPzS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jul 2019 11:55:18 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2062324B;
        Thu,  4 Jul 2019 17:55:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1562255716;
        bh=e86dXhqD5O2myhAz4xOxC9fFKe9cEt/x8h/c2u676jo=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=mS+TQi795kf78Xj9rvVyu1V4Jy13aWprScm/6bpZ6R2/8Tsp6nLJx6OrneZ2k9JO+
         VkQcB0nNJRRt87wrdlXvtGIBmEhb+RPl9oRjf2un5IRsdnQwJc3ANKTa8q2DsBdG57
         nteGKT2eBwX48xsCm+aXIQf/ctT8dZPbr1YB8cE4=
Subject: Re: [PATCH v3 4/4] rcar-vin: Always setup controls when opening video
 device
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20190704015817.17083-1-niklas.soderlund+renesas@ragnatech.se>
 <20190704015817.17083-5-niklas.soderlund+renesas@ragnatech.se>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <1b903d9d-cef5-54b0-3ed8-736fe081737f@ideasonboard.com>
Date:   Thu, 4 Jul 2019 16:55:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190704015817.17083-5-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On 04/07/2019 02:58, Niklas Söderlund wrote:
> Now that both Gen2 (device centric) and Gen3 (media device centric)

s/Gen2 (device centric)/Gen2 (video device centric)/ ?
  (only if you feel it helps clarify the distinction).

> modes of this driver have controls it make sens to call

s/sens/sense/

> v4l2_ctrl_handler_setup() unconditionally when opening the video device.
> 
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

It was already here before this patch, but a new line would be nice here
to separate the error paths...

Otherwise,

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


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
> 

