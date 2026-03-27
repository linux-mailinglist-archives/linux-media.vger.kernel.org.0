Return-Path: <linux-media+bounces-57224-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMOBEsFzxmkCKgUAu9opvQ
	(envelope-from <linux-media+bounces-57224-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 13:10:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC671343FF2
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 13:10:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B851302F437
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 12:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 057FC395240;
	Fri, 27 Mar 2026 12:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="OcrXxm1V"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3BD3932F2
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 12:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774613425; cv=none; b=QaTPtgSy8/JzmO5+DHtCosdEstnMrJBS9CUJRVsZ2MPw++ZKtpzNkLHorvH8/32WqGhH43/YWKtRBvSCAYoYalWbMZ5DguCiUHXDKlb/zCzkotPfxxuEMVg73pdysqEmPKCNswcalXgttUdqHBG+LVgFuKqUkLbqyqrNcfL0uHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774613425; c=relaxed/simple;
	bh=ghZHpLykub1cNN1HjFeRqA1TQ1HWa/ZB0207dvHDd5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pvsps3er4WMyAAlc/0+7iM1TPV6r+fhp69YJmp2irJZeoL/W6SD6zSdzOQvG5ejudS3gTwgscDdSY4neuLcUSweiEQKRfYh1dfAEuzdPnHxfmINM1AduBYSyf9yolTYFAbS/ew5/lHNzivxYrAKgMFaC928MB7ZCWE4CVp0CQwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=OcrXxm1V; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8cfdac74050so255766185a.3
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 05:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1774613423; x=1775218223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mfIjIsS8DDjImfR7uqLq3DxooHT40pwlydrjxj52iHU=;
        b=OcrXxm1VH/AywYiTQ4IIjBGfVkubgOarwkpSTEXkGHMthF2qxy3EiRi7wk3XakyrTd
         jxuRF+dFlpXxgJ8vS0EQLeo1tr+p8gpT8R4WXQJ7RIbxF1kQLpn+mYWcvAi9fJl+7BX8
         akTNc3OaT2v2Tfi3QX5nXXaZN2qCsAJZ0gnGNTN5rstN1rFG8k0F+9yMy9uO/TSY6YIh
         srLareuxexur0qVt5Ad1wiLw2/teblXYO1nlAF2P9+k8OZa2Y14NpUSSYofbml7vFj6Y
         dY8cfo5z0CKQDotPbt0G8+YzIyWF839fUkiYwLSEKScv1KsUS8/qg4j6Zk5c12hyjGbR
         uT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774613423; x=1775218223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mfIjIsS8DDjImfR7uqLq3DxooHT40pwlydrjxj52iHU=;
        b=ACb63LgkHQtkTzKa/JP+yojygmJZhgbUz9Qi1DWkFh2RfW+kUpuHjcKvnnBu+/qkX1
         FoezNQwBlTS7OpvbN0v0u/h0HyxnKtfxZhzJdxNJ4VPC2cAwlYelHecCB2qwnbLfZ3Hw
         jnWiDH0BMAoxKDBOrr8gUA5tEUQXg1ayVYK0gJ60MzFcgVkYuBwqavkuZ6DADoxYiOOe
         45sdO+WPB/ZtA2joXZNcJdjo25KqaYT5A6u7f9HlMQMp6na6AyZkd1TR9RKAB4LmoJIA
         VhLylRwjAedmHjYQiqH2Go0FzneShsZhM6RM4ez5qIQ+xomPsTZ6vIjG0J+eMAemySe2
         UfCA==
X-Forwarded-Encrypted: i=1; AJvYcCWuN5XvSvS3TXLPb0UjhqcBTrBcqpqrrlRlFS5/3+L2Q14SXV5NHCkG6vqpI3oBBNLYoUyZ7rdQLXbewQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyP00ozhllY6cm8ddXUdHWea8fEcuuZcRCVbxw46MW8HdBuGSC6
	C01tSQQIoFxVxm7OmI3VGjcYVfguO4O0XxKnWR3OXmQjGwW5CgBdcjTQgaTjjrKwVmg=
X-Gm-Gg: ATEYQzxjA/HlDfzJwk30O/FL8xX7MuTOSCED0byQX3DOycMg2JboyMO8S9aTBsn1kCe
	Md1qTD8IYGFdcktcNmDfkzM8OIfKAU+nuhs8FbiokgAJ2OMV3HDEH2hOUSo4xf3DouV/3NcaGCt
	5+fFnrUrV+PT8sDD3nkKfavW6JdklwA+3+ftS6ydPjbb/d3jntEPoeshGi/gZzDca7t2+UTvFbY
	QokKee1aFiXP8B8pe/BE5SrBbTFlU7Gb+BUN/jFi+w7oxdv2BXHDZQ+mt5DpWrALArgS1Vt5yHL
	4/LG0cfm/fe65dcxKXoGM3xOr5eqhYrc8qwrgbD8V9iMYP83nKXdCDYlGA/ppvl+R1h7BFL/yar
	5UfYQ9gA8t1TDtvR7IJ1tWZQeztiKgznGlJm3tcgSCdoY4AVukax8KG7QUcsIfuwxyGDI3ovDYQ
	9hFugQy8dZGF5deKenzp1Q3/8H9l0vSDeyI3JtgGLijDXFbh+CJKmAcj1ce4QmhITWTtMxYg==
X-Received: by 2002:a05:620a:4589:b0:8cd:6175:9b17 with SMTP id af79cd13be357-8d01c5bf3ffmr259778785a.3.1774613423032;
        Fri, 27 Mar 2026 05:10:23 -0700 (PDT)
Received: from ziepe.ca (mctnnbsa70w-159-2-73-22.dhcp-dynamic.fibreop.nb.bellaliant.net. [159.2.73.22])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d00e3c3a0dsm507700285a.13.2026.03.27.05.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 05:10:22 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1w6617-00000001CcJ-1QAP;
	Fri, 27 Mar 2026 09:10:21 -0300
Date: Fri, 27 Mar 2026 09:10:21 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	"T.J. Mercier" <tjmercier@google.com>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	jstultz@google.com, tjmercier@google.com, christian.koenig@amd.com,
	robin.murphy@arm.com, leon@kernel.org, sean.anderson@linux.dev,
	ptesarik@suse.com, catalin.marinas@arm.com, aneesh.kumar@kernel.org,
	suzuki.poulose@arm.com, steven.price@arm.com,
	thomas.lendacky@amd.com, john.allen@amd.com, ashish.kalra@amd.com,
	suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH v5 0/2] dma-buf: heaps: system: add an option to allocate
 explicitly shared/decrypted memory
