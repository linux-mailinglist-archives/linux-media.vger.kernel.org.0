Return-Path: <linux-media+bounces-53221-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LvVFg+tnGlyJwQAu9opvQ
	(envelope-from <linux-media+bounces-53221-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 20:39:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A9017C79F
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 20:39:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2D2B30715C6
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 19:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD6236F426;
	Mon, 23 Feb 2026 19:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MJS3c3CP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="s/pwrMw3"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1670523AB8D
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 19:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771875582; cv=none; b=M79M6fbuYZhbGyrH0wPO5WzTJhutlulIu94dsOSVYkeijATFz2u/DAEZnwokU0YkgHDHF7BKDpqQ9PCVO+WdYId3ww8QWZEdtEau85K6Nu8Uf/kn4SEX4WNsJM+AiJAZRZDjFW/86jBFYsqvcd9iv71F5/TNnr0V5UC1xze7MeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771875582; c=relaxed/simple;
	bh=dk8hvoE8uQxFO2m7M7VLsnEvFj4HuBT1x4Phxw8bnzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qByy4mXDtHBaMWERv8JW2kUsSIEtu9mBsD3i3i1S3gunhwWzb+SuSvJ6adB8o6G5QBHiQGngBaddk/L8B+XyKp+exHujGQn3csrDtBu6dBhnWAPIINFIrGgz4iyCr/ObEJxU8+BUam+5pyRxkd9v09Gsuxl/OkhyEf6+ARGnc9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MJS3c3CP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=s/pwrMw3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771875580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=67ebD5htsI6tjAjswLGtA5uaDjUqlsPp6plwpaEU6dc=;
	b=MJS3c3CPHIGLssrQBUJq6kMDK3U+tvMIsU5El5N7e5+iIniMf7FKnzHNlxGYAVC46tBFWm
	6aQu8ORETCjUNrQf0PZMjFGudSVH1qIppHqihD2RjlwjDu9TDQQjt/tOiKfVZmozSQt9nn
	T4PQSgE5pNiFZ2m2cUYTpLOqn9TXfuc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-YhPrg1Q9OXWC9Wdw2iFNTA-1; Mon, 23 Feb 2026 14:39:38 -0500
X-MC-Unique: YhPrg1Q9OXWC9Wdw2iFNTA-1
X-Mimecast-MFC-AGG-ID: YhPrg1Q9OXWC9Wdw2iFNTA_1771875578
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-896fa0fcf27so618470256d6.1
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 11:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771875578; x=1772480378; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=67ebD5htsI6tjAjswLGtA5uaDjUqlsPp6plwpaEU6dc=;
        b=s/pwrMw3v47VB2otoas6SJzdZ6moh27+AXmH8XHx8PHLc3VrjnYrR2akBOYZ/n9VXn
         jb8jilfR00a1RMsFWDl8NUmvfrm7nOgoRtr+vx6e2xl0e6HOaGKuoO7/jGJAzYTAMhzm
         saWbdluATIr8ZvAT9zHCOprDCyoitkFm7lG/ZvXvLvwquP7rfGXi/whdIXSBtB1SwEMQ
         uyCdU1gI8YA1iNNdH58uFtTtpzLJ5WrWmj34GgSTn+szfHYY5vu22freDJ+MU/70XvZb
         at7dVwy83FdAg0oS7H5pYntK70RZFWGF9v4x94AnIv8Cv62UZJZeTT8tgsGy+zLH/dD2
         X3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771875578; x=1772480378;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=67ebD5htsI6tjAjswLGtA5uaDjUqlsPp6plwpaEU6dc=;
        b=VDMenj6s3BoGK80WBhLi6wnn9oBuDKZeNrE81ujH5aagP0ZNzY8NQX4Nb2tnlk8jDu
         jraDO82fSwzBpeMpxrVShj6V5f3EbX4KgLBqz5/72N6SqNm0bwP2TR8yMcT1OHjSWwFk
         2uv+bVsF7MDyLfpN/VaL9jFarILk32q8kqRLHOkHTueaccV/JcmuZofissznkBKNjyGR
         mRanHJdRWSZ6XczCG+BdKTmuzSixaH89/vki/b181dfUHYXbtO4XUYxwX/ezTprLBn+M
         aSJu+bmxl3HdV3thmcSehMnX9fHELMFnPcXBsxI4M883OLl+xTxJ8l87eu/6XfhdZ29v
         cQuA==
X-Forwarded-Encrypted: i=1; AJvYcCWuaYmXweO3IdKuEw/esjh/4KUXVJUenlagQgZZDFGGYpZumYqL7mzJhyd/Q0oUGMWaIiOP1UE+PkIKQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8LdHeL+RsEgdOS4cjpSXkOBrOE0KM4on74qizA8Dkbdkoj9xy
	6wJP05k82oI0/0bs5dDvfbES/hB0QuuG4ykQ9kg17YtdHw7idQAXLQ9yHBa7Js2MeifirqxxxWW
	uQwxVsn+eCeNmZ9bdMZ4XkoxjTFU1y+M3dcu9yxaPaeYRk30xb0iWjDZTysQptMEB
X-Gm-Gg: ATEYQzzzqUJZPldwYUh3GlB4MtC6vWrhs2+FDNXGzRLYMFFATWJjxGrf4UFnfahQvJG
	Nb/QPz67wrtVnCo3BMhp+BIl5TQTHnhAbCQX0uhpXDQ/iJwyIbPTuxCyDkgQXbIDwnuHllUYyV2
	ObfUPjIoOW27gpD35FZo+x9ZaSF7ECXFcEOmF+0lcqWM/tBffwvx8kRRvFiiqDMwi0/437GAlkG
	szKK3UvaFFcDVB0Z8lyt8vJKuPL/9S/ie4Not6QHBfBF5vmOf8UpSTr1Lly7Dgc8f/irGUGcqJo
	lO6oAXAxV+wkQfj6f8jiMRB0KUBFD4V4YcdROQnM3h0K1gmi5g7WwuBjq0z+BjaSOJgVwe1Z71K
	Z+3cijzJedZerRbo/B7VO8nqmMrRkdawiCuESXzqSiFB2/HFlBMjk9vIUZGnrnDs=
X-Received: by 2002:ad4:5e8d:0:b0:897:306d:98be with SMTP id 6a1803df08f44-89979efc4a9mr154810696d6.55.1771875578033;
        Mon, 23 Feb 2026 11:39:38 -0800 (PST)
X-Received: by 2002:ad4:5e8d:0:b0:897:306d:98be with SMTP id 6a1803df08f44-89979efc4a9mr154810126d6.55.1771875577480;
        Mon, 23 Feb 2026 11:39:37 -0800 (PST)
Received: from localhost (pool-100-17-19-56.bstnma.fios.verizon.net. [100.17.19.56])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5070d544cb8sm74614481cf.12.2026.02.23.11.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:39:35 -0800 (PST)
Date: Mon, 23 Feb 2026 14:39:34 -0500
From: Eric Chanudet <echanude@redhat.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: "T.J. Mercier" <tjmercier@google.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	Maxime Ripard <mripard@redhat.com>, Albert Esteve <aesteve@redhat.com>, linux-mm@kvack.org, 
	Maxime Ripard <mripard@kernel.org>, Yosry Ahmed <yosryahmed@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v2 0/3] dma-buf: heaps: cma: enable dmem cgroup accounting
