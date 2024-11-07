Return-Path: <linux-media+bounces-21076-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E41AE9C0BEE
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 17:46:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EA441F217D5
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 16:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE065215C7F;
	Thu,  7 Nov 2024 16:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FKdXyaNg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4C32629C
	for <linux-media@vger.kernel.org>; Thu,  7 Nov 2024 16:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730997967; cv=none; b=c44zmu8y3XJIFr/+SccoVMV9CbEYTl701AWAGdDjfU8q2loCGL3a4hV9jOCv3tWArRa6IBhmNMs+f3Xz2fIKBlFGqlftKthrXrHzR0wkA5pkcjVt7U0tWvP8mF1PpOkFOprbrFZIAzrHCzJ1vAgYFyn3Lod2IGCap4SjlkTBAa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730997967; c=relaxed/simple;
	bh=1bKUJIAsNAhBguZwcSeS+A79vHfWOH9baTmYZFRBqpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QXKAFTGeXNV37aDcI/XOqTNeM4hwVq1gCOfh6LNwZK7X0jOTztUMVO1VbYUg+PIeu+8UUhzvM2uCMQEO+LitAhJTVayoDkUqI6WIGNKVjuVnvs89DKK6UagVJVomoel7jNyxH4ue/lhuxcR30hxN8siw01DNeMIYw2/SlWbqSBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FKdXyaNg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D23874C;
	Thu,  7 Nov 2024 17:45:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730997953;
	bh=1bKUJIAsNAhBguZwcSeS+A79vHfWOH9baTmYZFRBqpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FKdXyaNgIBqc9prExDnLUegcpubGSaSFac7Eq9v3bAkYn/Tuvps/94l0yqGrornfY
	 uAuCgyL4X33afxjfyX11X/4GInO3kKYQkwWOwNSWyFn2Acns+niOLxJtv8sXcxtphM
	 a0CwC3/IFK6upg8GPEPrOqAtJ9jkNcuPrLVDPMDc=
Date: Thu, 7 Nov 2024 18:45:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Benoit Sevens <bsevens@google.com>
Cc: linux-media@vger.kernel.org, gregkh@linuxfoundation.org,
	stable@kernel.org
Subject: Re: [PATCH v1 2/2] media: uvcvideo: Refactor frame parsing code into
 a uvc_parse_frame function
Message-ID: <20241107164556.GE31474@pendragon.ideasonboard.com>
References: <20241107142204.1182969-1-bsevens@google.com>
 <20241107142204.1182969-3-bsevens@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241107142204.1182969-3-bsevens@google.com>

Hi Benoît,

Thank you for the patch.

