Return-Path: <linux-media+bounces-65061-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m6keE3WfMWoUogUAu9opvQ
	(envelope-from <linux-media+bounces-65061-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 21:09:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 54236694CD6
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 21:09:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=NiZSQDB3;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65061-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-65061-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 553B3301ADA1
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 19:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB693DEFFB;
	Tue, 16 Jun 2026 19:09:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA233DE422
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 19:09:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781636968; cv=none; b=EkMYOs8jLigsYDn3tYjMxf12LUhGPZCsMFKpLZa5ES9moYd5UALtBFIMlcpNrefvj1FBw1sEtBLUfBsOdy5MmZXLGNgLxTD14bX3cn8KfhMutHJ/Fp47NnEUWZLk/8v0/fo+8/ZOmpEsWaf53HdCpLQMGiW8j3te6vU+4P8spW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781636968; c=relaxed/simple;
	bh=xIZ2vnX6oV3Cfg2vNBP125vPLQhLHqmLTFNWNXsHgpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZ9DnVpqIxhlNUf+q5WlQrvfLFaNkpGYaFhfdAs3QilhTglPGMOa8swxbp++xuYH9dnKOlC5hZJEaJ4IK0if383ooct3G9DmSb81f9koKcMwsEy9lTIpT/8SHO0QGqpKt0Lu5S1epamGgMBU8wyJmOBcvrK2EOfWNwHU+fNglZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NiZSQDB3; arc=none smtp.client-ip=209.85.214.176
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c6a4eccab1so9685ad.1
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 12:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781636966; x=1782241766; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k6SDrg2Xo/OAI2rZzS8e85po51TqWl/TutJV9Vm/kvs=;
        b=NiZSQDB3KNInvDGKdbrFn9uCIEB+AR1SdTWwZ6pOyt97MMprDpzvffjCG83/JLj0Vt
         o5xG1cBWPkDIdp8LhDxXnxxnEE2Sd1Fv3j5U5XteijVffhCLw9eEDACmfLOgfh6OV9nX
         pxkcrYYcknAlZfnw05OXMld8X5zUS7iiIXMmoipFRRhv/52juCsBcyMwzIlja7KPJQ4S
         2ki714XNOdIRW9NlfbekN+Oy9g8v82knPEt9eEPtjz3rmsJotS2qtcLMe3akdC9QB1h1
         1cI5LbiRMNnesdVR4Ly9LsV7kkh84TlOE6bNWX/BfZs14HUqsKz9MKeZYo3PgQt6Z1SX
         DGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781636966; x=1782241766;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k6SDrg2Xo/OAI2rZzS8e85po51TqWl/TutJV9Vm/kvs=;
        b=T4ZLBrKJqcSD4a1b7nbwpP5lvK6lDW8ocZkfEtX4zfVlxstJpulixt7Rd7Gbe/Yjkh
         JHLDGhkpk6eT1MotBYPT0R42DOneO1pONqGxTIjGo+A+8rvDbxA04Uhm/F/tgjSRFiVU
         Y8jn1oBjDK6XKZiGMIIWaUaEHD6NtCOM+LK7JLS/RleXDdHO9ETvcmCx7sR1rPj8MDK6
         7Yf+nFo1tcOKd8MAOuHVva3TGmzWtQiMN2VTxAVC1SgzAXzmna+TvNy5jd3h6HBDX7iR
         lHdfFYSrZ57bfZbQ+XOp8YAYo8sKuFW3VVEkgXSn2Xp4UCqyFZmFmGdWs68sIh8isIzA
         Zl8w==
X-Forwarded-Encrypted: i=1; AFNElJ8fON/T1P7lB8mo4kbPEbs3RW/Idn1Z5IIoBevClH2N0ycxSU1RJrGBMo3xJGvuQ7XoolHtAiRutAB/wA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIyNSieem4PCEl73o8xpnybjVi3SCYt9o6FFyYcb84tNRSIEyh
	zUMrMIqt9SXBIxGAvxxaDAVMtaktcKkDxnel121Y0UExZZEi2JgvOgOELeYs0S5Jdw==
X-Gm-Gg: AfdE7clzfdnCZ8528Ju1id0/Y9nWwgDfQ10bPZtKME1QeLtVGT3dPYSq6xJ/5bLEAcW
	IXjcCUmwzz4wQtKDAN4P5oeAgJzyqmeQOjRJcRYCnOBqBLtN2/YtvNGV1tFzs33DEvMtujjgcOu
	+2MzejoTnaQB1SUWKUKYdF0w3kBeno1X8xNVmMkPSublKm/Ugg9E0zKKE6OuEpzCv5ZSxhu1Mdy
	IetbreVWLaPBMzuSzatvHkeIujhVMPc1dfWFHiMUKO45AuFa2hIrrVQLPYl2lrtnzCFui7O8j9/
	fZiZjO6u/4uzp+oZOKMo38BJojHmEhDvk6A0PnfOgJ0PmekqWiQ9Fq65bvMs6170TU3iqk2PO3L
	agjcVS6+wBypC8aQLxCfI6cJuwrPi3Cr+pX2vmj86JNXWx0pNb+sWqCzKWLG8XoxHkv/aeKfpSE
	kLnXiMLLzhrxhLmaTPKYfnZaS7Gv1G9e/ExuYAtaoVYkROz6PLFrQFOK5CtTzS
X-Received: by 2002:a17:903:19c5:b0:2c1:ee6e:4e4b with SMTP id d9443c01a7336-2c6bbb02f17mr305125ad.28.1781636965196;
        Tue, 16 Jun 2026 12:09:25 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c5535sm141034955ad.18.2026.06.16.12.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:09:24 -0700 (PDT)
Date: Tue, 16 Jun 2026 19:09:16 +0000
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
Message-ID: <ajGfXNavEPOuU_4L@google.com>
References: <20260610154327.37758-1-matt@ozlabs.org>
 <20260610154327.37758-10-matt@ozlabs.org>
 <ajENiAQkzXjbxgRX@google.com>
 <c4a6e367-2f22-4cbf-afcb-674f82fdacd2@ozlabs.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4a6e367-2f22-4cbf-afcb-674f82fdacd2@ozlabs.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65061-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 54236694CD6

On Tue, Jun 16, 2026 at 12:37:29PM +0100, Matt Evans wrote:
> Hi Praan,
> 
> On 16/06/2026 09:47, Pranjal Shrivastava wrote:
> > On Wed, Jun 10, 2026 at 04:43:23PM +0100, Matt Evans wrote:
> >> A new VFIO feature, VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR, is added to
> >> set CPU-facing memory type attributes for a DMABUF exported from
> >> vfio-pci.  These are used for subsequent mmap()s of the buffer.
> >>
> >> There are two attributes supported:
> >>  - The default, VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR_NC
> >>  - VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR_WC, which results in WC
> >>    PTEs for the DMABUF's BAR region.
> >>
> >> Signed-off-by: Matt Evans <matt@ozlabs.org>
> >> ---
> >>  drivers/vfio/pci/vfio_pci_core.c   |  2 ++
> >>  drivers/vfio/pci/vfio_pci_dmabuf.c | 57 +++++++++++++++++++++++++++++-
> >>  drivers/vfio/pci/vfio_pci_priv.h   | 14 ++++++++
> >>  include/uapi/linux/vfio.h          | 27 ++++++++++++++
> >>  4 files changed, 99 insertions(+), 1 deletion(-)
> >>
> > 

[...]

> >> +
> >> +	/* Verify DMABUF: see comments in vfio_pci_dma_buf_revoke() */
> >> +	priv = dmabuf->priv;
> >> +	if (dmabuf->ops != &vfio_pci_dmabuf_ops ||
> >> +	    READ_ONCE(priv->vdev) != vdev) {
> >> +		ret = -ENODEV;
> >> +		goto out_put_buf;
> >> +	}
> >> +
> >> +	switch (db_attr.memattr) {
> >> +	case VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR_NC:
> >> +	case VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR_WC:
> >> +		WRITE_ONCE(priv->memattr, db_attr.memattr);
> >> +		ret = 0;
> >> +		break;
> >> +
> >> +	default:
> >> +		ret = -ENOENT;
> > 
> > Nit: Looks like the agreement [1] was on -EOPNOTSUPP / -EINVAL but we 
> > took -ENOENT here and in the doc string? Was that intentional?
> > 
> > I tend to agree with Alex's suggestion here, we'd prefer one of those 
> > two (-EINVAL / -EOPNOTSUPP) since it clearly communicates to the user
> > that "You sent a wrong arg" or "We don't support this"
> > 
> 
> Yes, it was intentional.  This was noted in the v3 changelog entry in
> the cover letter:
> 
>  - Removed GET on vfio_pci_core_feature_dma_buf_memattr(), removed
>    unnecessary taking of memory_lock, fixed error return values.  In
>    particular, removes ENOTSUPP, and uses ENOENT to indicate an
>    unknown attribute enum value was passed to SET.  In the discussion
>    here,
>    https://lore.kernel.org/all/20260602131417.41366391@shazbot.org/
>    we'd agreed on EOPNOTSUPP before I realised that's already used
>    elsewhere.  ENOENT uniquely indicates an unknown attribute.
> 

Ahh okay. I missed the changelogs in the cover letter.

> EINVAL/EOPNOTSUPP would indeed be semantically perfect, but after
> posting my reply there I remembered they are already overloaded with a
> load of different meanings.
> 
> I think uniqueness is important here so that memattr issues (for example
> any future arch-specific porting issues) show up as an
> immediately-understandable error value.
> 
> > -ENOENT means no such file or directory [2] to the user. Users may not
> > be kernel engineers who'd wanna peek into the code and they may simply
> > look at the uAPI files which doesn't give them an answer as to what
> > went wrong.
> 
> But surely when they look at the uAPI header they will then see
> "*  ENOENT: The given memattr is not supported." and understand what
> went wrong.

Fair enough. Since its documented it clearly in the uAPI header.

Thanks,
Praan

