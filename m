Return-Path: <linux-media+bounces-43366-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB43ABAAA4A
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 23:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 619E0421C04
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 21:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD48265626;
	Mon, 29 Sep 2025 21:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RkrDBj/m"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE7C264614
	for <linux-media@vger.kernel.org>; Mon, 29 Sep 2025 21:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759180678; cv=none; b=JVX+Tx6JBpFd2PnKUwr77cltb0xbuiafS88B8gkzr+WP9WlXR8gDFFxVQL7fkl+LGei12hZkeSYwU+QLawPiMTLLYVOlp0OoWAnG0XEokomxLuXWAeHrvFdQWldtTTqeo3y4PkuZMTEgkvUnzomlh5YBufFB86mQBJLlBRReyJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759180678; c=relaxed/simple;
	bh=pkxsk78IHog0vv+IBSdn+sUVFtS8RfXXuKpUO43hniM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u3Q+lUwKM8rwxjy1oe8C7uRPYOYtqVt0rZrTPoN24FISkBmFP9pjOs5NPiKL69RbJc3swxz3cInvEgyn0qIxAmOPLLT8YUpjKaloReZ32ywNiOGnf+4vVEyeR9oX50pJ6zegNv5nWC2obiggrD5NL42fY64Pwk/o0xLCyuNGvmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RkrDBj/m; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759180676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tBEzt7vDi7cQon8pe4PxgzLkANUC3bHfRN0ntBJldU8=;
	b=RkrDBj/mQQk4PuIztoKVAa3F2+AgcdomwVixFGYufQg5Deu8Zu98l2VqcGwMvtnlXwzK2H
	cG9/BomPpzqSUCEikh5TuwzGREP/mQVr8dmbK1XBjwWdJsIQZE0NO5BIWnnTE64b90C+eF
	fxqqlsuusBPTCfMUM0qyIVLL7DJf8y0=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-eiCUt_73Pc6AgolES57YcQ-1; Mon, 29 Sep 2025 17:17:53 -0400
X-MC-Unique: eiCUt_73Pc6AgolES57YcQ-1
X-Mimecast-MFC-AGG-ID: eiCUt_73Pc6AgolES57YcQ_1759180673
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-42b18fa4b81so5192915ab.1
        for <linux-media@vger.kernel.org>; Mon, 29 Sep 2025 14:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759180673; x=1759785473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tBEzt7vDi7cQon8pe4PxgzLkANUC3bHfRN0ntBJldU8=;
        b=J6ioaDstLHzqGwJ9nmHqHs/yf6UsbliMyd8zzQ4yrcFfC1YP3U8HLzncpPMuvWkWXs
         3Xd24FHTbMgRcDBCsE6dK+Zil/Y6zcBLNB2rc24/62vnTbA837xK+SlB73RhUyuVLl62
         2Hyn94RJqIH6yBBJlA1k7KserA9jJYKBqyagBW90Bjz+fMn/yLylG1azEy0TIYhCGmdb
         qHutr5dGIiYdpQX+ibAN2Gu5W+LOAHaVd6qidjRrxLwDZ797FsPUNj2L83GtCk+QhyCr
         NWICbtyDYA+DlQyrLkcfAHwbeE7KQ8gYxa3MJ0iFWtFimUYZBDqw10QjmYIM3m814IWS
         waVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZMBuinOigZP35u+U9jrUHWqyMAme+8ImmQ6rArNXvBsD/nB3kfIZWoxN3A8bqd2OANqpH8zcEiY7EMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLa72oUEgFfgq2liBYnLxIwq0JWmZ402BaG/KEZUeVsHGwFhGr
	w7dmnKomAWW0k6ej0fFSSouzdgnQ2UMfEEVo2aVyL0aKqpN6aRqaTNbORx7bHFPt52Iw4MXqAaS
	kJJ5Zjqm31HZ7wtlgibAqlaAumoHOdEuGY4VvlUzGlBGxEm2X5nkgWpwZr0NJ7Erc
X-Gm-Gg: ASbGncuZcxkUUKSEgY7WuvzBHPJrATrNZvhHUH19ZPe40j9CuBdrvJvmAjrWglbOZ9t
	Z67Am+uJJtSgHxchldtqrMwc5LKLaT9YVnsQhRAMJK9UvRxV3wsytkqT5zlG43z3tFEEMmBHyiQ
	6dxR8kaeXCUBgJYAbMa6AVF/aMDacN/frmtAHSDuft6fvwqxRkQ5B4uZHZTSsVhIMVAobmDs5G2
	2yK57ShDiuPm9BHJjpuX7pspxb3KZSpo0Cg52jXlFUmz3i/2vfwz2G0vJWHnVm4tZdLHIW7kt1s
	sAN/9TaGfX8QKLVXWx5lzmL50fiw65Zz7pmzDqXMwM8=
