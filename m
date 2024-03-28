Return-Path: <linux-media+bounces-7553-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D32AC8863F2
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 00:26:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83A80282C81
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 23:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2319918E1C;
	Thu, 21 Mar 2024 23:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rcRepmnR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264CA1DDDB;
	Thu, 21 Mar 2024 23:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711063570; cv=none; b=S8DsgLTh5f6u2tEN2fxtTu0SaIXWgDk0E5D3bOxp/arEQ2cm1XrcEpxzeUY8FKH8CwjubXUzHZRhdTG9EHKjocKlwuGf+p9ZuKa8dsQdD+0L2T3nRr3zsW+E5b+N96nLEUUAJwCUtYk037yh50JO/ewxWB3d402NXYC3Sf8UiVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711063570; c=relaxed/simple;
	bh=3KBGSt6cm+qaKbV7hCN0JSvc0+HfMUKkLo3PQJRhIhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SdOVe45MZX9EpcoycnUKCn6SG0kAq2WlbnhPeN4pzzKS7aqNPuHLclSxRipe0i7YRoHyOWDC+0ucwvrBSipkAdDOcFZvT6yw7oQALqWaOeD1J8XyYUMptgpwkITz71u6gVYG8xYS1e/AX1bs1lGTeLrlsYLzxHzf6lpDYj1fGMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rcRepmnR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B6DE9BEB;
	Fri, 22 Mar 2024 00:25:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711063537;
	bh=3KBGSt6cm+qaKbV7hCN0JSvc0+HfMUKkLo3PQJRhIhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rcRepmnR/T4wylZr/fFyBEq33fygp/rAdga1NPXpof+JlSIcrpQRWmv0U2xLgm5wR
	 i6FtKDtJkuUrgfLDLN16O0IB5IKucgY9v0vA2026/aGdjWEZsSbSfzKmPI7ESV2g8V
	 zp3Vx/0ihZThWhLI+XEIXhCdL684saiTvDDVKeJ0=
Date: Fri, 22 Mar 2024 01:26:02 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org, "hn.chen" <hn.chen@sunplusit.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v9 2/6] media: uvcvideo: Ignore empty TS packets
Message-ID: <20240321232602.GB20938@pendragon.ideasonboard.com>
References: <20220920-resend-hwtimestamp-v9-0-55a89f46f6be@chromium.org>
 <20220920-resend-hwtimestamp-v9-2-55a89f46f6be@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220920-resend-hwtimestamp-v9-2-55a89f46f6be@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Wed, Mar 15, 2023 at 02:30:13PM +0100, Ricardo Ribalda wrote:
> Some SunplusIT cameras took a borderline interpretation of the UVC 1.5
> standard, and fill the PTS and SCR fields with invalid data if the
> package does not contain data.
> 
> "STC must be captured when the first video data of a video frame is put
> on the USB bus."
> 
> Eg:

"Some SunplusIT devices send, e.g.,"

> 
> buffer: 0xa7755c00 len 000012 header:0x8c stc 00000000 sof 0000 pts 00000000
> buffer: 0xa7755c00 len 000012 header:0x8c stc 00000000 sof 0000 pts 00000000
> buffer: 0xa7755c00 len 000668 header:0x8c stc 73779dba sof 070c pts 7376d37a

"while the UVC specification meant that the first two packets shouldn't
have had the SCR bit set in the header."

> 
> This borderline/buggy interpretation has been implemented in a variety
> of devices, from directly SunplusIT and from other OEMs that rebrand
> SunplusIT products. So quirking based on VID:PID will be problematic.
> 
> All the affected modules have the following extension unit:
> VideoControl Interface Descriptor:
>   guidExtensionCode         {82066163-7050-ab49-b8cc-b3855e8d221d}
> 
> But the vendor plans to use that GUID in the future and fix the bug,
> this means that we should use heuristic to figure out the broken
> packets.

Because it would have been too easy otherwise of course :-)

