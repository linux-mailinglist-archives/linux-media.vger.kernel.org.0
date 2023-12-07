Return-Path: <linux-media+bounces-1833-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ACE808835
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 13:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E71F28343B
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 12:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E9CE3D0AE;
	Thu,  7 Dec 2023 12:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sFef0Kf+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 649311985
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 04:44:53 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F5AE669;
	Thu,  7 Dec 2023 13:44:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701953050;
	bh=gtDwbglrvA3fVGX5Y00vGoREOSqrPfWHQKahmtsUrgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sFef0Kf+4oau8nI5mQqoA2lfnPCba//YQxD9D8WKhcatsHQcyPlUg3vk968JREDpC
	 1OeYRV2JxftH1pI5KXjc1YMy4hwbAEKWnJ5V1/Dk9ujbfW+K03HbnoMLbiSE3+j2sS
	 +1c5iomGbkYhSr28iwuYtQrl0uUjkber3eggip1Q=
Date: Thu, 7 Dec 2023 14:44:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	hverkuil@xs4all.nl
Subject: Re: [PATCH 2/6] media: adv7183: Don't set format in sub-device state
Message-ID: <20231207124458.GD9675@pendragon.ideasonboard.com>
References: <20231207120912.270716-1-sakari.ailus@linux.intel.com>
 <20231207120912.270716-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231207120912.270716-3-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Thu, Dec 07, 2023 at 02:09:08PM +0200, Sakari Ailus wrote:
> For the purpose of setting old non-pad based sub-device try format as a
> basis for VIDIOC_TRY_FMT implementation, there is no need to set the
> format in the sub-device state. Drop the assignment to the state, which
> would result in a NULL pointer dereference.
> 
> Fixes: fd17e3a9a788 ("media: i2c: Use accessors for pad config 'try_*' fields")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/adv7183.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv7183.c b/drivers/media/i2c/adv7183.c
> index bcb99ba9a272..2a2cace4a153 100644
> --- a/drivers/media/i2c/adv7183.c
> +++ b/drivers/media/i2c/adv7183.c
> @@ -442,8 +442,6 @@ static int adv7183_set_fmt(struct v4l2_subdev *sd,
>  	}
>  	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
>  		decoder->fmt = *fmt;
> -	else
> -		*v4l2_subdev_state_get_format(sd_state, 0) = *fmt;
>  	return 0;
>  }
>  

-- 
Regards,

Laurent Pinchart

