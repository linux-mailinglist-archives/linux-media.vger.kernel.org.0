Return-Path: <linux-media+bounces-13975-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 543909138F5
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 10:12:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98252B215EA
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 08:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D42246A032;
	Sun, 23 Jun 2024 08:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bgIam4C5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822BE4CDEC
	for <linux-media@vger.kernel.org>; Sun, 23 Jun 2024 08:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719130364; cv=none; b=RbrXn0XDL6DABZZr8VG8HCRU8FvXx2Jpx6qrqdX67jqq5eFszu3KPVL2FqAb6NNuOiHNUF9FhQStQ8+P6ff0cv78OMcf4mKjSIrzNmi3tmZVzzew5010esRK1zdecsEznjrF2aVadzT52UyuafUPkTUWNMcldCjyCdb26pVnzKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719130364; c=relaxed/simple;
	bh=DGl9u7M6rd9r25tcH/Ru03Skgt8jRHyWzGWYkxpmGF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s8MLe8W6XAnf73Ao8iswsKYxo8xhrow0ab2yj9eJvxLlbMvdnFyGksryI7+BMmzXl40FIagj4ZhHI5GIj2LI4MBhMY2PdmjmsWfrDtlJuVXnU8H25wuwrvDtw8YKkjAKxLwWjtXPBjhMo2OsL0lw1k5ZjGZ+C0iTwV56mlrCFtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bgIam4C5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719130362; x=1750666362;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DGl9u7M6rd9r25tcH/Ru03Skgt8jRHyWzGWYkxpmGF0=;
  b=bgIam4C5ewzjGRsvjN3hgtqBEJIwVsRyezE0K4Ot66PdaXoVcv4IevDg
   KinoZdhE2GE2iZn94KPWV7C9tJJeemDOdeebEy69Myr3S79LG/bBxli52
   5r3b2ItR+5mVes/ga7UuunQpjiQevEn1Q0Uma/jbxn7/7rrGSAVvzS9OJ
   2JL9VbgcVZt5V3CRUcUPCOzBue/Qt7XCYIAjAijO9pezQg5KG9UAPrrDt
   eysPV+XMHJFFovcvRp1vQNO3uyRR3o5EW7Am7yP5F4yodyNHje4MfoQye
   dNsbrjZxUX7t8tmoclB63Lu79IDNfdaZcwlFZ+CX0XOfuYTzm/Yh8cWfA
   A==;
X-CSE-ConnectionGUID: bfUtDWlwTlu3H7sSN5iGGg==
X-CSE-MsgGUID: CllkrkXUSMaJW8LQqCgRYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11111"; a="19020940"
X-IronPort-AV: E=Sophos;i="6.08,259,1712646000"; 
   d="scan'208";a="19020940"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2024 01:12:41 -0700
X-CSE-ConnectionGUID: 959FXCilR3aAEvRTTb2lRA==
X-CSE-MsgGUID: rreRH0n5Q3qbMubUgG/KMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,259,1712646000"; 
   d="scan'208";a="47455853"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2024 01:12:40 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E971C11FA94;
	Sun, 23 Jun 2024 11:12:37 +0300 (EEST)
Date: Sun, 23 Jun 2024 08:12:37 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Brandon Cheo Fusi <fusibrandon13@gmail.com>
Cc: linux-media@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 v4l-utils] common: Use posix_memalign for allocating
 userptr buffers
Message-ID: <ZnfY9agvkpGsFRpz@kekkonen.localdomain>
References: <20240622065743.385831-1-fusibrandon13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240622065743.385831-1-fusibrandon13@gmail.com>

Hi Brandon,

On Sat, Jun 22, 2024 at 07:57:43AM +0100, Brandon Cheo Fusi wrote:
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
>  utils/common/v4l-helpers.h | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
> index cf0e92d..4104b53 100644
> --- a/utils/common/v4l-helpers.h
> +++ b/utils/common/v4l-helpers.h
> @@ -1656,15 +1656,16 @@ static inline int v4l_queue_alloc_bufs(struct v4l_fd *f,
>  		struct v4l_queue *q, unsigned from)
>  {
>  	unsigned b, p;
> +	void *m;
> +	int ret;
>  
>  	if (q->memory != V4L2_MEMORY_USERPTR)
>  		return 0;
>  	for (b = from; b < v4l_queue_g_buffers(q); b++) {
>  		for (p = 0; p < v4l_queue_g_num_planes(q); p++) {
> -			void *m = malloc(v4l_queue_g_length(q, p));

Please continue declaring m and ret here. They're not used outside the loop
(and should not be).

> -
> -			if (m == NULL)
> -				return errno;
> +			ret = posix_memalign(&m, getpagesize(), v4l_queue_g_length(q, p));

Over 80 characters per line for no apparent reason.

> +			if (ret)
> +				return ret;
>  			v4l_queue_s_userptr(q, b, p, m);
>  		}
>  	}

-- 
Kind regards,

Sakari Ailus

