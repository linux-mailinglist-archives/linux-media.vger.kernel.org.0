Return-Path: <linux-media+bounces-61142-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OqBO/b3AWqcmwEAu9opvQ
	(envelope-from <linux-media+bounces-61142-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 17:38:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2AA511564
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 17:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B60C0303CC39
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 15:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62EFD402422;
	Mon, 11 May 2026 15:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c6AIXThI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57983FBEC7;
	Mon, 11 May 2026 15:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778513641; cv=none; b=tWi3OwzyiVAme42gtzgu4D91p0GfoFAC0DNT80alalK3Id4saTqJIot2Q6tgmumPS8enf9kPj/ouwcCipQP70DlcMVjENurfVgQGn1JQidROE/AIpbmHZt7tyPUGadPE3BLG2iq+vkO/di1PW/ARhyC0WRy521/iPsg4cJjUgpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778513641; c=relaxed/simple;
	bh=tpucqBj5L2KIFfzz/gYAoELO2yy4xnrUBIOiwqW+DtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bn36tgCM3TSLZvfOGerQMZVvnSfisZOlnenlu4neI4iHnH8l9ri3iZWkxlPdHyFsA9pe1A25FGM+TnDEC2Svzp09d+hvtHeV5vYuFg1eUM4qxuMurQV8Syzr82+rVeBHGvOQ9vRmgG78U6G4C5Q0lBNkNc7UN+Q8/MMF/11wtXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c6AIXThI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D612BC2BCB0;
	Mon, 11 May 2026 15:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778513641;
	bh=tpucqBj5L2KIFfzz/gYAoELO2yy4xnrUBIOiwqW+DtM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c6AIXThI/kg7pQyGHoR7DEbScTMYKjIusSpMegFdkgI3hg2l1kSlkX6QFHVgRKB8V
	 tuVoCXrxvUi0F9eMJqOTM1w883pFucYgOZ/a7vCntUaffsw9WA/tyKteN27NJK+Pm3
	 06s0kkcgM/uWnktaFSIe6rZrY4Qalu4WiVf07occ/lJIzkroGGJQdJ2m8Ru5jRZ1Vd
	 Ig7+gXB634VmqHz1R7HgMX6qtaTd/5VPSUXTlxseHzcD/7xw8Ch2bBPNjoc29QtQ2x
	 U/t1cG4+eIisOH/i9zTz9BKJRkblcBkbzaRBNK5gmbP5eX+3COyg4Ho5J0FWmBSO0c
	 qpg6hHpefhSIA==
Message-ID: <43c521f8-f3c2-40c1-bb9b-04ffcf079c47@kernel.org>
Date: Mon, 11 May 2026 17:33:58 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] media: uvcvideo: Relax the constrains for
 interpolating the hw clock
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Yunke Cao <yunkec@google.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260323-uvc-hwtimestamp-v1-0-aa42e3865204@chromium.org>
 <20260323-uvc-hwtimestamp-v1-3-aa42e3865204@chromium.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260323-uvc-hwtimestamp-v1-3-aa42e3865204@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9A2AA511564
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61142-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email,qualcomm.com:email]
X-Rspamd-Action: no action

Hi,

On 23-Mar-26 14:10, Ricardo Ribalda wrote:
> In the initial version we set the min value to 250msec. Looks like
> 100msec can also provide a good value.
> 
> Now that we are at it, refactor a bit the code to make it cleaner.
> 
> Fixes: 6243c83be6ee8 ("media: uvcvideo: Allow hw clock updates with buffers not full")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



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
> 


