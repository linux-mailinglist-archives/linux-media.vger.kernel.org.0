Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A987D85D04
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 10:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730626AbfHHIhz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Aug 2019 04:37:55 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52306 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbfHHIhz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Aug 2019 04:37:55 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4FE00555;
        Thu,  8 Aug 2019 10:37:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565253473;
        bh=zCIQ2rVIGptw47t4XACBSLlM/ugGAQZj2hX2kdxvQzE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TD/A8VXr4NiZ7Lm7tbsTsdkDh0PMneomsVUQAKxHx3GSH7ZymLYuVI4EG+26kROFi
         zFFExZIQRAnlZTtf0rkfachjW83KBoMOEKuM91gWGUIUy14ORYqYv3akyXaehOVx4q
         rnh/7+foAEM40y09TLab8fnyaYzlWYa5QaaffEDU=
Date:   Thu, 8 Aug 2019 11:37:51 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 4/6] rcar-vin: Do not reset the crop and compose
 rectangles in s_fmt
Message-ID: <20190808083751.GF6055@pendragon.ideasonboard.com>
References: <20190808011850.21219-1-niklas.soderlund+renesas@ragnatech.se>
 <20190808011850.21219-5-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190808011850.21219-5-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Thu, Aug 08, 2019 at 03:18:48AM +0200, Niklas Söderlund wrote:
> The crop and compose rectangles are reset when s_fmt is called
> resulting in potentially valid rectangles being lost when updating the
> format.

Isn't this the expected behaviour ?

> Fix this by mapping the rectangles inside the new format.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index 8b30267f1636aaf1..5dcd787a9cf96ac9 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -279,8 +279,8 @@ static int rvin_s_fmt_vid_cap(struct file *file, void *priv,
>  		return ret;
>  
>  	vin->format = f->fmt.pix;
> -	vin->crop = crop;
> -	vin->compose = compose;
> +	v4l2_rect_map_inside(&vin->crop, &crop);
> +	v4l2_rect_map_inside(&vin->compose, &compose);
>  	vin->src_rect = crop;
>  
>  	return 0;

-- 
Regards,

Laurent Pinchart
