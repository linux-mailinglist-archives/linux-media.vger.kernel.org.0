Return-Path: <linux-media+bounces-38669-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD77B1673D
	for <lists+linux-media@lfdr.de>; Wed, 30 Jul 2025 21:59:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9062622F28
	for <lists+linux-media@lfdr.de>; Wed, 30 Jul 2025 19:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17753218E99;
	Wed, 30 Jul 2025 19:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zwipy1d/"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4DA211A27
	for <linux-media@vger.kernel.org>; Wed, 30 Jul 2025 19:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753905534; cv=none; b=hbMgyiQGQ+wepEC/u92Vt5G/+JzYkYU/HIJ6+20OQCu7WFXL/GsTKJcgJJGlmFRvqdq/xUbvVtBEiPRypHLvUen8BY0gVsPT+Drx+nLtGO1qu3K7wLWNW58B9TNnESRnv9OFToF+gVp0Vyrt7JGkzoT8gArCC7EYathaPM8W3uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753905534; c=relaxed/simple;
	bh=CG5SKXa8zPOQn3DCX5/e8odAxj8sWImHdXc+IA7A+Io=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fF3yFJxLMei06PhBGwGptDHMbIhCvR7rNCWABqxKYUFKR7Hj7hwFXj5qYHYbAleQMV89JGvtMYqSIXZLG3enUWJUBf5+7xcGQikNe3uXBfH/aApJju5HdMeItmog5sAMT+XfAYDq1TBIoPvQIDHSusXy+Q/r5cYtbRokfSM5nTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zwipy1d/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753905531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MJ8yWqGXhru7WhV5DGnUZnDJthF7Yg1ZkZASyV+JWoM=;
	b=Zwipy1d/+aYeX49YUl3RPWoAUZbooFhei0QjfGCwO7B6gicBefkcYFOHLVp3nRcdVyAnK8
	fz9dbP/EKgOzMP/UlVW7s06aAtjY3f8I+AnGHnlKsxTV+SZKY9U+K8UdHAtu69hNexPuN+
	a5nOYkou2V0wu0FmawyGX5zof/5RgdY=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-tz3v93XMOeyNzVXkjIAHSg-1; Wed, 30 Jul 2025 15:58:50 -0400
X-MC-Unique: tz3v93XMOeyNzVXkjIAHSg-1
X-Mimecast-MFC-AGG-ID: tz3v93XMOeyNzVXkjIAHSg_1753905530
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-88118bfccf4so4301039f.2
        for <linux-media@vger.kernel.org>; Wed, 30 Jul 2025 12:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753905529; x=1754510329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MJ8yWqGXhru7WhV5DGnUZnDJthF7Yg1ZkZASyV+JWoM=;
        b=VbKJ65+kw7SjuPpQc4tJB+6WlZYcyUg9qJ/kfJ9UZtEreqDecjd12ZKmmZKEsh4Y5H
         LBaPwfV4ixtkMC0YGcsvEKuI8POCG/KkqzweL6IrBaRxc+5Qx4dN34QZNY+W8OF25Odn
         ccJMCIP7wuTDsKmFn2Ve9dayelsXIyYKSzEQ+ndoUe7DK9hyb4D3wZH/hn6bWnHdyY+m
         uqEpvIgKUB0m1pLndD7E40kUSKg+imYxkdEJj/K6LveUee3TuXrFUUfmrPvFmnfD9dAn
         1BhpWQ59vTal7JCcTT4ZVwJAUv83tXrVbTMRTU39miJ3EZ/IrGfZY6dPCfWJ6aWAwkl1
         1mZA==
X-Forwarded-Encrypted: i=1; AJvYcCU2tlQLePIf5qR+Frso1TMJyTm2G3X2/see/SmqHpzlrHWqoXFVJNnX/oha4yNBHOyLKU2YR8MkwiowUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKQCEZK/gtc7DE7UICyeBP4QH1BHSkfVFqboC4IpbZzKp7Rst0
	T7O6Kk6CY0VuBUcXKkv5LiHbjpjBRPYpQuzeJRGH9KdpPGD6W1vEbLqviCg8b+dzgd/+rzHQwoS
	oSNNhfUJVvVgIsVMcAfz+Qg+9asPUjAOJlUX+9Y1Nx3vnPKBCgQO/nUANqgxFT08F
