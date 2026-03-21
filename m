Return-Path: <linux-media+bounces-56593-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEz1CtWJvmkOSQMAu9opvQ
	(envelope-from <linux-media+bounces-56593-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 13:06:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A255C2E533F
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 13:06:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 69758307342D
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 12:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C302BE034;
	Sat, 21 Mar 2026 12:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSeuPpC9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABFC22B8C5;
	Sat, 21 Mar 2026 12:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774094572; cv=none; b=kwM9Ogc4Of3SbNuhuIBENSmxbTcEami4MEk4P5/lTGnWpoNQgQha59nI2Qah1fkHsbPq679yVXo2r/V4gJJN1HQtbVbqIZk4OG85hx69MpudkEtpYf+t0khrU4sIAUnzKwkVuwlZ1TMFK/lGd86NTNQNhVlB/At05cVVJNrcFzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774094572; c=relaxed/simple;
	bh=SxAYGvuGcIzEAafHHbHmw3ctD6DHBJei4igcoPFhyFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SwHgYYihXWs1qvQu6eJUYebMvGEGcbfPSkWdNxUuoxpEx+zO2NsR1Hnh8BN8sVt2OBoCBt/2bs81DEQrQey0KQPYIhr6ITXlr7RjSFNKuNyjvcuJDvx2NJYom72qxOzIWA5JX5pK3z8oDPebogL1w99kOZKfPFR7AYmL8GsyoqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSeuPpC9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B2F3C2BC9E;
	Sat, 21 Mar 2026 12:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774094571;
	bh=SxAYGvuGcIzEAafHHbHmw3ctD6DHBJei4igcoPFhyFs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WSeuPpC96rVYFyIYSxeiKzuwtr860BV86rSHTVIzDmQj+kxQC8s7qD7j7Xm06aqet
	 9/Pypp/rc2/ZrLqgs8x3IBGzXXLG7XRpXXDLvdSq7wziKWKOiFariHbmVSy0Bvf+Qb
	 xsuexthF2AgU6BeXOWZRIPY+czW2pPBVJTDdx0QoMPiNMtFP+DskD9mkG79gZrbmN7
	 2NzIhShSU2WBZfWwW6UWRLxmBSRr6kIiK5Z6PWmWplWISY+TNF1kLlvGpu71spZaax
	 NDu+dDX7T6+rJ+zWmss94g967LfCYt85ZyelnW9tdf0r4+6eyoFKiu9BIdK2+ykYaq
	 hGjL9D3NtkeFQ==
Message-ID: <43232fb3-fc77-471b-986b-ee2374e3b642@kernel.org>
Date: Sat, 21 Mar 2026 13:02:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] media: uvcvideo: Fix sequence number when no EOF
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yunke Cao <yunkec@google.com>, stable@kernel.org
References: <20260320-uvc-fid-v4-0-f24f168ca2f9@chromium.org>
 <20260320-uvc-fid-v4-2-f24f168ca2f9@chromium.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260320-uvc-fid-v4-2-f24f168ca2f9@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56593-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,chromium.org:email]
X-Rspamd-Queue-Id: A255C2E533F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 20-Mar-26 14:35, Ricardo Ribalda wrote:
> If the driver could not detect the EOF, the sequence number is increased
> twice:
>  1) When we enter uvc_video_decode_start() with the old buffer and FID has
>    fliped => We return -EAGAIN and last_fid is not flipped
>  2) When we enter uvc_video_decode_start() with the new buffer.
> 
> Fix this issue by moving the new frame detection logic earlier in
> uvc_video_decode_start().
> 
> Cc: stable@kernel.org
> Fixes: 650b95feee35 ("[media] uvcvideo: Generate discontinuous sequence numbers when frames are lost")
> Reported-by: Hans de Goede <hansg@kernel.org>
> Closes: https://lore.kernel.org/linux-media/CANiDSCuj4cPuB5_v2xyvAagA5FjoN8V5scXiFFOeD3aKDMqkCg@mail.gmail.com/T/#me39fb134e8c2c085567a31548c3403eb639625e4
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 48 ++++++++++++++++++++-------------------
>  1 file changed, 25 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 9e06b1d0f0f9..2218e4d8e564 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1168,6 +1168,31 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
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
> +	 * stream->last_fid is initialized to -1, so the first isochronous
> +	 * frame will never trigger an end of frame detection.
> +	 *
> +	 * Empty buffers (bytesused == 0) don't trigger end of frame detection
> +	 * as it doesn't make sense to return an empty buffer. This also
> +	 * avoids detecting end of frame conditions at FID toggling if the
> +	 * previous payload had the EOF bit set.
> +	 */
> +	if (stream->last_fid != -1 && fid != stream->last_fid &&
> +	    buf && buf->bytesused != 0) {
> +		uvc_dbg(stream->dev, FRAME,
> +			"Frame complete (FID bit toggled)\n");
> +		buf->state = UVC_BUF_STATE_READY;
> +
> +		return -EAGAIN;
> +	}
> +
>  	/*
>  	 * Increase the sequence number regardless of any buffer states, so
>  	 * that discontinuous sequence numbers always indicate lost frames.

Nice, since this compensates for the previous packet being parsed missing
the EOF flag doing it as the first thing makes a lot of sense.

Note this has a number of extra advantages which would be good to list
in the commit message for v5:

- The error status from the new packet will no longer get propagated
  to the previous frame-buffer.
- uvc_video_clock_decode() will no longer update the previous frame buf->stf
  with info from the new packet.
- uvc_video_clock_decode() and uvc_video_stats_decode() will no longer
  get called twice for the same packet.

I wonder if we should move the JPEG SOI marker detect also up for
all the same reasons? That seems to be for a camera not toggling FID
itself *and* sometimes missing the packet with the EOF flag ?

Regards,

Hans






> @@ -1234,29 +1259,6 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
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
>  	/*
>  	 * Some cameras, when running two parallel streams (one MJPEG alongside
>  	 * another non-MJPEG stream), are known to lose the EOF packet for a frame.
> 


