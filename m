Return-Path: <linux-media+bounces-61150-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLHANnYEAmo3nQEAu9opvQ
	(envelope-from <linux-media+bounces-61150-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 18:31:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC33512314
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 18:31:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3096D315B1F5
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 16:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87ACB421A09;
	Mon, 11 May 2026 16:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mp71v5oD"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B462BF3F4;
	Mon, 11 May 2026 16:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778515631; cv=none; b=SSjxURdTgyIFsF4cU5ZAe8NN9M1RoJU9eQuSICSreKlYJTuLyMOP0PGLZIIBfPHLR2rssavA1WNLbfu+KLctvY+PyjfVuFmI4LnfX4NiAsX847b2ri51ngQ76pw78rv1vcsQfPb5OvU8IYz/EU8kHYQIQn11wq0k+pfEwbPds8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778515631; c=relaxed/simple;
	bh=sU1fdQDuvwzVITQYudQnCWDycxR3Cmx1BXsHnN8WXEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AmmdwndMdeuROK4TaN/0WqnD+3OUjRnpinv6SPT6p0xQwlRpE6y6lnqMCEQpLk++Cx/HGVO9y59yz+nRq0Z2st45WEkTClN59/Vnl+/8OJ1vWkMHx7RHt8kRlE6WjU9E6Caf7YyHFo01q1Q5PgQkRN4VuZ0+mea6ynhx9B+3XFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mp71v5oD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF947C2BCB0;
	Mon, 11 May 2026 16:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778515630;
	bh=sU1fdQDuvwzVITQYudQnCWDycxR3Cmx1BXsHnN8WXEI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Mp71v5oDt7VH4pqnzsHK5z/wOMnBIMgBtYPYCD40zsCUblqYxY4BE5Oiu5nAvMPpT
	 c1unqi3xFq2s16SD+Baf3e6CajSgBhCWAm8dskJC3vhN50SSGIL/dvOh/MuN1/4ESx
	 /+wClVEbBz8NwD5W5z3dTXS3IbhnLou2MUXlvjIU1jG2D3QfnbBPRyncssaUcInsa1
	 6f8J3trQ0fiul3pdwGSCKKV3uCFhITwx57m3b6eMBmt8O6U5z9dgMUmSxFXE91JSB+
	 VOfnGDuQKknj0juDvNNNnPpeRp2XA3XFczrrPyH9pY1o7fms8ikhKEUFT+i+pApwr5
	 wh/Xu3YJPFFew==
Message-ID: <10a08462-30ce-4a79-bb5d-001ab7f3d0d8@kernel.org>
Date: Mon, 11 May 2026 18:07:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] media: uvcvideo: Do not add clock samples with small
 sof delta
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Yunke Cao <yunkec@google.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260323-uvc-hwtimestamp-v1-0-aa42e3865204@chromium.org>
 <20260323-uvc-hwtimestamp-v1-4-aa42e3865204@chromium.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260323-uvc-hwtimestamp-v1-4-aa42e3865204@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: EEC33512314
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61150-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,chromium.org:email]
X-Rspamd-Action: no action

Hi,

On 23-Mar-26 14:10, Ricardo Ribalda wrote:
> Some UVC 1.1 cameras running in fast isochronous mode tend to spam the
> USB host with a lot of empty packets. These packets contain clock
> information and are added to the clock buffer but do not add any
> accuracy to the calculation. In fact, it is quite the opposite, in our
> calculations, only the first and the last timestamp is used, and we only
> have 32 slots.
> 
> Ignore the samples that will produce less than MIN_HW_TIMESTAMP_DIFF
> data.
> 
> Fixes: 141270bd95d4 ("media: uvcvideo: Refactor clock circular buffer")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index dcbc0941ffe6..e1a4e84d6841 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -544,6 +544,19 @@ static void uvc_video_clock_add_sample(struct uvc_clock *clock,
>  	spin_unlock_irqrestore(&clock->lock, flags);
>  }
>  
> +static inline u16 sof_diff(u16 a, u16 b)
> +{
> +	u32 aux;
> +
> +	a &= 2047;
> +	b &= 2047;
> +	if (a >= b)
> +		return a - b;
> +
> +	aux = a + 2048;
> +	return (u16)(aux - b);
> +}
> +
>  static void
>  uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>  		       const u8 *data, int len)
> @@ -664,12 +677,13 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>  	sample.dev_sof = (sample.dev_sof + stream->clock.sof_offset) & 2047;
>  
>  	/*
> -	 * To limit the amount of data, drop SCRs with an SOF identical to the
> +	 * To limit the amount of data, drop SCRs with an SOF similar to the
>  	 * previous one. This filtering is also needed to support UVC 1.5, where
>  	 * all the data packets of the same frame contains the same SOF. In that
>  	 * case only the first one will match the host_sof.
>  	 */
> -	if (sample.dev_sof == stream->clock.last_sof)
> +	if (sof_diff(sample.dev_sof, stream->clock.last_sof) <=
> +	    (MIN_HW_TIMESTAMP_DIFF / stream->clock.size))
>  		return;

If I understand things correctly then uvc_video_clock_update() uses
first->host_time + some correction time. But you might end up not
storing a sample for the very first isochronous USB packet of a frame
because of this new check.  Which means that the first->host_time used
as a starting point for the timestamp just has become inaccurate ?

Regards,

Hans



