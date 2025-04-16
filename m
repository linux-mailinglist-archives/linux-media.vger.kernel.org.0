Return-Path: <linux-media+bounces-30291-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3055BA8B017
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 08:12:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF499189F644
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 06:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183D022A4E5;
	Wed, 16 Apr 2025 06:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XNQ3CK4Y"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746613597A;
	Wed, 16 Apr 2025 06:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744783917; cv=none; b=XXYSWdLUpbU/aAQWWC6mw0jmerdXdLREEfqrVrjtH8iboBaTv0IW4fvs1KqtZXgzDWckkGIjxno/EC9OXekk3yGYLIdyPsya+wXEZ68fLO2JQ+8HR6ZGdOnggECIbJmSIK/6ROB/G6VD1qkFG5n3pxjqzQY3DFcm68K5R44Fbtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744783917; c=relaxed/simple;
	bh=Ux+wyNixqbSXxuEjmcaLENj8uIw5/U9ErqcvHgV9HaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bIceQZwzmNJg+fEUhFG5Kn9jS2TgF3Tdz8iisGC58PQ5qHty4GrCD/y4JM7fump0JN8Ts3vU1GsmUINec9KSwSSDoVZxSF8oQxhLERK3XZnEHmMalItqrYUB7WaQaL3LdHdYq7ZtYg05cPOIjvavgmxrWdWH1L73tVtiRSmdkIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XNQ3CK4Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2E6FC4CEE2;
	Wed, 16 Apr 2025 06:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744783916;
	bh=Ux+wyNixqbSXxuEjmcaLENj8uIw5/U9ErqcvHgV9HaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XNQ3CK4YwPP1CZEQN8BRnsixRhPe7Ikh7H7wKC0u4muW/bY6YaWFZhCGQ90t/KM6g
	 Dg3qav/HR+STQaEBYuRDNJ7HWQ312ClAxuVTEpSkCSHdihBRMQVYzMh8Dr1/olUs1G
	 iL9rHUYt1O0YDh9vBtewIMh60ksPb1PPeVFr8oEzmN/PHa6xU7DyYX33HAiWrUFyjF
	 B3p7mydK1qdEJeLmXV6jyQQPucegiUS1ICcjnS9QKJaEK0NCAMl06J3BWsMbd3desa
	 6bk+frmt3G4zky1mi3KRvZ6ZDX1fy+Hlca6Jnnuxe7dt5/LQmtW3zXVUgovvjyE3ex
	 QfLQ3Qr8YBcrA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u4w02-000000004GE-3HYz;
	Wed, 16 Apr 2025 08:11:54 +0200
Date: Wed, 16 Apr 2025 08:11:54 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Nikiforov <Dm1tryNk@yandex.ru>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH v2] media: davinci: vpif: Fix memory leaks in probe error
 path
Message-ID: <Z_9KKrbKFDekGLOw@hovoldconsulting.com>
References: <20250415223825.3777-1-Dm1tryNk@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415223825.3777-1-Dm1tryNk@yandex.ru>

On Wed, Apr 16, 2025 at 01:38:20AM +0300, Dmitry Nikiforov wrote:
> If `of_graph_get_endpoint_by_regs()` fails, the probe function currently
> returns 0, skipping cleanup. 
> 
> Also, if an error occurs during the initialization of `pdev_display`,
> the allocated platform device `pdev_capture` is not released properly,
> leading to a memory leak.
> 
> Adjust error path handling to fix the leaks.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 43acb728bbc4 ("media: davinci: vpif: fix use-after-free on driver unbind")
> Signed-off-by: Dmitry Nikiforov <Dm1tryNk@yandex.ru>
> ---
> v2: also fix of_graph_get_endpoint_by_regs() error path (Johan Hovold).
>  drivers/media/platform/ti/davinci/vpif.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/ti/davinci/vpif.c b/drivers/media/platform/ti/davinci/vpif.c
> index a81719702a22..4839e34e5d29 100644
> --- a/drivers/media/platform/ti/davinci/vpif.c
> +++ b/drivers/media/platform/ti/davinci/vpif.c
> @@ -467,7 +467,8 @@ static int vpif_probe(struct platform_device *pdev)
>  	 */
>  	endpoint = of_graph_get_endpoint_by_regs(pdev->dev.of_node, 0, -1);
>  	if (!endpoint)
> -		return 0;
> +		ret = -ENODEV;
> +		goto err_put_rpm;

This looks wrong, since you're changing an early success path into a
probe failure.

Either way, that would need to go into a separate patch.

I was referring to the error handling for the pdev_display allocation
earlier, which also needs to deregister the capture device on errors
(and that can be done as part of this patch).

>  	of_node_put(endpoint);
>  
>  	/*
> @@ -527,6 +528,7 @@ static int vpif_probe(struct platform_device *pdev)
>  
>  err_put_pdev_display:
>  	platform_device_put(pdev_display);
> +	platform_device_del(pdev_capture);
>  err_put_pdev_capture:
>  	platform_device_put(pdev_capture);
>  err_put_rpm:

Johan

