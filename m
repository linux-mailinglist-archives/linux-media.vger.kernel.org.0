Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2900726A1AD
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 11:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgIOJHj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 05:07:39 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:34765 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726142AbgIOJHh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 05:07:37 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id I6vzk9pSoTSPzI6w0kShyV; Tue, 15 Sep 2020 11:07:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1600160853; bh=wwgZWe1k5L04vcWJJRmyzQwwC5HDOt9tNCdtKEKUfM4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=AvyVm+K9CZ3/f55Jz4WhHcI2RSUdCQ5nYp5KCh6Tt3y7V61WW8gCkKn732nfH556B
         mwmrlfwA1D+Utwa/q9AA386I4uEaQ56k1MP+HCe6e/KEGuZt93TszOY5ziZMq0YHHK
         n8mjLHY+5tpF9y5AW03c4p7l0avnPA8KwSCRnL4//Q3goMPCrHwbSMOiOHD4BwuruZ
         BJ/O9mEbCdjGI01IVS6DMJTa1S136jj+6XpBhGFFVbpgBjkratBoVA9JvDLLVxrkA3
         N8w/X9ZB7RpxbJ3ZsTlkUBxG3oo6R0iXzx/MrzB9S0S+xmRvx2IP4TS/DyddU5SFmC
         wReH6wsfwVXhw==
Subject: Re: [PATCH v2] media: rcar-vin: Update crop and compose settings for
 every s_fmt call
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
References: <20200913182140.32466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <b57b499a-b6d1-dfbb-29bb-5daa3fad5982@xs4all.nl>
Date:   Tue, 15 Sep 2020 11:07:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200913182140.32466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfL9AmPTSsKXQObvKm86FCv7Isd4OPiVUewhjHs1Gji1DbNPs5Cdk7aH7z8iPeuLuGJ9QRwUtmgoQ+7hIR1zKzZ0PYKWsDHMhp8uNWvPq4FtyfdQ5NLG0
 uxfMgMGMdgLllC9+C0twdYbRlPcIp465mZ/gh4OPVZ+VxH/yB7V8wafedZXC/g4vTW8IPWvQPBYuz+wciPuERij9DWGbaK+bZYkvJ1VpjDcaVBXBN/T/LoE6
 B+byNZGRvAt6MFnBmm5DX5IYrU4FYBQ01HGkDTDJ7SN+9zkuWVX+Kgars3VYLVontLMSMfQUP/pbGsbitRO6HZD5Uz/w1kaiHk6+AoG8pZvPzrZBWpBK703v
 koKXNCPH5XRX/GcyZ0Wu/xogrmL2VsZZzDnl/8mSo1Fb2U+URosdH2yRBQkYCGCwrOUxtU7Qd8WWZdxyl9tZ22Je1Al2eEleZY9ymqppp27sgsZHS89YHAtx
 ohiyqHMAh8QK/fgF1oVZEhYTONQm3KLiN4cYF2hRV9V7Sof21bxiqwlr/oY+xkS1HrP3YEhZbmEgy0tsUxBekiCEmGp6uSKDAtapkzTJsOUvgeoVj051TN3i
 oZbyNeXIZgDjv9J04B7sUb/Y7j6fzlBMQ3DjxITVcB8lsy2HFNqL+OLiu0/uNsbCL+dEMcJKKT5w+3TC+H7g5XRX3gVZSWZtT7o8zjo8MKVKZw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/09/2020 20:21, Lad Prabhakar wrote:
> The crop and compose settings for VIN in non mc mode werent updated
> in s_fmt call this resulted in captured images being clipped.
> 
> With the below sequence on the third capture where size is set to
> 640x480 resulted in clipped image of size 320x240.
> 
> high(640x480) -> low (320x240) -> high (640x480)
> 
> This patch makes sure the VIN crop and compose settings are updated.

I'm not sure the original behavior was wrong at all.

When calling S_FMT(320x240) it should force the crop and compose rectangles
into 320x240, but when calling S_FMT(640x480) the crop and compose rectangles
do not need to be modified and are kept. It is up to userspace to update those
crop/compose rectangles.

Calling S_FMT must, however, update the crop/compose bounds/default rectangles
where applicable.

Note that the crop coordinates are against the video source resolution, *not*
the format width/height. So this patch is definitely wrong in that respect.

Regards,

	Hans

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
> +	vin->crop.top = 0;
> +	vin->crop.left = 0;
> +	vin->crop.width = vin->format.width;
> +	vin->crop.height = vin->format.height;
> +	vin->compose = vin->crop;
>  	vin->src_rect = src_rect;
>  
>  	return 0;
> 

