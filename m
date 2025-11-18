Return-Path: <linux-media+bounces-47300-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EA8C69F72
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 15:29:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 60A262BCED
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 14:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B906320CD3;
	Tue, 18 Nov 2025 14:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="jbgNlztq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991BF3559E8
	for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 14:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763476138; cv=none; b=O9WavsUpDz0iKzbcNh7c/AH7l+hd6eHfKMg8IBYTVbW2Ue+y6qYH+TgV7h15mOlGQOTM8+e3R15Ivc57tH7j1Ewn+twPgOV/KLtZD6EXUYP+vXboB7YPlOU913YZW/AstwjEI0c4cudZb7TmCVTDSU184lAbBMHCRCenAZVKIe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763476138; c=relaxed/simple;
	bh=Vw+jMoLrz3CPi3RZadAUQ9OZDIQrFYnK7RrpZ+3jFFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tdipU04wiLckVkGLBsqlT715U4YrVh0rZWFQxAi+7xKZ2i4OhL02F7GjqxnuWXWMCeNCvjC/P/VUG+kAzWzoZiVw3uWyghRhIhLnNXoTRaMrLDjsGD5TaKhxLUdyGWAuJ/LgE5wVpXou6VIXMQRKRPStcs4MCFcHrmBtE71nA3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=jbgNlztq; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-88249766055so69600756d6.1
        for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 06:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1763476131; x=1764080931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=35WpspOv1fAWFINmOzi0AcgEQL1oV2/QEYSJcrH4aSg=;
        b=jbgNlztqEGj3WmXe7Jo3l8FaT1DvF8AaIYPg93dVoF6UZRCE01BN9/Pnq+azINjQid
         LpaMmzcr/XUyOOp2ThaI47IxSCnWlvwIwG94wN+XZ7LGqOd6cdwVFXyTanROgMLBbQ/6
         jzJ8MKocS/iXqpfC3Wey6NGpOtxYUOzxcm2sbBZdIsSp05BjVhevLq428KKvAXPl3xL5
         8RIG9SSDGshJkAbsY3vW7n/jSgIOdS7J00+Bl+R1/qeSCQMNP5hD5M8oSOaDEz/Aheqg
         FSaz76ZiLI+pEwl6Es2xp9bla/Vfo6GtgTw9bOQLBkvuDaGebbESWQ07NgaAWjGPJun8
         9Ycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763476131; x=1764080931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=35WpspOv1fAWFINmOzi0AcgEQL1oV2/QEYSJcrH4aSg=;
        b=Q7l8jC/QfX8SGmkVQzOb0PfzvkwjvXldQLNoEymms9ztVP2BnnpDhKrfa13LEQVqbA
         oGJPQ597mlz16rz8tTxHVOi5Sz0w5L4gwDPnVuUj7HgPwUwDUTmty2JZcx1b8LH/gIcc
         NXMOPEt6pj1EMwJagxDMYfQiq4VY1fWzG2dS6/kbMw7b/gFbiwPGpVBqf5pldwofReW8
         DC7mWONrYWLJwqGWBdwQ4hOA/YKyspwNcSZT+QOKaSvcE2EO6l7xp6X4Kd+6M2l1o5Rf
         JFd04cdhRY/DwJ89uc89f+i7uIAklSyyjZRj4JQRKwjdgY65hV7ftett8k035laesLM2
         sJiw==
X-Forwarded-Encrypted: i=1; AJvYcCWHcKVhKj+xZpr0hJCkDEzFKya4hQzp8CCCs6FExdT0Ak+4yGsYwo6Kk/Jpo84tou6o4WAPgPcrrlrO2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQzz4W/pSVTEA0dFET2zLGkyj+PAvDe8rF98pgSDC/v5Ky/HS2
	EKZU8wE7A3oYJs8Y4DpsUU2WP6GqjY9q7k/EFUqoA5fQ3nCptBQsfRil0jz5uubikJA=
X-Gm-Gg: ASbGncv6rJ1Jyu9E1hN/Ga76LWCvsKK1idDUcfEIpYpjZy5CSfs1c5COoQqoLem+SC6
	GGlktdnhXQsEysOx4a61sETlWYYwYdruQsFpvYackFyyZ6MJbYOUPFGBrf+HkdJ0BjN9DJZI/Nr
	1yo6iNkXg88VmD1zVkCmeR28ocuw0S0jOkg3+jdRtBJ6euajFG2rtaobQrwG5GaARJyskJq4SiA
	6o3JxYGg7SNyaesvFAmntt9j5qZHwzH3abiqaTQTNet8PS3k2d5hy66c/s6JhCkAB8VgbP6GSFE
	8yMpYufSVYwv6hD8ELCbic4jCf9OalFgmX8B6yRhlmtZCT6vArzXu2lpoZpYBja2gqgLBmuCI4H
	EGsm1x2DZG5OVW3MVtxwEmOk7EsbxxIb5aaURm4WSsh00ehQBjp1GsNdfW8rFHsHqboZk4+vkaW
	pbSEZgBOZqHuQgynaU25vswDlWRihuIsAji9u6ddm+wbO44HIcBU08Kj/iZhHBBxKmj2c=
X-Google-Smtp-Source: AGHT+IF+NrfSbYwvwiNh+CC3YngHFJHpwzxC37jBlKkv0sHaTL3i1cld4gWS47y25QRA75BxBaWSvQ==
X-Received: by 2002:a05:6214:62a:b0:81b:bf92:8df9 with SMTP id 6a1803df08f44-8829269e086mr234228876d6.43.1763476131063;
        Tue, 18 Nov 2025 06:28:51 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8828652efa4sm114860276d6.39.2025.11.18.06.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 06:28:50 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vLMhN-00000000NEc-3Dxs;
	Tue, 18 Nov 2025 10:28:49 -0400
