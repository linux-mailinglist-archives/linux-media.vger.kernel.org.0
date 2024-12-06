Return-Path: <linux-media+bounces-22806-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 690DC9E7695
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 18:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4924D166185
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 17:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B831487D1;
	Fri,  6 Dec 2024 17:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hr28/stZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933F4819
	for <linux-media@vger.kernel.org>; Fri,  6 Dec 2024 17:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733504453; cv=none; b=lbpTEFB46xV1fETRq4KpuZO3LKF9V3AXjUBERx4SfePL+dyIHaCcXIF00fdWtMy8wI1secSAoxQ+KdUb6choVE7m9oO3NfQay/h44m+sy6XpG1yplDyyYNYDNtsMh/7xz2f26vMu1CbuRt4YSHGCHYpifeXSbCuF/c/gD0s08Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733504453; c=relaxed/simple;
	bh=AlM2HQKnhAqkHaHldpOlnbg/9RAFWWXbJZ22NutgHjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rwj+5j9EXTL7Z7biWwX+dysA6MA+1DansOEXDqMxBhUtbZKK/wcNcYglMnVejynWsA46BiT4RPXscB0ig0ZQQAYYwPSbalegLHjwHJG7KikGK/+o6ZCS8WdxR0UB6Y6DW4xg+chXV+Ss/yrRmVG0xiVyC/Ub2VsPNYtNF7PlYdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hr28/stZ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-215b13e9ccbso22527925ad.0
        for <linux-media@vger.kernel.org>; Fri, 06 Dec 2024 09:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733504451; x=1734109251; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VxGgnsUUhsUmBPGq3PK5RvOu24w5vOz9HNq8JtdHRk0=;
        b=hr28/stZGSj8EyyAKfBXiS6CIxiXtOxLxXIay3Bzmf69UJwds0mDLQNSJovbemH1XR
         q60Zx2jorPxkrChIZj+LFOE/TLhY6HF6d4Bt8AkwfkELfag1TNPnohQWuydWE7rI1bam
         MeTogAHKYuYfi44Z5BOiVGY35+6KN6CNGnzRFwKjjcQYt+baYFqz9DkfReach/6Uktjb
         NgvUdyzKjURWw9EEW9gfbQPLYzk3jd+ZqEL2gJn2kRTgm6wknQBSmb90KvLLJS6ru6KX
         NOhpULTf5pzXdSHP/eoT1BDl+CByrA0bmRLHb0jOkNPn60ksK6m9v0TNk1g7H6oiTm9t
         v6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733504451; x=1734109251;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxGgnsUUhsUmBPGq3PK5RvOu24w5vOz9HNq8JtdHRk0=;
        b=gfCyMhrRzG0Ky+IR/THyG59tkgwmgmv0TZlOHxKlRdhNzUN8yeu2QKt3JfX2ZNRwGE
         MZHahVx5O4eMnbieQeSMRH8o/qFK3751HQ63cWJTZ/GPiXSZDKlyUag+5PbFPC3+Il9y
         ep0urg9J2n6o5bFzu0e77V6SS31QLJaIfhHxSClF5vlRCXkyTInmMqlL48BnuyeopNzy
         vUSB/RziKFvYshkP3t11Ty90mthSeh+CCyJ6/BhMK9AwyJrbTjTe+woDSvLokxVYJE1Y
         lpStj2KlGI4H6Iwy385VP95kGvpbT+vtItrLHSKQ6kg6cBIFxptLY0Doia7MfqwRad1T
         OlaQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8s7Q+CPbxqsyjRe4qrWyUBHQDdkIw3AJnbY9xSC0tRPaEh/jeXANUecFEHtJ5ZP4s004BcP5HYmT3cw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh0h10Vj+21zBvip064a1tZ+H8ZPKZ37wE0AfGrJr9A8Ns3/zJ
	vkoSKpcUJxruy3b82N3NvX3ul4sA2zq9oUlQcIbfy23w/4okgfIyBMOxEEsm4gQ=
