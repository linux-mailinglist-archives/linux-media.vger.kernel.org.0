Return-Path: <linux-media+bounces-19794-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC45D9A2054
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 12:51:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29C9528A88B
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 10:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9048E1DA2E0;
	Thu, 17 Oct 2024 10:51:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0A81D27A6
	for <linux-media@vger.kernel.org>; Thu, 17 Oct 2024 10:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729162272; cv=none; b=mNoniOj2CDzs3CFzDgKlFcHLe+47FzKhrrtCRfN6qRsvrfQhWPXYD/srgt5f4FVXx+8trTYK1Gp6jkXr0145Nf+SSP+Ad+e1BRTsFNzthuNwk02FZAowTxEtX7++T8fR0RB37NvwGArfoelTNHIsTLsMvcE3olE0Un83fUuX90E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729162272; c=relaxed/simple;
	bh=rnYYLdiw6pIugLgkdJhC5RwMmZnEkaAX8BkvaaQOO/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sf/E82UWq4nik7enyc8qh1cCOc9UQ4zZ2iB08ePS7aqaVXTX+NHKG/YDTSC4wEozhZXHxpbIB0o7JUqeDX8hVNx/ttSesjG0anQCEiHMfIhabS8fH8nLlAn+HJCelUd84DWblYf+UNdQDbNSPWZpZwzuhHU+5X8hOLESBtgK0aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A004EC4CEC3;
	Thu, 17 Oct 2024 10:51:10 +0000 (UTC)
Message-ID: <fb3c5f48-8a82-445c-b015-dde4f4f58def@xs4all.nl>
Date: Thu, 17 Oct 2024 12:51:09 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 v4l-utils] common: Use posix_memalign for allocating
 userptr buffers
To: Brandon Cheo Fusi <fusibrandon13@gmail.com>, linux-media@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Tomasz Figa <tfiga@chromium.org>
References: <20240625112425.37172-1-fusibrandon13@gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240625112425.37172-1-fusibrandon13@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Brandon,

On 25/06/2024 13:24, Brandon Cheo Fusi wrote:
> When dealing with a userptr pointing to a buffer in userspace,
> videobuf2 swaps the corresponding physical pages with other pages
> so we have a contiguous area of memory for DMA. This only works if
> the userptr is page aligned.
> 
> The current way of allocating user buffers using malloc only
> guarantees alignment up to `alignof(max_align_t)`, which is usually
> 16. So replace malloc with posix_memalign to ensure the returned
> pointer is on a page boundary.

With which driver is this tested? USERPTR is really supposed to work
with malloc()ed memory.

There have been drivers in the past that used contiguous DMA but still
allowed USERPTR, but that was a hack and these days you would use DMABUF.

Regards,

	Hans

> 
> Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
> ---
>  utils/common/v4l-helpers.h | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
> index cf0e92d..aa9ee26 100644
> --- a/utils/common/v4l-helpers.h
> +++ b/utils/common/v4l-helpers.h
> @@ -1661,10 +1661,11 @@ static inline int v4l_queue_alloc_bufs(struct v4l_fd *f,
>  		return 0;
>  	for (b = from; b < v4l_queue_g_buffers(q); b++) {
>  		for (p = 0; p < v4l_queue_g_num_planes(q); p++) {
> -			void *m = malloc(v4l_queue_g_length(q, p));
> -
> -			if (m == NULL)
> -				return errno;
> +			void *m;
> +			int ret = posix_memalign(&m, getpagesize(),
> +						v4l_queue_g_length(q, p));
> +			if (ret)
> +				return ret;
>  			v4l_queue_s_userptr(q, b, p, m);
>  		}
>  	}