Date: Tue, 18 Nov 2025 10:28:49 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Yishai Hadas <yishaih@nvidia.com>,
	Shameer Kolothum <skolothumtho@nvidia.com>,
	Alex Williamson <alex@shazbot.org>,
	Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
	"Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v8 10/11] vfio/pci: Add dma-buf export support for MMIO
 regions
Message-ID: <20251118142849.GG17968@ziepe.ca>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-10-fd9aa5df478f@nvidia.com>
 <BN9PR11MB527610F3240E677BE9720C2B8CD6A@BN9PR11MB5276.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB527610F3240E677BE9720C2B8CD6A@BN9PR11MB5276.namprd11.prod.outlook.com>

On Tue, Nov 18, 2025 at 07:33:23AM +0000, Tian, Kevin wrote:
> > From: Leon Romanovsky <leon@kernel.org>
> > Sent: Tuesday, November 11, 2025 5:58 PM
> > 
> > -		if (!new_mem)
> > +		if (!new_mem) {
> >  			vfio_pci_zap_and_down_write_memory_lock(vdev);
> > -		else
> > +			vfio_pci_dma_buf_move(vdev, true);
> > +		} else {
> >  			down_write(&vdev->memory_lock);
> > +		}
> 
> shouldn't we notify move before zapping the bars? otherwise there is
> still a small window in between where the exporter already has the
> mapping cleared while the importer still keeps it...

zapping the VMA and moving/revoking the DMABUF are independent
operations that can happen in any order. They effect different kinds
of users. The VMA zap prevents CPU access from userspace, the DMABUF
move prevents DMA access from devices.

The order has to be like the above because vfio_pci_dma_buf_move()
must be called under the memory lock and
vfio_pci_zap_and_down_write_memory_lock() gets the memory lock..

> > +static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
> > +{
> > +	struct vfio_pci_dma_buf *priv = dmabuf->priv;
> > +
> > +	/*
> > +	 * Either this or vfio_pci_dma_buf_cleanup() will remove from the list.
> > +	 * The refcount prevents both.
> 
> which refcount? I thought it's vdev->memory_lock preventing the race...

Refcount on the dmabuf

> > +int vfio_pci_core_fill_phys_vec(struct dma_buf_phys_vec *phys_vec,
> > +				struct vfio_region_dma_range *dma_ranges,
> > +				size_t nr_ranges, phys_addr_t start,
> > +				phys_addr_t len)
> > +{
> > +	phys_addr_t max_addr;
> > +	unsigned int i;
> > +
> > +	max_addr = start + len;
> > +	for (i = 0; i < nr_ranges; i++) {
> > +		phys_addr_t end;
> > +
> > +		if (!dma_ranges[i].length)
> > +			return -EINVAL;
> 
> Looks redundant as there is already a check in validate_dmabuf_input().

Agree

> > +int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32
> > flags,
> > +				  struct vfio_device_feature_dma_buf __user
> > *arg,
> > +				  size_t argsz)
> > +{
> > +	struct vfio_device_feature_dma_buf get_dma_buf = {};
> > +	struct vfio_region_dma_range *dma_ranges;
> > +	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> > +	struct vfio_pci_dma_buf *priv;
> > +	size_t length;
> > +	int ret;
> > +
> > +	if (!vdev->pci_ops || !vdev->pci_ops->get_dmabuf_phys)
> > +		return -EOPNOTSUPP;
> > +
> > +	ret = vfio_check_feature(flags, argsz, VFIO_DEVICE_FEATURE_GET,
> > +				 sizeof(get_dma_buf));
> > +	if (ret != 1)
> > +		return ret;
> > +
> > +	if (copy_from_user(&get_dma_buf, arg, sizeof(get_dma_buf)))
> > +		return -EFAULT;
> > +
> > +	if (!get_dma_buf.nr_ranges || get_dma_buf.flags)
> > +		return -EINVAL;
> 
> unknown flag bits get -EOPNOTSUPP.

Agree

> > +
> > +void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
> > +{
> > +	struct vfio_pci_dma_buf *priv;
> > +	struct vfio_pci_dma_buf *tmp;
> > +
> > +	down_write(&vdev->memory_lock);
> > +	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm)
> > {
> > +		if (!get_file_active(&priv->dmabuf->file))
> > +			continue;
> > +
> > +		dma_resv_lock(priv->dmabuf->resv, NULL);
> > +		list_del_init(&priv->dmabufs_elm);
> > +		priv->vdev = NULL;
> > +		priv->revoked = true;
> > +		dma_buf_move_notify(priv->dmabuf);
> > +		dma_resv_unlock(priv->dmabuf->resv);
> > +		vfio_device_put_registration(&vdev->vdev);
> > +		fput(priv->dmabuf->file);
> 
> dma_buf_put(priv->dmabuf), consistent with other places.

Someone else said this, I don't agree, the above got the get via

get_file_active() instead of a dma_buf version..

So we should pair with get_file_active() vs fput().

Christian rejected the idea of adding a dmabuf wrapper for
get_file_active(), oh well.

> > +struct vfio_device_feature_dma_buf {
> > +	__u32	region_index;
> > +	__u32	open_flags;
> > +	__u32   flags;
> 
> Usually the 'flags' field is put in the start (following argsz if existing).

Yeah, but doesn't really matter.

Thanks,
Jason

