Return-Path: <linux-media+bounces-66101-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vOGAOwzDQ2r7gwoAu9opvQ
	(envelope-from <linux-media+bounces-66101-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 15:22:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF146E4C9A
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 15:22:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=W210+YiK;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66101-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66101-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8E49308DEE8
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 13:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516CF4192E7;
	Tue, 30 Jun 2026 13:10:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D809E3F1676;
	Tue, 30 Jun 2026 13:10:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782825032; cv=none; b=DIrOiI4LWI4xH0Njyg4E8kxGDYWHsYT3P/kcMYhfb2ojtx810T2SCsNSHjX7TYNhLmPjhFbCNFNd907LvQO4eocdXhkvbyxwy1CCI7OcSQrhT8/TQA+vSNic4C5Yexyu3a0E0jqVdoC93cgUj93c/JMKxS49Vii1l8aYxotc8LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782825032; c=relaxed/simple;
	bh=OYo8cUh0/f1Urh9HD5WoByGgd80rDTbby76Op0+5XxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KvRf0MaBoUQTUgwuEkU1PxWSpt8wJ9oAOi2GBGErRaiLMoSjxmTqSImnczRsvKGlrqtctHHYTrviT/w1kBVJ66Z9RKRDLoBtTQDsDAFDQc4i/imTnNuZeN/FHRFo877I76xhiVFTJVzorsNnOkqvbrSRhxbzGipgkkKiqbDFzgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W210+YiK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 361101F000E9;
	Tue, 30 Jun 2026 13:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782825030;
	bh=wV2WRPiKn/tRfG8aSkMx9ysBri8KCO7r2fEs+yVq8fg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=W210+YiKOcgVbeg9NoxjUPwCckIjf3rXLFhy6UbrTtMkst6JaPqEjJSvTWv5CTXfx
	 +xFq7lB73Td8y8Y4DDAjMfWqEiDC9DALrkDPNcl8euVJcLt3UA/BzZZA23RbRfBt2o
	 xI6TMkVzS8GRECANjWSnnPAUBfta4JXoDXmHPMnu7Mnq34DsiaqeIDUUgxUzag+y+r
	 C/FjmuXsWIho19mA3UXDcKxVv4pou7tLwjrZyvyZ4Gd3mQqGOwmA57me2Ba9jFUXHb
	 43uTpzhaBTkCMRjxzSDs/4RCnCmOBSTxT58Wbqc+qvTGEyTNdUBtcpHL0ENkQsxrBn
	 /yWAmrnrZNWkA==
Message-ID: <fa40ec4d-b51f-482f-a5fc-63c49e9177af@kernel.org>
Date: Tue, 30 Jun 2026 15:10:27 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: uvcvideo: Remove unused active field
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260630-uvc-remove-active-v1-1-ed1421b99429@chromium.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260630-uvc-remove-active-v1-1-ed1421b99429@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ribalda@chromium.org,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-66101-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5AF146E4C9A

Hi,

On 30-Jun-26 12:28, Ricardo Ribalda wrote:
> The active field in struct uvc_streaming is not used anymore, drop it.
> 
> Reported-by: Hans de Goede <hansg@kernel.org>
> Closes: https://lore.kernel.org/linux-media/20260629-uvc-racemeta-v2-0-10e91d2afba0@chromium.org/T/#m3078f0d5fd71435b5cfacaa5c99f23a446db581f
> Fixes: c93d73c9c2cf ("media: uvcvideo: Use vb2 ioctl and fop helpers")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans


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
> 
> Best regards,


