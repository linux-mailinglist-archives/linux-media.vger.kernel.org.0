Return-Path: <linux-media+bounces-35635-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CF4AE4044
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 14:30:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6237E16501A
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 12:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33FEC2367B3;
	Mon, 23 Jun 2025 12:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ldAiAcCQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E291C32
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 12:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750681574; cv=none; b=mQNiTdpzvVh2g68vyrWs6lKjc1jG2QIK6aAXiilqPC3W8/qN8dQhRnOS8VM8PKj/4H7/6ttXV9OM2f4PLvsA8k7h3GdS6ItvpQzYwEubThjefWan3M8FzSnGy+cZx8dhR3L4Mx//9fvfcTCuSjq/9c8ZQoMQmzydfVqHGmdT5sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750681574; c=relaxed/simple;
	bh=bMpSEbS7efy4OkK8yZnLGuPBiFximXwWrDoRntJCU0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OlmdkBcjrpD0/q54boTF0J8We62/mNhoU28ySls87QhLuAzhRejVcwDj6+QbKnmMmET3ErPRnrl6EKBQcdww7x2eNwHfiLER4btjul5o2T26aFWF8mz+U1xVV7NhKC3JJ42wwarWlAOkPj2SJZ6IhTwITbRNbZh5dU8BeC3L3A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ldAiAcCQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 10B00D77;
	Mon, 23 Jun 2025 14:25:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750681555;
	bh=bMpSEbS7efy4OkK8yZnLGuPBiFximXwWrDoRntJCU0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ldAiAcCQ+FJF6XgiI31U/AfU7v1+f0son0BZYpBeBVjymqC/yxUOr+n0ZBxpcA7sG
	 7vwLVWhTcIlNaxsBBOf4m2agEzUyz3iYd4/+MOFayTdHaTfh9bSjAXJKc62wOL8z82
	 BrySvgk4FK7WxKN1ef0eYpLsCt3tw5eNl7dGXt/U=
Date: Mon, 23 Jun 2025 15:25:52 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hans@jjverkuil.nl>
Subject: Re: [PATCH v4 1/3] media: v4l2-ctrls: Don't reset handler's error in
 v4l2_ctrl_handler_free()
Message-ID: <20250623122552.GF826@pendragon.ideasonboard.com>
References: <20250623122314.2346635-1-sakari.ailus@linux.intel.com>
 <20250623122314.2346635-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250623122314.2346635-2-sakari.ailus@linux.intel.com>

On Mon, Jun 23, 2025 at 03:23:12PM +0300, Sakari Ailus wrote:
> It's a common pattern in drivers to free the control handler's resources
> and then return the handler's error code on drivers' error handling paths.
> Alas, the v4l2_ctrl_handler_free() function also zeroes the error field,
> effectively indicating successful return to the caller.
> 
> There's no apparent need to touch the error field while releasing the
> control handler's resources and cleaning up stale pointers. Not touching
> the handler's error field is a more certain way to address this problem
> than changing all the users, in which case the pattern would be likely to
> re-emerge in new drivers.
> 
> Do just that, don't touch the control handler's error field in
> v4l2_ctrl_handler_free().
> 
> Fixes: 0996517cf8ea ("V4L/DVB: v4l2: Add new control handling framework")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index b45809a82f9a..d28596c720d8 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -1661,7 +1661,6 @@ void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
>  	kvfree(hdl->buckets);
>  	hdl->buckets = NULL;
>  	hdl->cached = NULL;
> -	hdl->error = 0;
>  	mutex_unlock(hdl->lock);
>  	mutex_destroy(&hdl->_lock);
>  }

-- 
Regards,

Laurent Pinchart