X-Gm-Gg: ASbGncvmRTR71IdtfDAl6KIg7yyRqR2b9ZDFkMWLi/XSvYfMiaumBXveTr5a4UZRShh
	T+Ozn9l/wGDbW8mvU0GTxLy4X74sAmRnULtf0oONKx3Wwbod0jpG66RoDYmIuG0bZXmsjK6mWkq
	i1SzIxrjky66qG1ydtgzqtjm5/gJ7hpC/nFhIFAMA1MAfCHPFJhUmPIr7Gy6Jd4cOAOm1uRFau5
	xcyk6ZE6Xd2km9c8mnvq4LZENYLM2AfEpWPhoPUXdyGaR9+jO5IIA==
X-Google-Smtp-Source: AGHT+IHio60POCQwXssDzXQZiYwth3e7luERgW9BPvBLeRV3WmOnlH5qo/y/wAO+5VJ4oh5kZtaUUw==
X-Received: by 2002:a17:902:db04:b0:215:9f5a:a236 with SMTP id d9443c01a7336-21614d1edeamr35753815ad.6.1733504450793;
        Fri, 06 Dec 2024 09:00:50 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:85b9:bc9c:71ff:f6c3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21627341853sm1522445ad.240.2024.12.06.09.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:00:50 -0800 (PST)
Date: Fri, 6 Dec 2024 10:00:47 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: joro@8bytes.org, will@kernel.org, laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org, andersson@kernel.org, hns@goldelico.com,
	b-padhi@ti.com, andreas@kemnade.info, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 1/4] remoteproc/omap: Handle ARM dma_iommu_mapping
Message-ID: <Z1Mtv9cEobzvMSsS@p14s>
References: <cover.1730136799.git.robin.murphy@arm.com>
 <6186e311cb6f64a787f87fd41e49a73f409b789c.1730136799.git.robin.murphy@arm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6186e311cb6f64a787f87fd41e49a73f409b789c.1730136799.git.robin.murphy@arm.com>

On Mon, Oct 28, 2024 at 05:58:35PM +0000, Robin Murphy wrote:
> It's no longer practical for the OMAP IOMMU driver to trick
> arm_setup_iommu_dma_ops() into ignoring its presence, so let's use the
> same tactic as other IOMMU API users on 32-bit ARM and explicitly kick
> the arch code's dma_iommu_mapping out of the way to avoid problems.
> 
> Fixes: 4720287c7bf7 ("iommu: Remove struct iommu_ops *iommu from arch_setup_dma_ops()")
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/remoteproc/omap_remoteproc.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index 9ae2e831456d..3260dd512491 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -37,6 +37,10 @@
>  
>  #include <linux/platform_data/dmtimer-omap.h>
>  
> +#ifdef CONFIG_ARM_DMA_USE_IOMMU
> +#include <asm/dma-iommu.h>
> +#endif
> +
>  #include "omap_remoteproc.h"
>  #include "remoteproc_internal.h"
>  
> @@ -1323,6 +1327,19 @@ static int omap_rproc_probe(struct platform_device *pdev)
>  	/* All existing OMAP IPU and DSP processors have an MMU */
>  	rproc->has_iommu = true;
>  
> +#ifdef CONFIG_ARM_DMA_USE_IOMMU
> +	/*
> +	 * Throw away the ARM DMA mapping that we'll never use, so it doesn't
> +	 * interfere with the core rproc->domain and we get the right DMA ops.
> +	 */
> +	if (pdev->dev.archdata.mapping) {
> +		struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(&pdev->dev);
> +
> +		arm_iommu_detach_device(&pdev->dev);
> +		arm_iommu_release_mapping(mapping);
> +	}
> +#endif
> +

Despite acknowledging this patch I never applied it, something I have corrected
now.

Thanks for Beleswar for bringing this to my attention.

Regards,
Mathieu

>  	ret = omap_rproc_of_get_internal_memories(pdev, rproc);
>  	if (ret)
>  		return ret;
> -- 
> 2.39.2.101.g768bb238c484.dirty
> 

