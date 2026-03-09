Return-Path: <linux-media+bounces-54970-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BvTIM1ztrmnvKQIAu9opvQ
	(envelope-from <linux-media+bounces-54970-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 16:55:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C1E23C2ED
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 16:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C086530BC7BB
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 15:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9328F3D9050;
	Mon,  9 Mar 2026 15:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="mMdf5FM5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC86E3D904F
	for <linux-media@vger.kernel.org>; Mon,  9 Mar 2026 15:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773071419; cv=none; b=DanQ6aJMD2Zhbjzfab0wmUDbu8CHo8h5BQoT1K/6K5eR7Euts4b9VKXHksp6nUwbdLzXW1ZpBMiwKcco1LU8feIZFa+zAPGpNnnEeQ6xmrhNw7nDRJM9GTVTwpDHmBX5oIwTqEeJ3g5wAjLpDgDQ4XaAY7L83bwdf+S5DanrfQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773071419; c=relaxed/simple;
	bh=vz7GtLHU5cL+Tn669J3wF1mbDCNVBgpwpocy1RdYQi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YEtuIkKc/rQWEem8fnfpAJCCA95uvp3IfjM8F6uHMq2vIxniX1WKkCybEZIPzzDId4vgFHWsaWluggsWX577IGjkZKIUd6AMOQUla1WVXW/kagqXMGY16ZfM9/lmYn32GJQcvEYDrrGg/G49M7HTnq97FKupmORy2RQtl+IOFTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=mMdf5FM5; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-509064418a8so24605541cf.1
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 08:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1773071417; x=1773676217; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O45tfflm9Orr1MA6lJ9Hem754qbRzwLB13TT5ehymNk=;
        b=mMdf5FM54q9dupeLIE2YV+5KwqJiz7iexapZ4a98G4aUFFINRPYe4sy5j02Wb9xK5R
         oLtaT2+Cp6NiGReEbzOgEeijagWaRyyXSJtwVgPWKOSHAOC+Pw25FipzPpQZJ/2fJj9+
         5LnXW9pTw7sHVFCkatatoBsVkk/4NWuXP0yfGZPNAPAD4ye0vEgVFrNRhcYNP/TvhgAG
         pJzIqFDbbxYI8rk2TIlhvUCpoUlunK+POIJ7nJqOX3Rmc8E3kbUHZJxUIuscrjlez2q5
         oUUxe6UYblZXrxhqGMrxPbUfd6lCiyJti3+FGIoBzBMIkllr0mytHoOEB5S2Ow1sy4bN
         ir7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773071417; x=1773676217;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O45tfflm9Orr1MA6lJ9Hem754qbRzwLB13TT5ehymNk=;
        b=kboRL3KHzyWZtGO/9yb4RpYXz2E488AJrJgpojx3+lrvKhy6VR3FFqklpR8PXcXZ0a
         o8QVFbTzhA8CPBPgC9SrXf3N1vB96S4iFwVjb3kxDDytaUvRUnFCyiNEv27NWRELM9O2
         8j2JNeeZ3ejWUVHz8i7waZquIe5bt1gPq/k0UvHzfGFHrZzrswIQroBVVZp06eNSrv1v
         zM3KgfDpjcYpllSGYu2np3PqcY0dA8xaU4j+vYhUESW5Txwq26GsbjAOP5ffiWVHPYO4
         V5BzIViE2uBHcLRYmCzTRI/E2jDtR6JEPiZpfui2Jsi9e2QuJ7uuzJ5SJ1virpjDlZWb
         RlHw==
X-Forwarded-Encrypted: i=1; AJvYcCXAC3ANPOBs/oICS+43ENu1auF3foUkbfNASF0uO3LapSV+FCTX+8Xk/BEDW2XvGB/f/OupNsY1Cg03Jg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv1PSGRroTmLHll6WcNxUQI5uWsOs6CQNajqbDs0lNapDZivUu
	RmMJNDtsDfakvhIe0jwTRXEd2cGw3hyFVw4G1+XsYYaqjk5deRqlqC4gZLlxG4Eug1k=
X-Gm-Gg: ATEYQzzsY4tqRQpQ8tSTdNFAh4NMl6IVTZDWo9lQDb50cCeWUxqKzq7hLxOWWdCCM+J
	5oA/OphXJ4oky56jsu7+4ncc56J6tam6LBygJZXuaEQrLFHrKHiWS416BPMR34yoLB9RD/HO5vp
	7UVx9L6VdmBYJrEOOc6/SOVdxY2FeJ15lmEC3ie++4zVEVkb/JOcuNIKjAjQw2knsqSFHak5jkM
	l/cwlHXKXeGME40Ho3irR9s+5M5aD1h7ZLoCfsmDeBmeuqGoVtIh6kzxBatuWUYBPhvmMe7Rcs7
	CXxjUpFXOdXfNq/TeK70Tkj5o7AcfgP04STvBFT9fn+e9pdWILmanw8F+dWjvgNjdFZ4Ak2vf1z
	e/jol8m3W4kDJkzRDrc1ctKvYlA8nhBV70n2+7VWONhS9/q437Qhy4m7EhO4ppzB4kxHMl9IcKg
	3MISOLgtTSeWGEPS8Sr7Zb3ZUYFulIGMCRr/ZykwmpLPYJVCbcXa2rwm/A1PIWFUQOtOw4L4D8D
	roqsBRh
X-Received: by 2002:a05:622a:30a:b0:503:4251:6597 with SMTP id d75a77b69052e-508f46f8abdmr155244531cf.29.1773071416552;
        Mon, 09 Mar 2026 08:50:16 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a57a4ec29sm837376d6.19.2026.03.09.08.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 08:50:15 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vzcs3-0000000GsMM-18A4;
	Mon, 09 Mar 2026 12:50:15 -0300
Date: Mon, 9 Mar 2026 12:50:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peter Gonda <pgonda@google.com>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	jstultz@google.com, tjmercier@google.com, christian.koenig@amd.com,
	m.szyprowski@samsung.com, robin.murphy@arm.com, leon@kernel.org,
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 2/2] dma-buf: heaps: system: add
 system_cc_decrypted heap for explicitly decrypted memory
