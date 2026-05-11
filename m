Return-Path: <linux-media+bounces-61126-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBotJsTaAWoDlgEAu9opvQ
	(envelope-from <linux-media+bounces-61126-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 15:33:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF12050F019
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 15:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 519763079398
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 13:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5311B34E744;
	Mon, 11 May 2026 13:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QBqQxvJU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCA336D500;
	Mon, 11 May 2026 13:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506138; cv=none; b=R2hUwUkjFeotrFkt/7GSvD10wZW0eD9miD7PeaaGWIsnDEeIhS1JLPmbWh1L30/msJ0HFSWKeusq6SKHJ8h++hr3llsmyCMR8pNu8urE9DfVpp3W/YnXDE4rqByLyDIZZTyFW6Cf+kc1uAapPA/BT7TK1dRuVkLw0eTQNVFDg88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506138; c=relaxed/simple;
	bh=nNxixuJUhfhl7hIfXw35FUOtHGYCtOuNjtKRD/hkEQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FXQNP3y/FS3pMirE73JSO99unZyAI5lFoikT7cVl4+aBaWShGZxjN/rCmBK3hvh3hOKTP1TPOqr1bjiFtPMzRnvYcZe9ZTMM2ChbsNyVNhYNVJRpDo6LtehR0lYb2Z9BYIcvA4IsacO2xlB7YzVQJ2SnfSxxe4FpEX+40NBuCD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QBqQxvJU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44AE9C2BCC9;
	Mon, 11 May 2026 13:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778506138;
	bh=nNxixuJUhfhl7hIfXw35FUOtHGYCtOuNjtKRD/hkEQ8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QBqQxvJUE/dTgXPJyEgSkRFf0HBbisRKBKJW3p7x+1Ss2cDBP0YW/XNAVd47jkwEp
	 iW6o5XRb5ey7/AltatrSc2YNNxfzoNIJB3E4K2RT6+5ZDkIhsyvRCDvl3v9CdOktGk
	 lh8ueRMrQ+zZg2GPXNr8BmPm2AYReWVmT1m4ENkvt3Uixh1l1baaGDaAudwyqbZmpN
	 OHcHFAprt1APhlQncZoCq7Y8j1g+6lUUJI0X8kKpF/rG7jQVmWpyfjh643pS5ObqWn
	 spJgKUKS3PamO+v4iotMwUHx/OQ11detP6JC/MCUqOY66iag6T8vxK4r6jTJe6N/aP
	 Myxa1J17vfEbg==
Message-ID: <80f3972a-f0ca-486b-a54d-82158f547f25@kernel.org>
Date: Mon, 11 May 2026 15:28:55 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: uvcvideo: Do not open code
 uvc_queue_get_current_buffer
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260417-uvc-meta-partial-v2-0-31d274af7d2d@chromium.org>
 <20260417-uvc-meta-partial-v2-1-31d274af7d2d@chromium.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260417-uvc-meta-partial-v2-1-31d274af7d2d@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: EF12050F019
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61126-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,chromium.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email]
X-Rspamd-Action: no action

Hi,

On 17-Apr-26 07:19, Ricardo Ribalda wrote:
> Do not re-implement uvc_queue_get_current_buffer() logic inside
> uvc_video_complete(), just call the function.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
>  drivers/media/usb/uvc/uvc_video.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 271c246a02ea..5d45c74c6041 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1704,7 +1704,6 @@ static void uvc_video_complete(struct urb *urb)
>  	struct vb2_queue *vb2_qmeta = stream->meta.queue.vdev.queue;
>  	struct uvc_buffer *buf = NULL;
>  	struct uvc_buffer *buf_meta = NULL;
> -	unsigned long flags;
>  	int ret;
>  
>  	switch (urb->status) {
> @@ -1730,13 +1729,8 @@ static void uvc_video_complete(struct urb *urb)
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
> 


