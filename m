Return-Path: <linux-media+bounces-57165-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LXhKSFcxWkk9gQAu9opvQ
	(envelope-from <linux-media+bounces-57165-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 17:17:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B043383A5
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 17:17:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B65793006160
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 16:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F88840627C;
	Thu, 26 Mar 2026 16:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="KqQaRUgP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Vr6S/+y2"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0374401A36;
	Thu, 26 Mar 2026 16:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774541456; cv=none; b=s+HcnIng0r5l3q8av+HIT5ZEAQuOvvFrcSsP2Cy4wIMptURJ/sd+sKgALebeMSBmFuv8/7pE3mY3ad8YJ3yg/D7HTlAVro7IJ7xTbBV8RxHhWjl4u6OFRw9iMSfpYmFahhXDiSPkJi52UrqQtKg/9+CNXlSGadQ5fKl0Xo3NrIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774541456; c=relaxed/simple;
	bh=+cLmuiXNvomvFe5yE9bsxDTQC+LWbkMql3PB7pRrrJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ax3/RnoUiadLF/niDWmI2gu0zUpkYbxbFFgxoYZvAwYssiqCHZTGcRj5XuZVxUreiEuvvjkpwwOKrSnt5OPZfeg5xMf9nIqlDIaekRi3+/NJKb/175tCH8/koZeG6ux5SLG/N1gV5syCZvYnD6EtKEc15VI++m2QCyDjfbPU+SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=KqQaRUgP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Vr6S/+y2; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 229A51D00244;
	Thu, 26 Mar 2026 12:10:53 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 26 Mar 2026 12:10:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1774541452; x=1774627852; bh=mqFX0ystC8
	G5bMrUA5MPL3IZ+yUM/PuDxgn6w4DVzlw=; b=KqQaRUgPfTBr9XD3tkJsncTvcp
	HGOvGevyNLULt4Qw/8YnO4TB9KMxyIo1vDlsDkM9HNHdtj9XZwp2Mjm7mSBcKuKX
	h9bTtphz/2JhQROIWX8838iqNy0mswSx4rWMnRlXYbCKiSDf6Hz2kETu1KVLEfN/
	SvAiRy+gZPr0JQ0APGQaW0bzP/HgY17rsgdie/NEILDM6nGKsKtAll+woHSGKvQ9
	ZwPBus3gy2wLvRQgbucjk/0Rj9mtCDzVbv39CzL2bYny3bRT+csox54JNlEPz3h+
	jW4/GNoVjngIIoQsLfvXq1TH+Sh2UhHufARSCY5IHX0EFWyR/cdu6DAd8gVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774541452; x=1774627852; bh=mqFX0ystC8G5bMrUA5MPL3IZ+yUM/PuDxgn
	6w4DVzlw=; b=Vr6S/+y2nAS3lWxO4UPHlHLbjZMDaQDpyO84eIN0c5mha55M+MN
	hzbQeC7Knf17gm4diCyYS6d7VJdwuHud0YQE0W4TjoHh40S7YPfblk60pcocNp2o
	YL02ZRqKJsUC+x6J6my0pHjhH7cB2Pj/wFizK08X4rlvJM1JxzU/vGXHSXsszWrA
	XguZgEV6UZSC5MjelC79sgWnrWGUBs5Ww1eaHlQBvR0aopv1m7pgPNT9zB6kUnoU
	oKk95WGCOZPeni9aX/14Xx2765TwFIvxGTxo+p3k42Hx7k7xnL0LIsxENOtJ4xAt
	4kfANd0Lr+gOHL3/c/OF0edF/c6jyB9HSpA==
X-ME-Sender: <xms:jFrFaaeDwUi0xsJTlNox3RFX12oa04zZ7EkHP6rg7YYIloFrhaOt9w>
    <xme:jFrFadYhUlbE2Sv4y6w9HFl5pFQ9oMB0H6DK6cuSS4brF2t8fMANJ6J5RsxMqhJa1
    x58imbJ6a8rmB2qahJmyJQHDHrOqCtAMbU-hCZpND3FrO1ty6maUcb8>
X-ME-Received: <xmr:jFrFaVqNVE6HLWpu8PL_B_Wa5tLoDn8VubBJoli9LPNLCZRFG1iBwXc7lgn2v0y1YLz6Ww8KGNrcqUPjSpt64xsK3oqJHjdZckQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdejkeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpeegje
    duudfhleekveeghfevjeegtefgtdegfeekheduiedtleehgeeludejgfegieenucffohhm
    rghinhepfhhrvggvuggvshhkthhophdrohhrghdprhhushhtqdhfohhrqdhlihhnuhigrd
    gtohhmpdhmshhgihgurdhlihhnkhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohepvd
    ekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheplhihuhguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtoheprg
    hlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepnhhouhhvvggruheslhhishhtshdrfhhrvggvug
    gvshhkthhophdrohhrghdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdp
    rhgtphhtthhopegurghnihgvlhdrrghlmhgvihgurgestgholhhlrggsohhrrgdrtghomh
    dprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehmmhgruhhrvghrsehgohhoghhlvgdrtghomh
X-ME-Proxy: <xmx:jFrFaY1eGumb2lP-gwk4rMljcd1HrGMa5zu-LPOdbLOZTBQlCMG-rg>
    <xmx:jFrFaSra40WvK9wNoCUgNJSUuqdo_0b35aGx_LU_fljalYncxEVanw>
    <xmx:jFrFaaQjCX9DsR0XbhHIyFQcjeoUMao6md7MaNFcB9dDm_AGhVNURQ>
    <xmx:jFrFaarsfozIh98oVWs1QdcONAaGdvyDQce1808gf8WuNVG97FOoxA>
    <xmx:jFrFaRX0jlBXDO9RbIEeXvX9PjNX0YBrLIN1johPts8zF8Ewg4_85f56>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Mar 2026 12:10:51 -0400 (EDT)
Date: Thu, 26 Mar 2026 17:10:49 +0100
From: Janne Grunau <j@jannau.net>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, Alice Ryhl <aliceryhl@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, nouveau@lists.freedesktop.org,
	Gary Guo <gary@garyguo.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,	christian.koenig@amd.com,
 Asahi Lina <lina@asahilina.net>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Simona Vetter <simona@ffwll.ch>, Boqun Feng <boqun@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Krishna Ketan Rai <prafulrai522@gmail.com>,	linux-media@vger.kernel.org,
	Shankari Anand <shankari.ak0208@gmail.com>,
	David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,	linaro-mm-sig@lists.linaro.org,
	Asahi Lina <lina+kernel@asahilina.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,	kernel@vger.kernel.org,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: Re: (subset) [PATCH v9 0/7] Rust bindings for gem shmem
Message-ID: <20260326161049.GA10417@robin.jannau.net>
References: <20260316211646.650074-1-lyude@redhat.com>
 <DHCBEGGPWSVK.30MV8652PV4PY@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DHCBEGGPWSVK.30MV8652PV4PY@kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[jannau.net:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57165-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[redhat.com,google.com,kernel.org,lists.freedesktop.org,garyguo.net,collabora.com,vger.kernel.org,gmail.com,oracle.com,amd.com,asahilina.net,ffwll.ch,linaro.org,lists.linaro.org,linuxfoundation.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[jannau.net];
	RCPT_COUNT_TWELVE(0.00)[28];
	DKIM_TRACE(0.00)[jannau.net:+,messagingengine.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[172.232.135.74:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[j@jannau.net,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,rust-for-linux.com:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,asahilina.net:email,jananu.net:email,pages.freedesktop.org:url,robin.jannau.net:mid,messagingengine.com:dkim]
X-Rspamd-Queue-Id: 56B043383A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 02:15:28AM +0100, Danilo Krummrich wrote:
> On Mon Mar 16, 2026 at 10:16 PM CET, Lyude Paul wrote:
> > Lyude Paul (5):
> >   rust: drm: Add gem::impl_aref_for_gem_obj!
> >   rust: gem: Introduce DriverObject::Args
> 
> Applied to drm-rust-next, thanks!
> 
> > Asahi Lina (2):
> >   rust: drm: gem: shmem: Add DRM shmem helper abstraction
> 
> I was about to pick this one up as well, but did run into quite some build
> errors and warnings. I fixed them all up, but I consider this too excessive to
> actually apply the patch. This is the changelog I came up with:
> 
>     [ * DRM_GEM_SHMEM_HELPER is a tristate; when a module driver selects it,
>         it becomes =m. The Rust kernel crate and its C helpers are always
>         built into vmlinux and can't reference symbols from a module,
>         causing link errors.
> 
>         Thus, add RUST_DRM_GEM_SHMEM_HELPER bool Kconfig that selects
>         DRM_GEM_SHMEM_HELPER, forcing it built-in when Rust drivers need it;
>         use cfg(CONFIG_RUST_DRM_GEM_SHMEM_HELPER) for the shmem module.
> 
>       * Add cfg_attr(not(CONFIG_RUST_DRM_GEM_SHMEM_HELPER), expect(unused))
>         on pub(crate) use impl_aref_for_gem_obj and BaseObjectPrivate, so
>         that unused warnings are suppressed when shmem is not enabled.
> 
>       * Enable const_refs_to_static (stabilized in 1.83) to prevent build
>         errors with older compilers.
> 
>       * Use &raw const for bindings::drm_gem_shmem_vm_ops and add
>         #[allow(unused_unsafe, reason = "Safe since Rust 1.82.0")].
> 
>       * Fix incorrect C Header path and minor spelling and formatting
>         issues.
> 
>       * Drop shmem::Object::sg_table() as the current implementation is
>         unsound.
> 
>         - Danilo ]
> 
> Please always consider [1] and [2].
> 
> [1] https://drm.pages.freedesktop.org/maintainer-tools/committer/committer-drm-rust.html#submit-checklist
> [2] https://rust-for-linux.com/contributing#submit-checklist-addendum
> 
> (@Deborah: I assume you were testing this with Tyr built-in?)
> 
> @Lyude, Alice, Miguel: Please have a look at what I came up with below.

Looks fine, asahi had the bool CONFIG_RUST_DRM_GEM_SHMEM_HELPER already
in the asahi Kconfig so I never noticed that's missing. Same for configs
which do not excercise gem shmem.

> commit 2dc69d77944dbd1494d2b10a4b134b7fead1c8e7
> Author: Asahi Lina <lina+kernel@asahilina.net>
> Date:   Mon Mar 16 17:16:13 2026 -0400
> 
>     rust: drm: gem: shmem: Add DRM shmem helper abstraction
> 
>     The DRM shmem helper includes common code useful for drivers which
>     allocate GEM objects as anonymous shmem. Add a Rust abstraction for
>     this. Drivers can choose the raw GEM implementation or the shmem layer,
>     depending on their needs.
> 
>     Signed-off-by: Asahi Lina <lina@asahilina.net>
>     Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
>     Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
>     Signed-off-by: Lyude Paul <lyude@redhat.com>
>     Tested-by: Deborah Brouwer <deborah.brouwer@collabora.com>
>     Link: https://patch.msgid.link/20260316211646.650074-6-lyude@redhat.com
>     [ * DRM_GEM_SHMEM_HELPER is a tristate; when a module driver selects it,
>         it becomes =m. The Rust kernel crate and its C helpers are always
>         built into vmlinux and can't reference symbols from a module,
>         causing link errors.
> 
>         Thus, add RUST_DRM_GEM_SHMEM_HELPER bool Kconfig that selects
>         DRM_GEM_SHMEM_HELPER, forcing it built-in when Rust drivers need it;
>         use cfg(CONFIG_RUST_DRM_GEM_SHMEM_HELPER) for the shmem module.
> 
>       * Add cfg_attr(not(CONFIG_RUST_DRM_GEM_SHMEM_HELPER), expect(unused))
>         on pub(crate) use impl_aref_for_gem_obj and BaseObjectPrivate, so
>         that unused warnings are suppressed when shmem is not enabled.
> 
>       * Enable const_refs_to_static (stabilized in 1.83) to prevent build
>         errors with older compilers.
> 
>       * Use &raw const for bindings::drm_gem_shmem_vm_ops and add
>         #[allow(unused_unsafe, reason = "Safe since Rust 1.82.0")].
> 
>       * Fix incorrect C Header path and minor spelling and formatting
>         issues.
> 
>       * Drop shmem::Object::sg_table() as the current implementation is
>         unsound.
> 
>         - Danilo ]
>     Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Janne Grunau <j@jananu.net>

Janne

