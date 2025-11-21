Return-Path: <linux-media+bounces-47530-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F3FC76C47
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 01:25:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D509A35329D
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 00:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B9425B311;
	Fri, 21 Nov 2025 00:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="X0nsss1q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E2E2459E7
	for <linux-media@vger.kernel.org>; Fri, 21 Nov 2025 00:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763684629; cv=none; b=jk1uTSxNAQuGt3O7f5Yb+iFYNZgEwkgz/bbx/Nj0ft6VpHUyuCNWymyepF81jrfJVa3Urb+l4jgQEzFyTUEADkNKrxc7rr7grp30z5GKrFvkNkulD9N+d6orx5pqRcMapruWiGTlBOVlfcV3jCDszR8NQPqCFtgRd+8wuYb2pYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763684629; c=relaxed/simple;
	bh=rSFCVYBQGHYIVw4AaRKYw6Ay38HyAtjHDSJOWPLks+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ANSMFktBmjJjzVahrG5RhY4gLyrzNSdG2G+MGp55ScBaplrnzDexbnglq8prCliJFzN7rnMPAPM8tAfrFVo1qbasy+JZHvd6Zf9TiTPFGXUoVRg7TaxREB0hplkF2+wlyUfIyV4EytfO2+LuZSffHUbggiHi23rNonEIxQYi//E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=X0nsss1q; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8823dfa84c5so15629136d6.3
        for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 16:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1763684626; x=1764289426; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HeoQ6A9zQA47pPVQ4WN0R1Mr0WB5BGBDvzJz+/SIjn4=;
        b=X0nsss1q1dQAqvVQCjfcM7UUewWlBvLurLKTQOkoLVBJ11Zbv8ClxmGVsU1Bo6EF5b
         qB1Gi2Yhtkul9cgel4Ab+PKL3kmhaxR19s/esS9Nary6n06TyegRG022N0a1RmQ8sFQJ
         Ar/lOjV0WQuho9a2OOlwX2VRTf+i183+ahDzvYQdBGOKzztulAsjTqiXgnQP438u63kz
         84HsJu/Oi7pdM7HSBpBL0ajrrzV4LFaclFsAjGqTlANxGvWpGEGC8h7B/dZ7yx5ZuK5v
         9BQIRbH7CWDiUe1Y5XDQZyyKT8tkkQWxTuthpFeNHPLVryv7gw6vE+thgY7MLcr+xgTz
         DZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763684626; x=1764289426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HeoQ6A9zQA47pPVQ4WN0R1Mr0WB5BGBDvzJz+/SIjn4=;
        b=lNaZZN3DHgXZ6hKeyX7PAQPb62xLx1JNsjPGG/FuY3nDRwpA7MtjWIQojb1Deo2M0U
         QigLmXYth24P3/Nh7eod960WbRscApr9TGqnbOC8S/ibgrB62plt3Fmr1OIlrCX4VoAA
         /q6+u1iqMWPMYhZzZpB7zfWZcIuwKG1x9nuS6TrLnqpuqkZCGnf1meoN3V+WG76vSijt
         Usp4O0bqkQRvUdrh95Bws7ikiY1Y+Zim+xM0To9m4S4Etl+RBQuz5xG7l35iPqaFHY+B
         iM/0bXxtBBUUHsDVtUZ0RQg+4fP7n868s8bVzIgouRUeI/V5k2SEZKKR3o3/QNzNimqP
         H/xg==
X-Forwarded-Encrypted: i=1; AJvYcCW2Vrp722zc5+K9AsVYChk/v7YIOZDVTFzeT7YFpmp6ljcYG9HXEBPJwOq9uPxQbIVbMHxTi8ZUZ3DGYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQNHZ9/crz6+uvz/O2YOXH3Y8lvY5E7wsthr68/6B4jlcR0a6R
	3tqtu7pbc70rB6yskCFaN6X45rssEVemFxzTf2hi387iP3ACuOqkt+ps7Yez1s40mHA=
X-Gm-Gg: ASbGnctaL/QvDxfTK69i5l7QvPA3m4Bs6bpiB5OgWZjD94b5ETuh9J3lmEuIAY5mAQq
	ClI5EUU/aRERxPyT8vZ7bL+fe/TWrfwRq2yxXphvrKTa/Il+gpKVrk74zV7wIOrkAICNGYan+8T
	ZaNzy/vGRxmZwH/Qk47iPTPtIpPcFG43fEXXA/9u19OwPZWS4mdVKULUesz5z0QwtAdAQzd2QjJ
	xRyzOK2EVsIIrnu2BKH9+pHnfSKc5IeryIEP0KiitB/Jamp+1OPuIUq2uJK60N6lX++Soz1GkHx
	Wk5gMhxE3lBbXAtExIX/w2uE2qxPCpK413S3cu95mbV/7zcjxjiGetjeQqy6MsbjLMYjae/rwRx
	HgU/dLEuwN+2t6IqKh3wcn9SyhRVTTDXzrqo563juQy1eDYNWLL7Yy9/L9Lrt8/ZF3rzeMtkwHw
	ZAliEeqh4aLGIj1IbQoxP4KcPzFHXuWSzSWjMGfnq0XxZktH2Ih1S2pUoc
X-Google-Smtp-Source: AGHT+IF9fpUZC0KSEi60qYSTXqU5TN/0kv3Br6v+7st2smYcT5XQOEwOWy/F2amvDq4QuChbOli5Vg==
X-Received: by 2002:ad4:5d42:0:b0:880:2c08:88e with SMTP id 6a1803df08f44-8847c5206f8mr8425876d6.45.1763684625945;
        Thu, 20 Nov 2025 16:23:45 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e472ae1sm27645766d6.22.2025.11.20.16.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 16:23:45 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vMEwC-000000016i7-2ZE0;
	Thu, 20 Nov 2025 20:23:44 -0400
Date: Thu, 20 Nov 2025 20:23:44 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alex Williamson <alex@shazbot.org>
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
	Kevin Tian <kevin.tian@intel.com>,
	Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, iommu@lists.linux.dev,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v9 10/11] vfio/pci: Add dma-buf export support for MMIO
 regions
Message-ID: <20251121002344.GC233636@ziepe.ca>
References: <20251120-dmabuf-vfio-v9-0-d7f71607f371@nvidia.com>
 <20251120-dmabuf-vfio-v9-10-d7f71607f371@nvidia.com>
 <20251120170413.050ccbb5.alex@shazbot.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120170413.050ccbb5.alex@shazbot.org>

On Thu, Nov 20, 2025 at 05:04:13PM -0700, Alex Williamson wrote:

> @@ -2501,7 +2501,7 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
>  err_undo:
>         list_for_each_entry_from_reverse(vdev, &dev_set->device_list,
>                                          vdev.dev_set_list) {
> -               if (__vfio_pci_memory_enabled(vdev))
> +               if (vdev->vdev.open_count && __vfio_pci_memory_enabled(vdev))
>                         vfio_pci_dma_buf_move(vdev, false);
>                 up_write(&vdev->memory_lock);
>         }
> 
> Any other suggestions?  This should be the only reset path with this
> nuance of affecting non-opened devices.  Thanks,

Seems reasonable, but should it be in __vfio_pci_memory_enabled() just
to be robust?

Jason

