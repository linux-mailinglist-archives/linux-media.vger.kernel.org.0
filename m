Return-Path: <linux-media+bounces-50237-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D8FD038D1
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 15:51:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07B7631C20D8
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 14:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C7E2423A69;
	Thu,  8 Jan 2026 14:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WmpH7PAg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A543F0772;
	Thu,  8 Jan 2026 14:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767881286; cv=none; b=JnuoZT26Y9/iCDOKl+AELnrv1gvGCaPU/QhB+GEa+VJA5re1lzZY+JzBk42AHZArbFAA9xdOlH0QoApChd7inNWYlGYm8PA/Me9lPXTyHfu7pSRvvC9e4S/PjLkK/mo77rcrX9t4OYtI0Al+r5ZVj6l0FC8kArlOd3T44B2nDWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767881286; c=relaxed/simple;
	bh=wFGQMoUNjoosi4HGafU/R22b1Ye3GaPqSJ8Bth6N6EQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UJKQRNV6Cb3inV5Tjy2YsrKm0YWShOaSsOINHqNRs7jRC+6uquYbWPNk47/p8yXqbSDkVurIgfkXBi+kdZw43zIu3cbaohXmYZQfoNsUvHD77MyDTQZQXcwLw2dVYqQmogIgllN4U21UwUlXohYVGc07ScI3+gHV3HA59iRElgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WmpH7PAg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [212.249.222.222])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D00C557;
	Thu,  8 Jan 2026 15:07:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767881260;
	bh=wFGQMoUNjoosi4HGafU/R22b1Ye3GaPqSJ8Bth6N6EQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WmpH7PAgmy3yb3uRRv33jdAmKgfTgbkoGnszb1HBhYehw+KAYCfzRu89Heg79lnnA
	 kR42DMj5GcKX2e8dnPToBgoBIWPjzZrbxDfbsWSugfNQ7OWq72P4o8N6zKHbpmK+HV
	 d29ZpdlWOiT9mgwGHZV0WYQp5lF6bpzQBSJnQmfQ=
Date: Thu, 8 Jan 2026 15:07:58 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Alper Ak <alperyasinak1@gmail.com>
Cc: dan.scally@ideasonboard.com, jacopo.mondi@ideasonboard.com, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Nayden Kanchev <nayden.kanchev@arm.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: mali-c55: Fix possible ERR_PTR dereference in
 mali_c55_isp_enable_streams()
Message-ID: <aV-5HlUJ4u-yTbmK@zed>
References: <20251227115153.60862-1-alperyasinak1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251227115153.60862-1-alperyasinak1@gmail.com>

Hello Alper

On Sat, Dec 27, 2025 at 02:51:52PM +0300, Alper Ak wrote:
> media_pad_remote_pad_unique() can return ERR_PTR(-ENOTUNIQ) or
> ERR_PTR(-ENOLINK) on error situation.
>
> The current code dereferences isp->remote_src without checking
> for these error cases, which could lead to invalid memory access.
>
> Add IS_ERR() check before dereferencing the pointer.
>
> Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> ---
>  drivers/media/platform/arm/mali-c55/mali-c55-isp.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> index 497f25fbdd13..ca1f0bde6f13 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> @@ -359,7 +359,11 @@ static int mali_c55_isp_enable_streams(struct v4l2_subdev *sd,
>  	 */
>
>  	sink_pad = &isp->pads[MALI_C55_ISP_PAD_SINK_VIDEO];
> +
>  	isp->remote_src = media_pad_remote_pad_unique(sink_pad);
> +	if (IS_ERR(isp->remote_src))
> +		return PTR_ERR(isp->remote_src);
> +

To be honest I'm not sure if this can happen.

-ENOTUNIQ shouldn't be possible as we create a link for the single
subev connected to port 0

-ENOLINK shouldn't be possible as well, as if the remote subdev
doesn't bind we won't have a media graph at all

Being defensive it's always wise, but sometimes being too defensive
might result in the reader asking what the code is protecting against
if an error condition is impossible to reach.

Is there a case which I have missed which can lead to an error
condition ?

Thanks
  j

>  	src_sd = media_entity_to_v4l2_subdev(isp->remote_src->entity);
>
>  	isp->frame_sequence = 0;
> --
> 2.43.0
>
>

