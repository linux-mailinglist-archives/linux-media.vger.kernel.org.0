Return-Path: <linux-media+bounces-65237-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AYtvLNJRNGoPUwYAu9opvQ
	(envelope-from <linux-media+bounces-65237-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 22:15:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF136A2792
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 22:15:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=INm5FlmR;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65237-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65237-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 85A323024AA2
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 20:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF65341057;
	Thu, 18 Jun 2026 20:15:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96B4347533;
	Thu, 18 Jun 2026 20:15:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781813708; cv=none; b=eDRRksIdNY0uDq6pg1x89gGJ0VPVUVAGY7ojG3pCzUvCt9z4AYYLHetnaPe7g2wQzDPxjWAbKhe/+qu8VYb5CT0Z17M3N9YT4dQ7VbgUnJnx9/qa/Vd2q9YhUm96erh+WQRBbdwKF3b/AbJkhgu9HKvuG3EXGSRkoHTRqpSXVzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781813708; c=relaxed/simple;
	bh=Kvm4eXY2QMqsym5aGT//9Il/CZvUCcqRe6EhFcHrVwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NP3Kgq/cf85gKSVBtu9S8CDl9hu7g5nLytacxQK+RDar12hcH4vTCZVerF/cTg++uUJ+JsY9MNhnDp+bBVEX6eNYh1XCqOf/PIJu6csGLNoC5yHCCpZ3bsgCn6d523zqrHCSzGlE7GJmwSbYRvDWrZqf3kdWLKNIQA7op8kZ344=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=INm5FlmR; arc=none smtp.client-ip=213.167.242.64
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5F438E0;
	Thu, 18 Jun 2026 22:14:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781813670;
	bh=Kvm4eXY2QMqsym5aGT//9Il/CZvUCcqRe6EhFcHrVwk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=INm5FlmRugBjuCTlx8R92Xi0qMkWlkFK1HN4zl26p4NKMorbtm+lx0oddT6d2iJ7O
	 cVpep0H33gpXAT6x3Jpk9X/KwPjU3zASuTx0lA9JBTnPcsJ5pKCVI2oN+quUJlqmEr
	 SybGueEp5mt0Yixap+btffzOj7TSkMLROYuYEEsE=
Message-ID: <0006f6dc-6202-459f-aff9-7ad1242726b0@ideasonboard.com>
Date: Thu, 18 Jun 2026 21:15:02 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: mali-c55: Fix scaler factor overflow for large
 crop sizes
To: David Carlier <devnexen@gmail.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260618195254.139712-1-devnexen@gmail.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260618195254.139712-1-devnexen@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:devnexen@gmail.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[dan.scally@ideasonboard.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65237-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2DF136A2792

Hi David

On 18/06/2026 20:52, David Carlier wrote:
> The horizontal and vertical scaling factors multiply the crop dimensions
> by MALI_C55_RSZ_SCALER_FACTOR, a Q4.20 factor of (1 << 20). Both operands
> are 32-bit, so the multiplication wraps before the result is stored in
> the u64 scale variables. For any crop dimension of 4096 or more (the
> maximum is 8192) the value overflows; an 8192 to 4096 downscale yields a
> TINC of zero, so the scaler never advances and the output is corrupted.
> 
> Define MALI_C55_RSZ_SCALER_FACTOR as a 64-bit constant so the
> multiplication is performed in 64-bit.
> 
> Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Carlier <devnexen@gmail.com>

Thanks very much:

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> 
> Notes:
>      v2: Define the macro as a 64-bit constant (BIT_ULL) instead of casting
>          each multiplication, per Dan's review.
> 
>   drivers/media/platform/arm/mali-c55/mali-c55-resizer.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
> index c4f46651d..6706939b4 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
> @@ -15,7 +15,7 @@
>   #include "mali-c55-registers.h"
>   
>   /* Scaling factor in Q4.20 format. */
> -#define MALI_C55_RSZ_SCALER_FACTOR	(1U << 20)
> +#define MALI_C55_RSZ_SCALER_FACTOR	BIT_ULL(20)
>   
>   #define MALI_C55_RSZ_COEFS_BANKS	8
>   #define MALI_C55_RSZ_COEFS_ENTRIES	64


