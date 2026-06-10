Return-Path: <linux-media+bounces-64342-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +jRlMOitKGqPIAMAu9opvQ
	(envelope-from <linux-media+bounces-64342-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 02:20:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCF2664F0B
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 02:20:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=zohomail header.b=kZOwsiH2;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64342-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-64342-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0E1CB3024B07
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 00:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83FAB18DF80;
	Wed, 10 Jun 2026 00:20:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D599240D573;
	Wed, 10 Jun 2026 00:20:39 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781050841; cv=pass; b=Em8zvP138YEpjn3G+gtyU7gP256ihRmf4VvOqPhIRrNBdPH6iDH7nrivgklvOTpYDl2V6YoQ5nZci3n6Jt6Q823kOro01v6dXykeybRtZ1ldfwQJRsog9fOy1LfsnglTrA6HPoQMGRt4F+RKenurILtedztAmi6Au6jccQeKVz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781050841; c=relaxed/simple;
	bh=LcYzfnNvpPv4kOrLJLk/DY9+nUZ5MRaWOIev0xE1/To=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kdb9SBgyVAsAMdC4r9TeaqeSFhgA6U055C+J7v+KGBPmnXSvVAyGoIUyRtF60T5soZqV+LyE51Fx7mIa5srK+4yB8j+nIZlwGurFSQBD1AmEKKilx5qgZw/CsSHNdO+oXbsR6wjWqEm2WD14MAqds47UF/Tl0KiC0pvnpffyW94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=kZOwsiH2; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal: i=1; a=rsa-sha256; t=1781050811; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Md6nNVHOEmyf92T+nDS9CJqqPti1DRSk4EGTpu6C0HNPBqi7DA1DYIbBx6XVRwZKGYg+7FAMp+zRe7yCffEmmdzShm8ChVUIErNYfWJ2C0Z5rs+Jr8hsTWIn9J8BQuxRZb4sbMgl4VDNNe+Fp/YF9+TLnLcWHr/2HsETWIA/0Fs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781050811; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=O9fNTHv6wbBG42jHa8mAw6pvJNsDpQ9M5O3qhn0l1Vo=; 
	b=CtLCFoN/HUmgdMdaKxivguNvewtVOqnOf/GU04aTbIVSPmsAiqq9UfL62Sh1qJdTXzHGhlCky8R8LX2pYa39GqhrE6Q5y6NWBjh3JAboYzSpnuOv/I0JcGJ2wxwR6L9BGZsTO/owZFYHVWFWX4701w6nqoN2HlVw+vD+Fu7sY3Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781050811;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=O9fNTHv6wbBG42jHa8mAw6pvJNsDpQ9M5O3qhn0l1Vo=;
	b=kZOwsiH29/dAC81lSN65kYEuoTOcxiFWnRZI3eUfAzUyKksZvENO4jOoeUKfRUoY
	DRrLnkZ+tvZiLYP+qTTiiMl8pibUI+SDHnj/H9Qez+JfTBfn21bbtaEiqZZVW628ZQS
	t+lDFRobsq/ZdrPqaZCGglTpHn7wVk4iLg/THklE=
Received: by mx.zohomail.com with SMTPS id 1781050810087120.3536602556942;
	Tue, 9 Jun 2026 17:20:10 -0700 (PDT)
Date: Tue, 9 Jun 2026 17:20:09 -0700
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	Alexandre Courbot <acourbot@nvidia.com>,
	Gary Guo <gary@garyguo.net>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	driver-core@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org,
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>,
	linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>,
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v19 0/4] Rust bindings for gem shmem
Message-ID: <aiituaFg3i4Qpb-a@um790>
References: <20260608183057.2001376-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608183057.2001376-1-lyude@redhat.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lyude@redhat.com,m:dri-devel@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,m:nouveau@lists.freedesktop.org,m:acourbot@nvidia.com,m:gary@garyguo.net,m:christian.koenig@amd.com,m:driver-core@lists.linux.dev,m:ojeda@kernel.org,m:maarten.lankhorst@linux.intel.com,m:aliceryhl@google.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:sumit.semwal@linaro.org,m:linux-media@vger.kernel.org,m:rafael@kernel.org,m:tzimmermann@suse.de,m:mripard@kernel.org,m:airlied@gmail.com,m:lossin@kernel.org,m:linaro-mm-sig@lists.linaro.org,m:dakr@kernel.org,m:mkchauras@gmail.com,m:lina+kernel@asahilina.net,m:daniel.almeida@collabora.com,m:gregkh@linuxfoundation.org,m:lina@asahilina.net,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[deborah.brouwer@collabora.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	TAGGED_FROM(0.00)[bounces-64342-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,nvidia.com,garyguo.net,amd.com,lists.linux.dev,kernel.org,linux.intel.com,google.com,ffwll.ch,linaro.org,suse.de,gmail.com,lists.linaro.org,asahilina.net,collabora.com,linuxfoundation.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,um790:mid,gitlab.freedesktop.org:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,patchwork.freedesktop.org:url,collabora.com:dkim,collabora.com:email,collabora.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AFCF2664F0B

On Mon, Jun 08, 2026 at 02:29:00PM -0400, Lyude Paul wrote:
> Most of this patch series has already been pushed upstream, this is just
> the second half of the patch series that has not been pushed yet + some
> additional changes which were required to implement changes requested by
> the mailing list. This patch series is originally from Asahi, previously
> posted by Daniel Almeida.
> 
> The previous version of the patch series can be found here:
> 
> 	https://patchwork.freedesktop.org/series/164580/
> 
> Branch with patches applied available here:
> 
> 	https://gitlab.freedesktop.org/lyudess/linux/-/commits/rust/gem-shmem
> 
> This patch series applies on top of drm-rust-next
> 
> Patch-series wide changes since V15:
> * Fix some major rebasing errors I somehow didn't notice :(
> * Drop the dependency on LazyInit, use the trick that Alice suggested
>   instead.
> * Fix dependency ordering so that Tyr can get the vmap stuff first
>   without the other bits.
> Patch-series wide changes since V16:
> * Fix ordering one more time (SetOnce::reset() doesn't need to come
>   before adding vmap functions)
> * Rebase against the latest DeviceContext changes from me that got
>   pushed.
> 
> Lyude Paul (4):
>   rust: drm: gem: shmem: Add DmaResvGuard helper
>   rust: drm: gem: shmem: Add vmap functions
>   rust: faux: Allow retrieving a bound Device
>   rust: drm: gem: Introduce shmem::Object::sg_table()
> 
>  rust/kernel/drm/gem/shmem.rs | 524 ++++++++++++++++++++++++++++++++++-
>  rust/kernel/faux.rs          |  16 +-
>  2 files changed, 524 insertions(+), 16 deletions(-)
> 
> 
> base-commit: fea3a2dd7d3fc1936211ced5f84420e610435730
> -- 
> 2.54.0
> 
Thanks, it's working nicely with Tyr. To make this work with [1] I did
have to make a few changes to the KunitDriver and tests, but that
is a separate issue.

[1] [PATCH v2 0/7] rust: drm: Higher-Ranked Lifetime private data
https://lore.kernel.org/rust-for-linux/20260603011711.2077361-1-dakr@kernel.org/

Tested-by: Deborah Brouwer <deborah.brouwer@collabora.com>


