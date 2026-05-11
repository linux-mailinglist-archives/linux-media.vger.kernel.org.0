Return-Path: <linux-media+bounces-61140-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF3QDKT4AWrQmwEAu9opvQ
	(envelope-from <linux-media+bounces-61140-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 17:41:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AD618511623
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 17:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 72C6C310B000
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 15:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C400B40627B;
	Mon, 11 May 2026 15:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sz09ODpX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3111E402431;
	Mon, 11 May 2026 15:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778513484; cv=none; b=RgF5TKXb8xkjcPlQR2ZND6uWcO24V1o0lsZeVyF/omW+ba54Eji/uYxWqWWvLeansDoNhSvc/ODe5fxE7rruY+Cw3qBJ7n2qxR7FWKiryQ6VkXFZh7gd+9WHDyO+jWalpGd/9EJ/aatovE77V0vUlZ7LzN8nvt/Ui8Eu0MPB4cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778513484; c=relaxed/simple;
	bh=G0Z50bVpGiKjs4tZY1mJsdTnXNWYVlklMrUj04w7wQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VY02uOiX5WRVVMEcugCsgf3dU6u0H5BFwJS4Hrd0R2MbAJ9dkqi+D4b1ImFVbOXuRZtH33URwMVDSUBa2erpd8yxE9Kcnw44fY1oNZDpqU1YJTzVEbVtTHgbwvJ7nUCYBinoEP6FrHesbIBsDybJYC3Q4shDic6IMWRMRaXnyfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sz09ODpX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9C88C2BCB0;
	Mon, 11 May 2026 15:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778513483;
	bh=G0Z50bVpGiKjs4tZY1mJsdTnXNWYVlklMrUj04w7wQc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sz09ODpXNa1Rs4KlENi7F1Zo+2dkaJhG0L85YjX72LLzSeQZcC5Cd8HO729jLgnZ1
	 ZhDegZawRhDgcM6yFPaSkVGFp0xgHhq49w28G6Vzzl7Pqt4qMeNZJ9B16+C/NSjgZU
	 id701MGlsKTETpnzK7HmXrxZ5di81aXP/gt1kurLStnHuyO/8iqUt4SegpMq/KTJWD
	 qrR8LoadPLRB4QOXB4cLYOS/t47DxLj3Zfb7M0xcQYcW7/fj5NcLopuWLJM/doD2Uq
	 htKEL1Dwu/b7ZdIFn15wSmcOc3/GRE/AszrUOwY70VvPiTGsfY+WRtyQfXAO5Y7zZZ
	 vO0mNjrjI16IQ==
Message-ID: <4dae3eb4-fe3a-4156-b69c-331ecd397946@kernel.org>
Date: Mon, 11 May 2026 17:31:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: uvcvideo: Fix dev_sof filtering in hw
 timestamp
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Yunke Cao <yunkec@google.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260323-uvc-hwtimestamp-v1-0-aa42e3865204@chromium.org>
 <20260323-uvc-hwtimestamp-v1-1-aa42e3865204@chromium.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260323-uvc-hwtimestamp-v1-1-aa42e3865204@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: AD618511623
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61140-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action

Hi,

On 23-Mar-26 14:10, Ricardo Ribalda wrote:
> To avoid filling the clock circular buffer with duplicated data we only
> add it if the new value sof is different than the last added sof.
> 
> The issue is that we compare the unprocess sof with the processed sof.
> If there is a sof_offset, or UVC_QUIRK_INVALID_DEVICE_SOF is enabled,
> the comparison will not work as expected.
> 
> This patch moves the comparison to the right place.
> 
> Fixes: 141270bd95d4 ("media: uvcvideo: Refactor clock circular buffer")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans




> ---
>  drivers/media/usb/uvc/uvc_video.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 40c76c051da2..6786ca38fe5e 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -583,16 +583,7 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>  	if (!has_scr)
>  		return;
>  
> -	/*
> -	 * To limit the amount of data, drop SCRs with an SOF identical to the
> -	 * previous one. This filtering is also needed to support UVC 1.5, where
> -	 * all the data packets of the same frame contains the same SOF. In that
> -	 * case only the first one will match the host_sof.
> -	 */
>  	sample.dev_sof = get_unaligned_le16(&data[header_size - 2]);
> -	if (sample.dev_sof == stream->clock.last_sof)
> -		return;
> -
>  	sample.dev_stc = get_unaligned_le32(&data[header_size - 6]);
>  
>  	/*
> @@ -664,6 +655,16 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>  	}
>  
>  	sample.dev_sof = (sample.dev_sof + stream->clock.sof_offset) & 2047;
> +
> +	/*
> +	 * To limit the amount of data, drop SCRs with an SOF identical to the
> +	 * previous one. This filtering is also needed to support UVC 1.5, where
> +	 * all the data packets of the same frame contains the same SOF. In that
> +	 * case only the first one will match the host_sof.
> +	 */
> +	if (sample.dev_sof == stream->clock.last_sof)
> +		return;
> +
>  	uvc_video_clock_add_sample(&stream->clock, &sample);
>  	stream->clock.last_sof = sample.dev_sof;
>  }
> 


