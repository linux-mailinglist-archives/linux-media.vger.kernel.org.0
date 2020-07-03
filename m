Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DAAD213220
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2020 05:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbgGCDV2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jul 2020 23:21:28 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37664 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726033AbgGCDV1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Jul 2020 23:21:27 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 1A8CB2A054D
Message-ID: <d34520b6799ddf84d9bd6de1cc6352f28c665c9a.camel@collabora.com>
Subject: Re: [PATCH 7/9] media: rkvdec: h264: Use bytesperline and buffer
 height to calculate stride
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Jonas Karlman <jonas@kwiboo.se>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>
Date:   Fri, 03 Jul 2020 00:21:17 -0300
In-Reply-To: <20200701215616.30874-8-jonas@kwiboo.se>
References: <20200701215616.30874-1-jonas@kwiboo.se>
         <20200701215616.30874-8-jonas@kwiboo.se>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jonas,

On Wed, 2020-07-01 at 21:56 +0000, Jonas Karlman wrote:
> Use bytesperline and buffer height to calculate the strides configured.
> 
> This does not really change anything other than ensuring the bytesperline
> that is signaled to userspace matches was is configured in HW.
> 

Are you seeing any issue due to this?

> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>  drivers/staging/media/rkvdec/rkvdec-h264.c | 27 +++++++++++++---------
>  1 file changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
> index 9c8e49642cd9..1cb6af590138 100644
> --- a/drivers/staging/media/rkvdec/rkvdec-h264.c
> +++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
> @@ -891,10 +891,11 @@ static void config_registers(struct rkvdec_ctx *ctx,
>  	dma_addr_t rlc_addr;
>  	dma_addr_t refer_addr;
>  	u32 rlc_len;
> -	u32 hor_virstride = 0;
> -	u32 ver_virstride = 0;
> -	u32 y_virstride = 0;
> -	u32 yuv_virstride = 0;
> +	u32 hor_virstride;
> +	u32 ver_virstride;
> +	u32 y_virstride;
> +	u32 uv_virstride;
> +	u32 yuv_virstride;
>  	u32 offset;
>  	dma_addr_t dst_addr;
>  	u32 reg, i;
> @@ -904,16 +905,20 @@ static void config_registers(struct rkvdec_ctx *ctx,
>  
>  	f = &ctx->decoded_fmt;
>  	dst_fmt = &f->fmt.pix_mp;
> -	hor_virstride = (sps->bit_depth_luma_minus8 + 8) * dst_fmt->width / 8;
> -	ver_virstride = round_up(dst_fmt->height, 16);
> +	hor_virstride = dst_fmt->plane_fmt[0].bytesperline;
> +	ver_virstride = dst_fmt->height;
>  	y_virstride = hor_virstride * ver_virstride;
>  

So far so good.

> -	if (sps->chroma_format_idc == 0)
> -		yuv_virstride = y_virstride;
> -	else if (sps->chroma_format_idc == 1)
> -		yuv_virstride += y_virstride + y_virstride / 2;
> +	if (sps->chroma_format_idc == 1)
> +		uv_virstride = y_virstride / 2;
>  	else if (sps->chroma_format_idc == 2)
> -		yuv_virstride += 2 * y_virstride;
> +		uv_virstride = y_virstride;
> +	else if (sps->chroma_format_idc == 3)
> +		uv_virstride = 2 * y_virstride;
> +	else
> +		uv_virstride = 0;
> +
> +	yuv_virstride = y_virstride + uv_virstride;
>  

Is the chunk above related to the patch, or mostly
cleaning/improving the code?

Thanks,
Ezequiel

>  	reg = RKVDEC_Y_HOR_VIRSTRIDE(hor_virstride / 16) |
>  	      RKVDEC_UV_HOR_VIRSTRIDE(hor_virstride / 16) |


