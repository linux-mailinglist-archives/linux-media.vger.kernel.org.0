Return-Path: <linux-media+bounces-47252-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A3704C683BD
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 09:40:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 2AEED2A2C9
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 08:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D2B530FC03;
	Tue, 18 Nov 2025 08:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lDUZ+Tvj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD86630B509;
	Tue, 18 Nov 2025 08:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763455197; cv=none; b=m1z3/inm7NEmwC6+9d3+j2KtQ82tQNP+Po4obsFrgONPFk/hwAxw9+Gs1ERhUFOwZ1Y8y+bhDlNqfUCoZwnke3UIhXaLrtRKssIiQ18+AAHLPWXak+UQBXwTixrTsZcpmuvUH2y3P71eRJcIf5tSUh+wsJec+IdnklY01ctlf0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763455197; c=relaxed/simple;
	bh=dWtKlSw6zALDkLgC6FwesvDoLAQqUWVGl56hEogz8NQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJJ6V6PzOdMpG0kl7ZE59eLheUzHVLSFkQkq8Cq7cvxpw1sEapUpJ7lIj4iRZxbVwSJ/5W5l7DB6WR1ZNKITCqSBKywGhrfj5+t1eypC5eZmfd+v4OINXxHShYbnpyIcpbHAx9VUULosdSOZJQDGO3wUsMVBHL/2vbwRMzpI9Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lDUZ+Tvj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-137-247.net.vodafone.it [5.90.137.247])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93CB8B3;
	Tue, 18 Nov 2025 09:37:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763455061;
	bh=dWtKlSw6zALDkLgC6FwesvDoLAQqUWVGl56hEogz8NQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lDUZ+TvjQ/ZF+IYhOuq0pbf8gjOqBDdYksQbbmelYS399mAwDqTgaH2GycfyUDlTo
	 Pg47UzU9ypQik/sT++zrX1AMrsT1O8SYB+zre4B/IDDAIQ+EsZ9GhV37lSosMgsHbJ
	 PDeUez4KqSnRHucYL+2wWZJLeB3ehRE9DBwQQbBo=
Date: Tue, 18 Nov 2025 09:39:40 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: dan.scally@ideasonboard.com, jacopo.mondi@ideasonboard.com, 
	mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: mali-c55: Remove unneeded semicolon
Message-ID: <v3utgh35qccirdxq3epydyipmc33neohhfsd2xii7q44cqrvdt@dwa6nkt2lais>
References: <20251118020430.492921-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251118020430.492921-1-nichen@iscas.ac.cn>

Hi Chen Ni

On Tue, Nov 18, 2025 at 10:04:30AM +0800, Chen Ni wrote:
> Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
> semantic patch at scripts/coccinelle/misc/semicolon.cocci.
>
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Indeed, thanks for catching!

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  drivers/media/platform/arm/mali-c55/mali-c55-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> index 43b834459ccf..e4118e8e0faa 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> @@ -458,7 +458,7 @@ static int mali_c55_media_frameworks_init(struct mali_c55 *mali_c55)
>  	if (ret) {
>  		dev_err(mali_c55->dev, "failed to register V4L2 device\n");
>  		goto err_unregister_media_device;
> -	};
> +	}
>
>  	mali_c55->notifier.ops = &mali_c55_notifier_ops;
>  	v4l2_async_nf_init(&mali_c55->notifier, &mali_c55->v4l2_dev);
> --
> 2.25.1
>
>

