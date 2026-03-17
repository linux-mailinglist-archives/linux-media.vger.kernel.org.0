Return-Path: <linux-media+bounces-56097-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJAOHgV2uWm8EgIAu9opvQ
	(envelope-from <linux-media+bounces-56097-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 16:40:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F472AD305
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 16:40:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48D8130A87A0
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 15:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EBE03EC2FA;
	Tue, 17 Mar 2026 15:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="beCIfskp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0693EC2C2
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 15:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773762012; cv=none; b=MV//nOOOeVkjj1e0UkP+KLA2vw//MxPS4kJawqsLfdgMuHENStcrRENrvoF7RCjcUgU5KLSd2ZRnLMNtrMBRI+ft04C75BvYKcTAUITYbEHjk8HnvBU7O+UFX6wCEpmRELiFnR+EbnhVysH+59KvjrgQBknVm7Oc7ZjiS7uhJYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773762012; c=relaxed/simple;
	bh=sBrzgYqy4YhXBaHZkGEzLEeQP1vB36ZIIqh/wd2RhOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ma1YDhk+3nQceMSh8VKnK3gDNSrMEFay/tzGKJle/d/vWNArHS2fdFKMpVxlh4tGtzjvRW8K1v5WZpwSs6bb9aex0FaVyM/LN41nSPkxjj53QRlVjHa+cTJiKC7OsUGWFzuhaSO/nUDfDmQYe+Tk8aG2B+fmK/ma2Q2uBZmox9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=beCIfskp; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-485317b6bd0so69675e9.1
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 08:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773762006; x=1774366806; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CDw4r5ujTl31OHrtYbqvixsT9t+9enT6zG9dzarVNeI=;
        b=beCIfskp2GdEeSuQ/Cdp+rUVEX+giZT4MESjyR9/Td2daMknkKWd8ELphzv4bg7Eal
         SzPZOapod79mggfQx8CKgJjLfdSHTVs6LzIa3Y+zytQsHf84EgPrVTW8SeRrpbyTEDIx
         VzRA0Ez6zrAMn9Rz5HISwbrlyHI195wqiY976M5LfzpFjc+KLyXiqPJDhcTLlTUsP7Z0
         q0ID9jrOZZ8eEw84PJFDJnWrNbgEJNLOOXum5kNF1TGAarCKxvgkAGJ8ynOGP2cgfgO/
         TcTAe2RyNvPGGxoVcBoqUidIo6pb5n0WZxSjw2Z5IOQYm09gmNA1bpBAstcOl3TpZMRD
         8KGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773762006; x=1774366806;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CDw4r5ujTl31OHrtYbqvixsT9t+9enT6zG9dzarVNeI=;
        b=NB4oeb+86YFZPXvUPjmHVHOaFYjZYXytgU5u0iKI23xW/rPcNdK8FdB2crNvR45fcq
         47eATOTTbpceqBfvRpoXeSAHBLiIq5SK+KgYQG1XvzFYMUi3hCNPjBJWvcNLV/X2+r32
         hYuuGrnnNaQnQi7TQk4JHGMSG8muNUAXu9xa4lfayhc5eBUK9WUF7D32Og5os/ZF1mUk
         0/0Yfh3cje57Uzn3OqMaeIkU8Bfrb1OKFtqI9kiCjD1Fm032cfwSZHkfniyrm2ASMlpI
         AZnGWarqwh+6rvlv8NEF4VpbGHn+hhtLghNZX0S4KgJ7PVKBbOAt9E4qPWvnSV1HyPQs
         JnqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXP+earXgoOMf6du6IdaxxMOjPEqNcU1doY2sKceOrzQX1tUR1OrbPgUkg4q8jrbAbvRrnkYEerRokBWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrCEvDrVJG1UTGwOm7pMAkbsL9IKgI22TJJjuK6ro6PCh/G9uj
	MKQfMFOnLZ+3GoHSx3hNbpmHi9qSU44CLb7eOZg4S56jlQT1XxCrf6FCZhvBZDyCnw==
X-Gm-Gg: ATEYQzzMGjdOi7TpjWUbngq9YH+GCpFZ64gFo5IFBSee4heRRmYYX9hkuPyTUYXvUix
	B5y+7+RuVydKTUgk7GMjVF3ptMgS7x/T3LjrP1J5EM2pMacIT/adArxh13sTBuBc3wVIzr6AstH
	VAoM8fWfNWXrz0Uh8c1cnmExvZIqqBE04sElDsoWQTUanwORHQGjgXNP4044jUn3PPNKI9xek9H
	QO8SZzbtvYTEJMMd2/om50j8hc37A0qrHrf3WT/FyDGMRz110GT/zc1sguD/gEOji7z7njDzSiQ
	kQrZFr+JdrLd1rYs8uy2eDBuJ7u3uOl5Jt/E5CM31m6F6vJuo0isG+vlQRM5Nz3r/TSnoAEar3S
	v6l6iOmHRZB+VQ3AfPy/wOpC2CDVad6cnWnaTGqfg14yT4LJy7TLKHeA1Y6CQUZMXOFaNzttSeQ
	G6rOMQCu0k1W+sObrzY4I5lL6rMAsDTsm8Sjl2gilU0rZpfxGuuQSeJzgY
X-Received: by 2002:a7b:cb8b:0:b0:483:6f85:b16e with SMTP id 5b1f17b1804b1-485709958a2mr850705e9.3.1773762005359;
        Tue, 17 Mar 2026 08:40:05 -0700 (PDT)
Received: from google.com (54.95.38.34.bc.googleusercontent.com. [34.38.95.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eae3396sm72909465e9.9.2026.03.17.08.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 08:40:04 -0700 (PDT)
Date: Tue, 17 Mar 2026 15:40:01 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	iommu@lists.linux.dev, linux-media@vger.kernel.org,
	sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
	christian.koenig@amd.com, m.szyprowski@samsung.com,
	robin.murphy@arm.com, jgg@ziepe.ca, leon@kernel.org,
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 0/2] dma-buf: heaps: system: add an option to
 allocate explicitly decrypted memory
Message-ID: <abl10SQ4tdasfErt@google.com>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <ablV_f_l7wD2m63E@google.com>
 <xdy5anped2koy47cuxbbqocyypisl7lagwvpuokpzpggohk2dp@yilc5ihictph>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <xdy5anped2koy47cuxbbqocyypisl7lagwvpuokpzpggohk2dp@yilc5ihictph>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-56097-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[smostafa@google.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: E5F472AD305
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 02:37:02PM +0100, Jiri Pirko wrote:
> Tue, Mar 17, 2026 at 02:24:13PM +0100, smostafa@google.com wrote:
> >Hi Jiri,
> >
> >On Thu, Mar 05, 2026 at 01:36:39PM +0100, Jiri Pirko wrote:
> >> From: Jiri Pirko <jiri@nvidia.com>
> >> 
> >> Confidential computing (CoCo) VMs/guests, such as AMD SEV and Intel TDX,
> >> run with encrypted/protected memory which creates a challenge
> >> for devices that do not support DMA to it (no TDISP support).
> >> 
> >> For kernel-only DMA operations, swiotlb bounce buffering provides a
> >> transparent solution by copying data through decrypted memory.
> >> However, the only way to get this memory into userspace is via the DMA
> >> API's dma_alloc_pages()/dma_mmap_pages() type interfaces which limits
> >> the use of the memory to a single DMA device, and is incompatible with
> >> pin_user_pages().
> >> 
> >> These limitations are particularly problematic for the RDMA subsystem
> >> which makes heavy use of pin_user_pages() and expects flexible memory
> >> usage between many different DMA devices.
> >> 
> >> This patch series enables userspace to explicitly request decrypted
> >> (shared) memory allocations from the dma-buf system heap.
> >> Userspace can mmap this memory and pass the dma-buf fd to other
> >> existing importers such as RDMA or DRM devices to access the
> >> memory. The DMA API is improved to allow the dma heap exporter to DMA
> >> map the shared memory to each importing device.
> >
> >I have been looking into a similar problem with restricted-dma[1] and
> >the inability of the DMA API to recognize that a block of memory is
> >already decrypted.
> >
> >However, in your case, adding a new attr “DMA_ATTR_CC_DECRYPTED” works
> >well as dma-buf owns the memory, and is both responsible for the
> >set_memory_decrypted() and passing the DMA attrs.
> >
> >On the other hand, for restricted-dma, the memory decryption is deep
> >in the DMA direct memory allocation and the DMA API callers (for ex
> >virtio drivers) are clueless about it and can’t pass any attrs.
> >My proposal was specific to restricted-dma and won’t work for your case.
> >
> >I am wondering if the kernel should have a more solid, unified method
> >for identifying already-decrypted memory instead. Perhaps we need a
> >way for the DMA API to natively recognize the encryption state of a
> >physical page (working alongside force_dma_unencrypted(dev)), rather
> >than relying on caller-provided attributes?
> 
> I actually had it originally implemented probably in the similar way you
> suggest. I had a bit in page/folio struct to indicate the
> "shared/decrypted" state. However I was told that adding such bit is
> basically a no-go. Isn't that right?
> 

Yes, I believe it’s discouraged to add new fields to the struct page.
But I see the memory encryption API is spilling in different places
and I am not sure if that’s a good enough justification for that or
maybe we just need to re-architect it.
For the restricted-dma stuff, we don’t actually care about the
address, a device can either handle encryption or not, so relying on
force_dma_unencrypted(struct device *) which is implemented by the
architecture is enough, and we just need to integrate that so it
can be used from SWIOTLB and DMA-direct (and other places)
consistently. (although that might not be a simple as it sounds)

I am not sure in the dma-buf case if that would be enough, but
another way to have this per page and to avoid encoding this in
struct page, is to push this problem to the arch code and it can
rely on things as the page table (I believe ARM CCA have a bit
for that)

Anyway, I think there should be some boundaries in the kernel that
defines that instead of each subsystem having its assumptions,
especially memory encryption/decryption problems that can easily
cause security issues.

Thanks,
Mostafa

> 
> >
> >[1] https://lore.kernel.org/all/20260305170335.963568-1-smostafa@google.com/
> >
> >Thanks,
> >Mostafa
> >
> >
> >> 
> >> Jiri Pirko (2):
> >>   dma-mapping: introduce DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
> >>   dma-buf: heaps: system: add system_cc_decrypted heap for explicitly
> >>     decrypted memory
> >> 
> >>  drivers/dma-buf/heaps/system_heap.c | 103 ++++++++++++++++++++++++++--
> >>  include/linux/dma-mapping.h         |   6 ++
> >>  include/trace/events/dma.h          |   3 +-
> >>  kernel/dma/direct.h                 |  14 +++-
> >>  4 files changed, 117 insertions(+), 9 deletions(-)
> >> 
> >> -- 
> >> 2.51.1
> >> 

