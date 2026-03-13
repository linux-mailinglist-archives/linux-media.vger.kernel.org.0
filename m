Return-Path: <linux-media+bounces-55743-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMplExY5tGl3jAAAu9opvQ
	(envelope-from <linux-media+bounces-55743-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:19:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AF5286DB6
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:19:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3211130EF3C3
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 994473C343E;
	Fri, 13 Mar 2026 16:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="W86TgjT+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D880239B96B;
	Fri, 13 Mar 2026 16:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773418492; cv=none; b=WkNuNUjt6FRZiyAU9P9Y4jDtd/e5bXepKZUhIxgB4Qd4/FDjDUerTrOpxQNbRu7Jv0zXioL3K7LYWAM0wwmi/qLdjJ4/o9a2s67roeP26m46LI+q2RIX9jlKGhqfgdAjCt3RE4OnTWGpj3EpRPrIwxq3eJz80/6ua7Yh7rCjvaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773418492; c=relaxed/simple;
	bh=opc0/1u2D2J9jKc0/82lWWu3+4Z4e/7TxEgR8iU1q5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MorrtWvkPUB2hAq79Lw4xDnBiR9/+eWhtJOJ5t63HSemp1Yikzluh5SFlPKbeKbO8Va1JgHfM/pquFjNv0bHMYCLegFVXridAFd5capuc+QCHGrUY+mIFm3aNTGMIexSTlDVOGTUJtuP99+DHRsBEKnZoO07TOmujoCVjMIj/vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=W86TgjT+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA6481356;
	Fri, 13 Mar 2026 17:13:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773418420;
	bh=opc0/1u2D2J9jKc0/82lWWu3+4Z4e/7TxEgR8iU1q5I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W86TgjT+ORUCYEgZvAU+StXoYL82qlOUjfa8vGseR1n3U6ixkUCvkgq3oBDdDPEFR
	 e0JzFoiBCIXk3hge68ros6xt0K9GPtKOVIhzwOhhXa1qX0vYSS/3rSIfFHAuu1fxxg
	 IR0iNJmiNCE9dRBXglvhXtxmeIKIopU/Pyn+k1a0=
Message-ID: <96a2d2ff-0673-45ed-8ea8-056e7feab9b6@ideasonboard.com>
Date: Fri, 13 Mar 2026 16:14:46 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] media: rzv2h-ivc: Write AXIRX_PIXFMT once
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
 =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?=
 <barnabas.pocze+renesas@ideasonboard.com>, stable@vger.kernel.org
References: <20260313-mali-ivc-fixes-v7-0-v1-0-cb0714cd1279@ideasonboard.com>
 <20260313-mali-ivc-fixes-v7-0-v1-3-cb0714cd1279@ideasonboard.com>
 <75c4cacf-9f52-4904-9cf6-44425fabaea1@ideasonboard.com>
 <abQ3X1MA27VKrq-N@zed>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <abQ3X1MA27VKrq-N@zed>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55743-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D9AF5286DB6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo

On 13/03/2026 16:12, Jacopo Mondi wrote:
> Hi Dan
> 
> On Fri, Mar 13, 2026 at 04:07:47PM +0000, Dan Scally wrote:
>> Hi Jacopo (and Barnabás)
>>
>> On 13/03/2026 11:13, Jacopo Mondi wrote:
>>> From: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>
>>>
>>> The documentation prescribes that invalid formats should not be set,
>>> so do a single write to ensure that both the CLFMT and DTYPE fields
>>> are set to valid values.
>>>
>>> Cc: stable@vger.kernel.org
>>> Fixes: f0b3984d821b ("media: platform: Add Renesas Input Video Control block driver")
>>> Signed-off-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>
>>> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
>>> ---
>>>    drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c | 8 ++++----
>>>    drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h       | 7 ++++---
>>>    2 files changed, 8 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
>>> index bfe5b0c7045e..d894a880c33f 100644
>>> --- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
>>> +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
>>> @@ -215,10 +215,10 @@ static void rzv2h_ivc_format_configure(struct rzv2h_ivc *ivc)
>>>    	/* Currently only CRU packed pixel formats are supported */
>>>    	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_PXFMT,
>>> -			RZV2H_IVC_INPUT_FMT_CRU_PACKED);
>>> -
>>> -	rzv2h_ivc_update_bits(ivc, RZV2H_IVC_REG_AXIRX_PXFMT,
>>> -			      RZV2H_IVC_PXFMT_DTYPE, fmt->dtype);
>>> +			FIELD_PREP(RZV2H_IVC_AXIRX_PXFMT_FIELD_DTYPE,
>>> +				   fmt->dtype) |
>>> +			FIELD_PREP(RZV2H_IVC_AXIRX_PXFMT_FIELD_CLFMT,
>>> +				   RZV2H_IVC_CLFMT_CRU_PACKED));
>>
>> TIL of FIELD_PREP(), I like that! Maybe #include <linux/bitfield.h> though?
> 
> It has been included in the previous patch if I'm not mistaken ?

Somehow I read this one before that one; sorry for the noise!

Thanks
Dan

> 
>>
>> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
>>
>>>    	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_HSIZE, pix->width);
>>>    	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_VSIZE, pix->height);
>>> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
>>> index 4ef44c8b4656..54c70de31c1e 100644
>>> --- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
>>> +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
>>> @@ -24,9 +24,10 @@
>>>    #define RZV2H_IVC_ONE_EXPOSURE				0x00
>>>    #define RZV2H_IVC_TWO_EXPOSURE				0x01
>>>    #define RZV2H_IVC_REG_AXIRX_PXFMT			0x0004
>>> -#define RZV2H_IVC_INPUT_FMT_MIPI			(0 << 16)
>>> -#define RZV2H_IVC_INPUT_FMT_CRU_PACKED			BIT(16)
>>> -#define RZV2H_IVC_PXFMT_DTYPE				GENMASK(7, 0)
>>> +#define RZV2H_IVC_AXIRX_PXFMT_FIELD_CLFMT		GENMASK(17, 16)
>>> +#define RZV2H_IVC_CLFMT_MIPI				0
>>> +#define RZV2H_IVC_CLFMT_CRU_PACKED			1
>>> +#define RZV2H_IVC_AXIRX_PXFMT_FIELD_DTYPE		GENMASK(7, 0)
>>>    #define RZV2H_IVC_REG_AXIRX_SADDL_P0			0x0010
>>>    #define RZV2H_IVC_REG_AXIRX_SADDH_P0			0x0014
>>>    #define RZV2H_IVC_REG_AXIRX_SADDL_P1			0x0018
>>>
>>


