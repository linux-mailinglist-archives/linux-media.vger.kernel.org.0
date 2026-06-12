Return-Path: <linux-media+bounces-64731-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k1ZRM3phLGrIQAQAu9opvQ
	(envelope-from <linux-media+bounces-64731-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 21:43:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF7867C211
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 21:43:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=fsGUDtTO;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64731-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64731-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 50A1C30099AB
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 19:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA64B37FF40;
	Fri, 12 Jun 2026 19:43:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4564F33D4F8
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 19:43:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781293427; cv=none; b=mdRWkaxORNdUjvG2Eu2V6YOr+Ffau05xiYiKesl6aA//6iZ/f6xjQQx8gTgPJ3N10wwQpR308rhn5bo27ADggFmNuJkEdXg5LsD1E49eLnFHiThvMZNIHrGfJja0bfgOlfxP2ncmpkD/YMEF/vaIDOJt0j1bOKOVsSZArIyA8Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781293427; c=relaxed/simple;
	bh=ctVsIEK619yB+e8eeMBvrKbCjaLRX//402crCsbTUkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pWeTKczjdCZj3d3DVaZ1QmkRxeLl9mKt+dbHp3GeXW7+adVUZmjPM2pZpJJcqWNuEu8PkvtJkY0/82W1hjv989nS4O3J+LMee2JK2TeDdf+mjd8fqOfHpKj9Bll1ctbg5W5UhRkihabikKNebPx5DW7su7F8f/x+NAVBrT7seDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fsGUDtTO; arc=none smtp.client-ip=209.85.214.171
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2bf2d865383so195ad.1
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 12:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781293426; x=1781898226; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kmA9t8+wOUfRjPLThtQlARMdWkr4H2MHT+OyHJTFhU8=;
        b=fsGUDtTO45P+NRjG+CcHjCXH494gMK5P3HDul++b9R6g0lMudtbV2WoMrIuAjuDfdi
         6/3JDanfyCpyNkslzcpF8oJJLmFQ8ohKczDn2aPVvQE7ZOqq7KwcpXaaAAsNNyd9iSGs
         5eX7ynw4GWPbHuSnPO/pkL1ZYGm3izhx6gVNK/hMWDed7/etAFnXcqnS4RhD6xhU6YHH
         +OL9LcgPJSAD+Zedfaq38HAsVcWXIQgLsz1GDSqQr26sjNS40hWxLZos18lcZaLfG2Nx
         fM0dluFpJSFUm74FUomaojJu0mZ+G5X0QLWhHQi6mrcgCDCWdG5P3NqqA/BZ26WTVuxi
         UQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781293426; x=1781898226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kmA9t8+wOUfRjPLThtQlARMdWkr4H2MHT+OyHJTFhU8=;
        b=aUrLYF/xJtGc1MH2tepODV4gxnlBA4WovEN9fg6E9ZJsxfu1A2q5E2C5ZgxDah/5/j
         RVhzyONAcNOl+VRtS45DHWjZ98KIkUITMmEEcnooN0skH+OtuOaKXBEYpS/O9gvgNcyW
         FVUjVQGl7YAuIJs8zFOn9W+iykXynOFzOfbCYjIRB6YGt65Y5cKY7JWPtgS7TKyX0uDN
         Qikhcs+lLxk9dy8W+Hzc0bmGaHsdv3EDyksHmi0gsg4FYymTFVLxItke8l3+WYKcGjtu
         5MCXFn6D4lDXVRrutrbeGm+ym1wCqp2T2Jbrk5xgw9y1tNV/vctxMjLfH/ZPSmmFROIR
         sOkA==
X-Forwarded-Encrypted: i=1; AFNElJ818yx5Lzba3m3ewvJrHqRGqFfKkuzYhvBsx1GkZbIT5Jkcd69TrllGKR+d2w77hZPx9iLhLBkSViB8Rw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3ISDIpoMCnXfOBu3OiP5h3Wrq50nLcq7a1jTiuGlv9zooCnT8
	i4d4kFd8+y+X1+qkzdXa+eMcehMsYKiQP1d2crP8wSxVkM+uJUzS6XKu4gaSefmrTw==
X-Gm-Gg: Acq92OFhHbjyDOY7vQIv4zWH+Fw0p82fgGICX8TC+syecCH66zefULvQqKlFth3tNpk
	IlY02CUr4uyVk5gzHwKv589ZY8qTvi5S8zi92ynxH6NClzSFijF531gr8QVbLgaGMPmXx8bH6Wy
	yfat7j9YDhamR/YN+LkvyZJgrskTfA82J8lxBC0sJfBRQoZphcVKv3lS0At2QC6NuNMw5ClykK6
	DTUa3v9UZPonsHM0rpvXel8o0k/hVoNdVNsx9MQbNie7nG69G7vUmrFHaenADajpJLNvwdB1aT8
	+bx6T19rn0nWGgj2LbDNgr6LCZrcb9Iat/RC+evwBWSusLkQMZfiHuMOfNxLeSEh9i9AgncbE+G
	TxmTWvrVho9Z5teXrf6geUKUpVtmFa6SNqLiJLvJoDBoapfntbDTAulBK6+EYvD9j5sUoLTxCxV
	QeOMXEBd+3ciXeBFIY2aqNQ6Wk6pYlt8tUrTtIiXNnH6pym6Dc8F3iF9cooZ2M
X-Received: by 2002:a17:903:37c8:b0:2b7:b03d:9dce with SMTP id d9443c01a7336-2c6650d52a7mr471235ad.18.1781293425288;
        Fri, 12 Jun 2026 12:43:45 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86651aef27sm2802598a12.30.2026.06.12.12.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 12:43:44 -0700 (PDT)
Date: Fri, 12 Jun 2026 19:43:36 +0000
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
Subject: Re: [PATCH v3 4/9] vfio/pci: Convert BAR mmap() to use a DMABUF
Message-ID: <aixhaJoPQrNjhLwD@google.com>
References: <20260610154327.37758-1-matt@ozlabs.org>
 <20260610154327.37758-5-matt@ozlabs.org>
 <aiviYEi17tewEQg0@google.com>
 <42cf4ad9-f094-4f94-88e6-6d2cb6eb6437@ozlabs.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42cf4ad9-f094-4f94-88e6-6d2cb6eb6437@ozlabs.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64731-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ozlabs.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7BF7867C211

On Fri, Jun 12, 2026 at 04:22:12PM +0100, Matt Evans wrote:
> Hi Pranjal,
> 
> On 12/06/2026 11:41, Pranjal Shrivastava wrote:
> > On Wed, Jun 10, 2026 at 04:43:18PM +0100, Matt Evans wrote:
> >> Convert the VFIO device fd fops->mmap to create a DMABUF representing
> >> the BAR mapping, and make the VMA fault handler look up PFNs from the
> >> corresponding DMABUF.  This supports future code mmap()ing BAR
> >> DMABUFs, and iommufd work to support Type1 P2P.
> >>
> >> First, vfio_pci_core_mmap() uses the new
> >> vfio_pci_core_mmap_prep_dmabuf() helper to export a DMABUF
> >> representing a single BAR range.  Then, the vfio_pci_mmap_huge_fault()
> >> callback is updated to understand revoked buffers, and uses the new
> >> vfio_pci_dma_buf_find_pfn() helper to determine the PFN for a given
> >> fault address.
> >>
> >> Now that the VFIO DMABUFs can be mmap()ed, vfio_pci_dma_buf_move()
> >> zaps PTEs (used on the revocation and cleanup paths).
> >>
> >> CONFIG_VFIO_PCI_CORE now unconditionally depends on
> >> CONFIG_DMA_SHARED_BUFFER and CONFIG_PCI_P2PDMA_CORE.  The
> >> CONFIG_VFIO_PCI_DMABUF feature conditionally includes support for
> >> VFIO_DEVICE_FEATURE_DMA_BUF, depending on the availability of
> >> CONFIG_PCI_P2PDMA.
> >>
> >> Signed-off-by: Matt Evans <matt@ozlabs.org>
> >> ---
> >>  drivers/vfio/pci/Kconfig           |  5 +-
> >>  drivers/vfio/pci/Makefile          |  3 +-
> >>  drivers/vfio/pci/vfio_pci_core.c   | 75 +++++++++++++++++++-----------
> >>  drivers/vfio/pci/vfio_pci_dmabuf.c | 12 +++++
> >>  drivers/vfio/pci/vfio_pci_priv.h   | 11 +----
> >>  5 files changed, 67 insertions(+), 39 deletions(-)

Hi Matt,

[...]  
> >>  int vfio_pci_core_mmap_prep_dmabuf(struct vfio_pci_core_device *vdev,
> >>  				   struct vm_area_struct *vma,
> >> @@ -532,6 +538,10 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
> >>  	struct vfio_pci_dma_buf *tmp;
> >>  
> >>  	lockdep_assert_held_write(&vdev->memory_lock);
> >> +	/*
> >> +	 * Holding memory_lock ensures a racing VMA fault observes
> >> +	 * priv->revoked properly.
> >> +	 */
> > 
> > Nit: This comment should appear before the lockdep_assert_held_write()
> > Also, it is slightly verbose.. (not against it though).
> 
> Right, I'll move it.  Agree it's wordy but if anyone changes that I want
> them to "think faulthandler".
> 

That's fair I guess.

> >>  	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
> >>  		if (!get_file_active(&priv->dmabuf->file))
> >> @@ -549,6 +559,8 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
> >>  			if (revoked) {
> >>  				kref_put(&priv->kref, vfio_pci_dma_buf_done);
> >>  				wait_for_completion(&priv->comp);
> >> +				unmap_mapping_range(priv->dmabuf->file->f_mapping,
> >> +						    0, priv->size, 1);
> > 
> > Have we run this series with lockdep enabled?
> > I guess it'd be nice to check with lockdep once..
> 
> I've (generally) always run testing of this series with lockdep.  (No
> issues (anymore).)

That sounds good! Thanks for confirming! :)

Praan

