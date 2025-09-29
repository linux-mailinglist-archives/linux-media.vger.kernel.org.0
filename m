Return-Path: <linux-media+bounces-43365-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F18BAAA38
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 23:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D68F421E72
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 21:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7FDE261B64;
	Mon, 29 Sep 2025 21:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XpgoV3Qr"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9521925D527
	for <linux-media@vger.kernel.org>; Mon, 29 Sep 2025 21:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759180674; cv=none; b=BFtx+2oDiBcGilp1RsxcRHpkUIyId6iqyFSQ8hyt3iFbP97JpblGm1VfwoyZaxOOM4q11dgCXnpqlhaWidMMNBkTU5v1JceUflOLZcICoidSoA1n7zwLwegJ0c+yZzY6OZHo3tZzLOg8fArsWynwZ61MJ/Nis6G6hgrvBXK/V0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759180674; c=relaxed/simple;
	bh=0oSgxEnNwZj0iK2MMd9XdDjcPgJYwsCBsAngjqYdLuk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RWevIFXmBFxDA+H4kzFHrp2GyX4LHcb04c9tRPjn0X55fxRHOMtBlnG4F8JqaAz7m1NSJOXOf7BsYAVAhDigLe50vuL9xoekCaUy0wMu3qvY4pWRg9NF1V7ws/F5e80p5gp7YCUuktuGL4N0C0ZcleBO/MUASmHB+bNML78e5/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XpgoV3Qr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759180671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pary30BmU4/NqakwYdG1eNkY0RiL1NyFW4TmIsuJ5GE=;
	b=XpgoV3Qr+mnYCLm6jwRGLjCyWYdKYjmCapj/2ujAT6QGjlTomXqki70y6hgML/NNBV/vQ/
	QMjTFkYcdkHI8fL1yBRXNondQrMXCguvf5a+Dgs0WSciJAj7tq/0SIkM92wfNnvcdxuRon
	chWJ7q6mTzUzBxNvZ4VH+cb9Yh0KXsc=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-v0jeBrBgPC2yjVeRwkHLWw-1; Mon, 29 Sep 2025 17:17:49 -0400
X-MC-Unique: v0jeBrBgPC2yjVeRwkHLWw-1
X-Mimecast-MFC-AGG-ID: v0jeBrBgPC2yjVeRwkHLWw_1759180668
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-42b2a51fab6so3496325ab.0
        for <linux-media@vger.kernel.org>; Mon, 29 Sep 2025 14:17:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759180668; x=1759785468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pary30BmU4/NqakwYdG1eNkY0RiL1NyFW4TmIsuJ5GE=;
        b=VrEYERXhsLFaSaNWuKi5G/rIsKeAgYXwh+L1afODiteKHx5tVeP3dPmv4cSJW4SqPr
         VN40IFJyah8OOkTLO3LK2VV+PklOQnkLlLj0B6KeuT1MDnbIN428sRB49q07z4MnaYRz
         A+W+0OFPpE0ZUo/px00DIiGf70ZXcRxDRP7vE6JP7EhSHKRQmAfYoTQ4VLlMTIR4chJQ
         HAp6VkS3ahx0z4LfTYPjhDhCLlih6/FvzPzwiPAbkkAUSuhU+24jyIsXlX2qkHgbEdzq
         TwIvZPzZWxMFEOsDPsKXRhJumwUB1RnLEqnQhvKaeZoNDGA1YgxeVRFCi6fETj/OdEoE
         S8uw==
X-Forwarded-Encrypted: i=1; AJvYcCX8BlJFJoXNOOnBhRChvC6HaX9LAbl4J6wG/K7z1K0tL0oFNYgX4IIK697d/lOFqQpz011gBVY3FqtUjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKaC9IH3WqsJAgoMHIQC0UV2Vlw63qF87nXvrMkj+UKbFxSHui
	vkidM8DC3o1/A7MNAWGed5SHxBZt0aQQsQGlX+0yRM6QfbClf8YvSysH0E4KoWjTHGrSc1M4WCN
	Qju9XksIRZodyFZxJ6jBgPaPH0GtwO8F7p5W+HISOaGAHECa3bzvrKWPuWHOpzMGw
