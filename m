Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C90F533EF0B
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 12:02:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231217AbhCQLCK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 07:02:10 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:60465 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231182AbhCQLBo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 07:01:44 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id MTvnlAI5vGEYcMTvqlNDOV; Wed, 17 Mar 2021 12:01:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615978902; bh=Ml7yWiRnEU9Qi8mrPLCFfRMAvMoeAP/r67JD0AsEGao=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=M0nxtMh07R/KPRfkp0WfG3gd74jFKUquRDuw7n+qjvxh8mwO92Wmvyoh6ftxAHPX0
         vOQ0m0Y0tHUs3nPv/bC2Q9vHr1rQkH8A8ADdN/XSAkKUZFexlaUbuvusr/xfs22rj7
         t2In7AFzdm/48jgxAH79VtLA0EqD6pCrp5108gIrOystq/t8l2LrexouU1ck2D4zlx
         Pxfru/9K8sUVIM9ZUm3K0f9DlRQYtNJsZwq+Tl2XX0vV6fMbwCi6ioFxDWfz+Ppteh
         sCJc0tmIWw0BuXoP92HsQEIJGP/0EyX6NY9tbVRfBsaEGUVwR/0Gs6XvSBZhFhBZ/P
         Un5xz/hOpY3kw==
Subject: Re: [PATCH v5 09/13] media: uvcvideo: Increase the size of
 UVC_METADATA_BUF_SIZE
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
References: <20210316180004.1605727-1-ribalda@chromium.org>
 <20210316180004.1605727-10-ribalda@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <944ff35a-799d-63f4-46f3-458d69863830@xs4all.nl>
Date:   Wed, 17 Mar 2021 12:01:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210316180004.1605727-10-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfG72MBNiJ29w33XLXDH2CDm9sfkLjlbOFI9cFdh7FC32V26NR6XTfv63yxY3PdWwlGKhipVnKbIVTliOsJGtrzZqivY/MetHxStHqRwAUNbU8gqm/QBI
 W8pxZGmJuR9ge729V+KWzgKiilFpI3R41pVOySWduoY65kJxcmGik4yrzPWz6AEjCKuLevCgFRZ/kOvuYFrkzt4LiC6KEqLnNBRA/75/URdVKcjLKCM98FyP
 QnANXdCuu571dkbeupL9rx8QBgwPwVIQ7X7bBbL7xgOYieooy6SHCeZHGvVD0OlI8FtM8r6IDl+hlknxe/n3q2bKWt6+ATuj7TfEbWV0yc1Z3gDE7XUzDZGm
 BlyCovRTsfZ12zLXZGZIaTjut3UHMZjxYqBSArwPa/XRfI8EVAEbZ2XoA9h+WnTeuG6PdK/e
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/03/2021 18:59, Ricardo Ribalda wrote:
> Hans has discovered that in his test device, for the H264 format
> bytesused goes up to about 570, for YUYV it will actually go up
> to a bit over 5000 bytes, and for MJPG up to about 2706 bytes.
> 
> We should also, according to V4L2_META_FMT_UVC docs, drop headers when
> the buffer is full.
> 
> Credit-to: Hans Verkuil <hverkuil@xs4all.nl>
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
> 

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

	Hans
