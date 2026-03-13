Return-Path: <linux-media+bounces-55792-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOEVE7GLtGlUpgAAu9opvQ
	(envelope-from <linux-media+bounces-55792-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 23:12:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A503228A490
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 23:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60B483141CE9
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 22:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 075B3383C6F;
	Fri, 13 Mar 2026 22:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dhCIrDbt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C333F30EF8B;
	Fri, 13 Mar 2026 22:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773439893; cv=none; b=o15zadtxA4w1R3i/CO5QNPncSP/ENm64hA+r0tevNzvAH4ApqX83KSau8d1Jf74Xu8HfWXK1JI/S9OD7cDpotdJ0NUFdyWBOdrgSdm7wtY5CFdkNiAPuBkyNsy9iNZCW1S4rLMP6wLYpIIfhCWlRGu3CGoU36pSGq2Zzv9e1kt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773439893; c=relaxed/simple;
	bh=GJZt30vNQyu7+UBMXI7MfauI9fMydlfltlyDWqNS89k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SqW0TinOCDQGGP70jR+xjZYyD5RztbomzmtxzKuQaHnTS+oTqNM3qDd362UsOuumI/RzsPk0xSDBvHFNb5XsfdtFneNXclWu6BZ4rxarjcrP0HF773JsSXNrI0lrHAX503r22nsNzpdNbi2+DzpCnRPPf7YFL7uFSrMEuVOuvYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dhCIrDbt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5A7A75A5;
	Fri, 13 Mar 2026 23:10:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773439820;
	bh=GJZt30vNQyu7+UBMXI7MfauI9fMydlfltlyDWqNS89k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dhCIrDbtiI4TJ/2kVziPZzbxgmcCsg5RLdjbDtCe7rw5Z9kP/6Cc3P7GO3J9TB1jU
	 sWroWrNkT787LWEnB3hEzhhwEnEzvVNIyS1AS7uCVO3kcomPgzOn2bWq45cSahWIAF
	 xHz5slkmsdU0Q1FeWhw5ers1IrEn4Ge+wAs82mFU=
Message-ID: <14436f93-b8df-4c1c-85d8-5959bbfdbac6@ideasonboard.com>
Date: Fri, 13 Mar 2026 22:11:26 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] media: rzv2h-ivc: Fix concurrent buffer list access
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
 =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?=
 <barnabas.pocze+renesas@ideasonboard.com>, stable@vger.kernel.org
References: <20260313-mali-ivc-fixes-v7-0-v1-0-cb0714cd1279@ideasonboard.com>
 <20260313-mali-ivc-fixes-v7-0-v1-5-cb0714cd1279@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260313-mali-ivc-fixes-v7-0-v1-5-cb0714cd1279@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55792-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.scally@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A503228A490
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo and Barnabás

On 13/03/2026 11:14, Jacopo Mondi wrote:
> From: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>
> 
> The list of buffers (`rzv2h_ivc::buffers.queue`) is protected by a
> spinlock (`rzv2h_ivc::buffers.lock`). However, in
> `rzv2h_ivc_transfer_buffer()`, which runs in a separate workqueue, the
> `list_del()` call is executed without holding the spinlock, which makes
> it possible for the list to be concurrently modified
> 
> Fix that by removing a buffer from the list in the lock protected section.
> 
> Cc: stable@vger.kernel.org
> Fixes: f0b3984d821b ("media: platform: Add Renesas Input Video Control block driver")
> Signed-off-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>
> [assign ivc->buffers.curr in critical section as reported by Barnabas]
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---

Looks good, thanks

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> index 9b75e4b10e99..a22aee0fe1cf 100644
> --- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> @@ -153,14 +153,13 @@ static void rzv2h_ivc_transfer_buffer(struct work_struct *work)
>   	scoped_guard(spinlock_irqsave, &ivc->buffers.lock) {
>   		buf = list_first_entry_or_null(&ivc->buffers.queue,
>   					       struct rzv2h_ivc_buf, queue);
> -	}
> -
> -	if (!buf)
> -		return;
> +		if (!buf)
> +			return;
>   
> -	list_del(&buf->queue);
> +		list_del(&buf->queue);
> +		ivc->buffers.curr = buf;
> +	}
>   
> -	ivc->buffers.curr = buf;
>   	buf->addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
>   	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_SADDL_P0, buf->addr);
>   
> 