On Thu, Nov 07, 2024 at 02:22:03PM +0000, Benoit Sevens wrote:
> The ftype value does not change in the while loop so we can check it
> before entering the while loop. Refactoring the frame parsing code into
> a dedicated uvc_parse_frame function makes this more readable.
> 
> Signed-off-by: Benoit Sevens <bsevens@google.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 228 ++++++++++++++++-------------
>  1 file changed, 123 insertions(+), 105 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 13db0026dc1a..99f811ace5d6 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -220,6 +220,117 @@ static struct uvc_streaming *uvc_stream_new(struct uvc_device *dev,
>   * Descriptors parsing
>   */
>  
> +static int uvc_parse_frame(struct uvc_device *dev, struct uvc_streaming *streaming,
> +		struct uvc_format *format, struct uvc_frame *frame, u32 **intervals,
> +		u8 ftype, int width_multiplier, const unsigned char *buffer, int buflen)
> +{
> +	struct usb_interface *intf = streaming->intf;
> +	struct usb_host_interface *alts = intf->cur_altsetting;

The intf variable is only used here, so you can write

	struct usb_host_interface *alts = streaming->intf->cur_altsetting;

> +	unsigned int i, n;
> +	unsigned int interval;
> +	unsigned int maxIntervalIndex;

We usually sort variables in (more or less) decreasing line length order
if nothing makes that inpractical.

> +
> +	if (ftype != UVC_VS_FRAME_FRAME_BASED)
> +		n = buflen > 25 ? buffer[25] : 0;
> +	else
> +		n = buflen > 21 ? buffer[21] : 0;
> +
> +	n = n ? n : 3;
> +
> +	if (buflen < 26 + 4*n) {
> +		uvc_dbg(dev, DESCR,
> +			"device %d videostreaming interface %d FRAME error\n",
> +			dev->udev->devnum,
> +			alts->desc.bInterfaceNumber);

We can now reflow the code as the indentation level has decreased, for instance

			dev->udev->devnum, alts->desc.bInterfaceNumber);

> +		return -EINVAL;
> +	}
> +
> +	frame->bFrameIndex = buffer[3];
> +	frame->bmCapabilities = buffer[4];
> +	frame->wWidth = get_unaligned_le16(&buffer[5])
> +		      * width_multiplier;
> +	frame->wHeight = get_unaligned_le16(&buffer[7]);
> +	frame->dwMinBitRate = get_unaligned_le32(&buffer[9]);
> +	frame->dwMaxBitRate = get_unaligned_le32(&buffer[13]);
> +	if (ftype != UVC_VS_FRAME_FRAME_BASED) {
> +		frame->dwMaxVideoFrameBufferSize =
> +			get_unaligned_le32(&buffer[17]);
> +		frame->dwDefaultFrameInterval =
> +			get_unaligned_le32(&buffer[21]);
> +		frame->bFrameIntervalType = buffer[25];
> +	} else {
> +		frame->dwMaxVideoFrameBufferSize = 0;
> +		frame->dwDefaultFrameInterval =
> +			get_unaligned_le32(&buffer[17]);
> +		frame->bFrameIntervalType = buffer[21];
> +	}
> +
> +	/*
> +	 * Copy the frame intervals.
> +	 *
> +	 * Some bogus devices report dwMinFrameInterval equal to
> +	 * dwMaxFrameInterval and have dwFrameIntervalStep set to
> +	 * zero. Setting all null intervals to 1 fixes the problem and
> +	 * some other divisions by zero that could happen.
> +	 */
> +	frame->dwFrameInterval = *intervals;
> +
> +	for (i = 0; i < n; ++i) {
> +		interval = get_unaligned_le32(&buffer[26+4*i]);
> +		(*intervals)[i] = interval ? interval : 1;
> +	}
> +
> +	/*
> +	 * Apply more fixes, quirks and workarounds to handle incorrect
> +	 * or broken descriptors.
> +	 */
> +
> +	/*
> +	 * Several UVC chipsets screw up dwMaxVideoFrameBufferSize
> +	 * completely. Observed behaviours range from setting the
> +	 * value to 1.1x the actual frame size to hardwiring the
> +	 * 16 low bits to 0. This results in a higher than necessary
> +	 * memory usage as well as a wrong image size information. For
> +	 * uncompressed formats this can be fixed by computing the
> +	 * value from the frame size.
> +	 */
> +	if (!(format->flags & UVC_FMT_FLAG_COMPRESSED))
> +		frame->dwMaxVideoFrameBufferSize = format->bpp
> +			* frame->wWidth * frame->wHeight / 8;
> +
> +	/*
> +	 * Clamp the default frame interval to the boundaries. A zero
> +	 * bFrameIntervalType value indicates a continuous frame
> +	 * interval range, with dwFrameInterval[0] storing the minimum
> +	 * value and dwFrameInterval[1] storing the maximum value.
> +	 */
> +	maxIntervalIndex = frame->bFrameIntervalType ? n - 1 : 1;
> +	frame->dwDefaultFrameInterval =
> +		clamp(frame->dwDefaultFrameInterval,
> +		      frame->dwFrameInterval[0],
> +		      frame->dwFrameInterval[maxIntervalIndex]);
> +
> +	/*
> +	 * Some devices report frame intervals that are not functional.
> +	 * If the corresponding quirk is set, restrict operation to the
> +	 * first interval only.
> +	 */
> +	if (dev->quirks & UVC_QUIRK_RESTRICT_FRAME_RATE) {
> +		frame->bFrameIntervalType = 1;
> +		(*intervals)[0] = frame->dwDefaultFrameInterval;
> +	}
> +
> +	uvc_dbg(dev, DESCR, "- %ux%u (%u.%u fps)\n",
> +		frame->wWidth, frame->wHeight,
> +		10000000 / frame->dwDefaultFrameInterval,
> +		(100000000 / frame->dwDefaultFrameInterval) % 10);
> +
> +	*intervals += n;
> +
> +	return buffer[0];
> +}
> +
> +
>  static int uvc_parse_format(struct uvc_device *dev,
>  	struct uvc_streaming *streaming, struct uvc_format *format,
>  	struct uvc_frame *frames, u32 **intervals, const unsigned char *buffer,
> @@ -231,9 +342,9 @@ static int uvc_parse_format(struct uvc_device *dev,

While at it, we can also merge the intf and alts variables here too.

With this addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I can make all those small changes locally when applying the patch,
unless you prefer submitting a new version yourself.

>  	struct uvc_frame *frame;
>  	const unsigned char *start = buffer;
>  	unsigned int width_multiplier = 1;
> -	unsigned int interval;
>  	unsigned int i, n;
>  	u8 ftype;
> +	int ret;
>  
>  	format->type = buffer[2];
>  	format->index = buffer[3];
> @@ -371,111 +482,18 @@ static int uvc_parse_format(struct uvc_device *dev,
>  	 * Parse the frame descriptors. Only uncompressed, MJPEG and frame
>  	 * based formats have frame descriptors.
>  	 */
> -	while (ftype && buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE &&
> -	       buffer[2] == ftype) {
> -		unsigned int maxIntervalIndex;
> -
> -		frame = &frames[format->nframes];
> -		if (ftype != UVC_VS_FRAME_FRAME_BASED)
> -			n = buflen > 25 ? buffer[25] : 0;
> -		else
> -			n = buflen > 21 ? buffer[21] : 0;
> -
> -		n = n ? n : 3;
> -
> -		if (buflen < 26 + 4*n) {
> -			uvc_dbg(dev, DESCR,
> -				"device %d videostreaming interface %d FRAME error\n",
> -				dev->udev->devnum,
> -				alts->desc.bInterfaceNumber);
> -			return -EINVAL;
> -		}
> -
> -		frame->bFrameIndex = buffer[3];
> -		frame->bmCapabilities = buffer[4];
> -		frame->wWidth = get_unaligned_le16(&buffer[5])
> -			      * width_multiplier;
> -		frame->wHeight = get_unaligned_le16(&buffer[7]);
> -		frame->dwMinBitRate = get_unaligned_le32(&buffer[9]);
> -		frame->dwMaxBitRate = get_unaligned_le32(&buffer[13]);
> -		if (ftype != UVC_VS_FRAME_FRAME_BASED) {
> -			frame->dwMaxVideoFrameBufferSize =
> -				get_unaligned_le32(&buffer[17]);
> -			frame->dwDefaultFrameInterval =
> -				get_unaligned_le32(&buffer[21]);
> -			frame->bFrameIntervalType = buffer[25];
> -		} else {
> -			frame->dwMaxVideoFrameBufferSize = 0;
> -			frame->dwDefaultFrameInterval =
> -				get_unaligned_le32(&buffer[17]);
> -			frame->bFrameIntervalType = buffer[21];
> -		}
> -
> -		/*
> -		 * Copy the frame intervals.
> -		 *
> -		 * Some bogus devices report dwMinFrameInterval equal to
> -		 * dwMaxFrameInterval and have dwFrameIntervalStep set to
> -		 * zero. Setting all null intervals to 1 fixes the problem and
> -		 * some other divisions by zero that could happen.
> -		 */
> -		frame->dwFrameInterval = *intervals;
> -
> -		for (i = 0; i < n; ++i) {
> -			interval = get_unaligned_le32(&buffer[26+4*i]);
> -			(*intervals)[i] = interval ? interval : 1;
> -		}
> -
> -		/*
> -		 * Apply more fixes, quirks and workarounds to handle incorrect
> -		 * or broken descriptors.
> -		 */
> -
> -		/*
> -		 * Several UVC chipsets screw up dwMaxVideoFrameBufferSize
> -		 * completely. Observed behaviours range from setting the
> -		 * value to 1.1x the actual frame size to hardwiring the
> -		 * 16 low bits to 0. This results in a higher than necessary
> -		 * memory usage as well as a wrong image size information. For
> -		 * uncompressed formats this can be fixed by computing the
> -		 * value from the frame size.
> -		 */
> -		if (!(format->flags & UVC_FMT_FLAG_COMPRESSED))
> -			frame->dwMaxVideoFrameBufferSize = format->bpp
> -				* frame->wWidth * frame->wHeight / 8;
> -
> -		/*
> -		 * Clamp the default frame interval to the boundaries. A zero
> -		 * bFrameIntervalType value indicates a continuous frame
> -		 * interval range, with dwFrameInterval[0] storing the minimum
> -		 * value and dwFrameInterval[1] storing the maximum value.
> -		 */
> -		maxIntervalIndex = frame->bFrameIntervalType ? n - 1 : 1;
> -		frame->dwDefaultFrameInterval =
> -			clamp(frame->dwDefaultFrameInterval,
> -			      frame->dwFrameInterval[0],
> -			      frame->dwFrameInterval[maxIntervalIndex]);
> -
> -		/*
> -		 * Some devices report frame intervals that are not functional.
> -		 * If the corresponding quirk is set, restrict operation to the
> -		 * first interval only.
> -		 */
> -		if (dev->quirks & UVC_QUIRK_RESTRICT_FRAME_RATE) {
> -			frame->bFrameIntervalType = 1;
> -			(*intervals)[0] = frame->dwDefaultFrameInterval;
> +	if (ftype) {
> +		while (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE &&
> +		       buffer[2] == ftype) {
> +			frame = &frames[format->nframes];
> +			ret = uvc_parse_frame(dev, streaming, format, frame, intervals, ftype,
> +					width_multiplier, buffer, buflen);
> +			if (ret < 0)
> +				return ret;
> +			format->nframes++;
> +			buflen -= ret;
> +			buffer += ret;
>  		}
> -
> -		uvc_dbg(dev, DESCR, "- %ux%u (%u.%u fps)\n",
> -			frame->wWidth, frame->wHeight,
> -			10000000 / frame->dwDefaultFrameInterval,
> -			(100000000 / frame->dwDefaultFrameInterval) % 10);
> -
> -		format->nframes++;
> -		*intervals += n;
> -
> -		buflen -= buffer[0];
> -		buffer += buffer[0];
>  	}
>  
>  	if (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE &&

-- 
Regards,

Laurent Pinchart

