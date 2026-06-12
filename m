Return-Path: <linux-media+bounces-64661-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3fU8OmLPK2rjFQQAu9opvQ
	(envelope-from <linux-media+bounces-64661-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:20:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 664E3678339
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:20:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=fRzzMYYL;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64661-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64661-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D07DC3051AAF
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 09:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C82380FC7;
	Fri, 12 Jun 2026 09:20:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DDA39150A
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:20:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256014; cv=none; b=pFkGWMo1g/UOoCn3fcXWwVewxQUOrynkCjNGfLkGRmQVfcB2BgvPfZMlXo2aMBhkLyf+Zt8oxH28QP0ETXTFQIR8vypvOabEPloFxkMqDv7M+BC9t2STBOC9iP7V0I/4O0OBvdWWjPqk7Pt/ELV36oTp/Wg9hL96NL4OZqWuITM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256014; c=relaxed/simple;
	bh=nK8oSt5EIh86hjy16VZ5ws+ZIcIDCfDkVWMJvoB+yNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=No524UtH/+bx6VflfkY25+KQ+lSqhcWyDxuLTn10hqj0k5pbkAX7d3r/oaYJt1GG5/Bs09IGpLMrRmJpzWHK/dq5Lta3ptrU+C5sgPdyfJiYRofoRi3Jz65AmNHVJgf04HiYA24Pb7HvlJ3SQNTDskQea3Hmlwn8vhjaEw6t8cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fRzzMYYL; arc=none smtp.client-ip=209.85.214.172
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bf2d865383so61455ad.1
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 02:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781256010; x=1781860810; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zvPmlCR2+M8z2It1PyWjRPyBRhJXBH/RxmRhWYVyMeM=;
        b=fRzzMYYLXoLbwa6O4DDeOA1Dd721HBWwlMWYDllZUFJ/PTywZdsB5Nwlzv5k7x2d0R
         WvHhTKPMyLGoqFR3dXk4MZlKcgQ+ayEvfB5xvC5obxLWlwNHu2z7b0SjDke0/huZR6Dy
         rACpzpT2wiXVJNFA67ImFhSZr9+neZziK6J2yoh4qRgMtwPT/ZfW3hNtyxHfc/fsRD3g
         GFcOs2i1hCawvKj3RLmbnBeGgbQr7dOlEft+MKhsSkeo4F880mzkcKN8W80Ip0Lby3e9
         4s7LNmv9oz+vhxUaKaLOH7e/ZpmkbxeE0XuEbJaU1jhwkOtaSukQ+7t//wS7/4pyvAFv
         1Y6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256010; x=1781860810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zvPmlCR2+M8z2It1PyWjRPyBRhJXBH/RxmRhWYVyMeM=;
        b=bY9ixwqA27EuwOyt+Oqt5pb7stzezmy0tSzfhmsFQwEKjyQA2yNAbDCRtV8W94bX3a
         m4XCNT2kkqjj0CG9L73FEmidaRyfcDgk54CvDd/eMw5ivYZqdQ+pNmzssmh3wopnhht+
         5qZXzP7lCyiDtE8lGZODRslpb+lZBEJgqGFjofYmGAJS8nas0wU/U98kjnu64RxVxxbe
         HKMpt/nr7qRdF9eN2fR2Fh7oR7mOfBix0P7sZ1MC8XpWrOCEAEJoPmFo3hBpESFh55gh
         9JBuiLAydOGNDhxIlXS4L2IYWEVCtFTb7Tf3cshaPsEt9jky7PooB1CPxuahBBjjeHhW
         6Acg==
X-Forwarded-Encrypted: i=1; AFNElJ/f++JUFIa600kMO7ceIKTwFq7JIOQTdDSTwPqtZ6K+hdBqZd0jrfzH+JW8w6PGy1nkQ/PSqC7t+yhz/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzH5b/wqWx1r3M5rWaZW+xZNgscYUJaknq+nlWsZLzDhPHsvq4P
	4b010RD7JXloP7i/0HWJ4+lDlrhqU0NU5cEd3iye90AyLs6W9XQOwCViw/2J3FqDFg==
X-Gm-Gg: Acq92OExzE0I0WaPhjU3MrwV8WB/kODgdaHQe5j0IPbH9wH7y2cnHGNHkQuqLt5Y4kn
	/MJgnV4Ak756SogOTIMfMCNgbQ9Y3FoepQ++VJM9zmwFOouPbPbzejaY83icfqRwvJyZpTCfr/d
	QKuAC1ymoMmB1NbZ63AFR1F0Gdlg/+PTG6rQ2icY3RfmB6Rbh9rd8DqQa8hTu2M06Vdug3XKFji
	KAuwbg8RSrjcK5PA/zVsd2NrI0IRSfuUZdZxPTQuAdYPudj5QyQa4Vl6Tfi6K8s0WtkhQU4Q4/s
	xa8YxcqaPy68DHyrGU8RUqBVLGnHghoOpbc3F+e1sEnxUXkMRCZFp4ZWrnu87qLQVDFU76PW+1k
	ULLXI+mXM8Zpcx4AKOMcedD3E1C4iClYU8impcDsfLc7+DGssQWUUdc/VjYMvWcweullvF4rcGL
	zF5bWlBgwZiR7pIUQfGhSnQLdR6cD7zWBfVRWCH0QDQAGAqwaFS6Jh4XUukAkfHMBy/uF4RII=
X-Received: by 2002:a17:902:e811:b0:2bf:139c:dcf3 with SMTP id d9443c01a7336-2c405c8817fmr1345405ad.19.1781256009183;
        Fri, 12 Jun 2026 02:20:09 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afd17f5sm1476657b3a.39.2026.06.12.02.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:20:08 -0700 (PDT)
Date: Fri, 12 Jun 2026 09:20:01 +0000
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
Subject: Re: [PATCH v3 3/9] vfio/pci: Add a helper to create a DMABUF for a
 BAR-map VMA
Message-ID: <aivPQcSlolwptnB6@google.com>
References: <20260610154327.37758-1-matt@ozlabs.org>
 <20260610154327.37758-4-matt@ozlabs.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610154327.37758-4-matt@ozlabs.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64661-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ozlabs.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 664E3678339

On Wed, Jun 10, 2026 at 04:43:17PM +0100, Matt Evans wrote:
> This helper, vfio_pci_core_mmap_prep_dmabuf(), creates a single-range
> DMABUF for the purpose of mapping a PCI BAR.  This is used in a future
> commit by VFIO's ordinary mmap() path.
> 
> This function transfers ownership of the VFIO device fd to the
> DMABUF, which fput()s when it's released.
> 
> Refactor the existing vfio_pci_core_feature_dma_buf() to split out
> export code common to the two paths, VFIO_DEVICE_FEATURE_DMA_BUF and
> this new VFIO_BAR mmap().
> 
> Signed-off-by: Matt Evans <matt@ozlabs.org>
> ---
>  drivers/vfio/pci/vfio_pci_dmabuf.c | 142 +++++++++++++++++++++++------
>  drivers/vfio/pci/vfio_pci_priv.h   |   5 +
>  2 files changed, 117 insertions(+), 30 deletions(-)
>

[...]

> +
> +	/*
> +	 * Ownership of the DMABUF file transfers to the VMA so that
> +	 * other users can locate the DMABUF via a VA.  Ownership of
> +	 * the original VFIO device file being mmap()ed transfers to
> +	 * priv, and is put when the DMABUF is released.  This
> +	 * intentionally does not use get_file()/vma_set_file()
> +	 * because the references are already held, and ownership
> +	 * moves.
> +	 */
> +	priv->vfile = vma->vm_file;
> +	vma->vm_file = priv->dmabuf->file;
> +	vma->vm_private_data = priv;

I appreciate this comment. Thanks for being clear!

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

