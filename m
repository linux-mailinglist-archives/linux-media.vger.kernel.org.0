Return-Path: <linux-media+bounces-60638-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPSaErxY+2n+ZQMAu9opvQ
	(envelope-from <linux-media+bounces-60638-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 17:05:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEC34DCDA0
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 17:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 752AA3004615
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 15:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF38847CC79;
	Wed,  6 May 2026 15:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Xl2+76cJ"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DFE317146;
	Wed,  6 May 2026 15:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778079927; cv=none; b=XnC1HK2TDK5lu9y19LDrVbfIW0q8zKP+RM/PT3kKeJlyUZS4uPpy18eJdpSu6EI2uhT7AWB/XTZoXCdqG1qZCKGp8zAiV+rrOKyrDb+n0i+ICgrJHwD4CM1TaRf0FhwG0pnWNVxPD5L9hcwY2FxYkyaODZRlTpRX+Gh5fmn6eME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778079927; c=relaxed/simple;
	bh=5VmaZC0RomEbp6aSDoSjoUMQMXlIAykXwImP8NyVAX4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PbAUNxHOyYbIioz7buFF+zdeYknw/vDv6hwNcChp8rycBky727iuBn9kZ6t6JmM9xbFEzubydV+vRabeID1IVdhfplknlvNqpm6VMXzvgmesuVQmRq1D6a4wYaMAzBHK4EvsCOCAZKwT5qn2jTY4k9pkQpNQpXZOB6190P9Io8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Xl2+76cJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778079924;
	bh=5VmaZC0RomEbp6aSDoSjoUMQMXlIAykXwImP8NyVAX4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Xl2+76cJ+aSL9e3r2WJoupZZAaYmQbPGDTHPik5U1VTSygVKWY3ArXBA/kjLDvK4G
	 eg9+ssBQ7WGf+DKYenyfLSkd5s4HT/1O9GMoqrlLxFyY0gax8+zwirT6uUFHpDh13T
	 0kqWAvplq2HRPGwxVpV7x81YumQffmyohu09SIXwfXESbDS5ZguwU2j2jNqVm+hpiq
	 laYdbYVv3n8e9Va/HRP8M9VY74Jc3EtOds65TNkUJAHJ/GXycujbibDaOv+giz73Cq
	 gCyTna02cmPHhb8AkVl3fQ23YY1KHnz1yMjPIfF63MXay/Kr/iYE/FwktK2luqam6O
	 nqUdERfFEz3VA==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EBF9F17E0610;
	Wed,  6 May 2026 17:05:22 +0200 (CEST)
Date: Wed, 6 May 2026 17:05:15 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Ketil Johnsen <ketil.johnsen@arm.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T.J. Mercier"
 <tjmercier@google.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Steven Price <steven.price@arm.com>, Liviu
 Dudau <liviu.dudau@arm.com>, Daniel Almeida <daniel.almeida@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Florent Tomasin <florent.tomasin@arm.com>
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
Message-ID: <20260506170515.2d8511c3@fedora>
In-Reply-To: <20260506-golden-python-of-aptitude-ff972a@houat>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
	<20260505140516.1372388-5-ketil.johnsen@arm.com>
	<20260506-energetic-azure-pig-2b6ec4@houat>
	<20260506125015.0108ef44@fedora>
	<20260506-golden-python-of-aptitude-ff972a@houat>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: DEEC34DCDA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60638-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[arm.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,lwn.net,linuxfoundation.org,linaro.org,collabora.com,google.com,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Wed, 6 May 2026 15:12:37 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> On Wed, May 06, 2026 at 12:50:15PM +0200, Boris Brezillon wrote:
> > On Wed, 6 May 2026 12:08:24 +0200
> > Maxime Ripard <mripard@kernel.org> wrote:
> >   
> > > Hi,
> > > 
> > > On Tue, May 05, 2026 at 04:05:10PM +0200, Ketil Johnsen wrote:  
> > > > From: Florent Tomasin <florent.tomasin@arm.com>
> > > > 
> > > > This patch allows Panthor to allocate buffer objects from a
> > > > protected heap. The Panthor driver should be seen as a consumer
> > > > of the heap and not an exporter.
> > > > 
> > > > Protected memory buffers needed by the Panthor driver:
> > > > - On CSF FW load, the Panthor driver must allocate a protected
> > > >   buffer object to hold data to use by the FW when in protected
> > > >   mode. This protected buffer object is owned by the device
> > > >   and does not belong to a process.
> > > > - On CSG creation, the Panthor driver must allocate a protected
> > > >   suspend buffer object for the FW to store data when suspending
> > > >   the CSG while in protected mode. The kernel owns this allocation
> > > >   and does not allow user space mapping. The format of the data
> > > >   in this buffer is only known by the FW and does not need to be
> > > >   shared with other entities.
> > > > 
> > > > The driver will retrieve the protected heap using the name of the
> > > > heap provided to the driver as module parameter.    
> > > 
> > > I know it's what dma_heap_find asks for, but I wonder if it wouldn't be
> > > better in the device tree and lookup through the device node? heaps are
> > > going to have a node anyway, right?  
> > 
> > I'm not too sure. Take the PROTMEM (name="protected,xxxx") dma_heaps
> > instantiated by optee for instance, I don't think the originating
> > tee_device comes from a device node, nor is the underlying heap
> > described as a device node. The reserved memory pool this protected heap
> > comes from is most likely defined somewhere as reserved memory in the
> > DT, but there's nothing to correlate this range of reserved mem to some
> > sub-range that the TEE implementation is carving out to provide
> > protected memory.  
> 
> Maybe we should be working on a dt bindings for heaps then? Something
> simple like we have for clocks with a phandle and an ID would probably
> be enough. In optee's case, it looks like it would map nicely with
> TEE_DMA_HEAP_* flags too.

Sure.

> 
> The only two that wouldn't be covered would be the system and default
> CMA heap if not setup in the DT, which shouldn't be too bad for this
> particular use-case.

I'm not opposed to the idea of describing the association through the
DT (with a <phandle, ID> pair). My main fear is that it drags us into
endless discussions around what's considered HW description and what's
not (PTSD of all those DT-bindings discussions I suppose :-)), which
ends up delaying the merging of Panthor's protected memory support.

Honestly, at this point I'm considering going back to my initial
suggestion to add a dedicated ioctl() (requiring high privilege) to let
the user pass the memory for the FW protected sections as a dmabuf FD.
Given we don't need those sections to be populated for the FW to boot,
it wouldn't block the probe of the driver, it would just prevent PROTM
usage until those sections are populated.

This would let us make progress with the rest of the changes in this
patchset, while the community decides how they want to expose dma_heaps
to in-kernel users.