X-Gm-Gg: ASbGncutMVFe1qUDcc3/OS1DKfvaMwQLtxVVicqrbL6yHYzxhaMpjV0z3C2B8Vic4u0
	FAKNAPQ3YVHiX6PkYYE6nABqRex+nyHx8MibbAStUnmZUyUC4xQEIxWO7FAonWoJICYf45bdz5/
	4YJi0twb4CTaUOqaU0AX6dklEH0R5UMFKBT3KicEgqF4vKkvqCLiABWOMGR/KtBQaSr5wOYpo6d
	jq0TJpjGwfMQOEvu5FJ2Y37HdaufIFfdgDLFkKHeAUnY64jFk93NsL2l9GDcFxvyuinncIrJLWr
	zHbOrMbi6Fw2h13D66An1FgbW8qtYWyFihzMMTDGcec=
X-Received: by 2002:a05:6e02:1b08:b0:424:6c8e:6187 with SMTP id e9e14a558f8ab-425955e4dfdmr95833945ab.2.1759180668410;
        Mon, 29 Sep 2025 14:17:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHE31/4ZuuqxcHY5C8RvKg6dnDpxm6QWjHiIpet9IRXNGlsIsGmjCxy18kHCIW8dgbK0MWZ9w==
X-Received: by 2002:a05:6e02:1b08:b0:424:6c8e:6187 with SMTP id e9e14a558f8ab-425955e4dfdmr95833605ab.2.1759180667942;
        Mon, 29 Sep 2025 14:17:47 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5753c50a188sm920778173.31.2025.09.29.14.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 14:17:46 -0700 (PDT)
Date: Mon, 29 Sep 2025 15:17:45 -0600
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
Subject: Re: [PATCH v4 08/10] vfio/pci: Enable peer-to-peer DMA transactions
 by default
Message-ID: <20250929151745.439be1ec.alex.williamson@redhat.com>
In-Reply-To: <ac8c6ccd792e79f9424217d4bca23edd249916ca.1759070796.git.leon@kernel.org>
References: <cover.1759070796.git.leon@kernel.org>
	<ac8c6ccd792e79f9424217d4bca23edd249916ca.1759070796.git.leon@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 28 Sep 2025 17:50:18 +0300
Leon Romanovsky <leon@kernel.org> wrote:

> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Make sure that all VFIO PCI devices have peer-to-peer capabilities
> enables, so we would be able to export their MMIO memory through DMABUF,
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/vfio/pci/vfio_pci_core.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index 7dcf5439dedc..608af135308e 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -28,6 +28,9 @@
>  #include <linux/nospec.h>
>  #include <linux/sched/mm.h>
>  #include <linux/iommufd.h>
> +#ifdef CONFIG_VFIO_PCI_DMABUF
> +#include <linux/pci-p2pdma.h>
> +#endif
>  #if IS_ENABLED(CONFIG_EEH)
>  #include <asm/eeh.h>
>  #endif
> @@ -2085,6 +2088,7 @@ int vfio_pci_core_init_dev(struct vfio_device *core_vdev)
>  {
>  	struct vfio_pci_core_device *vdev =
>  		container_of(core_vdev, struct vfio_pci_core_device, vdev);
> +	int __maybe_unused ret;
>  
>  	vdev->pdev = to_pci_dev(core_vdev->dev);
>  	vdev->irq_type = VFIO_PCI_NUM_IRQS;
> @@ -2094,6 +2098,11 @@ int vfio_pci_core_init_dev(struct vfio_device *core_vdev)
>  	INIT_LIST_HEAD(&vdev->dummy_resources_list);
>  	INIT_LIST_HEAD(&vdev->ioeventfds_list);
>  	INIT_LIST_HEAD(&vdev->sriov_pfs_item);
> +#ifdef CONFIG_VFIO_PCI_DMABUF
> +	ret = pcim_p2pdma_init(vdev->pdev);
> +	if (ret)
> +		return ret;
> +#endif
>  	init_rwsem(&vdev->memory_lock);
>  	xa_init(&vdev->ctx);
>  

What breaks if we don't test the return value and remove all the
#ifdefs?  The feature call should fail if we don't have a provider but
that seems more robust than failing to register the device.  Thanks,

Alex


