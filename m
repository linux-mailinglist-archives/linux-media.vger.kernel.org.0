Return-Path: <linux-media+bounces-64977-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TZpGLpsNMWqLawUAu9opvQ
	(envelope-from <linux-media+bounces-64977-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 10:47:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7199C68D486
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 10:47:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b="JREkhH/G";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64977-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64977-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8860E302514A
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 08:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B666341C302;
	Tue, 16 Jun 2026 08:47:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DAD3C8197
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 08:47:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781599635; cv=none; b=jENX/EBFiLPnJ3OpdKXW+37qavQr6qT8JG5fkzAZ8VMNW6CeYxskbnE/Pw2h5RSFgotMfX18rugs2cKPFqHLeKAJ2y9g2ip9YQufL6y3VqmMhEMYH195eVMVW7hkyzt50ofna8npP4wnNdUku/NBNckJFwcDMTcdtYUAAiVaK14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781599635; c=relaxed/simple;
	bh=BnJwSd7RECcx3D1OGlALN3XdkO1Bexr15k/yfmWPTjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lj8uUrft7tBl3cEabdEnWqzKJ6APBGeQ/ejwyVlIfrPLSRb6IhT3JGroP94Wn94XY0+cIZEMFjUOvQ37wojjM82iZ9NXS3RNqijkcgL5avsMobGlkgAEnEoTapfvLz74UIXUBSvbDbqAIIMi4NChUPokWRe3o144s+gmIiqn8F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JREkhH/G; arc=none smtp.client-ip=209.85.214.182
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c6a4eccab1so6155ad.1
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 01:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781599633; x=1782204433; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aaTfOOhj7DmWaDCSdXoWZe8eYeEqWjLH4eK4JZJxdgM=;
        b=JREkhH/GYaGp3SK3puEdr3YP5mZ4fsUcGqySUj8lOOWD2mfyxtlvTXlcjCQDDQnF1Q
         zP6s2+X3kfTLWeaoS8//Bp4PArYjRB8wnFtFUTdDHiNjMQ6n7GQ5kjc6XJ1mOutarmkd
         VBRQx11LKSpjnKl3f3jqYdgfCo30L0J8c9qLn60uujswgAh1u0Y0o0q1yAi/hJyF93jh
         7FWoN5kvrkFokzQ0FlK32TEKfEMOZ5pm59t6kLj7j4Kp/HOvFL5S5wZbOLrdoGRJIRTP
         dvJodgeFx1B78D98oudTQC9VfT4ai970NVigsaI+Q+n/5ghN8jHmIyP5bvzRY+hS7Scr
         Io7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781599633; x=1782204433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aaTfOOhj7DmWaDCSdXoWZe8eYeEqWjLH4eK4JZJxdgM=;
        b=c+usizfNyV9wc/Inw4lLlsztFp5Ns69iZSlkorfh6GlGIvkxGTHF4t/hEDFmYmwMUe
         QpxiDpHAr84Fjt7gbbXy3duLPzOgVGfMvEj4ZqwdJ60Hhqwaf8iak1i7m6WwhGTMPmyV
         eMraHThJ54KLkPIDOvOTTAM+/3L69pOKP/9D2jK+7ZG7p4/hcJwEQHmaGfzPBwjjigX5
         GRbM/jR0omEpmCuHkHuJDj8xCxP3MA2NDKMXfoGjYD6EV9/9Yt6q/zyv2vP34V8Lppgy
         lXyTorVGy7uvbRwGoNzDa8UYXXByf8JXM7yuLF/Rxv16KMhuoZ4VDwWEzU/ZuPxMzTHJ
         71Tg==
X-Forwarded-Encrypted: i=1; AFNElJ9KgEYcCtzfeSzGscCK7xFj6plDN/qEN1sYssPVsYUar7DlKesw+e2KEIbRnrRaftaYQhon7R5MLYs1Kw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2A+tbIbJYkotAtkwWSw4594fafL674ENtYcTYyFWMIM3185Ja
	UzCud2vYM1ZfmxksNnESnOXh+RcDWmcYfdgo+0JcTlB9ZkQnrjo5aMSHKGKuOF2cng==
X-Gm-Gg: Acq92OHfrFa3QJSdQnzZKJ8AfIKKmjdf6IRbv8Zk4iSNJct7srfIKVhCJdiBzdhClVk
	5EEFvsuH9g2cJ1BeYcFWZa+mj6adGhOmLXQM6OQeURmJtAd96eRfDo0hoFWPZkWsA5ra585MVgR
	iaffrlcOe0vsjDOiV+6b4xff7K3+stNQN4X2MBiw3v/65esgkT9IZjvz8gJlVp6B1lTfai86+EQ
	aOqnSFOSpVPnFXjQrCW7X6IJdy6Ght+kq2efMvq13GSExKI5E2yX9kwSdNjnbjhPuPDb2e04v9B
	VLBJwUdtauy1hAo/+eObczi7LjHyJLOWFwAdmudiL/HY4gIv9i9DxiSbkUePCJtncpFyX77SJ9Q
	KODltDy3FzB3meSBDvzWrFNt6yBg9PgSTfkW1Lnh0u7SEe+ycwoMwbA/p40OOwF3XSzG1uoX/ij
	2E9AEoUqW3y5ymRzc4LLB4TfBJ18AOs5yFnd1oRMA8Ji4OQcZQ8dvRsJbmYPdq
X-Received: by 2002:a17:903:3c4d:b0:2c1:ee6e:4e4c with SMTP id d9443c01a7336-2c69c30f5a8mr1709625ad.29.1781599632758;
        Tue, 16 Jun 2026 01:47:12 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42fbb50bfsm125397885ad.33.2026.06.16.01.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 01:47:12 -0700 (PDT)
Date: Tue, 16 Jun 2026 08:47:04 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Matt Evans <matt@ozlabs.org>
Cc: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Mahmoud Adam <mngyadam@amazon.de>,
	David Matlack <dmatlack@google.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	kvm@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v3 9/9] vfio/pci: Add mmap() attributes to DMABUF feature
