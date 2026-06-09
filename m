Return-Path: <linux-media+bounces-64275-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CULwDaDUJ2o63AIAu9opvQ
	(envelope-from <linux-media+bounces-64275-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 10:53:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 828F665DFF2
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 10:53:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b="Vx/BEscr";
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=spO2gcbj;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b="Vx/BEscr";
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=spO2gcbj;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64275-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64275-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3081E305FB38
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 08:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E07963E833F;
	Tue,  9 Jun 2026 08:46:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105753E3C73
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 08:46:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780994813; cv=none; b=tDd33s5RxPfs1kX9W/GblDKbdYwGXE1xhwZdlqPy6I+d/h+417WtZnLX7282N46Lq2mL24YwdY07+DMuNVQRijWjtRBQ4crGJVckzpWxYnkY1SfrF6EnA7bfOr4HYFdD4FntuWnfrL/FqNgaGcVeJ8ZnrwvtFTDBc2yFd2j/6bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780994813; c=relaxed/simple;
	bh=tlPULvhmDm02D8hVP//ZkWLYQbTCbMQrA7/ANZ+JAsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BiN6TTuYiHJI2sJwAtJt5uWtQ+ePnJI1I8Lxg32SxFnviun/jbdwShpi99xJs7wDiXLDYFU1XU862LsghXay/8fR7TGu18k6hkmnBZ0YzbAtjqkjMCWTDNUrMwEUw3QivNxvk0iDsnb7q+8jP3lCCuUw086CTxMifi9xKW2uonU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Vx/BEscr; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=spO2gcbj; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Vx/BEscr; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=spO2gcbj; arc=none smtp.client-ip=195.135.223.130
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4801C6A8A5;
	Tue,  9 Jun 2026 08:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1780994810; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GSQxH6p+aBDmmgKYN3VNQI6BF8H04zVBQYzVTpTNZQo=;
	b=Vx/BEscri+0r67xy3avOveRmQ30LzU24dPEtk4qjekhhW9jO6kGIOJyQmLwDG7x25ePCR2
	Xlaz8xVatdyRqM5Tfoywojl7q8hfbYvbK/V4xCBXi2oum35WHUs+sUA73IFM2FQGMlMDS9
	CBNOerN+mnmdoXzGGnP0+SurjemtxMQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1780994810;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GSQxH6p+aBDmmgKYN3VNQI6BF8H04zVBQYzVTpTNZQo=;
	b=spO2gcbj47UyJGxrqj93wVAFhcKrlTrh9cZYY+iwZ3P7HvrM5hIZjhXqrvAaHZxWZhA2vd
	J365xzS9oAiV3PAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1780994810; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GSQxH6p+aBDmmgKYN3VNQI6BF8H04zVBQYzVTpTNZQo=;
	b=Vx/BEscri+0r67xy3avOveRmQ30LzU24dPEtk4qjekhhW9jO6kGIOJyQmLwDG7x25ePCR2
	Xlaz8xVatdyRqM5Tfoywojl7q8hfbYvbK/V4xCBXi2oum35WHUs+sUA73IFM2FQGMlMDS9
	CBNOerN+mnmdoXzGGnP0+SurjemtxMQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1780994810;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GSQxH6p+aBDmmgKYN3VNQI6BF8H04zVBQYzVTpTNZQo=;
	b=spO2gcbj47UyJGxrqj93wVAFhcKrlTrh9cZYY+iwZ3P7HvrM5hIZjhXqrvAaHZxWZhA2vd
	J365xzS9oAiV3PAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 373B9779A7;
	Tue,  9 Jun 2026 08:46:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aXV3DfrSJ2oadgAAD6G6ig
	(envelope-from <jack@suse.cz>); Tue, 09 Jun 2026 08:46:50 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id E0D69A0A90; Tue, 09 Jun 2026 10:46:49 +0200 (CEST)
Date: Tue, 9 Jun 2026 10:46:49 +0200
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@infradead.org>, 
	Kees Cook <kees@kernel.org>, Cong Wang <xiyou.wangcong@gmail.com>, 
	Chia-Lin Kao <acelan.kao@canonical.com>, Benjamin LaHaise <bcrl@kvack.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Jens Axboe <axboe@kernel.dk>, linux-fsdevel@vger.kernel.org, 
	linux-aio@kvack.org, linux-mm@kvack.org, kvm@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] libfs: drop redundant SB_I_NOEXEC/SB_I_NODEV in
 init_pseudo() callers
