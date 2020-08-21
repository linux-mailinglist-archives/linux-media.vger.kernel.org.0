Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA8D924D054
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 10:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727877AbgHUIHf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 04:07:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:35258 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727840AbgHUIHd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 04:07:33 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4DA4C2078D;
        Fri, 21 Aug 2020 08:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597997252;
        bh=LaMlJ8OWitxR94LYzLAW+/aCIQp70S1xt+7fdRecGkM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lvzNVTn3kK+R6rhX3v2r5kGGWFVmcbdZ4VJtDADKQTwh2Aes+1MU5H+LAHiN8OQ+H
         ket2nq3Gs0f+y7KGGrtoh30Khl+NLrKZB5sMVZ4StNWFcKM28IvThm25QAGBbg8Bw9
         DAQdnRs+m1kjIK5XxPYS+MsULpHW1cs7ylBpEn4U=
Date:   Fri, 21 Aug 2020 09:07:25 +0100
From:   Will Deacon <will@kernel.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     hch@lst.de, joro@8bytes.org, linux@armlinux.org.uk,
        inki.dae@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, m.szyprowski@samsung.com,
        agross@kernel.org, bjorn.andersson@linaro.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, vdumpa@nvidia.com,
        digetx@gmail.com, matthias.bgg@gmail.com, yong.wu@mediatek.com,
        geert+renesas@glider.be, magnus.damm@gmail.com, t-kristo@ti.com,
        s-anna@ti.com, laurent.pinchart@ideasonboard.com,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/18] iommu/arm-smmu: Remove arch/arm workaround
Message-ID: <20200821080724.GA20060@willie-the-truck>
References: <cover.1597931875.git.robin.murphy@arm.com>
 <ef39be82b98d2471c9e99c82d0eeda37ba30e4fa.1597931876.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef39be82b98d2471c9e99c82d0eeda37ba30e4fa.1597931876.git.robin.murphy@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 20, 2020 at 04:08:26PM +0100, Robin Murphy wrote:
> Now that arch/arm is wired up for default domains and iommu-dma, remove
> the add_device workaround.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 09c42af9f31e..4e52d8cb67dd 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -1164,17 +1164,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>  		return -ENXIO;
>  	}
>  
> -	/*
> -	 * FIXME: The arch/arm DMA API code tries to attach devices to its own
> -	 * domains between of_xlate() and probe_device() - we have no way to cope
> -	 * with that, so until ARM gets converted to rely on groups and default
> -	 * domains, just say no (but more politely than by dereferencing NULL).
> -	 * This should be at least a WARN_ON once that's sorted.
> -	 */
>  	cfg = dev_iommu_priv_get(dev);
> -	if (!cfg)
> -		return -ENODEV;
> -
>  	smmu = cfg->smmu;
>  
>  	ret = arm_smmu_rpm_get(smmu);

Acked-by: Will Deacon <will@kernel.org>

Will
