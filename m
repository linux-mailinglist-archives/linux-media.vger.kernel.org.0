Return-Path: <linux-media+bounces-60397-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2xoSICLO+WmuEQMAu9opvQ
	(envelope-from <linux-media+bounces-60397-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 13:01:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0F34CC134
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 13:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24D0730A6744
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 10:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7678348896;
	Tue,  5 May 2026 10:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="da+b6HqW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4236430F934;
	Tue,  5 May 2026 10:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777978158; cv=none; b=QcHoeY4dYIwV63JFeCwepnBeE9TwFBOAjTJBTbqGnpmuJljoyH/kzANwVS242Ii9d5N2HytLiQccojYjVsvKjh8IIwNlNdvDGPEV1lySgYvqxMsUyH0yL0dQumB6YOVH4N5AYCeqkfnIg5R2Zl4hIw8jjTqpuEaVfcXtVxh3UDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777978158; c=relaxed/simple;
	bh=VwbDdX36fjXj6/K+MlyisBmDaAMjjmJqPH15dknt6nM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6xqBLQNQ2IT7yAHQZT13b0GQpJ4x+hXQhd73EqjaRnO7vjHcCbAHe8Pmc2L9Meru3LfybnUVW0uZ22Dc1vjAYLWJVMZOTvpFfIJ19D/9WN4KlGqwHxt+l65hWOVuFR0RAXud87aRQPVHX7n4VczV1DZSdxih8lnzjsbVFfE65c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=da+b6HqW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F041BC2BCB9;
	Tue,  5 May 2026 10:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777978158;
	bh=VwbDdX36fjXj6/K+MlyisBmDaAMjjmJqPH15dknt6nM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=da+b6HqW0iC4iVIMeqmLLKKYUyCkC20+EKjgnNIOfhj0BOoavtxV+TYZnp+psCoog
	 ymO7YYB0UB696539X9HSdwlZC4xNXn9or3FMBnkO+Ezj24w5unfS2tNhDb4JPYthH7
	 10XIF+45HCSplMR5GAXyevwU4QS9hzTUZw+sVqny/1Ws3hfOayG6exEzqrviw3MwOi
	 8VEzi0hOK1qw7W4YjDScYqzYNPAhDCx0WgFReAVnfrhZh8cZ7mlQBTiaKSLO9hDYVQ
	 M+ZFZ1KZefRb35bruPCMTxi7eVWk3jawx4j45akPoDIHuqFWHNrli2mZo4tdvIDFvG
	 6oDB5sN1PmQ1Q==
Date: Tue, 5 May 2026 13:49:11 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, Matt Evans <mattev@meta.com>,
	Alex Mastro <amastro@fb.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Mahmoud Adam <mngyadam@amazon.de>,
	David Matlack <dmatlack@google.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Alistair Popple <apopple@nvidia.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	kvm@vger.kernel.org
Subject: Re: [PATCH 4/9] vfio/pci: Convert BAR mmap() to use a DMABUF
Message-ID: <20260505104911.GB11063@unreal>
References: <20260416131815.2729131-1-mattev@meta.com>
 <20260416131815.2729131-5-mattev@meta.com>
 <20260501161915.75525c15@shazbot.org>
 <afhNeYS174EW7RYp@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afhNeYS174EW7RYp@nvidia.com>
X-Rspamd-Queue-Id: EA0F34CC134
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60397-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leon@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Mon, May 04, 2026 at 04:40:41AM -0300, Jason Gunthorpe wrote:
> On Fri, May 01, 2026 at 04:19:15PM -0600, Alex Williamson wrote:
> 
> > Exporting dma-bufs from vfio-pci is a feature, but mmap of MMIO BARs is
> > a legacy requirement.  That legacy requirement now depends on
> > PCI_P2PDMA, which depends on 64BIT and ZONE_DEVICE.
> 
> That should be split up now, Leon missed it when he added the new
> APIs that didn't require ZONE_DEVICE..

Sorry, what did I miss here?  
VFIO_DMABUF is an optional feature and is enabled only when P2P support is  
available. It does not affect legacy systems where P2P cannot be enabled.

Thanks

