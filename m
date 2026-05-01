Return-Path: <linux-media+bounces-60164-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4D8tOjH79GnFGwIAu9opvQ
	(envelope-from <linux-media+bounces-60164-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 21:12:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C344AF132
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 21:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B061B3014859
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 19:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BBB740F8E0;
	Fri,  1 May 2026 19:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b="GcoIXONH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZHRcW/xX"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CAB32470F;
	Fri,  1 May 2026 19:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777662764; cv=none; b=QL9NtoN7H044qe9zOMfHSZVTlb0niMZfoziWjKPY13VKXiRwlUHIt87t5TKTYtYkGRJrZ4MzERq699i7mslpFv8ZIvEP0+gtpCH9XKVErIU0PssKxtNh2exk0NI8UYqgZ9ihsxRKWjeSx/KFf5xdtjXYy7NIKgnpQPVkU6OYgH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777662764; c=relaxed/simple;
	bh=GM3M+unbPhC+uBl1H9ELs+eDqbKWR61vwEFnpLZRVxc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BQCAmj9UrU1qS5oYC82E5pc5dSPXuwg10DjCdnqNS4XNhXM9I4HeFOAIDtfBjyvtq/RBIENMbNwVAqsbqszNhYPUXTK0mxLyNlW7SbGppqLjSpOGr9KXTvVZWNBaoTnkJAy88HVQTayPWNqh/7PRLgW2FghT+0Ti6ybjhkq03CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org; spf=pass smtp.mailfrom=shazbot.org; dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b=GcoIXONH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZHRcW/xX; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shazbot.org
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 215021D00085;
	Fri,  1 May 2026 15:12:40 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 01 May 2026 15:12:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777662759;
	 x=1777749159; bh=CyuI0WlfUye1AEo6nueVt3RVxpAH+P71icEP9FTaGcI=; b=
	GcoIXONH1GU8XpqtDPjm0MvuAIgxz9OFgccqq+0Uk2Bnkjg2HEkT2oYz4M3Nvupl
	k2PmcnbKn1PXpHKw8uVvMCQ+UiK5Jdvj9JLlZXHY4Di0Pu5zrT1JQVIXSNJm6OZO
	le9CeWVgkA5rRhAGcdXtF1t6VuGgiByF4215QKMerZq0875S329014pqxgT5nEkA
	FJpdU64+9DT2VKObLBizKH79RxMV9w8cENzfM7UAFDR3GmbUFvjlUnhJh64adbRw
	P7Y3t/uOMlpgnypkh3xqhpx7BaJuGufGMB5HAPQB/25p3bcVLl5X6MM9xmXFrYuq
	PAZUc5RgSjS6rCbym3S+fA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777662759; x=
	1777749159; bh=CyuI0WlfUye1AEo6nueVt3RVxpAH+P71icEP9FTaGcI=; b=Z
	HRcW/xXtmeAkZLFh4ba+qw+fmB3SDu0pteliYvUO3whVaF+JFCGAnqC0th8AdeyD
	a4JXLREi2op4J2ruLhwaxiEbwSFsKvRpY4LzV8dh8JgzeLWNSQkApJa7ucUTKiNg
	moBCQMms/YgQz2Z/zIp/VZExyBtGln9093uOJBD5aZcy+DHiQtfjSJ4hhwxaa3xB
	w10Bo+NmCGOz+V0D1b8YF+Ybbcl4xra8LUT8+JGt2J293ksDmC+g2RfVMi6aWgwD
	AjpN7gRDwVO/QLhWh5GBDJIRFLCplBTFIXquS7udYYxNHcNXkPjIVYlLPTQkVfcN
	gHp665Il9S/9Xiozb0agQ==
X-ME-Sender: <xms:J_v0aXrTOYr3CssCoqGLcDyCK9F0jRzdhjAhcYObQGitQ_pEll_oig>
    <xme:J_v0aS9Y6Cwj02Q8v_2jbrKM63AO5ozzlkwRnkmJGcoR-ZOc1ft8F1963hFHhTXdj
    1Cq93Z7wbxyUHMFVL8CxYuxg3e5vqL_WXSZJr7bIArvnVJ824D6Ig>
X-ME-Received: <xmr:J_v0aY3KqoZfvp8BiBB6Bo41K8W0vdfGJim5mqYYIS2X_u1jhvmEgNLN2Yc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeluddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfgjfhfogggtgfesthejredtredtvdenucfhrhhomheptehlvgigucgh
    ihhllhhirghmshhonhcuoegrlhgvgiesshhhrgiisghothdrohhrgheqnecuggftrfgrth
    htvghrnhepkeehjeeitefffeeuieetjedtjeffvdelledvuedvffdvfeetgefhveekuedv
    fedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhgvgiesshhhrgiisghothdrohhrghdp
    nhgspghrtghpthhtohepvddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrg
    htthgvvhesmhgvthgrrdgtohhmpdhrtghpthhtoheplhgvohhnsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehjghhgsehnvhhiughirgdrtghomhdprhgtphhtthhopegrmhgrsh
    htrhhosehfsgdrtghomhdprhgtphhtthhopegthhhrihhsthhirghnrdhkohgvnhhighes
    rghmugdrtghomhdprhgtphhtthhopehmnhhghigruggrmhesrghmrgiiohhnrdguvgdprh
    gtphhtthhopegumhgrthhlrggtkhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepsghj
    ohhrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhumhhithdrshgvmhifrghlse
    hlihhnrghrohdrohhrgh
X-ME-Proxy: <xmx:J_v0admTanMNzoud-7lvTq3FrjB5BbRldFAGzV4udTFJQ-ycjSg7WQ>
    <xmx:J_v0ad2GZ6WPaEfSxJFx1M7kn-cKd8gnx61awOBwiFTPaj-Tma8XDQ>
    <xmx:J_v0aUjBZ4Ua9Z-oCX-yep9-mN3xurlrIygQVuGhWXeoTx5ajA5xVw>
    <xmx:J_v0aTU_8ndqtxKbdTx6a8HrZRDFmrleiY12wuT1UZy_ii1NIOJhMQ>
    <xmx:J_v0afx21FZdjyPsHBHFYQreUVAsfVYdOZPFmM60fQM2RPoihqNNGOHs>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 May 2026 15:12:37 -0400 (EDT)
Date: Fri, 1 May 2026 13:12:36 -0600
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
 <linaro-mm-sig@lists.linaro.org>, <kvm@vger.kernel.org>, alex@shazbot.org,
 Carlos =?UTF-8?B?TMOzcGV6?= <clopez@suse.de>
Subject: Re: [PATCH 1/9] vfio/pci: Fix vfio_pci_dma_buf_cleanup() double-put
Message-ID: <20260501131236.278ac431@shazbot.org>
In-Reply-To: <20260416131815.2729131-2-mattev@meta.com>
References: <20260416131815.2729131-1-mattev@meta.com>
	<20260416131815.2729131-2-mattev@meta.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A0C344AF132
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
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-60164-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,meta.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Thu, 16 Apr 2026 06:17:44 -0700
Matt Evans <mattev@meta.com> wrote:

> vfio_pci_dma_buf_cleanup() assumed all VFIO device DMABUFs need to be
> revoked.  However, if vfio_pci_dma_buf_move() revokes DMABUFs before
> the fd/device closes, then vfio_pci_dma_buf_cleanup() would do a
> second/underflowing kref_put() then wait_for_completion() on a
> completion that never fires.  Fixed by predicating on revocation
> status.
> 
> This could happen if PCI_COMMAND_MEMORY is cleared before closing the
> device fd (but the scenario is more likely to hit when future commits
> add more methods to revoke DMABUFs).
> 
> Fixes: 1a8a5227f2299 ("vfio: Wait for dma-buf invalidation to complete")
> Signed-off-by: Matt Evans <mattev@meta.com>
> ---
> 
> (Just a fix, but later "vfio/pci: Convert BAR mmap() to use a DMABUF"
> and "vfio/pci: Permanently revoke a DMABUF on request" depend on this
> context, so including in this series.)

We really need a fix for this split out from this series, It's already
been shown[1] that this is trivially reachable.  Carlos proposed[2] a
similar solution to the one below.  I was concurrently working on the
issued and suggested an alternative[3].  Let's pick a solution for
7.1-rc.  Thanks,

Alex

[1]https://lore.kernel.org/all/GVXPR02MB12019AA6014F27EF5D773E89BFB372@GVXPR02MB12019.eurprd02.prod.outlook.com/
[2]https://lore.kernel.org/all/20260429182736.409323-2-clopez@suse.de/
[3]https://lore.kernel.org/all/20260429142242.70f746b4@nvidia.com/

 
> drivers/vfio/pci/vfio_pci_dmabuf.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> index 281ba7d69567..04478b7415a0 100644
> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> @@ -395,20 +395,25 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
>  
>  	down_write(&vdev->memory_lock);
>  	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
> +		bool was_revoked;
> +
>  		if (!get_file_active(&priv->dmabuf->file))
>  			continue;
>  
>  		dma_resv_lock(priv->dmabuf->resv, NULL);
>  		list_del_init(&priv->dmabufs_elm);
>  		priv->vdev = NULL;
> +		was_revoked = priv->revoked;
>  		priv->revoked = true;
>  		dma_buf_invalidate_mappings(priv->dmabuf);
>  		dma_resv_wait_timeout(priv->dmabuf->resv,
>  				      DMA_RESV_USAGE_BOOKKEEP, false,
>  				      MAX_SCHEDULE_TIMEOUT);
>  		dma_resv_unlock(priv->dmabuf->resv);
> -		kref_put(&priv->kref, vfio_pci_dma_buf_done);
> -		wait_for_completion(&priv->comp);
> +		if (!was_revoked) {
> +			kref_put(&priv->kref, vfio_pci_dma_buf_done);
> +			wait_for_completion(&priv->comp);
> +		}
>  		vfio_device_put_registration(&vdev->vdev);
>  		fput(priv->dmabuf->file);
>  	}


