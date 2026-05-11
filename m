Return-Path: <linux-media+bounces-61141-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKy7B5D4AWrOmwEAu9opvQ
	(envelope-from <linux-media+bounces-61141-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 17:41:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8173D511613
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 17:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4FCDF311E8E9
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 15:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E68402424;
	Mon, 11 May 2026 15:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VAIXBCeV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43A82D94BA;
	Mon, 11 May 2026 15:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778513496; cv=none; b=HwAWYExgHipSAFzcPhOwjY5k7aE+EdpiCgweWNcsnnnDlOBbSQ68eHTovsm0T5PVBY2y6AcTlINHbDefPrZ7vUhvalPge54CJvBPWL6oA3i9WZlqg7Hf80gSP9ng9vZyx8EgGYa7qjzzwGinan05VXOET9+F8wm/f7KSTEUm/FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778513496; c=relaxed/simple;
	bh=FTbK8DZqrwaVSWxpdTK9x/JBNGw1a2x27TTR4YONECU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C980xslll1NSVl1l6zuoLcdweMFFUG7r6CwEZWD55P+MiKIWrpwiUHYquJrhGO02Bt/KhfD7yG58Kp7WxmUtoL5J87lP0WJzUZxzI0obyfpGWMQT2qmWyX6o5O62iWQCUr7eT8kMOfmxvdwBwh730fnmYbuDwTar/JFV7EQyClg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VAIXBCeV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0BD1C2BCB0;
	Mon, 11 May 2026 15:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778513496;
	bh=FTbK8DZqrwaVSWxpdTK9x/JBNGw1a2x27TTR4YONECU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VAIXBCeV0k8KntYgkPCZ23nfN+nuYeC9F7Sl5CAo7w3XKyNTVmJ2+QdOiyc/5T0AT
	 /ucHWopjVU8Srox8ZnHnEg2ARKzMCOgRvm+fL1cu9UIp2HtFcAsr7BoUoUQyKQgYGz
	 AyziJNS857oCjwZzm0COYSyvbk0SdTPD+NgCfrDYAq8nKsC9RjfREVsin4ojMTOfEE
	 9J+cawJ5tEN3u9A0pYy1EWEYotX27JvLZYkEuek/8+bDclwqVw/Nv1CjkFNG3lUdpJ
	 iRGsU4VOzDy0LzG03sQb2hMaYGMWuGi4h8y0/6bC+62U3Wej6qLWwAf59ff+8f1gzu
	 QGLuvud/UV+/A==
Message-ID: <32eec99d-c4d6-4d30-823f-b5e0f8d5ded0@kernel.org>
Date: Mon, 11 May 2026 17:31:33 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: uvcvideo: Use hw timestaming if the clock
 buffer is full
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Yunke Cao <yunkec@google.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260323-uvc-hwtimestamp-v1-0-aa42e3865204@chromium.org>
 <20260323-uvc-hwtimestamp-v1-2-aa42e3865204@chromium.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260323-uvc-hwtimestamp-v1-2-aa42e3865204@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 8173D511613
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61141-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action

Hi,

On 23-Mar-26 14:10, Ricardo Ribalda wrote:
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

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans




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
>  
>  	y = (u64)(y2 - y1) * (1ULL << 31) + (u64)y1 * (u64)x2
> 


