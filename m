Return-Path: <linux-media+bounces-55789-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFS4FpR2tGkfogAAu9opvQ
	(envelope-from <linux-media+bounces-55789-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 21:41:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C915A289DCA
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 21:41:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCFB13085313
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 20:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA353D522F;
	Fri, 13 Mar 2026 20:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="t0zcpa2q"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D116B3D3002;
	Fri, 13 Mar 2026 20:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773434405; cv=none; b=E/5rq87zlRh5p5Qqzu9xFuFBZW0x8MxWl9rdga5Am1xuf3Uo23fAMAaK97xVboJ6Q8m+ay330SOsMBGCyZMtTD0AT/cDGKaH+TnAypGq2Wj//uvqHUv0fC6675TaQbLbtwU0zJUFaxODE7Ovgp5+lNm1bsQEEm70o9TkWT3P0cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773434405; c=relaxed/simple;
	bh=xn0O7SqGpf/SBvzD1sikVpzC7YwH94rqIZwDiiQabIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RBi5eHlra/cwICUS/yqNFFfWvL1qMNhY2E5qte5yLxj1mEZ9S6cetE9bRpKNW6BsGdVh8eVd4+McetTt5kAH9gMzOX2Kp8mGdgwow2P+SfpF7NH7kJQiXIFhNhQk5ZpEb59KMj22amKLs5flXruSmNPgzUbb8Has6UNyUaAWbL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=t0zcpa2q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F1F7CF52;
	Fri, 13 Mar 2026 21:38:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773434330;
	bh=xn0O7SqGpf/SBvzD1sikVpzC7YwH94rqIZwDiiQabIo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=t0zcpa2q/w5s168z2O39680XO3V3MoAhAN7sQ5B/l4yV7c0Gh1ALxvTqemKi0SibN
	 rmdnEXZJ8Xps2LxiEux/ldLxiL1mJFBlB0HK+fdO4HwMuvDU3JvRZ99PrntBIDjKxf
	 MTfgnSEHmFYE20el4IUCEV2roiRBcQJhVvY/wqaQ=
Message-ID: <e208b857-1d4e-4ee1-b3a7-9b2d42b7db0e@ideasonboard.com>
Date: Fri, 13 Mar 2026 20:39:56 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] media: rzv2h-ivc: Fix FM_STOP register write
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
 <20260313-mali-ivc-fixes-v7-0-v1-4-cb0714cd1279@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260313-mali-ivc-fixes-v7-0-v1-4-cb0714cd1279@ideasonboard.com>
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
	TAGGED_FROM(0.00)[bounces-55789-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: C915A289DCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo and Barnabás

On 13/03/2026 11:14, Jacopo Mondi wrote:
> From: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>
> 
> Bit 20 should be written in this register to stop frame processing.
> So fix that, as well as the poll condition.
> 
> Cc: stable@vger.kernel.org
> Fixes: f0b3984d821b ("media: platform: Add Renesas Input Video Control block driver")
> Signed-off-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c | 5 +++--
>   drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h       | 1 +
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> index d894a880c33f..9b75e4b10e99 100644
> --- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> @@ -297,9 +297,10 @@ static void rzv2h_ivc_stop_streaming(struct vb2_queue *q)
>   	struct rzv2h_ivc *ivc = vb2_get_drv_priv(q);
>   	u32 val = 0;
>   
> -	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_FM_STOP, 0x1);
> +	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_FM_STOP, RZV2H_IVC_REG_FM_STOP_FSTOP);
>   	readl_poll_timeout(ivc->base + RZV2H_IVC_REG_FM_STOP,
> -			   val, !val, 10 * USEC_PER_MSEC, 250 * USEC_PER_MSEC);
> +			   val, !(val & RZV2H_IVC_REG_FM_STOP_FSTOP),
> +			   10 * USEC_PER_MSEC, 250 * USEC_PER_MSEC);
>   
>   	rzv2h_ivc_return_buffers(ivc, VB2_BUF_STATE_ERROR);
>   	video_device_pipeline_stop(&ivc->vdev.dev);
> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
> index 54c70de31c1e..049f223200e3 100644
> --- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
> +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
> @@ -46,6 +46,7 @@
>   #define RZV2H_IVC_REG_FM_MCON				0x0104
>   #define RZV2H_IVC_REG_FM_FRCON				0x0108
>   #define RZV2H_IVC_REG_FM_STOP				0x010c
> +#define RZV2H_IVC_REG_FM_STOP_FSTOP			BIT(20)
>   #define RZV2H_IVC_REG_FM_INT_EN				0x0120
>   #define RZV2H_IVC_VVAL_IFPE				BIT(0)
>   #define RZV2H_IVC_REG_FM_INT_STA			0x0124
> 


