Return-Path: <linux-media+bounces-22139-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B521F9DA48B
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 10:12:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 576BF1613DA
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 09:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6568D1922EE;
	Wed, 27 Nov 2024 09:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mvop1Y52"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F66188A0D;
	Wed, 27 Nov 2024 09:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732698727; cv=none; b=mz/7AoDjaOXVh5zgoEK33Y0hrsEhMt3Hs4+n8JGhqO64J35LB253z70lsNgTv3Dlfmk7niLpN15rZ4ZdKZ6zPVab+DWquQGs/c8S1Yr8SXG4jh8m255CFeVpoQAch6D0evCsUnkKioPJpE6ULZN73Ujsm4w9AZuUBlBnuhmQ2lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732698727; c=relaxed/simple;
	bh=eMcMiTlapMQlM2VxLBHCg1tkpjyHbDi5PzUsXwK875Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SX5DEd8EeOXCjzT0jQdBWTLELOBuqSLcVXdSZyCPe5cpniC2KZyS+dxcR4D38fIDQZPs2D9395MdrWTFrB6GO3CcnwMA7Umu20cxDElBoQIy42ycfHT5X7A8Xei5CO3Uh5sR6ZC+wL38xZqzQGeELUkGkGUn/uTQe5JLR+ZqluE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mvop1Y52; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3136D792;
	Wed, 27 Nov 2024 10:11:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732698701;
	bh=eMcMiTlapMQlM2VxLBHCg1tkpjyHbDi5PzUsXwK875Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mvop1Y52epjvnh+EGZ7G9p0Hpb7nAmZ4qCSHoPc8Mj6e4sccheWfCrfwAiqusbrJa
	 q3wYJlKaApM82/uCU48ugWQCfpL40rmxXzh4a3DuAY5aeTzN5FjzNdH1pr4miKIZH3
	 Rt7nv9Fysb1Xc8vUYI0QtU+Z+0qRE3n0xNzspW84=
Date: Wed, 27 Nov 2024 11:11:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] media: uvcvideo: Do not set an async control owned
 by other fh
Message-ID: <20241127091153.GA31095@pendragon.ideasonboard.com>
References: <20241127-uvc-fix-async-v1-0-eb8722531b8c@chromium.org>
 <20241127-uvc-fix-async-v1-1-eb8722531b8c@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241127-uvc-fix-async-v1-1-eb8722531b8c@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Wed, Nov 27, 2024 at 07:46:10AM +0000, Ricardo Ribalda wrote:
> If a file handle is waiting for a response from an async control, avoid
> that other file handle operate with it.
> 
> Without this patch, the first file handle will never get the event
> associated to that operation.

Please explain why that is an issue (both for the commit message and for
me, as I'm not sure what you're fixing here).

What may be an issue is that ctrl->handle seem to be accessed from
different contexts without proper locking :-S

> Cc: stable@vger.kernel.org
> Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 4fe26e82e3d1..5d3a28edf7f0 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1950,6 +1950,10 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>  	if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
>  		return -EACCES;
>  
> +	/* Other file handle is waiting a response from this async control. */
> +	if (ctrl->handle && ctrl->handle != handle)
> +		return -EBUSY;
> +
>  	/* Clamp out of range values. */
>  	switch (mapping->v4l2_type) {
>  	case V4L2_CTRL_TYPE_INTEGER:

-- 
Regards,

Laurent Pinchart

