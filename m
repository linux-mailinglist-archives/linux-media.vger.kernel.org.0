Return-Path: <linux-media+bounces-35090-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33695ADCF8C
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 16:23:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EB4C189703B
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 14:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9350D2ECD13;
	Tue, 17 Jun 2025 14:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F2Fg5CnB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8B22EF67F;
	Tue, 17 Jun 2025 14:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750169446; cv=none; b=REs6GUu7kTdk/R4Y+HtSJtfI376S8/qA7MCFtcFRmt+aL5YtuMSf1/Xo8v8Rjqh8sP4c3SQA1+X6XWUE2d7LPjAGSe0zbyqXjitrYprAxPmVtR3OGRPyy1CBK+B3bp6rpKBxFnU7mpxna4OPVj1cAO/6ZaKloyKoJYoIKVUgWLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750169446; c=relaxed/simple;
	bh=h/mgp9A4Cdb1y4wnoba8PjQx1Zhxgyk1hRev/3ZeAuY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ggKXDO2Vc5wZVUhsB8WhVjubKuEzw/yTjAaMqnDdrQ5pxqs/U3ixhMG9EeOYTMrEi76pamqbDg86WvXcWC2wfuH+19VfAt7V03R03nV1j+jJQKI4n5cS8RO1dIeBvNFntSczxOhhEt0oYQW3bFH1fqH2UJGE13CvzeyAC8+37hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F2Fg5CnB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B66C4CEE3;
	Tue, 17 Jun 2025 14:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750169445;
	bh=h/mgp9A4Cdb1y4wnoba8PjQx1Zhxgyk1hRev/3ZeAuY=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=F2Fg5CnBoiadAoDPsCPoZhQwSCPkuJLn/e1uVKTCMnfOv21b5ug8fDAC6GNEKcY3B
	 qUSBV/V/7egoCEWOlKrkBjN6+POhJtDz6wIDFqDO6HVlp2ANX3FOQe37JiX2x2CUrD
	 R0jZ043diAKoznqXl4DP2QfD/wmJOaoWz78DXIqGZp9EQksu2YEZ3pN/UvdXkBWlco
	 YExvEN261vgqBgM9qXR2f2VT47TzalIWFUIC15yg4DnoNhFtsrlAoZNsZdxjuUxe0K
	 eSotaVgVkNkszp4mt4D22HuFa0+CYEFC4XpxvEizzhYhjlvSBeA8NnWkTmFfzrn+x7
	 VMpdpXSqvbk4Q==
Date: Tue, 17 Jun 2025 16:10:40 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Philipp Stanner <phasta@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2] drm/sched: Clarify scenarios for separate workqueues
Message-ID: <aFF3YIAFkgsAKvQV@pollux>
References: <20250612144953.111829-2-phasta@kernel.org>
 <aFFy5aG1eOeMU44S@phenom.ffwll.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFFy5aG1eOeMU44S@phenom.ffwll.local>

On Tue, Jun 17, 2025 at 03:51:33PM +0200, Simona Vetter wrote:
> On Thu, Jun 12, 2025 at 04:49:54PM +0200, Philipp Stanner wrote:
> > + * NOTE that sharing &struct drm_sched_init_args.submit_wq with the driver
> > + * theoretically can deadlock. It must be guaranteed that submit_wq never has
> > + * more than max_active - 1 active tasks, or if max_active tasks are reached at
> > + * least one of them does not execute operations that may block on dma_fences
> > + * that potentially make progress through this scheduler instance. Otherwise,
> > + * it is possible that all max_active tasks end up waiting on a dma_fence (that
> > + * can only make progress through this schduler instance), while the
> > + * scheduler's queued work waits for at least one of the max_active tasks to
> > + * finish. Thus, this can result in a deadlock.
> 
> Uh if you have an ordered wq you deadlock with just one misuse. I'd just
> explain that the wq must provide sufficient forward-progress guarantees
> for the scheduler, specifically that it's on the dma_fence signalling
> critical path and leave the concrete examples for people to figure out
> when the design a specific locking scheme.

This isn't a concrete example, is it? It's exactly what you say in slightly
different words, with the addition of highlighting the impact of the workqueue's
max_active configuration.

I think that's relevant, because N - 1 active tasks can be on the dma_fence
signalling critical path without issues.

We could change

	"if max_active tasks are reached at least one of them must not execute
	 operations that may block on dma_fences that potentially make progress
	 through this scheduler instance"

to 

	"if max_active tasks are reached at least one of them must not be on the
	 dma_fence signalling critical path"

which is a bit more to the point I think.

