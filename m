Return-Path: <linux-media+bounces-18016-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAF9971D77
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 17:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 884BA2842DC
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 15:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F041F18EB1;
	Mon,  9 Sep 2024 15:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G9dyUTuR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EC0C8DF
	for <linux-media@vger.kernel.org>; Mon,  9 Sep 2024 15:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725894327; cv=none; b=JWvX2KXMU0XjB+Nuq1QuWKtn1b7fBkYHw/Cqv7XJFeYlYQ+XhLQq/lgdwbsI/RPgbwTWNWrLiwSU87MCPimr8FDwtx3J7r1mGedlMZRb1xYeFAHXoRSShH964zdF2dpVDemuI5sGJoNzpxrTuIbzr/GcHrgScYljsuaHl8PGXuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725894327; c=relaxed/simple;
	bh=6e5N8P0To8m9XNFKOGb9KUOIzD7ZN6Xv1Z7PtaYMz4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cPNwcaWWwNzeVxwhcm1dJROVWCEHKG39jCwp7uLKwmgP5hZusiaD4glYf4yCTwDM4Oh8cWS4Ws/oPGZ4G2ukFHzWYL1k27xvzCxed2znHGadwbr5S3dnoEPtWC1ZvJlS5tlIDD65llUBmIiXkDSVTpSgLnGySLCSnIKpIxwUEmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G9dyUTuR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57AC93DA;
	Mon,  9 Sep 2024 17:04:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725894248;
	bh=6e5N8P0To8m9XNFKOGb9KUOIzD7ZN6Xv1Z7PtaYMz4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G9dyUTuRWjXsV3hM/jfqhTdj/6DdZV3HnsvFHyJjeOWcTwqUHbhS8U3TNETDN4fwZ
	 AobSXKhEO/U/d862JN1REUS4PmaDz14pDNZ4buV539TmOYRlwAOhjoe0Jkss8Aa0SN
	 m16sqgEoGtoQswDIxjJIhgBxULgU3HZx+0aAt0No=
Date: Mon, 9 Sep 2024 18:05:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH 9/9] media: vb2: use lock if wait_prepare/finish are NULL
Message-ID: <20240909150521.GI27525@pendragon.ideasonboard.com>
References: <cover.1725285495.git.hverkuil-cisco@xs4all.nl>
 <29c41a6823d813e8b00e18f9397470a42347f1b3.1725285495.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <29c41a6823d813e8b00e18f9397470a42347f1b3.1725285495.git.hverkuil-cisco@xs4all.nl>

Hi Hans,

Thank you for the patch.

On Mon, Sep 02, 2024 at 04:04:55PM +0200, Hans Verkuil wrote:
> If the wait_prepare or wait_finish callback is set, then call it.
> If it is NULL and the queue lock pointer is not NULL, then just
> unlock/lock that mutex.
> 
> This allows simplifying drivers by dropping the wait_prepare and
> wait_finish ops (and eventually the vb2_ops_wait_prepare/finish helpers).
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/common/videobuf2/videobuf2-core.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 6335ac7b771a..d064e0664851 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -2035,7 +2035,10 @@ static int __vb2_wait_for_done_vb(struct vb2_queue *q, int nonblocking)
>  		 * become ready or for streamoff. Driver's lock is released to
>  		 * allow streamoff or qbuf to be called while waiting.
>  		 */
> -		call_void_qop(q, wait_prepare, q);
> +		if (q->ops->wait_prepare)
> +			call_void_qop(q, wait_prepare, q);
> +		else if (q->lock)
> +			mutex_unlock(q->lock);

How about calling vb2_ops_wait_prepare() here ? I think that would be
more explicit. You would likely need to move the function to
videobuf2-core.c. Same below for wait_finish.

>  
>  		/*
>  		 * All locks have been released, it is safe to sleep now.
> @@ -2045,12 +2048,16 @@ static int __vb2_wait_for_done_vb(struct vb2_queue *q, int nonblocking)
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
>  			dprintk(q, 1, "sleep was interrupted\n");
>  			return ret;

-- 
Regards,

Laurent Pinchart

