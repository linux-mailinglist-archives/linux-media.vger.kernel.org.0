Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A0622F2E91
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 13:02:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731095AbhALMBv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 07:01:51 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:44082 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbhALMBu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 07:01:50 -0500
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC2EE3E;
        Tue, 12 Jan 2021 13:01:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610452869;
        bh=uyM/JyobNkPdQBWX58vhj1WBbJr0HtxDUluUYWK3K1Y=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=QHSbh5Hz4m0REscHWNxyZXlcfu//uPNU0Kj6RNmae/z6Nv1/kPFlR91TM6d9akXu/
         ABxcvBWY9U7Zdof5/JOIdreqVL5NnJroR90OqhoovHrvBGaWtMuJ2RmIUJUTzsZ04N
         CfKpG9xBX6K6EbdfuybSjkPoYmo6raAD/0xHqL0Y=
Subject: Re: [PATCH 2/9] media: mtk-mdp: Do not zero reserved fields
To:     Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Matthias Brugger <matthias.bgg@gmail.com>
References: <20210111145445.28854-1-ribalda@chromium.org>
 <20210111145445.28854-3-ribalda@chromium.org>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <d7b39657-ef60-b388-042c-4db76ad5cde6@ideasonboard.com>
Date:   Tue, 12 Jan 2021 12:01:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210111145445.28854-3-ribalda@chromium.org>
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
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> index 724c7333b6e5..ace4528cdc5e 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> @@ -199,7 +199,6 @@ static const struct mtk_mdp_fmt *mtk_mdp_try_fmt_mplane(struct mtk_mdp_ctx *ctx,
>  		pix_mp->ycbcr_enc = ctx->ycbcr_enc;
>  		pix_mp->quantization = ctx->quant;
>  	}
> -	memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));
>  
>  	max_w = variant->pix_max->target_rot_dis_w;
>  	max_h = variant->pix_max->target_rot_dis_h;
> @@ -247,8 +246,6 @@ static const struct mtk_mdp_fmt *mtk_mdp_try_fmt_mplane(struct mtk_mdp_ctx *ctx,
>  		pix_mp->plane_fmt[i].bytesperline = bpl;
>  		if (pix_mp->plane_fmt[i].sizeimage < sizeimage)
>  			pix_mp->plane_fmt[i].sizeimage = sizeimage;
> -		memset(pix_mp->plane_fmt[i].reserved, 0,
> -		       sizeof(pix_mp->plane_fmt[i].reserved));
>  		mtk_mdp_dbg(2, "[%d] p%d, bpl:%d, sizeimage:%u (%u)", ctx->id,
>  			    i, bpl, pix_mp->plane_fmt[i].sizeimage, sizeimage);
>  	}
> 

