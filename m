Return-Path: <linux-media+bounces-64610-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y8thGp0AK2ox1AMAu9opvQ
	(envelope-from <linux-media+bounces-64610-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 20:38:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A6A6747F8
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 20:38:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=aW+atQ5M;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64610-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64610-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF20C310DA47
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 18:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 372AB4D90A7;
	Thu, 11 Jun 2026 18:37:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980CE4CA289
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 18:37:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781203070; cv=none; b=lZ2cXtnd5B3uRbEoFyce3+tJqIL6KYmRjODIMGhxj7uhf2ue4DJWP1gchDonDooK4Lw9a/L82f5mawTyDvLmedyVSjIX5HpINivAEBOKJVQaP6u2rK8GGfrvLUok6BM4/a4I0nycCCHsR5JrHQpmeek2Mj3ZWwFZM8J8ZOL1vX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781203070; c=relaxed/simple;
	bh=oPRuHZd15dUUmcqh2bABeoIFDALTVfx3kPDHeu3o98s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oMCe0BBFidihx5WKNdrt2jL7+Dlgo4CKi2LQeTNnGpLqq4KTw86h8gicgicHsQreA1VuMPZbTXk+VyXTb++X+m8GEPp6hn8bL9X69A+WeUMMfU6rieq/1ySUx6gyrzZvZMXVQMxE6BXeccMU1KRPcBjhw2rMIjkpWngw3fBHPao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aW+atQ5M; arc=none smtp.client-ip=209.85.214.177
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c0b1a48855so16935ad.0
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 11:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781203068; x=1781807868; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/TFfh87PJEUZx1rJ8R/E1mrJDSDu5E1AnG3uHnDgisU=;
        b=aW+atQ5MKBCMrL3cI29ayyN3oAsACp17FOk7gijyVhzYqKclTp+UDt1gJuoUhaHCCF
         hOHgiLxI9aGfjbLtJhyCNgtG9DCTWToTXgOHlYRwYI/UbcQCSI+45XzLljlA+ZR8FNQE
         axHiTD7XOwIqH6PPMtj6OJFNPo0ZYmh+/CQVd7hLBzK5LtpUfU1PvlzzZVgaDPnX9xir
         o8gCHO6qvuiQ27V2YT/kfPPiI5NxNbMbs1c2j5a3cEU7Z5mO5/UaU+47H7nFF0tbhBlS
         6Wd3T3OedpWYP2sGa+g4bU15eX360oaUmhaYZiK/yYuuHnZ9Cswu3CKwOCxJ9Z+h+mLh
         Iarw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781203068; x=1781807868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/TFfh87PJEUZx1rJ8R/E1mrJDSDu5E1AnG3uHnDgisU=;
        b=NtVBgJVemVQu4oGvOucikvScAQPWZWNkj1DhGIjiHtnBBrf687vDisoPwrZFUVeQ86
         e7mAnrZ69t2yIIB+/IfdF9zVCs5dx7gZFbcGaaRdVyYsX3HceBenBb2gHk0GZSpf030/
         UBrIswC8DxOijGQBImq6OnUvw2J7OGhwYcJE6HojuYNe/tOHvXiu5AGYQic5CwTlJ31F
         DM+oIc2VWp+DcJ8WKy/K8NMXN5GGkVhQbfFmhIWj37CNEpanACPgVQmo8e+f+Jq1NiWV
         SOCoJweL7suFBHM1zyuThN8Bu6gAe3Z4hZfPiQDsGQiUmEyoucaciL8E5C3u6gt0vvlf
         zqwA==
X-Forwarded-Encrypted: i=1; AFNElJ8SzqRIrLpuNsPm4aXwZSqlXHiF0QOYy9zLFxU0BKi/Lzfz9v0Cjj1JiX5oLnpXftJSt+M/dryUI1zZRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0l5iEPBOiBnNoUJlOGPWqyM8frJESRNOKgS0AAhpxO8IMJYtC
	fA2IQweKJM1ClgIru6augg0qawQlRox5hxJr1qQ3ezvq3f3sLrL3eJRg7uS9L7GBTg==
X-Gm-Gg: Acq92OFpx3ofGz4dP6y0ZJe52N+j/qb8h03yp5aYpCH7NWdPET7gUES/ZCRm3V2kENU
	cCWtNnmToDWdOVY+Y4j2VpGuGaxtFPHOG2VdTHXesUbmt8Z0ydNRYrIL/P63u+9LWB8MNdSXTvQ
	JF2KSlBxfvDJvS+K401hGd7FIubQzcZVzJCvH9rflJMfVG1Vt0BzTFQ4IWGY87YJHnFI45oZm8J
	AWQh9ttXZ5zJPRi+S5Wlm32OsOwa//w6KaO0oTGxKpClulBACjPGxPCZvs9QgLKafSTXmUKo3h7
	AvQflzPeUVdE/LRG1hWL3qCEE/As5KwFyoBit9z+XNWDlFQ6JuqHQLFSZPZjNYjQfBrreWwVooO
	ojEl6YWhELCmsYUTfdnP71sDNfbSk7eogYUMAiJOBRU1jYK7Gt6FhaFtPAAFvlBnM0vr01bXlwT
	M/1OztdSjFQXmyOptuOT23hQoj7Us1kAwLNI12Np5X0sPJp1mLJmVeGkdsgh7R
X-Received: by 2002:a17:902:ce02:b0:2bf:b01:2b4c with SMTP id d9443c01a7336-2c3e3f69092mr255655ad.9.1781203067344;
        Thu, 11 Jun 2026 11:37:47 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c865880c00dsm2085451a12.24.2026.06.11.11.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 11:37:46 -0700 (PDT)
Date: Thu, 11 Jun 2026 18:37:39 +0000
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
Subject: Re: [PATCH v3 1/9] PCI/P2PDMA: Add CONFIG_PCI_P2PDMA_CORE
Message-ID: <aisAc1HRn2Wa4F9p@google.com>
References: <20260610154327.37758-1-matt@ozlabs.org>
 <20260610154327.37758-2-matt@ozlabs.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610154327.37758-2-matt@ozlabs.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64610-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ozlabs.org:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D5A6A6747F8

On Wed, Jun 10, 2026 at 04:43:15PM +0100, Matt Evans wrote:
> The P2PDMA code currently provides two features under the same
> CONFIG_PCI_P2PDMA option:
> 
>  1.  Locate providers via pcim_p2pdma_provider()
>  2.  Manage actual P2P DMA
> 
> Some drivers (such as vfio-pci) depend on 1, without having a hard
> dependency on 2.
> 
> A future commit expands the use of DMABUF in vfio-pci for non-P2P
> scenarios, relying on pcim_p2pdma_provider() always being present.  If
> that depended on CONFIG_PCI_P2PDMA, it would make vfio-pci only
> available if CONFIG_ZONE_DEVICE is present (e.g. 64-bit systems), even
> when P2P is not needed.
> 
> To resolve this, introduce CONFIG_PCI_P2PDMA_CORE and refactor the
> basic provider functionality into a new p2pdma_core.c file.  This is
> available even if the CONFIG_PCI_P2PDMA feature is disabled (or
> unavailable due to !CONFIG_ZONE_DEVICE).  Then, drivers can enable any
> additional P2P features with the original CONFIG_PCI_P2PDMA (available
> when CONFIG_ZONE_DEVICE is set).
> 
> Signed-off-by: Matt Evans <matt@ozlabs.org>
> ---
>  MAINTAINERS                |   2 +-
>  drivers/pci/Kconfig        |  10 ++--
>  drivers/pci/Makefile       |   1 +
>  drivers/pci/p2pdma.c       | 109 ++--------------------------------
>  drivers/pci/p2pdma.h       |  29 +++++++++
>  drivers/pci/p2pdma_core.c  | 118 +++++++++++++++++++++++++++++++++++++
>  include/linux/pci-p2pdma.h |  24 ++++----
>  include/linux/pci.h        |   2 +-
>  8 files changed, 174 insertions(+), 121 deletions(-)
>  create mode 100644 drivers/pci/p2pdma.h
>  create mode 100644 drivers/pci/p2pdma_core.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c2c6d79275c6..b21523b3bd8b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20617,7 +20617,7 @@ B:	https://bugzilla.kernel.org
>  C:	irc://irc.oftc.net/linux-pci
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git
>  F:	Documentation/driver-api/pci/p2pdma.rst
> -F:	drivers/pci/p2pdma.c
> +F:	drivers/pci/p2pdma*
>  F:	include/linux/pci-p2pdma.h
>  
>  PCI POWER CONTROL
> diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
> index 33c88432b728..59d70bc84cc9 100644
> --- a/drivers/pci/Kconfig
> +++ b/drivers/pci/Kconfig
> @@ -206,11 +206,7 @@ config PCIE_TPH
>  config PCI_P2PDMA
>  	bool "PCI peer-to-peer transfer support"
>  	depends on ZONE_DEVICE
> -	#
> -	# The need for the scatterlist DMA bus address flag means PCI P2PDMA
> -	# requires 64bit
> -	#
> -	depends on 64BIT
> +	select PCI_P2PDMA_CORE
>  	select GENERIC_ALLOCATOR
>  	select NEED_SG_DMA_FLAGS
>  	help

Nit: Did we drop depends on 64BIT intentionally here? I guess the full
PCI_P2PDMA stack still selects NEED_SG_DMA_FLAGS? IIRC, NEED_SG_DMA_FLAGS
doesn't select 64BIT?

With the nit (and Bjorn's comments addressed)
Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

