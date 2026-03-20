Return-Path: <linux-media+bounces-56519-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCd4EWI7vWkH8AIAu9opvQ
	(envelope-from <linux-media+bounces-56519-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 13:19:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A38952DA0BE
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 13:19:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5119530DA231
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 12:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C31F3AA517;
	Fri, 20 Mar 2026 12:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N9tkcrIr"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AAC3612C5;
	Fri, 20 Mar 2026 12:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774009042; cv=none; b=m/bQVdWOXlikXmdxeGns+1Wjfxa0shmaibza8clJMBcueLtGARyYt6TIX7D5x5ZiIM6JE4TWLdYsWB9tXUXAIg4hlEzzxQzZ9bJg6mpHN1mGTy6GczlWSmidPHdoZ0A7iPamNE8Uwo4q+pauxXEzogBw5NlrSJpAZgwj/nMMC5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774009042; c=relaxed/simple;
	bh=DrP/s0EvCDQ/6Dc+7/1HfcgGkpJ4MNhHnk6+W9Gedy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IjG03pRdGrI6PVrNFK8IiTrUdzA4oba0YhmYSawR/eRyP8MdHwkjIt17Ldoiv665iARy7x6hlyRWKibxWDjQytXhgdNGUq28lr2L1IAytSgnCgrG36RUA09BXawMb6wALJll73rHKwtNp0B0jM54/8Etz9t1LaBv1S9X8vR/sow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N9tkcrIr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14946C4CEF7;
	Fri, 20 Mar 2026 12:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774009041;
	bh=DrP/s0EvCDQ/6Dc+7/1HfcgGkpJ4MNhHnk6+W9Gedy8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N9tkcrIraHfbyYGPkIBWYeLDFx+CYMQ4lbaC7IYy+5uICvSH4ewtolRASTihIyvNX
	 DTN+3wAjkoDUjA3DeiLLFUrVygSwwYWpK/tlQPvo/ksagMD7Ioz4m1AL3zdmAaWld1
	 pRbhb4H4IuDhp2eJmlNAZgfUX/fun6GdHEUW+mu+VfccwHeSuHE/Av37WevZDJ4jq1
	 252oAUWIyiRP0HJ26NIrIc1iEqxbyxinTDO9jei359NuHFm3IExhLdbvg+LjtVlYzB
	 paqM8Qpjyu5ueA3BVrRtez40nlFeCDuvtgPOZKCfeb28ksxAR3YrkZTL+pWtd15dDL
	 tOftRkMwfaAjg==
Message-ID: <19945fe0-fb8e-4c20-a2d8-2fc8273b0978@kernel.org>
Date: Fri, 20 Mar 2026 13:17:17 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] media: uvcvideo: Fix sequence number when no EOF
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yunke Cao <yunkec@google.com>, stable@kernel.org
References: <20260316-uvc-fid-v3-0-c793354469b5@chromium.org>
 <20260316-uvc-fid-v3-2-c793354469b5@chromium.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260316-uvc-fid-v3-2-c793354469b5@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-56519-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A38952DA0BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 16-Mar-26 14:30, Ricardo Ribalda wrote:
> If the driver could not detect the EOF, the sequence number is increased
> twice:
>  1) When we enter uvc_video_decode_start() with the old buffer and FID has
>    fliped => We return -EAGAIN and last_fid is not flipped
>  2) When we enter uvc_video_decode_start() with the new buffer.
> 
> Fix this issue by saving last_fid on the first FID flip.
> 
> Cc: stable@kernel.org
> Fixes: 650b95feee35 ("[media] uvcvideo: Generate discontinuous sequence numbers when frames are lost")
> Reported-by: Hans de Goede <hansg@kernel.org>
> Closes: https://lore.kernel.org/linux-media/CANiDSCuj4cPuB5_v2xyvAagA5FjoN8V5scXiFFOeD3aKDMqkCg@mail.gmail.com/T/#me39fb134e8c2c085567a31548c3403eb639625e4
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 9e06b1d0f0f9..3e6ded69388f 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1254,6 +1254,12 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>  		uvc_dbg(stream->dev, FRAME,
>  			"Frame complete (FID bit toggled)\n");
>  		buf->state = UVC_BUF_STATE_READY;
> +
> +		/*
> +		 * If the EOF detection has failed, we need to save the last_fid
> +		 * to avoid increasing the sequence number twice.
> +		 */
> +		stream->last_fid = fid;

AFAICT, there is still a problem after this patch:

1. We have an incomplete frame, so no EOF, first run through
uvc_video_decode_start()

2. We hit the first if (stream->last_fid != fid) check do
stream->sequence++ . And after patch 1/2 we do NOT update
"buf->buf.sequence = stream->sequence" because buf->bytesused != 0
(which is good, the incomplete frame should not get the new
sequence-no).

3. Still first run through uvc_video_decode_start() we hit the:
if (fid != stream->last_fid && buf->bytesused != 0) check further
down, update "stream->last_fid = fid" (after this patch) and
return -EAGAIN.

4. Second run through uvc_video_decode_start() the first
if (stream->last_fid != fid) check no longer triggers, we
don't increase the sequence-no (good) but we also do not
set "buf->buf.sequence = stream->sequence" for the new buffer
we are called with on the second run!

So the combination of these 2 fixes is broken.

Regards,

Hans



