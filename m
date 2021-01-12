Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C82402F2D95
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 12:09:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731312AbhALLI3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 06:08:29 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:43730 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731064AbhALLI2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 06:08:28 -0500
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CED0E3E;
        Tue, 12 Jan 2021 12:07:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610449666;
        bh=ZXHJqHx687OGkTEkTUMaYuXfRgVAqjIzIvGWhKthUeg=;
        h=Subject:To:Cc:References:From:Reply-To:Date:In-Reply-To:From;
        b=ZQvCFO44RQGciA0k3/5jTy0j7BbKXrUsOO1XYa7KPoGOHZl9ACbbaxwr2JUNAZC70
         KTRCI0VFMZ8brFcPi7QZqHpGHlwPjZW2OCJXbss4zLW8AD4g8M/OBeyGZdNYEe3OOD
         SMLSBS1LaHO+SbGctzZ6fowoer1xwUQH4HlsFWyY=
Subject: Re: [PATCH 5/9] media: jpu: Do not zero reserved fields
To:     Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>
References: <20210111145445.28854-1-ribalda@chromium.org>
 <20210111145445.28854-6-ribalda@chromium.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
Organization: Ideas on Board
Message-ID: <faacd5b3-949e-54bd-0ab8-bd43100809b0@ideasonboard.com>
Date:   Tue, 12 Jan 2021 11:07:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210111145445.28854-6-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On 11/01/2021 14:54, Ricardo Ribalda wrote:
> Core code already clears reserved fields of struct
> v4l2_pix_format_mplane, check: 4e1e0eb0e074 ("media: v4l2-ioctl: Zero
> v4l2_plane_pix_format reserved fields").
> 
> Cc: Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/rcar_jpu.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar_jpu.c b/drivers/media/platform/rcar_jpu.c
> index 9b99ff368698..2bddc957cb87 100644
> --- a/drivers/media/platform/rcar_jpu.c
> +++ b/drivers/media/platform/rcar_jpu.c

There's a memset(cap->reserved...) in jpu_querycap()

Is that also applicable and covered by the core?

Looking at v4l_querycap() it doesn't seem to be so:


Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> @@ -793,7 +793,6 @@ static int __jpu_try_fmt(struct jpu_ctx *ctx, struct jpu_fmt **fmtinfo,
>  	pix->colorspace = fmt->colorspace;
>  	pix->field = V4L2_FIELD_NONE;
>  	pix->num_planes = fmt->num_planes;
> -	memset(pix->reserved, 0, sizeof(pix->reserved));
>  
>  	jpu_bound_align_image(&pix->width, JPU_WIDTH_MIN, JPU_WIDTH_MAX,
>  			      fmt->h_align, &pix->height, JPU_HEIGHT_MIN,
> @@ -808,8 +807,6 @@ static int __jpu_try_fmt(struct jpu_ctx *ctx, struct jpu_fmt **fmtinfo,
>  			pix->plane_fmt[0].sizeimage = JPU_JPEG_HDR_SIZE +
>  				(JPU_JPEG_MAX_BYTES_PER_PIXEL * w * h);
>  		pix->plane_fmt[0].bytesperline = 0;
> -		memset(pix->plane_fmt[0].reserved, 0,
> -		       sizeof(pix->plane_fmt[0].reserved));
>  	} else {
>  		unsigned int i, bpl = 0;
>  
> @@ -822,8 +819,6 @@ static int __jpu_try_fmt(struct jpu_ctx *ctx, struct jpu_fmt **fmtinfo,
>  		for (i = 0; i < pix->num_planes; ++i) {
>  			pix->plane_fmt[i].bytesperline = bpl;
>  			pix->plane_fmt[i].sizeimage = bpl * h * fmt->bpp[i] / 8;
> -			memset(pix->plane_fmt[i].reserved, 0,
> -			       sizeof(pix->plane_fmt[i].reserved));
>  		}
>  	}
>  
> 

