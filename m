Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9363A1D3394
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 16:52:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727918AbgENOvI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 10:51:08 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60952 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726176AbgENOvH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 10:51:07 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nicolas)
        with ESMTPSA id AA0282A2B4B
Message-ID: <7cd2e6ba4da315ba61878db9e80a10cda8daeb12.camel@collabora.com>
Subject: Re: [PATCH v3 1/3] media: rkvdec: Fix .buf_prepare
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        gustavo.padovan@collabora.com
Date:   Thu, 14 May 2020 10:50:53 -0400
In-Reply-To: <20200505134110.3435-2-ezequiel@collabora.com>
References: <20200505134110.3435-1-ezequiel@collabora.com>
         <20200505134110.3435-2-ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.1 (3.36.1-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mardi 05 mai 2020 à 10:41 -0300, Ezequiel Garcia a écrit :
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
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c
> b/drivers/staging/media/rkvdec/rkvdec.c
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

I believe the spec lacks a bit of a clarification. Converting from 0 to
sizeimage should only be allowed for RAW images. So I would like to suggest to
change this fix into:

-	vb2_set_plane_payload(vb, 0, f->fmt.pix_mp.plane_fmt[0].sizeimage);
+
+	/* Buffer's bytesused is written by the driver for CAPTURE buffers */
+	if (!V4L2_TYPE_IS_OUTPUT(vq->type))
+		vb2_set_plane_payload(vb, 0,
+				      f->fmt.pix_mp.plane_fmt[0].sizeimage);

And then we can fix the spec accordingly. Note that neighter FFMPEG or GStreamer
will pass empty (zero sized) payload at the moment, and if it did, it would be a
bug, and the payload should instead be ignored.

>  	return 0;
>  }
>  
> -- 
> 2.26.0.rc2
> 
> 

