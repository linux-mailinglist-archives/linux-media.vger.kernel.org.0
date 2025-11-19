Return-Path: <linux-media+bounces-47408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EE5C70DA9
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 20:41:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id DBEA128B70
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 19:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB56130ACEA;
	Wed, 19 Nov 2025 19:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="bPc6S0sG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D07034B420
	for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 19:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763581286; cv=none; b=hWjFSEeLoyF0n0CPQKb75ZrGw7+nsWPK7Fl4VrlTg6k+RJp0+2WfEbl9GeZAZPK6keJQqqOrSXdts8xGtpL+T1SYouCYFRKquHVhR5oQdS8oKfHUxoV5e5d4KRFjXWyx6Lsm6NCzD+St2fpriM4kCgsBf4lmspIerEMDTjpQR6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763581286; c=relaxed/simple;
	bh=McLj5MkyXM/EMQB5rQ6xp2qJjBV3WgZDPtIMlF++SQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TPJvDXFnL/Oqb/YlqmXbr9nPPafcHKdT5gSBOwdaUMJ0b64wMLxQcJ1dUBIbkUeFDyd1qazVMiL/+sBGukPK748Yt+SM9hmCZNfjSsLRjYue65z30EzIfr+7vr82wltYJjL2EFnGVjWnOUw6JzvT3YO1t9syFjkU4yxOZ13+C+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=bPc6S0sG; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-880503ab181so1063556d6.2
        for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 11:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1763581282; x=1764186082; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1xvMcuBzJSIcfclCVWQ2hNnnKt+oezBHS+z89ygHsa4=;
        b=bPc6S0sGuHmGARD8ZnpZfpm34GFSkaMU4OFxV21xf8BCKqrDuDP5OSlnsvWhrOxRZX
         YRPZGnk4HlFvvfrXi4vurzIIFGZbdxPcBWTX8paU27knM2Uy0YyHUQaP/SbIe5tYs25M
         auLCKa71tmA4b9oRJB7tRbZCJ5gzfG5IYHiXSYTTvrXL0H7m47vcmEcSh1dC+tawQWXp
         YjgAR9cFyUPRlIPRLolCsiWYZyfCeOsDfnC5AVkjTKAOixK9O2mV1jUfpr7J66CPzf0b
         DyQjsItU8VvA+A+r0bVuLpQU8+5hX+La18EKV9zTuaWbH9eO0dxkCMXRfCZQsRcT1Z85
         Faog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763581282; x=1764186082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xvMcuBzJSIcfclCVWQ2hNnnKt+oezBHS+z89ygHsa4=;
        b=BG7SBXSpBF5hOKNESC1SeNgZzztXJ40QIDVAMJ55DYnhwJj95GG0BfitZa9xMC96vI
         QeqRheUnMi/t4777IkTjfIU+ngDHo5zz5nmqSFaqWpQUwQpHdPKQTZewWQ78xd2FScC8
         IYcDrtvW7l8lhPhkm1EBPpwFngLfgyX0++rewrB3p0+3kqCPfyx7tkrbEcKizooSba17
         btLmjULPyLaqz625cnpZhgUA0cq8aH4Whnqtrh79C4PdaCoXxon78npNvTVI8RguD4tI
         oFH1yKvx0BgWnGz+W/tLsWoYmeN7iQ4peEUhFwxH6ljuQJdkJ4IAnkFy+vVh+THy540V
         qaQg==
X-Forwarded-Encrypted: i=1; AJvYcCW1do8hLzgOGMNC1y61xoRi2Gwtlb9NPogTnsz+rblA89L5lo3pZXnuMA5d63ErHohwf9wt2QC+yl/fQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTrjZ47sXzSrv+dBQve8zP4yUnb0XwmjfeW+pOrd5QIB6lXWib
	bUAI33WW+4GCpfHATzMBIU6qhMhPsOzPJu9nBZkntz3wSDi56VyU45PEzjaBigoD2bw=
X-Gm-Gg: ASbGncswB7Z525uQWtZCcwMG9W1Dohtg6G9bSjiZwj/3/QoRZu1cfOHEko0gFO/oNbz
	lYUWd1KwxgIAp5p2xCFHhVhEuD2UvcuLoIrw3lSsUlcFU6gSewJthwVp8npkcP5qLQhUzLoxBTh
	hKWSOKJAasBODZqabACjmlI5uN+vRiyPkTRkUIuExI6qtzvBtK9/Zn8y1vNNjnpgsP8iaff75i2
	L2SG9EYta7fivFdk+Db1LtgWuG47kqwMih/H9QL5oPkI3f7o8iHjgoV5NEv8n1Xid8bn8vwNjS7
	hjMRpkTpK3YUEFiP8kkEkB3jFnpF2EOcP5nGp0KO1uCX8NHFfeCp91uruFayU9/OLhIF8Xb+eTy
	q3hln/BMr4ut/GYdZtv+WK1QEsYkNiXs+2wNXdZ200X5SYsKJIwVG+GzhtIzxyHbVBT4CRnoJvx
	F9q97LCaUWXrtbo3vz1ECIdQEPj12rcAAMNPa44xlKKG64l9dJ/XYgGW7/
X-Google-Smtp-Source: AGHT+IEkkwKLlD7bgArhzanqcgyJXrNkTCLmX/zPs7UZp1FVMILPKD98FXvYwEVi1NAfBqdDip+8Dg==
X-Received: by 2002:a05:6214:4a84:b0:7d2:f787:1978 with SMTP id 6a1803df08f44-8846ed7f961mr1725046d6.3.1763581281958;
        Wed, 19 Nov 2025 11:41:21 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e47115bsm1948696d6.21.2025.11.19.11.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 11:41:21 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vLo3M-00000000bbB-3imG;
	Wed, 19 Nov 2025 15:41:20 -0400
Date: Wed, 19 Nov 2025 15:41:20 -0400
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
Message-ID: <20251119194120.GR17968@ziepe.ca>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-10-fd9aa5df478f@nvidia.com>
 <BN9PR11MB527610F3240E677BE9720C2B8CD6A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20251118142849.GG17968@ziepe.ca>
 <BN9PR11MB5276EF47D26AB55B2CD456EE8CD6A@BN9PR11MB5276.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276EF47D26AB55B2CD456EE8CD6A@BN9PR11MB5276.namprd11.prod.outlook.com>

On Tue, Nov 18, 2025 at 11:56:14PM +0000, Tian, Kevin wrote:
> > > > +	down_write(&vdev->memory_lock);
> > > > +	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm)
> > > > {
> > > > +		if (!get_file_active(&priv->dmabuf->file))
> > > > +			continue;
> > > > +
> > > > +		dma_resv_lock(priv->dmabuf->resv, NULL);
> > > > +		list_del_init(&priv->dmabufs_elm);
> > > > +		priv->vdev = NULL;
> > > > +		priv->revoked = true;
> > > > +		dma_buf_move_notify(priv->dmabuf);
> > > > +		dma_resv_unlock(priv->dmabuf->resv);
> > > > +		vfio_device_put_registration(&vdev->vdev);
> > > > +		fput(priv->dmabuf->file);
> > >
> > > dma_buf_put(priv->dmabuf), consistent with other places.
> > 
> > Someone else said this, I don't agree, the above got the get via
> > 
> > get_file_active() instead of a dma_buf version..
> > 
> > So we should pair with get_file_active() vs fput().
> > 
> > Christian rejected the idea of adding a dmabuf wrapper for
> > get_file_active(), oh well.
> 
> Okay then vfio_pci_dma_buf_move() should be changed. It uses
> get_file_active() to pair dma_buf_put().

Makes sense, Leon can you fix it?

Thanks,
Jason 

