Return-Path: <linux-media+bounces-21271-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D78039C4988
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 00:04:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12DE1B21577
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 23:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86A141AC884;
	Mon, 11 Nov 2024 23:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NoVOKfIq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EF0224FD
	for <linux-media@vger.kernel.org>; Mon, 11 Nov 2024 23:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731366284; cv=none; b=H9eVAZptTcU4ySiLrjYBijrMw94HqQYFuDRO3tdD8TpLa+y1TDQBSZ55rD6+OTcYyibfAni4j9O3NUPMnYuugLBq+l/klStv/XHyAc8x18l5QmAMryn5eGNppwFO2WSUvg39wAAOmlJiR23DmkugWw4te32S5UF3SmJJ5l88fLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731366284; c=relaxed/simple;
	bh=Z9+UbBReS1oAstA0rpArkzY0hooNg1jdMYM1X1JTIKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FTIHd/2nUiPJt0qSg+2Or8fJG1FdXnerBWnLFcjpwmuH2RpLHqFPtQvyySlh0NKriebXtMWqJClbWNcN8t8zI7URkHdSl1yIb6khGa/FgHkCYym2a6PnMcUj959F4FDMdRmrYf6Chzk7p1s9F3IxfwyqsSU9F1Jjd4XToVGN/bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NoVOKfIq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 76DB5316;
	Tue, 12 Nov 2024 00:04:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731366268;
	bh=Z9+UbBReS1oAstA0rpArkzY0hooNg1jdMYM1X1JTIKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NoVOKfIqMFvu+mZmjoAzxtX3Geyw/oA915ndaA13WznVo6u0aIAcS9Qo5qQSo69bO
	 wlC7FDCWeetu0aA+LP2KylecUaE0dCqZCCQmcnOR0JDmwOWGkJ5BjAJio6ariQWck+
	 smSHb4VAy2A/oOSb0yOAJ+AEp5bIPLBOAkd9WcCs=
Date: Tue, 12 Nov 2024 01:04:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v5 1/2] media: uvcvideo: Implement dual stream quirk to
 fix loss of usb packets
Message-ID: <20241111230432.GE17916@pendragon.ideasonboard.com>
References: <20241111173639.25131-1-isaac.scott@ideasonboard.com>
 <20241111173639.25131-2-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241111173639.25131-2-isaac.scott@ideasonboard.com>

Hi Isaac,

Thank you for the patch.

On Mon, Nov 11, 2024 at 05:36:38PM +0000, Isaac Scott wrote:
> Some cameras, such as the Sonix Technology Co. 292A exhibit issues when

Nitpicking, s/ exhibit/, exhibit/

> running two parallel streams, causing USB packets to be dropped when an
> H.264 stream posts a keyframe while an MJPEG stream is running
> simultaneously. This occasionally causes the driver to erroneously
> output two consecutive JPEG images as a single frame.
> 
> To fix this, we inspect the buffer, and trigger a new frame when we
> find an SOI.
> 
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 27 ++++++++++++++++++++++++++-
>  drivers/media/usb/uvc/uvcvideo.h  |  1 +
>  2 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index e00f38dd07d9..028f16dc189a 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -21,6 +21,7 @@
>  #include <linux/unaligned.h>
>  
>  #include <media/v4l2-common.h>
> +#include <media/jpeg.h>

Alphabetical order please. This helps avoiding duplicates in long lists
of includes as they can be spotted more easily.

>  
>  #include "uvcvideo.h"
>  
> @@ -1117,6 +1118,7 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>  		struct uvc_buffer *buf, const u8 *data, int len)
>  {
>  	u8 fid;
> +	u8 header_len;

The kernel has a tendency to roughly sort variables by decreasing line
length, and the uvcvideo driver follows that rule when nothing else
makes it impractical.

>  
>  	/*
>  	 * Sanity checks:
> @@ -1129,6 +1131,8 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>  		return -EINVAL;
>  	}
>  
> +	header_len = data[0];
> +

And I'd drop the blank line here.

>  	fid = data[1] & UVC_STREAM_FID;
>  
>  	/*
> @@ -1210,9 +1214,30 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>  		return -EAGAIN;
>  	}
>  
> +	/*
> +	 * Some cameras, when running two parallel streams (one MJPEG alongside
> +	 * another non-MJPEG stream), are known to lose the EOF packet for a frame.
> +	 * We can detect the end of a frame by checking for a new SOI marker, as
> +	 * the SOI always lies on the packet boundary between two frames.

I would add "for these devices" at the end of the sentence. I expect it
to be universally true, but we haven't checked.

> +	 */
> +	if ((stream->dev->quirks & UVC_QUIRK_MJPEG_NO_EOF) &&
> +	    (stream->cur_format->fcc == V4L2_PIX_FMT_MJPEG ||
> +	     stream->cur_format->fcc == V4L2_PIX_FMT_JPEG)) {
> +		const u8 *packet = ((const u8 *)data) + header_len;

No need for the outer parentheses.

> +
> +		if (len - header_len > 2 &&

I would have written

		if (len > header_len + 2 &&

and shouldn't it actually be

		if (len >= header_len + 2 &&

?

> +		    packet[0] == 0xff && packet[1] == JPEG_MARKER_SOI &&
> +		    buf->bytesused != 0) {
> +			buf->state = UVC_BUF_STATE_READY;
> +			buf->error = 1;
> +			stream->last_fid ^= UVC_STREAM_FID;
> +			return -EAGAIN;
> +		}
> +	}
> +
>  	stream->last_fid = fid;
>  
> -	return data[0];
> +	return header_len;
>  }
>  
>  static inline enum dma_data_direction uvc_stream_dir(
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index b7d24a853ce4..116b1e383c25 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -76,6 +76,7 @@
>  #define UVC_QUIRK_NO_RESET_RESUME	0x00004000
>  #define UVC_QUIRK_DISABLE_AUTOSUSPEND	0x00008000
>  #define UVC_QUIRK_INVALID_DEVICE_SOF	0x00010000
> +#define UVC_QUIRK_MJPEG_NO_EOF          0x00020000

Please use tabs for indentation, like in the previous lines.

>  
>  /* Format flags */
>  #define UVC_FMT_FLAG_COMPRESSED		0x00000001

-- 
Regards,

Laurent Pinchart

