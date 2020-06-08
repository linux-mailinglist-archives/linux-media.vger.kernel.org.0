Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97C721F2180
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2020 23:30:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgFHVaD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 17:30:03 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46176 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726705AbgFHVaC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Jun 2020 17:30:02 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC9B62C9;
        Mon,  8 Jun 2020 23:29:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591651800;
        bh=5648b7zLWqMKR5MbS2MpnHHlZD+5zBO3a0GztfnN9s0=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Swx/mncbCCeCY3s9gmp/Kg9vFqKn3uGXqIwzumYd/BGYjbpKLdGkl5YTVs0Lf9JMU
         b70JvRt5/kHzCorFR6BeVE8xagLHUM5dHDx0pjQz5S9H6kze3uszPUFU9tEoNsiueP
         8utZUFXIdQLA1izbWrsYXb4P0yT+BkBgaFvhPA4k=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] [v2] media: vsp1: Fix runtime PM imbalance on error
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200608052919.4984-1-dinghao.liu@zju.edu.cn>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <dad95caa-0cbc-7df2-8187-af5f38dee1da@ideasonboard.com>
Date:   Mon, 8 Jun 2020 22:29:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200608052919.4984-1-dinghao.liu@zju.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dinghao,

On 08/06/2020 06:29, Dinghao Liu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code. Thus a pairing decrement is needed on
> the error handling path to keep the counter balanced.
> 

Looks good to me:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
> 
> Changelog:
> 
> v2: - Fix the imbalance in vsp1_device_get().
>       Use vsp1_device_get() and vsp1_device_put()
>       to replace pm_runtime_get_sync() and
>       pm_runtime_put_sync() in vsp1_probe().

That looks like a helpful addition!

> ---
>  drivers/media/platform/vsp1/vsp1_drv.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
> index c650e45bb0ad..dc62533cf32c 100644
> --- a/drivers/media/platform/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/vsp1/vsp1_drv.c
> @@ -562,7 +562,12 @@ int vsp1_device_get(struct vsp1_device *vsp1)
>  	int ret;
>  
>  	ret = pm_runtime_get_sync(vsp1->dev);
> -	return ret < 0 ? ret : 0;
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(vsp1->dev);

Hrm... I was going to query the _noidle here, as I presume the device is
likely already idle ... but actually this looks like it simply adds
protection against decrementing the refcnt below zero, so it is likely
useful.



> +		return ret;
> +	}
> +
> +	return 0;
>  }
>  
>  /*
> @@ -845,12 +850,12 @@ static int vsp1_probe(struct platform_device *pdev)
>  	/* Configure device parameters based on the version register. */
>  	pm_runtime_enable(&pdev->dev);
>  
> -	ret = pm_runtime_get_sync(&pdev->dev);
> +	ret = vsp1_device_get(vsp1);
>  	if (ret < 0)
>  		goto done;
>  
>  	vsp1->version = vsp1_read(vsp1, VI6_IP_VERSION);
> -	pm_runtime_put_sync(&pdev->dev);
> +	vsp1_device_put(vsp1);
>  
>  	for (i = 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
>  		if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) ==
> 

