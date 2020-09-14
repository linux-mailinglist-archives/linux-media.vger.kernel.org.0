Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 606A12699EA
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 01:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbgINXsd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 19:48:33 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54140 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbgINXsd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 19:48:33 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ADFFC275;
        Tue, 15 Sep 2020 01:48:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600127310;
        bh=l/0LjY4BbLbtGuSK/2jzY/l5VAAkQ0dHv4Fg8rtz5js=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iUV7HvjSFG32O9sFyg0MVHlNvri5xu8cvgC4clWpVE8OFJIelqRr42y7g13hJp6aw
         +BFTZFDBiKa9GYIRHjiVS1FG1qURYHXd3q94oPj5cXn2J/+z/0trX5wk6h6ugrips3
         TXT0k0hF0iuSf7HDcSdW2uZnpLhwbcL+lb3lc+mg=
Date:   Tue, 15 Sep 2020 02:48:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v2] media: rcar-vin: Update crop and compose settings for
 every s_fmt call
Message-ID: <20200914234803.GJ15543@pendragon.ideasonboard.com>
References: <20200913182140.32466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200913182140.32466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

Thank you for the patch.

On Sun, Sep 13, 2020 at 07:21:40PM +0100, Lad Prabhakar wrote:
> The crop and compose settings for VIN in non mc mode werent updated

s/mc/MC/
s/werent/weren't/

> in s_fmt call this resulted in captured images being clipped.
> 
> With the below sequence on the third capture where size is set to
> 640x480 resulted in clipped image of size 320x240.
> 
> high(640x480) -> low (320x240) -> high (640x480)
> 
> This patch makes sure the VIN crop and compose settings are updated.
> 
> Fixes: 104464f573d ("media: rcar-vin: Do not reset the crop and compose rectangles in s_fmt")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Changes for v2:
> * Dropped redundant code mapping crop and compose rects
> 
> v1 - https://lkml.org/lkml/2020/7/31/364
> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index 0e066bba747e..1bd59a8453b4 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -305,7 +305,7 @@ static int rvin_s_fmt_vid_cap(struct file *file, void *priv,
>  			      struct v4l2_format *f)
>  {
>  	struct rvin_dev *vin = video_drvdata(file);
> -	struct v4l2_rect fmt_rect, src_rect;
> +	struct v4l2_rect src_rect;
>  	int ret;
>  
>  	if (vb2_is_busy(&vin->queue))
> @@ -317,14 +317,11 @@ static int rvin_s_fmt_vid_cap(struct file *file, void *priv,
>  		return ret;
>  
>  	vin->format = f->fmt.pix;
> -
> -	fmt_rect.top = 0;
> -	fmt_rect.left = 0;
> -	fmt_rect.width = vin->format.width;
> -	fmt_rect.height = vin->format.height;
> -
> -	v4l2_rect_map_inside(&vin->crop, &src_rect);
> -	v4l2_rect_map_inside(&vin->compose, &fmt_rect);

I would add a comment here:

	/* Reset the crop and compose rectangles to default values. */

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	vin->crop.top = 0;
> +	vin->crop.left = 0;
> +	vin->crop.width = vin->format.width;
> +	vin->crop.height = vin->format.height;
> +	vin->compose = vin->crop;
>  	vin->src_rect = src_rect;
>  
>  	return 0;

-- 
Regards,

Laurent Pinchart
