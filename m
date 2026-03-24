Return-Path: <linux-media+bounces-56779-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOHJB0rZwWkaXQQAu9opvQ
	(envelope-from <linux-media+bounces-56779-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 01:22:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F4C2FF9AA
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 01:22:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DF5E13033BFD
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 00:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FFA12236F2;
	Tue, 24 Mar 2026 00:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QxC5qfu7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1CD202997;
	Tue, 24 Mar 2026 00:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311627; cv=none; b=UtLVItVsFGx2JoF6sWLHwss1ocWkob8GUR0CLIfUiQPg8LnkO/GA9fbrLK5576OjL+zkxik1c5I6P2hgpAAVW5z+6TBuIqePJ8OWVKgNlbpP+oKPCoNNEkgWgv1/YJ8WBWBgg0fGkZUtd2ofzW+zuhbIuCljNdx8+pu4KRZ1t/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311627; c=relaxed/simple;
	bh=3dosacfdbH6jC2r+obvt3527gGj3wloWAca625hnbzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ssEJP8tUILGNcoZ84hnMWzpnD5JCqqMN7MGNWToNynUao6GJs9nhpRXOtWkHZZerfcQH/xaXb9zxqIflkNSLTfDM88nLTDrL735xc4ta6pqlRdaog6sUODQerFYXavrG0Wz865YRswGkKIz8o6jN7SBQ7YEIVErtZ0IBO1oo8M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QxC5qfu7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 41AC9225;
	Tue, 24 Mar 2026 01:19:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774311547;
	bh=3dosacfdbH6jC2r+obvt3527gGj3wloWAca625hnbzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QxC5qfu77/bbG5bMDYgEFxOZU7C/EgRAm0Sy2vfLaUe+h9UtfH8hxop0k8RJsYAQ8
	 3qiUFbyw/JHuN4yR4iaO4QPwzEzbQkkrIz4yi5RIR+5gYYdBqTxcbvfpJGPTOO3r2O
	 DFj8Ff/MRqGNu/g73/9OliQdOoBiTggsZSWJrUbo=
Date: Tue, 24 Mar 2026 02:20:22 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yunke Cao <yunkec@google.com>, stable@kernel.org
Subject: Re: [PATCH v5 1/2] media: uvcvideo: Fix sequence number when no EOF
Message-ID: <20260324002022.GC2334070@killaraus.ideasonboard.com>
References: <20260323-uvc-fid-v5-0-e2858b657aac@chromium.org>
 <20260323-uvc-fid-v5-1-e2858b657aac@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323-uvc-fid-v5-1-e2858b657aac@chromium.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56779-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email,chromium.org:email]
