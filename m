Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88CD63A3151
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 18:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231401AbhFJQuy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 12:50:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230134AbhFJQuy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 12:50:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13F09C061574;
        Thu, 10 Jun 2021 09:48:58 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8BA5C8D4;
        Thu, 10 Jun 2021 18:48:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623343736;
        bh=iXPjEJ+2DfrRz6SIzleO8bAKe2T2T92xhzAC8XNyuKs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TrQV2e8JAek5J8lppu/hb7Eu+6RklmiaRx7dPQ8npodeoMOzhT13j8DCTRojuUvuc
         A66zb8WLEom01IVAxjTnD04TPeiHrFe9nV4kWG3w+8/bkamSv9onrNBBQrzNbz/zX+
         MAPjzNgpZ81LrYDyQ/MF8ADIyU9nsqpR8z5qqiX4=
Date:   Thu, 10 Jun 2021 19:48:38 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Subject: Re: [PATCH v9 12/22] media: uvcvideo: Increase the size of
 UVC_METADATA_BUF_SIZE
Message-ID: <YMJCZiQyLV/BRwhp@pendragon.ideasonboard.com>
References: <20210326095840.364424-1-ribalda@chromium.org>
 <20210326095840.364424-13-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210326095840.364424-13-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Fri, Mar 26, 2021 at 10:58:30AM +0100, Ricardo Ribalda wrote:
> Hans has discovered that in his test device, for the H264 format
> bytesused goes up to about 570, for YUYV it will actually go up
> to a bit over 5000 bytes, and for MJPG up to about 2706 bytes.
> 
> We should also, according to V4L2_META_FMT_UVC docs, drop headers when
> the buffer is full.
> 
> Credit-to: Hans Verkuil <hverkuil@xs4all.nl>
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 8 +++++---
>  drivers/media/usb/uvc/uvcvideo.h  | 2 +-
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 25fd8aa23529..ea2903dc3252 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1244,11 +1244,13 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
>  	if (!meta_buf || length == 2)
>  		return;
>  
> +	/*
> +	 * According to V4L2_META_FMT_UVC docs, we should drop headers when
> +	 * the buffer is full.
> +	 */
>  	if (meta_buf->length - meta_buf->bytesused <
> -	    length + sizeof(meta->ns) + sizeof(meta->sof)) {
> -		meta_buf->error = 1;

Shouldn't you still set meta_buf->error to 1, even if you drop headers ?
Otherwise the application can't tell if headers have been dropped.

With this fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	    length + sizeof(meta->ns) + sizeof(meta->sof))
>  		return;
> -	}
>  
>  	has_pts = mem[1] & UVC_STREAM_PTS;
>  	has_scr = mem[1] & UVC_STREAM_SCR;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index b81d3f65e52e..a26bbec8d37b 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -527,7 +527,7 @@ struct uvc_stats_stream {
>  	unsigned int max_sof;		/* Maximum STC.SOF value */
>  };
>  
> -#define UVC_METADATA_BUF_SIZE 1024
> +#define UVC_METADATA_BUF_SIZE 10240
>  
>  /**
>   * struct uvc_copy_op: Context structure to schedule asynchronous memcpy

-- 
Regards,

Laurent Pinchart
