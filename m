Return-Path: <linux-media+bounces-50799-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD81D24E5A
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 15:17:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6FFA93007F02
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 14:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77FA23A1E6E;
	Thu, 15 Jan 2026 14:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cE4BlBJN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D4D39903F;
	Thu, 15 Jan 2026 14:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768486671; cv=none; b=ej7zYbnPg1l81uOqYZz7zVpA2+67DNn9l8vuTlzF38xDiY8nnpFv7uq0GVrS+v3iperPXPPeTbOBqBbiW6U9BYyzybE61C+GlV+tpF+GbPB8DfNwuqT6CL6SfytdjZxNv/NaJ2FrdIcj6lHBFKMq7m6iy7k7tQklZW0tzjX98n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768486671; c=relaxed/simple;
	bh=Kdu7cKtT0apulo+sidRa0A9VlXkD3hDd3zNRfOBkzmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pRRzdcaWkrCFTBBo1e0ButCZZEZ5thiFYvkhCYo6Ed4rYG9wnE46vUdw8cLXog0xVDS587Q5JpLTpTDxl8Btcgb8YAryFHtVpIPd3HQwaP6mGtJmkDXo7NhHmOe3JomIoZwC1xuUiGfruHt9CmVkiHlgMfYeIcQ4eiF6VVOOn7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cE4BlBJN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [212.249.222.222])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BE66465;
	Thu, 15 Jan 2026 15:17:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768486640;
	bh=Kdu7cKtT0apulo+sidRa0A9VlXkD3hDd3zNRfOBkzmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cE4BlBJNJqzdPA8iXf+/3RjXezqWLHjIF6NhEDYQZS7Ahx53sh6UeiOcGGpyuhYe5
	 gDAmxKFnGaRYaBIKlx+aoREpEWKxgcMuKz1AJ83VdhPiPuh+mIc6XHsL/WkFMb/YpI
	 T8+OyIS2uNGQM2ptDhirrFHWjuJqefkHjE12q0mQ=
Date: Thu, 15 Jan 2026 15:17:45 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: dan.scally@ideasonboard.com, jacopo.mondi@ideasonboard.com, 
	mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: mali-c55: core: Remove redundant dev_err()
Message-ID: <aWj20s8j5Y6_Qdz3@zed>
References: <20260115023516.4142364-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260115023516.4142364-1-nichen@iscas.ac.cn>

Hi Chen

On Thu, Jan 15, 2026 at 10:35:16AM +0800, Chen Ni wrote:
> The platform_get_irq_byname() function already prints an error message
> internally upon failure using dev_err_probe(). Therefore, the explicit
> dev_err() is redundant and results in duplicate error logs.
>
> Remove the redundant dev_err() call to clean up the error path.
>

Indeed

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/media/platform/arm/mali-c55/mali-c55-core.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> index 43b834459ccf..ab8f7f6f3be1 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> @@ -868,7 +868,6 @@ static int mali_c55_probe(struct platform_device *pdev)
>  	mali_c55->irqnum = platform_get_irq(pdev, 0);
>  	if (mali_c55->irqnum < 0) {
>  		ret = mali_c55->irqnum;
> -		dev_err(dev, "failed to get interrupt\n");
>  		goto err_deinit_media_frameworks;
>  	}
>
> --
> 2.25.1
>

