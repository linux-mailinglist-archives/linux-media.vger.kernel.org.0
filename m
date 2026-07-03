Return-Path: <linux-media+bounces-66456-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0qDzETepR2p5dAAAu9opvQ
	(envelope-from <linux-media+bounces-66456-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 14:21:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7567024C8
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 14:21:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=d6VbRKa+;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66456-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66456-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6ECB9307A303
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 12:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C46923D0929;
	Fri,  3 Jul 2026 12:14:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2323B3CFF62;
	Fri,  3 Jul 2026 12:14:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783080883; cv=none; b=JVmyH1+y5imhsUg9AGsilKNkpP2B+rK+1oH0NV5iS5oOzpYzT4FLTu2You9/FB9+nfXts1bstXOtLgIiCYaYhAR9XNxxq29vJn15fGhvxStbWy/ayY4x7BzAaWY71Yn239rjQCoAotF1bZOUinr5q3qgBFkUT2rTpDOvxcf0UZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783080883; c=relaxed/simple;
	bh=7oSe6vRFZ03ReKBlWsONPnw+sfqHPtTYPgB7ySgxNfo=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=Vo+3Av4A64RKZw3mwdkbVD3CwEew2Bpg5ntzBimR0PX/USdmcf7hOMrzGegY1iJDzsFbjlbROUgsONJLnpDRnoALn4DRJIDxvEPtbJOq8G46/sOseIOWBV7rgA5WH/c2jqm6fgSVpvfGGY8FDqW/HYBEDDa8wcg7YOubhekQ1yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d6VbRKa+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 126D41F000E9;
	Fri,  3 Jul 2026 12:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783080881;
	bh=wCSekJzceclmv2Xdvl4vn/0F9vF6oLcNXpc7pUyDj0k=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=d6VbRKa+He2/cAFmwYnkVZjxIlsRAYd3koyUzl174SlRWigVinPrxLNyW1D1D0xO6
	 vkKKNIjrywD5F/UoMCDkjtUhMxTDLSU421VLUP3NnsA6Yq0l9c8CZZMUbV11zQMLVm
	 xMzeOzkKcw/86tXQdDzbYMe4rYh4Pzb86R5wZxWB+2w+rY6vfS4Tp4BiDgmMxVtryf
	 iBGvffCRTHwx+6nF4Codf8+X4UD6mDt+kizURmVt9H/JKijTnykALPxPBgCZUpmupk
	 VMwlDGrjS5G8BUxlsvjQZ0J03g4d96qrPiIHOY/A1nSnH6jTvs4ieLW2YML2tmOltj
	 ytQtBS/G8QFIA==
Message-ID: <e6cccc28049a6231d50842254447c909@kernel.org>
Date: Fri, 03 Jul 2026 12:14:39 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Thierry Reding" <thierry.reding@kernel.org>
Subject: Re: [PATCH v3 07/11] dma-buf: heaps: Add debugfs support
In-Reply-To: <20260701-tegra-vpr-v3-7-d80f7b871bb4@nvidia.com>
References: <20260701-tegra-vpr-v3-7-d80f7b871bb4@nvidia.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-mm@kvack.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-trace-kernel@vger.kernel.org, "Alexander
 Gordeev" <agordeev@linux.ibm.com>, "Andrew Morton" <akpm@linux-foundation.org>, "Benjamin
 Gaignard" <benjamin.gaignard@collabora.com>, "Brian Starkey" <Brian.Starkey@arm.com>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Conor
 Dooley" <conor+dt@kernel.org>, "David Airlie" <airlied@gmail.com>, "David
 Hildenbrand" <david@kernel.org>, "Gerald Schaefer" <gerald.schaefer@linux.ibm.com>, "Heiko
 Carstens" <hca@linux.ibm.com>, "John Stultz" <jstultz@google.com>, "Jonathan
 Hunter" <jonathanh@nvidia.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Liam
 R. Howlett" <liam@infradead.org>, "Lorenzo Stoakes" <ljs@kernel.org>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Masami Hiramatsu" <mhiramat@kernel.org>, "Mathieu
 Desnoyers" <mathieu.desnoyers@efficios.com>, "Maxime Ripard" <mripard@kernel.org>, "Michal
 Hocko" <mhocko@suse.com>, "Mike Rapoport" <rppt@kernel.org>, "Mikko
 Perttunen" <mperttunen@nvidia.com>, "Rasmus Villemoes" <linux@rasmusvillemoes.dk>, "Rob
 Herring" <robh@kernel.org>, "Robin Murphy" <robin.murphy@arm.com>, "Russell
 King" <linux@armlinux.org.uk>, "Simona Vetter" <simona@ffwll.ch>, "Sowjanya
 Komatineni" <skomatineni@nvidia.com>, "Steven Rostedt" <rostedt@goodmis.org>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, "Suren Baghdasaryan" <surenb@google.com>, "Sven
 Schnelle" <svens@linux.ibm.com>, "T.J. Mercier" <tjmercier@google.com>, "Thierry
 Reding" <thierry.reding@gmail.com>, "Thierry Reding" <treding@nvidia.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Vasily Gorbik" <gor@linux.ibm.com>, "Vlastimil
 Babka" <vbabka@kernel.org>, "Will Deacon" <will@kernel.org>, "Yury Norov" <yury.norov@gmail.com>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66456-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@kernel.org,m:devicetree@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:iommu@lists.linux.dev,m:linaro-mm-sig@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-mm@kvack.org,m:linux-s390@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:agordeev@linux.ibm.com,m:akpm@linux-foundation.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:catalin.marinas@arm.com,m:borntraeger@linux.ibm.com,m:christian.koenig@amd.com,m:conor+dt@kernel.org,m:airlied@gmail.com,m:david@kernel.org,m:gerald.schaefer@linux.ibm.com,m:hca@linux.ibm.com,m:jstultz@google.com,m:jonathanh@nvidia.com,m:krzk+dt@kernel.org,m:liam@infradead.org,m:ljs@kernel.org,m:luca.ceresoli@bootlin.com,m:maarten.lankhorst@linux.intel.com,m:m.szyprowski@samsung.com,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:mripard@kernel.org,m:mhocko@suse.com,m:rppt@kernel.o
 rg,m:mperttunen@nvidia.com,m:linux@rasmusvillemoes.dk,m:robh@kernel.org,m:robin.murphy@arm.com,m:linux@armlinux.org.uk,m:simona@ffwll.ch,m:skomatineni@nvidia.com,m:rostedt@goodmis.org,m:sumit.semwal@linaro.org,m:surenb@google.com,m:svens@linux.ibm.com,m:tjmercier@google.com,m:thierry.reding@gmail.com,m:treding@nvidia.com,m:tzimmermann@suse.de,m:gor@linux.ibm.com,m:vbabka@kernel.org,m:will@kernel.org,m:yury.norov@gmail.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.linaro.org,lists.infradead.org,kvack.org,linux.ibm.com,linux-foundation.org,collabora.com,arm.com,amd.com,kernel.org,gmail.com,google.com,nvidia.com,infradead.org,bootlin.com,linux.intel.com,samsung.com,efficios.com,suse.com,rasmusvillemoes.dk,armlinux.org.uk,ffwll.ch,goodmis.org,linaro.org,suse.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[56];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E7567024C8

On Wed, 1 Jul 2026 18:08:18 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add a callback to struct dma_heap_ops that heap providers can implement
> to show information about the state of the heap in debugfs. A top-level
> directory named "dma_heap" is created in debugfs and individual files
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