> 
> This patch takes care of this.
> 
> lsusb of one of the affected cameras:
> 
> Bus 001 Device 003: ID 1bcf:2a01 Sunplus Innovation Technology Inc.
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.01
>   bDeviceClass          239 Miscellaneous Device
>   bDeviceSubClass         2 ?
>   bDeviceProtocol         1 Interface Association
>   bMaxPacketSize0        64
>   idVendor           0x1bcf Sunplus Innovation Technology Inc.
>   idProduct          0x2a01
>   bcdDevice            0.02
>   iManufacturer           1 SunplusIT Inc
>   iProduct                2 HanChen Wise Camera
>   iSerial                 3 01.00.00
>   bNumConfigurations      1
> 
> Tested-by: HungNien Chen <hn.chen@sunplusit.com>
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 4ff4ab4471fe..1f416c494acc 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -478,6 +478,7 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>  	ktime_t time;
>  	u16 host_sof;
>  	u16 dev_sof;
> +	u32 dev_stc;
>  
>  	switch (data[1] & (UVC_STREAM_PTS | UVC_STREAM_SCR)) {
>  	case UVC_STREAM_PTS | UVC_STREAM_SCR:
> @@ -526,6 +527,23 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>  	if (dev_sof == stream->clock.last_sof)
>  		return;
>  
> +	dev_stc = get_unaligned_le32(&data[header_size - 6]);
> +
> +	/*
> +	 * STC (Source Time Clock) is the clock used by the camera. The UVC 1.5
> +	 * standard states that it "must be captured when the first video data
> +	 * of a video frame is put on the USB bus".
> +	 * Most of the vendors, clear the `UVC_STREAM_SCR` bit when the data is
> +	 * not valid, other vendors always set the `UVC_STREAM_SCR` bit and
> +	 * expect that the driver only samples the stc if there is data on the
> +	 * packet.
> +	 * Ignore all the hardware timestamp information if there is no data
> +	 * and stc and sof are zero.
> +	 */

I'd like to expand this a bit (partly to make sure I understand the
issue correctly):

        /*
         * STC (Source Time Clock) is the clock used by the camera. The UVC 1.5
         * standard states that it "must be captured when the first video data
         * of a video frame is put on the USB bus". This is generally understood
         * as requiring devices to clear the payload header's SCR bit before
         * the first packet containing video data.
         *
         * Most vendors follow that interpretation, but some (namely SunplusIT)
         * always set the `UVC_STREAM_SCR` bit, fill the SCR field with 0's,
         * and expect that the driver only processes the SCR if there is data in
         * the packet.
         *
         * Ignore all the hardware timestamp information if we haven't received
         * any data for this frame yet, the packet contains no data, and both
         * STC and SOF are zero. This heuristics should be safe on compliant
         * devices. This should be safe with compliant devices, as in the very
         * unlikely case where a UVC 1.1 device would send timing information
         * only before the first packet containing data, and both STC and SOF
         * happen to be zero for a particular frame, we would only miss one
         * clock sample and the clock recovery algorithm wouldn't suffer from
         * this condition.
         */

Is this correct (and fine with you) ? If so,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	if (buf && buf->bytesused == 0 && len == header_size &&
> +	    dev_stc == 0 && dev_sof == 0)
> +		return;
> +
>  	stream->clock.last_sof = dev_sof;
>  
>  	host_sof = usb_get_current_frame_number(stream->dev->udev);
> @@ -564,7 +582,7 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>  	spin_lock_irqsave(&stream->clock.lock, flags);
>  
>  	sample = &stream->clock.samples[stream->clock.head];
> -	sample->dev_stc = get_unaligned_le32(&data[header_size - 6]);
> +	sample->dev_stc = dev_stc;
>  	sample->dev_sof = dev_sof;
>  	sample->host_sof = host_sof;
>  	sample->host_time = time;
> 

-- 
Regards,

Laurent Pinchart

