Return-Path: <linux-media+bounces-61913-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPIEEtjWCmqc8gQAu9opvQ
	(envelope-from <linux-media+bounces-61913-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 11:07:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EEB5695C0
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 11:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8749F303CD2B
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 09:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6333AF666;
	Mon, 18 May 2026 09:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iKqx1a+d"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419CD3E3DBC;
	Mon, 18 May 2026 09:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779094931; cv=none; b=p5axATon2g3mnp7ym4eVIBdwsGQPPYHyhdtqEiD5QVlDC4TKdOlFFaFlzOYYVU9CEGCk7aW1rNq78iJgNzDr125f/847HQZCFQmsnKQdvCAcbkqFUlkxwibl69w3sak1jFZGqSymVZAevwsgT7stZ2RVgFk7UzySilqh4MHQKB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779094931; c=relaxed/simple;
	bh=SSjjersVTKJA4FOC/CVG6OACyKVEf8Rke3dGLsiTrMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VR3hpZjg0Wh2+oOUhEfQLVk3HmuIo0rOybucj9T63tp7Rr2R5/pycrMU5cxhpiNOfhyeammU4b8R1mBFDPgcylMHBFzqfxu10ky7FQ0BevHuZpsRDKaIFZRpXzpBwBhQJEuHW+nl9RlJDWr81igT1yoH7ZeWqYdr+Mi/tAsyAoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iKqx1a+d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F358C2BCB7;
	Mon, 18 May 2026 09:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779094930;
	bh=SSjjersVTKJA4FOC/CVG6OACyKVEf8Rke3dGLsiTrMU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iKqx1a+dqZcroncIrlXCc+vwMQQOPvntOnct6USEj5K5tXNsKLvFRw1ms1V738fGC
	 reaIxHsTB4J9dCouaHAk6c2mJu/OyHNn1zR6JiCduP4/ZqedLrIXnUb7xaWfUWdR9j
	 uXzb65B0gmyHb9dgvrMXUluXqpifddr/hgyzmWYvx4lDvw91bdWt8gZGVc6wsPEt4C
	 hSblaMDPlfnne4ok/EygSC2PIECC8UzWatzc7iIcOfETHc0DhV5SqTH3IEz9inN35e
	 4OKsvR82Bf9x2+LFf5vof3UB3xG5TXQU6qoKxis+v8uVjMjvnU4PC0Rol3FcRacfAU
	 nDEf1nNa5rxhg==
Message-ID: <b5995c59-5413-4705-90ae-8a153fd34f09@kernel.org>
Date: Mon, 18 May 2026 11:02:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] media: uvcvideo: Do not add samples if dev_sof has
 not changed
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Yunke Cao <yunkec@google.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260513-uvc-hwtimestamp-v3-0-7a64838b0b02@chromium.org>
 <20260513-uvc-hwtimestamp-v3-5-7a64838b0b02@chromium.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260513-uvc-hwtimestamp-v3-5-7a64838b0b02@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B7EEB5695C0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61913-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,chromium.org:email,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi,

On 13-May-26 1:49 PM, Ricardo Ribalda wrote:
> We only save relevant samples into the circular buffer. If the data is
> very similar to the previous one, exit early, this allows us to avoid
> some expensive operations such as usb_get_current_frame_number().
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans


> ---
>  drivers/media/usb/uvc/uvc_video.c | 16 +++++++++++-----
>  drivers/media/usb/uvc/uvcvideo.h  |  3 ++-
>  2 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 63850b779e24..6794031cd0fb 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -524,7 +524,7 @@ static void uvc_video_clock_add_sample(struct uvc_clock *clock,
>  
>  	spin_lock_irqsave(&clock->lock, flags);
>  
> -	if (clock->count > 0 && clock->last_sof > sample->dev_sof) {
> +	if (clock->count > 0 && clock->last_sof_processed > sample->dev_sof) {
>  		/*
>  		 * Remove data from the circular buffer that is older than the
>  		 * last SOF overflow. We only support one SOF overflow per
> @@ -599,7 +599,12 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>  	if (!has_scr)
>  		return;
>  
> -	sample.dev_sof = get_unaligned_le16(&data[header_size - 2]);
> +	sample.dev_sof = get_unaligned_le16(&data[header_size - 2]) & 2047;
> +	/* If the sample SOF is identical to the previous one, quit early. */
> +	if (stream->clock.last_sof_raw == sample.dev_sof)
> +		return;
> +	stream->clock.last_sof_raw = sample.dev_sof;
> +
>  	sample.dev_stc = get_unaligned_le32(&data[header_size - 6]);
>  
>  	/*
> @@ -678,19 +683,20 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>  	 * all the data packets of the same frame contains the same SOF. In that
>  	 * case only the first one will match the host_sof.
>  	 */
> -	if (sof_diff(sample.dev_sof, stream->clock.last_sof) <=
> +	if (sof_diff(sample.dev_sof, stream->clock.last_sof_processed) <=
>  	    (UVC_MIN_HW_TIMESTAMP_DIFF / stream->clock.size))
>  		return;
>  
>  	uvc_video_clock_add_sample(&stream->clock, &sample);
> -	stream->clock.last_sof = sample.dev_sof;
> +	stream->clock.last_sof_processed = sample.dev_sof;
>  }
>  
>  static void uvc_video_clock_reset(struct uvc_clock *clock)
>  {
>  	clock->head = 0;
>  	clock->count = 0;
> -	clock->last_sof = -1;
> +	clock->last_sof_processed = -1;
> +	clock->last_sof_raw = -1;
>  	clock->last_sof_overflow = -1;
>  	clock->sof_offset = -1;
>  }
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 4ba35727e954..b6bcee4a222f 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -522,7 +522,8 @@ struct uvc_streaming {
>  		unsigned int size;
>  		unsigned int last_sof_overflow;
>  
> -		u16 last_sof;
> +		u16 last_sof_processed;
> +		u16 last_sof_raw;
>  		u16 sof_offset;
>  
>  		u8 last_scr[6];
> 


