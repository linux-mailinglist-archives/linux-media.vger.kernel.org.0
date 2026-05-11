Return-Path: <linux-media+bounces-61145-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MM4bO+X9AWppnAEAu9opvQ
	(envelope-from <linux-media+bounces-61145-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 18:03:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C666511C07
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 18:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67BB1306BA8B
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 15:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C0A7402B9C;
	Mon, 11 May 2026 15:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UyfOhyfO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E4F371068;
	Mon, 11 May 2026 15:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778514576; cv=none; b=cKKHLWYA5Sl55dJEz/GVD5HlB9qgjMtqjhSQrQZMw+ZYsJVnfyhrYNdn7q1SHP4eQOPJWiFDXOvZGWQEkdyY5trNMLR76wJ7uQagXDEsPsvVM9aoMa+JcYa1ejmSqOT3/O3SeEKkSlw00ASEYdtarFkxiTqp32nzJ4MPfBTMhCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778514576; c=relaxed/simple;
	bh=W5TVVZ6jHlKquxY4/gorNImpfWx/EUwufPwpk3+WIWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HAXcgEdmnhSkWSXl+u4QFMVKSZtoJfizLW3bd0ZoNHqfmC+g25cZHZ4AkK0lit83UqU2bUcopCp9nV2+tRjBjlJckoUEc4CLLCWyCNdKmiaAiib5Uiq3gdPDJHelDOrz0LZMw6QXFoaXNWw5bM1Ei3xFG6YBtxCaqzszqX85aRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UyfOhyfO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E70181544;
	Mon, 11 May 2026 17:49:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778514566;
	bh=W5TVVZ6jHlKquxY4/gorNImpfWx/EUwufPwpk3+WIWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UyfOhyfOKGIPXjHwMpiUuMi16HsymHyCwO52sqKqCz4LZo4as8wyOPSt0a1ess2oV
	 Cl0MFb7mRaunmpgon1Fyd97Vtqeuk8yDPVfCLOctYJeAHFMh7eyi36WchUUEUBDnc3
	 iwgI1AUduC5abcd7a9Pj75hm89Bc/urxbj2M8eI8=
Date: Mon, 11 May 2026 18:49:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Yunke Cao <yunkec@google.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/4] media: uvcvideo: Use hw timestaming if the clock
 buffer is full
Message-ID: <20260511154931.GC3043805@killaraus.ideasonboard.com>
References: <20260323-uvc-hwtimestamp-v1-0-aa42e3865204@chromium.org>
 <20260323-uvc-hwtimestamp-v1-2-aa42e3865204@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323-uvc-hwtimestamp-v1-2-aa42e3865204@chromium.org>
X-Rspamd-Queue-Id: 6C666511C07
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_FROM(0.00)[bounces-61145-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,chromium.org:email,killaraus.ideasonboard.com:mid]
X-Rspamd-Action: no action

On Mon, Mar 23, 2026 at 01:10:29PM +0000, Ricardo Ribalda wrote:
> In some situations, even with a full clock buffer, it does not contain
> 250msec of data. This results in the driver jumping back from software
> to hardware timestapsing creating a nasty artifact in the video.
> 
> If the clock buffer is full, use it to calculate the timestamp instead
> of defaulting to software stamps, the reduced accuracy is less visible
> than jumping from one timestamping mechanism to the other.
> 
> Fixes: 6243c83be6ee8 ("media: uvcvideo: Allow hw clock updates with buffers not full")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 6786ca38fe5e..c7ebedb3450f 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -842,7 +842,7 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
>  	 * dev_sof runs at 1KHz, and we have a fixed point precision of
>  	 * 16 bits.
>  	 */
> -	if ((y2 - y1) < ((1000 / 4) << 16))
> +	if (clock->size != clock->count && (y2 - y1) < ((1000 / 4) << 16))
>  		goto done;

This requires an update to the comment above.

>  
>  	y = (u64)(y2 - y1) * (1ULL << 31) + (u64)y1 * (u64)x2
> 

-- 
Regards,

Laurent Pinchart

