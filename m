Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7422EBF1E
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 14:50:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725960AbhAFNql (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 08:46:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:50446 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725836AbhAFNqk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Jan 2021 08:46:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE4DA2311A;
        Wed,  6 Jan 2021 13:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1609940754;
        bh=dCoF2O50cFUHjCxcKBfGbJ4M0gpxaJLAvMtc+XoF27U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=saP0e/tkb9fUsADhfZ8zphsUzXLH5nHr03v0X18DRG4nTOOm5iF8uwxftDnxfirRn
         t2AZbtNgRRWmOA7lPQb4FmNpvQVQvirHznbPK80l/iBodfuCjPfsoZtOOdtJOaHleX
         LYGldEnecXvSTNm3P7+lBNC3P5e2HezXgqzfyA5c=
Date:   Wed, 6 Jan 2021 14:47:14 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     ezequiel@collabora.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] media: rkvdec: use resource_size
Message-ID: <X/W/YnBwP5q9sxkI@kroah.com>
References: <20210106131820.32706-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106131820.32706-1-zhengyongjun3@huawei.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 06, 2021 at 09:18:20PM +0800, Zheng Yongjun wrote:
> Use resource_size rather than a verbose computation on
> the end and start fields.
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/staging/media/rkvdec/rkvdec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> index d25c4a37e2af..66572066e7a0 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -130,7 +130,7 @@ static void rkvdec_reset_fmt(struct rkvdec_ctx *ctx, struct v4l2_format *f,
>  	memset(f, 0, sizeof(*f));
>  	f->fmt.pix_mp.pixelformat = fourcc;
>  	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
> -	f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_REC709,
> +	f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_REC709;
>  	f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>  	f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
>  	f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
> -- 
> 2.22.0
> 

That is not what this patch does at all :(
