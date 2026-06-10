Return-Path: <linux-media+bounces-64367-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hVEFIOkIKWp9PAMAu9opvQ
	(envelope-from <linux-media+bounces-64367-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 08:49:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E59A66660D
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 08:49:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=wZ8V9jsx;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64367-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64367-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 52DE1303E068
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 06:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C1883815C3;
	Wed, 10 Jun 2026 06:49:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B4238229A;
	Wed, 10 Jun 2026 06:48:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781074141; cv=none; b=sy3uVDEr0QDwOMCBqj/iuD7MtJqfJluziX6Hfij5r21sakT6L91HGc7S2RIWHSeMEv5GqyazK3y8KaoJP7MscW5b6U73N+Txx0Zu27nUBaBkurLERjAKW1RxH/IzYg2505ONL9H1W6KiNrXx5JN5ZKyOQvzspXrOJPq0f0JfL+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781074141; c=relaxed/simple;
	bh=pe5LfmLVMxdrbMZtCnvMirKPK27BgplU4bk7CK1xW7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iNigGyBm/i7iKD4vBwau5YtqkTJRV+Zt3NF9kRjerZupkZpY+fiX2dnzOfSCqXEfG++EJ3OoK1LyXYUXZr75n9Y9GBnNpfklXpeX8FRUsYtEl1Q0ACzOMfk/do8q9kEq2QJwd2pDJ3U5Q8nP6DVzFqCpfllgB15XZRtYKgH6v3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wZ8V9jsx; arc=none smtp.client-ip=213.167.242.64
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44F39517;
	Wed, 10 Jun 2026 08:48:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781074109;
	bh=pe5LfmLVMxdrbMZtCnvMirKPK27BgplU4bk7CK1xW7M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=wZ8V9jsx7yDilDWnpKmjIBFBOs2Ae3344PMjIY2g6dcSN0RTOQWXcd8NzEAT0JRON
	 +r+QB6yBJt8zWoxI92bDy5KV1h/EOQB9qf78rzLtopiGw51/oMzm6iCqfk75htEsXX
	 Dv+mlEarJqyDbqTIeT0PkJB5FcG9t5gmrJl09iJw=
Message-ID: <f31703b3-3c31-4617-a228-a25347d00140@ideasonboard.com>
Date: Wed, 10 Jun 2026 07:48:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: mali-c55: fix dropped last AEC histogram zone
 weight
To: David Carlier <devnexen@gmail.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nayden Kanchev <nayden.kanchev@arm.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260602185305.30759-1-devnexen@gmail.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260602185305.30759-1-devnexen@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64367-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:devnexen@gmail.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:nayden.kanchev@arm.com,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,ideasonboard.com];
	FORGED_SENDER(0.00)[dan.scally@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.scally@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1E59A66660D

Hi David, thanks for the patch

On 02/06/2026 19:53, David Carlier wrote:
> The 15x15 AEC histogram metering grid has 225 per-zone weights, packed
> by userspace as a u8 array. The driver writes the first 56 registers
> (zones 0 through 223) in a loop, then handles the final register on its
> own to keep static analysers from flagging the array access.
> 
> That separate path computes the address and value for the 225th weight
> (the bottom-right zone) but never issues the register write, so the zone
> keeps its stale or default weight. Any non-default weight userspace sets
> for the last zone is silently ignored, skewing auto-exposure metering.
> Both the AEXP_HIST_WEIGHTS and AEXP_IHIST_WEIGHTS blocks are affected as
> they share this handler.
> 
> Issue the missing write, masking the value as the loop does.
> 
> Fixes: 01535ea08674 ("media: platform: Add mali-c55 parameters video node")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---

Oops! Change looks good to me:

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   drivers/media/platform/arm/mali-c55/mali-c55-params.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> index de0e9d898db7..33e2232ec8f5 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> @@ -212,6 +212,7 @@ mali_c55_params_aexp_hist_weights(struct mali_c55 *mali_c55,
>   
>   	val = params->zone_weights[MALI_C55_MAX_ZONES - 1];
>   	addr = base + MALI_C55_AEXP_HIST_ZONE_WEIGHTS_OFFSET + (4 * 56);
> +	mali_c55_ctx_write(mali_c55, addr, val & MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK);
>   }
>   
>   static void mali_c55_params_digital_gain(struct mali_c55 *mali_c55,


