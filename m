Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A6071FA68A
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 04:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgFPC4a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 22:56:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726025AbgFPC43 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 22:56:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B43CC061A0E;
        Mon, 15 Jun 2020 19:56:29 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B06CEF9;
        Tue, 16 Jun 2020 04:56:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592276184;
        bh=+p29mN3O4KA8+pYMxFKIjzQpJJOcdUqinFmYsFDSJwI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LDcDxbJuHmMXCEwXE1fgvV7P0DQ7rvDH5MFaa0/spasIzJiZrahiaSyVccQo7PxvF
         Hq9o1J5LX87Zvb548SyDFIR60KZiH6Nx1ygbLLuKTv9XFQwYcQVFcoex2uaTF+5WtP
         BmtiYGcHquXcbee0W6D5KMulWW+a0goZwTeP/p2k=
Date:   Tue, 16 Jun 2020 05:56:02 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc:     kjlu@umn.edu,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] media: vsp1: Fix runtime PM imbalance on error
Message-ID: <20200616025602.GG29596@pendragon.ideasonboard.com>
References: <20200608052919.4984-1-dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200608052919.4984-1-dinghao.liu@zju.edu.cn>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Dinghao,

Thank you for the patch.

On Mon, Jun 08, 2020 at 01:29:19PM +0800, Dinghao Liu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code. Thus a pairing decrement is needed on
> the error handling path to keep the counter balanced.
> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I have however received multiple similar patches recently, for different
drivers. I've CC'ed Rafael, the PM maintainer, in one of those e-mail
threads, and questioned whether we should really mass-patch drivers, or
fix the issue in pm_runtime_get_sync(). I'll defer pushing this patch
until that discussion comes to a conclusion.

> ---
> 
> Changelog:
> 
> v2: - Fix the imbalance in vsp1_device_get().
>       Use vsp1_device_get() and vsp1_device_put()
>       to replace pm_runtime_get_sync() and
>       pm_runtime_put_sync() in vsp1_probe().
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

-- 
Regards,

Laurent Pinchart
