Return-Path: <linux-media+bounces-52198-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMb+Cmpwg2mFmwMAu9opvQ
	(envelope-from <linux-media+bounces-52198-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 17:14:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD2CEA06F
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 17:14:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3901E31AE7B7
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 15:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C192E41322A;
	Wed,  4 Feb 2026 15:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uWZeAAhP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EC53C196E;
	Wed,  4 Feb 2026 15:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770219608; cv=none; b=q08tOF8uUlw0vjd05l/tbCXfCbWV5K4m4IAr8qZuG15Kxb2cZFCokvf7jHwTWg06o/QNaKG+wehrlgNEWXWLxAKD09JMk2fWKqbkAxDoyJo43mQH/7+To1jEChnuO8PWFT5OR5UZE5esjqYhRmCbRf+9zfh0iXDEycjMJq9PPls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770219608; c=relaxed/simple;
	bh=k/NqlQg5q0j9YmWqv6NdYnAWug6KE79uSpKt3AsYqMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nanzfB5qdOYSpBelSCtfAy6EvI1DdJu0+uqJqiyr3G87OZwjy7MIH+OWNlNU/i6Ys44nOJrp7P4mdOkd5VJvNYqb2d3Lt+GfAA9/6HW+ZfM5YBbw4qXNhUm5laj4kI05MaWlDk/jqrpGRQ+1yAyBCRrqpqGtM6heq6bLym/6YD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uWZeAAhP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--ff4.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::ff4])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id AB6EA5B2;
	Wed,  4 Feb 2026 16:39:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770219563;
	bh=k/NqlQg5q0j9YmWqv6NdYnAWug6KE79uSpKt3AsYqMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uWZeAAhP9Sj3M9Mf6WsEu7TsPgU72Mj6rpeR0OighCytzTbtbchisuVFpkx8wDMiN
	 J9Md0fUp+ibtdUR8DFZ5ndSX3s+7gMuO+NOeNxJgfqkc6KN7ya+n6CN78ltq7hPwE2
	 z9MJtZNjqKtEyDbl8LCa1lO5KbpmPgXPlPbdr1/U=
Date: Wed, 4 Feb 2026 17:40:04 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: linux-media@vger.kernel.org, dafna@fastmail.com, mchehab@kernel.org,
	heiko@sntech.de, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 5/6] media: rkisp1: Give buffers back instead of
 dropping in bypass mode
Message-ID: <20260204154004.GB170964@killaraus>
References: <20260204112506.3706049-1-isaac.scott@ideasonboard.com>
 <20260204112506.3706049-6-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260204112506.3706049-6-isaac.scott@ideasonboard.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52198-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,fastmail.com,kernel.org,sntech.de,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 3BD2CEA06F
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 11:25:05AM +0000, Isaac Scott wrote:
> In the data mode used for YUV passthrough, falling VSYNC events are used
> to determine when a buffer is complete. This means there is no 'Frame
> End' signal.
> 
> Previously, all buffers would be dropped when bypass mode was active.
> Instead of dropping every frame, we should return the buffer to user
> space if it is marked as complete by a falling VSYNC signal.
> 
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index 867cdddf9f89..2753be39ab33 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -832,6 +832,11 @@ irqreturn_t rkisp1_capture_isr(int irq, void *ctx)
>  	for (i = 0; i < dev_count; ++i) {
>  		struct rkisp1_capture *cap = &rkisp1->capture_devs[i];
>  
> +		if (rkisp1->in_bypass) {
> +			rkisp1_handle_buffer(cap);
> +			continue;
> +		}
> +

You're completing the buffer if *any* interrupt bit is set, this doesn't
seem right. At the moment we may not enable interrupts other than the
one you expect, but that may change later, and this will misbehave.
You're also not handling the stopping logic, which also seems wrong.

Finally, what interrupt bit do you expect to see ? There's no VSYNC
interrupt in the RKISP1_CIF_MI_MIS register. Are you relying on the fact
that your platform has a single interrupt line for the three interrupt
sources (CSI2, ISP and MI), and react to the VSYNC interrupt from the
ISP interrupt here ? That's not right either, not only will it not work
on platforms that have three separate interrupt lines, but it will also
cause rkisp1_handle_buffer() to be called for *any* ISP interrupt.

I'm surprised that the frame end interrupt doesn't fire. It's part of
the MI, not the ISP, so it shouldn't be affected by bypass mode. You
should investigate that.

>  		if (!(status & RKISP1_CIF_MI_FRAME(cap)))
>  			continue;
>  		if (!cap->is_stopping) {

-- 
Regards,

Laurent Pinchart

