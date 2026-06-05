Return-Path: <linux-media+bounces-63863-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c5k3HjRxImpqXQEAu9opvQ
	(envelope-from <linux-media+bounces-63863-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 08:48:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EB0645A66
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 08:48:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b="V6UtR/P7";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63863-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63863-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C8B4302736E
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 06:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E34AC413259;
	Fri,  5 Jun 2026 06:47:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA4B3FF89F;
	Fri,  5 Jun 2026 06:47:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780642053; cv=none; b=NEdSurJHbhtJgbX7gzu0A97rEmK6La8LtNXAXqj3+xjE1A9OUOuj+QVes0D3VkvBO1+p56SoJ2O5LEui4yyXlE3gV/7bqTxXI+EkMY4xEqvrrxZX1j4siyUczqDkGhg7Pde+ny8EGXotWuMiaFvAhG5BcHDNcy0M4L5aNHBPYUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780642053; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZPgzKlpN0V7bh63oGN40cRLMN5IoPXRF0j8UFt0hN49uwT/i9Tp3bvNBSMUC9wBGitiW7gbWxOr8xbdxAWMYM8O24EU1HDPX1mwC8MlYgGwdbPDFDCDUczkjmLXcp6CbxCeo1xar+65T5Dx8tXyrVK8sX5C9RR5u2m8GGfmyRHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=V6UtR/P7; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=V6UtR/P7ao5H6NXHVW67cQ+kQR
	lzogiyQNE4VPvZ3bTAeikfaMj4RD7ECJzXh1VHZ/d/zWZ6LzDymNBAMi3Qw0m5Cd8BbkyILMHBAn3
	UY8Gkr3YSvvtZGiPgbIbRhQrJAk2F+l2wwtNa75qw+HjWMnEKsmMVitmSPKmrlFL/j/t3v9zSIpb1
	8pefOfRSYGKIxzMQK2rZT0QzSk5tZfl4tEE2qDojYf2R/nOnlI0yQRciQeTA+1iCX2OPgBcXXkZWd
	tcuvSmdOYE0vBOySM1e3DyuGrhhhBd1Nc/dMbGkJr6ODF6YX+oYk1bb4+mIFP/ubpg2KQyDntNvEC
	b1rHCVig==;
Received: from hch by bombadil.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOKr-00000000BMb-3bgU;
	Fri, 05 Jun 2026 06:47:17 +0000
Date: Thu, 4 Jun 2026 23:47:17 -0700
From: Christoph Hellwig <hch@infradead.org>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Christoph Hellwig <hch@infradead.org>, Kees Cook <kees@kernel.org>,
	Cong Wang <xiyou.wangcong@gmail.com>,
	Chia-Lin Kao <acelan.kao@canonical.com>,
	Benjamin LaHaise <bcrl@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Jens Axboe <axboe@kernel.dk>, linux-fsdevel@vger.kernel.org,
	linux-aio@kvack.org, linux-mm@kvack.org, kvm@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, LKML <linux-kernel@vger.kernel.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 1/2] libfs: set SB_I_NOEXEC and SB_I_NODEV by default
 in init_pseudo()
Message-ID: <aiJw9ZTjOQzwHn-t@infradead.org>
References: <20260604025315.245910-1-jhubbard@nvidia.com>
 <20260604025315.245910-2-jhubbard@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604025315.245910-2-jhubbard@nvidia.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63863-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[hch@infradead.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_RECIPIENTS(0.00)[m:jhubbard@nvidia.com,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:hch@infradead.org,m:kees@kernel.org,m:xiyou.wangcong@gmail.com,m:acelan.kao@canonical.com,m:bcrl@kvack.org,m:akpm@linux-foundation.org,m:rppt@kernel.org,m:pbonzini@redhat.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:axboe@kernel.dk,m:linux-fsdevel@vger.kernel.org,m:linux-aio@kvack.org,m:linux-mm@kvack.org,m:kvm@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:xiyouwangcong@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[zeniv.linux.org.uk,kernel.org,suse.cz,infradead.org,gmail.com,canonical.com,kvack.org,linux-foundation.org,redhat.com,linaro.org,amd.com,kernel.dk,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@infradead.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,lst.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,infradead.org:mid,infradead.org:from_mime,infradead.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 07EB0645A66

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>


