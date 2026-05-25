Return-Path: <linux-media+bounces-62696-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCN1D1fkE2rhHAcAu9opvQ
	(envelope-from <linux-media+bounces-62696-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 07:55:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C6D5C6154
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 07:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36BAB302A2CA
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 05:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB19535E1B4;
	Mon, 25 May 2026 05:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="xlW8pfbL"
X-Original-To: linux-media@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FF9358388;
	Mon, 25 May 2026 05:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779688518; cv=none; b=HnIDX4t//44it7xsBsabTVZv7EfxZo2QexGOdzB64lz+HnObWFXwhyjQIHsV/cMsUZNQYTToU0ajcI4b4oOdUbL5YqDyuTEScXchHOfh3aDNjZkebRvFiftuUbSbhbLyjTDEmuECGwGWKqrGOrL9Hs2/C9YR+iUsO77ru88gn4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779688518; c=relaxed/simple;
	bh=/zIwOpbitf7WLzXzmB3Euq/uS1lyI9bpSUSP2miWa70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0IcRiGX1n0HDMTzZAQbAEVdEu+xsQoGbL/hwXXSf9STT141EZ8wKQT787y4JaWIjCCTzBRRNr9bHG9UB/iaxLeefgi7qw9EqddL/pLZaspoNzkJ02ZUQ6T/HOT0Ko+c5Nw3aOWAZ0CFSSdq6qSamvjCc/eqNaaQ1ZwksybPgrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=xlW8pfbL; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/zIwOpbitf7WLzXzmB3Euq/uS1lyI9bpSUSP2miWa70=; b=xlW8pfbLdj/TK2bo5zU5BLi1bi
	jXwYk8Y8nVYNhtjUqqjt3d92LokhxVkY/NxR8seyumuHMG7iW8bK/ScSNopbOZj5pRUSnwtr3WsHP
	gf3/rdFOt15PtkKSruX9KWpjTwi6h+ZvvnzJxrTLjfE7IaStcaX7xj/4BXCuYsPpBBUMbnhDKGu54
	KvEpOKXXLA53tq0dssb4vb78JUFKDShhxhp4oQykeU+KAsnH3hlDqrhRK+xS3AutnIROYAdj3BHii
	n0/1TsZzWNZPhBVyfdxUrDxo5Fk1V+e4skjVlx5HZfDmDfIj0mFT/Jp3ga1/CdC8g5jPzF4N9gL2b
	aaPGt9RA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wROHS-0000000GMhh-4BHY;
	Mon, 25 May 2026 05:55:14 +0000
Date: Sun, 24 May 2026 22:55:14 -0700
From: Christoph Hellwig <hch@infradead.org>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Christian Brauner <brauner@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2] dma-buf: set SB_I_NOEXEC and SB_I_NODEV on the pseudo
 filesystem
Message-ID: <ahPkQgCg_52sxkYH@infradead.org>
References: <20260523011117.121390-1-jhubbard@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523011117.121390-1-jhubbard@nvidia.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62696-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[infradead.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@infradead.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,infradead.org:mid,infradead.org:dkim]
X-Rspamd-Queue-Id: D2C6D5C6154
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 06:11:17PM -0700, John Hubbard wrote:
> The dma-buf pseudo filesystem dispenses S_ANON_INODE inodes via
> alloc_anon_inode() but never sets SB_I_NOEXEC on its superblock.
> Since commit 1e7ab6f67824 ("anon_inode: rework assertions") in 6.17,
> path_noexec() warns on exactly that combination, so an mmap() on any
> dma-buf fd trips the warning:

Just as last time this came up, we really should set this higher up.
There isn't really a reason why pseudofses should not set SB_I_NOEXEC
by default.


