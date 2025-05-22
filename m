Return-Path: <linux-media+bounces-33122-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F8BAC0C16
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 14:59:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BD8EA271A9
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 12:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD1128BAA2;
	Thu, 22 May 2025 12:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G3Cpqv5+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF8B28BA91;
	Thu, 22 May 2025 12:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747918762; cv=none; b=d2G6qwo4F24O7dQk4bRv7pfy8HQKEoQcVBEyw2pe+in8/dfOX6U+vpdxT+SC+BZSgFpSp3QFvYtsTh1KOZYTsNZFtsHUWvwQu/37ZmlGEpwc42EYwGsW8BPyZ7W6gF2/wRcPCJXjRu2UqiiKbhWOJoQxV0y5jpYNDLvhsBzriLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747918762; c=relaxed/simple;
	bh=EzfhMIhRFIBM3Fwseht3BF96lg8TCY/2uetMvYqb0rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i0WZvOmzQCWYr+yNEI7Yils1KkhCUSVmaaFvub7oqnXuS6H0RiR/p6sJE4g8Pi9K7GLXeJ45yQOLOPKe+jiMug6zB9P9tbskxfNG9UvWjLCG9FyPjC7lZgmvZgr5oe0EHuez5G2AtdCzS2mqRrot81XwBuymnIb5msYc0wOExbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G3Cpqv5+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA56BC4CEE4;
	Thu, 22 May 2025 12:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747918762;
	bh=EzfhMIhRFIBM3Fwseht3BF96lg8TCY/2uetMvYqb0rk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G3Cpqv5+9gbs7tVHCLE4dTolFc/WK1cnGNOuDbi2r9P86s69Oibbw5EyCcXMS6caJ
	 WF2MgwzXEYENObgeTtgmait9gV/geM0iIErCdC9w9t2prr0a7nSMvM2E1uXlEz4uIw
	 UjMju2ewQ1/OHObhV5bHiXBMWphCoxXfOBCYApOJxc140kfTX1oOds+4Rgn2xeWOFF
	 fC/9WL24/hZ/WzdszziEnBtKZHSzkQtg+a4JGqatBACIhv2Zc669QhHbTDm6M/Q3V7
	 w8MYEdsWxNs/q9zTCxwo0XQp86Irgo1ZUjxjMKsSk4GM+O0UVpeNNvK5dT7mUlbIFm
	 /Jkhuva4PkqeQ==
Date: Thu, 22 May 2025 14:59:16 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/nouveau: Don't signal when killing the fence
 context
Message-ID: <aC8fpEXYWZ9Oy41J@pollux>
References: <20250522112540.161411-2-phasta@kernel.org>
 <20250522112540.161411-3-phasta@kernel.org>
 <af03b541-0b69-4b3d-b498-b68e0beb3dcb@amd.com>
 <06210b9dc5e5ea8365295b77942c3ca030f02729.camel@mailbox.org>
 <eae0ff0f-31a6-433a-b255-9bdb4727a940@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eae0ff0f-31a6-433a-b255-9bdb4727a940@amd.com>

On Thu, May 22, 2025 at 02:34:33PM +0200, Christian König wrote:
> See all the functions inside include/linux/dma-fence.h can be used by everybody. It's basically the public interface of the dma_fence object.

As you write below, in certain cases it is valid to call this from drivers, so
it's not unreasonable to have it as part of the public API.

> So testing if a fence is signaled without calling the callback is only allowed by whoever implemented the fence.
> 
> In other words nouveau can test nouveau fences, i915 can test i915 fences, amdgpu can test amdgpu fences etc... But if you have the wrapper that makes it officially allowed that nouveau starts testing i915 fences and that would be problematic.

In general, I like the  __dma_fence_is_signaled() helper, because this way we
can document in which cases it is allowed to be used, i.e. the ones you descibe
above.

test_bit() can be called by anyone and there is no documentation comment
explaining that it is only allowed under certain conditions.

Having the __dma_fence_is_signaled() helper properly documented could get you
rid of having to explain in which case the test_bit() dance is allowed to do
over and over again. :-)

I also think the name is good, since the '__' prefix already implies that there
are some restrictions on the use of this helper.

