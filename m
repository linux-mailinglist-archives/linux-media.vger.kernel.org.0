Return-Path: <linux-media+bounces-11271-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 511AA8C1A2B
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 02:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06C7A1F22B30
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 00:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0475681E;
	Fri, 10 May 2024 00:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rrb9BXAJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796D47F
	for <linux-media@vger.kernel.org>; Fri, 10 May 2024 00:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715299358; cv=none; b=ciwrCtnPhxtcsZEGrYytiBj9PgYaYdZ5/jyQlByXzFbIXRdmoFyTLeopNlT14W14CInbc7tOVGksYtts0uzNDiWfw8l/ll8h+GexhVMWrhSfzjIRowMXv/nRzSrQpt0REwj2D9HvP+oBULBhjCEnOrCHrgCnLXllKbDv/9fHwgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715299358; c=relaxed/simple;
	bh=ZmpR4GUXGOei/+M/GAbgK06Ul8NRpjkiqMxojBhcw6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jFewvI8rnDhMVLSSGYGNzVNSJr1hGmfOG47gDksEi/thSvsiMqJkHYVt39Lp+Cz5YS3H10IizlhrsD1AycAm6y+KT0xmfc6fpsiaWpt+frPn79pQtKQF+4nd6pKNEQmuOjnJiZ173ZVp5k2Z12LX1K0jczeoYK/gtZy767qUs3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rrb9BXAJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CDAFB397;
	Fri, 10 May 2024 02:02:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715299350;
	bh=ZmpR4GUXGOei/+M/GAbgK06Ul8NRpjkiqMxojBhcw6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rrb9BXAJ3hKk2M29ysXGdb5qb0Xg1nxMEoDe3JGW4aPDce5tZ8O9dgfK8fwfhjcim
	 sxeqqXAxXzdJ80nOv8QR9DwcaB/qj8iCl6kYQcLwPSKyPUySmbsPNK55oLRsFb3MfZ
	 Ik3aQqZK31dI96ous5lDZ2P980x6fU85/B6jXvZc=
Date: Fri, 10 May 2024 03:02:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH for v6.10] media: v4l2-ctrls: drop unnecessary locking
 that caused potential deadlock
Message-ID: <20240510000223.GA30247@pendragon.ideasonboard.com>
References: <25daeee8-f7ef-4595-b2e9-7e4d80ce3f1d@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <25daeee8-f7ef-4595-b2e9-7e4d80ce3f1d@xs4all.nl>

Hi Hans,

Thank you for the patch.

On Wed, May 08, 2024 at 11:11:01AM +0200, Hans Verkuil wrote:
> When logging the control values through VIDIOC_LOG_STATUS you could
> get into a potential deadlock situation in the vivid driver:
> 
> [Wed May  8 10:02:06 2024]  Possible unsafe locking scenario:
> 
> [Wed May  8 10:02:06 2024]        CPU0                    CPU1
> [Wed May  8 10:02:06 2024]        ----                    ----
> [Wed May  8 10:02:06 2024]   lock(vivid_ctrls:1620:(hdl_vid_cap)->_lock);
> [Wed May  8 10:02:06 2024]                                lock(vivid_ctrls:1608:(hdl_user_vid)->_lock);
> [Wed May  8 10:02:06 2024]                                lock(vivid_ctrls:1620:(hdl_vid_cap)->_lock);
> [Wed May  8 10:02:06 2024]   lock(vivid_ctrls:1608:(hdl_user_vid)->_lock);

This looks scary. How was this triggered, can you provide the full
lockdep report ? I'm worried there could be other scenarios where the
locks could be taken in different orders.

> That's because both the main control handler was locked and the
> inner control handler containing the control that you want to log.
> 
> In this particular case there is no need to lock the inner control
> handler since it is guaranteed that that handler won't delete controls
> unexpectedly.

All the v4l2_ctrl_type_ops operations currently rely on the control
handler being locked when they're called. I don't like the idea of
lifting that requirement without an audit of the implementations. We
should then clearly document that the log operation can be called
without the lock held.

> 
> Fixes: 9801b5b28c692 ("media: v4l2-ctrls: show all owned controls in log_status")
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index c59dd691f79f6..4e6748bd419cf 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -2518,11 +2518,7 @@ static void log_ctrl(const struct v4l2_ctrl_handler *hdl,

You can also drop the hdl argument to this function, which was
introduced by the commit referenced by Fixes:.

> 
>  	pr_info("%s%s%s: ", prefix, colon, ctrl->name);
> 
> -	if (ctrl->handler != hdl)
> -		v4l2_ctrl_lock(ctrl);
>  	ctrl->type_ops->log(ctrl);
> -	if (ctrl->handler != hdl)
> -		v4l2_ctrl_unlock(ctrl);
> 
>  	if (ctrl->flags & (V4L2_CTRL_FLAG_INACTIVE |
>  			   V4L2_CTRL_FLAG_GRABBED |

-- 
Regards,

Laurent Pinchart

