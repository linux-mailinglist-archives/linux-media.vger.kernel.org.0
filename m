Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DBD32F2DA8
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 12:15:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbhALLNW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 06:13:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726377AbhALLNV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 06:13:21 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9543AC061575;
        Tue, 12 Jan 2021 03:12:41 -0800 (PST)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8AE1E58E;
        Tue, 12 Jan 2021 12:12:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610449958;
        bh=nxwVkILG5Muy2w73FYXJgibdri3T1ViT49g+RDYx6n8=;
        h=Subject:To:Cc:References:From:Reply-To:Date:In-Reply-To:From;
        b=d5d1EzrZcpROge3DrlgyGK3t2qOv8nQitkRk7H16/oYPWYm+wDnHRn/addvIYB2jh
         93yMO/2uhZpiuoV3A3n2SSXRc5NvGJDezPOVwj9HYkLq+3cWCLRzoNFBtyBO6PpbZc
         k2uZRyurgWhb6j/vG+6XSztASqjR9d3L6sf+gRwg=
Subject: Re: [PATCH 7/9] media: ti-vpe: Do not zero reserved fields
To:     Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Benoit Parrot <bparrot@ti.com>
References: <20210111145445.28854-1-ribalda@chromium.org>
 <20210111145445.28854-8-ribalda@chromium.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
Organization: Ideas on Board
Message-ID: <4dce6a1a-f4dc-53b4-7e87-7066936fd2d0@ideasonboard.com>
Date:   Tue, 12 Jan 2021 11:12:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210111145445.28854-8-ribalda@chromium.org>
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


Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Cc: Benoit Parrot <bparrot@ti.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/ti-vpe/vpe.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
> index 779dd74b82d0..10251b787674 100644
> --- a/drivers/media/platform/ti-vpe/vpe.c
> +++ b/drivers/media/platform/ti-vpe/vpe.c
> @@ -1683,7 +1683,6 @@ static int __vpe_try_fmt(struct vpe_ctx *ctx, struct v4l2_format *f,
>  		}
>  	}
>  
> -	memset(pix->reserved, 0, sizeof(pix->reserved));
>  	for (i = 0; i < pix->num_planes; i++) {
>  		plane_fmt = &pix->plane_fmt[i];
>  		depth = fmt->vpdma_fmt[i]->depth;
> @@ -1713,7 +1712,6 @@ static int __vpe_try_fmt(struct vpe_ctx *ctx, struct v4l2_format *f,
>  					       plane_fmt->bytesperline *
>  					       depth) >> 3;
>  		}
> -		memset(plane_fmt->reserved, 0, sizeof(plane_fmt->reserved));
>  	}
>  
>  	return 0;
> 

