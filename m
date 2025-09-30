Return-Path: <linux-media+bounces-43425-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAC4BADFE5
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 18:01:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FA7A4A3074
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 16:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 358083093BF;
	Tue, 30 Sep 2025 16:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rwg0TymT"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD2B200C2
	for <linux-media@vger.kernel.org>; Tue, 30 Sep 2025 16:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759248081; cv=none; b=l2Q1Z4n9IW6u0sPjuOe1A17LvFrTFL60gDP8AA8VYaj519gh6X4kTIdM2WVUEo39eUGmM+uzSVHytnplRY9a+LZ2HSERKnCtPgbCDAFSMq0BOeUrsqQhMoeIIlQAuzGBoG0qL1x8mZ70YBK5XKZ9qL9k2orGd5MZKOyFx0pCwBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759248081; c=relaxed/simple;
	bh=Bn7zEJ911XHzxxR8rR96F8Z2uaJ/NUbD+h2AbVhFNRg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tfU+OA0C03/KM+5rcWyCkzhxowv7qFZcFnJyoMMV8K+sDSNKWf9ifqOhgIXIh5H9nPZjWZLhOeixHmIj+4UDbBgRYp4+itRPpvzXWOBsw4Vicl6K4gyWXrVr6N91vIknEIwcQVNpZcp7Inw+4o/tZtEIa2YLTKM6rW2bjz+4eXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rwg0TymT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759248078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HOYVDlXcgikSCUwOdxOfSsjt8Nh4FIwdpCdV/JBPVPE=;
	b=Rwg0TymTof2GChCfuZLJYnFJ5RK2ZAdw4yisax3/tLWEyG3H/OEqAgt4rU8OYzy4bplGgl
	JyxSL+dJ2qK7nNDg8vk7K0bkbVzUyv6MAdG1Lb1okeuTxXU0WfmTn/Q8AwH6Xw17gDP442
	clCJV8veraieu2+hxfzWPOrRASmkCSA=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-HPSXfH5rOriT8dVYK-qI2g-1; Tue, 30 Sep 2025 12:01:16 -0400
X-MC-Unique: HPSXfH5rOriT8dVYK-qI2g-1
X-Mimecast-MFC-AGG-ID: HPSXfH5rOriT8dVYK-qI2g_1759248075
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-4280e6181c1so8568915ab.1
        for <linux-media@vger.kernel.org>; Tue, 30 Sep 2025 09:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759248075; x=1759852875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOYVDlXcgikSCUwOdxOfSsjt8Nh4FIwdpCdV/JBPVPE=;
        b=phZFuEfpeVrePnwePqwDqLOukZT/XWAA7sh+VVqhHAVECqG5WBiUZ9esS9HjHqJnB0
         aDwWabHEktKqwLU30iJTKbXqRVsXaaoTj5soHKnk3V9g/CKFZtziHlLlmBxBBi5K3jg+
         Hmo7nmws10ISuhGmzHY70/c1uYHM3ZwS5zL7Ui8e93TmSk8kLd7vVwDhf+vOUBoCNE1o
         oCkiBMJ/UBtndN8ntR/11fgw69bktl+lIKWLg3alTcV3krU+uK2cuT099t4q5kqiyndt
         4z5E/fWPhgs8/z3+EBLRWPi6ayI/SgddEZVjVdPejZI0fAF6634NHr1hHunjX6Basp9K
         a8Fg==
X-Forwarded-Encrypted: i=1; AJvYcCUDplc5ANRd7OIlB3GeKMAfm2Yj6W/8yLx+rRUGW4/s0kzXoGqyuO5Yt/rk2lSacZVBXz1UqTH+IxgPvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLI5oUhJdL69d5/L+3TYR9WXYlx+pAOtiZe+twx1s8c7z+X0i4
	VvG0xIa7cjPMGJNIaZzpQtcHW4Xy69kurVwVHFCQ48JHM1eMY/nnM+g40rm9X6IXd63D6cvEhLl
	/CXM6dKX1MWjoeVm594bMtsG+B2wE36yxqiSSdZHYPTe0RznzGS/3jr8Nedx7OKJ8
X-Gm-Gg: ASbGnctUp/e7O1W8AMF5Xr788ajojuuNedLpwRheLSSoxeyhL2DqhPdWXyWyv3V1rLJ
	9D653zFjDvCFqOZKP7AfwndFsS+zt7wEqJAa+ZvgDyT5h3U7iWlzWLLvXOpyhG9iLaT+spCbgWW
	1UR48BCttItF3u2BcFapAKWJ41PpW4qJ4OO5qyJuu/UfqXEf/gKvLhqPzG7mPESn7O3fnpZSzRy
	FmPcQ07S8KtmbH/64WiE20dJdcSvZ6fqInFDly1NyBH/n0qZ3UIJ0aMTnReqBIUnVUlNFf9/6Jo
	efmBwpFi9w6MAibZrNxlnPuZj8+LaBqyvvy65PS4rY12MOZL
X-Received: by 2002:a05:6e02:164b:b0:42b:1763:5796 with SMTP id e9e14a558f8ab-42d81635257mr2672825ab.7.1759248075080;
        Tue, 30 Sep 2025 09:01:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFa3YWCojRcq8FvhA8oy0OghueS9jHVQ9BVoBDjYigh74bKjlyhu7iHP48jxbQj2TC5kTDAzg==
