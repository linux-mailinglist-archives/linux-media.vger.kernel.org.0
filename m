Return-Path: <linux-media+bounces-57611-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KO2KFKFmymll8gUAu9opvQ
	(envelope-from <linux-media+bounces-57611-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 14:03:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2A335AC14
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 14:03:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59BA33031801
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46B83C9ED7;
	Mon, 30 Mar 2026 11:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XaCjbsOP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922E2288D0;
	Mon, 30 Mar 2026 11:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774871748; cv=none; b=e6PVXnIlUh3gJ0dlOTS8WLJWckuFLsWEX01pxeKcbLsLiXmWAeNoZEctLRV7jT1K1h52Hfzs5HfxKItf2rJfZBqIoXvpgLBPQKBCPdRGVd/RByfN7cZyrr/DYY+4KD+qsm2bP+GgmN6ePjhHM4oW846hpGCH9aQXg0HAKrocHSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774871748; c=relaxed/simple;
	bh=qNz1TQsXGxlj6D8YKYA9ByvScxGaE41iVdFvWutlp9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kMu2aCXM2vJIwAtyNSvFvYEUtNgsXNgXUCIjo2l2JKbiI6V4vCEA32uZQRI4zEz1KA1bg1fjIQRG8v6mB3vvsFIzwGm25EuFoVmUSS5Gcm4Sbkq25AFdUE72lD9CPns5yamuu59VLa+hZ6oBgJIX05sx9bKwpfjLb9fECSNDej4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XaCjbsOP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EFA8A23B9;
	Mon, 30 Mar 2026 13:54:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774871663;
	bh=qNz1TQsXGxlj6D8YKYA9ByvScxGaE41iVdFvWutlp9A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XaCjbsOPCW3OxFlS3tmlQpjKn0A/BrWtqsb4Rg8Msr22/QUzjv3E4sJfbd4PjSyma
	 IKz94bKNqw5UgYdTZWjz+pZ4ga6SZKepnUpR6SztABXF2eqm3AjuGoyDAuypo8MiK/
	 SaolBvmHH19uZADg/Bc3kdr3Yui6OWDkzRfddTwo=
Message-ID: <aeb523d3-2f6b-4a93-8838-34ae93d6a36b@ideasonboard.com>
Date: Mon, 30 Mar 2026 12:55:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/14] media: rzg2l-cru: Simplify irq return value
 handling
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
 <20260327-b4-cru-rework-v1-14-3b7d0430f538@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260327-b4-cru-rework-v1-14-3b7d0430f538@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57611-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[protonmail.com,bp.renesas.com,vger.kernel.org,ideasonboard.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.scally@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 9D2A335AC14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 27/03/2026 17:10, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> The rzg2l_cru_irq() irq handler uses a local variable to store the
> handler return value.
> 
> Simplify it by using IRQ_NONE and IRQ_HANDLED.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

> ---
>   drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 30424e2b6cc0..e81573d0a84c 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -592,16 +592,13 @@ static void rzg2l_cru_stop_streaming(struct rzg2l_cru_dev *cru)
>   irqreturn_t rzg2l_cru_irq(int irq, void *data)
>   {
>   	struct rzg2l_cru_dev *cru = data;
> -	unsigned int handled = 0;
>   	u32 irq_status;
>   	u32 amnmbs;
>   	int slot;
>   
>   	irq_status = rzg2l_cru_read(cru, CRUnINTS);
>   	if (!irq_status)
> -		return IRQ_RETVAL(handled);
> -
> -	handled = 1;
> +		return IRQ_NONE;
>   
>   	rzg2l_cru_write(cru, CRUnINTS, rzg2l_cru_read(cru, CRUnINTS));
>   
> @@ -638,7 +635,7 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
>   	/* Prepare for next frame */
>   	rzg2l_cru_fill_hw_slot(cru, slot);
>   
> -	return IRQ_RETVAL(handled);
> +	return IRQ_HANDLED;
>   }
>   
>   irqreturn_t rzg3e_cru_irq(int irq, void *data)
> 


