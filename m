Return-Path: <linux-media+bounces-57645-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SE0KKceYymmg+QUAu9opvQ
	(envelope-from <linux-media+bounces-57645-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 17:37:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3438A35E034
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 17:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6DF4E304FA0A
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 15:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B09643630A9;
	Mon, 30 Mar 2026 15:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GYlsdeeW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255EB3624D4;
	Mon, 30 Mar 2026 15:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774884698; cv=none; b=mvTMVXb28jskwk3oNEOf9YtcecpkYEeDYKU8snF/6wH6RRrJkr0+ZIkiYn35bkrqwPqgMfzpkiUWyfg/vyoM7jzRTFY+uaaZyG/k6PnAe6P5XKo4utVxaF7DSW92vl9xRgAzlINT7rXlrXAKO81sndfO7AgAeKjTEmehRPC/CMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774884698; c=relaxed/simple;
	bh=h8H6GCDLo2hOLi9piiwQxCK9cMM4/44+r7epiRc5ejU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MRBsCq91t0ZAtb60Q7s+iQo1BSJ7Ge3wrf7egmVwyWIKo/4nW08UBPQLwjC7BkmKCWIhdeGWUOr3l2jLJ/btf7b8+0mIAgfl+hYiBqDCA7AeZBYMabgjhkN+uQ+Ts8IVRVV2OwGdAQK3A1vtWNhLrwbl141Vka/RSQ7uLjoahE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GYlsdeeW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A9D4C2BCB1;
	Mon, 30 Mar 2026 15:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774884697;
	bh=h8H6GCDLo2hOLi9piiwQxCK9cMM4/44+r7epiRc5ejU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GYlsdeeWUkYhxug8R2UTfPBtENX7r+5/arRelXLDH9iUHLWRtArplYr3hA+Uz+AD7
	 YBZGFT3QhSn9dKt6UvBNOyAV8QfPJJ+4QWH69b6C8/dxYB3TpfvRURkvJ6jVcsAle4
	 6w4gJQwnLwGU6vz6TQEC+oCYLqEk+tifzlRgQCmVMxbiEj/9eY+58s4B+Y1PWba9Xp
	 /0pV3cjoRV6WJd2DE44CwOtCWxb7G/ubeY14d+VImH0wZDaYI54PI9zDX1YImqSDWq
	 D8mZMJR5nkTdKuBsL4ZYBaPyW0jYklcvlMewyrJIrVN07rYl7R7FmH+Y2db1pWg16m
	 CJ8biHcFOSaxg==
Message-ID: <41385178-1d8f-4771-859e-06b532060300@kernel.org>
Date: Mon, 30 Mar 2026 17:31:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] media: uvcvideo: Fix buffer sequence in frame gaps
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yunke Cao <yunkec@google.com>, stable@kernel.org
References: <20260323-uvc-fid-v5-0-e2858b657aac@chromium.org>
 <20260323-uvc-fid-v5-2-e2858b657aac@chromium.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260323-uvc-fid-v5-2-e2858b657aac@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57645-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,chromium.org:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 3438A35E034
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 23-Mar-26 10:53, Ricardo Ribalda wrote:
> In UVC, the FID flips with every frame. For every FID flip, we increase
> the stream sequence number.
> 
> Now, if a FID flips multiple times and there is no data transferred between
> the flips, the buffer sequence number will be set to the value of the
> stream sequence number after the first flip.
> 
> Userspace uses the buffer sequence number to determine if there have been
> missing frames. With the current behaviour, userspace will think that the
> gap is in the wrong location.
> 
> This patch modifies uvc_video_decode_start() to provide the correct buffer
> sequence number and timestamp.
> 
> Cc: stable@kernel.org
> Fixes: 650b95feee35 ("[media] uvcvideo: Generate discontinuous sequence numbers when frames are lost")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index eddb4821b205..32c3469f26c6 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1223,6 +1223,20 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>  		stream->sequence++;
>  		if (stream->sequence)
>  			uvc_video_stats_update(stream);
> +
> +		/*
> +		 * If there is a FID flip and the buffer has no data,
> +		 * initialize its sequence number and timestamp.

The "and the buffer has no data" part of the comment is a bit weird
now that the buf->bytes_used == 0 check is dropped. I'll drop
this part of the comment while merging this.

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans


> +		 *
> +		 * The driver already takes care of injecting FID flips for
> +		 * UVC_QUIRK_STREAM_NO_FID and UVC_QUIRK_MJPEG_NO_EOF.
> +		 */
> +		if (buf) {
> +			buf->buf.field = V4L2_FIELD_NONE;
> +			buf->buf.sequence = stream->sequence;
> +			buf->buf.vb2_buf.timestamp =
> +					ktime_to_ns(uvc_video_get_time());
> +		}
>  	}
>  
>  	uvc_video_clock_decode(stream, buf, data, len);
> @@ -1263,10 +1277,6 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
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


