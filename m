Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A8342F2E41
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 12:45:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730806AbhALLpS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 06:45:18 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:43904 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729957AbhALLpS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 06:45:18 -0500
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 095A43E;
        Tue, 12 Jan 2021 12:44:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610451876;
        bh=VGt8NO+VSU7bfuSVdiCy1nwUKDg+okyMjS9L34pL1lU=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=WYnuG3ieJNtJsvp5oyfk6WlHqdHyMXyrqEgHHowiOC26hW3O72gQiViBLrmQl9H7+
         D7I/vSqtqc/YAhU/KWKJTsNrECN5NupUkrp5VCIYwwsYRl4GkA3+4GKNFXEENF6Ahn
         hiWPKc8vInYfZPpiRsHQZHteCn/O97kLmj+ym93k=
Subject: Re: [PATCH 8/9] media: vicodec: Do not zero reserved fields
To:     Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20210111145445.28854-1-ribalda@chromium.org>
 <20210111145445.28854-9-ribalda@chromium.org>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <9c136057-69a2-47d3-7563-7ee5ecf83c1d@ideasonboard.com>
Date:   Tue, 12 Jan 2021 11:44:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210111145445.28854-9-ribalda@chromium.org>
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
> Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> ---
>  drivers/media/test-drivers/vicodec/vicodec-core.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
> index 025f3ff77302..33f1c893c1b6 100644
> --- a/drivers/media/test-drivers/vicodec/vicodec-core.c
> +++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
> @@ -811,9 +811,6 @@ static int vidioc_g_fmt(struct vicodec_ctx *ctx, struct v4l2_format *f)
>  		pix_mp->xfer_func = ctx->state.xfer_func;
>  		pix_mp->ycbcr_enc = ctx->state.ycbcr_enc;
>  		pix_mp->quantization = ctx->state.quantization;
> -		memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));
> -		memset(pix_mp->plane_fmt[0].reserved, 0,
> -		       sizeof(pix_mp->plane_fmt[0].reserved));
>  		break;
>  	default:
>  		return -EINVAL;
> @@ -886,8 +883,6 @@ static int vidioc_try_fmt(struct vicodec_ctx *ctx, struct v4l2_format *f)
>  			info->sizeimage_mult / info->sizeimage_div;
>  		if (pix_mp->pixelformat == V4L2_PIX_FMT_FWHT)
>  			plane->sizeimage += sizeof(struct fwht_cframe_hdr);
> -		memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));
> -		memset(plane->reserved, 0, sizeof(plane->reserved));
>  		break;
>  	default:
>  		return -EINVAL;
> 

