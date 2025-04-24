Return-Path: <linux-media+bounces-30951-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99745A9AF1F
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 15:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5F544A08AD
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 13:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881B615B54C;
	Thu, 24 Apr 2025 13:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h+WMpM67"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10A313B5AE;
	Thu, 24 Apr 2025 13:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745501679; cv=none; b=JDQnPKWtLNKHpjf0mbc4DcN5oG6LuBkRzxl8zgLRPjwD11xt8elXbR+/PP5sYG1zHe8HOqZ0/1/4l92eViSIDp6ydN9ik08Vm/RsC+A7yEx1EWkb+64G5Q4etgDOnndLhX4UKQKiZnYN4c2ZsMgZBcnA+HHEQmSAgPyk+0SGAaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745501679; c=relaxed/simple;
	bh=Ep8K/g6VuToes51lb5CKD1nUivYncvjh5+GzmIyT6y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDg6l0UqJa9YJLXfYfI+HFokPGqLDtpNwVNdCuntQpAXAO4g0WTC2B4WupmjINnDVoNW8T7MuYLAd9gargsitNY/smzHP5hU/XxOJTuS6K2RJD1r9n4Ru7FAAz3BScfsIvdDiHKgQbllu52cos000wocdKClXbZzvJQtuqvcVGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h+WMpM67; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6456C4CEE3;
	Thu, 24 Apr 2025 13:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745501678;
	bh=Ep8K/g6VuToes51lb5CKD1nUivYncvjh5+GzmIyT6y8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h+WMpM67Dqp9i75rxlhOqiat5HBC9sFwdDi/1tMbT4VhguTa2TbBUg28+Jquf+TR0
	 bn8qtyrpQd1aGqQzS+GzTBPrPQK9SIB1lB7W8rh3qg2yJjm8yJ8C2pwc/MJQtwoSPn
	 fjx8BRI2jG3/2lc+obPmotjw3J2exELJMAAkO1akSoRON0ODYwOEVjYVLV002/iIsP
	 4uTvMzkw8Fwp0pJZfF0n4bEVSJC0C3u8t2z4poerunI9ymPM5iFxG41Xv+3D1RAR6m
	 2J43ZPPsD9nmnQhAv7ueg+BQdrHV4W+AYEwopdzweZqj0223eWk5z1iPzOpHinnR8x
	 8+4mI0e9DeoWA==
Date: Thu, 24 Apr 2025 15:34:33 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: phasta@kernel.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 4/4] drm/nouveau: Check dma_fence in canonical way
Message-ID: <aAo96dnXwFBxx8as@cassiopeiae>
References: <20250424130254.42046-2-phasta@kernel.org>
 <20250424130254.42046-6-phasta@kernel.org>
 <609c8b1a-d7a9-4667-bd6c-1455c639fcd0@kernel.org>
 <a27a0a01fa2bf5f328ee762b7dd84dffd18fa664.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a27a0a01fa2bf5f328ee762b7dd84dffd18fa664.camel@mailbox.org>

(+ drm-misc maintainers)

On Thu, Apr 24, 2025 at 03:25:55PM +0200, Philipp Stanner wrote:
> On Thu, 2025-04-24 at 15:24 +0200, Danilo Krummrich wrote:
> > On 4/24/25 3:02 PM, Philipp Stanner wrote:
> > > In nouveau_fence_done(), a fence is checked for being signaled by
> > > manually evaluating the base fence's bits. This can be done in a
> > > canonical manner through dma_fence_is_signaled().
> > > 
> > > Replace the bit-check with dma_fence_is_signaled().
> > > 
> > > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > > ---
> > >   drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > index fb9811938c82..d5654e26d5bc 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > > @@ -253,7 +253,7 @@ nouveau_fence_done(struct nouveau_fence *fence)
> > >   	struct nouveau_channel *chan;
> > >   	unsigned long flags;
> > >   
> > > -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence-
> > > >base.flags))
> > > +	if (dma_fence_is_signaled(&fence->base))
> > 
> > This is only correct with commit bbe5679f30d7 ("drm/nouveau: Fix
> > WARN_ON in
> > nouveau_fence_context_kill()") from drm-misc-fixes, correct?
> 
> Yup. Otherwise, this series can't be merged anyways, because patch 1
> depends on it.
> 
> The cover letter says so: "This series is based on this partially
> merged series: [1]"

Well, the series may be based on commit bbe5679f30d7, but all patches from the
series can still be applied independently.

Only patch 4 depends on this commit in terms of correctness.

But that's fine, I think we can get drm-misc-fixes (or the next -rc) backmerged
into drm-misc-next.

