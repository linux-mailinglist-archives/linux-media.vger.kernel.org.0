Return-Path: <linux-media+bounces-44189-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 67882BCEBC6
	for <lists+linux-media@lfdr.de>; Sat, 11 Oct 2025 00:57:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6547E4E6C91
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 22:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C195D279DB6;
	Fri, 10 Oct 2025 22:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="owy6loEA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B44B278771;
	Fri, 10 Oct 2025 22:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760137047; cv=none; b=gF34+TJLhoGGX/KaqeCQKXHZj0RuQstvK8hrhCuWrsfmlQwXVYctCIW2bcYDZn9+kXI+fOwwrcVypUBeTA7d8f/cCZE60N8Yn9pRi7te4bGBfducqe/hIownyASatj4JRav24s57EhMw+2xknSxAG2ronTBICJyZzI7/NOcqdFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760137047; c=relaxed/simple;
	bh=NPCnJm+glac6qNv/XVTi3HpMJ283abXEd2rPLQG0eqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTtSVU6nYZ8/Hd0tLRoTkn99zfRylXiHipMBgncu7mMyFOGdvF72RuHgE8JT1GwYhhO1F7lxaFFuRDiprNMIa9H+YaQ20rp4caH1+p9kKQDpmRRb189tmeYLf0RSr2kP4gbsXxRge9iEg4bUa+izWadcpueqGSd68/6eeuD/Gc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=owy6loEA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CEB0C4CEF1;
	Fri, 10 Oct 2025 22:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760137046;
	bh=NPCnJm+glac6qNv/XVTi3HpMJ283abXEd2rPLQG0eqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=owy6loEAjrNGDq93yL+08XL4RfvnUQNFlJqCljte3VLEzpuDUJFJc8tzQgMHnKfvk
	 8ZXazvKs4NabIA5ZZTF+5MI0aDcE79iPOhEeRkwMt/G237jj7OHI/3IqsB1rp6WlnP
	 jBr5sqWuKBw4cIxfAN6Qz4rN4BCRAU+KR50VYi4nn7p++SuZqStPI8YWeeu4Xlw2Ui
	 pgTH4vhAlDlu1sws4muw36iMJbmjSVFv4TR72LrM96bvMFinHlf65hC8VLm/7x41AP
	 bwKFmm59akzs5PrGkcd3ooo5uFOxSTo1oLreU0SvYWFYyRNvxvTzQ7cepdgUMKcmf9
	 9MB+vx6CvrNAA==
Date: Fri, 10 Oct 2025 15:57:26 -0700
From: Kees Cook <kees@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Christian Brauner <brauner@kernel.org>,
	syzbot+a9391462075ffb9f77c6@syzkaller.appspotmail.com,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] dma-buf: use SB_I_NOEXEC and SB_I_NODEV
Message-ID: <202510101556.5C71F86@keescook>
References: <20251008061027.work.515-kees@kernel.org>
 <aOYBpY7jPx622xcz@infradead.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOYBpY7jPx622xcz@infradead.org>

On Tue, Oct 07, 2025 at 11:16:05PM -0700, Christoph Hellwig wrote:
> On Tue, Oct 07, 2025 at 11:10:32PM -0700, Kees Cook wrote:
> > The dma-buf pseudo-filesystem should never have executable mappings nor
> > device nodes. Set SB_I_NOEXEC and SB_I_NODEV on the superblock to enforce
> > this at the filesystem level, similar to secretmem, commit 98f99394a104
> > ("secretmem: use SB_I_NOEXEC").
> > 
> > Fix the syzbot-reported warning from the exec code to enforce this
> > requirement:
> 
> Can you please just enforce this in init_pseudo?  If a file system
> really wants to support devices or executable it can clear them,
> but a quick grep suggests that none of them should.

I that that's a fine idea, but I defer to Christian -- I think the WARN
was put in place to avoid doing that...

-- 
Kees Cook

