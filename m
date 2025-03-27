Return-Path: <linux-media+bounces-28903-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6362A7416E
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 00:14:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B91251880471
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 23:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FDA01E51F4;
	Thu, 27 Mar 2025 23:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qYQpdbHg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A541DF742;
	Thu, 27 Mar 2025 23:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743117253; cv=none; b=fetu7YRir51HNsO8tQ1BrIyiWM74i/3+o2Rh+pr/OQVAHkoj4HPxte2SfnIjDUU+fv40xaRygE9RcEFkntVZV1t7dcfPCInV8jMCMm8NaZaZg+flakFUf0RlPqRhmJZPpcnAdg3qpPfOdYTMYqpEqSdVtwzGwpak1l9yGhAGSjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743117253; c=relaxed/simple;
	bh=PGjgc6Nwvee3QPLv0Fc/NM7pia0GWYQkjZb2TDbpJzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kp4SVJdYPVdFoSe+o9Yl0ZcaZ48/e7xjaQLdFOEbGd8EisD0uwgP+PXH1tR/gZLxGFMwbChrK/0i3bDEd5v+RebkuU3IFl5emufU7hLc8udFftwUwfJxmBrk8wV/8GKOY4rLc4hPyMF2DfTjRsh76vXKJTyJdfoHroBUwAtnks0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qYQpdbHg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B11B66D5;
	Fri, 28 Mar 2025 00:12:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743117140;
	bh=PGjgc6Nwvee3QPLv0Fc/NM7pia0GWYQkjZb2TDbpJzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qYQpdbHg5zdLoQdKXsbR6c2STRyus4a3R8DhBTqApSpysm2aimsysj3zr8Wetv4X5
	 QQUnmKteysRwaq2cqfP17weweqmmQbOILHWNsjANQ1nb6SFUtLFN6ARgXtLaZ4GNNT
	 ImlEs8InpyzgjgcocH+og0PZO5tg47GlCs0e9Ht8=
Date: Fri, 28 Mar 2025 01:13:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benoit Parrot <bparrot@ti.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] media: ti: cal: Use printk's fourcc formatting
Message-ID: <20250327231345.GL4861@pendragon.ideasonboard.com>
References: <20250326-cal-streams-v7-0-659df87ad231@ideasonboard.com>
 <20250326-cal-streams-v7-1-659df87ad231@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250326-cal-streams-v7-1-659df87ad231@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Wed, Mar 26, 2025 at 01:34:01PM +0200, Tomi Valkeinen wrote:
> Use printk's fourcc formatting instead of a custom one.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/ti/cal/cal-video.c | 26 ++++++--------------------
>  1 file changed, 6 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
> index e29743ae61e2..4eb77f46f030 100644
> --- a/drivers/media/platform/ti/cal/cal-video.c
> +++ b/drivers/media/platform/ti/cal/cal-video.c
> @@ -25,20 +25,6 @@
>  
>  #include "cal.h"
>  
> -/*  Print Four-character-code (FOURCC) */
> -static char *fourcc_to_str(u32 fmt)
> -{
> -	static char code[5];
> -
> -	code[0] = (unsigned char)(fmt & 0xff);
> -	code[1] = (unsigned char)((fmt >> 8) & 0xff);
> -	code[2] = (unsigned char)((fmt >> 16) & 0xff);
> -	code[3] = (unsigned char)((fmt >> 24) & 0xff);
> -	code[4] = '\0';
> -
> -	return code;
> -}
> -
>  /* ------------------------------------------------------------------
>   *	V4L2 Common IOCTLs
>   * ------------------------------------------------------------------
> @@ -180,8 +166,8 @@ static void cal_calc_format_size(struct cal_ctx *ctx,
>  	f->fmt.pix.sizeimage = f->fmt.pix.height *
>  			       f->fmt.pix.bytesperline;
>  
> -	ctx_dbg(3, ctx, "%s: fourcc: %s size: %dx%d bpl:%d img_size:%d\n",
> -		__func__, fourcc_to_str(f->fmt.pix.pixelformat),
> +	ctx_dbg(3, ctx, "%s: fourcc: %p4cc size: %dx%d bpl:%d img_size:%d\n",
> +		__func__, &f->fmt.pix.pixelformat,
>  		f->fmt.pix.width, f->fmt.pix.height,
>  		f->fmt.pix.bytesperline, f->fmt.pix.sizeimage);
>  }
> @@ -509,8 +495,8 @@ static void cal_mc_try_fmt(struct cal_ctx *ctx, struct v4l2_format *f,
>  	if (info)
>  		*info = fmtinfo;
>  
> -	ctx_dbg(3, ctx, "%s: %s %ux%u (bytesperline %u sizeimage %u)\n",
> -		__func__, fourcc_to_str(format->pixelformat),
> +	ctx_dbg(3, ctx, "%s: %p4cc %ux%u (bytesperline %u sizeimage %u)\n",
> +		__func__, &format->pixelformat,
>  		format->width, format->height,
>  		format->bytesperline, format->sizeimage);
>  }
> @@ -866,8 +852,8 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
>  			if (mbus_code.code == fmtinfo->code) {
>  				ctx->active_fmt[i] = fmtinfo;
>  				ctx_dbg(2, ctx,
> -					"matched fourcc: %s: code: %04x idx: %u\n",
> -					fourcc_to_str(fmtinfo->fourcc),
> +					"matched fourcc: %p4cc: code: %04x idx: %u\n",
> +					&fmtinfo->fourcc,
>  					fmtinfo->code, i);

The last two lines can become one.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  				ctx->num_active_fmt = ++i;
>  			}

-- 
Regards,

Laurent Pinchart

