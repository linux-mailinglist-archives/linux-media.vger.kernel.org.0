Return-Path: <linux-media+bounces-1838-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F179580883D
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 13:46:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD3BF283AF8
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 12:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4DBF3D0B9;
	Thu,  7 Dec 2023 12:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pu8kSXqe"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76DD2199E
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 04:46:07 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E8AC4669;
	Thu,  7 Dec 2023 13:45:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701953125;
	bh=9TbJnZjreG5K89SZUo6x3bQEnOlCb4wIWrGa3uGlZ40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pu8kSXqeLCDAHZf/wVXYKPwI+k7tzn9YN3GjcioSZe8JylCn2d8QD+kGS0i/DwZyB
	 KSXv+zNOeOz1BHqI30tm3soda6SCR+LrHI6Kh1q+i26FiwDlOhv8XwXto1hjzlES8O
	 w/r9O6E+xSb6OWtQmWPU+udwyGz2pruCh8XqOxl4=
Date: Thu, 7 Dec 2023 14:46:12 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	hverkuil@xs4all.nl
Subject: Re: [PATCH 6/6] media: ov9640: Don't set format in sub-device state
Message-ID: <20231207124612.GH9675@pendragon.ideasonboard.com>
References: <20231207120912.270716-1-sakari.ailus@linux.intel.com>
 <20231207120912.270716-7-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231207120912.270716-7-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Thu, Dec 07, 2023 at 02:09:12PM +0200, Sakari Ailus wrote:
> For the purpose of setting old non-pad based sub-device try format as a
> basis for VIDIOC_TRY_FMT implementation, there is no need to set the
> format in the sub-device state. Drop the assignment to the state, which
> would result in a NULL pointer dereference.
> 
> Fixes: fd17e3a9a788 ("media: i2c: Use accessors for pad config 'try_*' fields")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/ov9640.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov9640.c b/drivers/media/i2c/ov9640.c
> index b0c171fe75bc..e9a52a8a9dc0 100644
> --- a/drivers/media/i2c/ov9640.c
> +++ b/drivers/media/i2c/ov9640.c
> @@ -547,8 +547,6 @@ static int ov9640_set_fmt(struct v4l2_subdev *sd,
>  	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
>  		return ov9640_s_fmt(sd, mf);
>  
> -	*v4l2_subdev_state_get_format(sd_state, 0) = *mf;
> -
>  	return 0;
>  }
>  

-- 
Regards,

Laurent Pinchart

