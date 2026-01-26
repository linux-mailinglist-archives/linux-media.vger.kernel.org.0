Return-Path: <linux-media+bounces-51593-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MExjAivWd2mFlwEAu9opvQ
	(envelope-from <linux-media+bounces-51593-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 22:01:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3248D6DD
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 22:01:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8C4E7300A264
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 21:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00CAB2DE6EF;
	Mon, 26 Jan 2026 21:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="V9H7+3Id"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFFF224B0E
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 21:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769461273; cv=none; b=FU04W3+hXH6LCIAtMHY4WmfbF8D2USTRuPEL3SKA5Jt/TPtTXgwXu9YVbkerb5EGQpION2ovQJ5is1UPHAIVU5WcacKGsllv2yoB8DgkmaK4uJjAR1OsblxL2f9kefdjX86T2rwsfLUxctFS/FhhpmxAJM//oMZ8452UIWAlyi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769461273; c=relaxed/simple;
	bh=/uBBJ41PsJ+poHfkbr45RI19WGdtV1Pwu8dAjRjrE+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MPn2q2yFXD2urHYCmKUOaQFrf1Wzuz8RGUhoSGA5hqXk7lOvFFaWnJlN2pxOV3L9rEDJqeoTYt4LZDvj2q1A3N41/tvKkrMFH1bd2zoneiGkbGHecnpSEqMCUMv7xGHfDccNow/TGHZNToA71B9f9vIk6C91v9r7Jfb4WZeHLxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=V9H7+3Id; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-88888d80590so85282966d6.3
        for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 13:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1769461271; x=1770066071; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tu3uAyHuSXXXZq6VSWtVG72sHh/RWKg7/MHSYDvcONg=;
        b=V9H7+3Idk+sIAFevqUXVEpK+mTKlHABOW2S+GVajpGNFMc/qDA2vun05ep798kV5FS
         vViiO1MjGIWm2dRrzxCLj309UMGTSn61IQzvd+aiZMmQK6dD7ydt7quMEH0p8V4avKRd
         CXYlVfypwhbGaxaXUZmin/cwGOfH2a2VJvZhJf6x+Wqa2VLUYgYdS0tASsE/k8YZ/55P
         YaL6RaFesydc1hGo1u3yPbBe3TTIMy70Bgm7r8sTloVNQYE+tiCoVCK/kgmGjpKTocwj
         xo9M6WJA8jeIHXUkbI3Hw3PlZV7XoSBOozkqXNQuARwhrRXzCEdDhqnrk6bwnYj+1qj1
         Fp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769461271; x=1770066071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tu3uAyHuSXXXZq6VSWtVG72sHh/RWKg7/MHSYDvcONg=;
        b=vizzQZSyXCqtqGGy+62GTGrAoLuClOzUzgkwOXX9LQtUIS49gyGErOTHafM1aq54Sg
         nLj9lCjUbFl2OffOPjkKhkctLoib7ff4SRJGA1KADfZJylP/tu7QDoM3kgMU/nqaRlmx
         ROpxeEulHnUcw6Dj+R9u8Nwkv0iyckymU08udtT1DHG1UBdFEWH+dB/n23LWIql2+Olm
         Q3h5qGa+MaxPQhqt9r51mtmnkwcXy/lACpFM981BOuGNPsrtJFqr0A2vWugqu6B4v1xF
         jluWHDRijOg4GtcFsLFSf6UY6LV8Rx64wbO4+kufQsbg6/V+YDcfK1gyjFaVrGZjxktd
         lLVw==
X-Forwarded-Encrypted: i=1; AJvYcCXKur3HzYVGqCL/4fSUr0c+hnNHgvFM4r8WcD07TyJpec8FLy+BblX6ZCrfd94/zJFBhSvKMXHbxJW4Vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTNMLgOO3Stmxes/vMaCuU9NKHfYLsMeUaqZ/L/9SBMCOzTJhq
	3m7aAKQhZb75w4hMpfKqdGbXwcOVmZYL7DbD1dbQ25vS3OWBJzvego4srRZvC2mO3EI=
X-Gm-Gg: AZuq6aLftyhw1AR7dwBRZpwrZ3YpWMscmOghy6d6X0Mntj5x+o6TRKkutGu2GioB11P
	nkKEeptg0jM3/XBQPHvIPGHJvCTAp+dkVUFxbhj0tVjkbwpkqc5i+bDzy6Vsjv3tywlv/I1FPXL
	zIVREb0vElsIXQQwAyd3txKfQdSWSix94BtRo9QVRXpRy90OqXc2yH+WupBrHIvzSQl7AbDuSfN
	bT0PT5Y3TVsle6cQB7O62X4Rj3Rm2GxuMlhEc8961oF2DZIJ3s4nxBMHSUzrYUE7wNrvZweeyVO
	WuDGjnCs77RQeQaLFkaMGTC+xnUjGe5eLu88T7FfpxcCRw2BbWS5Rx+SFpiCu8AWj8KOZy1NAOv
	tH0+oE84czt35NurvPwlUA34AItmYqbSQJya7Pt8Zm9tymE+/o2+nZChoKZ5WZXT1NMGJpf9sKN
	ZgALvv2GUzCg21Rufv+F9DVXMm49myiGrNj2MysT1V0lF35qahg1D5FGbEhH0lhnqw0WA=
X-Received: by 2002:a05:6214:1cc9:b0:894:7b34:dacd with SMTP id 6a1803df08f44-894b06f336dmr73487126d6.31.1769461270245;
        Mon, 26 Jan 2026 13:01:10 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894918b1436sm104983856d6.35.2026.01.26.13.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 13:01:09 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vkThs-00000008z30-31vX;
	Mon, 26 Jan 2026 17:01:08 -0400
Date: Mon, 26 Jan 2026 17:01:08 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Pranjal Shrivastava <praan@google.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Williamson <alex@shazbot.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
	intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
	iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v5 6/8] dma-buf: Add dma_buf_attach_revocable()
