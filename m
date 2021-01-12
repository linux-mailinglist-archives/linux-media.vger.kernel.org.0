Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 595C22F2D9E
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 12:12:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728041AbhALLLV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 06:11:21 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:43752 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbhALLLO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 06:11:14 -0500
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C04A83E;
        Tue, 12 Jan 2021 12:10:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610449832;
        bh=3a6z6DlvigbNZwjdEOITL5jSiNUfEDR/Y9b0dEJsedk=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=nDUFrZaIwtATzadF1Osv6VlgYJsOM1WCy2/HDtwsEJwI1LaFRzEcHNlCy6nQc1GrQ
         BcM/HFA+HlDvqbUB4ZU6Fk4eOUai+ZfQIYKVnaOVQEbki6Mfc4XdGQ6yVZT/TlEVLm
         hGjGrWLsXZUmYpoxzijYSjSsqvdxp/gIVz7NSq9w=
Subject: Re: [PATCH 6/9] media: sum4i-csi: Do not zero reserved fields
To:     Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>
References: <20210111145445.28854-1-ribalda@chromium.org>
 <20210111145445.28854-7-ribalda@chromium.org>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <bc3f9c21-26d7-a459-280f-6f5cef180d6a@ideasonboard.com>
Date:   Tue, 12 Jan 2021 11:10:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210111145445.28854-7-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Well I've started, so I may as well finish and do the rest too.

On 11/01/2021 14:54, Ricardo Ribalda wrote:
> Core code already clears reserved fields of struct
> v4l2_pix_format_mplane, check: 4e1e0eb0e074 ("media: v4l2-ioctl: Zero
> v4l2_plane_pix_format reserved fields").

Indeed, these are the only memsets here ...

With the $TITLE fixed as spotted by Ezequiel,

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> 
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
> index 1a2f65d83a6c..4785faddf630 100644
> --- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
> +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
> @@ -113,8 +113,6 @@ static void _sun4i_csi_try_fmt(struct sun4i_csi *csi,
>  	pix->num_planes = _fmt->num_planes;
>  	pix->pixelformat = _fmt->fourcc;
>  
> -	memset(pix->reserved, 0, sizeof(pix->reserved));
> -
>  	/* Align the width and height on the subsampling */
>  	width = ALIGN(pix->width, _fmt->hsub);
>  	height = ALIGN(pix->height, _fmt->vsub);
> @@ -131,8 +129,6 @@ static void _sun4i_csi_try_fmt(struct sun4i_csi *csi,
>  		bpl = pix->width / hsub * _fmt->bpp[i] / 8;
>  		pix->plane_fmt[i].bytesperline = bpl;
>  		pix->plane_fmt[i].sizeimage = bpl * pix->height / vsub;
> -		memset(pix->plane_fmt[i].reserved, 0,
> -		       sizeof(pix->plane_fmt[i].reserved));
>  	}
>  }
>  
> 

