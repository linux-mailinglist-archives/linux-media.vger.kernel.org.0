Return-Path: <linux-media+bounces-60656-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHR9GEpq+2miawMAu9opvQ
	(envelope-from <linux-media+bounces-60656-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 18:20:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5FE4DE03E
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 18:20:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1055B3080286
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 16:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0AAE48B38C;
	Wed,  6 May 2026 16:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OG30EhVx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9F248122F;
	Wed,  6 May 2026 16:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778084090; cv=none; b=uXWwDSkv4zwFUhAIkR3hEhEyPoc1hBu3Rn1G+hm0IRvhNmLfDWkHb1wNsEV2Nix+v4OAPTtJeV1W3P98hJrJBhW30QnBSrlb2+kd6mPBR3OqcYtbAGxXEnzW4MhfNYQNk1CnDW6XLnCqZ8qhKoK3nhfUUxCYvZJPT9TMUlta/2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778084090; c=relaxed/simple;
	bh=njswzZUrPGyw7+uTEB10Ek+mwJmBHBnPYKBweiQHmiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYWmRBObaPgVzavK3KZ3HdCYBj3idOUj9imVf+FrNZ5LIA299vU8o7hbdyfjXw1JKWjV1jEDr8ki6udiHWmrOvm7CxhDSzXCPO2AVGOns9ePNnE9tqA68UGMnblgjeejZcB1WqsS5w6RENhIXxBV5aj59y14y3e1EJEKCzrPdJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OG30EhVx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEDE0C2BCC9;
	Wed,  6 May 2026 16:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778084088;
	bh=njswzZUrPGyw7+uTEB10Ek+mwJmBHBnPYKBweiQHmiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OG30EhVxxNR3M6BFRGk5tVRf+vPSC2/zrU8c8s8I75OiTfzUXw3jzkILpN5prPV2p
	 uA58pxUM+kVTDBFPMOflxX0ImlI+L2vuF3UG5WJZ2w7M4LiIUelPQ76MNN3JbRhNoh
	 ANQZ9WuJSugulL7wYieTJWQI1YFNzSF1OxGVHzK4CYSn1khS8Y4mfj6NuOnOOZU34/
	 aFo+vUVdwY2e9FuDHKIe6HpyjJ4aK0RwwofPqbkXz1NJYLAHDPcTJeTi/mfz/fjBgH
	 G7XyZtLSQ60KzhivvWSrG51J22vg7kiOZ5QMtllm/B9RZ8X6SAlw4IPviBt9hfocN5
	 Zc35l/Fyyq44w==
Date: Wed, 6 May 2026 19:14:41 +0300
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
Message-ID: <20260506161441.GK11063@unreal>
References: <20260416131815.2729131-1-mattev@meta.com>
 <20260416131815.2729131-2-mattev@meta.com>
 <20260501131236.278ac431@shazbot.org>
 <9304aada-ee84-4cf2-a1d7-82313eda07aa@meta.com>
 <20260506152937.GJ11063@unreal>
 <c0bd0e23-712c-483e-a809-47126ab6e9e9@meta.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0bd0e23-712c-483e-a809-47126ab6e9e9@meta.com>
X-Rspamd-Queue-Id: BB5FE4DE03E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60656-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,meta.com:email]

On Wed, May 06, 2026 at 04:55:27PM +0100, Matt Evans wrote:
> Hi Leon,
> 
> On 06/05/2026 16:29, Leon Romanovsky wrote:
> > 
> > On Wed, May 06, 2026 at 02:53:31PM +0100, Matt Evans wrote:
> > > Hi Alex,
> > > 
> > > On 01/05/2026 20:12, Alex Williamson wrote:
> > > > 
> > > > On Thu, 16 Apr 2026 06:17:44 -0700
> > > > Matt Evans <mattev@meta.com> wrote:
> > > > 
> > > > > vfio_pci_dma_buf_cleanup() assumed all VFIO device DMABUFs need to be
> > > > > revoked.  However, if vfio_pci_dma_buf_move() revokes DMABUFs before
> > > > > the fd/device closes, then vfio_pci_dma_buf_cleanup() would do a
> > > > > second/underflowing kref_put() then wait_for_completion() on a
> > > > > completion that never fires.  Fixed by predicating on revocation
> > > > > status.
> > > > > 
> > > > > This could happen if PCI_COMMAND_MEMORY is cleared before closing the
> > > > > device fd (but the scenario is more likely to hit when future commits
> > > > > add more methods to revoke DMABUFs).
> > > > > 
> > > > > Fixes: 1a8a5227f2299 ("vfio: Wait for dma-buf invalidation to complete")
> > > > > Signed-off-by: Matt Evans <mattev@meta.com>
> > > > > ---
> > > > > 
> > > > > (Just a fix, but later "vfio/pci: Convert BAR mmap() to use a DMABUF"
> > > > > and "vfio/pci: Permanently revoke a DMABUF on request" depend on this
> > > > > context, so including in this series.)
> > > > 
> > > > We really need a fix for this split out from this series, It's already
> > > > been shown[1] that this is trivially reachable.  Carlos proposed[2] a
> > > > similar solution to the one below.  I was concurrently working on the
> > > > issued and suggested an alternative[3].  Let's pick a solution for
> > > > 7.1-rc.  Thanks,
> > > 
> > > It looks like [3] is progressing, so I'll drop this one when I can rebase
> > > onto it.
> > > 
> > > I noticed [3] removes the dma_resv_lock(priv->dmabuf->resv) around the
> > > priv->vdev = NULL, and this series' vfio_pci_mmap_huge_fault() relies on
> > > vdev only changing whilst resv is held to resolve a race between a fault and
> > > cleanup (see patch 7 of this series).  The handler takes resv so that it can
> > > stably test vdev in order to take memory_lock.
> > 
> > I think that you should rely on priv->revoked and not on priv->vdev.
> 
> Needs both unfortunately, as the fault handler ultimately needs to take
> vdev->memory_lock.

One can argue that if priv->revoked == True, all accesses to device
should be denied and treated as priv->vdev == Null.

Thanks

