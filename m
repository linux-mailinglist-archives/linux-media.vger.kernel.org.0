Return-Path: <linux-media+bounces-42996-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A00EB97087
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 19:31:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26C802E523F
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 17:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7613C280305;
	Tue, 23 Sep 2025 17:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ye4tZjGe"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D39267B01
	for <linux-media@vger.kernel.org>; Tue, 23 Sep 2025 17:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758648649; cv=none; b=T6F3a/NJI86eZDH3yM7Os6bEo2lfDaWEiGoppg4a3er6YedHDlJ2sD5gL0FX4XYLZW0hLrRw69sBRpWsEN0/3e68KwR7mhAvzmG+7p0EG+jXlX6PHYM2znjoQEHemzs68OzvoiiqJMgxJ+wlYdbG7QRE22/t0EWOMR309G0j+do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758648649; c=relaxed/simple;
	bh=5WraoSFUp6ajvbI3o5JH4FWFS36gY332T+fZ2BSIiD4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WYUbDTnSdy/H43M+evf2i0UmR8oeQN1Hz/OFulspdvBstO9Uui31t7smwxsBR9skvrcW6X4gEsPS3xCMaUR1HRnJ4/XdlGiIxSICSiEv+roGBjhDddn6BXFKfw3YCAFtBEt51SA1ljTgnUyvywOq1HoIROVx/NsazynI3Plu/48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ye4tZjGe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758648647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OFNQwbdODcls1yBrLTyCkOTsxOyxsNLxzpt49nq+oT4=;
	b=Ye4tZjGefHj0fV2k1fuaSh/GNWTAXMlo9tPp0qgXfjKm/IaL3BsqW7Up09IYvg8SbqFuoy
	Wb25z6WmpnMFyYXSZp7XApCUCRMCzUQAAeWErpn7ogRNLCiJ5GKYMgG9/WHnW7aqaxwBZQ
	p8w89A+3qwxavIFUbCueulzS0GgNMNw=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-AV__lY0zM-OTqm0H19LLng-1; Tue, 23 Sep 2025 13:30:45 -0400
X-MC-Unique: AV__lY0zM-OTqm0H19LLng-1
X-Mimecast-MFC-AGG-ID: AV__lY0zM-OTqm0H19LLng_1758648645
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-4258981d664so516295ab.3
        for <linux-media@vger.kernel.org>; Tue, 23 Sep 2025 10:30:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758648644; x=1759253444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OFNQwbdODcls1yBrLTyCkOTsxOyxsNLxzpt49nq+oT4=;
        b=FmObAjn1l01/ACsoMF4EE1/XvvehUWYmJI1tU+tsCZA1lCRhOmjiYHzjkU0Q5cp+PG
         f/yEnfpRrAAZxYsr34H/gp9/9LwCsaKIecVUFbUw3rMIeJP0zeohcZedbOPIk8mY73hU
         SZ0BIfpZgfCvPazuWmqyJbgO+xaI69xF2DR1OcDmHBB4FSK3XC9uMassdoOw/huXFjes
         J0OhabVbNquupAbWzDs2jSsoE31C9TFe9vdSCuXWZaSBqVz1QAF3HFWduw3wf0kwG9EK
         wC18OkGSWyZFwPODfP4hS35L6/Pf3IrGa2uDvzc+/9u8kDec6BQZKw4pQfu2Go6Y1kMn
         i8FQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5dobdqsUpz/4VZdvgiUk5E+M3YgQiPtUVVy82l/Tfupx07n083S93cwtB3YTUPJsybdZXxi4MnmJAPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm3/iwG/XgQy/Fh5QqKd942E31PZVHjcDswGW8LHDbgp+Jiq8B
	f0ckI32ZMQbdjyAb+4R4hTQysakhcSQZ3LCODMh6dmxeBTtjs7DqRcxlSGsmFPMxkgD6OIE6LiC
	XOt7lDKm2+t4KmGAgcwPitF5TwrF1/Rh/ONkBYak+Q/gGuZ22TYJjvK626EvmGaZg
X-Gm-Gg: ASbGnctN13e5ibqtFLg7ms2yAn+YiWHA2up66Xh1aPxL8Sdijyt10HkWNvCTljMHjQf
	oAOqShgBLQcaYDhEIS6D45Z/qGtOp0qfNr4JhNqtgeXDXM6X8W8cul9+l5URlJ5H60RvraIpIbW
	GQei6XyCYt9mgP4unikrNi/4K+RxlpDB7SnyzB6E0LQLW1Qp7rOU/lAGnFJU611/JrWE/jZu6lG
	fbnKLkyk5vGcZDac8J1DGVDEc2TS/mgK1iCM9AJrCkGtojNuL6cdjsab+Sc0Lr7xo4moeo2MZ/1
	J+8W5nrhBkq0WV0LAYUUfvlQg+aRNmcbwC77aFgBh3I=
X-Received: by 2002:a05:6e02:164d:b0:400:7d06:dd6d with SMTP id e9e14a558f8ab-42581e09c50mr18781045ab.1.1758648644614;
        Tue, 23 Sep 2025 10:30:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNobmhXZYu8wcE6bAQtE0C6wCF0m0+GFNpZFLyv2Bpb6JP547FE77pkIiIGw0EG9S0P84Gyw==
X-Received: by 2002:a05:6e02:164d:b0:400:7d06:dd6d with SMTP id e9e14a558f8ab-42581e09c50mr18780695ab.1.1758648644175;
        Tue, 23 Sep 2025 10:30:44 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-566127693e0sm275326173.30.2025.09.23.10.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 10:30:43 -0700 (PDT)
Date: Tue, 23 Sep 2025 11:30:41 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>,
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
Subject: Re: [PATCH v2 03/10] PCI/P2PDMA: Refactor to separate core P2P
 functionality from memory allocation
Message-ID: <20250923113041.38bee711.alex.williamson@redhat.com>
In-Reply-To: <20250923150414.GA2608121@nvidia.com>
References: <cover.1757589589.git.leon@kernel.org>
	<1e2cb89ea76a92949d06a804e3ab97478e7cacbb.1757589589.git.leon@kernel.org>
	<20250922150032.3e3da410.alex.williamson@redhat.com>
	<20250923150414.GA2608121@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 23 Sep 2025 12:04:14 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Mon, Sep 22, 2025 at 03:00:32PM -0600, Alex Williamson wrote:
> > But then later in patch 8/ and again in 10/ why exactly do we cache
> > the provider on the vfio_pci_core_device rather than ask for it on
> > demand from the p2pdma?  
> 
> It makes the most sense if the P2P is activated once during probe(),
> it is just a cheap memory allocation, so no reason not to.
> 
> If you try to do it on-demand then it will require more locking.

I'm only wondering about splitting to an "initialize/setup" function
where providers for each BAR are setup, and a "get provider" interface,
which doesn't really seem to be a hot path anyway.  Batching could
still be done to setup all BAR providers at once.

However, the setup isn't really once per probe(), even in the case of a
new driver probing we re-use the previously setup providers.  Doesn't
that introduce a problem that the provider bus_offset can be stale if
something like a BAR resize has occurred between drivers?

Possibly the providers should be setup in PCI core, a re-init triggered
for resource updates, and the driver interface is only to get the
provider.  Thanks,

Alex


