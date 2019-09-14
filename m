Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3471DB2B3D
	for <lists+linux-media@lfdr.de>; Sat, 14 Sep 2019 14:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388303AbfINMqT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Sep 2019 08:46:19 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388285AbfINMqS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Sep 2019 08:46:18 -0400
Received: from pendragon.ideasonboard.com (unknown [IPv6:2001:8a0:6be4:9301:a728:6099:33:a27c])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07AD323F;
        Sat, 14 Sep 2019 14:46:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1568465177;
        bh=kP78qeVzxj8IgqFihuf0gbCi+PoKLewsjvH2ZG/JaEA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p+1sJx9vO3i4y/tnABWlnx2LuFyam31NQADCy3rw4LGD2HyhiaISPCODgCw/jVv3/
         JnoeDYNjBVkLtNNjOA773d5/sWy9Fia1qeTMcFMMq78oDbu5NT0S9oBGLClVVHmIM5
         e57qnUVC9i+eZEFMWh9gc/VtiSZ1/6qS5178VEps=
Date:   Sat, 14 Sep 2019 15:46:09 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Fix a typo in UVC_METATADA_BUF_SIZE
Message-ID: <20190914124609.GE4734@pendragon.ideasonboard.com>
References: <20190724045612.29870-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190724045612.29870-1-christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Christophe,

Thank you for the patch.

On Wed, Jul 24, 2019 at 06:56:12AM +0200, Christophe JAILLET wrote:
> It is likely that it should be UVC_METADATA_BUF_SIZE instead.
> Fix it and use it.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Oops indeed. Applied to my tree for v5.5.

> ---
>  drivers/media/usb/uvc/uvc_metadata.c | 4 ++--
>  drivers/media/usb/uvc/uvc_queue.c    | 2 +-
>  drivers/media/usb/uvc/uvcvideo.h     | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
> index 99bb71b47117..b6279ad7ac84 100644
> --- a/drivers/media/usb/uvc/uvc_metadata.c
> +++ b/drivers/media/usb/uvc/uvc_metadata.c
> @@ -51,7 +51,7 @@ static int uvc_meta_v4l2_get_format(struct file *file, void *fh,
>  	memset(fmt, 0, sizeof(*fmt));
>  
>  	fmt->dataformat = stream->meta.format;
> -	fmt->buffersize = UVC_METATADA_BUF_SIZE;
> +	fmt->buffersize = UVC_METADATA_BUF_SIZE;
>  
>  	return 0;
>  }
> @@ -72,7 +72,7 @@ static int uvc_meta_v4l2_try_format(struct file *file, void *fh,
>  
>  	fmt->dataformat = fmeta == dev->info->meta_format
>  			? fmeta : V4L2_META_FMT_UVC;
> -	fmt->buffersize = UVC_METATADA_BUF_SIZE;
> +	fmt->buffersize = UVC_METADATA_BUF_SIZE;
>  
>  	return 0;
>  }
> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> index da72577c2998..cd60c6c1749e 100644
> --- a/drivers/media/usb/uvc/uvc_queue.c
> +++ b/drivers/media/usb/uvc/uvc_queue.c
> @@ -79,7 +79,7 @@ static int uvc_queue_setup(struct vb2_queue *vq,
>  
>  	switch (vq->type) {
>  	case V4L2_BUF_TYPE_META_CAPTURE:
> -		size = UVC_METATADA_BUF_SIZE;
> +		size = UVC_METADATA_BUF_SIZE;
>  		break;
>  
>  	default:
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index c7c1baa90dea..f773dc5d802c 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -491,7 +491,7 @@ struct uvc_stats_stream {
>  	unsigned int max_sof;		/* Maximum STC.SOF value */
>  };
>  
> -#define UVC_METATADA_BUF_SIZE 1024
> +#define UVC_METADATA_BUF_SIZE 1024
>  
>  /**
>   * struct uvc_copy_op: Context structure to schedule asynchronous memcpy

-- 
Regards,

Laurent Pinchart
