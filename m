Return-Path: <linux-media+bounces-15720-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C4C945823
	for <lists+linux-media@lfdr.de>; Fri,  2 Aug 2024 08:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F6BB1C22B94
	for <lists+linux-media@lfdr.de>; Fri,  2 Aug 2024 06:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00218481DB;
	Fri,  2 Aug 2024 06:45:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1263D6A;
	Fri,  2 Aug 2024 06:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722581158; cv=none; b=iibXH37m2GAk/+3zFp7kql7cISdK7jGMQNa960FEfx3ZoAI0hfxzHUyRLs9ECJ5I+IIfh4TFzstPOWq5xfNuXzWZYVxwSyqH4Syu5790mDRXsP+XTFHIqZsWCZym+kpuQZ6yHMdTHrNB7TyFYXHKNMQxrEjyuFC1Ei4NfXboV54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722581158; c=relaxed/simple;
	bh=SIDezU0TRMuXuPN3sd2ABidrGzrJd2DBwQ+Bn64OR74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jG4Dquutnw6Bv++cHJo5TW9yhkgRw3MdLJFGIEUEUiT5g695gG8ir/bQ2u1Vzon2gxMDAuanBCc07Pz2LvBuIppO4NH1uwkbBilBz+NeZV+YFd+BaV0GYYID6TCfBJ4bJWMPx6sfs92zEJwSoK7aI06hhHbyMhI2V3Jo3lsC5wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BAFBC32782;
	Fri,  2 Aug 2024 06:45:57 +0000 (UTC)
Message-ID: <b60f5ff5-628c-4902-a0da-c86ceb062868@xs4all.nl>
Date: Fri, 2 Aug 2024 08:45:55 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re:
To: Mikhail Lobanov <m.lobanov@rosalinux.ru>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
References: <20240801135649.76995-1-m.lobanov@rosalinux.ru>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240801135649.76995-1-m.lobanov@rosalinux.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/08/2024 15:54, Mikhail Lobanov wrote:
> Subject: [PATCH] cobalt:  adding a check to the driver

The subject might be here, but it is not in the actual subject line of the email!

> 
> This patch addresses an issue in cobalt-flash.c where the return value of the mtd_device_register function, 
> was not being checked. This omission could lead to unhandled errors if the registration fails.
> The patch adds error handling by checking the return value and logging an error message if registration fails.
> It ensures that the function returns the appropriate error code, improving error detection and the robustness 
> of the code.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 85756a069c55 ("[media] cobalt: add new driver")
> Signed-off-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
> ---
>  drivers/media/pci/cobalt/cobalt-flash.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/cobalt/cobalt-flash.c b/drivers/media/pci/cobalt/cobalt-flash.c
> index 1d3c64b4cf6d..06ad9aaeff1b 100644
> --- a/drivers/media/pci/cobalt/cobalt-flash.c
> +++ b/drivers/media/pci/cobalt/cobalt-flash.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> +/// SPDX-License-Identifier: GPL-2.0-only

Why?

>  /*
>   *  Cobalt NOR flash functions
>   *
> @@ -104,6 +104,10 @@ int cobalt_flash_probe(struct cobalt *cobalt)
>  	mtd->owner = THIS_MODULE;
>  	mtd->dev.parent = &cobalt->pci_dev->dev;
>  	mtd_device_register(mtd, NULL, 0);
> +        if (ret) {
> +        cobalt_err("Registering MTD device failed with error %d\n", ret);
> +        return ret;
> +    }

This is obviously wrong, and just as importantly, the caller of cobalt_flash_probe
doesn't check the return code either.

The indentation is wrong as well.

This is a really poor patch...

Regards,

	Hans

>  	return 0;
>  }
>  



