Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB0E22F2D4D
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 12:00:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729168AbhALK7X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 05:59:23 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:43652 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728408AbhALK7X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 05:59:23 -0500
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A64FB3E;
        Tue, 12 Jan 2021 11:58:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610449121;
        bh=CCfbuA+r2tIMrlA1E/LBA6v26EJY+NUVPeqpdub5tew=;
        h=Subject:To:Cc:References:From:Reply-To:Date:In-Reply-To:From;
        b=mavKWEhJ2IgFbc6cgxi6IW7rJdGPqpQzSOn8vvw+f3sJ5UB4qe7vTGdz4ucMBoRac
         2yZ0kIwHBe9pbWk5PflCHkxeqDvPC2o3iyxwuw7lAppW8avA5jx4Mgo7mYph4ifocM
         3Xtzz5jV4u1tQ1o7pF5Jixy51hIk5rpL0+ucbxxU=
Subject: Re: [PATCH 4/9] media: fdp1: Do not zero reserved fields
To:     Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20210111145445.28854-1-ribalda@chromium.org>
 <20210111145445.28854-5-ribalda@chromium.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
Organization: Ideas on Board
Message-ID: <c0f4e1ad-ffb9-5d0c-dfed-4c0772b2097b@ideasonboard.com>
Date:   Tue, 12 Jan 2021 10:58:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210111145445.28854-5-ribalda@chromium.org>
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
> Cc: linux-renesas-soc@vger.kernel.org
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

I love a good cleanup series.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/rcar_fdp1.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar_fdp1.c b/drivers/media/platform/rcar_fdp1.c
> index c9448de885b6..01c1fbb97bf6 100644
> --- a/drivers/media/platform/rcar_fdp1.c
> +++ b/drivers/media/platform/rcar_fdp1.c
> @@ -1439,8 +1439,6 @@ static void fdp1_compute_stride(struct v4l2_pix_format_mplane *pix,
>  		pix->plane_fmt[i].sizeimage = pix->plane_fmt[i].bytesperline
>  					    * pix->height / vsub;
>  
> -		memset(pix->plane_fmt[i].reserved, 0,
> -		       sizeof(pix->plane_fmt[i].reserved));
>  	}
>  
>  	if (fmt->num_planes == 3) {
> @@ -1448,8 +1446,6 @@ static void fdp1_compute_stride(struct v4l2_pix_format_mplane *pix,
>  		pix->plane_fmt[2].bytesperline = pix->plane_fmt[1].bytesperline;
>  		pix->plane_fmt[2].sizeimage = pix->plane_fmt[1].sizeimage;
>  
> -		memset(pix->plane_fmt[2].reserved, 0,
> -		       sizeof(pix->plane_fmt[2].reserved));
>  	}
>  }
>  
> 

