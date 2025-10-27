Return-Path: <linux-media+bounces-45725-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F86C11F25
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 00:14:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2215E189AD28
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 23:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB1E32D0EE;
	Mon, 27 Oct 2025 23:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o4thHGD1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED6332AAD4
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 23:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761606817; cv=none; b=qCifDBN/HTKL4boQJu0pNJVzbjINDp39+EyZTuL3ZZ3fBZajfjDjk9atxmdFDdvO9Pos1kOiWKYzHtE/FFl+5RM7Y4g+gdKJ4jKbReMS17GE2snXYuC/0J9LWZnUvLKrdl7q7TWmNjFyte3Su4EpVAPg/hfjsCYY5sMBPZzbwdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761606817; c=relaxed/simple;
	bh=Mox7WVrx2nsqFbNnAMpCHXjsIB1mhexPun4YkmTSVd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zqd8aumsNiFObzBSG71NJIp/g8UFSBsOiesNZhsyLIOr5QmU1XaXYS49ppPMl8SnpsQz4qZEQrerAf9OI1CZAZAE5xwuQCmAR6dXhbqyU7no01o60PI83wowoC5T3BMBP1vRV9dxPtOWFG01At4NehabbBqG22wFn3UHciexuyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o4thHGD1; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-592fd97c03eso4559086e87.1
        for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 16:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761606814; x=1762211614; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cVb3sBQg3S7kfhJuRLHfxPiQ08+Bc1FaH34bvysQgyo=;
        b=o4thHGD1/OUIjggnndqTnwnlW10eAEpX/HB4h+bHLKvOx8B1TxlHznc4je/pXuHVJb
         KUWtUQR1veipMr2Rmi2ifY0nHaQJE4SOZsgGUYvgroxjQaBNPA4fc8tIJjVWU+P5ydbN
         NMUJ0wQsP36BKbBPsDSPRE7pBO2mpYQgI0W6TZleqsHMtObXMIq70gyxPDxYUJwNLxh8
         XlEkLw2+Qf2apLB06O5B0unQU9dZVLF2iZhswvxbkKJ9L9OijIDYQO/dP7G6zUwDGVKX
         XkCJBuLbYSDWcFoYhBoM28SI/CUXMs1s/NHilUSaIj2p9npeD+I+8mm5i9UUiERiMfDH
         VQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761606814; x=1762211614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cVb3sBQg3S7kfhJuRLHfxPiQ08+Bc1FaH34bvysQgyo=;
        b=eBEkulXIlzKGJop6KfGcHFsR57z3axca/lNEZf68mFPt1A8icUTYibLAL5mnfGgmVr
         V9mbFBDWLCIvAoGLXiyCw39FCuRdVIUl2AeM1XzD1U/VEMcmJ0hn5XNWbg44tuHh2uvB
         PdY0ySTrKAcI5qz/VYHwyHFIQnJmkRAL6lDZwqw8xXWx3+XC8YzzEA5BdMFsAvEiMcnn
         1jZ4EhCwcTQnB0wDriK7m6/hawD6n2JUgKNG2kgrcJTfS/zdZJn4BkgUY8erLtf5KtHi
         ImlXiphjb8PVpBL3/WPGujWY0mV8rHVILe2bsrjbauiQz8usvUvrYvRWhHNQIP4zzUCN
         Qcdg==
X-Forwarded-Encrypted: i=1; AJvYcCU/DJtSs34zz6tITsAS+qLpSQoTD0w8MHu0rijPgYgzj6LJ+2JjfNDTWcor8vqvajeLF8MyZyDya9n9wQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfKhvn4CRXY3ohl+aKptBIYCnBhJVnz3IhRFrXKgHa7qYO2ihf
	YoKBLxGMptfQSAcPeaCet6QtoCgRKGy6jpCorpGBCQhRIfE/9tBmmXTt0+ZjUIwfnvhzMDnoEFj
	F/aLRMix8w5qpxKzQF0Qj5kq/2BDSQiLs8v/jlO4P
