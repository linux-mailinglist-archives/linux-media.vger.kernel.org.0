Return-Path: <linux-media+bounces-43427-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0742BAE18B
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 18:53:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 408C919439A9
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 16:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224F724DCFD;
	Tue, 30 Sep 2025 16:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G02T/CxW"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04805239E76
	for <linux-media@vger.kernel.org>; Tue, 30 Sep 2025 16:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759251176; cv=none; b=gmjA7EoHc2ptasPbDx+xbjGGH6u+W9UDAk3Ca7/Bf5peaZ2qEAUIFBc0YrBbbI6yAqL++ycAfU1YJ51nHF45u/z/5iYWeKzv5jrs4nhxYroae/3Om05YC2FyZt/2a6YeDvdifEMQDjQqRdmq4cInBc+ThNc2YYyoXgQ3hJEBUYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759251176; c=relaxed/simple;
	bh=XRHExvG/tHB5daSSKAmQDIMiwtytKVKqlEgrmiHYtGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qNhhTPuDYQKNFm6GIUkbTyBZYLjBxgbIzpUXX6KGVkPPBQcU08tY7n4keT20qpPoff40FiXg7TQ2TLdhwrthsUBjGYimi4EDI5rSNz3SMEXVPZ3v8J2swgdtUV7HjisNJ7fj31YbmKY/FODnni7AsJGmp+JoslzED/QVrGGLBkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G02T/CxW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759251173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JryoONnZtvrch8iWe5kQa/bp3US7CnLH1VFoC2oPQRw=;
	b=G02T/CxWdFzdWNfhlIFwdrUzUnNBxZAHRXbim9H6o7KQF5KMS4DNUuK0/q0tS1t4VDHqf1
	GOfXb5jTCrqx4i4h3f5VwHtoD6hlai8QA77ya8Sck7zGbs4bYIpeUgCs+aMFoPl2guGAKD
	IxWFGeHTQKPEyMC6jJaM17C6FhYIod4=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-94NF22kINkqrZRTciCWZTg-1; Tue, 30 Sep 2025 12:52:51 -0400
X-MC-Unique: 94NF22kINkqrZRTciCWZTg-1
X-Mimecast-MFC-AGG-ID: 94NF22kINkqrZRTciCWZTg_1759251171
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7ad00e5bbecso970169a34.1
        for <linux-media@vger.kernel.org>; Tue, 30 Sep 2025 09:52:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759251171; x=1759855971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JryoONnZtvrch8iWe5kQa/bp3US7CnLH1VFoC2oPQRw=;
        b=DAa9KJKdNk2emvVjLXxing73L66j0bhCU3IdghxMiR4rRpKqJ59UQ1orNU8I6FBV+Q
         UO+zTBfJ59oGNK33iSBGJOL8yjpW6N9xBHAkpoqbgHrIqHbV9Bh8d+bfD/NQXyAtojfa
         HlvnnUoP46XQk070RqfnY3nelF6jfNG6MjKkPiwFJSMSPIEp6asnnlwX/w0DoJog2ema
         MV4ko/kmHkF3pjTrQgIty7Hj4FQNplaJRD34i9CbLxYaGwL3HDwL8ZLkGsINDsiLtNJI
         2lleVul4OuvoXfW3HTAcwIZPxmG+ArM9miJxRlr9Gu+6VwC/XZNWCdiv86TSpp9dapaG
         UwLg==
X-Forwarded-Encrypted: i=1; AJvYcCXwwGlxyFDQLlE1p37dYmg3H8n/tG9aQsh+p52IuA9ixaYSsXJ5eG21nMEgpkAQPqCkiwD6cYL6GRErUg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1z43AXT7D4wVV1BwEerSlLmWIfdXDPckDEDc3hHd93yJx6yiH
	Bp0G15pqGbpQ3yUw4+ZZAlTjMQe86ys7IXR+gG6TycW1knDd5oLRQ03tCjE6W6kMlfHZ06vziD4
	CnY38DwZjxFgxtMkLiO6Aclm4v9hT1Flnc+B1Yt69TBTvAt4Al6OfiZtUwJQglnRd