Message-ID: <20260327121021.GB246076@ziepe.ca>
References: <CGME20260325192400eucas1p2ae38ff4c2b3ab35a7047cfd680d9fda3@eucas1p2.samsung.com>
 <20260325192352.437608-1-jiri@resnulli.us>
 <f2047cd7-91a8-4f6a-b6b9-0e4f143f6854@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2047cd7-91a8-4f6a-b6b9-0e4f143f6854@samsung.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57224-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	DMARC_NA(0.00)[ziepe.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:email,ziepe.ca:dkim,ziepe.ca:mid]
X-Rspamd-Queue-Id: BC671343FF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 10:38:10AM +0100, Marek Szyprowski wrote:
> On 25.03.2026 20:23, Jiri Pirko wrote:
> > From: Jiri Pirko <jiri@nvidia.com>
> >
> > Confidential computing (CoCo) VMs/guests, such as AMD SEV and Intel TDX,
> > run with private/encrypted memory which creates a challenge
> > for devices that do not support DMA to it (no TDISP support).
> >
> > For kernel-only DMA operations, swiotlb bounce buffering provides a
> > transparent solution by copying data through shared memory.
> > However, the only way to get this memory into userspace is via the DMA
> > API's dma_alloc_pages()/dma_mmap_pages() type interfaces which limits
> > the use of the memory to a single DMA device, and is incompatible with
> > pin_user_pages().
> >
> > These limitations are particularly problematic for the RDMA subsystem
> > which makes heavy use of pin_user_pages() and expects flexible memory
> > usage between many different DMA devices.
> >
> > This patch series enables userspace to explicitly request shared
> > (decrypted) memory allocations from new dma-buf system_cc_shared heap.
> > Userspace can mmap this memory and pass the dma-buf fd to other
> > existing importers such as RDMA or DRM devices to access the
> > memory. The DMA API is improved to allow the dma heap exporter to DMA
> > map the shared memory to each importing device.
> >
> > Based on dma-mapping-for-next e7442a68cd1ee797b585f045d348781e9c0dde0d
> 
> I would like to merge this to dma-mapping-next, but I feel a bit 
> uncomfortable with my lack of knowledge about CoCo and friends. Could 
> those who know a bit more about it provide some Reviewed-by tags?

I'm confident in the CC stuff, I was hoping to see someone from dmabuf
heap land ack that the uAPI design is OK.. TJ?

Jason

