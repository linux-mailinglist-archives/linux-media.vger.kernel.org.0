Return-Path: <linux-media+bounces-58952-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOwpMTpW4Wl5rwAAu9opvQ
	(envelope-from <linux-media+bounces-58952-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 23:35:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 41921414FA1
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 23:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE003304E514
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 21:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C4E836E465;
	Thu, 16 Apr 2026 21:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iha+taUg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B265351C24;
	Thu, 16 Apr 2026 21:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776375336; cv=none; b=opMLIO3ys+PG4w80Ik20Mok7h2gqF09kMNygZsbQy5rfUcj/7LhutQrSkGl8fBRCooGztWh8t3G7dx7EiOZtWNN1jzGllNMtMAHG+OW16V92kejCI0HT1nJtF//luRnFweFilRIpBEzkpHh6Pk/pwppJEMPNmeal/JWwEa6TKc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776375336; c=relaxed/simple;
	bh=WTrj1CG66jqJAQLXIjVk5mfn4CpCZATgQJqg6ppRJOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/IjLXcHPwDHW2rdvVvJVyNrv0SdK+7Xl46Co1+YD4Kh2CB13xrRTDyfDMWMO/U+Dv/ovUc7HQCZBtdM1xt2szYg37n5XkpEaUR9GrBKrwiY2/pREABci85NkYUvX/iH+lmO+RppxnLAKGUMfB0p+ik/LliRKd7Hf3eqPHoBTgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iha+taUg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 34D20107;
	Thu, 16 Apr 2026 23:33:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776375239;
	bh=WTrj1CG66jqJAQLXIjVk5mfn4CpCZATgQJqg6ppRJOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iha+taUgh10P93RkbJpZaiDj/XWC2Hgvk+aqfnvQ9xaCTE3cMzunPJHRIWcFBvf8g
	 8+BHiNkvu62IPVRvJt/pUo2kbJkfgVrzdzB361x/r5qLxQRKp4r9jcCx4sOSptV0A7
	 VHjztNr/GcIEf9Qp+BcakJoPk6+G1zwmTlJrwZg4=
Date: Fri, 17 Apr 2026 00:35:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: uvcvideo: Avoid partial metadata buffers
Message-ID: <20260416213532.GF1824072@killaraus.ideasonboard.com>
References: <20260415-uvc-meta-partial-v1-0-a0acc79a6300@chromium.org>
 <20260415-uvc-meta-partial-v1-2-a0acc79a6300@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260415-uvc-meta-partial-v1-2-a0acc79a6300@chromium.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58952-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:dkim,chromium.org:email]
X-Rspamd-Queue-Id: 41921414FA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ricardo,

Thank you for the patch.

On Wed, Apr 15, 2026 at 03:59:58PM +0000, Ricardo Ribalda wrote:
> If the metadata queue that is empty receives a new buffer while we are
> in the middle of processing a frame, the first metadata buffer will
> contain partial information.
> 
> Avoid this by tracking the state of the metadata buffer and making sure
> that it is in sync with the data buffer.
> 
> Now that we are at it, simplify the code a bit by not getting a metadata
> buffer if there is no data buffer ready.
> 
> Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 4feb3699f520..f339d6d19a39 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1517,6 +1517,8 @@ static void uvc_video_next_buffers(struct uvc_streaming *stream,
>  						  *meta_buf);
>  	}
>  	*video_buf = uvc_queue_next_buffer(&stream->queue, *video_buf);
> +	if (*video_buf && *meta_buf)
> +		(*meta_buf)->state = UVC_BUF_STATE_ACTIVE;
>  }
>  
>  static void uvc_video_decode_isoc(struct uvc_urb *uvc_urb,
> @@ -1718,9 +1720,23 @@ static void uvc_video_complete(struct urb *urb)
>  
>  	buf = uvc_queue_get_current_buffer(queue);
>  
> -	if (vb2_qmeta)
> +	if (buf && vb2_qmeta)
>  		buf_meta = uvc_queue_get_current_buffer(qmeta);
>  
> +	/*
> +	 * Avoid partial metadata buffers, by making sure that the data buffer
> +	 * and metadata buffer state is in sync.
> +	 *
> +	 * A new (QUEUED) buffer is only allowed to become ACTIVE if we are also
> +	 * at the start of a new data buffer.
> +	 */
> +	if (buf_meta && buf_meta->state == UVC_BUF_STATE_QUEUED) {
> +		if (buf->state != UVC_BUF_STATE_QUEUED)
> +			buf_meta = NULL;
> +		else
> +			buf_meta->state = UVC_BUF_STATE_ACTIVE;
> +	}
> +

This creates a different logic for video buffers and metadata buffers.
Wouldn't it be better to use the same logic, and transition the metadata
buffer to the ACTIVE state when we detect the beginning of a new frame ?

>  	/* Re-initialise the URB async work. */
>  	uvc_urb->async_operations = 0;
>  

-- 
Regards,

Laurent Pinchart

