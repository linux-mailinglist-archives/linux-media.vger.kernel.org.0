Return-Path: <linux-media+bounces-50574-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 19436D1A1BD
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 17:11:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72ED3303C20D
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 16:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E0638946D;
	Tue, 13 Jan 2026 16:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mn5SO9lb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8022C236B;
	Tue, 13 Jan 2026 16:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768320658; cv=none; b=jt0CVL0ArE+n7O/mA5pL2XihULpjmpWcIqPaj5UjEd3kJiyxtF/1eUj0V30m832xECbTczh4l7zhDsXckBY0G31SJTRgkSGASzrQqi0LvHE+vuUH/3X4BATnsW9GbDgoVigKFiRmle8BULjOC6d5JYOAB0Seit3rXVSPp9cTqX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768320658; c=relaxed/simple;
	bh=48Es2S409yTlI0s3L/SUlUr5jxhH+oDf+zUm7CAM85k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eje8HprUnq/CA6mjtVwRpbSiU9DzotNPFv9/cF91PYVo3hUH0xsxFkFn5HlNFSxo2Nk5prPfmmfF9z5N1CXReq18UIOxpL6+BZHHyXdnXmYXP7JuKSJHLB61lbUZe5FpSrPtIRB9tzCqj5vtzqtcw4yrO4t6IbtFCVcELXy3dI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mn5SO9lb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA060C116C6;
	Tue, 13 Jan 2026 16:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768320658;
	bh=48Es2S409yTlI0s3L/SUlUr5jxhH+oDf+zUm7CAM85k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mn5SO9lbfHAajh8SBuC1H52zRDk2i1cJjIXW4qSymf39CjYWseqUy+bq7qbrv1v35
	 Okv56wH8VLF1fAJoHtVOrHuuNNCxiTUxSkOMtvnK7PQ8oF7K01s2f5l2U4OYv+M845
	 uIhdzWAuIeGrpzS29zWnuC5JY688XqjDUTY4Ji8KI4AOojEQ8+0QMy3dw6Z9MaFxhK
	 ANsgSFDkVCihoDbdNvSzy9o3M48u9zHfM5BLWecw7+Fi8XnSX20vvdyEa7IyOZsUhv
	 LFJONDt1lusgdG+GL3mZxhOY0e0El8obSA7NESf5HW/4M83g5dCiVkSDZV88sNsjy2
	 cG2Ruju+DQ6lQ==
Date: Tue, 13 Jan 2026 16:10:51 +0000
From: Will Deacon <will@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
	mchehab@kernel.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v11 3/7] iommu: Add verisilicon IOMMU driver
Message-ID: <aWZui-rn5RDPwpEO@willie-the-truck>
References: <20260107101005.84039-1-benjamin.gaignard@collabora.com>
 <20260107101005.84039-4-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107101005.84039-4-benjamin.gaignard@collabora.com>

Hi Benjamin,

Thanks for posting a v11.

On Wed, Jan 07, 2026 at 11:09:53AM +0100, Benjamin Gaignard wrote:
> The Verisilicon IOMMU hardware block can be found in combination
> with Verisilicon hardware video codecs (encoders or decoders) on
> different SoCs.
> Enable it will allow us to use non contiguous memory allocators
> for Verisilicon video codecs.
> If both decoder and this iommu driver are compiled has modules
> there is undefined symboles issues so this iommu driver could
> only be compiled has built-in.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> changes in version 11:
> - Fix dependency issue when decoder driver is build as module.
> 
>  drivers/iommu/Kconfig     |  11 +
>  drivers/iommu/Makefile    |   1 +
>  drivers/iommu/vsi-iommu.c | 808 ++++++++++++++++++++++++++++++++++++++
>  include/linux/vsi-iommu.h |  21 +
>  4 files changed, 841 insertions(+)
>  create mode 100644 drivers/iommu/vsi-iommu.c
>  create mode 100644 include/linux/vsi-iommu.h

Based on your reply to v9:

https://lore.kernel.org/all/0eff8b1a-c45f-47b1-a871-59f4a0101f0f@collabora.com/

I took another look at this to see whether it had changed significantly
from v6 when compared to the rockchip driver. Sadly, they still look
very similar to me and I continue to suspect that the hardware is a
derivative. I really don't understand why having a shared implementation
of the default domain ops is difficult or controversial. Have you tried
to write it?

However, given that nobody from the Rockchip side has contributed to the
discussion and you claim that this is a distinct piece of IP, I don't
want to block the merging of the driver by leaving the conversation
hanging.

There is still one thing I don't understand (which, amusingly, the
rockchip driver doesn't seem to suffer from):

> +static void vsi_iommu_flush_tlb_all(struct iommu_domain *domain)
> +{
> +	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
> +	struct list_head *pos;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&vsi_domain->lock, flags);
> +
> +	list_for_each(pos, &vsi_domain->iommus) {
> +		struct vsi_iommu *iommu;
> +		int ret;
> +
> +		iommu = list_entry(pos, struct vsi_iommu, node);
> +		ret = pm_runtime_resume_and_get(iommu->dev);
> +		if (ret < 0)
> +			continue;
> +
> +		spin_lock(&iommu->lock);
> +
> +		writel(VSI_MMU_BIT_FLUSH, iommu->regs + VSI_MMU_FLUSH_BASE);
> +		writel(0, iommu->regs + VSI_MMU_FLUSH_BASE);
> +
> +		spin_unlock(&iommu->lock);
> +		pm_runtime_put_autosuspend(iommu->dev);
> +	}
> +
> +	spin_unlock_irqrestore(&vsi_domain->lock, flags);
> +}

[...]

> +static const struct iommu_ops vsi_iommu_ops = {
> +	.identity_domain = &vsi_identity_domain,
> +	.release_domain = &vsi_identity_domain,
> +	.domain_alloc_paging = vsi_iommu_domain_alloc_paging,
> +	.of_xlate = vsi_iommu_of_xlate,
> +	.probe_device = vsi_iommu_probe_device,
> +	.release_device = vsi_iommu_release_device,
> +	.device_group = generic_single_device_group,
> +	.owner = THIS_MODULE,
> +	.default_domain_ops = &(const struct iommu_domain_ops) {
> +		.attach_dev		= vsi_iommu_attach_device,
> +		.map_pages		= vsi_iommu_map,
> +		.unmap_pages		= vsi_iommu_unmap,
> +		.flush_iotlb_all	= vsi_iommu_flush_tlb_all,

This has no callers and so your unmap routine appears to be broken.

Will

