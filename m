Return-Path: <linux-media+bounces-13777-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DED691005D
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 11:30:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EF911C218F6
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 09:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1CF915A845;
	Thu, 20 Jun 2024 09:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MMLQHZe3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385C915B13A
	for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 09:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718875834; cv=none; b=Z93r7C5PYbGEKBYWczuoQx6ah5UTFcklKpJ4vIzd6ulVno+rShWfbwTYxJbvHfC3LF2gDBpVhbOWZ4T2WRytzpFAwIceRyquo3Uism0cfsXfWZrwHMkR/F7BNV0dPwf14ZmTyruckHI9ZNEW3JvxbPFKTQmQt4as6rxgqZ/v0+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718875834; c=relaxed/simple;
	bh=jYGQxlLxqpKPjNhs9WRw4uJzHU5GSZSJVJ7Jree3qk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qVFCsEQVySGLIb/Au4/P6j4caXnAyKDEKmCwYLtT6zhoh21rew9u8tLnyKNO1qT+GqMTo4hX8yKcu2qwWy8Jyd8cbaiJ0bqc18uw6hJqU0N1YEG0VMTTx7wzObKLXR1lrNWdkP8te6+zzoFOZAa07wqZmbq52Jr1A/Zf70/V5xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MMLQHZe3; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718875832; x=1750411832;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jYGQxlLxqpKPjNhs9WRw4uJzHU5GSZSJVJ7Jree3qk0=;
  b=MMLQHZe3uzCzTZFTVTpxB9jnfTNiylfxVHcoc4Q1aA3T/gjpUJHVawUl
   F0XoUkQ94csfOdpSFP3fVjdsAYX3WzNoarAlM/j3pMEbXiUWwatd1+4Ji
   x2l0bTLXGlAB2pfd6b2q+2eabuJrVA5QE3C5dlB8EAsXNa9tzD9bFC2z9
   Esp9jiyQj4KWmF01k8CxnN3IuQT8dyUMux/J0qd6zuEAduHCAhE5aIlci
   B23wHTktlzX7i2M3krN76cC6mcxrsJGUkwrrzQsw9/dZPwSh0aSv1psww
   UD1jDu39BhbmRYSyfy8n3zNsciWb6RHV8FxO6ya7NuN1CEPKnGqs1C9ln
   Q==;
X-CSE-ConnectionGUID: TxGipS8/QSiRFRkPzvgvjQ==
X-CSE-MsgGUID: oRrzFSlySQ6YLDBDHrMtcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="18753905"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="18753905"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 02:30:31 -0700
X-CSE-ConnectionGUID: u6M5LO5bRXKLCDAwtpxBnQ==
X-CSE-MsgGUID: L8zu0aflTmuQBmXtQjOLiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="42281639"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 02:30:30 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E640511FA94;
	Thu, 20 Jun 2024 12:30:23 +0300 (EEST)
Date: Thu, 20 Jun 2024 09:30:23 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Brandon Cheo Fusi <fusibrandon13@gmail.com>
Cc: linux-media@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v4l-utils] common: Use posix_memalign for allocating
 userptr buffers
Message-ID: <ZnP2rwVnyJzMVOXP@kekkonen.localdomain>
References: <20240620091505.359637-1-fusibrandon13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620091505.359637-1-fusibrandon13@gmail.com>

Hi Brandon,

Thanks for the patch.

On Thu, Jun 20, 2024 at 10:15:05AM +0100, Brandon Cheo Fusi wrote:
> When dealing with a userptr pointing to a buffer in userspace,
> videobuf2 swaps the corresponding physical pages with other pages
> so we have a contiguous area of memory for DMA. This only works if
> the userptr is page aligned.
> 
> The current way of allocating user buffers using malloc only
> guarantees alignment up to `alignof(max_align_t)`, which is usually
> 16. So replace malloc with posix_memalign to ensure the returned
> pointer is on a page boundary.
> 
> Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
> ---
>  utils/common/v4l-helpers.h | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
> index cf0e92d..92a6fdc 100644
> --- a/utils/common/v4l-helpers.h
> +++ b/utils/common/v4l-helpers.h
> @@ -1652,6 +1652,19 @@ static inline int v4l_queue_munmap_bufs(struct v4l_fd *f, struct v4l_queue *q,
>  	return 0;
>  }
>  
> +static inline void *userptr_malloc(size_t size)
> +{
> +	int v4l2_page_size = getpagesize();
> +	void *ptr_addr = 0;
> +
> +	int ret = posix_memalign(&ptr_addr, v4l2_page_size, size);
> +	if (ret != 0) {
> +		fprintf(stderr, "malloc via posix_memalign failed\n");
> +		return 0;
> +	}
> +	return ptr_addr;
> +}
> +
>  static inline int v4l_queue_alloc_bufs(struct v4l_fd *f,
>  		struct v4l_queue *q, unsigned from)
>  {
> @@ -1661,7 +1674,7 @@ static inline int v4l_queue_alloc_bufs(struct v4l_fd *f,
>  		return 0;
>  	for (b = from; b < v4l_queue_g_buffers(q); b++) {
>  		for (p = 0; p < v4l_queue_g_num_planes(q); p++) {
> -			void *m = malloc(v4l_queue_g_length(q, p));
> +			void *m = userptr_malloc(v4l_queue_g_length(q, p));

Could you call posix_memalign() here? I don't see a need to add a new
function for this. Also no temporary varible for the page size is needed.

>  
>  			if (m == NULL)
>  				return errno;

-- 
Kind regards,

Sakari Ailus

