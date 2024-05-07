Return-Path: <linux-media+bounces-10965-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B43A38BDB22
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 08:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F06E284FF5
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 06:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D15C6EB70;
	Tue,  7 May 2024 06:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jfHwyLQQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3646EB49;
	Tue,  7 May 2024 06:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715062105; cv=none; b=mPGuVpuJgiIM6WNhzFYW0hGggI1YwukC41Y5thy/eJJxzLaavEiSnCuJhYwh9H8AWIwitvymzoM7dJiIn8770UU5eIxAYeFweQqnNUECvHMkm4xtwLyAUQlpOUd+kwRIYNYIa63Bx+tpnRerubI2NF1DZVDzqHXeWaX8Nd3qug0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715062105; c=relaxed/simple;
	bh=gPBtZdsiM39zs7dB1Qj1xMuRJUu7VfRf6B+HMoFaGYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZbAhB720Y/9UZSOP8YapPjmVag0PDsx+tnThLz9OMtkvWs75Gghm81hRdJ2k9Md8j12wzV3GJKWTfptef9ZhOIO83CO9nCRjNa56OJcbk2CDTAxNIsMPGKEPkTFbFhzoMPQt8PLfICOZUm0Cu/edpG9p9un1HKjI9tCdM/V1dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jfHwyLQQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 00F2D3D5;
	Tue,  7 May 2024 08:08:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715062101;
	bh=gPBtZdsiM39zs7dB1Qj1xMuRJUu7VfRf6B+HMoFaGYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jfHwyLQQ9AJyjNKkVYRgxcL6T2Xsy294Ar+pIIrO79t++/i2t+vKSiIAxJ3j+6e1x
	 5kftqwFOCFQn5rQ+SPESSHOqI6DTzyv8C8d1+udguAQf33qaGMQdXKV8gfmIXVXUZv
	 HXDVNIrji2lYGDFkeZn33c0GV2FI5VoSf0zb6bpk=
Date: Tue, 7 May 2024 09:08:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v2 1/2] media: bcm2835-unicam: Do not replace IRQ retcode
 during probe
Message-ID: <20240507060815.GF26689@pendragon.ideasonboard.com>
References: <20240506-fix-broad-v2-0-e6a2a5c0d609@chromium.org>
 <20240506-fix-broad-v2-1-e6a2a5c0d609@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240506-fix-broad-v2-1-e6a2a5c0d609@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Mon, May 06, 2024 at 07:24:46PM +0000, Ricardo Ribalda wrote:
> platform_get_irq() cannot return the value 0. It will either return a non-zero
> irq or a errcode.
> 
> If a errcode is returned, we need to populate the error code upwards. It will
> give a more accurate reason of why it failed to the caller, who might decide
> to retry later.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Aren't git commit messages supposed to be wrapped at 72 columns ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/broadcom/bcm2835-unicam.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index bd2bbb53070e..60c0fe956c58 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -2660,9 +2660,8 @@ static int unicam_probe(struct platform_device *pdev)
>  	}
>  
>  	ret = platform_get_irq(pdev, 0);
> -	if (ret <= 0) {
> +	if (ret < 0) {
>  		dev_err(&pdev->dev, "No IRQ resource\n");
> -		ret = -EINVAL;
>  		goto err_unicam_put;
>  	}
>  
> @@ -2670,7 +2669,6 @@ static int unicam_probe(struct platform_device *pdev)
>  			       "unicam_capture0", unicam);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Unable to request interrupt\n");
> -		ret = -EINVAL;
>  		goto err_unicam_put;
>  	}
>  

-- 
Regards,

Laurent Pinchart