X-Rspamd-Queue-Id: D0F4C2FF9AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 09:53:52AM +0000, Ricardo Ribalda wrote:
> If the driver could not detect the EOF, the sequence number is increased
> twice:
>  1) When we enter uvc_video_decode_start() with the old buffer and FID has
>    flipped => We return -EAGAIN and last_fid is not flipped
>  2) When we enter uvc_video_decode_start() with the new buffer.
> 
> Fix this issue by moving the new frame detection logic earlier in
> uvc_video_decode_start().
> 
> This also has some nice side affects:
> 
> - The error status from the new packet will no longer get propagated
>   to the previous frame-buffer.
> - uvc_video_clock_decode() will no longer update the previous frame
>   buf->stf with info from the new packet.
> - uvc_video_clock_decode() and uvc_video_stats_decode() will no longer
>   get called twice for the same packet.
> 
> Cc: stable@kernel.org
> Fixes: 650b95feee35 ("[media] uvcvideo: Generate discontinuous sequence numbers when frames are lost")
> Reported-by: Hans de Goede <hansg@kernel.org>
> Closes: https://lore.kernel.org/linux-media/CANiDSCuj4cPuB5_v2xyvAagA5FjoN8V5scXiFFOeD3aKDMqkCg@mail.gmail.com/T/#me39fb134e8c2c085567a31548c3403eb639625e4
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 92 ++++++++++++++++++++-------------------
>  1 file changed, 47 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 40c76c051da2..eddb4821b205 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1168,6 +1168,53 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>  	header_len = data[0];
>  	fid = data[1] & UVC_STREAM_FID;
>  
> +	/*
> +	 * Mark the buffer as done if we're at the beginning of a new frame.
> +	 * End of frame detection is better implemented by checking the EOF
> +	 * bit (FID bit toggling is delayed by one frame compared to the EOF
> +	 * bit), but some devices don't set the bit at end of frame (and the
> +	 * last payload can be lost anyway). We thus must check if the FID has
> +	 * been toggled.
> +	 *
> +	 * stream->last_fid is initialized to -1, and buf->bytesused to 0,
> +	 * so the first isochronous frame will never trigger an end of frame
> +	 * detection.
> +	 *
> +	 * Empty buffers (bytesused == 0) don't trigger end of frame detection
> +	 * as it doesn't make sense to return an empty buffer. This also
> +	 * avoids detecting end of frame conditions at FID toggling if the
> +	 * previous payload had the EOF bit set.
> +	 */
> +	if (fid != stream->last_fid && buf && buf->bytesused != 0) {
> +		uvc_dbg(stream->dev, FRAME,
> +			"Frame complete (FID bit toggled)\n");
> +		buf->state = UVC_BUF_STATE_READY;
> +
> +		return -EAGAIN;
> +	}
> +
> +	/*
> +	 * Some cameras, when running two parallel streams (one MJPEG alongside
> +	 * another non-MJPEG stream), are known to lose the EOF packet for a frame.
> +	 * We can detect the end of a frame by checking for a new SOI marker, as
> +	 * the SOI always lies on the packet boundary between two frames for
> +	 * these devices.
> +	 */
> +	if (stream->dev->quirks & UVC_QUIRK_MJPEG_NO_EOF &&
> +	    (stream->cur_format->fcc == V4L2_PIX_FMT_MJPEG ||
> +	    stream->cur_format->fcc == V4L2_PIX_FMT_JPEG)) {
> +		const u8 *packet = data + header_len;
> +
> +		if (len >= header_len + 2 &&
> +		    packet[0] == 0xff && packet[1] == JPEG_MARKER_SOI &&
> +		    buf && buf->bytesused != 0) {

How about moving the buf && buf->bytesused != 0 to the outer condition,
so that we don't inspect the packet when we don't need to ? It will also
make the two end of frame detection blocks more similar.

The patch otherwise looks fine, I don't see anything below this code
that would need to be performed before.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +			buf->state = UVC_BUF_STATE_READY;
> +			buf->error = 1;
> +			stream->last_fid ^= UVC_STREAM_FID;
> +			return -EAGAIN;
> +		}
> +	}
> +
>  	/*
>  	 * Increase the sequence number regardless of any buffer states, so
>  	 * that discontinuous sequence numbers always indicate lost frames.
> @@ -1224,51 +1271,6 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>  		buf->state = UVC_BUF_STATE_ACTIVE;
>  	}
>  
> -	/*
> -	 * Mark the buffer as done if we're at the beginning of a new frame.
> -	 * End of frame detection is better implemented by checking the EOF
> -	 * bit (FID bit toggling is delayed by one frame compared to the EOF
> -	 * bit), but some devices don't set the bit at end of frame (and the
> -	 * last payload can be lost anyway). We thus must check if the FID has
> -	 * been toggled.
> -	 *
> -	 * stream->last_fid is initialized to -1, so the first isochronous
> -	 * frame will never trigger an end of frame detection.
> -	 *
> -	 * Empty buffers (bytesused == 0) don't trigger end of frame detection
> -	 * as it doesn't make sense to return an empty buffer. This also
> -	 * avoids detecting end of frame conditions at FID toggling if the
> -	 * previous payload had the EOF bit set.
> -	 */
> -	if (fid != stream->last_fid && buf->bytesused != 0) {
> -		uvc_dbg(stream->dev, FRAME,
> -			"Frame complete (FID bit toggled)\n");
> -		buf->state = UVC_BUF_STATE_READY;
> -		return -EAGAIN;
> -	}
> -
> -	/*
> -	 * Some cameras, when running two parallel streams (one MJPEG alongside
> -	 * another non-MJPEG stream), are known to lose the EOF packet for a frame.
> -	 * We can detect the end of a frame by checking for a new SOI marker, as
> -	 * the SOI always lies on the packet boundary between two frames for
> -	 * these devices.
> -	 */
> -	if (stream->dev->quirks & UVC_QUIRK_MJPEG_NO_EOF &&
> -	    (stream->cur_format->fcc == V4L2_PIX_FMT_MJPEG ||
> -	    stream->cur_format->fcc == V4L2_PIX_FMT_JPEG)) {
> -		const u8 *packet = data + header_len;
> -
> -		if (len >= header_len + 2 &&
> -		    packet[0] == 0xff && packet[1] == JPEG_MARKER_SOI &&
> -		    buf->bytesused != 0) {
> -			buf->state = UVC_BUF_STATE_READY;
> -			buf->error = 1;
> -			stream->last_fid ^= UVC_STREAM_FID;
> -			return -EAGAIN;
> -		}
> -	}
> -
>  	stream->last_fid = fid;
>  
>  	return header_len;
> 

-- 
Regards,

Laurent Pinchart

