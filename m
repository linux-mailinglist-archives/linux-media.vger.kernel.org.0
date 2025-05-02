Return-Path: <linux-media+bounces-31588-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FC6AA73F1
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 15:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C63C3A2101
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 13:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C282255E30;
	Fri,  2 May 2025 13:37:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3CD22550B8;
	Fri,  2 May 2025 13:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746193019; cv=none; b=MqbikAjx3vtal844HvP3RGLftNjayMBrpUYdtjrD+7Hr+1Zw40pyLSMfZW4VeO4puDndtU8QJY/9Uzh9kEWuQFYbPF1EhMZiPFahmWGwV7NY1mHA1jixG9utivlkdz8J98a0ZoL4rYfAzwkc03GVTTQl6txT59EhQWoJmZw6osE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746193019; c=relaxed/simple;
	bh=RA1NupmOvhzy736pFIXPM3R7XMzScOE633fPAoDKJ/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M8wrE02sxTOL4y/Y/sSQgRBuKNFu6IB19F4w3A5p04vdGREZkkW3jQv7rTinm1HuVgBFKwr6UlzCHgaN4BGjYV58hyTz7kMCEyDMGvq9yRqpipMcgkY5jtPj7Cuau//gm3cO0n/JgTy7NxeKUgJFZzWQ9PbBcLa9k3lg+uY7+Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 745AF1688;
	Fri,  2 May 2025 06:36:48 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F6A53F66E;
	Fri,  2 May 2025 06:36:52 -0700 (PDT)
Message-ID: <6236d3cb-fbf2-4a41-a84a-276aa8079b9a@arm.com>
Date: Fri, 2 May 2025 14:36:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/14] tee: tee_device_alloc(): copy dma_mask from
 parent device
To: Jens Wiklander <jens.wiklander@linaro.org>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org,
 linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
 <20250502100049.1746335-2-jens.wiklander@linaro.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250502100049.1746335-2-jens.wiklander@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/05/2025 10:59 am, Jens Wiklander wrote:
> If a parent device is supplied to tee_device_alloc(), copy the dma_mask
> field into the new device. This avoids future warnings when mapping a
> DMA-buf for the device.

That also sounds dodgy. If the parent device is the hardware device 
physically performing the DMA, then that is the device which should be 
passed to the DMA API. Trying to copy random bits of one device's 
configuration to another device and hoping it will work is not robust - 
not only is DMA-relevant information all over the place, including in 
archdata and/or bus/IOMMU driver-private data, but it can also opens up 
a whole can of subtle lifecycle issues...

> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> Reviewed-by: Sumit Garg <sumit.garg@kernel.org>
> ---
>   drivers/tee/tee_core.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index d113679b1e2d..685afcaa3ea1 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -922,6 +922,8 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
>   	teedev->dev.class = &tee_class;
>   	teedev->dev.release = tee_release_device;
>   	teedev->dev.parent = dev;
> +	if (dev)
> +		teedev->dev.dma_mask = dev->dma_mask;

...for instance, I don't see any obvious guarantee that "dev" can't go 
away during the lifetime of "teedev" and leave this pointer dangling.

Thanks,
Robin.

>   
>   	teedev->dev.devt = MKDEV(MAJOR(tee_devt), teedev->id);
>   

