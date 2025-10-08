Return-Path: <linux-media+bounces-43904-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A3244BC3734
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 08:16:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7763D4EB5BE
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 06:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36B702D3EDF;
	Wed,  8 Oct 2025 06:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="2ALShkSr"
X-Original-To: linux-media@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6941F3FE9;
	Wed,  8 Oct 2025 06:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759904168; cv=none; b=op6tJLVYz0FF91aW6jHUSMIIxDjdqDt9xbs33aJZ3p4tL9JgvGKf/58Cb86bmGC4u9BYKLvFeHFsCoG6TWKDdRr/apYiBsfKVYoCJQQladZaSxsnrpe/X5b3BMCPwWARTIYjU99Dk81g+JAktnxFSYmTHUaS5NTriZfoHLdGekQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759904168; c=relaxed/simple;
	bh=YTecKMQWWvUjF4mGvDMpIKY0lXGDXawmIjp5s53HCNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CbjCM+u15hDiBVBU0UaE68ZO4K+ipLRvDgcTtOGzUMtoLqO16R0YXdim8Tta4DD6FGf2Ncj0ubi/bjrSxLqR8pIHiFkJHjB+LKRPFzSES6rmi5kLhKU6QIs0+/Q33K2ME00l/a95JC9N29udyST8YX8f3x0fRfl7HDRMseYfPZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=2ALShkSr; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5ztySVtL1SeMnFuhjjl/l126E9UfzfV0YUw4emGbgII=; b=2ALShkSrweFZY74Wi1L7w95/xq
	dbK+2jXblgpsXP2BcaVNz9PfOyeaiTKmI6u4IGW7uk/4CM27Ol0Op5ee7UwPqHFs7xN7rlCKaHPwM
	cRZ8ctVekRBHYZUY+99s2my4fW7WcsDnzHJJHJ+LnZLg6SzPYVvZoYSGwcTb2uHt7u7lYQvI4Eznr
	S2+FYneDqhZzlTgb+WJgqaFby6TW1jINkjl4QBYWuBbvV1tQZiAgrPuTdW5NU7KIeXzuEd//hbCYc
	7HpfnS1F9/C/InYtCEZbFRyTsL4o77nRRQJ1AfDMplsjWz/3r7jH1cYnS/Kkrr8QKC2wmt0oRdxD4
	bIVXGOgw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6NT3-00000003Gzl-3ZEM;
	Wed, 08 Oct 2025 06:16:05 +0000
Date: Tue, 7 Oct 2025 23:16:05 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Kees Cook <kees@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>,
	syzbot+a9391462075ffb9f77c6@syzkaller.appspotmail.com,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] dma-buf: use SB_I_NOEXEC and SB_I_NODEV
Message-ID: <aOYBpY7jPx622xcz@infradead.org>
References: <20251008061027.work.515-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008061027.work.515-kees@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Tue, Oct 07, 2025 at 11:10:32PM -0700, Kees Cook wrote:
> The dma-buf pseudo-filesystem should never have executable mappings nor
> device nodes. Set SB_I_NOEXEC and SB_I_NODEV on the superblock to enforce
> this at the filesystem level, similar to secretmem, commit 98f99394a104
> ("secretmem: use SB_I_NOEXEC").
> 
> Fix the syzbot-reported warning from the exec code to enforce this
> requirement:

Can you please just enforce this in init_pseudo?  If a file system
really wants to support devices or executable it can clear them,
but a quick grep suggests that none of them should.


