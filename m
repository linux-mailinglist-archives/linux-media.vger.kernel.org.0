Return-Path: <linux-media+bounces-55746-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JuEFEs6tGl3jAAAu9opvQ
	(envelope-from <linux-media+bounces-55746-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:24:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C667A286F57
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 77D0C30396AE
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A6F63BA22E;
	Fri, 13 Mar 2026 16:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ezrYb8GW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E7C39DBC6;
	Fri, 13 Mar 2026 16:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773418986; cv=none; b=eBBniUh1npcwwZ2edc3/g+1cIbow+tBNdMAXljqxci50oyQriIeZxtlnIn2KyqN0sL3XKEOJbOgG5iZOECPj7UmF/T59lAHL6kLwwic6/6Ekg9Z0WQFmh8HI0ro9gv/uELgaM1DvWM6zUnigtNQOc7ZcTypZ9aPSTFv15N9DHho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773418986; c=relaxed/simple;
	bh=fwujzW8G4QQwMtJkwnPb633gT3hHbH56l+ItKhZ0Go8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nH9NJfZjKJpwZzBm3CIqlZ1k51q/T6wO9EeLDFtP0XlpjK0Q3/e6dQTFxqTOwnFBy8ox9NlO6fBAswKVp05hAk51UK5c4ii023xnqURKbR+JKlK0rLM4s0kaYakwgIb8VnZbWjlrRkyx9CveJWTBhZOv+Z44ntiHJbjxo2eL7Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ezrYb8GW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.33.26] (185.182.214.153.nat.pool.zt.hu [185.182.214.153])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EE8DDF52;
	Fri, 13 Mar 2026 17:21:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773418914;
	bh=fwujzW8G4QQwMtJkwnPb633gT3hHbH56l+ItKhZ0Go8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ezrYb8GW1I0ePWMqtSv7LRSeYiEENc1qVzRAaj2qtre9zluWaqiVdBbvZfa34mvz4
	 2xDwZAr2HLkZHWznJBAxikerF1Us/9RpX9zKc+ueI7m4rpcsODxKZ1fnxB7pKSchzU
	 evDeIEfSiGoGrj1sLIpivOM+kkELBTxdCr/JFBfg=
Message-ID: <67136496-7592-4e20-b4c1-b06e920434ab@ideasonboard.com>
Date: Fri, 13 Mar 2026 17:22:59 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] media: mali-c55: Fix wrong comment of ISP block
 types
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Anthony McGivern <anthony.mcgivern@arm.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Nayden Kanchev <Nayden.Kanchev@arm.com>,
 Konstantin Babin <Konstantin.Babin@arm.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260313-mali-c55-fixes-v7-0-v2-0-885c07961f30@ideasonboard.com>
 <20260313-mali-c55-fixes-v7-0-v2-1-885c07961f30@ideasonboard.com>
From: =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>
Content-Language: en-US, hu-HU
In-Reply-To: <20260313-mali-c55-fixes-v7-0-v2-1-885c07961f30@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.60 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.56)[subject];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-55746-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[barnabas.pocze@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: C667A286F57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

2026. 03. 13. 15:53 keltezéssel, Jacopo Mondi írta:
> Some bad copy&paste happened in the description of the ISP block types
> and AWB_CONFIG got mixed up with SHADING_CONFIG.
> 
> Fix it by assigning to each block the correct type.
> 
> As only the comment is changed, there is no uABI breakage or regression.
> 
> Cc: stable@vger.kernel.org
> Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---

Reviewed-by: Barnabás Pőcze <barnabas.pocze@ideasonboard.com>


>   drivers/media/platform/arm/mali-c55/mali-c55-params.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> index be0e909bcf29..c03a6120ddbf 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> @@ -43,9 +43,9 @@
>    * @digital_gain:	For header->type == MALI_C55_PARAM_BLOCK_DIGITAL_GAIN
>    * @awb_gains:		For header->type == MALI_C55_PARAM_BLOCK_AWB_GAINS and
>    *			header->type = MALI_C55_PARAM_BLOCK_AWB_GAINS_AEXP
> - * @awb_config:		For header->type == MALI_C55_PARAM_MESH_SHADING_CONFIG
> - * @shading_config:	For header->type == MALI_C55_PARAM_MESH_SHADING_SELECTION
> - * @shading_selection:	For header->type == MALI_C55_PARAM_BLOCK_SENSOR_OFFS
> + * @awb_config:		For header->type == MALI_C55_PARAM_BLOCK_AWB_CONFIG
> + * @shading_config:	For header->type == MALI_C55_PARAM_MESH_SHADING_CONFIG
> + * @shading_selection:	For header->type == MALI_C55_PARAM_MESH_SHADING_SELECTION
>    * @data:		Allows easy initialisation of a union variable with a
>    *			pointer into a __u8 array.
>    */
> 


