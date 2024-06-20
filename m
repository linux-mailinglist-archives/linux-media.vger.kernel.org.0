Return-Path: <linux-media+bounces-13875-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C603D9114A2
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 23:29:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 028301C21953
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 21:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2FE38288F;
	Thu, 20 Jun 2024 21:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="REmzLzK0"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E9A7E0F2
	for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 21:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718918954; cv=none; b=hu2fqWA7vS43Pu4pdbUfTaQu2lzFaEtE4xqABBOfdIpZ9JXrFuPUoXNSOhIPcXpEKEnwJKxETu+gFyPAaZ71vDlMcqIr8D1Cqq7Baaa2nWk534PW6Uc25TRbfZJa56fvt3Lni74lkS7NMALyLjJhT25UoOTpI2W1ApDjkztpDZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718918954; c=relaxed/simple;
	bh=Li96yDnwSiEjADvGOSEFNs0jRj/Nt+E/saFhqejOfug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nz2dQ0rzk3HG6QpA1p4gOqBSyHpOLV+AGd4j9jHLw+jL/NKmXqpaB7Gy8UQdDF4DysfgptvzD6oSgPqnzOysqQBpC8TQw1sqAdcXeA/A77+DjJTs2/9MKEt3HXuIjvFzgnc+7uzgKBrU13Ik4C5SUBgfD7UhqciH2rAY9+NnSFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=REmzLzK0; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=FjJSRclte3oQ162XPR+GI636cEIXV+FjRC5kTph7TC8=; b=REmzLzK0CEB8nNMiFG0Z/2PcQu
	eu3vHmqZjoGuD67IgyM+63Fl0YOiZGH7jNFRd7wJ2msbULs2s01j6fOn0vaDuRYZnHiGmvrxGQH2m
	muVEmaOK8HUnCGhATcA8WrEImPI8Idv2QrrjoJR3Pd6XBQ2Hish1PBhToQ4K6S6/qEKKJP1TGSoCQ
	+ZYOm6LyFab3UeyP5jHCAGZV9Up5zPzEWeEB3AbvSfyR/v/TSIRdZgGVxuIYurC+CgD2QUR0dEbZg
	0ghbjZiJ68F3oGf8yQnxVkdB2BqKkT+Ydm9CczstYlxxsJ1vzU2dDcDjlqyY9SmNyGSnKyVV31a4M
	ip7kwbvg==;
Received: from 179-125-75-233-dinamico.pombonet.net.br ([179.125.75.233] helo=quatroqueijos.cascardo.eti.br)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1sKPKs-005cep-QC; Thu, 20 Jun 2024 23:28:51 +0200
Date: Thu, 20 Jun 2024 18:28:42 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	kernel-dev@igalia.com, Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
	Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH] dma-buf/sw_sync: Add a reference when adding fence to
 timeline list
Message-ID: <ZnSfCq7xttWBuf5a@quatroqueijos.cascardo.eti.br>
References: <20240324101533.3271056-1-cascardo@igalia.com>
 <fc68dce2-88e0-4055-a074-bd45f7e68912@igalia.com>
 <ZmyFKVuYvs59Oirt@quatroqueijos.cascardo.eti.br>
 <d8f02671-67df-43c3-9f23-1904f661a590@igalia.com>
 <ZnR6EmzUy2bCKHHI@quatroqueijos.cascardo.eti.br>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnR6EmzUy2bCKHHI@quatroqueijos.cascardo.eti.br>

On Thu, Jun 20, 2024 at 03:50:58PM -0300, Thadeu Lima de Souza Cascardo wrote:
> On Wed, Jun 19, 2024 at 01:14:38PM +0100, Tvrtko Ursulin wrote:
> > 
> > On 14/06/2024 19:00, Thadeu Lima de Souza Cascardo wrote:
> > > On Fri, Jun 14, 2024 at 11:52:03AM +0100, Tvrtko Ursulin wrote:
> > > > 
> > > > On 24/03/2024 10:15, Thadeu Lima de Souza Cascardo wrote:
> > > > > One is that it takes care of the error case when sync_file_create fails.
> > > > > 
> > > > > The extra reference is put, while the fence is still held on the list, so
> > > > > its last reference will be put when it is removed from the list either in
> > > > > sync_timeline_signal or sw_sync_debugfs_release.
> > > > 
> > > > So any fences where sync_file_create failed linger around until
> > > > sw_sync_debugfs_release? Okay-ish I guess since it is a pathological case.
> > > > 
> > > 
> > > The challenge here is to determine which one of the multiple cases we are
> > > dealing with. Since we don't hold the lock while sync_file_create is
> > > called, we are left with this situation. An alternative would be to fold
> > > sync_pt_create into sw_sync_ioctl_create_fence, so at least we can
> > > determine which case is which. That would also fix the case where we handle
> > > userspace a file descriptor with a fence that is not even on the list.
> > 
> > Since sync_pt_create is local and has only this single caller it could be
> > worth exploring this option to see if it could simplify things and get rid
> > of this lingering objects corner case.
> > 
> 
> So when I went back looking into this, I actually needed to make
> sw_sync_ioctl_create_fence be able to allocate the sync_file without
> assigning a fence. That's when I realized it wouldn't buy us much as we
> could check for the signaled case and return NULL. Let me look at this
> again and get back to you.

Okay, so trying to close this subthread down:

we also might fail when writing down the filedescriptor to userspace (the
copy_to_user after sync_file_create).

Neither of the following options appeal to me:

1) try to write to userspace before actually creating the fence, that breaks
ABI. Despite the ioctl returning an error, the fd has been written to, even
though it has not been installed.

2) try to rollback the insertion of the fence into the list. Imagine two
threads:

one tries to create fence with value A but has data RO, so fence will be
created and inserted into the list, but when copy_to_user fails, it will try to
rollback.

second thread also tries to create fence with value A, but now data is legit.
We might race with the rollback and that won't go well.

Also, as I mentioned in one of the other responses, leaving the fence on
the list is not different from userspace creating the fence then closing
the file descriptor. That will also leave the fence on the list until it is
signaled.

So perhaps this is the crux of the design here. Before this patch, putting
the last reference would remove it from the list. But keeping with this
design leads to all sorts of issues that I mentioned. The change that I am
proposing is to keep fences on the timeline until either they are signaled
or the timeline is destroyed.

Thoughts?
Cascardo.

