Return-Path: <linux-media+bounces-65567-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LjahMorqO2pJfQgAu9opvQ
	(envelope-from <linux-media+bounces-65567-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 16:32:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4106F6BF246
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 16:32:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Xcj86EXk;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65567-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65567-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD05E301CFDC
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC75A2F7F0F;
	Wed, 24 Jun 2026 14:31:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6193C2BA2;
	Wed, 24 Jun 2026 14:31:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782311485; cv=none; b=qczc1MqIXRT/fOofvsHoMtsiml/flONRK7YAuYWdKkXTm1K4uc/4VzpyN1aOz3z557jbBhvB9SMsZXSHEqMWaYQL7S34iA5ySkMfykn2eTjlhIVAZhfTOCflfQdyZdrwYYj9zFpkOHUu7RmRrYU//yaF5Tk3OT2cBRwgFfVmkxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782311485; c=relaxed/simple;
	bh=gQkEKF0/rzuyGK6P25/LwLzJCSwmAYKC7KJiWeKC1P8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=objHZ77upssswvV/sX7mpVyePlyrKtIZ9EPYM1jN1BZBSMS/eN10PD+Z/j45Oo/PbQwkAawRZB+vuivxAb4ctj/jXi7yz4zs9jCaLg3xe2loTfGI7nSR0TAQaCMkX+DmWLnEeRTEMc3DuROvlu4EIMlEiv3q866IoCROuHdzwEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xcj86EXk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 183991F000E9;
	Wed, 24 Jun 2026 14:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782311483;
	bh=dMJlxp8QipVxy2M9SnWzpGrx6rBzEVmcbiBu62OC/Ew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xcj86EXknUiizWzaPEFY1ZJZBKFKp44sKaQgJw4AKDhpmLbVWGfhD2saUODX1WBt2
	 qYc2Akrz3AmSr0iitaVzc/maSTOWGR6/7qYP1rCXN4BfB2DbEdkYST9ZV0KE5sMbBu
	 RgFSAihK8C3KYHuaPxwiOzFOCH3jCehmSVuGwbVeZerU7KpMWXBO5AO2o5qderwYCn
	 qiH5Zm8pa1kbYM//LH4iVQq2DjoIZodWIVytV/2tLOINXQYgIExyPRR3Mo/L3NqFYi
	 OoVIfoGbe0L0GMLeGllR+qC2wkmTefZnIhRgPxseduf1fZBepZKgngNip8+o+Az1zV
	 G230X6Y0L/zpQ==
Date: Wed, 24 Jun 2026 17:31:19 +0300
From: Leon Romanovsky <leon@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Pranjal Shrivastava <praan@google.com>, David Hu <xuehaohu@google.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	jmoroni@google.com, kpberry@google.com, chriscli@google.com,
	sashiko-bot@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] dma-buf: Split sgl into page-aligned 2G chunks
