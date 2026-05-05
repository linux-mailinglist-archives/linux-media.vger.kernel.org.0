Return-Path: <linux-media+bounces-60398-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAVEOFvU+Wk1EgMAu9opvQ
	(envelope-from <linux-media+bounces-60398-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 13:28:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C954CCA17
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 13:28:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F54A30C6CFB
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 11:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36093410D24;
	Tue,  5 May 2026 10:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qtt+hV/g"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8C43161AD;
	Tue,  5 May 2026 10:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777978707; cv=none; b=fl2vKcDzHmKXbzDFzbkz/S8PeJsqx/m9Yq6iHddAr8GUJ+3IYu13w+DvNp/ttw/aADMfMAykGSH6l2zNqbaEyRTQt2QgbDdZtZ5C3wRBSdens9yNYe6uHPYwkExY28Asli52HV8bPna0rfW7eOwhzeZF0RtnpWsQ3SJnXJOANHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777978707; c=relaxed/simple;
	bh=C//C/kRTDYtIooQZ8iVRSG+H2ywb+QDpKwyx95a6X7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KwBE6VO3QToDd8aky4PltGd311qIwCwfY+pxnna0KQ+DCi4YB8z8RxWfKB6XwGc0gG8wMJ441wZ4Wx4BXCT7ivr8oH73qn5i6rqVKwa9CMw6FzHoZNNEBCEngZO+fcKWRMVJS0o4gBfPGUZ+ZbwLF00JtBGaDXQEjoFN7aYU1Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qtt+hV/g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9478C2BCB4;
	Tue,  5 May 2026 10:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777978707;
	bh=C//C/kRTDYtIooQZ8iVRSG+H2ywb+QDpKwyx95a6X7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qtt+hV/gBvd6RAo4zac9DR6N0qf1KGowLxNIq6nNtUs/hSnHXg8GqUVr3EXyqasFQ
	 DzbhoMeYQi1Nhn1BWaSllZ/Mal8BIKmC0adWFFrIsRn2eWDJKZ4pOHvO7lj2MzYgek
	 2iHf/E7ASyj1JjZbj2/Tm2fpSZqfcjIHViRq+0QRspONXRUA5ptCaTf+idvGJ7zIlc
	 EJrpbRnlfoNy3MlqYN0jaPmFM6OC/ihewCUxhmK91sayPGMv6NkIjcFVAlcN0jRJcO
	 uXemNU8VbgL15nTdbWxb1NoH6APx330HP6b5VIbgajehi1y1tL1nbpGHu++ZnQ60sr
	 Lci7OYkR1Ng+Q==
Date: Tue, 5 May 2026 13:58:22 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Alex Williamson <alex@shazbot.org>
Cc: Matt Evans <mattev@meta.com>, Jason Gunthorpe <jgg@nvidia.com>,
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
Subject: Re: [PATCH 6/9] vfio/pci: Clean up BAR zap and revocation
Message-ID: <20260505105822.GC11063@unreal>
References: <20260416131815.2729131-1-mattev@meta.com>
 <20260416131815.2729131-7-mattev@meta.com>
 <20260501171919.42659174@shazbot.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501171919.42659174@shazbot.org>
X-Rspamd-Queue-Id: 49C954CCA17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60398-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Fri, May 01, 2026 at 05:19:19PM -0600, Alex Williamson wrote:
> On Thu, 16 Apr 2026 06:17:49 -0700
> Matt Evans <mattev@meta.com> wrote:
> 
> > Previously, vfio_pci_zap_bars() (and the wrapper
> > vfio_pci_zap_and_down_write_memory_lock()) calls were paired with
> > calls of vfio_pci_dma_buf_move().
> > 
> > This commit replaces them a unified new function,
> > vfio_pci_zap_revoke_bars() containing both the vfio_pci_dma_buf_move()
> > and the unmap_mapping_range(), making it harder for callers to omit
> > one.  It adds a wrapper, vfio_pci_lock_zap_revoke_bars(), which takes
> > the write memory_lock before zapping, and adds a new
> > vfio_pci_unrevoke_bars() for the re-enable path.
> > 
> > However, as of "vfio/pci: Convert BAR mmap() to use a DMABUF" the
> > unmap_mapping_range() to zap is entirely redundant for plain vfio-pci,
> > since the DMABUFs used for BAR mappings already zap PTEs when the
> > vfio_pci_dma_buf_move() occurs.
> > 
> > One exception remains as a FIXME: in nvgrace-gpu, some BAR VMAs
> > conditionally use custom vm_ops, which have not moved to be backed by
> > DMABUFs.  If these BARs are mmap()ed, the vdev enables the existing
> > behaviour of unmap_mapping_range() for the device fd address space.
> 
> What's the plan here?  Is this a temporary FIXME or a place to prove
> that dmabuf for mmap works beyond the core use case?
> 
> > 
> > Signed-off-by: Matt Evans <mattev@meta.com>
> > ---
> >  drivers/vfio/pci/nvgrace-gpu/main.c |  5 +++
> >  drivers/vfio/pci/vfio_pci_config.c  | 30 ++++++--------
> >  drivers/vfio/pci/vfio_pci_core.c    | 62 +++++++++++++++++++----------
> >  drivers/vfio/pci/vfio_pci_priv.h    |  3 +-
> >  include/linux/vfio_pci_core.h       |  1 +
> >  5 files changed, 62 insertions(+), 39 deletions(-)
> > 
> ...  
> > @@ -1229,7 +1228,7 @@ static int vfio_pci_ioctl_reset(struct vfio_pci_core_device *vdev,
> >  	if (!vdev->reset_works)
> >  		return -EINVAL;
> >  
> > -	vfio_pci_zap_and_down_write_memory_lock(vdev);
> > +	vfio_pci_lock_zap_revoke_bars(vdev);
> >  
> >  	/*
> >  	 * This function can be invoked while the power state is non-D0. If
> > @@ -1242,10 +1241,9 @@ static int vfio_pci_ioctl_reset(struct vfio_pci_core_device *vdev,
> >  	 */
> >  	vfio_pci_set_power_state(vdev, PCI_D0);
> >  
> > -	vfio_pci_dma_buf_move(vdev, true);
> 
> This seems subtle enough to be troublesome.  I wonder if Leon didn't
> intentionally place the dmabuf revoke after the device is in D0 to
> allow the driver to interact with the device. 

My intention was to place vfio_pci_dma_buf_move() as close as possible to
pci_try_reset_function(), so the device is known to be fully operational
at that point. It looks like calling it after the transition to D0 is the
right ordering.

Thanks

> I think the lock needs to come before the power state change to avoid racing a user induced
> state change.  Thanks,
> 
> Alex

