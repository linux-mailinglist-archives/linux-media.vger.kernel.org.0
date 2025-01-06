Return-Path: <linux-media+bounces-24297-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F4FA028D0
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 16:10:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5865A163C35
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 15:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B54E1482F2;
	Mon,  6 Jan 2025 15:10:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2814F282F5;
	Mon,  6 Jan 2025 15:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736176243; cv=none; b=Ub9XIzJX103Pij3vFzb3tnbNlSEoZMKemyjRvhgBBfvFkxlkOq7vgmA30IxGW3MDNauVejE6/9qEhyC17+joUx3GASdO9wGtX95Al4kW9W0rc/m1CbTmFmRpJYpYlXRj2l8vCuF+hgS9yNC0SbopO8X7cNGR9FnDNI1yw0Weqo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736176243; c=relaxed/simple;
	bh=Udj/ssRl13ZueoEAC6lXfXAtfPEkpbyAk/UTlVNvwTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GX6sClP6BUOc1I9Gs4DQDUSBN9Gj9Q93aHCZrXDQhQhPjhAXbDxGRZawLfXiLIYPglAzMf2ejLYOOvUUtn8GJTbGejY42f22eEbSoXaP7ex60RdHse7YhNdZ+Jis0JW87xJLlw2GTKuTa13hyObewJQsEqPqZh0BX6ISmcuX/MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E951C4CEE1;
	Mon,  6 Jan 2025 15:10:40 +0000 (UTC)
Message-ID: <eacf3201-2884-48e3-b54d-2e52e16999be@xs4all.nl>
Date: Mon, 6 Jan 2025 16:10:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media/mmp: Bring back registration of the device
To: Lubomir Rintel <lrintel@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>,
 stable@vger.kernel.org
References: <20241231190434.438517-1-lkundrak@v3.sk>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20241231190434.438517-1-lkundrak@v3.sk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Lubomir,

On 31/12/2024 20:04, Lubomir Rintel wrote:
> In commit 4af65141e38e ("media: marvell: cafe: Register V4L2 device
> earlier"), a call to v4l2_device_register() was moved away from
> mccic_register() into its caller, marvell/cafe's cafe_pci_probe().
> This is not the only caller though -- there's also marvell/mmp.
> 
> Add v4l2_device_register() into mmpcam_probe() to unbreak the MMP camera
> driver, in a fashion analogous to what's been done to the Cafe driver.
> Same for the teardown path.
> 
> Fixes: 4af65141e38e ("media: marvell: cafe: Register V4L2 device earlier")
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

Should this be your redhat email? I have a mismatch between the From email
and the email in this Sob.

I can fix it either way, but you have to tell me what you prefer.

Regards,

	Hans

> Cc: stable@vger.kernel.org # v6.6+
> ---
>  drivers/media/platform/marvell/mmp-driver.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/marvell/mmp-driver.c b/drivers/media/platform/marvell/mmp-driver.c
> index 3fd4fc1b9c48..d3da7ebb4a2b 100644
> --- a/drivers/media/platform/marvell/mmp-driver.c
> +++ b/drivers/media/platform/marvell/mmp-driver.c
> @@ -231,13 +231,23 @@ static int mmpcam_probe(struct platform_device *pdev)
>  
>  	mcam_init_clk(mcam);
>  
> +	/*
> +	 * Register with V4L.
> +	 */
> +
> +	ret = v4l2_device_register(mcam->dev, &mcam->v4l2_dev);
> +	if (ret)
> +		return ret;
> +
>  	/*
>  	 * Create a match of the sensor against its OF node.
>  	 */
>  	ep = fwnode_graph_get_next_endpoint(of_fwnode_handle(pdev->dev.of_node),
>  					    NULL);
> -	if (!ep)
> -		return -ENODEV;
> +	if (!ep) {
> +		ret = -ENODEV;
> +		goto out_v4l2_device_unregister;
> +	}
>  
>  	v4l2_async_nf_init(&mcam->notifier, &mcam->v4l2_dev);
>  
> @@ -246,7 +256,7 @@ static int mmpcam_probe(struct platform_device *pdev)
>  	fwnode_handle_put(ep);
>  	if (IS_ERR(asd)) {
>  		ret = PTR_ERR(asd);
> -		goto out;
> +		goto out_v4l2_device_unregister;
>  	}
>  
>  	/*
> @@ -254,7 +264,7 @@ static int mmpcam_probe(struct platform_device *pdev)
>  	 */
>  	ret = mccic_register(mcam);
>  	if (ret)
> -		goto out;
> +		goto out_v4l2_device_unregister;
>  
>  	/*
>  	 * Add OF clock provider.
> @@ -283,6 +293,8 @@ static int mmpcam_probe(struct platform_device *pdev)
>  	return 0;
>  out:
>  	mccic_shutdown(mcam);
> +out_v4l2_device_unregister:
> +	v4l2_device_unregister(&mcam->v4l2_dev);
>  
>  	return ret;
>  }
> @@ -293,6 +305,7 @@ static void mmpcam_remove(struct platform_device *pdev)
>  	struct mcam_camera *mcam = &cam->mcam;
>  
>  	mccic_shutdown(mcam);
> +	v4l2_device_unregister(&mcam->v4l2_dev);
>  	pm_runtime_force_suspend(mcam->dev);
>  }
>  