Message-ID: <20260624143119.GA124186@unreal>
References: <20260621222130.1667453-1-xuehaohu@google.com>
 <20260623015459.1153884-1-xuehaohu@google.com>
 <20260623094446.4a8fc2ed@pumpkin>
 <ajryxMaT5evDUxaq@google.com>
 <20260623235350.6540eaa2@pumpkin>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260623235350.6540eaa2@pumpkin>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:david.laight.linux@gmail.com,m:praan@google.com,m:xuehaohu@google.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:jgg@ziepe.ca,m:nicolinc@nvidia.com,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:jmoroni@google.com,m:kpberry@google.com,m:chriscli@google.com,m:sashiko-bot@kernel.org,m:stable@vger.kernel.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[leon@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leon@kernel.org,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65567-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,widen.net:url,bootlin.com:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,unreal:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4106F6BF246

On Tue, Jun 23, 2026 at 11:53:50PM +0100, David Laight wrote:
> On Tue, 23 Jun 2026 20:55:32 +0000
> Pranjal Shrivastava <praan@google.com> wrote:
> 
> > On Tue, Jun 23, 2026 at 09:44:46AM +0100, David Laight wrote:
> > 
> > Hi David,
> > 
> > > On Tue, 23 Jun 2026 01:54:59 +0000
> > > David Hu <xuehaohu@google.com> wrote:
> > >   
> > > > Currently, `fill_sg_entry()` splits the scatterlist using `UINT_MAX`.
> > > > This creates a non-page-aligned DMA length (`0xFFFFFFFF`) for the
> > > > first entry, resulting in non-page-aligned DMA addresses for all
> > > > subsequent entries.  
> > > 
> > > There is a separate issue of whether this code is even needed at all.
> > > Where can transfers over 2G (never mind 4G) actually come from.
> > > 
> > > The read, write and similar system calls limit transfers to INT_MAX
> > > (even on 64bit) and a lot of driver code will need fixing it longer
> > > lengths are allowed though.
> > > io_uring better enforce the same limits.
> > > So the transfers can come directly from userspace.
> > > 
> > > Not only that but you also need a single physically contiguous buffer.
> > > Good luck allocating that!
> > > 
> > > Now maybe there are some peer-to-peer places where the large buffer
> > > is device memory, but they will be unusual and probably need
> > > special treatment anyway.
> > >   
> > 
> > I agree that traditional VFS read/write face the MAX_RW_COUNT limit 
> > (~2GB), and io_uring has its limits, but I'm a little confused by the
> > push to enforce these limits here in the SGL code?
> > 
> > File I/O seems to be only one side of the picture. In my view, this fix
> > is necessary and certainly has a use-case:
> > 
> > For example, the RDMA subsystem has the capability to import dmabufs [1],
> > which gives rise to use cases for dmabuf beyond standard file ops 
> > (via VFS/io_uring). 
> > 
> > In these scenarios, GPU HBM can be exported as dmabufs. With recent GPUs,
> > HBM capacity can be in the order of hundreds of GBs [2]. RDMA can employ
> > infrastructure like the vfio-dmabuf-exporter [3] or similar dmabuf 
> > exporters to frequently move huge blocks of data via P2PDMA.
> 
> Ok, that explains where big buffers can come from.
> I just wasn't sure.
> 
> > If we restrict incoming dmabuf transfers to fit within VFS-centric 
> > limits (2GB), we impose unnecessary overhead on the RDMA stack, forcing
> > it to manage a significantly higher number of memory registrations. By 
> > cleanly splitting these massive contiguous device buffers into 
> > page-aligned SGL entries, we directly improve the efficiency of P2P 
> > transfers and memory registration.
> 
> But a divide by '4G - PAGE_SIZE' is also non-trivial and (I think affects
> a lot of io) when the quotient is always 1.
> Splitting into 2G chunks is a lot cheaper.
> 
> > Since this change doesn't seem to have a negative impact on standard file
> > I/O or break existing VFS constraints, I'm curious why we shouldn't 
> > support splitting these >4GB P2P transfers? Am I missing something?
> 
> I was only wondering whether it was needed...
> It does bring up the question of why the >4GB transfers even need splitting.
> But that is another question.

Just a side note:

In our vision, we aim to transition DMABUF to use physical  
addresses directly https://lore.kernel.org/all/0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com/  
and eliminate the scatter‑gather layer from the DMABUF path.

Thanks

> 
> If you want to split large transfers into 4G-PAGE_SIZE blocks
> it is probably worth having a quick test that returns 1 for 'small' buffers.
> 
> 	David
> 
> > 
> > Thanks,
> > Praan
> > 
> > [1] https://elixir.bootlin.com/linux/v7.1.1/source/drivers/infiniband/core/umem_dmabuf.c#L174 
> > [2] https://nvdam.widen.net/s/fdvdqvfvj2/hopper-h200-nvl-product-brief (Table 2-2)
> > [3] https://elixir.bootlin.com/linux/v7.1.1/source/drivers/vfio/pci/vfio_pci_dmabuf.c#L297
> > 
> 

