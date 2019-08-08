Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1379185CC5
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 10:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732011AbfHHI1o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Aug 2019 04:27:44 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:51578 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731844AbfHHI1o (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Aug 2019 04:27:44 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 56E22CC;
        Thu,  8 Aug 2019 10:27:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565252862;
        bh=zW2JVLHezKBQBrbjta6tKwzYLt6Lx/4QtyF+Iy7oh/M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nMOEy6wAXJHjboUbwBnlLEmT7ZL/AGksuJ6Tbih2OZj9/vHJizWuTxdJbjCukJOVP
         Ht5yt++5twx8BIGA8NgNwypcPB2L7ZbHijiu+o+Jm2nI8K5EOkJi4xs+4WFFAr6ZFH
         0WsKClNfTVvUTAlmYhyHPniDKQ8LxtR3KFXhhGak=
Date:   Thu, 8 Aug 2019 11:27:40 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/6] rcar-vin: Make use of V4L2_FIELD_IS_INTERLACED()
 macro
Message-ID: <20190808082740.GD6055@pendragon.ideasonboard.com>
References: <20190808011850.21219-1-niklas.soderlund+renesas@ragnatech.se>
 <20190808011850.21219-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190808011850.21219-3-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Thu, Aug 08, 2019 at 03:18:46AM +0200, Niklas Söderlund wrote:
> The V4L2_FIELD_IS_INTERLACED() can be used to make the code more
> readable, use it.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index f16f2966f9628b72..6be1f33d44e2170c 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -557,16 +557,11 @@ static void rvin_crop_scale_comp_gen2(struct rvin_dev *vin)
>  	rvin_write(vin, 0, VNSPPOC_REG);
>  	rvin_write(vin, 0, VNSLPOC_REG);
>  	rvin_write(vin, vin->format.width - 1, VNEPPOC_REG);
> -	switch (vin->format.field) {
> -	case V4L2_FIELD_INTERLACED:
> -	case V4L2_FIELD_INTERLACED_TB:
> -	case V4L2_FIELD_INTERLACED_BT:
> +
> +	if (V4L2_FIELD_IS_INTERLACED(vin->format.field))
>  		rvin_write(vin, vin->format.height / 2 - 1, VNELPOC_REG);
> -		break;
> -	default:
> +	else
>  		rvin_write(vin, vin->format.height - 1, VNELPOC_REG);
> -		break;
> -	}
>  
>  	vin_dbg(vin,
>  		"Pre-Clip: %ux%u@%u:%u YS: %d XS: %d Post-Clip: %ux%u@%u:%u\n",

-- 
Regards,

Laurent Pinchart
