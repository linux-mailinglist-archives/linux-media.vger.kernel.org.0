Return-Path: <linux-media+bounces-43267-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CCCBA4120
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 16:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EE2804E2529
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 14:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E2EA2F99BC;
	Fri, 26 Sep 2025 14:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gHVwjqSn"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDCE2F83C2
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 14:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758896040; cv=none; b=t/bVjHPBOVyhupe19KNxGGq2x+s1epWEA+pKYDHQ1XAg5D7iQx0x9JN3sulwXm1e4rsV3VTcPdY9vehl3APD3MQMwX3Fb9LLQ+p/93jKZd7nZpOfgHKb6ZK+vKg0DRZ5TZWKrFTTOXAy8w55i5Oa9xLZ7GoZ6M91WKPlBvNxkR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758896040; c=relaxed/simple;
	bh=9Uil3utnUf/+NIj0PyQtmrf2+9Z0RwwOZFba/4yoRVo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WU61egRJR0w7EgDTTy7dF9g/l4aM+2rNPx3ZNaIEv8BHQZ5rJpDBrQ52vPuyGPmXvIsB2u2nvYi1DjgQuOev9HYfvVgt0EjbMizlsCJmddFxweVeGStNLxb5bKrEJdGixkQmARcxZk7nOlAy4O9mKySmtPqk4tFyvZn26zH7oV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gHVwjqSn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758896037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qYsj9+8I0Zx27jHpluvCkiN1087KEQYq4tnoUW0GI60=;
	b=gHVwjqSnXHb7EcJVuSmAxGBysXD143Lr4ddT0yPGVYq0bulfIVfDe4saImNhK1Ega1SpMe
	adMFy3rw6dWXEC+IWPYR5qfoLDraWP1ocaOKOJRDZn63MqqxOJlKbBcEoftPzPfdhdylqD
	o19bIJvR3L8p3tUan0kn1ll7EXnADBQ=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-Ipprgx7yP9eHldiDGSw7lQ-1; Fri, 26 Sep 2025 10:13:55 -0400
X-MC-Unique: Ipprgx7yP9eHldiDGSw7lQ-1
X-Mimecast-MFC-AGG-ID: Ipprgx7yP9eHldiDGSw7lQ_1758896034
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-425d6a07c97so1411985ab.0
        for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 07:13:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758896034; x=1759500834;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qYsj9+8I0Zx27jHpluvCkiN1087KEQYq4tnoUW0GI60=;
        b=WU7YD8Y9O7XXLiUcjUMCpzGNqTes5ljqgEZFDMWCpDOLFSVqlt3VdLoMsKjCTZPQ2a
         hr5D+0J/QKmsbz3XpYBbaTsW2v06uV2k1fWtqVIxeXBKqa9SvJxu9jZwGTjvNZQQmmCO
         ggZQpLtBZ0CT0UJ45inFN5avsOMU6f0yUbPko1CGIaBoPfuV9TCutJKZMaS2Y0X79Onl
         fuAg5wHcnlDOp4/lcACQ4oeOt4H25aAjbzEC3G0TZgL2OhVrW7/DncSxc0eWFAxNy1oR
         swXLNy+rsPy5fEGHvVY/cjGc/opdLnKRpYnvV8u/IG5t75tw8+7E4ug6SVcDEXNiFULg
         N/Vg==
X-Forwarded-Encrypted: i=1; AJvYcCWJLSX6kyoMXPfuxU720YnrOAHewUorIa2uUKm1j5MopOOEXKcOJ22LPq8eodVq+hYr759lrOrCsTbxtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzklCEtQrO+2/zwLL8hy9Tv826M9V8vr1Lb5sjUFZu8CzWy5KFT
	7jxDKHn0Zbb5mvvFAnaBxbtSJZOweuylewni669auqeotopBrfyQ36lInxtrdNRiZyyjmW6gLwz
	H4ZjCSmQwhEK42AbqbawTtmHkIOrhuBcz02AWQxfk4h8vlTYX36kXBWV9GaNURVjw
X-Gm-Gg: ASbGncs3+PQP7B5ryBUF4rdkhDiVqY7rY5gGZ3peMa5V+APqIlX9dUmwTkTH6mwAcGg
	NlOG+WZqXPWsHzWUh5ETaTeZNENASrcokX7FHXzZUibdsGlYqDBWIhH2af0g9McUe9B74kPCSnR
	tjOtV3hF76KdiWjrF81PVo5pIIyey3ArR0NKH/4FrKqBamt1PGsyypA07WppPmcDtMUnJWfm/gz
	WzbZ5E1jM0/c2wFeN2L+bUN6TH7kBvtV5lhSw9plf2pBWHaC4ti1YSlbnOv8RNDCfb5i237+p7e
	RulpdpLm/iAjnXZ6wW33gSMk2te3A5p2DTnMSWRZpV8=
