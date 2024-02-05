Return-Path: <linux-media+bounces-4713-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 047F8849DA5
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 16:02:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89936285D52
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 15:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6BAA2C69B;
	Mon,  5 Feb 2024 15:02:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9E32C1B8
	for <linux-media@vger.kernel.org>; Mon,  5 Feb 2024 15:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707145347; cv=none; b=MLvigTNDyh2iY30rOpTAiyaOwyZtyNY7K6xYt97Gv7tIYOvoS21IriWdHuskF07naY1Hlb63Wr1DUQed4skDVVrfON0adbsKbx+Uu1SfM7Ecin1sjmrst9Eo8FMLNIbxDl2nju1oae2Kwod/u9aGksuahf/Bx7wvkt2dx899de8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707145347; c=relaxed/simple;
	bh=5NbhaYkDcyVwpuZnzT3H3DtIWF5FqTjPvTp6iWmMmGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uQ/AwEph8V8n/lVBElXb46QNg11wbPvPYomH4K+e03vxBvebv1CdO1G9ETJrSZyQ3JxlRptOETOL64VJgTMlPJSJPdsVo+gRYFP8PFgAG0cPDaynONuVH0UJ1JcfZhApnQeS4YzUx+/FdtxSBnI/GAPloCXAMRwfRgKD3ZQUp10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60945C433C7;
	Mon,  5 Feb 2024 15:02:26 +0000 (UTC)
Message-ID: <5f37ef41-151e-4320-8921-06e32a936818@xs4all.nl>
Date: Mon, 5 Feb 2024 16:02:24 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/29] media: vimc: Release resources on media device
 release
Content-Language: en-US, nl
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-24-sakari.ailus@linux.intel.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231220103713.113386-24-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/12/2023 11:37, Sakari Ailus wrote:
> Release all the resources when the media device is related, moving away
> form the struct v4l2_device used for that purpose.

form -> from

> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/test-drivers/vimc/vimc-core.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/test-drivers/vimc/vimc-core.c
> index af127476e920..3e59f8c256c7 100644
> --- a/drivers/media/test-drivers/vimc/vimc-core.c
> +++ b/drivers/media/test-drivers/vimc/vimc-core.c
> @@ -264,13 +264,12 @@ static int vimc_add_subdevs(struct vimc_device *vimc)
>  	return 0;
>  }
>  
> -static void vimc_v4l2_dev_release(struct v4l2_device *v4l2_dev)
> +static void vimc_mdev_release(struct media_device *mdev)
>  {
>  	struct vimc_device *vimc =
> -		container_of(v4l2_dev, struct vimc_device, v4l2_dev);
> +		container_of_const(mdev, struct vimc_device, mdev);

Why this change?

>  
>  	vimc_release_subdevs(vimc);
> -	media_device_cleanup(&vimc->mdev);
>  	kfree(vimc->ent_devs);
>  	kfree(vimc);
>  }
> @@ -336,6 +335,10 @@ static int vimc_register_devices(struct vimc_device *vimc)
>  	return ret;
>  }
>  
> +static const struct media_device_ops vimc_mdev_ops = {
> +	.release = vimc_mdev_release,
> +};
> +
>  static int vimc_probe(struct platform_device *pdev)
>  {
>  	const struct font_desc *font = find_font("VGA8x16");
> @@ -369,12 +372,12 @@ static int vimc_probe(struct platform_device *pdev)
>  	snprintf(vimc->mdev.bus_info, sizeof(vimc->mdev.bus_info),
>  		 "platform:%s", VIMC_PDEV_NAME);
>  	vimc->mdev.dev = &pdev->dev;
> +	vimc->mdev.ops = &vimc_mdev_ops;
>  	media_device_init(&vimc->mdev);
>  
>  	ret = vimc_register_devices(vimc);
>  	if (ret) {
> -		media_device_cleanup(&vimc->mdev);
> -		kfree(vimc);
> +		media_device_put(&vimc->mdev);
>  		return ret;
>  	}
>  	/*
> @@ -382,7 +385,6 @@ static int vimc_probe(struct platform_device *pdev)
>  	 * if the registration fails, we release directly from probe
>  	 */
>  
> -	vimc->v4l2_dev.release = vimc_v4l2_dev_release;
>  	platform_set_drvdata(pdev, vimc);
>  	return 0;
>  }
> @@ -397,6 +399,7 @@ static void vimc_remove(struct platform_device *pdev)
>  	media_device_unregister(&vimc->mdev);
>  	v4l2_device_unregister(&vimc->v4l2_dev);
>  	v4l2_device_put(&vimc->v4l2_dev);
> +	media_device_put(&vimc->mdev);
>  }
>  
>  static void vimc_dev_release(struct device *dev)

Regards,

	Hans

