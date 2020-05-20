Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDAAE1DB490
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 15:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbgETNHZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 09:07:25 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:57709 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726435AbgETNHZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 09:07:25 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id bOREjbq85dPgTbORHjMclh; Wed, 20 May 2020 15:07:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1589980042; bh=rYS3eL4X6aw5M0pkKgGOVqaY9OT7/X7gkx5eI9SDVq4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=PRmVuI4dDLKTdCWyJ3fnxM+PQgO9D41hALUvt4jxGKKkwvcgAbMpJz0rvmMac/S9z
         uGuazWORDK0P/ZAyu1anDAW8McjKHfi0sgRq5jdYHwiAlY2rjIHz9g2sUz0ttkHwdd
         tYerv2gdaS7pjYqKsgupKOUpaldz98Fd1GsAFOEsr7vS7gc6sNbx3iqwQuJkuiyjxB
         3qR/+0TWrILMfCvAP1bskAwI++DDIFKAjL8iRbmpqvg+8WmHkFEzVtNY1d6XUgtB3t
         cKIzAo8UkGAvJ6IisUtwneeLsDxTUggWW7Q/N97XdD5Ej5ugVPFbitwnQVavw3SKUt
         P7NDZvCcGKDEQ==
Subject: Re: [PATCH v4 1/3] media: rkvdec: Fix .buf_prepare
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        gustavo.padovan@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20200518174011.15543-1-ezequiel@collabora.com>
 <20200518174011.15543-2-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <2c69a8d6-3402-15e8-1b19-49b8591ae1d8@xs4all.nl>
Date:   Wed, 20 May 2020 15:07:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200518174011.15543-2-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNvqZFKA72/EsLonoJeUejdO8KU4dUjjbTEntSsfRDJyM4Fy0SsUFVINMgvprIi+w7wIlbWQtX8x6c6Ll5Q8P4s0UDexWF8/r5UsPL4XnkC5l2GbF8ja
 7xgONG2aEx1/RzqPdh0tXuyeFW4gycq9xFvsuwAadwSmsvGpRc7CHoa/Gg1qof85YagOiPTCDYLeS3LMy8PX/36BePzHZInu/bVhFjQwRgGsT51qi9ffJwda
 r0s8xKc5WEn0ng17m4AuA6HrZS1+Vtxza9G2xmYE3WnkSDpKvk2H8MPaFCKxlFxW1/LELu1+K+5oDX1JwZBYTVuZIX616X3OL6tpvsq7GH/T99jYd9L5AjjA
 qeEe6FdrSGaQGlWTcIk9JywaiD6Xg5D0auCISdRYxxDjpCn3hwIF+HtiDWtuiY1AOZtVGiUhMVPs4aJzZoFmhTkP3LJXhEqjr4cSh49W8UjDLz6nocWObbJA
 2neiSlz6cxCVbFyNPIgGfoIYRkTQysutQKzmh3kmC5UKcYgCFgtgidioQo6ZejXEwhFnFXaNo/WUrbd+wq/6gG3GGmjSqOkT5+ZL1Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/05/2020 19:40, Ezequiel Garcia wrote:
> The driver should only set the payload on .buf_prepare
> if the buffer is CAPTURE type, or if an OUTPUT buffer
> has a zeroed payload.
> 
> Fix it.
> 
> Fixes: cd33c830448ba ("media: rkvdec: Add the rkvdec driver")
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/staging/media/rkvdec/rkvdec.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> index 225eeca73356..4df2a248ab96 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -456,7 +456,15 @@ static int rkvdec_buf_prepare(struct vb2_buffer *vb)
>  		if (vb2_plane_size(vb, i) < sizeimage)
>  			return -EINVAL;
>  	}
> -	vb2_set_plane_payload(vb, 0, f->fmt.pix_mp.plane_fmt[0].sizeimage);
> +
> +	/*
> +	 * Buffer's bytesused is written by the driver for CAPTURE buffers,
> +	 * or if the application passed zero bytesused on an OUTPUT buffer.
> +	 */
> +	if (!V4L2_TYPE_IS_OUTPUT(vq->type) ||
> +	    (V4L2_TYPE_IS_OUTPUT(vq->type) && !vb2_get_plane_payload(vb, 0)))
> +		vb2_set_plane_payload(vb, 0,
> +				      f->fmt.pix_mp.plane_fmt[0].sizeimage);

This should just be:

	if (!V4L2_TYPE_IS_OUTPUT(vq->type))
		vb2_set_plane_payload(vb, 0, f->fmt.pix_mp.plane_fmt[0].sizeimage);

If the application passes 0 as bytesused, then 1) a warning will be generated
by the v4l2 core and 2) the v4l2 core will set bytesused to the length of the
buffer. See vb2_fill_vb2_v4l2_buffer() in videobuf2-v4l2.c.

Some old drivers explicitly allow bytesused to be 0 for an output queue to
signal end-of-stream, but that's only supported if the allow_zero_bytesused
flag is set in the vb2_queue, and that shall not be used for new drivers
since it is deprecated functionality.

Regards,

	Hans

>  	return 0;
>  }
>  
> 