Message-ID: <ajENiAQkzXjbxgRX@google.com>
References: <20260610154327.37758-1-matt@ozlabs.org>
 <20260610154327.37758-10-matt@ozlabs.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610154327.37758-10-matt@ozlabs.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64977-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:matt@ozlabs.org,m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[praan@google.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	DKIM_TRACE(0.00)[google.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praan@google.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,vger.kernel.org:from_smtp,ozlabs.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7199C68D486

On Wed, Jun 10, 2026 at 04:43:23PM +0100, Matt Evans wrote:
> A new VFIO feature, VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR, is added to
> set CPU-facing memory type attributes for a DMABUF exported from
> vfio-pci.  These are used for subsequent mmap()s of the buffer.
> 
> There are two attributes supported:
>  - The default, VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR_NC
>  - VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR_WC, which results in WC
>    PTEs for the DMABUF's BAR region.
> 
> Signed-off-by: Matt Evans <matt@ozlabs.org>
> ---
>  drivers/vfio/pci/vfio_pci_core.c   |  2 ++
>  drivers/vfio/pci/vfio_pci_dmabuf.c | 57 +++++++++++++++++++++++++++++-
>  drivers/vfio/pci/vfio_pci_priv.h   | 14 ++++++++
>  include/uapi/linux/vfio.h          | 27 ++++++++++++++
>  4 files changed, 99 insertions(+), 1 deletion(-)
> 

> +int vfio_pci_core_feature_dma_buf_memattr(
> +	struct vfio_pci_core_device *vdev, u32 flags,
> +	struct vfio_device_feature_dma_buf_memattr __user *arg,
> +	size_t argsz)
> +{
> +	struct vfio_device_feature_dma_buf_memattr db_attr;
> +	struct vfio_pci_dma_buf *priv;
> +	struct dma_buf *dmabuf;
> +	int ret;
> +
> +	if (!vdev->pci_ops || !vdev->pci_ops->get_dmabuf_phys)
> +		return -EOPNOTSUPP;
> +
> +	ret = vfio_check_feature(flags, argsz,
> +				 VFIO_DEVICE_FEATURE_SET,
> +				 sizeof(db_attr));
> +	if (ret != 1)
> +		return ret;
> +
> +	if (copy_from_user(&db_attr, arg, sizeof(db_attr)))
> +		return -EFAULT;
> +
> +	dmabuf = dma_buf_get(db_attr.dmabuf_fd);
> +	if (IS_ERR(dmabuf))
> +		return PTR_ERR(dmabuf);
> +
> +	/* Verify DMABUF: see comments in vfio_pci_dma_buf_revoke() */
> +	priv = dmabuf->priv;
> +	if (dmabuf->ops != &vfio_pci_dmabuf_ops ||
> +	    READ_ONCE(priv->vdev) != vdev) {
> +		ret = -ENODEV;
> +		goto out_put_buf;
> +	}
> +
> +	switch (db_attr.memattr) {
> +	case VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR_NC:
> +	case VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR_WC:
> +		WRITE_ONCE(priv->memattr, db_attr.memattr);
> +		ret = 0;
> +		break;
> +
> +	default:
> +		ret = -ENOENT;

Nit: Looks like the agreement [1] was on -EOPNOTSUPP / -EINVAL but we 
took -ENOENT here and in the doc string? Was that intentional?

I tend to agree with Alex's suggestion here, we'd prefer one of those 
two (-EINVAL / -EOPNOTSUPP) since it clearly communicates to the user
that "You sent a wrong arg" or "We don't support this"

-ENOENT means no such file or directory [2] to the user. Users may not
be kernel engineers who'd wanna peek into the code and they may simply
look at the uAPI files which doesn't give them an answer as to what went
wrong.

> +	}
> +
>  out_put_buf:
>  	dma_buf_put(dmabuf);
>  

Apart from that, 
Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

[1] https://lore.kernel.org/all/20260602131417.41366391@shazbot.org/
[2] https://elixir.bootlin.com/linux/v7.1-rc6/source/include/uapi/asm-generic/errno-base.h#L6

