Return-Path: <linux-media+bounces-51307-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MwNMYiBcWk1IAAAu9opvQ
	(envelope-from <linux-media+bounces-51307-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 02:46:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3A5607BC
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 02:46:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5FE11440B40
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 01:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EB23366570;
	Thu, 22 Jan 2026 01:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m8qFLii4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA5C363C73;
	Thu, 22 Jan 2026 01:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769046323; cv=none; b=hvhcypAHwW8wzj1Id4579T0JypWZ10GIYNhljPANAU9b2NT6blKUb3xcPbO0Amc+gKj50TMUJQpxISucjQ9gXg6nEbQBvMkh/qQAGNdR8AgS4zJZodKaL+luBv78uF6D8uAD5YMON6f97z7LLhNbIV/Gico/3q0Bf6UhTtnGuFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769046323; c=relaxed/simple;
	bh=yTm4O0LXu0pRKM2xh0wPw/vWIt6Ap5PXK2Tlo3E+iNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BEz3kGSP5FpSxTxslz7bmk15KhPilmVjgIqpMZIApMo3QBrbVMY7NWH8bqB+aryQ4bWxAFVM8F+YUVDfQzqGdjeSweIqaiiddJYLYvim3mB0d7dU38N4ZMAjTUS+vxv//41dwTRNQkDpLyCeTfIXfMc/exdCMLay/aqBy1Zwwa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=m8qFLii4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--ff4.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::ff4])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 562632DD;
	Thu, 22 Jan 2026 02:44:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769046279;
	bh=yTm4O0LXu0pRKM2xh0wPw/vWIt6Ap5PXK2Tlo3E+iNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m8qFLii4RzUWmy4eJ6qbo2e7p431/XnJDR9IBNlw+lkaBtBoQLI/xcd3Ds6fpFQpp
	 7w0kC5HTQpSSi25zdkdxXqZiRJIlMQmaXWXcnulmNeZJvTme6KmYqIs/5nNGGpC9Ny
	 GBzdo7RZx2C/5v2xW6p0icHEFOzsXo6G/lTrNSJU=
Date: Thu, 22 Jan 2026 03:45:09 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Laurent Pinchart <laurent.pinchart@skynet.be>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Itay Chamiel <itay.chamiel@q.ai>
Subject: Re: [PATCH 1/3] media: uvcvideo: Fix allocation for small frame sizes
Message-ID: <20260122014509.GA183118@killaraus>
References: <20260114-uvc-alloc-urb-v1-0-cedf3fb66711@chromium.org>
 <20260114-uvc-alloc-urb-v1-1-cedf3fb66711@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260114-uvc-alloc-urb-v1-1-cedf3fb66711@chromium.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51307-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[ideasonboard.com,none];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,chromium.org:email]
X-Rspamd-Queue-Id: 6F3A5607BC
X-Rspamd-Action: no action

Hi Ricardo,

Thank you for the patch.

On Wed, Jan 14, 2026 at 10:32:13AM +0000, Ricardo Ribalda wrote:
> If a frame has size of less or equal than one packet size
> uvc_alloc_urb_buffers() is unable to allocate memory for it due to a
> off-by-one error.
> 
> Fix the off-by-one-error and now that we are at it, make sure that
> stream->urb_size has always a valid value when we return from the
> function, even when an error happens.
> 
> Fixes: efdc8a9585ce ("V4L/DVB (10295): uvcvideo: Retry URB buffers allocation when the system is low on memory.")
> Reported-by: Itay Chamiel <itay.chamiel@q.ai>
> Closes: https://lore.kernel.org/linux-media/CANiDSCsSoZf2LsCCoWAUbCg6tJT-ypXR1B85aa6rAdMVYr2iBQ@mail.gmail.com/T/#t
> Co-developed-by: Itay Chamiel <itay.chamiel@q.ai>
> Signed-off-by: Itay Chamiel <itay.chamiel@q.ai>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_video.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 2094e059d7d39ac5a196cbbd58f9bc997f1c1557..ec76595f3c4be0f49b798ec663d6855d78ab21c4 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1812,7 +1812,7 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
>  		npackets = UVC_MAX_PACKETS;
>  
>  	/* Retry allocations until one succeed. */
> -	for (; npackets > 1; npackets /= 2) {
> +	for (; npackets > 0; npackets /= 2) {
>  		stream->urb_size = psize * npackets;
>  
>  		for (i = 0; i < UVC_URBS; ++i) {
> @@ -1837,6 +1837,7 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
>  	uvc_dbg(stream->dev, VIDEO,
>  		"Failed to allocate URB buffers (%u bytes per packet)\n",
>  		psize);
> +	stream->urb_size = 0;
>  	return 0;
>  }
>  

-- 
Regards,

Laurent Pinchart