X-Gm-Gg: ASbGncuc3vfjvbjxS9uwL4qQuHRFluoEHoLO87/Qg/0h0TyoaoqJhalS+LxdzAQJiVn
	jKl/JNeihdVts0+zuRoeBKCXjqhRr1fEowS0PuyLEku/mrFJXD0LBVmRMDwjkVSV8MCT/kwjtbe
	wV4zjdCyJKIvYONsdOlHfMv/jkoWuNv6/9EM3CGkVlkbQV2oS6yL+ZdbCXqxJyURHTOJEkaar2D
	kkNnEXzeIp+23FMYARl6mZw78+D3+AoucRwB5eL3xnPxWd4u3YBVrajNgfbtFDL3WdBYm0=
X-Google-Smtp-Source: AGHT+IGl3ca765JSYQeeeNWnOc4ez61Rh9cYHuTu2Z8wbfu4++aeMX3ejm6+mpCGbnxLweY96XJw4Qd/Jsw/gJioL2Q=
X-Received: by 2002:a05:6512:39ce:b0:585:c51e:e99d with SMTP id
 2adb3069b0e04-5930e98f2bbmr555951e87.3.1761606813913; Mon, 27 Oct 2025
 16:13:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1760368250.git.leon@kernel.org> <72ecaa13864ca346797e342d23a7929562788148.1760368250.git.leon@kernel.org>
In-Reply-To: <72ecaa13864ca346797e342d23a7929562788148.1760368250.git.leon@kernel.org>
From: David Matlack <dmatlack@google.com>
Date: Mon, 27 Oct 2025 16:13:05 -0700
X-Gm-Features: AWmQ_blG76O58dB2_ktM5H7ZDlww5WUOcPernLo2oZm94nuYAfy2S9NihsUA1rg
Message-ID: <CALzav=cj_g8ndvbWdm=dukW+37cDh04k1n7ssFrDG+dN3D+cbw@mail.gmail.com>
Subject: Re: [PATCH v5 9/9] vfio/pci: Add dma-buf export support for MMIO regions
To: Leon Romanovsky <leon@kernel.org>
Cc: Alex Williamson <alex.williamson@redhat.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, 
	Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 8:44=E2=80=AFAM Leon Romanovsky <leon@kernel.org> w=
rote:
>
> From: Leon Romanovsky <leonro@nvidia.com>
>
> Add support for exporting PCI device MMIO regions through dma-buf,
> enabling safe sharing of non-struct page memory with controlled
> lifetime management. This allows RDMA and other subsystems to import
> dma-buf FDs and build them into memory regions for PCI P2P operations.

> +/**
> + * Upon VFIO_DEVICE_FEATURE_GET create a dma_buf fd for the
> + * regions selected.
> + *
> + * open_flags are the typical flags passed to open(2), eg O_RDWR, O_CLOE=
XEC,
> + * etc. offset/length specify a slice of the region to create the dmabuf=
 from.
> + * nr_ranges is the total number of (P2P DMA) ranges that comprise the d=
mabuf.
> + *
> + * Return: The fd number on success, -1 and errno is set on failure.
> + */
> +#define VFIO_DEVICE_FEATURE_DMA_BUF 11
> +
> +struct vfio_region_dma_range {
> +       __u64 offset;
> +       __u64 length;
> +};
> +
> +struct vfio_device_feature_dma_buf {
> +       __u32   region_index;
> +       __u32   open_flags;
> +       __u32   flags;
> +       __u32   nr_ranges;
> +       struct vfio_region_dma_range dma_ranges[];
> +};

This uAPI would be a good candidate for a VFIO selftest. You can test
that it returns an error when it's supposed to, and a valid fd when
it's supposed to. And once the iommufd importer side is ready, we can
extend the test and verify that the fd can be mapped into iommufd.

It will probably be challenging to meaningfully exercise device P2P
through a selftest, I haven't thought about how to extend the driver
framework for that yet... But you can at least test that all the
ioctls behave like they should.