X-Received: by 2002:a05:6e02:1523:b0:425:9068:4ff with SMTP id e9e14a558f8ab-425955c8eb5mr97782405ab.1.1759180672726;
        Mon, 29 Sep 2025 14:17:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTF4nahZRRX2gicTqxhxWdWKeUzRDCgsQQuCRfxHGJ4HNrczL75firr5hrFe4LKeaKRuPCNA==
X-Received: by 2002:a05:6e02:1523:b0:425:9068:4ff with SMTP id e9e14a558f8ab-425955c8eb5mr97782155ab.1.1759180672251;
        Mon, 29 Sep 2025 14:17:52 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425c05476fasm62141985ab.43.2025.09.29.14.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 14:17:51 -0700 (PDT)
Date: Mon, 29 Sep 2025 15:17:49 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Leon Romanovsky <leonro@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Jens Axboe <axboe@kernel.dk>, Joerg Roedel
 <joro@8bytes.org>, kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Sumit
 Semwal <sumit.semwal@linaro.org>, Vivek Kasireddy
 <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v4 10/10] vfio/pci: Add dma-buf export support for MMIO
 regions
Message-ID: <20250929151749.2007b192.alex.williamson@redhat.com>
In-Reply-To: <53f3ea1947919a5e657b4f83e74ca53aa45814d4.1759070796.git.leon@kernel.org>
References: <cover.1759070796.git.leon@kernel.org>
	<53f3ea1947919a5e657b4f83e74ca53aa45814d4.1759070796.git.leon@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 28 Sep 2025 17:50:20 +0300
Leon Romanovsky <leon@kernel.org> wrote:
> +static int validate_dmabuf_input(struct vfio_pci_core_device *vdev,
> +				 struct vfio_device_feature_dma_buf *dma_buf,
> +				 struct vfio_region_dma_range *dma_ranges,
> +				 struct p2pdma_provider **provider)
> +{
> +	struct pci_dev *pdev = vdev->pdev;
> +	u32 bar = dma_buf->region_index;
> +	resource_size_t bar_size;
> +	u64 sum;
> +	int i;
> +
> +	if (dma_buf->flags)
> +		return -EINVAL;
> +	/*
> +	 * For PCI the region_index is the BAR number like  everything else.
> +	 */
> +	if (bar >= VFIO_PCI_ROM_REGION_INDEX)
> +		return -ENODEV;
> +
> +	*provider = pcim_p2pdma_provider(pdev, bar);
> +	if (!provider)

This needs to be IS_ERR_OR_NULL() or the function needs to settle on a
consistent error return value regardless of CONFIG_PCI_P2PDMA.

> +		return -EINVAL;
> +
> +	bar_size = pci_resource_len(pdev, bar);

We get to this feature via vfio_pci_core_ioctl_feature(), which is used
by several variant drivers, some of which mangle the BAR size exposed
to the user, ex. hisi_acc.  I'm afraid this might actually be giving
dmabuf access to a portion of the BAR that isn't exposed otherwise.

> +	for (i = 0; i < dma_buf->nr_ranges; i++) {
> +		u64 offset = dma_ranges[i].offset;
> +		u64 len = dma_ranges[i].length;
> +
> +		if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len))
> +			return -EINVAL;
> +
> +		if (check_add_overflow(offset, len, &sum) || sum > bar_size)
> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
> +				  struct vfio_device_feature_dma_buf __user *arg,
> +				  size_t argsz)
> +{
> +	struct vfio_device_feature_dma_buf get_dma_buf = {};
> +	struct vfio_region_dma_range *dma_ranges;
> +	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> +	struct p2pdma_provider *provider;
> +	struct vfio_pci_dma_buf *priv;
> +	int ret;
> +
> +	ret = vfio_check_feature(flags, argsz, VFIO_DEVICE_FEATURE_GET,
> +				 sizeof(get_dma_buf));
> +	if (ret != 1)
> +		return ret;
> +
> +	if (copy_from_user(&get_dma_buf, arg, sizeof(get_dma_buf)))
> +		return -EFAULT;
> +
> +	if (!get_dma_buf.nr_ranges)
> +		return -EINVAL;
> +
> +	dma_ranges = memdup_array_user(&arg->dma_ranges, get_dma_buf.nr_ranges,
> +				       sizeof(*dma_ranges));
> +	if (IS_ERR(dma_ranges))
> +		return PTR_ERR(dma_ranges);
> +
> +	ret = validate_dmabuf_input(vdev, &get_dma_buf, dma_ranges, &provider);
> +	if (ret)
> +		return ret;

goto err_free_ranges;

Thanks,
Alex


