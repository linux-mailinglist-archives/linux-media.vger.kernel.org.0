Return-Path: <linux-media+bounces-1836-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FDD80883B
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 13:46:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56E1E1F21B8D
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 12:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 561EA3D0B9;
	Thu,  7 Dec 2023 12:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RYraSM5O"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C578E1BD7
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 04:45:33 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BE6B674;
	Thu,  7 Dec 2023 13:44:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701953091;
	bh=8cf2yF86ejV9GuaDQkH1w6OJjpIP2JPcoPoT844rG78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RYraSM5Oe32tpxQk/p/QZgg7AA7sSaL7XWtvakwN+8ZWqMrUrvzIoIjc8wyLrkBN3
	 zq0D+baJALIP/PGH0h6S62oxvYhkWvJmn44/xJZodPa+5Jb+zJyJV0B31e+vbXYOCx
	 F5lilgskFNMNqQYgOvxkfX9nEXQk21b53NPteIdQ=
Date: Thu, 7 Dec 2023 14:45:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	hverkuil@xs4all.nl
Subject: Re: [PATCH 4/6] media: rj54n1cb0c: Don't set format in sub-device
 state
Message-ID: <20231207124538.GF9675@pendragon.ideasonboard.com>
References: <20231207120912.270716-1-sakari.ailus@linux.intel.com>
 <20231207120912.270716-5-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231207120912.270716-5-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Thu, Dec 07, 2023 at 02:09:10PM +0200, Sakari Ailus wrote:
> For the purpose of setting old non-pad based sub-device try format as a
> basis for VIDIOC_TRY_FMT implementation, there is no need to set the
> format in the sub-device state. Drop the assignment to the state, which
> would result in a NULL pointer dereference.
> 
> Fixes: fd17e3a9a788 ("media: i2c: Use accessors for pad config 'try_*' fields")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/rj54n1cb0c.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/rj54n1cb0c.c b/drivers/media/i2c/rj54n1cb0c.c
> index 403185b18f06..a59db10153cd 100644
> --- a/drivers/media/i2c/rj54n1cb0c.c
> +++ b/drivers/media/i2c/rj54n1cb0c.c
> @@ -1008,10 +1008,8 @@ static int rj54n1_set_fmt(struct v4l2_subdev *sd,
>  	v4l_bound_align_image(&mf->width, 112, RJ54N1_MAX_WIDTH, align,
>  			      &mf->height, 84, RJ54N1_MAX_HEIGHT, align, 0);
>  
> -	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
> -		*v4l2_subdev_state_get_format(sd_state, 0) = *mf;
> +	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
>  		return 0;
> -	}
>  
>  	/*
>  	 * Verify if the sensor has just been powered on. TODO: replace this

-- 
Regards,

Laurent Pinchart

