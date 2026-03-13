Return-Path: <linux-media+bounces-55744-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMx2HqI4tGl3jAAAu9opvQ
	(envelope-from <linux-media+bounces-55744-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:17:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CB4286D3F
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:17:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F38E43024873
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7C53C3C1D;
	Fri, 13 Mar 2026 16:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jzobwSha"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52DE33F5A5;
	Fri, 13 Mar 2026 16:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773418535; cv=none; b=cpG/MRkbZ7bDSxOrWGOPE4QUvro4hqdQnZDIf/+p9Hfv2aeywsA7V5HC0+76P5pqjSskPE4g63xOPhfGsHOuVbS5B5pH8NrOUD9pAYH8zZXTYcMy52kdSO2m8PmwTUtGtxMrTZFDrlDmLRS03bUI2I/EpQEdwZQ751RZBDmbnhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773418535; c=relaxed/simple;
	bh=ZtNdm7oHMvpMhja4wEwddzvbwSc+E5sMcY2/pg0Sax0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SQTcXVne77ATpNXyaYPc9yEXD38K9nKtuDBYuj0hsPYm4XlSIho7cenrg5IP55h4G+M+z07HXbebgzcNdNAQybXzb0wJnrYox+5L05IsLk5vxIYBCGzkw9lCPf0LQFUCuIN/z43tqr36qRDw6HCi+6hGCPCC5a8R4MER7gZfJUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jzobwSha; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B9F2E70;
	Fri, 13 Mar 2026 17:14:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773418464;
	bh=ZtNdm7oHMvpMhja4wEwddzvbwSc+E5sMcY2/pg0Sax0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jzobwShar5AhYeHrU7rDSTm+xf86sKmAbUR/TsmSuBol9g3yJBIIS6mQIT3V0VDPh
	 /JfaSduq6JGC+CO/lrxV6+JnLcrnoJ1FygGuxNskd768YrP6p2idh7A6Z6ZvAtKVq5
	 z+hnneInGJLHY6Q3QfZ9jxsWVrQaXWmCQMK35REI=
Message-ID: <8ca5a858-e42c-4cf8-b2f4-2169cd29d3f1@ideasonboard.com>
Date: Fri, 13 Mar 2026 16:15:29 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] media: rzv2h-ivc: Fix AXIRX_VBLANK register write
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
 <20260313-mali-ivc-fixes-v7-0-v1-2-cb0714cd1279@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260313-mali-ivc-fixes-v7-0-v1-2-cb0714cd1279@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55744-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 82CB4286D3F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo and Barnabás

On 13/03/2026 11:13, Jacopo Mondi wrote:
> From: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>
> 
> According to the documentation there are writable reserved bits in the
> register and those should not be set to 0. So use `rzv2h_ivc_update_bits()`
> with a proper bitmask.
> 
> Cc: stable@vger.kernel.org
> Fixes: f0b3984d821b ("media: platform: Add Renesas Input Video Control block driver")
> Signed-off-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c | 7 +++++--
>   drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h       | 2 +-
>   2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> index 1e016b17dcee..bfe5b0c7045e 100644
> --- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> @@ -7,6 +7,7 @@
>   
>   #include "rzv2h-ivc.h"
>   
> +#include <linux/bitfield.h>
>   #include <linux/cleanup.h>
>   #include <linux/iopoll.h>
>   #include <linux/lockdep.h>
> @@ -235,8 +236,10 @@ static void rzv2h_ivc_format_configure(struct rzv2h_ivc *ivc)
>   	hts = pix->width + RZV2H_IVC_FIXED_HBLANK;
>   	vblank = RZV2H_IVC_MIN_VBLANK(hts);
>   
> -	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_BLANK,
> -			RZV2H_IVC_VBLANK(vblank));
> +	rzv2h_ivc_update_bits(ivc, RZV2H_IVC_REG_AXIRX_BLANK,
> +			      RZV2H_IVC_AXIRX_BLANK_FIELD_VBLANK,
> +			      FIELD_PREP(RZV2H_IVC_AXIRX_BLANK_FIELD_VBLANK,
> +					 vblank));
>   }
>   
>   static void rzv2h_ivc_return_buffers(struct rzv2h_ivc *ivc,
> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
> index 3bcaab990b0f..4ef44c8b4656 100644
> --- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
> +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
> @@ -34,7 +34,7 @@
>   #define RZV2H_IVC_REG_AXIRX_HSIZE			0x0020
>   #define RZV2H_IVC_REG_AXIRX_VSIZE			0x0024
>   #define RZV2H_IVC_REG_AXIRX_BLANK			0x0028
> -#define RZV2H_IVC_VBLANK(x)				((x) << 16)
> +#define RZV2H_IVC_AXIRX_BLANK_FIELD_VBLANK		GENMASK(25, 16)
>   #define RZV2H_IVC_REG_AXIRX_STRD			0x0030
>   #define RZV2H_IVC_REG_AXIRX_ISSU			0x0040
>   #define RZV2H_IVC_REG_AXIRX_ERACT			0x0048
> 


