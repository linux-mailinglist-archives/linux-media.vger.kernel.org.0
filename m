Return-Path: <linux-media+bounces-58951-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOHtNDBT4Wl5rwAAu9opvQ
	(envelope-from <linux-media+bounces-58951-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 23:22:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C35414E4A
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 23:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B08473062E76
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 21:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 766BB38B7C1;
	Thu, 16 Apr 2026 21:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dTQYUx6z"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975EB31F9A7;
	Thu, 16 Apr 2026 21:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776374571; cv=none; b=GXbJ4mH3xEV+ctKi1dsp//14Y0w5uV2CekYrlyQ0bj72rCPQVHcI8Ll/fcYaNKGQGBW7xJP4YUGZ9l5Q18GEHgHTUMDQotFFiK8UvnE2rQKcokzb32e0uvLOlnDiP77YUJQgNzcQcYM7aq0q63PNxjFncE3xSEl6dmBkBE/Sm5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776374571; c=relaxed/simple;
	bh=/3zlN1PjzIilwOb1k4qfIqSA7sOgOcPW9cm66Paz/RY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NlS2690oWi5QJY0G5hWYbNeMdo61l2pSQ2dB0J5PwP6UWuvBFJFm0B/k5pKJ1Tj+OEMCbWhpB8eyY0I2+2PAM182iyBhqFh/Rtz52SiuwhLLTN4Z21PZXGGkzCH4aqu3PBmpDaq+/aMy5q1allsLgmNJzz5lMxIuI62DKPwlBqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dTQYUx6z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C4BE79C;
	Thu, 16 Apr 2026 23:21:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776374475;
	bh=/3zlN1PjzIilwOb1k4qfIqSA7sOgOcPW9cm66Paz/RY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dTQYUx6zPuZxh1mwF5/jfFLM13XpqZYgbvmLRLtdpVyQPIeMJY8JVCyVmvClWkIfh
	 Ki7X1Q586GNueuU7J4f8MilFPzHwtcoxT4G6cE6S8siRogVeTPUCSwIFaMjcX4biiR
	 1qStklNVsCSLJgXZ7WDcZkJGESE4W0ggVC67iN3Q=
Date: Fri, 17 Apr 2026 00:22:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: uvcvideo: Do not open code
 uvc_queue_get_current_buffer
Message-ID: <20260416212247.GE1824072@killaraus.ideasonboard.com>
References: <20260415-uvc-meta-partial-v1-0-a0acc79a6300@chromium.org>
 <20260415-uvc-meta-partial-v1-1-a0acc79a6300@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260415-uvc-meta-partial-v1-1-a0acc79a6300@chromium.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58951-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[killaraus.ideasonboard.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 49C35414E4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ricardo,

Thank you for the patch.

On Wed, Apr 15, 2026 at 03:59:57PM +0000, Ricardo Ribalda wrote:
> Do not re-implement uvc_queue_get_current_buffer() logic inside
> uvc_video_complete(), just call the function.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_video.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 40c76c051da2..4feb3699f520 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1693,7 +1693,6 @@ static void uvc_video_complete(struct urb *urb)
>  	struct vb2_queue *vb2_qmeta = stream->meta.queue.vdev.queue;
>  	struct uvc_buffer *buf = NULL;
>  	struct uvc_buffer *buf_meta = NULL;
> -	unsigned long flags;
>  	int ret;
>  
>  	switch (urb->status) {
> @@ -1719,13 +1718,8 @@ static void uvc_video_complete(struct urb *urb)
>  
>  	buf = uvc_queue_get_current_buffer(queue);
>  
> -	if (vb2_qmeta) {
> -		spin_lock_irqsave(&qmeta->irqlock, flags);
> -		if (!list_empty(&qmeta->irqqueue))
> -			buf_meta = list_first_entry(&qmeta->irqqueue,
> -						    struct uvc_buffer, queue);
> -		spin_unlock_irqrestore(&qmeta->irqlock, flags);
> -	}
> +	if (vb2_qmeta)
> +		buf_meta = uvc_queue_get_current_buffer(qmeta);
>  
>  	/* Re-initialise the URB async work. */
>  	uvc_urb->async_operations = 0;

-- 
Regards,

Laurent Pinchart

