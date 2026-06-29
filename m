Return-Path: <linux-media+bounces-66010-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nQxTE0K4QmqhAAoAu9opvQ
	(envelope-from <linux-media+bounces-66010-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 20:24:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A23CD6DE01B
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 20:24:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=grvNSIBf;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66010-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66010-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DD19302A692
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 18:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D51383983;
	Mon, 29 Jun 2026 18:23:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37592F2910;
	Mon, 29 Jun 2026 18:23:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782757432; cv=none; b=FR+mMVhECWy+9VELNFLyhopjP3fRqQtJrxI9TC5hPu3s/fHyn5GeKqq8FcYBP3IaL3f/qWzhlxb5C2lrbq9XaXp63x1/BoY6X+EXpCg18WEPdkJ8ygWE7dDmvuB7R04YkZ5EcPG4TXSdSm6fTMVJv+2Xo9XNCXqsRfSc6vdB5bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782757432; c=relaxed/simple;
	bh=1P2OVUAuHOcqUzFU659MHxPQo52FQGXlvTspmoB+nAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IGu2W60o7OYkqbqRwDZgpseSOJdmmp7+UyOl4MUk7JI0Xz5Ma+7gtNsvikxBJ2Od4gSoYrcMNp/OE6SiPp5Pu3Iu5nGduUqqnJW58TundVFnxfOuAL3YDch21vAezb89hDASv6S6/j6GT0SWmKAjOw2jiUViCG8Yl3YWVqThXQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=grvNSIBf; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 719F58D4;
	Mon, 29 Jun 2026 20:23:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782757385;
	bh=1P2OVUAuHOcqUzFU659MHxPQo52FQGXlvTspmoB+nAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=grvNSIBfkYDSvED3TvPWknia5BuzWXueb7mK3pnVfPRDYcACpbeWgSn4Az1fWkOx8
	 bTb5TQ3xFTjwSBweCACgTNxBcB3pJ9ZJ22rpOKNo+GvPf5YeNFSstbydh1Qcxan97P
	 Cf/TCdchk11riDz6vCQpvtXA4IZwFvKszhfv4Vww=
Date: Mon, 29 Jun 2026 21:23:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Pol =?utf-8?B?RmVybsOhbmRleiBGZXJuw6FuZGV6?= <fernandezfernandezpol@gmail.com>
Cc: linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: uvcvideo: add quirks for per-device stream
 error handling
Message-ID: <20260629182347.GI3054459@killaraus.ideasonboard.com>
References: <20260629163805.37879-1-fernandezfernandezpol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260629163805.37879-1-fernandezfernandezpol@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66010-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fernandezfernandezpol@gmail.com,m:linux-media@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A23CD6DE01B

On Mon, Jun 29, 2026 at 06:38:02PM +0200, Pol Fernández Fernández wrote:
> The UVC_STREAM_ERR bit in the payload header signals that the device
> could not deliver a frame correctly. By default, uvcvideo delivers
> these frames to userspace with V4L2_BUF_FLAG_ERROR when uvc_no_drop_param
> is set (the default). Applications that rely on strict JPEG decoders
> (e.g. libjpeg) will display gray bands for the incomplete portion of
> the image, since libjpeg fills undecodable MCU rows with a neutral gray
> when the EOI marker is missing.
> 
> Add UVC_QUIRK_DROP_STREAM_ERR to force-drop frames flagged with
> UVC_STREAM_ERR for specific devices, regardless of the uvc_no_drop_param
> module parameter. This ensures applications never receive truncated frames
> from devices known to set UVC_STREAM_ERR on genuine encoding errors.

That completely defeats the point of uvc_no_drop_param. The issue should
be fixed in userspace, where you should ignore frames with the error
flag set if desired.

> The existing uvc_queue_to_stream() helper is used to reach the device
> quirks from within uvc_queue_buffer_complete().
> 
> Additionally, uvcvideo unconditionally overrides the camera's probed
> wCompQuality with the maximum value returned by GET_MAX. For devices
> whose firmware treats wCompQuality=0 as an adaptive encoding mode (where
> the encoder adjusts quality dynamically to fit within the available USB
> bandwidth),

The UVC 1.1 specification documents the range wCompQuality values as

"Values for this property range from 0 to 10000 (0 indicates the lowest
quality, 10000 the highest)."

While the UVC 1.5 specification documents it as

"Values for this property range from 1 to 10000 (1 indicates the lowest
quality, 10000 the highest)."

There is no mention of 0 being allowed as a magic value. Where did you
find information about the adaptive encoding mode ?

> this override increases encoding pressure and can contribute
> to UVC_STREAM_ERR events. Add UVC_QUIRK_NO_FORCE_QUALITY to preserve
> the camera's default quality value during probe negotiation.
> 
> Signed-off-by: Pol Fernández Fernández <fernandezfernandezpol@gmail.com>

Please split this patch in two as it addresses two different issues.

> ---
>  drivers/media/usb/uvc/uvc_queue.c | 3 ++-
>  drivers/media/usb/uvc/uvc_video.c | 3 ++-
>  drivers/media/usb/uvc/uvcvideo.h  | 2 ++
>  3 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index XXXXXXX..XXXXXXX 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -81,6 +81,8 @@
>  #define UVC_QUIRK_INVALID_DEVICE_SOF	0x00010000
>  #define UVC_QUIRK_MJPEG_NO_EOF		0x00020000
>  #define UVC_QUIRK_MSXU_META		0x00040000
> +#define UVC_QUIRK_DROP_STREAM_ERR	0x00080000
> +#define UVC_QUIRK_NO_FORCE_QUALITY	0x00100000
> 
>  /* Format flags */
>  #define UVC_FMT_FLAG_COMPRESSED		0x00000001
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index XXXXXXX..XXXXXXX 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -451,7 +451,8 @@ int uvc_probe_video(struct uvc_streaming *stream,
>  		if (ret < 0)
>  			goto done;
> 
> -		probe->wCompQuality = probe_max.wCompQuality;
> +		if (!(stream->dev->quirks & UVC_QUIRK_NO_FORCE_QUALITY))
> +			probe->wCompQuality = probe_max.wCompQuality;
>  	}
> 
>  	for (i = 0; i < 2; ++i) {
> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> index XXXXXXX..XXXXXXX 100644
> --- a/drivers/media/usb/uvc/uvc_queue.c
> +++ b/drivers/media/usb/uvc/uvc_queue.c
> @@ -357,7 +357,8 @@ static void uvc_queue_buffer_complete(struct kref *ref)
>  	struct vb2_buffer *vb = &buf->buf.vb2_buf;
>  	struct uvc_video_queue *queue = vb2_get_drv_priv(vb->vb2_queue);
> 
> -	if (buf->error && !uvc_no_drop_param) {
> +	if (buf->error && (!uvc_no_drop_param ||
> +	    (uvc_queue_to_stream(queue)->dev->quirks & UVC_QUIRK_DROP_STREAM_ERR))) {
>  		uvc_queue_buffer_requeue(queue, buf);
>  		return;
>  	}

-- 
Regards,

Laurent Pinchart