Message-ID: <20260309155015.GP1687929@ziepe.ca>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <20260305123641.164164-3-jiri@resnulli.us>
 <CAMkAt6o_yZ5T-3TRwymjYQZEq-Q_z=DAA3vc61h81X9sQr_CXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMkAt6o_yZ5T-3TRwymjYQZEq-Q_z=DAA3vc61h81X9sQr_CXA@mail.gmail.com>
X-Rspamd-Queue-Id: 33C1E23C2ED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54970-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.944];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[resnulli.us:email,nvidia.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ziepe.ca:dkim,ziepe.ca:mid]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 09:39:44AM -0600, Peter Gonda wrote:
> Great feature to have thanks Jiri! A couple naive questions.
> 
> On Thu, Mar 5, 2026 at 5:38 AM Jiri Pirko <jiri@resnulli.us> wrote:
> >
> > From: Jiri Pirko <jiri@nvidia.com>
> >
> > Add a new "system_cc_decrypted" dma-buf heap to allow userspace to
> > allocate decrypted (shared) memory for confidential computing (CoCo)
> > VMs.
> >
> > On CoCo VMs, guest memory is encrypted by default. The hardware uses an
> > encryption bit in page table entries (C-bit on AMD SEV, "shared" bit on
> > Intel TDX) to control whether a given memory access is encrypted or
> > decrypted. The kernel's direct map is set up with encryption enabled,
> > so pages returned by alloc_pages() are encrypted in the direct map
> > by default. To make this memory usable for devices that do not support
> > DMA to encrypted memory (no TDISP support), it has to be explicitly
> > decrypted. A couple of things are needed to properly handle
> > decrypted memory for the dma-buf use case:
> >
> > - set_memory_decrypted() on the direct map after allocation:
> >   Besides clearing the encryption bit in the direct map PTEs, this
> >   also notifies the hypervisor about the page state change. On free,
> >   the inverse set_memory_encrypted() must be called before returning
> >   pages to the allocator. If re-encryption fails, pages
> >   are intentionally leaked to prevent decrypted memory from being
> >   reused as private.
> >
> > - pgprot_decrypted() for userspace and kernel virtual mappings:
> >   Any new mapping of the decrypted pages, be it to userspace via
> >   mmap or to kernel vmalloc space via vmap, creates PTEs independent
> >   of the direct map. These must also have the encryption bit cleared,
> >   otherwise accesses through them would see encrypted (garbage) data.
> 
> So this only works on new mappings? What if there are existing
> mappings to the memory that will be converted to shared?

The set_memory_decrypted() is called during system_heap_allocate(), it
is not possible to change dynamically between encrypted/decrypted.

Once the heap is created every PTE is always created with the correct
pgprot.

Jason