Message-ID: <20260126210108.GD1641016@ziepe.ca>
References: <20260124-dmabuf-revoke-v5-0-f98fca917e96@nvidia.com>
 <20260124-dmabuf-revoke-v5-6-f98fca917e96@nvidia.com>
 <aXfQ1LFNDUrfeuHf@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXfQ1LFNDUrfeuHf@google.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	DMARC_NA(0.00)[ziepe.ca];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51593-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 4C3248D6DD
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 08:38:44PM +0000, Pranjal Shrivastava wrote:
> I noticed that Patch 5 removes the invalidate_mappings stub from 
> umem_dmabuf.c, effectively making the callback NULL for an RDMA 
> importer. Consequently, dma_buf_attach_revocable() (introduced here)
> will return false for these importers.

Yes, that is the intention.

> Since the cover letter mentions that VFIO will use
> dma_buf_attach_revocable() to prevent unbounded waits, this appears to
> effectively block paths like the VFIO-export -> RDMA-import path..

It remains usable with the ODP path and people are using that right
now.

> Given that RDMA is a significant consumer of dma-bufs, are there plans
> to implement proper revocation support in the IB/RDMA core (umem_dmabuf)? 

This depends on each HW, they need a way to implement the revoke
semantic. I can't guess what is possible, but I would hope that most
HW could at least do a revoke on a real MR.

Eg a MR rereg operation to a kernel owned empty PD is an effective
"revoke", and MR rereg is at least defined by standards so HW should
implement it.
 
> It would be good to know if there's a plan for bringing such importers
> into compliance with the new revocation semantics so they can interop
> with VFIO OR are we completely ruling out users like RDMA / IB importing
> any DMABUFs exported by VFIO?

It will be driver dependent, there is no one shot update here.

Jason

