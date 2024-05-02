Return-Path: <linux-media+bounces-10641-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FBC8BA01E
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 20:14:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D3BB1F21527
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 18:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B011A172BC1;
	Thu,  2 May 2024 18:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="thj236OR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C36816FF2B;
	Thu,  2 May 2024 18:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714673685; cv=none; b=R0YiCl0j+EmiaGXTr4Zmg9zcncJNoZ7U8VRNtSkShEX8x2q1HuCv2fCAgfRvO+2RSeaHt/VZkLEdubVk1brNPg+guXFLaZTE0ov6zelt5FfgNk7qccwhL1Mp/vj3EaZle7ItcZqyzJlsjOUZ1AP6w0o/gtWu2uOOHOu/F9UXf3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714673685; c=relaxed/simple;
	bh=zkjR2rR+Fxxo177IVqPdvA6J0UpNVu0BmMRwn922h30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sXI8WcA5eKkvRG68sv/cs3XTzCunevjVmCA9jTcZG3MIW6xXUqKP0ex2NYdHgMSylHYmsHCE5dhUvxMxkQ8JE9qy5igHlv9m/eJrc2uEsTA/bco14l6YCKQ6JNb70ChmFkmp1YLUQY9kXXlj39sdQk/jDkzmIWEh5POQMv6uJhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=thj236OR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E45463B;
	Thu,  2 May 2024 20:13:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714673624;
	bh=zkjR2rR+Fxxo177IVqPdvA6J0UpNVu0BmMRwn922h30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=thj236ORZBgfVWd5Aa8RQs6rI0ttQQzolE6tueFTpi36kOkprGHXwtIqBDD0x6ypD
	 JXOmOjrIPgCntkNk+pkSKra9oIaQDSj8MpzduHSRaIbTLuVmptBm+aHwQ7NsvpjkGo
	 RTdkInQaD864bbsIPPB9BBxiq1tKI6dgyXwVX3jk=
Date: Thu, 2 May 2024 21:14:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 09/19] media: max9286: Fix enum_mbus_code
Message-ID: <20240502181434.GP15807@pendragon.ideasonboard.com>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
 <20240430103956.60190-10-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240430103956.60190-10-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Tue, Apr 30, 2024 at 12:39:45PM +0200, Jacopo Mondi wrote:
> The max9286 driver supports multiple output formats but only a single
> one is reported theough the .enum_mbus_code operation.
> 
> Fix that.
> 

Please add a Fixes: tag.

> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/max9286.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index fb13bfde42df..575d8ac8efa1 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -917,10 +917,10 @@ static int max9286_enum_mbus_code(struct v4l2_subdev *sd,
>  				  struct v4l2_subdev_state *sd_state,
>  				  struct v4l2_subdev_mbus_code_enum *code)
>  {
> -	if (code->pad || code->index > 0)
> +	if (code->pad || code->index >= ARRAY_SIZE(max9286_formats))
>  		return -EINVAL;
>  
> -	code->code = MEDIA_BUS_FMT_UYVY8_1X16;
> +	code->code = max9286_formats[code->index].code;
>  
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart

