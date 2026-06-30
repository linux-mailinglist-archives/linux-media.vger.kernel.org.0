Return-Path: <linux-media+bounces-66070-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q8cwDoieQ2ofdgoAu9opvQ
	(envelope-from <linux-media+bounces-66070-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:46:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0E96E31AD
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:46:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=jctICgZB;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66070-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66070-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD4A13048DE1
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 10:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AFDD3E3C73;
	Tue, 30 Jun 2026 10:40:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3781C3F58EA;
	Tue, 30 Jun 2026 10:40:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782816048; cv=none; b=cfxh55LDA1HkSHNdrtKys31EwCeVSjlZEUQ+rg8et+P8wgjVRmF7vqY75Sf7MHUVycHtYIK8m0PODSMBsQsQU4jsYFWGJTYWvHkKnkszB+FrLrzcqyyweWVMwJj2BXUbIyNCg/91fCo5HqbmbqXds135h0KsqI+fRSfvhadetUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782816048; c=relaxed/simple;
	bh=VwOWHGrRgYbDNinXmM4mCqAk7KxGprWVCelgwaZ403M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rFgcpBsvkXOvzrQC7LMRvZhbdE8Kkm8VhEla3sEBTiBEGW858VJoPEgoVprM6kHJkYv8GwmwkRUnAF/FGhtBHpgGCLRuBsPCmaczfgkhEt5iM6dXNpOQm784eFylzwT04VYWfj1meRV1Loe47p3HnS4Wro5I79RydDu0RRAiHWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jctICgZB; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50967D52;
	Tue, 30 Jun 2026 12:39:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782815997;
	bh=VwOWHGrRgYbDNinXmM4mCqAk7KxGprWVCelgwaZ403M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jctICgZBuRtDLnJClwCAz8YrdlWs8xKqZZ5DnHurF/BTUFqUdC3+tyQSSf8zT2/sC
	 qfJGVOBi+B3CtgxYmwscgwS1JwJkUEFRtavIXt1JmatIjlpXtmO8fqZRcNPYU74slx
	 I5FMHThYw+84XTLYENBaRrG+hDQkj5bVEzez6x1Y=
Date: Tue, 30 Jun 2026 13:40:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Remove unused active field
Message-ID: <20260630104039.GB3199975@killaraus.ideasonboard.com>
References: <20260630-uvc-remove-active-v1-1-ed1421b99429@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630-uvc-remove-active-v1-1-ed1421b99429@chromium.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ribalda@chromium.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66070-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,killaraus.ideasonboard.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8D0E96E31AD

On Tue, Jun 30, 2026 at 10:28:50AM +0000, Ricardo Ribalda wrote:
> The active field in struct uvc_streaming is not used anymore, drop it.

Easy one, I like that :-)

> Reported-by: Hans de Goede <hansg@kernel.org>
> Closes: https://lore.kernel.org/linux-media/20260629-uvc-racemeta-v2-0-10e91d2afba0@chromium.org/T/#m3078f0d5fd71435b5cfacaa5c99f23a446db581f
> Fixes: c93d73c9c2cf ("media: uvcvideo: Use vb2 ioctl and fop helpers")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_video.c | 2 --
>  drivers/media/usb/uvc/uvcvideo.h  | 1 -
>  2 files changed, 3 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index fc3536a4399f..0167f0f8e846 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -2229,8 +2229,6 @@ int uvc_video_init(struct uvc_streaming *stream)
>  		return -EINVAL;
>  	}
>  
> -	atomic_set(&stream->active, 0);
> -
>  	/*
>  	 * Alternate setting 0 should be the default, yet the XBox Live Vision
>  	 * Cam (and possibly other devices) crash or otherwise misbehave if
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index b6bcee4a222f..021fd9af78b5 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -456,7 +456,6 @@ struct uvc_streaming {
>  	struct list_head list;
>  	struct uvc_device *dev;
>  	struct uvc_video_chain *chain;
> -	atomic_t active;
>  
>  	struct usb_interface *intf;
>  	int intfnum;
> 
> ---
> base-commit: 253355887a1ab0ac8f33b356c7c1140eee554d18
> change-id: 20260630-uvc-remove-active-8843181bcbb4

-- 
Regards,

Laurent Pinchart

