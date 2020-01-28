Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 064B814C175
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2020 21:13:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726182AbgA1UNV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jan 2020 15:13:21 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49132 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbgA1UNV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jan 2020 15:13:21 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id D56842914CA
Message-ID: <b521c51a53d55f035772cc0d448a9058ee8a935f.camel@collabora.com>
Subject: Re: [PATCH] media: hantro: fix extra MV/MC sync space calculation
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de
Date:   Tue, 28 Jan 2020 17:13:14 -0300
In-Reply-To: <20200127145602.21863-1-p.zabel@pengutronix.de>
References: <20200127145602.21863-1-p.zabel@pengutronix.de>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

Thanks for the patch.

On Mon, 2020-01-27 at 15:56 +0100, Philipp Zabel wrote:
> Add space for MVs and MC sync data to the capture buffers depending on
> whether the post processor will be enabled for the new capture format
> passed to TRY_FMT, not the currently set capture format.
> 

Fixes: 158e92003ba27 ("media: hantro: Support color conversion via post-processing")    
Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  drivers/staging/media/hantro/hantro_v4l2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
> index 0198bcda26b7..f4ae2cee0f18 100644
> --- a/drivers/staging/media/hantro/hantro_v4l2.c
> +++ b/drivers/staging/media/hantro/hantro_v4l2.c
> @@ -295,7 +295,7 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f,
>  		 * +---------------------------+
>  		 */
>  		if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_H264_SLICE &&
> -		    !hantro_needs_postproc(ctx, ctx->vpu_dst_fmt))
> +		    !hantro_needs_postproc(ctx, fmt))

And we also need to fix hantro_needs_postproc,
as it should only be used for decoders.

I can send a patch for it.

Thanks,
Ezequiel
 
>  			pix_mp->plane_fmt[0].sizeimage +=
>  				64 * MB_WIDTH(pix_mp->width) *
>  				     MB_WIDTH(pix_mp->height) + 32;


