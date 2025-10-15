Return-Path: <linux-media+bounces-44503-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 760B6BDC53B
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 05:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8833B4F9A11
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 03:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890AF2877F4;
	Wed, 15 Oct 2025 03:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FbGRZ/rx"
X-Original-To: linux-media@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF99F42A99;
	Wed, 15 Oct 2025 03:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760498496; cv=none; b=o10qhSjK4zf1pyuEpJjxo8uI0EZulGpurLEyYwtPl5tEj8PQIR5IHABkSij7aYovIFUnD4aT8YBgHNYJj999Tcf3GC30SMp6Z+p2BEmJub0pvAsQIqYvjASV9oUkXpvcxpYjQ4q8EaSYkYOF9OP91V4IEZQOZL3CoJ0aZqk876E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760498496; c=relaxed/simple;
	bh=k/Ue+sXzXssQXMFzfkx/V926NFipPkDQoDV24dGGwag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qgw28CV7Ct06RmikxWH4ngAMx4hcM3gAAzmSDJR11Tk+dZyCi/KRuSfRMjWM3vvaZWtR/afWpS7HPK/Art1mfr6WFTJH1UjxIe9DTwihe1MWnfd6vwfl9sUaCGes+9drIGOzFNQOtk+xYtvLQsHOKFLSwOuZ1gSFsBOCGx6opfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FbGRZ/rx; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+vZhghVmnJMheRu4WGt6Jm2AnYVQSqZVx2x8NSyWD+o=; b=FbGRZ/rxcOCURqJcLxsSF/pzLo
	L/v76Zh8y9EcucbcRxZQdiTEwOoRt9atY8AjoeGJovLqc3ZOFKV20A5wK0SYY60r+EKhk9mS2Laj9
	IK/r3Ed693yH/8skGzY3KRygDDWQr55qBEomc9oUWSYVpD772fJuGMjM0vX3TuVog4L9huuLy7t3u
	HYWrPYsdTu2zbRQGeh/qIKgySxuFOf5cHPmVD1MrIiad82QeJOoM0muj/rDGKxmA821nM0ABgA4Yc
	+9D/MgidcOyM5+c9Y3y51X50S26WlC3W73xgXGFsl3Ql9KaRRNlIf4L4Wl+pn2fsQZE822PkVo777
	Iru8YHkw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8s4g-00000006McQ-0QcF;
	Wed, 15 Oct 2025 03:21:14 +0000
Date: Wed, 15 Oct 2025 04:21:13 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Zhaoyang Huang <huangzhaoyang@gmail.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	"zhaoyang.huang" <zhaoyang.huang@unisoc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Vlastimil Babka <vbabka@suse.cz>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, steve.kang@unisoc.com
Subject: Re: [PATCH 2/2] driver: dma-buf: use alloc_pages_bulk_list for
 order-0 allocation
Message-ID: <aO8TKQN6ifOSMRSC@casper.infradead.org>
References: <20251014083230.1181072-1-zhaoyang.huang@unisoc.com>
 <20251014083230.1181072-3-zhaoyang.huang@unisoc.com>
 <87953097-a105-4775-88a5-9b3a676ff139@amd.com>
 <CAGWkznGN7W-txq_G+xpZ6DtH_1DNorYc=CxqUjebo7qfB4Sxsw@mail.gmail.com>
 <ecba7133-699c-4f3e-927c-bad5bd4c36a3@amd.com>
 <20251014171003.57bbfd63@mordecai.tesarici.cz>
 <97da9924-9489-4d30-a858-8ee5c87bc031@amd.com>
 <CAGWkznGnmb=8GgcrfDvY2REHdRZYVXZy=F3thXhK0FaSoiK7tw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGWkznGnmb=8GgcrfDvY2REHdRZYVXZy=F3thXhK0FaSoiK7tw@mail.gmail.com>

On Wed, Oct 15, 2025 at 09:12:07AM +0800, Zhaoyang Huang wrote:
> > Could be that we need to make this behavior conditional, but somebody would need to come up with some really good arguments to justify the complexity.
> ok, should we use CONFIG_DMA_BUF_BULK_ALLOCATION or a variable
> controlled by sysfs interface?

No.  Explain what you're trying to solve, because you haven't yet.