Message-ID: <md6vxgeg4h2cs2p7jfgjy6ybgiysbl7fprulimdcxhhiwsv3le@5zgf6mbprh4w>
References: <20260604025315.245910-1-jhubbard@nvidia.com>
 <20260604025315.245910-3-jhubbard@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604025315.245910-3-jhubbard@nvidia.com>
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jhubbard@nvidia.com,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:hch@infradead.org,m:kees@kernel.org,m:xiyou.wangcong@gmail.com,m:acelan.kao@canonical.com,m:bcrl@kvack.org,m:akpm@linux-foundation.org,m:rppt@kernel.org,m:pbonzini@redhat.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:axboe@kernel.dk,m:linux-fsdevel@vger.kernel.org,m:linux-aio@kvack.org,m:linux-mm@kvack.org,m:kvm@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:xiyouwangcong@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jack@suse.cz,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-64275-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	DMARC_NA(0.00)[suse.cz];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jack@suse.cz,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[zeniv.linux.org.uk,kernel.org,suse.cz,infradead.org,gmail.com,canonical.com,kvack.org,linux-foundation.org,redhat.com,linaro.org,amd.com,kernel.dk,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 828F665DFF2

On Wed 03-06-26 19:53:15, John Hubbard wrote:
> init_pseudo() now sets SB_I_NOEXEC and SB_I_NODEV by default, so the
> per-caller assignments are redundant. Drop them.
> 
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/aio.c               | 1 -
>  fs/anon_inodes.c       | 2 --
>  fs/nsfs.c              | 1 -
>  fs/pidfs.c             | 2 --
>  mm/secretmem.c         | 2 --
>  virt/kvm/guest_memfd.c | 2 --
>  6 files changed, 10 deletions(-)
> 
> diff --git a/fs/aio.c b/fs/aio.c
> index 722476560848..f57fa21a2503 100644
> --- a/fs/aio.c
> +++ b/fs/aio.c
> @@ -318,7 +318,6 @@ static int aio_init_fs_context(struct fs_context *fc)
>  	pfc = init_pseudo(fc, AIO_RING_MAGIC);
>  	if (!pfc)
>  		return -ENOMEM;
> -	fc->s_iflags |= SB_I_NOEXEC;
>  	pfc->ops = &aio_super_operations;
>  	return 0;
>  }
> diff --git a/fs/anon_inodes.c b/fs/anon_inodes.c
> index b8381c7fb636..a7b9b948e33d 100644
> --- a/fs/anon_inodes.c
> +++ b/fs/anon_inodes.c
> @@ -86,8 +86,6 @@ static int anon_inodefs_init_fs_context(struct fs_context *fc)
>  	struct pseudo_fs_context *ctx = init_pseudo(fc, ANON_INODE_FS_MAGIC);
>  	if (!ctx)
>  		return -ENOMEM;
> -	fc->s_iflags |= SB_I_NOEXEC;
> -	fc->s_iflags |= SB_I_NODEV;
>  	ctx->dops = &anon_inodefs_dentry_operations;
>  	return 0;
>  }
> diff --git a/fs/nsfs.c b/fs/nsfs.c
> index 160018c4fb36..c3b6ae76594a 100644
> --- a/fs/nsfs.c
> +++ b/fs/nsfs.c
> @@ -664,7 +664,6 @@ static int nsfs_init_fs_context(struct fs_context *fc)
>  	struct pseudo_fs_context *ctx = init_pseudo(fc, NSFS_MAGIC);
>  	if (!ctx)
>  		return -ENOMEM;
> -	fc->s_iflags |= SB_I_NOEXEC | SB_I_NODEV;
>  	ctx->s_d_flags |= DCACHE_DONTCACHE;
>  	ctx->ops = &nsfs_ops;
>  	ctx->eops = &nsfs_export_operations;
> diff --git a/fs/pidfs.c b/fs/pidfs.c
> index 1cce4f34a051..c363416766f1 100644
> --- a/fs/pidfs.c
> +++ b/fs/pidfs.c
> @@ -1115,8 +1115,6 @@ static int pidfs_init_fs_context(struct fs_context *fc)
>  	if (!ctx)
>  		return -ENOMEM;
>  
> -	fc->s_iflags |= SB_I_NOEXEC;
> -	fc->s_iflags |= SB_I_NODEV;
>  	ctx->s_d_flags |= DCACHE_DONTCACHE;
>  	ctx->ops = &pidfs_sops;
>  	ctx->eops = &pidfs_export_operations;
> diff --git a/mm/secretmem.c b/mm/secretmem.c
> index 5f57ac4720d3..4877c262cb1f 100644
> --- a/mm/secretmem.c
> +++ b/mm/secretmem.c
> @@ -245,8 +245,6 @@ static int secretmem_init_fs_context(struct fs_context *fc)
>  	if (!ctx)
>  		return -ENOMEM;
>  
> -	fc->s_iflags |= SB_I_NOEXEC;
> -	fc->s_iflags |= SB_I_NODEV;
>  	return 0;
>  }
>  
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 69c9d6d546b2..80f201035d77 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -973,8 +973,6 @@ static int kvm_gmem_init_fs_context(struct fs_context *fc)
>  	if (!init_pseudo(fc, GUEST_MEMFD_MAGIC))
>  		return -ENOMEM;
>  
> -	fc->s_iflags |= SB_I_NOEXEC;
> -	fc->s_iflags |= SB_I_NODEV;
>  	ctx = fc->fs_private;
>  	ctx->ops = &kvm_gmem_super_operations;
>  
> -- 
> 2.54.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