Message-ID: <aZoHfloupKvF2oSu@fedora>
References: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
 <CABdmKX0LpKJ9tw48oQh7=3CF0UR5uFtgo0OMwQhHBB40LnijyQ@mail.gmail.com>
 <a446b598-5041-450b-aaa9-3c39a09ff6a0@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a446b598-5041-450b-aaa9-3c39a09ff6a0@amd.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53221-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[echanude@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B3A9017C79F
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 10:45:08AM +0100, Christian König wrote:
> On 2/20/26 02:14, T.J. Mercier wrote:
> > On Wed, Feb 18, 2026 at 9:15 AM Eric Chanudet <echanude@redhat.com> wrote:
> > 
> > Hi Eric,
> > 
> >> An earlier series[1] from Maxime introduced dmem to the cma allocator in
> >> an attempt to use it generally for dma-buf. Restart from there and apply
> >> the charge in the narrower context of the CMA dma-buf heap instead.
> >>
> >> In line with introducing cgroup to the system heap[2], this behavior is
> >> enabled based on dma_heap.mem_accounting, disabled by default.
> >>
> >> dmem is chosen for CMA heaps as it allows limits to be set for each
> >> region backing each heap. The charge is only put in the dma-buf heap for
> >> now as it guaranties it can be accounted against a userspace process
> >> that requested the allocation.
> > 
> > But CMA memory is system memory, and regular (non-CMA) movable
> > allocations can occur out of these CMA areas. So this splits system
> > memory accounting between memcg (from [2]) and dmem. If I want to put
> > a limit on system memory use I have to adjust multiple limits (memcg +
> > dmems) and know how to divide the total between them all.
> > 
> > How do you envision using this combination of different controllers?

We are trying to control each CMA heap use of their CMA regions.

Regular allocation would be migrated out should CMA allocation require
some space already taken in the region (bare, I suppose, if these end up
pinned...) so I didn't think it needed to account for these in dmem.

As for accounting for CMA allocations in memcg, I suppose that's the
question prior discussions explored as well.

> Yeah we have this problem pretty much everywhere.
> 
> There are both use cases where you want to account device allocations to memcg and when you don't want that.
> 
> From what I know at the moment it would be best if the administrator could say for each dmem if it should account additionally to memcg or not.
> 
> Using module parameters to enable/disable it globally is just a workaround as far as I can see.
> 

So, for example, adding a dmem knob so one can:
echo "cma/reserved $SIZE" > /sys/fs/cgroup/user.slice/dmem.max
echo "cma/reserved 1" > /sys/fs/cgroup/user.slice/dmem.charge_memcg

I'll take a look.

> Regards,
> Christian.
> 
> > 
> > Thanks,
> > T.J.
> > 
> >> [1] https://lore.kernel.org/all/20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org/
> >> [2] https://lore.kernel.org/all/20260116-dmabuf-heap-system-memcg-v3-0-ecc6b62cc446@redhat.com/
> >>
> >> Signed-off-by: Eric Chanudet <echanude@redhat.com>
> >> ---
> >> Changes in v2:
> >> - Rebase on Maxime's introduction of dmem to the cma allocator:
> >>   https://lore.kernel.org/all/20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org/
> >> - Remove the dmem region registration from the cma dma-buf heap
> >> - Remove the misplaced logic for the default region.
> >> - Link to v1: https://lore.kernel.org/r/20260130-dmabuf-heap-cma-dmem-v1-1-3647ea993e99@redhat.com
> >>
> >> ---
> >> Eric Chanudet (1):
> >>       dma-buf: heaps: cma: charge each cma heap's dmem
> >>
> >> Maxime Ripard (2):
> >>       cma: Register dmem region for each cma region
> >>       cma: Provide accessor to cma dmem region
> >>
> >>  drivers/dma-buf/heaps/cma_heap.c | 15 ++++++++++++++-
> >>  include/linux/cma.h              |  9 +++++++++
> >>  mm/cma.c                         | 20 +++++++++++++++++++-
> >>  mm/cma.h                         |  3 +++
> >>  4 files changed, 45 insertions(+), 2 deletions(-)
> >> ---
> >> base-commit: 948e195dfaa56e48eabda591f97630502ff7e27e
> >> change-id: 20260128-dmabuf-heap-cma-dmem-f4120a2df4a8
> >>
> >> Best regards,
> >> --
> >> Eric Chanudet <echanude@redhat.com>
> >>
> 

-- 
Eric Chanudet


