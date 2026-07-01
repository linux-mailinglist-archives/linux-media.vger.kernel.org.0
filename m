Return-Path: <linux-media+bounces-66281-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r6KdE82ERWrVBQsAu9opvQ
	(envelope-from <linux-media+bounces-66281-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 23:21:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BBE6F1CD9
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 23:21:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HQvde2K6;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66281-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66281-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC4CE3144CEB
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 21:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D28A3BCD0A;
	Wed,  1 Jul 2026 21:15:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740EA3955C6;
	Wed,  1 Jul 2026 21:15:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782940518; cv=none; b=SEO0CUW6rJPDhIu4EKtGR13SpELmPwMmV7XT9CkI7CrEMlAQICswX72LHTXaI5cpTUgp0XR1ZyO4CRsrDKj/Fhts5SeM7aVK4fcfxTsBRGCiA3+q9PCFVeOQ6YBq5wUfGvBDP6CQ49inFz4LtYZCcVie1bMoQjZd8DhMMBEf5Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782940518; c=relaxed/simple;
	bh=LqjMYeE1My1iHsBk9myuqFspXffB+Az6ckMNTFG6n4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=D8wGgXUYnTP3rEFinZXIFRnMm5gbzCmTLy2Frv7lDcUZ0ErmC+qGzXtYzy8+lXYpVKE6ASLX3URUiuQoMVyq3iVC6nbLm0f4vE4OfhzcSbq2YLMagkJmvOj0qRn6iLj5j9jjcYc9my3ocytID9qaYm+slGEIMleBEtr2i/OP4JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HQvde2K6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 110651F000E9;
	Wed,  1 Jul 2026 21:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782940517;
	bh=ST5XJ3qWoqmoFi2Pnu/be6GaGojp4wfpLlZ4lIOZGEA=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=HQvde2K6xIG4LDeLWg1opVnBNcOByUfAUML5CkvgpbeOXkd6QuA7qjtTXu8+5Q1fg
	 eJQth6EWn5+/7UADpEFS2icad+ZmPZlpGfeug+wikYLqcpys5oSKAKD48T7TawM62O
	 CMZjbLgWOL2Yf21DSV1ajWzvE7OcDPhWWHXZ209DKfoJT4ieRfPCnVFXMtDy9t7feY
	 fhPDjKqZuOku4of0ERbySgBg1SYHXWaccC1rYi/HAatyMwcg0bPP7sR4Y5vo7zqW2N
	 nciM6RZrdV8psIIcdQQ1tp2jjZ1dUDnqatqYgbfKZYdAEpr31cFkgqlM3h0XwpZmtx
	 fa0OWKI3I03uA==
Date: Wed, 1 Jul 2026 16:15:15 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Matt Evans <matt@ozlabs.org>
Cc: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Pranjal Shrivastava <praan@google.com>,
	Mahmoud Adam <mngyadam@amazon.de>,
	David Matlack <dmatlack@google.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	kvm@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v4 01/10] PCI/P2PDMA: Split pool-related cleanup out of
 pci_p2pdma_release()
Message-ID: <20260701211515.GA351212@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701171245.90111-2-matt@ozlabs.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:matt@ozlabs.org,m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:kevin.tian@intel.com,m:praan@google.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:ankita@nvidia.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER(0.00)[helgaas@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66281-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bhelgaas:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ozlabs.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 87BBE6F1CD9

On Wed, Jul 01, 2026 at 06:12:13PM +0100, Matt Evans wrote:
> Preparing for a refactor in a subsequent patch, split the pool-related
> release code into a new pci_p2pdma_release_pool() function.
> 
> This allows future compile-time selection of a null implementation for
> pci_p2pdma_release_pool(), when p2pdma.c is refactored into core- and
> P2P-related files.
> 
> Signed-off-by: Matt Evans <matt@ozlabs.org>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/p2pdma.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
> index 7c898542af8d..a5a1baebc34e 100644
> --- a/drivers/pci/p2pdma.c
> +++ b/drivers/pci/p2pdma.c
> @@ -226,6 +226,17 @@ static const struct dev_pagemap_ops p2pdma_pgmap_ops = {
>  	.folio_free = p2pdma_folio_free,
>  };
>  
> +static void pci_p2pdma_release_pool(struct pci_dev *pdev,
> +				    struct pci_p2pdma *p2pdma)
> +{
> +	if (!p2pdma->pool)
> +		return;
> +
> +	synchronize_rcu();
> +	gen_pool_destroy(p2pdma->pool);
> +	sysfs_remove_group(&pdev->dev.kobj, &p2pmem_group);
> +}
> +
>  static void pci_p2pdma_release(void *data)
>  {
>  	struct pci_dev *pdev = data;
> @@ -237,15 +248,8 @@ static void pci_p2pdma_release(void *data)
>  
>  	/* Flush and disable pci_alloc_p2p_mem() */
>  	pdev->p2pdma = NULL;
> -	if (p2pdma->pool)
> -		synchronize_rcu();
> +	pci_p2pdma_release_pool(pdev, p2pdma);
>  	xa_destroy(&p2pdma->map_types);
> -
> -	if (!p2pdma->pool)
> -		return;
> -
> -	gen_pool_destroy(p2pdma->pool);
> -	sysfs_remove_group(&pdev->dev.kobj, &p2pmem_group);
>  }
>  
>  /**
> @@ -932,8 +936,8 @@ void *pci_alloc_p2pmem(struct pci_dev *pdev, size_t size)
>  	struct pci_p2pdma *p2pdma;
>  
>  	/*
> -	 * Pairs with synchronize_rcu() in pci_p2pdma_release() to
> -	 * ensure pdev->p2pdma is non-NULL for the duration of the
> +	 * Pairs with synchronize_rcu() in pci_p2pdma_release_pool()
> +	 * to ensure pdev->p2pdma is non-NULL for the duration of the
>  	 * read-lock.
>  	 */
>  	rcu_read_lock();
> -- 
> 2.50.1 (Apple Git-155)
> 

