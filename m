Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FE3524EDAD
	for <lists+linux-media@lfdr.de>; Sun, 23 Aug 2020 16:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbgHWOhq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Aug 2020 10:37:46 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53070 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbgHWOhq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Aug 2020 10:37:46 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C16F0279;
        Sun, 23 Aug 2020 16:37:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1598193458;
        bh=MqvfJpbE01OYlhK9TL0b32JwcaEFYBfN7ePQOamZ+xA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EuvkCnq5r1PB0+4uDhw/sP6QwEWC3ZUlFyC+kvLFHilYgWxca1iJ2HMYKPOwQb8Fh
         Ib9ww4ujgbxsZc7xPu6OQ+sU7Yudw7y1hf9H59Eq/5QtrTpOlF7cqTMsBT1+HtKL8u
         FaSdSAzr8vodoZiQG70PCsgwFrloUEJAL9LUbjwg=
Date:   Sun, 23 Aug 2020 17:37:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Adam Goode <agoode@google.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: uvcvideo: Ensure all probed info is returned
 to v4l2
Message-ID: <20200823143719.GB6002@pendragon.ideasonboard.com>
References: <20200823012134.3813457-1-agoode@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200823012134.3813457-1-agoode@google.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

Thank you for the patch.

On Sat, Aug 22, 2020 at 09:21:33PM -0400, Adam Goode wrote:
> bFrameIndex and bFormatIndex can be negotiated by the camera during
> probing, resulting in the camera choosing a different format than
> expected. v4l2 can already accommodate such changes, but the code was
> not updating the proper fields.
> 
> Without such a change, v4l2 would potentially interpret the payload
> incorrectly, causing corrupted output. This was happening on the
> Elgato HD60 S+, which currently always renegotiates to format 1.
> 
> As an aside, the Elgato firmware is buggy and should not be renegotating,
> but it is still a valid thing for the camera to do. Both macOS and Windows
> will properly probe and read uncorrupted images from this camera.
> 
> With this change, both qv4l2 and chromium can now read uncorrupted video
> from the Elgato HD60 S+.

Good catch. I've seen my share of buggy cameras, just not this
particular bug I suppose :-)

> Signed-off-by: Adam Goode <agoode@google.com>
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 0335e69b70ab..7f14096cb44d 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -247,11 +247,37 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
>  	if (ret < 0)
>  		goto done;
>  
> +	/* After the probe, update fmt with the values returned from
> +	 * negotiation with the device.
> +	 */
> +	for (i = 0; i < stream->nformats; ++i) {
> +		if (probe->bFormatIndex == stream->format[i].index) {
> +			format = &stream->format[i];
> +			break;
> +		}
> +	}
> +	if (i == stream->nformats) {
> +		uvc_trace(UVC_TRACE_FORMAT, "Unknown bFormatIndex %u.\n",
> +			  probe->bFormatIndex);
> +		return -EINVAL;
> +	}
> +	for (i = 0; i < format->nframes; ++i) {
> +		if (probe->bFrameIndex == format->frame[i].bFrameIndex) {
> +			frame = &format->frame[i];
> +			break;
> +		}
> +	}
> +	if (i == format->nframes) {
> +		uvc_trace(UVC_TRACE_FORMAT, "Unknown bFrameIndex %u.\n",
> +			  probe->bFrameIndex);
> +		return -EINVAL;
> +	}

This looks good to me. Blank lines between the different blocks would be
good to let the code breathe a little bit :-) Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

There's no need to resubmit the patch for such a trivial change, unless
you object, I'll add the blank lines locally.

I may submit an additional patch on top of this to share the above code
with the identical implementation in uvc_fixup_video_ctrl().

>  	fmt->fmt.pix.width = frame->wWidth;
>  	fmt->fmt.pix.height = frame->wHeight;
>  	fmt->fmt.pix.field = V4L2_FIELD_NONE;
>  	fmt->fmt.pix.bytesperline = uvc_v4l2_get_bytesperline(format, frame);
>  	fmt->fmt.pix.sizeimage = probe->dwMaxVideoFrameSize;
> +	fmt->fmt.pix.pixelformat = format->fcc;
>  	fmt->fmt.pix.colorspace = format->colorspace;
>  
>  	if (uvc_format != NULL)

-- 
Regards,

Laurent Pinchart
