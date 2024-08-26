Return-Path: <linux-media+bounces-16760-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEBD95E8FA
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 08:35:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C02F2810B4
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 06:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B6C783CC8;
	Mon, 26 Aug 2024 06:31:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7E6126F0A;
	Mon, 26 Aug 2024 06:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724653878; cv=none; b=gjIMVaBkjSDphemSFcRYAlDv3oAaxcTeS12sD8u/Dh5DgpFP7iQI9mfdZkxsUv4HMDo76pWigxh2QgXm8fbQs/+q61iRbr1YLucZDuhE4nZ7mqHyEN9KDJEtT1+8wmMDqfDbbrEMQkrNrc6r0E8KAlx8aSwQ7UvaioDoG3iLgEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724653878; c=relaxed/simple;
	bh=zWq9425nWIEib9KfEkpGrwJSUC9AoUQM06FwuA2n9rk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F3xrAYf9pbaK+lh9YHy6GJg5hgWOXwzE9EBkRiSWij3DFd4hXV94QHgLIenRUlatESvQM/YcGBvDHjqK1d+uhImM7tnecZZl5HY70nTcu9Vn/mDnIIoOwUqvbeC31HlqMLMfI+BW/k7kNvEKlSOytP7tuwFKnSdNKzUpom7KmUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E4AC4AF64;
	Mon, 26 Aug 2024 06:31:15 +0000 (UTC)
Message-ID: <fbdc2a88-bffc-4603-8ceb-25817967ade8@xs4all.nl>
Date: Mon, 26 Aug 2024 08:31:13 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: videobuf2: Drop minimum allocation requirement of
 2 buffers
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, stable@vger.kernel.org
References: <20240825232449.25905-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240825232449.25905-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/08/2024 01:24, Laurent Pinchart wrote:
> When introducing the ability for drivers to indicate the minimum number
> of buffers they require an application to allocate, commit 6662edcd32cc
> ("media: videobuf2: Add min_reqbufs_allocation field to vb2_queue
> structure") also introduced a global minimum of 2 buffers. It turns out
> this breaks the Renesas R-Car VSP test suite, where a test that
> allocates a single buffer fails when two buffers are used.
> 
> One may consider debatable whether test suite failures without failures
> in production use cases should be considered as a regression, but
> operation with a single buffer is a valid use case. While full frame
> rate can't be maintained, memory-to-memory devices can still be used
> with a decent efficiency, and requiring applications to allocate
> multiple buffers for single-shot use cases with capture devices would
> just waste memory.
> 
> For those reasons, fix the regression by dropping the global minimum of
> buffers. Individual drivers can still set their own minimum.
> 
> Fixes: 6662edcd32cc ("media: videobuf2: Add min_reqbufs_allocation field to vb2_queue structure")
> Cc: stable@vger.kernel.org
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
>  drivers/media/common/videobuf2/videobuf2-core.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 500a4e0c84ab..29a8d876e6c2 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -2632,13 +2632,6 @@ int vb2_core_queue_init(struct vb2_queue *q)
>  	if (WARN_ON(q->supports_requests && q->min_queued_buffers))
>  		return -EINVAL;
>  
> -	/*
> -	 * The minimum requirement is 2: one buffer is used
> -	 * by the hardware while the other is being processed by userspace.
> -	 */
> -	if (q->min_reqbufs_allocation < 2)
> -		q->min_reqbufs_allocation = 2;
> -
>  	/*
>  	 * If the driver needs 'min_queued_buffers' in the queue before
>  	 * calling start_streaming() then the minimum requirement is
> 
> base-commit: a043ea54bbb975ca9239c69fd17f430488d33522


