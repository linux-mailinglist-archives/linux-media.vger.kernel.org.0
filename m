Return-Path: <linux-media+bounces-1832-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A361808825
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 13:44:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5588F283B2E
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 12:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17FAF3D0B2;
	Thu,  7 Dec 2023 12:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PMgKHuhC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD691D5E
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 04:44:24 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 24F90669;
	Thu,  7 Dec 2023 13:43:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701953022;
	bh=U+GLK8hOLxjlGYRwhjp5AAe3PTdxxcbtlrKC9ohfqcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PMgKHuhCPENFuZUVkpp5/EbZAY6u8dbKtxDXY/Sc9Uy7gioiO224ZAQ8jgaK3JMrD
	 f+bpGJP8OF5YagwVun2M+oED9MN9sty9PLV+CevBjRwj1SuBkXArqHrX65LtOzNh7g
	 mYr9HRni8J/vcILLIuuuh2cTZhISMfUBFDsrPRLg=
Date: Thu, 7 Dec 2023 14:44:29 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	hverkuil@xs4all.nl
Subject: Re: [PATCH 1/6] media: saa6752hs: Don't set format in sub-device
 state
Message-ID: <20231207124429.GC9675@pendragon.ideasonboard.com>
References: <20231207120912.270716-1-sakari.ailus@linux.intel.com>
 <20231207120912.270716-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231207120912.270716-2-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Thu, Dec 07, 2023 at 02:09:07PM +0200, Sakari Ailus wrote:
> For the purpose of setting old non-pad based sub-device try format as a
> basis for VIDIOC_TRY_FMT implementation, there is no need to set the
> format in the sub-device state. Drop the assignment to the state, which
> would result in a NULL pointer dereference.
> 
> Fixes: fd17e3a9a788 ("media: i2c: Use accessors for pad config 'try_*' fields")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/saa6752hs.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/saa6752hs.c b/drivers/media/i2c/saa6752hs.c
> index 51b62a97946a..897eaa669b86 100644
> --- a/drivers/media/i2c/saa6752hs.c
> +++ b/drivers/media/i2c/saa6752hs.c
> @@ -594,10 +594,8 @@ static int saa6752hs_set_fmt(struct v4l2_subdev *sd,
>  	f->field = V4L2_FIELD_INTERLACED;
>  	f->colorspace = V4L2_COLORSPACE_SMPTE170M;
>  
> -	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
> -		*v4l2_subdev_state_get_format(sd_state, 0) = *f;
> +	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
>  		return 0;
> -	}
>  
>  	/*
>  	  FIXME: translate and round width/height into EMPRESS

-- 
Regards,

Laurent Pinchart