X-Received: by 2002:a05:6e02:164b:b0:42b:1763:5796 with SMTP id e9e14a558f8ab-42d81635257mr2672385ab.7.1759248074259;
        Tue, 30 Sep 2025 09:01:14 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425bfba6242sm68758215ab.27.2025.09.30.09.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 09:01:13 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:01:10 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Leon Romanovsky <leon@kernel.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton
 <akpm@linux-foundation.org>, Bjorn Helgaas <bhelgaas@google.com>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, Jens Axboe
 <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org, Logan Gunthorpe
 <logang@deltatee.com>, Robin Murphy <robin.murphy@arm.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Will Deacon <will@kernel.org>
Subject: Re: [PATCH v4 08/10] vfio/pci: Enable peer-to-peer DMA transactions
 by default
Message-ID: <20250930100110.6ec5b8a1.alex.williamson@redhat.com>
In-Reply-To: <20250930073053.GE324804@unreal>
References: <cover.1759070796.git.leon@kernel.org>
	<ac8c6ccd792e79f9424217d4bca23edd249916ca.1759070796.git.leon@kernel.org>
	<20250929151745.439be1ec.alex.williamson@redhat.com>
	<20250930073053.GE324804@unreal>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 30 Sep 2025 10:30:53 +0300
Leon Romanovsky <leon@kernel.org> wrote:

> On Mon, Sep 29, 2025 at 03:17:45PM -0600, Alex Williamson wrote:
> > On Sun, 28 Sep 2025 17:50:18 +0300
> > Leon Romanovsky <leon@kernel.org> wrote:
> >   
> > > From: Leon Romanovsky <leonro@nvidia.com>
> > > 
> > > Make sure that all VFIO PCI devices have peer-to-peer capabilities
> > > enables, so we would be able to export their MMIO memory through DMABUF,
> > > 
> > > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > > ---
> > >  drivers/vfio/pci/vfio_pci_core.c | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > > 
> > > diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> > > index 7dcf5439dedc..608af135308e 100644
> > > --- a/drivers/vfio/pci/vfio_pci_core.c
> > > +++ b/drivers/vfio/pci/vfio_pci_core.c
> > > @@ -28,6 +28,9 @@
> > >  #include <linux/nospec.h>
> > >  #include <linux/sched/mm.h>
> > >  #include <linux/iommufd.h>
> > > +#ifdef CONFIG_VFIO_PCI_DMABUF
> > > +#include <linux/pci-p2pdma.h>
> > > +#endif
> > >  #if IS_ENABLED(CONFIG_EEH)
> > >  #include <asm/eeh.h>
> > >  #endif
> > > @@ -2085,6 +2088,7 @@ int vfio_pci_core_init_dev(struct vfio_device *core_vdev)
> > >  {
> > >  	struct vfio_pci_core_device *vdev =
> > >  		container_of(core_vdev, struct vfio_pci_core_device, vdev);
> > > +	int __maybe_unused ret;
> > >  
> > >  	vdev->pdev = to_pci_dev(core_vdev->dev);
> > >  	vdev->irq_type = VFIO_PCI_NUM_IRQS;
> > > @@ -2094,6 +2098,11 @@ int vfio_pci_core_init_dev(struct vfio_device *core_vdev)
> > >  	INIT_LIST_HEAD(&vdev->dummy_resources_list);
> > >  	INIT_LIST_HEAD(&vdev->ioeventfds_list);
> > >  	INIT_LIST_HEAD(&vdev->sriov_pfs_item);
> > > +#ifdef CONFIG_VFIO_PCI_DMABUF
> > > +	ret = pcim_p2pdma_init(vdev->pdev);
> > > +	if (ret)
> > > +		return ret;
> > > +#endif
> > >  	init_rwsem(&vdev->memory_lock);
> > >  	xa_init(&vdev->ctx);
> > >    
> > 
> > What breaks if we don't test the return value and remove all the
> > #ifdefs?  The feature call should fail if we don't have a provider but
> > that seems more robust than failing to register the device.  Thanks,  
> 
> pcim_p2pdma_init() fails if memory allocation fails, which is worth to check.
> Such failure will most likely cause to non-working vfio-pci module anyway,
> as failure in pcim_p2pdma_init() will trigger OOM. It is better to fail early
> and help for the system to recover from OOM, instead of delaying to the
> next failure while trying to load vfio-pci.
> 
> CONFIG_VFIO_PCI_DMABUF is mostly for next line "INIT_LIST_HEAD(&vdev->dmabufs);"
> from the following patch. Because that pcim_p2pdma_init() and dmabufs list are
> coupled, I put CONFIG_VFIO_PCI_DMABUF on both of them.

Maybe it would remove my hang-up on the #ifdefs if we were to
unconditionally include the header and move everything below that into
a 'if (IS_ENABLED(CONFIG_VFIO_PCI_DMA)) {}' block.  I think that would
be statically evaluated by the compiler so we can still conditionalize
the list_head in the vfio_pci_core_device struct via #ifdef, though I'm
not super concerned about that since I'm expecting this will eventually
be necessary for p2p DMA with IOMMUFD.

That's also my basis for questioning why we think this needs a user
visible kconfig option.  I don't see a lot of value in enabling
P2PDMA, DMABUF, and VFIO_PCI, but not VFIO_PCI_DMABUF.  Thanks,

Alex


