Return-Path: <linux-media+bounces-61144-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDF7GQD9AWomnAEAu9opvQ
	(envelope-from <linux-media+bounces-61144-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 18:00:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F96511B80
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 17:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A87883091086
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 15:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D84402BA1;
	Mon, 11 May 2026 15:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SslE0Pfu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2E7402B83;
	Mon, 11 May 2026 15:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778514396; cv=none; b=HTnTpmbC6+90ymQOkEF1H+9LsETL5mbcfQ0nNY3DHcAnbEpJxhcCT2ixAPRcBOrlvsb3Eh9yat2BGGOrSJUnoc0rtKv8QyYZQj/7l0IhpafcdCEK4ImfTBW4JsgN1ytBbUu1krfQpSjrb5tKTI9slhymnF5/nSO0Ai6gi+WoaIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778514396; c=relaxed/simple;
	bh=PrPSKAnXBLfy63wfzWxv7f/T78+vQlZFjU+oK2ahnts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hiwwiP/LpqHee7/rpEnoaxJEk00X4xzs+pqkobwEXkV6r5SvqneFagOvdvBNEEgv4N3zkw3ouF8zT5CJGasg25d1+cEatq/4QN9IIqkUjBJYYXoNlOjk6GZVOJTjsxu7HzaykyTq5WM2n+nZnyeq1ONmYRDCB8Bx6aqE32HZ5ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SslE0Pfu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE0301544;
	Mon, 11 May 2026 17:46:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778514384;
	bh=PrPSKAnXBLfy63wfzWxv7f/T78+vQlZFjU+oK2ahnts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SslE0Pfur31Y8yF+ee/j8+0neeIGq9gX/1oLhYhNc63MJFRyeY12qNYjM8qGH91o8
	 6NJtul+kPFI+JhQFPk1iaKpWELeiQmO0HCp+NdqQLkZdv/lPxg+sf/4OPNTLHBciQn
	 uQFofONv2IfCC6KEG+O4sh0GKdelmNn5c2tfZvFk=
Date: Mon, 11 May 2026 18:46:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Yunke Cao <yunkec@google.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/4] media: uvcvideo: Fix dev_sof filtering in hw
 timestamp
Message-ID: <20260511154629.GB3043805@killaraus.ideasonboard.com>
References: <20260323-uvc-hwtimestamp-v1-0-aa42e3865204@chromium.org>
 <20260323-uvc-hwtimestamp-v1-1-aa42e3865204@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323-uvc-hwtimestamp-v1-1-aa42e3865204@chromium.org>
X-Rspamd-Queue-Id: C7F96511B80
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
	TAGGED_FROM(0.00)[bounces-61144-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email,ideasonboard.com:dkim]
X-Rspamd-Action: no action

Hi Ricardo,

Thank you for the patch.

On Mon, Mar 23, 2026 at 01:10:28PM +0000, Ricardo Ribalda wrote:
> To avoid filling the clock circular buffer with duplicated data we only
> add it if the new value sof is different than the last added sof.
> 
> The issue is that we compare the unprocess sof with the processed sof.
> If there is a sof_offset, or UVC_QUIRK_INVALID_DEVICE_SOF is enabled,
> the comparison will not work as expected.
> 
> This patch moves the comparison to the right place.
> 
> Fixes: 141270bd95d4 ("media: uvcvideo: Refactor clock circular buffer")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 40c76c051da2..6786ca38fe5e 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -583,16 +583,7 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>  	if (!has_scr)
>  		return;
>  
> -	/*
> -	 * To limit the amount of data, drop SCRs with an SOF identical to the
> -	 * previous one. This filtering is also needed to support UVC 1.5, where
> -	 * all the data packets of the same frame contains the same SOF. In that
> -	 * case only the first one will match the host_sof.
> -	 */
>  	sample.dev_sof = get_unaligned_le16(&data[header_size - 2]);
> -	if (sample.dev_sof == stream->clock.last_sof)
> -		return;
> -
>  	sample.dev_stc = get_unaligned_le32(&data[header_size - 6]);
>  
>  	/*
> @@ -664,6 +655,16 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>  	}
>  
>  	sample.dev_sof = (sample.dev_sof + stream->clock.sof_offset) & 2047;
> +
> +	/*
> +	 * To limit the amount of data, drop SCRs with an SOF identical to the
> +	 * previous one. This filtering is also needed to support UVC 1.5, where
> +	 * all the data packets of the same frame contains the same SOF. In that
> +	 * case only the first one will match the host_sof.
> +	 */
> +	if (sample.dev_sof == stream->clock.last_sof)
> +		return;
> +

We will now uncondtionally call some potentially more expensive
operations, in particular usb_get_current_frame_number(). Wouldn't it be
better to store the unprocessed SOF in the sample in addition to the
processed SOF, to allow early comparison ?

>  	uvc_video_clock_add_sample(&stream->clock, &sample);
>  	stream->clock.last_sof = sample.dev_sof;
>  }
> 

-- 
Regards,

Laurent Pinchart

