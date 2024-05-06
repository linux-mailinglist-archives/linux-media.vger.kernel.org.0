Return-Path: <linux-media+bounces-10916-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D621A8BD441
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 20:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 774951F21428
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 18:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D374158A2C;
	Mon,  6 May 2024 18:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DMGWyMjn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6F5158862;
	Mon,  6 May 2024 18:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715018430; cv=none; b=jR1CkLqriPxsH08SDkXlXr6MQR0hj9kdNm5/1ZCDzkSDFLg5j6Xd6knuH5RIrTlkDWtNZIDRj0dZe7NQoDK3slJGYT4t/pQfpFnVizpmGtVnZh9utNezDR5FCaJuFAf6+f4lbV2bKQzf7wZdvZACx6O5WQlkNfxrfuhTjXYuV8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715018430; c=relaxed/simple;
	bh=XZbRa2/CC1i0OKL/XxQNlvYNIDcAl0wDNwFniFr7p6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UPMTvvzEtSFTUT9FF9MfWtUjbmivzcAFHmEddOq2N2O3hwnPfu8BindqSIyMPRRBEZmaFgcQ6/1oAIaCLJASXblq75qA4CyMk2SJGI7g6h8u533nb54EDqAAiH9qmCq3zjL6ahUvgZtjFm2dSfxiBchDEb+z9ha0LiAdVPuUShI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DMGWyMjn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C3EFA98;
	Mon,  6 May 2024 20:00:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715018426;
	bh=XZbRa2/CC1i0OKL/XxQNlvYNIDcAl0wDNwFniFr7p6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DMGWyMjnHOPYAoGyNs7FCC+QI5qcN8NyDeAOnlwB6r5VDo2Ulc0F1EkabeKNeEFeA
	 7Pk4KzfSABahfKGfVGOx6hr4Os2GIgtntgNHuOJxzXr5R1TBG8BCYcKUxXVhuCjtFX
	 3H+U+79SGCp/JVK84t1Q+0FwwuZqSIAwjcQIcyX0=
Date: Mon, 6 May 2024 21:00:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH 1/3] media: bcm2835-unicam: Fix error handling for
 platform_get_irq
Message-ID: <20240506180019.GE29108@pendragon.ideasonboard.com>
References: <20240430-fix-broad-v1-0-cf3b81bf97ff@chromium.org>
 <20240430-fix-broad-v1-1-cf3b81bf97ff@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240430-fix-broad-v1-1-cf3b81bf97ff@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Tue, Apr 30, 2024 at 07:51:26AM +0000, Ricardo Ribalda wrote:
> platform_get_irq() cannot return the value 0.
> 
> If it returns -EPROBE_DEFER, we need to populate the error code upwards
> to retry probing once the irq handler is ready.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/broadcom/bcm2835-unicam.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index bd2bbb53070e..2a3a27ac70ba 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -2660,9 +2660,10 @@ static int unicam_probe(struct platform_device *pdev)
>  	}
>  
>  	ret = platform_get_irq(pdev, 0);
> -	if (ret <= 0) {
> +	if (ret < 0) {
>  		dev_err(&pdev->dev, "No IRQ resource\n");
> -		ret = -EINVAL;
> +		if (ret != -EPROBE_DEFER)
> +			ret = -EINVAL;

What's wrong with leaving ret untouched ? I assume it was set to -EINVAL
to avoid returning success in case ret was 0. Now that the test has
changed, I think we can leave the value as-is.

>  		goto err_unicam_put;
>  	}
>  
> 

-- 
Regards,

Laurent Pinchart