X-Gm-Gg: ASbGnctYXvrQbeR0D5R+P3dHpV9Q98MHXCTvCokAjilmVVfCHYaTpNV2qzDpYP9pLwU
	1pSuLP3z3EEnIWr5FiXRQYQNUPulfYCkkxCZEqUwomXeiY+Zv/R4+dqS+tEcHwtENgsHgW4wskZ
	SQ6mTyip9l8E+QlHqPls8FE/9fKb3+eN4Wv9e/3pxjy+O5pzlY8VNFJ3qg8c9vM2E7CgPib+C3u
	MP9RBnuLEI1qowMy4LdQjs606we7yJseTc+EngG840Bp7fAwLzjfW5nUg34gzCNdi2GaKGGrIhF
	q2w5WjG8u7xAAS5wuAgr9oaAMgJ3r7w38qmRM5ipOQE=
X-Received: by 2002:a05:6602:3403:b0:85b:544c:ba6c with SMTP id ca18e2360f4ac-88137489c1bmr247637239f.1.1753905529637;
        Wed, 30 Jul 2025 12:58:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqzTNDwtWgU4diezEDNzfWAqDpdNRdRLffgeb0LuFILxM3AuzO6OxVkpYobVhQ8ZrxcWgziA==
X-Received: by 2002:a05:6602:3403:b0:85b:544c:ba6c with SMTP id ca18e2360f4ac-88137489c1bmr247635939f.1.1753905529204;
        Wed, 30 Jul 2025 12:58:49 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50a55da3278sm19521173.84.2025.07.30.12.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 12:58:48 -0700 (PDT)
Date: Wed, 30 Jul 2025 13:58:46 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton
 <akpm@linux-foundation.org>, Bjorn Helgaas <bhelgaas@google.com>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, Jens Axboe
 <axboe@kernel.dk>, =?UTF-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org, Logan Gunthorpe
 <logang@deltatee.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin
 Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH 00/10] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Message-ID: <20250730135846.2208fe89.alex.williamson@redhat.com>
In-Reply-To: <cover.1753274085.git.leonro@nvidia.com>
References: <cover.1753274085.git.leonro@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 23 Jul 2025 16:00:01 +0300
Leon Romanovsky <leon@kernel.org> wrote:

> From: Leon Romanovsky <leonro@nvidia.com>
> 
> ---------------------------------------------------------------------------
> Based on blk and DMA patches which will be sent during coming merge window.
> ---------------------------------------------------------------------------
> 
> This series extends the VFIO PCI subsystem to support exporting MMIO regions
> from PCI device BARs as dma-buf objects, enabling safe sharing of non-struct
> page memory with controlled lifetime management. This allows RDMA and other
> subsystems to import dma-buf FDs and build them into memory regions for PCI
> P2P operations.
> 
> The series supports a use case for SPDK where a NVMe device will be owned
> by SPDK through VFIO but interacting with a RDMA device. The RDMA device
> may directly access the NVMe CMB or directly manipulate the NVMe device's
> doorbell using PCI P2P.
> 
> However, as a general mechanism, it can support many other scenarios with
> VFIO. This dmabuf approach can be usable by iommufd as well for generic
> and safe P2P mappings.

I think this will eventually enable DMA mapping of device MMIO through
an IOMMUFD IOAS for the VM P2P use cases, right?  How do we get from
what appears to be a point-to-point mapping between two devices to a
shared IOVA between multiple devices?  I'm guessing we need IOMMUFD to
support something like IOMMU_IOAS_MAP_FILE for dma-buf, but I can't
connect all the dots.  Thanks,

Alex


