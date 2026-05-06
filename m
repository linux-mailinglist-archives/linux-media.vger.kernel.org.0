Return-Path: <linux-media+bounces-60645-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kA51I4lh+2kuaQMAu9opvQ
	(envelope-from <linux-media+bounces-60645-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 17:43:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1DB4DD79B
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 17:43:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ED7023004046
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 15:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142C848AE0E;
	Wed,  6 May 2026 15:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="STDn1RSW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEFA47B426;
	Wed,  6 May 2026 15:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081384; cv=none; b=YJp1QwQi1t9nl6jc66uH0BizIKtYS1lUuOympclC7M1ZRLwLmGKT5pPbqBc0AmvFgOh7+j019KGwpPS5kd7mYqGT9YFi1qNEJFYMAN0TtqCbwXBP7Bt9JMLDDmsduCRKoXlycri21c+Kmt11476aUVNkoyBIkcmn2aHjkZM5zjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081384; c=relaxed/simple;
	bh=UzMH2u1MU8F8phCcA9cvtgS+wSBo2orCoIMTn8w+YRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A5+6YE0fUR7gkuKcF7JN9ULhcHHjqFXPNy9x8Id3ZxPAVrBANnoJ0CooF+0ysw53u11hU+0Er0FjBR7tWzTRRplQ6u6uAOL9xF8RXDxzpOE2yZ+fWaNF2Cfq7KHrkyt4/jiTcRuxyTb09tAvSSQAJgXSQ8QJAIs3M2bPFkFL8wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=STDn1RSW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97DBCC2BCC7;
	Wed,  6 May 2026 15:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778081383;
	bh=UzMH2u1MU8F8phCcA9cvtgS+wSBo2orCoIMTn8w+YRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=STDn1RSWQtQf5vQAmkckEpHw+vLcrntjTrcGNB2Vatv/Z6fCUX2vp9pfzwOUSuFu7
	 +mdGkigx/ldWmmEm+YSTEzOjCANn8lR6dtfuu1cBebE1lJDWyqzF32ynbLILRxumZ/
	 115NwbwoMhlAIz1AIAjb2v8dc+P+ohamlniLb15kqZEMaZgzCa4P+42sgnNmy4coZz
	 VQRB7/nPKpidYRftVvm9evvu37ksRbGq7zqZZMNxL+bHFMKD7k60VO8NLebkXOMw2L
	 o7CQ0+rY8nrjlfXaFym19/+wafjPVLYQFcUjcFzaPq326lovpu5sJuS9aLX8TgrTqd
	 eEnWjzOAqtXBw==
Date: Wed, 6 May 2026 18:29:37 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Matt Evans <mattev@meta.com>
Cc: Alex Williamson <alex@shazbot.org>, Jason Gunthorpe <jgg@nvidia.com>,
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
	kvm@vger.kernel.org,
	Carlos =?iso-8859-1?Q?L=F3pez?= <clopez@suse.de>
Subject: Re: [PATCH 1/9] vfio/pci: Fix vfio_pci_dma_buf_cleanup() double-put
Message-ID: <20260506152937.GJ11063@unreal>
References: <20260416131815.2729131-1-mattev@meta.com>
 <20260416131815.2729131-2-mattev@meta.com>
 <20260501131236.278ac431@shazbot.org>
 <9304aada-ee84-4cf2-a1d7-82313eda07aa@meta.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9304aada-ee84-4cf2-a1d7-82313eda07aa@meta.com>
X-Rspamd-Queue-Id: AF1DB4DD79B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60645-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leon@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,meta.com:email]

