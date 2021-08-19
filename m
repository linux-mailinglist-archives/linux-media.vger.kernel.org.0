Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B295B3F2369
	for <lists+linux-media@lfdr.de>; Fri, 20 Aug 2021 00:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236290AbhHSWy6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Aug 2021 18:54:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33738 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236105AbhHSWy5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Aug 2021 18:54:57 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC1888C8;
        Fri, 20 Aug 2021 00:54:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1629413660;
        bh=xAUhN6JAP54QKHqCgBEGBibVSAggAfEoB5NaaIjrLvc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G3UX6EzYeb7s7JqF3iba3l6qhEJ12sQD0vM6H46sresMs+qdmXQYyHaO1bEXtX7jh
         1wOvgHwisNLyy4rGx+v7u1ZBPnpRneZ2T4brSERBSuGtc2SNBF/Xhk8iS/9Mx+c/0r
         kxJsVtSiLxxQORAS3RKUF3vuZ+tr1sVebY/jOEjU=
Date:   Fri, 20 Aug 2021 01:54:11 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Support borderline implementation of hw
 timestamping
Message-ID: <YR7hE+Q9n0qtdMqM@pendragon.ideasonboard.com>
References: <20210817161202.49560-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210817161202.49560-1-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Tue, Aug 17, 2021 at 06:12:02PM +0200, Ricardo Ribalda wrote:
> Some cameras do not set pts and src if there is no camera data in the
> buffer. They do this without clearing the PTS and SCR bits of the
> header. This is probably done due to a strict/borderline interpretation
> of the standard:
> 
> "STC must be captured when the first video data of a video frame is put
> on the USB bus."
> 
> Eg:
> buffer: 0xa7755c00 len 000012 header:0x8c stc 00000000 sof 0000 pts 00000000
> buffer: 0xa7755c00 len 000012 header:0x8c stc 00000000 sof 0000 pts 00000000
> buffer: 0xa7755c00 len 000668 header:0x8c stc 73779dba sof 070c pts 7376d37a
> 
> Support those cameras by only decoding the clock if there is camera data
> in the buffer.

Which cameras do you know to be affected ?

> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index e16464606b14..6d0e474671a2 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -490,6 +490,18 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>  	if (len < header_size)
>  		return;
>  
> +	/*
> +	 * Some cameras when there is no camera data in a buffer, do not
> +	 * handle properly the pts and scr. This can be due to an borderline
> +	 * interpretation of the standard: "STC must be captured when the
> +	 * first video data of a video frame is put on the USB bus."
> +	 * Due to their internal design, their firmware cannot clear the
> +	 * UVC_STREAM_PTS and UVC_STREAM_SCR bits. Which forces us to use the
> +	 * length of the buffer to decide if pts and scr are valid or not.
> +	 */
> +	if (len == header_size)
> +		return;
> +

Won't this prevent using timestamp data provided by cameras that behave
properly ?

>  	/* Extract the timestamps:
>  	 *
>  	 * - store the frame PTS in the buffer structure

-- 
Regards,

Laurent Pinchart
