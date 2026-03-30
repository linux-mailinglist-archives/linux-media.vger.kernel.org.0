Return-Path: <linux-media+bounces-57644-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFuXGoWUymnF+AUAu9opvQ
	(envelope-from <linux-media+bounces-57644-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 17:19:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBAD35DAA4
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 17:19:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AD375301D6CB
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 15:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829A333FE10;
	Mon, 30 Mar 2026 15:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pZM3ChYV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E9A333730;
	Mon, 30 Mar 2026 15:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774883835; cv=none; b=PQayiLdy7CWGsOo0dPHUNTpxuJfTH8V0xKVyH+3eVCC1i3s4f+n769/flmmGbcK7tYScS4j2N5WovPjVU2Y0SHBO2LNfe+PBXNd3M0rrFxV5v0V+GGHUm6nkWdomqO+2IQyy8+Ghjv3mDO3wT1QSbh3fPWU+iwYapMPabrfZf/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774883835; c=relaxed/simple;
	bh=xQvizxmTH9rW3jSSz/vD5EeafCvQxKSQ5BuzWX6J7Lw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BVVOfSwyOLHCmZwQj9dLRKSM8oUFs/+KuWXoJYtm4HXLek2uy2Q6rIqAQy35HRJXoAc8Hg+9mp4xba2pD3kksRw0XAu/yZhgG6ohrSlrsGj0Q8uekc7GTdfRsnuKi8apX3kQZ7wuLfkkZLcvjm4PfAn1PQvkpveSa93jnIUu8Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pZM3ChYV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08FBFC4CEF7;
	Mon, 30 Mar 2026 15:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774883834;
	bh=xQvizxmTH9rW3jSSz/vD5EeafCvQxKSQ5BuzWX6J7Lw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pZM3ChYVNFeb3wR7igYsyJYfUPEL1uElgd3jOIKHDdUyclQLtZHyp1/nlvYN/IX3g
	 iVCglERa0IhI+9wswFZjBokg9isn7DloBMM4jkCSodpuP+mR6XKk1+lw7tKktLnyIV
	 N7hRile8mU80h5kVjI25/kufJg0JEolO2WZh7+e7xC5S8xip2JE2EGRgb0cSunPt9c
	 7ORM0E3s2pl0UrtWxaAiMy6dvB0TwiAL3JQ4NOPYrRbzz+Um/wsSdBCp/kdt3B2Hb+
	 b6Yqjz9w8lnm095bLzhRur68hUFn5K7N6mRCKTLoLdNgrDmSjPImPzg9alJzlys01d
	 U6yGBhAI6YsGQ==
Message-ID: <d333a55a-c66e-4779-9e0e-b077eb4063df@kernel.org>
Date: Mon, 30 Mar 2026 17:17:10 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] media: uvcvideo: Fix sequence number when no EOF
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yunke Cao <yunkec@google.com>,
 stable@kernel.org
References: <20260323-uvc-fid-v5-0-e2858b657aac@chromium.org>
 <20260323-uvc-fid-v5-1-e2858b657aac@chromium.org>
 <20260324002022.GC2334070@killaraus.ideasonboard.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260324002022.GC2334070@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57644-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,chromium.org:email,ideasonboard.com:email]
