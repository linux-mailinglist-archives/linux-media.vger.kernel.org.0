Return-Path: <linux-media+bounces-60592-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGlZNLY4+2nUXwMAu9opvQ
	(envelope-from <linux-media+bounces-60592-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 14:48:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDC44DA7C3
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 14:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F70B309478C
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 12:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC5543D517;
	Wed,  6 May 2026 12:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="bpzqFq8Z"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EB0449EC3;
	Wed,  6 May 2026 12:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778071462; cv=pass; b=Cmm/J6xPn2BYJ9UbO3zX8rWy3CTpvZdJwB/n8rxFrpcdGDFAzOXU+LCDvUHfYlb5nW2ALFbthvymJCLX6xjFUrnl4bEctqsXEdp5DDMxRPdEnwQY/5klOhQA2wOIko761QN3m/HBKQJ/v1B81jl73b1N1wbXeSItAazmXyjNPgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778071462; c=relaxed/simple;
	bh=BBh5xHp0EE+u0cr6D75njYc0+dmuhkoDFGJHTVXTNJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ig/+8MFkPE4OF0MriURmBWtiIV53/eOZ951NDj5DYvCv1FyYwzgE8cC7JasGmoCP7JMvIFry6Gh5vV8QyxpTtjQvdoICFv79u3iUL2Q7gib3mfgAqTVQI+ko5Zh1wcIj+sYPy3U7SQ3WUXbLW/Zr/8EcDtKfW5gSF3o4VJww3xA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=bpzqFq8Z; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1778071430; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lwcAHOQ9qKgB6gd/9on1FXLK0UkDSvYUDqw8dWjksSDlhrGY71mr6dLuvD+Juxe7xZVjqeJdePgX0oelI7eQUHqqowgB8a6OMxv6o1UV6i0eChNz60qd+WnKM+eJoBrwIjImFw07Yt0V27nCcqSlbOo6ShtG+Fo4J4K4qq2kCS8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778071430; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4WOETdo7BhC8/fmfwEMHN4WnoE6JbrZL+S0o9p8CuQg=; 
	b=QQtT0Z2HOlpHk1d9Psdmk2ZCNNPApPHJlD8+9lgEYkTjwIU+QWETNPS0/0co+QVLUGW99oqJLrb2APT0E4slFtgSK84HyYQSTdb7+WUFt9JJi0L0l9LJFfnCCLxwnWo5UvjBeYpz5WfQatVYER/N+9ert4DqpakFi/YFAGl6j+8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778071430;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=4WOETdo7BhC8/fmfwEMHN4WnoE6JbrZL+S0o9p8CuQg=;
	b=bpzqFq8ZonERTui7D7EsOZ4TgLTnWPmS5jc1gVcCh9oknNoPr4foc8lVt6qDxno8
	NEFNeYkeNwiwAWclb9gxJan+sWCuuXr5s7umaNf7RGIRgmWvVTXIMxOC8jV1DLLjjvM
	Nm1YHD+K9808tVd7G2lSqrJ4FTNe1uXI84ums7Cw=
Received: by mx.zohomail.com with SMTPS id 1778071429188905.6876124875138;
	Wed, 6 May 2026 05:43:49 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Ketil Johnsen <ketil.johnsen@arm.com>, Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Florent Tomasin <florent.tomasin@arm.com>
Subject:
 Re: [PATCH 4/8] drm/panthor: Add support for protected memory allocation in
 panthor
Date: Wed, 06 May 2026 14:43:42 +0200
Message-ID: <SurytM7FTOazQNVXXqCU7g@collabora.com>
In-Reply-To: <20260506-energetic-azure-pig-2b6ec4@houat>
References:
 <20260505140516.1372388-1-ketil.johnsen@arm.com>
 <20260505140516.1372388-5-ketil.johnsen@arm.com>
 <20260506-energetic-azure-pig-2b6ec4@houat>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: 4FDC44DA7C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	CTE_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	TAGGED_FROM(0.00)[bounces-60592-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linux.intel.com,suse.de,lwn.net,linuxfoundation.org,linaro.org,collabora.com,arm.com,google.com,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:mid,arm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Wednesday, 6 May 2026 12:08:24 Central European Summer Time Maxime Ripard wrote:
> Hi,
> 
> On Tue, May 05, 2026 at 04:05:10PM +0200, Ketil Johnsen wrote:
> > From: Florent Tomasin <florent.tomasin@arm.com>
> > 
> > This patch allows Panthor to allocate buffer objects from a
> > protected heap. The Panthor driver should be seen as a consumer
> > of the heap and not an exporter.
> > 
> > Protected memory buffers needed by the Panthor driver:
> > - On CSF FW load, the Panthor driver must allocate a protected
> >   buffer object to hold data to use by the FW when in protected
> >   mode. This protected buffer object is owned by the device
> >   and does not belong to a process.
> > - On CSG creation, the Panthor driver must allocate a protected
> >   suspend buffer object for the FW to store data when suspending
> >   the CSG while in protected mode. The kernel owns this allocation
> >   and does not allow user space mapping. The format of the data
> >   in this buffer is only known by the FW and does not need to be
> >   shared with other entities.
> > 
> > The driver will retrieve the protected heap using the name of the
> > heap provided to the driver as module parameter.
> 
> I know it's what dma_heap_find asks for, but I wonder if it wouldn't be
> better in the device tree and lookup through the device node? heaps are
> going to have a node anyway, right?
> 
> This would allow you to have a default that works and not mess to much
> with the kernel parameters that aren't always easy to change for
> end-users.

Hopefully the kernel parameters aren't easy to change for end-users on
systems that deploy this. :) The use-case is copy protection for embedded
devices running on locked-down systems. Though admittedly the mechanism
works even on "tampered"-with systems, as long as the underlying hardware
implements the access restrictions properly.

I'm a bit hesitant about making this DT myself. It would solve the problem
that panthor could probe before the heap provider and needs to handle
deferral by itself, but it does mean that we'd be putting software
configuration into the device tree. Having the secure heap be a node with
no address would allow the tee (or whatever else) to still dynamically
allocate it wherever, and let us handle the dependency relationship
between dma heap and GPU, but then we require that tee heap driver
implementations play nice with this scheme, and bring OF into the
dma_heap APIs.

I'm not against making the dma heap a phandle property for the GPU
node and then extending the dma-heap API to get a heap by name or
by index from a user device's standardised phandle property/names
property, but that's potentially a very large can of worms to open.

> 
> Maxime
> 

Kind regards,
Nicolas Frattaroli