On Wed, May 06, 2026 at 02:53:31PM +0100, Matt Evans wrote:
> Hi Alex,
> 
> On 01/05/2026 20:12, Alex Williamson wrote:
> > 
> > On Thu, 16 Apr 2026 06:17:44 -0700
> > Matt Evans <mattev@meta.com> wrote:
> > 
> > > vfio_pci_dma_buf_cleanup() assumed all VFIO device DMABUFs need to be
> > > revoked.  However, if vfio_pci_dma_buf_move() revokes DMABUFs before
> > > the fd/device closes, then vfio_pci_dma_buf_cleanup() would do a
> > > second/underflowing kref_put() then wait_for_completion() on a
> > > completion that never fires.  Fixed by predicating on revocation
> > > status.
> > > 
> > > This could happen if PCI_COMMAND_MEMORY is cleared before closing the
> > > device fd (but the scenario is more likely to hit when future commits
> > > add more methods to revoke DMABUFs).
> > > 
> > > Fixes: 1a8a5227f2299 ("vfio: Wait for dma-buf invalidation to complete")
> > > Signed-off-by: Matt Evans <mattev@meta.com>
> > > ---
> > > 
> > > (Just a fix, but later "vfio/pci: Convert BAR mmap() to use a DMABUF"
> > > and "vfio/pci: Permanently revoke a DMABUF on request" depend on this
> > > context, so including in this series.)
> > 
> > We really need a fix for this split out from this series, It's already
> > been shown[1] that this is trivially reachable.  Carlos proposed[2] a
> > similar solution to the one below.  I was concurrently working on the
> > issued and suggested an alternative[3].  Let's pick a solution for
> > 7.1-rc.  Thanks,
> 
> It looks like [3] is progressing, so I'll drop this one when I can rebase
> onto it.
> 
> I noticed [3] removes the dma_resv_lock(priv->dmabuf->resv) around the
> priv->vdev = NULL, and this series' vfio_pci_mmap_huge_fault() relies on
> vdev only changing whilst resv is held to resolve a race between a fault and
> cleanup (see patch 7 of this series).  The handler takes resv so that it can
> stably test vdev in order to take memory_lock.

I think that you should rely on priv->revoked and not on priv->vdev.

Thanks

> 
> Must your fix change vdev outside of holding resv?  I'm still sketching
> alternatives; at first glance perhaps the fault handler could rely on vdev
> being valid if !revoked, which can be tested holding [only] resv.
> 
> 
> Thanks,
> 
> Matt
> 
> > 
> > Alex
> > 
> > [1]https://lore.kernel.org/all/GVXPR02MB12019AA6014F27EF5D773E89BFB372@GVXPR02MB12019.eurprd02.prod.outlook.com/
> > [2]https://lore.kernel.org/all/20260429182736.409323-2-clopez@suse.de/
> > [3]https://lore.kernel.org/all/20260429142242.70f746b4@nvidia.com/
> > 
> > > drivers/vfio/pci/vfio_pci_dmabuf.c | 9 +++++++--
> > >   1 file changed, 7 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> > > index 281ba7d69567..04478b7415a0 100644
> > > --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> > > +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> > > @@ -395,20 +395,25 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
> > >   	down_write(&vdev->memory_lock);
> > >   	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
> > > +		bool was_revoked;
> > > +
> > >   		if (!get_file_active(&priv->dmabuf->file))
> > >   			continue;
> > >   		dma_resv_lock(priv->dmabuf->resv, NULL);
> > >   		list_del_init(&priv->dmabufs_elm);
> > >   		priv->vdev = NULL;
> > > +		was_revoked = priv->revoked;
> > >   		priv->revoked = true;
> > >   		dma_buf_invalidate_mappings(priv->dmabuf);
> > >   		dma_resv_wait_timeout(priv->dmabuf->resv,
> > >   				      DMA_RESV_USAGE_BOOKKEEP, false,
> > >   				      MAX_SCHEDULE_TIMEOUT);
> > >   		dma_resv_unlock(priv->dmabuf->resv);
> > > -		kref_put(&priv->kref, vfio_pci_dma_buf_done);
> > > -		wait_for_completion(&priv->comp);
> > > +		if (!was_revoked) {
> > > +			kref_put(&priv->kref, vfio_pci_dma_buf_done);
> > > +			wait_for_completion(&priv->comp);
> > > +		}
> > >   		vfio_device_put_registration(&vdev->vdev);
> > >   		fput(priv->dmabuf->file);
> > >   	}
> > 
> 