X-Gm-Gg: ASbGnctA3T3XnRcfH73eyFcJViBcIwgNB9T5n11a1ZfnYKF+YO+/2tCm0SI1q4L7wsA
	8B4Gz15ATLwytModO75ECUGJKOIs9L2O+ln47+SJgQ18KiKM74cG2K0siVYUuEVqsNXT9PoHpnN
	xfWQnPnybOCZG8gXzZP7q6H50D3s5PRcEGifM8fa8NLNQErom9ZmVNxv7YPzAfKTBI2ELqP87/e
	PpEjJEJZni/3XYBeItJS5ke8YekrV3zj9KzyIKpsLBJJYnSc0c3HeomH5iur1v7YQtg4ABM3BmQ
	d/xsEEOl94aOiBHz36hG2Q2rU4blogZgIRnzPRwM7of2rFAI
X-Received: by 2002:a05:6808:f86:b0:438:33fd:317c with SMTP id 5614622812f47-43fa41bd61fmr82483b6e.3.1759251171063;
        Tue, 30 Sep 2025 09:52:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwZ3/lKZz7Fdu2TvHNlTbKRk5qveSl6rvSejYaxAMAP02EZ6HQb/uugFp+9XcOcN4obhcZxg==
X-Received: by 2002:a05:6808:f86:b0:438:33fd:317c with SMTP id 5614622812f47-43fa41bd61fmr82463b6e.3.1759251170626;
        Tue, 30 Sep 2025 09:52:50 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-43f51238c63sm2746753b6e.22.2025.09.30.09.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 09:52:49 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:52:47 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Shameer Kolothum <skolothumtho@nvidia.com>, Leon Romanovsky
 <leon@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "iommu@lists.linux.dev"
 <iommu@lists.linux.dev>, Jens Axboe <axboe@kernel.dk>, Joerg Roedel
 <joro@8bytes.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, Logan Gunthorpe <logang@deltatee.com>, Marek
 Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Vivek Kasireddy
 <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v4 10/10] vfio/pci: Add dma-buf export support for MMIO
 regions
Message-ID: <20250930105247.1935b553.alex.williamson@redhat.com>
In-Reply-To: <20250930143408.GI2942991@nvidia.com>
References: <cover.1759070796.git.leon@kernel.org>
	<53f3ea1947919a5e657b4f83e74ca53aa45814d4.1759070796.git.leon@kernel.org>
	<20250929151749.2007b192.alex.williamson@redhat.com>
	<20250930090048.GG324804@unreal>
	<CH3PR12MB754801DC65227CC39A3CB1F3AB1AA@CH3PR12MB7548.namprd12.prod.outlook.com>
	<20250930143408.GI2942991@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 30 Sep 2025 11:34:08 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, Sep 30, 2025 at 12:50:47PM +0000, Shameer Kolothum wrote:
> 
> > This is where hisi_acc reports a different BAR size as it tries to hide
> > the migration control region from Guest access.  
> 
> I think for now we should disable DMABUF for any PCI driver that
> implements a VFIO_DEVICE_GET_REGION_INFO
> 
> For a while I've wanted to further reduce the use of the ioctl
> multiplexer, so maybe this series:
> 
> https://github.com/jgunthorpe/linux/commits/vfio_get_region_info_op/
> 
> And then the dmabuf code can check if the ops are set to the generic
> or not and disable itself automatically.
> 
> Otherwise perhaps route the dmabuf through an op and deliberately omit
> it (with a comment!) from hisi, virtio, nvgrace.
> 
> We need to route it through an op anyhow as those three drivers will
> probably eventually want to implement their own version.

Can't we basically achieve the same by testing the ioctl is
vfio_pci_core_ioctl?  Your proposal would have better granularity, but
we'd probably want an ops callback that we can use without a userspace
buffer to get the advertised region size if we ever want to support a
device that both modifies the size of the region relative to the BAR
and supports p2p.  Thanks,

Alex


