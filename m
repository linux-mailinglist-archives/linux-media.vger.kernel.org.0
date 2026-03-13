Return-Path: <linux-media+bounces-55749-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDq6K2NBtGk4kAAAu9opvQ
	(envelope-from <linux-media+bounces-55749-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:54:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 458CD2879E8
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:54:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D724A32226F0
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E253C9EFA;
	Fri, 13 Mar 2026 16:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JJZIZe/H"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59733A8740;
	Fri, 13 Mar 2026 16:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773420669; cv=none; b=cSk2bjJ0njTAlVZe4vV6lFFJwhTEwbLecV6llsEB148CZv1yDYX3rL5vwS/Q5M4ipWtQfZ/IguIAzudpOStt+oGC5zR0pnQ4uDvu5q5+reHLaAoq3FkpcRbG2yiVFXFIMZVkzD77OJHU0WVaNJSjmwUDdJWnBaKx+GgzSXGO2NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773420669; c=relaxed/simple;
	bh=+iT0GYpOQ6TTpQRX1jkzQRtz8H4ljY4hR2BgW8tTBjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KV9yBBIna4ARFB+6yLiuG6olHGl1qOzzz1LVT9ge6WExZTbiCMUphDRYaWWVWaYesjlC/3ACJdlQe4tBFPgXUb8QF2Ye5VcjU7pTpSohe2k3MILc1mKbo6cHldLz6Scyy5MXO0cmVZgeuWlCmtJw5d9EvQvyuiZTgyhYe9f2q+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JJZIZe/H; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (unknown [88.128.88.5])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id AF816F52;
	Fri, 13 Mar 2026 17:49:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773420597;
	bh=+iT0GYpOQ6TTpQRX1jkzQRtz8H4ljY4hR2BgW8tTBjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JJZIZe/HKp0TIyx6DMfN56+bSzB8IiPmWf7Rqon60ZYd7XUxzPiDBWqW145FXWTeB
	 jjuEzEb+gHM+OFGKF6+Ex8M1Bv17qKrIszeRrIl5G+iyTIsSowl6xusiPAt49sjdvw
	 L4ubPDStO9oKt5t82Sk8819k1pGj2tU9fCETHxXA=
Date: Fri, 13 Mar 2026 17:51:05 +0100
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yunke Cao <yunkec@google.com>, stable@kernel.org
Subject: Re: [PATCH] media: uvcvideo: Fix buffer sequence in frame gaps
Message-ID: <20260313165105.GE275549@killaraus.ideasonboard.com>
References: <20260310-uvc-fid-v1-1-5e37dc3c7024@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310-uvc-fid-v1-1-5e37dc3c7024@chromium.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55749-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[killaraus.ideasonboard.com:mid,ideasonboard.com:dkim,chromium.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 458CD2879E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 11:54:24AM +0000, Ricardo Ribalda wrote:
> In UVC, the FID flips with every frame. For every FID flip, we increase
> the sequence number. Userpace use that information to figure out if
> there has been a gap between frames.
> 
> Now, we only update the sequence number on the first FID flip, which
> results in frames being incorrectly numbered just after a frame gap.

The sequence number is increased on every FID flip. I assume you mean
that we don't set the buffer sequence number in some cases. "on the
first FID flip" doesn't seem right. Could you please improve the commit
message to describe more clearly what the problem is ?

> This patch rewrites the sequence number of the buffer in those
> situations.
> 
> Cc: stable@kernel.org
> Fixes: 650b95feee35 ("[media] uvcvideo: Generate discontinuous sequence numbers when frames are lost")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 40c76c051da2..ec769a504569 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1176,6 +1176,14 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>  		stream->sequence++;
>  		if (stream->sequence)
>  			uvc_video_stats_update(stream);
> +
> +		/*
> +		 * If we have not received any data and FID flips, update the
> +		 * sequence number of the buffer to tell userspace exactly
> +		 * where the frame gap is.
> +		 */
> +		if (buf && !buf->bytesused)
> +			buf->buf.sequence = stream->sequence;

Do we still need to set buf->buf.sequence below ? And how about the
buffer timestamp, isn't it also not set in the case that this patch
addresses ?

>  	}
>  
>  	uvc_video_clock_decode(stream, buf, data, len);
> 
> ---
> base-commit: a7da7fb57f2a787412da1a62292a17fa00fbfbdf
> change-id: 20260310-uvc-fid-e1e55447b6f1

-- 
Regards,

Laurent Pinchart

