Return-Path: <linux-media+bounces-51239-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLL1JXrbcGnCaQAAu9opvQ
	(envelope-from <linux-media+bounces-51239-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 14:58:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E52958075
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 14:58:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F04CF80D92C
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 13:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B15A748AE21;
	Wed, 21 Jan 2026 13:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="P5aUjMGQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D85041322D
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 13:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769002314; cv=none; b=PkQCV0PM+G6g04Qz9wryt0klvXIzeLzZ1+xsJDto0YXHPLwyNXRv6R8aTBFCb5/tCigj2heTq6AutZ6rVjCjyoX44WV+sq/Vdt+jLZQus7PELd6EVwr7WxgRgN+Yam8IWi/05jWtCnJQyzA3upYdQ3Efhjt4IHXt9zRg/Dtp4yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769002314; c=relaxed/simple;
	bh=DcH9k9Tlh2c03HyU3Zw/7RvqbH8v2zIC0lTji3hhsSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hhut56dTzP43yzH0m8qPHM3GLBPwL7HeYsYqCb8v5YbBI2r7bwb9Hj09eqb+vcsjUdfT4/cP+ZpYgc7BZTWHxtI2KKPtUPG2K5MBKa00gwyH7pT2RnWmIgh2C0N4AUfiFis341RYdP66P0RzNO1Y/NTOb/4+ByL8kEyRYmrpe1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=P5aUjMGQ; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-501506f448bso38536901cf.3
        for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 05:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1769002311; x=1769607111; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aX294P4TliS2B0BrPhrC1yfpgvWNBReUGID/aL6TSBE=;
        b=P5aUjMGQISabFbWzdwZIeIsxiY/Fo7Sj8NcPubSkJeDIbfKV0j4TE2rUdb+56AcE5T
         ZLKr8CqC4+gBRW5S0ZIdfWYshrEfWq2QkHCs6J/1Zzbsn1a53UZtNJ5Z1ToViw6htJ4q
         3R3Cg/7AnC4PEHBR7Rutkjb4sAl/eMo56ydB3XQIkPE2yDm6fDgtrasJT3QCV1u2PiM7
         lGM3DosoiavJOnvKqIho+6VmGc8+gcBKQSf5iLajfy5PPsdCyLZsrHP3sf5tVsfUF6Ov
         M/T/PYVqGP7toMUFrbNpfjZoie7MmXMT5ASm5Rs2ZHfGacKQfHrTqzaxW1tfcE65pDLC
         iwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769002311; x=1769607111;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aX294P4TliS2B0BrPhrC1yfpgvWNBReUGID/aL6TSBE=;
        b=X6XsJkVOG3EcfHHmuceqQp5cWCpxcZyQU/CenADAXJErz3zAyZcbA5PfhDQ3MxPyh0
         ImKmU1KB9V0p5WT5wzxzjZukeYVEAI6IUiIslesqBfkG4pg12vS7Jh3hSzkFaY3spfVV
         k8/ZcUZzUO9xnw8zkqdqz9828Oe8NuANpM8vbpUwhpIgengvps55oijJuRc3JoQoFXZN
         8aU80yfygvlagxwQLXLt0QX8ARs36wVf7S2Rkz01oRADx/b9BGvr9tAMLU7I/VnR8ruj
         SSRLx8TRsGRm0CY1uqwJ0u4ALQtagAmVv9c//+iNnHPPHmmYfNyT159C/bNRTtgmSfK8
         eOEg==
X-Forwarded-Encrypted: i=1; AJvYcCVj2/ApJb3vBxTJ1/KiCUrJSrEdg5MBRV33WUIr5kRbg5ToWAW1wvoddbsRCPyuZDZAp0hsyg4joJeF8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YynB/3GT+V25e3KjwpVx4WC7ah2vvMea2uB6XKI0320d+Y05+o0
	IiDwbVzJ+7gvpf7QGglD2Z+Z5RNaMGIgHIAEaYrgQhfM8eRpsv+2sUbOwRXDwTFHOuw=
X-Gm-Gg: AZuq6aLSvM+frUu67DL4CgkATqKKormTwx3hdd5wnmw2hjFBjsI0MzTrYJNRkrPAFA7
	OZPJKjxnC6KNz3glrq1r5zZDhe+mxLIvgrEeHN/lgtifd+vYlEvAgSYPXGYuVLI9qK7cM2zjztz
	nNukPgg4XNwtilMi7zXDk838t85lMUekRpSG4xhqnfjAb7nZqUhfBD7DJqD7UOksxHxo6y59evH
	c49Xl6vPn1/PI6XNKZa+0x1QAJDl6KxLEKP49NUiFs16lE6gwZ9sy+PDLkVj+4rW8oM8Of3gWuD
	uHvlk3uIk7Tqi1SVzPgaKc10ghQGY13TjDZRIZnB1YV6EXIkIAXZ7ajj3vuy6PSuzrwK/zsj4qG
	qPQL2YCt7VaF2r5lCcotP1qZRT479gA7I+o7O/pA7ZT32RpxTDy0fiVFhgMmm6HRhqYzZ9D7ftc
	BuFIeQkod9jD0bqexUJEUM8mfhk0pnfs7NPEU2VkPXDUgcvSNtGMPxDlEYeB1/ljtieckU1mgQw
	9UJUw==
X-Received: by 2002:a05:622a:1aa1:b0:4ee:2200:409e with SMTP id d75a77b69052e-502d82772a6mr67009251cf.4.1769002308002;
        Wed, 21 Jan 2026 05:31:48 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1f1c1c4sm108692291cf.33.2026.01.21.05.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 05:31:47 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1viYJG-00000006Dbm-2x5v;
	Wed, 21 Jan 2026 09:31:46 -0400
Date: Wed, 21 Jan 2026 09:31:46 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
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
Subject: Re: [PATCH v3 6/7] vfio: Wait for dma-buf invalidation to complete
Message-ID: <20260121133146.GY961572@ziepe.ca>
References: <20260120-dmabuf-revoke-v3-0-b7e0b07b8214@nvidia.com>
 <20260120-dmabuf-revoke-v3-6-b7e0b07b8214@nvidia.com>
 <b129f0c1-b61e-4efb-9e25-d8cdadaca1b3@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b129f0c1-b61e-4efb-9e25-d8cdadaca1b3@amd.com>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51239-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[ziepe.ca];
	RCPT_COUNT_TWELVE(0.00)[34];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,amd.com:email,ziepe.ca:mid,ziepe.ca:dkim]
X-Rspamd-Queue-Id: 0E52958075
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 10:20:51AM +0100, Christian König wrote:
> On 1/20/26 15:07, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > dma-buf invalidation is performed asynchronously by hardware, so VFIO must
> > wait until all affected objects have been fully invalidated.
> > 
> > Fixes: 5d74781ebc86 ("vfio/pci: Add dma-buf export support for MMIO regions")
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>
> 
> Please also keep in mind that the while this wait for all fences for
> correctness you also need to keep the mapping valid until
> dma_buf_unmap_attachment() was called.

Can you elaborate on this more?

I think what we want for dma_buf_attach_revocable() is the strong
guarentee that the importer stops doing all access to the memory once
this sequence is completed and the exporter can rely on it. I don't
think this works any other way.

This is already true for dynamic move capable importers, right?

For the non-revocable importers I can see the invalidate sequence is
more of an advisory thing and you can't know the access is gone until
the map is undone.

> In other words you can only redirect the DMA-addresses previously
> given out into nirvana (or a dummy memory or similar), but you still
> need to avoid re-using them for something else.

Does any driver do this? If you unload/reload a GPU driver it is
going to re-use the addresses handed out?

Jason

