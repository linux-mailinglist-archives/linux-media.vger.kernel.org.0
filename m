Return-Path: <linux-media+bounces-50754-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C86D22E40
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 08:40:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B87E830B472C
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 07:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E614E325709;
	Thu, 15 Jan 2026 07:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lh5TT273"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2150B21CC58;
	Thu, 15 Jan 2026 07:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768462697; cv=none; b=FzhVnpEYfdNL/Pxq1sW2gX0u5OZQBad3Hy0DHTdlh5jG17Dy4AD5IftPC0SN7Sbj6idfvXk7RDFH6ld+JsgfQ/oiRkA3OQUPFlUkfPPRilEOfkXxS3tf2Y0FXlIFV2SZ05ikc7TtKYCZyBtVgX0868bM4GSuFnAeI2IKJBJvmdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768462697; c=relaxed/simple;
	bh=Dm0qgQvz7LJ/ZJn/dlM6Cx/tSu7vihj0/HoRKoVp6hU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ifU9c6asZWpWyOZiJLAsX2f2Lf0H40j31yQAc4W+oYf13mjy7kVAk/NmQyilLJtY0Li+IQjsqnpsrBeadHwfgGYgp5tINxXe4IsgpL1RStkjN2ZTaKBPcunsrZa5UM8rh/2crgqnEQQX8iRR3zh0bXxrYq5g/arnIJb2/DpgvZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lh5TT273; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA4FC4D3;
	Thu, 15 Jan 2026 08:37:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768462667;
	bh=Dm0qgQvz7LJ/ZJn/dlM6Cx/tSu7vihj0/HoRKoVp6hU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lh5TT273ghf3hPbDSpVx7Lvpb4aGISk9/dnB8ckdJpJi6RU10+fV9PyUtZuZt+G85
	 5nIwLLaMGBE4LTdvwGoyfMCdG9TstRYz4uTARqo9BODrsEZ492nXyWiQcBdHGvnY14
	 IMGHA9VIO43jfY7cOsr9ySXEAbZqX6W8ML5eRpN4=
Message-ID: <7255a884-99b7-4e3e-bbdb-50fb3cb3a82d@ideasonboard.com>
Date: Thu, 15 Jan 2026 07:38:10 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: mali-c55: core: Remove redundant dev_err()
To: Chen Ni <nichen@iscas.ac.cn>, jacopo.mondi@ideasonboard.com,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260115023516.4142364-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260115023516.4142364-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Chen - thanks for the patch

On 15/01/2026 02:35, Chen Ni wrote:
> The platform_get_irq_byname() function already prints an error message
> internally upon failure using dev_err_probe(). Therefore, the explicit
> dev_err() is redundant and results in duplicate error logs.
> 
> Remove the redundant dev_err() call to clean up the error path.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

> ---
>   drivers/media/platform/arm/mali-c55/mali-c55-core.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> index 43b834459ccf..ab8f7f6f3be1 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> @@ -868,7 +868,6 @@ static int mali_c55_probe(struct platform_device *pdev)
>   	mali_c55->irqnum = platform_get_irq(pdev, 0);
>   	if (mali_c55->irqnum < 0) {
>   		ret = mali_c55->irqnum;
> -		dev_err(dev, "failed to get interrupt\n");
>   		goto err_deinit_media_frameworks;
>   	}
>   


