Return-Path: <linux-media+bounces-65233-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7GivNolINGozTwYAu9opvQ
	(envelope-from <linux-media+bounces-65233-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 21:35:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 770776A25D7
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 21:35:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=vzUoUQo8;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65233-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65233-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34308301F19E
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 19:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4694C343D8A;
	Thu, 18 Jun 2026 19:35:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293771CAA6C;
	Thu, 18 Jun 2026 19:35:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781811322; cv=none; b=EQlimjpZvvVJvHMH0nS5YOS5SSrSAWFf3ZLcO6fJes6Fo3oekIBnl1ArNfe7tQbeih7i91fJN+n612HsADq/rfhjYqBFU/bNJNbFLDm75JfD3x+bPkHRvOglO3Ln19fJpPOascQwmuHAUiuIl6iDe/fTO4JFvmH9Nda6tDzu2ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781811322; c=relaxed/simple;
	bh=4/UBLJbjm/QFsB7OizJsoc5gC5wP5K1TM71MH+Bf0b0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dwoqXESRRZKdFpZdBgHgOIqtb39s/iXJk6pe+5+6Q1q2UE6egYdxmbhbgNcPiY3tWsh2nl1obn58DnDjYT99qI6fr+UKPne23odOqXMlU1hQpNx4x9kCn7DYjKyQ2YOcjBQVT1gjmQKY+U1pCfbYaR9LX74Nd6CWdyJsHizKlsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vzUoUQo8; arc=none smtp.client-ip=213.167.242.64
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 826BB741;
	Thu, 18 Jun 2026 21:34:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781811283;
	bh=4/UBLJbjm/QFsB7OizJsoc5gC5wP5K1TM71MH+Bf0b0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vzUoUQo8Kianftd/0vqgU0q302Itbz3Y7bSgrX1cBjorA1bh/SiJ3eBAjWB+8hQQo
	 qAplmGQIRsPv0LTAz/G33hpVHfmfC50FX1UEaoeU6URYOEU+4wsxCepADMdruqo8A9
	 LTGv/pjG8xi64YKaqisbGoZF4f0vQOls4QHq5j1U=
Message-ID: <5663f0e9-cde5-4943-9e77-267cd92f8742@ideasonboard.com>
Date: Thu, 18 Jun 2026 20:35:15 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: mali-c55: Fix scaler factor overflow for large
 crop sizes
To: David Carlier <devnexen@gmail.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260610215649.98274-1-devnexen@gmail.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260610215649.98274-1-devnexen@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:devnexen@gmail.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[dan.scally@ideasonboard.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65233-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ideasonboard.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.scally@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 770776A25D7

Hi David, sorry this one slipped through the cracks

On 10/06/2026 22:56, David Carlier wrote:
> The horizontal and vertical scaling factors multiply the crop dimensions
> by MALI_C55_RSZ_SCALER_FACTOR, a Q4.20 factor of (1 << 20). Both operands
> are 32-bit, so the multiplication wraps before the result is stored in
> the u64 scale variables. For any crop dimension of 4096 or more (the
> maximum is 8192) the value overflows; an 8192 to 4096 downscale yields a
> TINC of zero, so the scaler never advances and the output is corrupted.
> 
> Cast the crop dimensions to u64 before the multiplication.
> 
> Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>   drivers/media/platform/arm/mali-c55/mali-c55-resizer.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
> index c4f46651d..0713e7d43 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
> @@ -422,8 +422,8 @@ static int mali_c55_rsz_program_resizer(struct mali_c55_resizer *rsz,
>   	mali_c55_resizer_program_coefficients(rsz);
>   
>   	/* Program the V/H scaling factor in Q4.20 format. */
> -	h_scale = crop->width * MALI_C55_RSZ_SCALER_FACTOR;
> -	v_scale = crop->height * MALI_C55_RSZ_SCALER_FACTOR;
> +	h_scale = (u64)crop->width * MALI_C55_RSZ_SCALER_FACTOR;
> +	v_scale = (u64)crop->height * MALI_C55_RSZ_SCALER_FACTOR;

Might be nicer to define the macro with ULL instead of a cast, what do you think?

Thanks
Dan

>   
>   	do_div(h_scale, scale->width);
>   	do_div(v_scale, scale->height);


