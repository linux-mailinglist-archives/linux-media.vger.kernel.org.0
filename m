Return-Path: <linux-media+bounces-54602-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PQ1IBRVqWli5gAAu9opvQ
	(envelope-from <linux-media+bounces-54602-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 11:04:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE49D20F485
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 11:04:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E13E03124963
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 09:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60EF837C0F2;
	Thu,  5 Mar 2026 09:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I4sDyQYT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C904237C118;
	Thu,  5 Mar 2026 09:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704711; cv=none; b=OjC2RHmsYT6GepzQgKaQs7oI2MamODsP0JYUBhV87u10Sz/m3vU3NEmEC/JKRb/a3S2gY50UlsCqa8M8qmeqEHer+qLbY+PlbVxDx1N6rRsoBLmpKU+Jiz8g3TEpFWRVpXirTvTQUCOl8pptUPJ9oxx6YxnIza3qtQiWiVxIrQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704711; c=relaxed/simple;
	bh=wIpQyW0ykDAdmWOF/3FXPJsdOUrAF5yHahjueKN14W0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EJmmn9fcaA2wmM81J5SeaqmasfjKYT8Y0YuWtjgiUWnDMzNXIOsctBn/JXIdQrTlHh0EV3Wg4z0mSUfSb20qYWOiOFBqhayB5cglrgCbbZJop62/XRPQVJvwnDqi5tDDX+RdAnlSgtjQT2EcFm/mqtoaLpUgJss70SuybVWlBMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I4sDyQYT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E23D066B;
	Thu,  5 Mar 2026 10:57:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772704632;
	bh=wIpQyW0ykDAdmWOF/3FXPJsdOUrAF5yHahjueKN14W0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I4sDyQYTTNw3Z+s7iIwfe8zlA2MhbgtqLiiL7wZP3tzuBveCyCm786qvKT7S+E8V2
	 3slfmkR2fCfvs9UX/bVDy4fUZb+LTm2DKJ7cSfF7f6wZwkNT2v0bDrGpSlTgG4vfKo
	 D8uhDk+7WtPPxv8+esn8d2RufrtKHmsOpo3U6Kjo=
Message-ID: <17d66a50-f1a3-468b-89c4-837ab328f738@ideasonboard.com>
Date: Thu, 5 Mar 2026 09:58:12 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: mali-c55: Check return value of
 media_pad_remote_pad_unique()
To: Chen Ni <nichen@iscas.ac.cn>
Cc: jacopo.mondi@ideasonboard.com, mchehab@kernel.org,
 hverkuil+cisco@kernel.org, nayden.kanchev@arm.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260305052032.827341-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260305052032.827341-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: DE49D20F485
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54602-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.scally@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Chen - thanks for the patch

On 05/03/2026 05:20, Chen Ni wrote:
> media_pad_remote_pad_unique() can return an error pointer if the link is
> missing or ambiguous. The current code dereferences the returned pointer
> without checking for errors, which leads to a kernel crash.
> 
> Fix this by adding an IS_ERR() check and returning the error via
> dev_err_probe().
> 
> Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---

A similar patch was already submitted to fix this issue:

https://lore.kernel.org/linux-media/20260207091822.601255-1-alperyasinak1@gmail.com/

Thanks
Dan

>   drivers/media/platform/arm/mali-c55/mali-c55-isp.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> index 497f25fbdd13..7c58da3ee331 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> @@ -360,6 +360,10 @@ static int mali_c55_isp_enable_streams(struct v4l2_subdev *sd,
>   
>   	sink_pad = &isp->pads[MALI_C55_ISP_PAD_SINK_VIDEO];
>   	isp->remote_src = media_pad_remote_pad_unique(sink_pad);
> +	if (IS_ERR(isp->remote_src))
> +		return dev_err_probe(mali_c55->dev, PTR_ERR(isp->remote_src),
> +				     "Failed to get unique remote pad\n");
> +
>   	src_sd = media_entity_to_v4l2_subdev(isp->remote_src->entity);
>   
>   	isp->frame_sequence = 0;


