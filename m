Return-Path: <linux-media+bounces-60171-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAJHCxM19WnoJQIAu9opvQ
	(envelope-from <linux-media+bounces-60171-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 02 May 2026 01:19:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9959E4B0435
	for <lists+linux-media@lfdr.de>; Sat, 02 May 2026 01:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8680A30182BD
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 23:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6216B37E30B;
	Fri,  1 May 2026 23:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b="F2cGfHWm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="p+UnRXDT"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054D531E84E;
	Fri,  1 May 2026 23:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777677567; cv=none; b=HupFoaVW+qx6jHgfg6RX5ZTXcHnJkU98J1NYDvJO6GtN9/hbNSnUVwEm3mes5B2ul7o+fjXEv1yeQWD47TW00uoAjgb5W8rKhJzfZVcijTJ205ztnG999YZhA7bV3DaG3HNbcNhZmFigIfHOJ9Kb/+fs55oLjjg7GWP/j5/bMPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777677567; c=relaxed/simple;
	bh=jleSGNZTT8LjK42Mlis3dB3Tn+RVaOwMloGMd+86BwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IqKLQOubii408xyB0VeMFfn31bg/wXxrthEyEsnOrkj5dhGUhQCiW5+OavxyDhOZTMfbcMmJgd0Zfh2oF01a2NTLYbgaL0HoJAVoN46JG4DDxKgIQnYobETJrSnjZq0gqXl2oSsPwpfuOO8eJDLq8XXBlcrHMKJfuFlSVK0N5EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org; spf=pass smtp.mailfrom=shazbot.org; dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b=F2cGfHWm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=p+UnRXDT; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shazbot.org
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 5AEF11D000B4;
	Fri,  1 May 2026 19:19:23 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 01 May 2026 19:19:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777677563;
	 x=1777763963; bh=Gn1kzdG+Ds6ZJFEuC5q+IHNvX34UkktXQuXgtwLzw7U=; b=
	F2cGfHWmNHx2BifEsL3sjqkhfBBL/KvFTMcTxiSWQ4gnaPMSK6ACYINi2Ivd6+Le
	srqFv/ffL8VhFoKvAap7FRWnAJifdlXSvrpZXLXfhuQq9m/LEb1Xfwls0BLPkoqn
	2naDYNH1s20XUd6e9ZQyHFrda6Imnqin8YjrpqcXmlHlxVCQZcfoHn0l74UmESHs
	LLLxzd2kdsSIkv6nty2rwqO3ljFoKWc7QDBCFN4coJGPUJfKGffVbzGcqFsS1AWt
	wIFigc7P/TsoDXZ12q+xnh6yzUD2Z2kE3QJJ9qylucEiPKSt0yYIgL/cEeubkOi1
	K2t7hveqxCggzxKDustifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777677563; x=
	1777763963; bh=Gn1kzdG+Ds6ZJFEuC5q+IHNvX34UkktXQuXgtwLzw7U=; b=p
	+UnRXDT6JMUSibW0UOwuqw+kpUhlR4AZpjO7Ra7n9nOTV82ybKC7Xh+/eWHu0BtE
	f9KFDwDtCyBh9u+0xt3vFikMKdkqfkpjaBCxharrWoW6CMXMvQ68OzFdD8uhkDIt
	ZGn7TSmFR0PwZgALVeg3ong44r5NHebqAN8mKEUsLiG37/MkDqrXlfxJn5LxexFu
	GWt9PQqfI9DrlxIBA9e3I0ie289R1e45RxYAOGo86kne4XwBWNJrmqqlgxTRwbWO
	jLO+SYVjOumswPiU782ECjAVOogcEKTXS5l2b7o59p3FRqCYq+hr/FJQZNjsc5hs
	WhZiLaTu3CmJrqzcMWJqA==
X-ME-Sender: <xms:-jT1aS2_ib_hYL1Ffyudu4H-8FqoxGJBjJAAEbNNz9NAAipjrkTkfw>
    <xme:-jT1aTe-V-aJYmUAshUOrH3VLVdTnVcvzTL_bLA0wcNK0pZ5W5wCXlJrS9mXHut0-
    NwJpabxyhTj1zGu2gymMwKoFc3p-75PPPU6anTeWYfYtJqFWQUd>
X-ME-Received: <xmr:-jT1aW4gYXDWj4libaJpnvL5NWhMrmdaqQduClYgQRI9FaS6kkyAB-gJfz8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeludehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfgjfhfogggtgfesthejfedtredtvdenucfhrhhomheptehlvgigucgh
    ihhllhhirghmshhonhcuoegrlhgvgiesshhhrgiisghothdrohhrgheqnecuggftrfgrth
    htvghrnhepgeekjeehvddtleelvddvkeeugfeileegueelvefhgffhgffghfejhfefheeu
    ffdunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hlvgigsehshhgriigsohhtrdhorhhgpdhnsggprhgtphhtthhopedvtddpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepmhgrthhtvghvsehmvghtrgdrtghomhdprhgtphhtth
    hopehlvghonheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhgghesnhhvihguihgr
    rdgtohhmpdhrtghpthhtoheprghmrghsthhrohesfhgsrdgtohhmpdhrtghpthhtoheptg
    hhrhhishhtihgrnhdrkhhovghnihhgsegrmhgurdgtohhmpdhrtghpthhtohepmhhnghih
    rggurghmsegrmhgriihonhdruggvpdhrtghpthhtohepughmrghtlhgrtghksehgohhogh
    hlvgdrtghomhdprhgtphhtthhopegsjhhorhhnsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehsuhhmihhtrdhsvghmfigrlheslhhinhgrrhhordhorhhg
X-ME-Proxy: <xmx:-jT1aW85QSblAay0Uh0UO55QLwC9OGW5CT1crdzdhdcPPirnFxbkjA>
    <xmx:-jT1adJPfSFhWGBcOiATRlmftLdihj-tFOd7eIis78GjG37D_zZXQA>
    <xmx:-jT1aZhcuFPCtjWDAwENfDRdnSOsAu2mj67-tFRFNhY6gSSapDZpWw>
    <xmx:-jT1aW0KivO0etBfbJ4ta2ZsKDpmVbuf5zZqbzo0a5wggK5uQG3Oeg>
    <xmx:-zT1aW_WfKbGzolsAOC3oDO9dzEi5qcIWtPCXvV9vCCZwzHY6ZkzmNo9>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 May 2026 19:19:21 -0400 (EDT)
Date: Fri, 1 May 2026 17:19:19 -0600
From: Alex Williamson <alex@shazbot.org>
To: Matt Evans <mattev@meta.com>
Cc: Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Alex Mastro <amastro@fb.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Mahmoud Adam <mngyadam@amazon.de>, David
 Matlack <dmatlack@google.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Kevin Tian
 <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>, Pranjal
 Shrivastava <praan@google.com>, Alistair Popple <apopple@nvidia.com>, Vivek
 Kasireddy <vivek.kasireddy@intel.com>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <kvm@vger.kernel.org>, alex@shazbot.org
Subject: Re: [PATCH 6/9] vfio/pci: Clean up BAR zap and revocation
Message-ID: <20260501171919.42659174@shazbot.org>
In-Reply-To: <20260416131815.2729131-7-mattev@meta.com>
References: <20260416131815.2729131-1-mattev@meta.com>
	<20260416131815.2729131-7-mattev@meta.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9959E4B0435
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[shazbot.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[shazbot.org:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-60171-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[shazbot.org:+,messagingengine.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@shazbot.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,meta.com:email]

On Thu, 16 Apr 2026 06:17:49 -0700
Matt Evans <mattev@meta.com> wrote:

> Previously, vfio_pci_zap_bars() (and the wrapper
> vfio_pci_zap_and_down_write_memory_lock()) calls were paired with
> calls of vfio_pci_dma_buf_move().
> 
> This commit replaces them a unified new function,
> vfio_pci_zap_revoke_bars() containing both the vfio_pci_dma_buf_move()
> and the unmap_mapping_range(), making it harder for callers to omit
> one.  It adds a wrapper, vfio_pci_lock_zap_revoke_bars(), which takes
> the write memory_lock before zapping, and adds a new
> vfio_pci_unrevoke_bars() for the re-enable path.
> 
> However, as of "vfio/pci: Convert BAR mmap() to use a DMABUF" the
> unmap_mapping_range() to zap is entirely redundant for plain vfio-pci,
> since the DMABUFs used for BAR mappings already zap PTEs when the
> vfio_pci_dma_buf_move() occurs.
> 
> One exception remains as a FIXME: in nvgrace-gpu, some BAR VMAs
> conditionally use custom vm_ops, which have not moved to be backed by
> DMABUFs.  If these BARs are mmap()ed, the vdev enables the existing
> behaviour of unmap_mapping_range() for the device fd address space.

What's the plan here?  Is this a temporary FIXME or a place to prove
that dmabuf for mmap works beyond the core use case?

> 
> Signed-off-by: Matt Evans <mattev@meta.com>
> ---
>  drivers/vfio/pci/nvgrace-gpu/main.c |  5 +++
>  drivers/vfio/pci/vfio_pci_config.c  | 30 ++++++--------
>  drivers/vfio/pci/vfio_pci_core.c    | 62 +++++++++++++++++++----------
>  drivers/vfio/pci/vfio_pci_priv.h    |  3 +-
>  include/linux/vfio_pci_core.h       |  1 +
>  5 files changed, 62 insertions(+), 39 deletions(-)
> 
...  
> @@ -1229,7 +1228,7 @@ static int vfio_pci_ioctl_reset(struct vfio_pci_core_device *vdev,
>  	if (!vdev->reset_works)
>  		return -EINVAL;
>  
> -	vfio_pci_zap_and_down_write_memory_lock(vdev);
> +	vfio_pci_lock_zap_revoke_bars(vdev);
>  
>  	/*
>  	 * This function can be invoked while the power state is non-D0. If
> @@ -1242,10 +1241,9 @@ static int vfio_pci_ioctl_reset(struct vfio_pci_core_device *vdev,
>  	 */
>  	vfio_pci_set_power_state(vdev, PCI_D0);
>  
> -	vfio_pci_dma_buf_move(vdev, true);

This seems subtle enough to be troublesome.  I wonder if Leon didn't
intentionally place the dmabuf revoke after the device is in D0 to
allow the driver to interact with the device.  I think the lock needs
to come before the power state change to avoid racing a user induced
state change.  Thanks,

Alex

