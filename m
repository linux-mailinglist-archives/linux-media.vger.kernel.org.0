Return-Path: <linux-media+bounces-56594-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBe3FzKKvmkOSQMAu9opvQ
	(envelope-from <linux-media+bounces-56594-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 13:08:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5192E535D
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 13:08:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 237CD3025A60
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 12:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0948728C2DD;
	Sat, 21 Mar 2026 12:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bUcQyvty"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2BD282F05;
	Sat, 21 Mar 2026 12:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774094820; cv=none; b=a2CqJU/wfmU7kZrk1EZJG+OiDRpVSMXctpj1uPBUX+oifGSfi8vyrDQv1fY8YBraJHVus82roelhzuGM/lOPZq3/oVMrskEMn9kzoai5uvpYvQrdqEx6/XeLSKe5+pCzpWxetKmBaLucqIaNelkT0SYHQ1QJAeNGxmSPgRplO/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774094820; c=relaxed/simple;
	bh=kb5HS8rwcCi00zQwivKu7IEhuykniKbCuW9OLfZd3+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ep7++wGi4Do3IEmeYXoYh+q2ziIRvlv+IsVEkBu90h4xyhFWAX7pIaAWTZAo4dMN80vQwesg9PSM5t877FKcDO0At5LnqH3k3lmFCkdnR49ug/5KhwMGW7h57+d+Ge2ZQJJsf5/HPXMrD8F6ZGXc1FK5OelUmQLtse8ChN4CIB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bUcQyvty; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C920BC2BC87;
	Sat, 21 Mar 2026 12:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774094820;
	bh=kb5HS8rwcCi00zQwivKu7IEhuykniKbCuW9OLfZd3+w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bUcQyvtyN6K4cBtf1Mu8T4/KWVYFJrtE2tduCvj1YsH0M/5XcROQBVTQArWKto3eB
	 6DAS5wo1jodjsVbJLpPnHmmLX8w1LLDn0OK1Z+qkFlGuMPOvSzIJM7Pz32R7OKq1TJ
	 RH00oAlMJzEEWthuAgx5evKwvPJfjZ4V0iofr2bejwTNzAlNo4qs9kBoQPP+MnMebK
	 3ZId72IDOFfhIRyYtYqVh07NdL75MS3DNxbZmLdjWp1kWlTjMTyWBxtlzJTYQ5R85i
	 QQTAMRVOEgQxVn+o1qmanMvW8Cs6tMXwaOV06x+taUnKR5866Bt+DFzZBm4wb99fJV
	 OmhnL4a0/C1Aw==
Message-ID: <fd6394fa-0d8a-432e-8d9f-daaf4318e065@kernel.org>
Date: Sat, 21 Mar 2026 13:06:57 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] media: uvcvideo: Fix buffer sequence in frame gaps
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yunke Cao <yunkec@google.com>, stable@kernel.org
References: <20260320-uvc-fid-v4-0-f24f168ca2f9@chromium.org>
 <20260320-uvc-fid-v4-1-f24f168ca2f9@chromium.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260320-uvc-fid-v4-1-f24f168ca2f9@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56594-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,chromium.org:email]
X-Rspamd-Queue-Id: 0A5192E535D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 20-Mar-26 14:35, Ricardo Ribalda wrote:
> In UVC, the FID flips with every frame. For every FID flip, we increase
> the stream sequence number.
> 
> Now, if a FID flips multiple times and there is no data transferred between
> the flips, the buffer sequence number will be set to the value of the
> stream sequence number after the first flip.
> 
> Userspace uses the buffer sequence number to determine if there has been
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

If you move this patch to after patch 2/2 then you can drop the 
!buf->bytesused check since if the fid changed and
buf->bytesused != 0 uvc_video_decode_start() will hit:

	if (stream->last_fid != (u8) -1 && fid != stream->last_fid &&
	    buf && buf->bytesused != 0) {

First and return -EAGAIN, so if we get here (with here being
inside a fid-changed check) then we know that buf->bytesused == 0
(or there is no buffer at all).

Regards,

Hans




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


