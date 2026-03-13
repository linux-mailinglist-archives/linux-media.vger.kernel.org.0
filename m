Return-Path: <linux-media+bounces-55771-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGo1C2NmtGm4nQAAu9opvQ
	(envelope-from <linux-media+bounces-55771-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 20:32:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB5A2894FE
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 20:32:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 54C923073DBD
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 19:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA2C3DDDD0;
	Fri, 13 Mar 2026 19:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="LOBh1++9"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B3C1B4244;
	Fri, 13 Mar 2026 19:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773430360; cv=pass; b=oRyVKb8MC5uHHW3tGwNvX6ebCPZMjL22vMsfSYWVSX6MVQqV1GMQUtkOd7PmsYwKjagTOB/T89ktQwHYxrA9V4QTzMwMpScpN84SGORf48Jv+ZyzPyYMxEF6spgxwStjsbkFD0bDLsAYHTiD3cAWSaiQ3syRGRCVkrLJolbcRd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773430360; c=relaxed/simple;
	bh=5FN1rwSPrQ1u2vQsZxcMT3brE4P3Sjnh+YmO6vWXWdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AIRJHtUCT8p7Vk+Ngv8gXRx0iPV8uZvl44kORy6jJTx1t8nIcBDhdmjsQC30b1Vq9/yqjgU5xQSi05g+o/WokZYcW2nlFZPdyfTOazKMoKt2LTh3KX9cGM4x4pgyBm5uHia7Pr0JBIMUvptsYKAnyXyIEk9BQ/BziIXlJ1+nECY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=LOBh1++9; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1773430314; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dCtUpA72DgbuIKL9O7k3iED2EbGaiPwO9BxA6LdOfoB/F97l94vVIP0Id7M+943c29i9x5tMSjBTYiMlZY3tJXMrh39avPYcC6lBxbwKcSjfpRhNM/tHuHyeTFl7JdxVhU4Niz0NdigkWg2GKklugebiRHyDSGEv2B962Trl1IA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773430314; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=j8NYgTjqm5J8YGPNrQsUQ8qlvCL3SU/ajcRLywCawTY=; 
	b=mF7bg6oiim1URAFIUb6sIoHVXdrQ1AABGBm7LtkZVqne5KMq8E3vs49jB2vHYxJQOdelqVQfAqOxScOfgMbYZ4wnrGnN2ITQ48/efPdpevgjXIECf+9dLJA8lNrZxmv+MEjw4znCEo2lAxySf1VMWN6+SIOQUnbIhfdZSx46b6A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773430314;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=j8NYgTjqm5J8YGPNrQsUQ8qlvCL3SU/ajcRLywCawTY=;
	b=LOBh1++932WGWkRuCEzr5sH0ch8ZTY8I10e8moTY16JCJ7VRSV5oSTmJXiQqpree
	FOuxZ4IjYelwsAI0I+c3G8VuqC0QshLGRwqBUG2U4inOSqDIyGxZI9T1k0x2PcRNZjW
	JroBwAFRsvXcGLxRTgKaPkjB7AeG1G5PYn+E6UZk=
Received: by mx.zohomail.com with SMTPS id 1773430313153333.71971598965956;
	Fri, 13 Mar 2026 12:31:53 -0700 (PDT)
Date: Fri, 13 Mar 2026 12:31:52 -0700
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org, Gary Guo <gary@garyguo.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	christian.koenig@amd.com, Asahi Lina <lina@asahilina.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Simona Vetter <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>,
	Boqun Feng <boqun@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Krishna Ketan Rai <prafulrai522@gmail.com>,
	linux-media@vger.kernel.org,
	Shankari Anand <shankari.ak0208@gmail.com>,
	David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linaro-mm-sig@lists.linaro.org,
	Asahi Lina <lina+kernel@asahilina.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/7] Rust bindings for gem shmem + iosys_map
Message-ID: <abRmKGUFas8rC_w6@um790>
References: <20260311195246.2439593-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311195246.2439593-1-lyude@redhat.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55771-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,garyguo.net,collabora.com,vger.kernel.org,google.com,gmail.com,oracle.com,amd.com,asahilina.net,kernel.org,ffwll.ch,linaro.org,lists.linaro.org,linuxfoundation.org];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:email,patchwork.freedesktop.org:url]
X-Rspamd-Queue-Id: 9CB5A2894FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 03:52:39PM -0400, Lyude Paul wrote:
> This is the next version of the shmem backed GEM objects series
> originally from Asahi, previously posted by Daniel Almeida.
> 
> One of the major changes in this patch series is a much better interface
> around vmaps, which we achieve by introducing a new set of rust bindings
> for iosys_map.
> 
> The previous version of the patch series can be found here:
> 
> https://patchwork.freedesktop.org/series/156093/
> 
> This patch series may be applied on top of the
> driver-core/driver-core-testing branch:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git/log/?h=driver-core-testing

Hi Lyude,
I rebased the tyr firmware boot series on v8 of this series and it
works without issue. Thanks for this!

Tested-by: Deborah Brouwer <deborah.brouwer@collabora.com>

> 
> Changelogs are per-patch
> 
> Asahi Lina (2):
>   rust: helpers: Add bindings/wrappers for dma_resv_lock
>   rust: drm: gem: shmem: Add DRM shmem helper abstraction
> 
> Lyude Paul (5):
>   rust: drm: Add gem::impl_aref_for_gem_obj!
>   rust: drm: gem: Add raw_dma_resv() function
>   rust: gem: Introduce DriverObject::Args
>   rust: drm: gem: Introduce shmem::SGTable
>   rust: drm/gem: Add vmap functions to shmem bindings
> 
>  drivers/gpu/drm/nova/gem.rs     |   5 +-
>  drivers/gpu/drm/tyr/gem.rs      |   3 +-
>  rust/bindings/bindings_helper.h |   3 +
>  rust/helpers/dma-resv.c         |  13 +
>  rust/helpers/drm.c              |  56 +++-
>  rust/helpers/helpers.c          |   1 +
>  rust/kernel/drm/gem/mod.rs      |  79 +++--
>  rust/kernel/drm/gem/shmem.rs    | 529 ++++++++++++++++++++++++++++++++
>  8 files changed, 667 insertions(+), 22 deletions(-)
>  create mode 100644 rust/helpers/dma-resv.c
>  create mode 100644 rust/kernel/drm/gem/shmem.rs
> 
> -- 
> 2.53.0
> 

