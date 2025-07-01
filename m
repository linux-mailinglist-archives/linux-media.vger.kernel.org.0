Return-Path: <linux-media+bounces-36393-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB8FAEF2C2
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 11:10:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1A5F16D420
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 09:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D44226B740;
	Tue,  1 Jul 2025 09:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f85xjx3X"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1E1220F36;
	Tue,  1 Jul 2025 09:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751360991; cv=none; b=hD5fVMRgWZiyA55HaOueyvyPjaMiAzukdcRpstFZ28V28eyc29NEcfLNcTbCCkHJMjAtf8vgxs/XwyQnC5t9XYaajmXiA6B7DX4M3qBYBUjO1iVfblS6BjQaOXIs2mOFN7yTP9Vx/U7cLGy761SRlzfRlMg4U1dj7v0RvEfVuwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751360991; c=relaxed/simple;
	bh=uA087uJ67e7A8AlIZXGViEZobK9A8ZE5VGDbvUT8jLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tC6eDUkGG3SZWH5uqhC0vPku49gy2+tkeD07h/0FJO0ylYQ4szmLiETwqIyCQLht6Tvw5N01zH1muuCaYKfmF9+JqK2rK2nNLp+tr9rmvuD7dQw3U4CU4ZGbIHjwH3uwCmoeX8OKn/3+EX4VYtJH3Bp9L4VNurIXOkyXyHtLTyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=f85xjx3X; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 81D70C74;
	Tue,  1 Jul 2025 11:09:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751360966;
	bh=uA087uJ67e7A8AlIZXGViEZobK9A8ZE5VGDbvUT8jLk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f85xjx3XHd6cdXvcO5zBY8dLuwPVDtSPBrBTePAVCxMSQs3MfcXl60zFehajMNz4X
	 owdv62riaGJOQdBkEAJHUzH0Xxlqi1S5GNrT4fydrhbZkEBaNf0G43cnAA2RJIhW0A
	 K+tcJjdMvPnr7BU+/4a4JSayR+2rVC7sA3aZTvns=
Message-ID: <d7f001a8-b5b4-4174-ad27-3d0739d1f375@ideasonboard.com>
Date: Tue, 1 Jul 2025 10:09:44 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: pisp_be: Use clamp() and define max sizes
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250701-pispbe-clamp-v1-1-31243db3439b@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <20250701-pispbe-clamp-v1-1-31243db3439b@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jacopo, thanks for the patch

On 01/07/2025 09:55, Jacopo Mondi wrote:
> Use the clamp() from minmax.h and provide a define for the max size as
> they will be used in sequent patches.

s/sequent/subsequent


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>   drivers/media/platform/raspberrypi/pisp_be/pisp_be.c  | 11 +++++++----
>   include/uapi/linux/media/raspberrypi/pisp_be_config.h |  9 +++++----
>   2 files changed, 12 insertions(+), 8 deletions(-)
>
>
> ---
> base-commit: 35392e855abf7d02ad3b061cbc75c7c7c37f0577
> change-id: 20250623-pispbe-clamp-4b33011d0e85
>
> Best regards,
>
> diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> index 7596ae1f7de6671484d4d351015b234829f642d4..ac5840b4be478ccdd7da9d6d0745649e0c1b2b6f 100644
> --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> @@ -9,6 +9,7 @@
>   #include <linux/io.h>
>   #include <linux/kernel.h>
>   #include <linux/lockdep.h>
> +#include <linux/minmax.h>
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
> @@ -1114,10 +1115,12 @@ static void pispbe_try_format(struct v4l2_format *f, struct pispbe_node *node)
>   	f->fmt.pix_mp.pixelformat = fmt->fourcc;
>   	f->fmt.pix_mp.num_planes = fmt->num_planes;
>   	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
> -	f->fmt.pix_mp.width = max(min(f->fmt.pix_mp.width, 65536u),
> -				  PISP_BACK_END_MIN_TILE_WIDTH);
> -	f->fmt.pix_mp.height = max(min(f->fmt.pix_mp.height, 65536u),
> -				   PISP_BACK_END_MIN_TILE_HEIGHT);
> +	f->fmt.pix_mp.width = clamp(f->fmt.pix_mp.width,
> +				    PISP_BACK_END_MIN_TILE_WIDTH,
> +				    PISP_BACK_END_MAX_TILE_WIDTH);
> +	f->fmt.pix_mp.height = clamp(f->fmt.pix_mp.height,
> +				     PISP_BACK_END_MIN_TILE_HEIGHT,
> +				     PISP_BACK_END_MAX_TILE_HEIGHT);
>   
>   	/*
>   	 * Fill in the actual colour space when the requested one was
> diff --git a/include/uapi/linux/media/raspberrypi/pisp_be_config.h b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
> index cbeb714f4d61ad53162c0450f2303431a5958040..2ad3b90684d7be80776af75b5c5009f7b677f466 100644
> --- a/include/uapi/linux/media/raspberrypi/pisp_be_config.h
> +++ b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
> @@ -21,10 +21,11 @@
>   /* preferred byte alignment for outputs */
>   #define PISP_BACK_END_OUTPUT_MAX_ALIGN 64u
>   
> -/* minimum allowed tile width anywhere in the pipeline */
> -#define PISP_BACK_END_MIN_TILE_WIDTH 16u
> -/* minimum allowed tile width anywhere in the pipeline */
> -#define PISP_BACK_END_MIN_TILE_HEIGHT 16u
> +/* minimum allowed tile sizes anywhere in the pipeline */
> +#define PISP_BACK_END_MIN_TILE_WIDTH	16u
> +#define PISP_BACK_END_MIN_TILE_HEIGHT	16u
> +#define PISP_BACK_END_MAX_TILE_WIDTH	65536u
> +#define PISP_BACK_END_MAX_TILE_HEIGHT	65536u
>   
>   #define PISP_BACK_END_NUM_OUTPUTS 2
>   #define PISP_BACK_END_HOG_OUTPUT 1

