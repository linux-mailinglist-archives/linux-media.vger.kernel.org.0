Return-Path: <linux-media+bounces-14504-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7459B91F054
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 09:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A07D288355
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 07:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5A1148303;
	Tue,  2 Jul 2024 07:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b3mSKSoC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CA074047;
	Tue,  2 Jul 2024 07:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719905778; cv=none; b=Bazxn9cJVahLYzYR9O6gHuH2+Wvv5ASGHHhe0HTN67DjWmt/yHNmdzoCg6hMSnp4ERMo0Bn+LhSwmclm6dOQN/2zs++48sGpl6gw1+ueg9ikY4PN4C4DHw4s/MNq3kBxShyftuTqEs6SyAwWHSl/d2sfH+SswOw0TjKjGYQFUM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719905778; c=relaxed/simple;
	bh=dZBewnO2eJ3q6W62v9wvtuBBmILmlaIcfyTpWAbKDjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=suLsKewN1wKw2g+L4Gc4hPMeDlbY2Kd7w+kxnLJLe31IYej0c7pkjULsA6k8JkPLLjoGPDCw4XrLg1kIM53WdF/STLUz6U8wGFz6JTuXPTqj/+cWaE8z4f47naYK0e6Zx9AiCaleZZkEkefHqfxAfKE9LjOP4nV00kXKKdM1jVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b3mSKSoC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pyrite.rasen.tech (h175-177-049-156.catv02.itscom.jp [175.177.49.156])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 773FC5A4;
	Tue,  2 Jul 2024 09:35:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719905748;
	bh=dZBewnO2eJ3q6W62v9wvtuBBmILmlaIcfyTpWAbKDjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b3mSKSoCHYKqzKRNoO6aq3GA+EXdz+p3i6nV1rYUoC6R4QIwPprb1iEq0t5UO+rFc
	 9sC33u3HWWQVTUwEtpojaOwDRjDd4S8p28RyHyxl+5tFvLVjY6ZLtEs2BTXLlv7php
	 +jCYMDvYSzCQ0qCEjApIPVZVl7keVABWjz/VJAn8=
Date: Tue, 2 Jul 2024 16:36:06 +0900
From: Paul Elder <paul.elder@ideasonboard.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: thp7312: Convert comma to semicolon
Message-ID: <ZoOt5iEC7NJoyTqV@pyrite.rasen.tech>
References: <20240702025711.1411715-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240702025711.1411715-1-nichen@iscas.ac.cn>

On Tue, Jul 02, 2024 at 10:57:11AM +0800, Chen Ni wrote:
> Replace a comma between expression statements by a semicolon.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  drivers/media/i2c/thp7312.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/thp7312.c b/drivers/media/i2c/thp7312.c
> index 19bd923a7315..75225ff5eff6 100644
> --- a/drivers/media/i2c/thp7312.c
> +++ b/drivers/media/i2c/thp7312.c
> @@ -1503,7 +1503,7 @@ static int __thp7312_flash_reg_read(struct thp7312_device *thp7312,
>  
>  	msgs[0].addr = client->addr;
>  	msgs[0].flags = 0;
> -	msgs[0].len = sizeof(thp7312_cmd_read_reg),
> +	msgs[0].len = sizeof(thp7312_cmd_read_reg);
>  	msgs[0].buf = (u8 *)thp7312_cmd_read_reg;
>  
>  	msgs[1].addr = client->addr;
> -- 
> 2.25.1
> 
> 

