Return-Path: <linux-media+bounces-55892-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CC7DH0Ttt2mzWwEAu9opvQ
	(envelope-from <linux-media+bounces-55892-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 12:45:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A96298DB7
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 12:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 984E030090B9
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 11:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D587392806;
	Mon, 16 Mar 2026 11:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a20GsTX8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DFA38F659;
	Mon, 16 Mar 2026 11:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773661501; cv=none; b=isIVSXs0l5bQrYQkTPLibDhDleIjlGeHDwHXq4Vc1m08jeeHRuahdHurn90gTI+k7flzs27TZ9RJWV/SIrOwgspxleVUprWYlElewf3eYJbhkJXMrp2T/cJ24QaAbFAwRKij1Y1fkDCi5rQE5oVgGWXhUmJDbbpoFZpr9JLeabc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773661501; c=relaxed/simple;
	bh=d8+V6Eb2dVrDZq4al4XWQChQGVx+OMoGk+VgWLLhzyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qO6hkmpUXIIBFI9xlKw/jLDkA0NwmipX8xhsa306WRKCusGLkIfF3Gutgcv74hQFdgA/X4Ygn3IGeyd/XRzazderIQAHwE7FQ7UpaF8OMQobn5zLyHYVbWdfOU8DQzOWb0OzxSMx3nwsjfG6UBgQMuePHaSxbfMaqmmkDYzjd0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a20GsTX8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EEAEC19421;
	Mon, 16 Mar 2026 11:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773661500;
	bh=d8+V6Eb2dVrDZq4al4XWQChQGVx+OMoGk+VgWLLhzyY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a20GsTX8d5PFBwh9NEpnouvxiOFCYRzvByle/+/xAsw0Eo4H7ow1hL+eb94v5YswG
	 0RKGIR7/OGDPkr6QsAQ79SexVXoQ5s6NDj58ivVn96Hu5qyMcFG+ddNNWHx+iZ7YBF
	 HJ2MIBdS1VRWivHunRDN2+oDJXOTkPqkacOr/SYEPg1GIQCt716EWFJm9+0XmvW5DN
	 FOG2XTYsxbByCBCirbu7tmSOX9LyDydTv47fbew8qGpYaaDxDN85ZL/9H5KPa0vUSO
	 rUzj01n9sS6pQRgmccgKHfzO1mI13vmwVHVy2RqJwQuW3v5ZHGbAgle+my+ykXu3Og
	 gp2wH8UCwNS/A==
Message-ID: <41ecee5e-adcf-493b-839d-2390163700f5@kernel.org>
Date: Mon, 16 Mar 2026 12:44:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: uvcvideo: Fix buffer sequence in frame gaps
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yunke Cao <yunkec@google.com>, stable@kernel.org
References: <20260313-uvc-fid-v2-1-3f7a996d9047@chromium.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260313-uvc-fid-v2-1-3f7a996d9047@chromium.org>
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
	TAGGED_FROM(0.00)[bounces-55892-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 35A96298DB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 13-Mar-26 7:21 PM, Ricardo Ribalda wrote:
> In UVC, the FID flips with every frame. For every FID flip, we increase
> the stream sequence number.
> 
> Now, If a FID flips multiple times and there is no data transferred between
> the flips, the buffer sequence number will be set to the value of the
> stream sequence number after the first flip.
> 
> Userspace uses the buffer sequence number to determine if there has been
> missing frames. With the current behaviour, userspace will think that the
> gap is in the wrong location.
> 
> This patch modifies uvc_video_decode_start() to provide the correct
> correct buffer sequence number and timestamp.
> 
> Cc: stable@kernel.org
> Fixes: 650b95feee35 ("[media] uvcvideo: Generate discontinuous sequence numbers when frames are lost")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

So I'm trying to understand this patch, but while looking at this I'm having
a hard time to figure out the current code.

Lets take the following scenario. We have an active current buffer with some
bytesused and uvc_video_decode_start() sees a fid flip.

Now the following happens:

First uvc_video_decode_start() run:

1. if (stream->last_fid != fid) check at line 1175 sees the flip does stream->sequence++;
2. if (fid != stream->last_fid && buf->bytesused != 0) check at line 1243 succeeds, marks
   buffer as ready and returns -EAGAIN.
3. Note stream->last_fid is not updated in this case.

Second uvc_video_decode_start() run because of -EGAIN with new fresh buffer

1. if (stream->last_fid != fid) check at line 1175 sees the flip does stream->sequence++;
2. if (buf->state != UVC_BUF_STATE_ACTIVE) check at line 1209 succeeds, updates
   buf->buf.sequence , timestamp
3. if (fid != stream->last_fid && buf->bytesused != 0) check at line 1243 fails because
   bytesused == 0
4. function exits normally doing:

        stream->last_fid = fid;

        return header_len;

Notice that step 1. happens in both uvc_video_decode_start() runs so we are doing
stream->sequence++ *twice* for a single fid flip. Am I missing something here or
are we indeed increasing sequence twice. And if we are indeed increasing sequence
twice, is that intentional and/or expected by userspace ?

Regards,

Hans




> ---
> Changes in v2 (Thanks Laurent):
> - Improve commit message.
> - Remove original timestamp and sequence assignment. It is not neeed
> - Link to v1: https://lore.kernel.org/r/20260310-uvc-fid-v1-1-5e37dc3c7024@chromium.org
> ---
>  drivers/media/usb/uvc/uvc_video.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 40c76c051da2..9e06b1d0f0f9 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1176,6 +1176,20 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>  		stream->sequence++;
>  		if (stream->sequence)
>  			uvc_video_stats_update(stream);
> +
> +		/*
> +		 * If there is a FID flip and the buffer has no data,
> +		 * initialize its sequence number and timestamp.
> +		 *
> +		 * The driver already takes care of injecting FID flips for
> +		 * UVC_QUIRK_STREAM_NO_FID and UVC_QUIRK_MJPEG_NO_EOF.
> +		 */
> +		if (buf && !buf->bytesused) {
> +			buf->buf.field = V4L2_FIELD_NONE;
> +			buf->buf.sequence = stream->sequence;
> +			buf->buf.vb2_buf.timestamp =
> +					ktime_to_ns(uvc_video_get_time());
> +		}
>  	}
>  
>  	uvc_video_clock_decode(stream, buf, data, len);
> @@ -1216,10 +1230,6 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>  			return -ENODATA;
>  		}
>  
> -		buf->buf.field = V4L2_FIELD_NONE;
> -		buf->buf.sequence = stream->sequence;
> -		buf->buf.vb2_buf.timestamp = ktime_to_ns(uvc_video_get_time());
> -
>  		/* TODO: Handle PTS and SCR. */
>  		buf->state = UVC_BUF_STATE_ACTIVE;
>  	}
> 
> ---
> base-commit: a7da7fb57f2a787412da1a62292a17fa00fbfbdf
> change-id: 20260310-uvc-fid-e1e55447b6f1
> 
> Best regards,


