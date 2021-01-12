Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2700E2F2E7C
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 12:56:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731528AbhALL43 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 06:56:29 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:44016 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731536AbhALL43 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 06:56:29 -0500
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC3303E;
        Tue, 12 Jan 2021 12:55:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610452547;
        bh=15o9LNj++cvNqtYnSGof1icr+FMTKgQsxkcy2K4WwQI=;
        h=Subject:To:Cc:References:From:Reply-To:Date:In-Reply-To:From;
        b=QjcZGqtnQET9tXjsMemK2qN80c2hEdWwmK1X/L4mCrlTepiDVLIqB+oFXiYsSiqMU
         2PahSIiAih/63P/DUTuH0GcIMzbqh/+9OYwU2S7+C35hJBJo/S0ptQzPbO7yriPqYg
         xZBkuSND/SZlCwA2lAAnPxfrdCwlPV9GDnvwhnN8=
Subject: Re: [PATCH 9/9] media: staging/intel-ipu3 : Do not zero reserved
 fields
To:     Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20210111145445.28854-1-ribalda@chromium.org>
 <20210111145445.28854-10-ribalda@chromium.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
Organization: Ideas on Board
Message-ID: <6e0b0d9d-24cc-67ec-35d9-6676f0714bfb@ideasonboard.com>
Date:   Tue, 12 Jan 2021 11:55:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210111145445.28854-10-ribalda@chromium.org>
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
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/staging/media/ipu3/ipu3-v4l2.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
> index 4dc8d9165f63..60aa02eb7d2a 100644
> --- a/drivers/staging/media/ipu3/ipu3-v4l2.c
> +++ b/drivers/staging/media/ipu3/ipu3-v4l2.c

The ipu3-css.c also has a memset on the plane formats in the
migu_css_queue_init(), but that's possibly still out of scope for this
patch ('just')

        struct v4l2_pix_format_mplane *const f = &queue->fmt.mpix;
        memset(f->reserved, 0, sizeof(f->reserved));

I can't yet see anything that clears the reserved formats on queue
initialisations, so I don't think we can remove that yet unless I've
missed something anyway.

Seems like there is a lot more that could be cleared in core ...

But - as I said, I think that's out of scope here so

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> @@ -773,9 +773,6 @@ static int imgu_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
>  
>  	pixm->pixelformat = fmt->fourcc;
>  
> -	memset(pixm->plane_fmt[0].reserved, 0,
> -	       sizeof(pixm->plane_fmt[0].reserved));
> -
>  	return 0;
>  }
>  
> 

