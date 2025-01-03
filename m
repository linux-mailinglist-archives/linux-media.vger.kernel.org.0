Return-Path: <linux-media+bounces-24234-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A908A00B64
	for <lists+linux-media@lfdr.de>; Fri,  3 Jan 2025 16:23:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21F7A18844D8
	for <lists+linux-media@lfdr.de>; Fri,  3 Jan 2025 15:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233611FA8E4;
	Fri,  3 Jan 2025 15:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Wkjf83bK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907211547C9;
	Fri,  3 Jan 2025 15:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735917816; cv=none; b=RLFCwHdlMi2r3MLlSf7g70M3nDUOuR44vo6Jypd4A73JW7JPrygrU0u7f7r4gDHQFai2YXemmxf8NR9WmwkkMic5s/LB0YrEO8TgZlxR2ggNiWgx//w+5oB+T9tlUgSPaZ5HgvA7eiKIgcbK749ODwotXNB3vitdbb6dAQqFs+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735917816; c=relaxed/simple;
	bh=i9kymvajo0n+q8tZsZ+ijeIsUcCEKGJTagFA0ES5SZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R6KrvIv/Ue5wpqZuaDIcn5pU+CLNVg42q2AHNmZON9vhnKmykZya3zNpElV5SksYe4gQoa/Su7f0OPSKktjmw1kvOG5CrA3qUTt+egdHOG6TDdbYVuwRcsXpHLdNIePSUVSldl9wPp2e/ypAsx6dniZcANRwDWOYBMCmfYrmlQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Wkjf83bK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82381316;
	Fri,  3 Jan 2025 16:22:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735917757;
	bh=i9kymvajo0n+q8tZsZ+ijeIsUcCEKGJTagFA0ES5SZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wkjf83bKsMJSqbD8hUCibEPlXcRcutwd9TuP0pjxy+jhrFmCGde9CZwNtX5VsQ2x2
	 Dx2XQMKTFcW5yiP4I/eVFkZ+hSmVblOhdXxx9xMFu0UvcUwI0rBFI0ZOxiZ/XFNae9
	 /T3RUsoPN0u7X++sUf+HARDP2rw4rVOiLkyvkh1Y=
Date: Fri, 3 Jan 2025 17:23:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mikhail Rudenko <mike.rudenko@gmail.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rkisp1: allow non-coherent video capture buffers
Message-ID: <20250103152326.GP554@pendragon.ideasonboard.com>
References: <20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com>

On Thu, Jan 02, 2025 at 06:35:00PM +0300, Mikhail Rudenko wrote:
> Currently, the rkisp1 driver always uses coherent DMA allocations for
> video capture buffers. However, on some platforms, using non-coherent
> buffers can improve performance, especially when CPU processing of
> MMAP'ed video buffers is required.
> 
> For example, on the Rockchip RK3399 running at maximum CPU frequency,
> the time to memcpy a frame from a 1280x720 XRGB32 MMAP'ed buffer to a
> malloc'ed userspace buffer decreases from 7.7 ms to 1.1 ms when using
> non-coherent DMA allocation. CPU usage also decreases accordingly.

What's the time taken by the cache management operations ?

> This change allows userspace to request the allocation of non-coherent
> buffers. Note that the behavior for existing users will remain unchanged
> unless they explicitly set the V4L2_MEMORY_FLAG_NON_COHERENT flag when
> allocating buffers.
> 
> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index 6dcefd144d5abe358323e37ac6133c6134ac636e..c94f7d1d73a92646457a27da20726ec6f92e7717 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -1563,6 +1563,7 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
>  	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>  	q->lock = &node->vlock;
>  	q->dev = cap->rkisp1->dev;
> +	q->allow_cache_hints = 1;
>  	ret = vb2_queue_init(q);
>  	if (ret) {
>  		dev_err(cap->rkisp1->dev,
> 
> ---
> base-commit: 40ed9e9b2808beeb835bd0ed971fb364c285d39c
> change-id: 20241231-b4-rkisp-noncoherent-ad6e7c7a68ba

-- 
Regards,

Laurent Pinchart

