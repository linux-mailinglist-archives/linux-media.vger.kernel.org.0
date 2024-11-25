Return-Path: <linux-media+bounces-21927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A84A19D7BFA
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 08:33:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F17328239D
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 07:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E95514AD2D;
	Mon, 25 Nov 2024 07:33:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4A82119;
	Mon, 25 Nov 2024 07:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732519989; cv=none; b=V/TyJQIes0ekjq8+gOgCPfT2kUWfedk3ZLySQc5NaqZYN0JisQUDk9fOdlYl1HdyV7ke3M60E3LX60Mfd1sTPOC3T6aytUswWSXBDb1hgjnUwr6sZVg2F1IvvX0so6JPRuAfbbInAVerFEmhcZrrZ9u+GRHzYjlWxQPvO+zDYj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732519989; c=relaxed/simple;
	bh=vwos+9xB/9SjgJ4gcS/NeNtWgCS+FAJoiEOAbN1jbE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iZCNmn101hY+Y9kigoVPXoehz+ZdcWajW6Hy0JJGj74K3IR5H7V4Ky+cxuya9hbQRlIGg0HybqC2iN/rpT0JhrbVTsl7v0xreZzF1niehszFj/8/OXUkAqGyQq+5O/cyjgrM+TEL4Z81+zoXZAFB59lO0yDV6CHUulXwiQeQcio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E906DC4CECE;
	Mon, 25 Nov 2024 07:33:07 +0000 (UTC)
Message-ID: <49863857-f7b4-40c7-ae0c-3ba2bebe6200@xs4all.nl>
Date: Mon, 25 Nov 2024 08:33:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH AUTOSEL 4.19 2/4] media: vb2: use lock if
 wait_prepare/finish are NULL
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, tfiga@chromium.org,
 m.szyprowski@samsung.com, mchehab@kernel.org, linux-media@vger.kernel.org
References: <20241124125856.3341388-1-sashal@kernel.org>
 <20241124125856.3341388-2-sashal@kernel.org>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20241124125856.3341388-2-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sasha,

This shouldn't be backported. It is not a fix, and it relies on a number of other
changes for this to work anyway, and none of those other changes are backported.

So please drop this patch.

Thank you,

	Hans

On 24/11/2024 13:58, Sasha Levin wrote:
> From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> [ Upstream commit 88785982a19daa765e30ab3a605680202cfaee4e ]
> 
> If the wait_prepare or wait_finish callback is set, then call it.
> If it is NULL and the queue lock pointer is not NULL, then just
> unlock/lock that mutex.
> 
> This allows simplifying drivers by dropping the wait_prepare and
> wait_finish ops (and eventually the vb2_ops_wait_prepare/finish helpers).
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/media/common/videobuf2/videobuf2-core.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 98719aa986bb9..e439831f6df46 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -1528,7 +1528,10 @@ static int __vb2_wait_for_done_vb(struct vb2_queue *q, int nonblocking)
>  		 * become ready or for streamoff. Driver's lock is released to
>  		 * allow streamoff or qbuf to be called while waiting.
>  		 */
> -		call_void_qop(q, wait_prepare, q);
> +		if (q->ops->wait_prepare)
> +			call_void_qop(q, wait_prepare, q);
> +		else if (q->lock)
> +			mutex_unlock(q->lock);
>  
>  		/*
>  		 * All locks have been released, it is safe to sleep now.
> @@ -1538,12 +1541,16 @@ static int __vb2_wait_for_done_vb(struct vb2_queue *q, int nonblocking)
>  				!list_empty(&q->done_list) || !q->streaming ||
>  				q->error);
>  
> +		if (q->ops->wait_finish)
> +			call_void_qop(q, wait_finish, q);
> +		else if (q->lock)
> +			mutex_lock(q->lock);
> +
> +		q->waiting_in_dqbuf = 0;
>  		/*
>  		 * We need to reevaluate both conditions again after reacquiring
>  		 * the locks or return an error if one occurred.
>  		 */
> -		call_void_qop(q, wait_finish, q);
> -		q->waiting_in_dqbuf = 0;
>  		if (ret) {
>  			dprintk(1, "sleep was interrupted\n");
>  			return ret;


