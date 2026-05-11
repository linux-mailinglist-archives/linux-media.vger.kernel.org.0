Return-Path: <linux-media+bounces-61146-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKlLJzn+AWppnAEAu9opvQ
	(envelope-from <linux-media+bounces-61146-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 18:05:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 20862511C4F
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 18:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBDE6303B4C6
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 15:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C0AE406268;
	Mon, 11 May 2026 15:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SAF3mzL+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA813FD159;
	Mon, 11 May 2026 15:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778514688; cv=none; b=b18AJ8xa12ll4vSiP+h5BSiO+1ejEq48YGwiKNp/2lWq6TYyY57jR1AUYMFdcXP7NcH6SwCrhfQKeYecxkrFZc+CZ+ShPC0dyxkEE8997NCsgvyYXSA65Uo2hJu1fGUtHZmCrp3ZjVPM6DD4F+BG92s+rGQcN/Oe/b1iOAgr4z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778514688; c=relaxed/simple;
	bh=NOHfNu9xNGfuXF67ZeUUrGTfjl5LCyhMfC8lmNpnkKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BQfQja+pdSquoMgsfSIZk1hJEUO2MKFeXLf+69O8sDWObWHDLEVInd7se5yWL/Wza0DlokzjCAnqtCLM9eahblU7azoPlvWOuQAleiDDcRzwaFmSKyKt5FGn7t9+SdUZBKMUjeHjinQPF8VCY1Bpp+BeOFO0F572eibPNj1Hyto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SAF3mzL+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 26EC01544;
	Mon, 11 May 2026 17:51:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778514679;
	bh=NOHfNu9xNGfuXF67ZeUUrGTfjl5LCyhMfC8lmNpnkKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SAF3mzL+biCc27EWgqKYk4rp+eQJfFdSbRo4GfM6bI1Brq/pcSW8IR18zkGV8KJxF
	 aeZzqF2kytFh2vW0xL/sJ9EZY/PHMtCLRsZKitmCceHaTGJov2prap6kJcLO3GkhcF
	 H9L8PbQ+HrYqSze6OfGTUB8qY0Q/iWjPp0adGWMA=
Date: Mon, 11 May 2026 18:51:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Yunke Cao <yunkec@google.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 3/4] media: uvcvideo: Relax the constrains for
 interpolating the hw clock
Message-ID: <20260511155125.GD3043805@killaraus.ideasonboard.com>
References: <20260323-uvc-hwtimestamp-v1-0-aa42e3865204@chromium.org>
 <20260323-uvc-hwtimestamp-v1-3-aa42e3865204@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323-uvc-hwtimestamp-v1-3-aa42e3865204@chromium.org>
X-Rspamd-Queue-Id: 20862511C4F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_FROM(0.00)[bounces-61146-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid,chromium.org:email,ideasonboard.com:dkim]
X-Rspamd-Action: no action

On Mon, Mar 23, 2026 at 01:10:30PM +0000, Ricardo Ribalda wrote:
> In the initial version we set the min value to 250msec. Looks like
> 100msec can also provide a good value.

I'd like to know where the value comes from and how it has been tested.

> Now that we are at it, refactor a bit the code to make it cleaner.

Do you mean using a macro ? You can mention that explicitly here.

> Fixes: 6243c83be6ee8 ("media: uvcvideo: Allow hw clock updates with buffers not full")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index c7ebedb3450f..dcbc0941ffe6 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -494,6 +494,13 @@ static int uvc_commit_video(struct uvc_streaming *stream,
>   * Clocks and timestamps
>   */
>  
> +/*
> + * The accuracy of the hardware timestamping depends on having enough data to
> + * interpolate between the different clock domains. This value is sof cycles,
> + * this is, milliseconds.
> + */
> +#define MIN_HW_TIMESTAMP_DIFF 100

UVC prefix.

> +
>  static inline ktime_t uvc_video_get_time(void)
>  {
>  	if (uvc_clock_param == CLOCK_MONOTONIC)
> @@ -834,15 +841,12 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
>  		y2 += 2048 << 16;
>  
>  	/*
> -	 * Have at least 1/4 of a second of timestamps before we
> -	 * try to do any calculation. Otherwise we do not have enough
> -	 * precision. This value was determined by running Android CTS
> -	 * on different devices.
> +	 * Check that we have enough data to do the interpolation.
>  	 *
> -	 * dev_sof runs at 1KHz, and we have a fixed point precision of
> -	 * 16 bits.
> +	 * y1 and y2 are dev_sof with a fixed point precision of 16 bits.
>  	 */
> -	if (clock->size != clock->count && (y2 - y1) < ((1000 / 4) << 16))
> +	if (clock->size != clock->count &&
> +	    (y2 - y1) < (MIN_HW_TIMESTAMP_DIFF << 16))
>  		goto done;
>  
>  	y = (u64)(y2 - y1) * (1ULL << 31) + (u64)y1 * (u64)x2

-- 
Regards,

Laurent Pinchart