X-Received: by 2002:a05:6e02:1b08:b0:424:6c8e:6187 with SMTP id e9e14a558f8ab-425955e4dfdmr37293695ab.2.1758896034403;
        Fri, 26 Sep 2025 07:13:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHfT8sSg9RrO7oeIo38sP5Lm5q3G5XmCIbUcAskNNx/V0hMD+Gb0yPcLZiy3wfp8DzV0Dz7Q==
X-Received: by 2002:a05:6e02:1b08:b0:424:6c8e:6187 with SMTP id e9e14a558f8ab-425955e4dfdmr37293545ab.2.1758896033974;
        Fri, 26 Sep 2025 07:13:53 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-56a6a5b1ec5sm1833727173.67.2025.09.26.07.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:13:52 -0700 (PDT)
Date: Fri, 26 Sep 2025 08:13:50 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Bjorn Helgaas <bhelgaas@google.com>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, Jens Axboe
 <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org, Logan Gunthorpe
 <logang@deltatee.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin
 Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 03/10] PCI/P2PDMA: Refactor to separate core P2P
 functionality from memory allocation
Message-ID: <20250926081350.16bb66c8.alex.williamson@redhat.com>
In-Reply-To: <20250925230236.GB2617119@nvidia.com>
References: <cover.1757589589.git.leon@kernel.org>
	<1e2cb89ea76a92949d06a804e3ab97478e7cacbb.1757589589.git.leon@kernel.org>
	<20250922150032.3e3da410.alex.williamson@redhat.com>
	<20250923150414.GA2608121@nvidia.com>
	<20250923113041.38bee711.alex.williamson@redhat.com>
	<20250923174333.GE2608121@nvidia.com>
	<20250923120932.47df57b2.alex.williamson@redhat.com>
	<20250925070314.GA12165@unreal>
	<20250925115308.GT2617119@nvidia.com>
	<20250925163131.22a2c09b.alex.williamson@redhat.com>
	<20250925230236.GB2617119@nvidia.com>
Organization: Red Hat
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 25 Sep 2025 20:02:36 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Thu, Sep 25, 2025 at 04:31:31PM -0600, Alex Williamson wrote:
> > On Thu, 25 Sep 2025 08:53:08 -0300
> > Jason Gunthorpe <jgg@nvidia.com> wrote:
> >   
> > > On Thu, Sep 25, 2025 at 10:03:14AM +0300, Leon Romanovsky wrote:
> > >   
> > > > > It would at least make sense to me then to store the provider on the
> > > > > vfio_pci_dma_buf object at the time of the get feature call rather than
> > > > > vfio_pci_core_init_dev() though.  That would eliminate patch 08/ and
> > > > > the inline #ifdefs.    
> > > > 
> > > > I'll change it now. If "enable" function goes to be "get" function, we
> > > > won't need to store anything in vfio_pci_dma_buf too. At the end, we
> > > > have exactly two lines "provider = priv->vdev->provider[priv->bar];",
> > > > which can easily be changed to be "provider = pcim_p2pdma_provider(priv->vdev->pdev, priv->bar)"    
> > > 
> > > Not without some kind of locking change. I'd keep the
> > > priv->vdev->provider[priv->bar] because setup during probe doesn't
> > > need special locking.  
> > 
> > Why do we need to store the provider on the vfio_pci_core_device at
> > probe though, we can get it later via pcim_p2pdma_provider().   
> 
> Because you'd need some new locking to prevent races.

The race is avoided if we simply call pcim_p2pdma_provider() during
probe.  We don't need to save the returned provider.  That's where it
seems like pulling the setup out to a separate function would eliminate
this annoying BAR# arg.
 
> Besides, the model here should be to call the function once during
> probe and get back the allocated provider. The fact internally it is
> kind of nutzo still shouldn't leak out as a property of the ABI.
> 
> I would like to remove this weird behavior where it caches things
> inside the struct device. That's not normal for an API to do that, it
> is only done for the genalloc path that this doesn't use.

My goal in caching the provider on the vfio p2pdma object was to avoid
caching it on the vfio_pci_core_device, but now we're storing it on the
struct device, the vfio_pci_core_device, AND the vfio p2pdma object.
Given the current state that it's stored on the struct device, I think
we only need a setup call during probe (that could be stubbed out
rather than #ifdef'd), then cache the provider on the vfio p2pdma
object when a dmabuf is configured.  Thanks,

Alex