X-Rspamd-Queue-Id: 1FBAD35DAA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 24-Mar-26 01:20, Laurent Pinchart wrote:
> On Mon, Mar 23, 2026 at 09:53:52AM +0000, Ricardo Ribalda wrote:
>> If the driver could not detect the EOF, the sequence number is increased
>> twice:
>>  1) When we enter uvc_video_decode_start() with the old buffer and FID has
>>    flipped => We return -EAGAIN and last_fid is not flipped
>>  2) When we enter uvc_video_decode_start() with the new buffer.
>>
>> Fix this issue by moving the new frame detection logic earlier in
>> uvc_video_decode_start().
>>
>> This also has some nice side affects:
>>
>> - The error status from the new packet will no longer get propagated
>>   to the previous frame-buffer.
>> - uvc_video_clock_decode() will no longer update the previous frame
>>   buf->stf with info from the new packet.
>> - uvc_video_clock_decode() and uvc_video_stats_decode() will no longer
>>   get called twice for the same packet.
>>
>> Cc: stable@kernel.org
>> Fixes: 650b95feee35 ("[media] uvcvideo: Generate discontinuous sequence numbers when frames are lost")
>> Reported-by: Hans de Goede <hansg@kernel.org>
>> Closes: https://lore.kernel.org/linux-media/CANiDSCuj4cPuB5_v2xyvAagA5FjoN8V5scXiFFOeD3aKDMqkCg@mail.gmail.com/T/#me39fb134e8c2c085567a31548c3403eb639625e4
>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>> ---
>>  drivers/media/usb/uvc/uvc_video.c | 92 ++++++++++++++++++++-------------------
>>  1 file changed, 47 insertions(+), 45 deletions(-)
>>
>> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
>> index 40c76c051da2..eddb4821b205 100644
>> --- a/drivers/media/usb/uvc/uvc_video.c
>> +++ b/drivers/media/usb/uvc/uvc_video.c
>> @@ -1168,6 +1168,53 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>>  	header_len = data[0];
>>  	fid = data[1] & UVC_STREAM_FID;
>>  
>> +	/*
>> +	 * Mark the buffer as done if we're at the beginning of a new frame.
>> +	 * End of frame detection is better implemented by checking the EOF
>> +	 * bit (FID bit toggling is delayed by one frame compared to the EOF
>> +	 * bit), but some devices don't set the bit at end of frame (and the
>> +	 * last payload can be lost anyway). We thus must check if the FID has
>> +	 * been toggled.
>> +	 *
>> +	 * stream->last_fid is initialized to -1, and buf->bytesused to 0,
>> +	 * so the first isochronous frame will never trigger an end of frame
>> +	 * detection.
>> +	 *
>> +	 * Empty buffers (bytesused == 0) don't trigger end of frame detection
>> +	 * as it doesn't make sense to return an empty buffer. This also
>> +	 * avoids detecting end of frame conditions at FID toggling if the
>> +	 * previous payload had the EOF bit set.
>> +	 */
>> +	if (fid != stream->last_fid && buf && buf->bytesused != 0) {
>> +		uvc_dbg(stream->dev, FRAME,
>> +			"Frame complete (FID bit toggled)\n");
>> +		buf->state = UVC_BUF_STATE_READY;
>> +
>> +		return -EAGAIN;
>> +	}
>> +
>> +	/*
>> +	 * Some cameras, when running two parallel streams (one MJPEG alongside
>> +	 * another non-MJPEG stream), are known to lose the EOF packet for a frame.
>> +	 * We can detect the end of a frame by checking for a new SOI marker, as
>> +	 * the SOI always lies on the packet boundary between two frames for
>> +	 * these devices.
>> +	 */
>> +	if (stream->dev->quirks & UVC_QUIRK_MJPEG_NO_EOF &&
>> +	    (stream->cur_format->fcc == V4L2_PIX_FMT_MJPEG ||
>> +	    stream->cur_format->fcc == V4L2_PIX_FMT_JPEG)) {
>> +		const u8 *packet = data + header_len;
>> +
>> +		if (len >= header_len + 2 &&
>> +		    packet[0] == 0xff && packet[1] == JPEG_MARKER_SOI &&
>> +		    buf && buf->bytesused != 0) {
> 
> How about moving the buf && buf->bytesused != 0 to the outer condition,
> so that we don't inspect the packet when we don't need to ? It will also
> make the two end of frame detection blocks more similar.

I've just merged this into my local uvc/for-next branch and
I've moved the "buf && buf->bytesused != 0" check to the outer condition
while applying, so there is no need to send a new version.

> The patch otherwise looks fine, I don't see anything below this code
> that would need to be performed before.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> 
>> +			buf->state = UVC_BUF_STATE_READY;
>> +			buf->error = 1;
>> +			stream->last_fid ^= UVC_STREAM_FID;
>> +			return -EAGAIN;
>> +		}
>> +	}
>> +
>>  	/*
>>  	 * Increase the sequence number regardless of any buffer states, so
>>  	 * that discontinuous sequence numbers always indicate lost frames.
>> @@ -1224,51 +1271,6 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>>  		buf->state = UVC_BUF_STATE_ACTIVE;
>>  	}
>>  
>> -	/*
>> -	 * Mark the buffer as done if we're at the beginning of a new frame.
>> -	 * End of frame detection is better implemented by checking the EOF
>> -	 * bit (FID bit toggling is delayed by one frame compared to the EOF
>> -	 * bit), but some devices don't set the bit at end of frame (and the
>> -	 * last payload can be lost anyway). We thus must check if the FID has
>> -	 * been toggled.
>> -	 *
>> -	 * stream->last_fid is initialized to -1, so the first isochronous
>> -	 * frame will never trigger an end of frame detection.
>> -	 *
>> -	 * Empty buffers (bytesused == 0) don't trigger end of frame detection
>> -	 * as it doesn't make sense to return an empty buffer. This also
>> -	 * avoids detecting end of frame conditions at FID toggling if the
>> -	 * previous payload had the EOF bit set.
>> -	 */
>> -	if (fid != stream->last_fid && buf->bytesused != 0) {
>> -		uvc_dbg(stream->dev, FRAME,
>> -			"Frame complete (FID bit toggled)\n");
>> -		buf->state = UVC_BUF_STATE_READY;
>> -		return -EAGAIN;
>> -	}
>> -
>> -	/*
>> -	 * Some cameras, when running two parallel streams (one MJPEG alongside
>> -	 * another non-MJPEG stream), are known to lose the EOF packet for a frame.
>> -	 * We can detect the end of a frame by checking for a new SOI marker, as
>> -	 * the SOI always lies on the packet boundary between two frames for
>> -	 * these devices.
>> -	 */
>> -	if (stream->dev->quirks & UVC_QUIRK_MJPEG_NO_EOF &&
>> -	    (stream->cur_format->fcc == V4L2_PIX_FMT_MJPEG ||
>> -	    stream->cur_format->fcc == V4L2_PIX_FMT_JPEG)) {
>> -		const u8 *packet = data + header_len;
>> -
>> -		if (len >= header_len + 2 &&
>> -		    packet[0] == 0xff && packet[1] == JPEG_MARKER_SOI &&
>> -		    buf->bytesused != 0) {
>> -			buf->state = UVC_BUF_STATE_READY;
>> -			buf->error = 1;
>> -			stream->last_fid ^= UVC_STREAM_FID;
>> -			return -EAGAIN;
>> -		}
>> -	}
>> -
>>  	stream->last_fid = fid;
>>  
>>  	return header_len;
>>
> 


