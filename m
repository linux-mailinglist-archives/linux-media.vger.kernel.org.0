Return-Path: <linux-media+bounces-55665-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IXEEW/ys2nYdgAAu9opvQ
	(envelope-from <linux-media+bounces-55665-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 12:18:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E0F282199
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 12:18:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93AD33073A74
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 11:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56BBD38B14E;
	Fri, 13 Mar 2026 11:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L6f0/7Wy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49B737B407;
	Fri, 13 Mar 2026 11:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400536; cv=none; b=f7QCidiSVLN9yk0kcO/J22BHVaGTyM21lbygVkebLxAAvkZj7678x04hIrSMdskDj3Wzw4RZOTXmGd1xtYXU7306p6P0TPIP/4l0fe7rqCaeNor3MP4J0nYFXH+nHIRbHFUTU18PwsukWEA7ZP8X5jGbWu66lYu0Hs1g/yx2uUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400536; c=relaxed/simple;
	bh=8i1USougtRFeJVYHxcG0yF/lwRjzYdlpOyW6u9pLaIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r6fOwTPGIrv3NcH7prObEY3yb9/rwHKkyeR7NuXm+5gGHJNJU1Rojg8AlPzfutI/ZRdmiqXhz5pNGDNhhQbhM02E9dRP3NcxZLe4bBC485gXuOXkV9Rx8F/zYEoPz7yanmdSFPrxeJAw9fd0xgMTyRF8thJm+dcRhrhq8BASPWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L6f0/7Wy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.33.26] (185.182.214.153.nat.pool.zt.hu [185.182.214.153])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F7E2F52;
	Fri, 13 Mar 2026 12:14:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773400465;
	bh=8i1USougtRFeJVYHxcG0yF/lwRjzYdlpOyW6u9pLaIw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=L6f0/7WyRunNPITKWMfVFZZOaq3qc+KVv/3bU5OISi2VPhbJMcWOrTT2tIdgGaspr
	 OL7xqmDwB4Pc0HZSLdVaTWOeNEqRWlAs2RHkwiK8AJa814ckR/R0/ePHHLY+AFbjxQ
	 l09q59ipa66AtPpHdv0aLrRAY3GHHOMZaF0ECCVc=
Message-ID: <ec66a1fc-5132-4da4-b2ae-ef158ce7a49c@ideasonboard.com>
Date: Fri, 13 Mar 2026 12:15:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] media: mali-c55: Bypass Purple Fringe Correction
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Anthony McGivern <anthony.mcgivern@arm.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Nayden Kanchev <Nayden.Kanchev@arm.com>,
 Konstantin Babin <Konstantin.Babin@arm.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260313-mali-c55-fixes-v7-0-v1-0-21805b2b516b@ideasonboard.com>
 <20260313-mali-c55-fixes-v7-0-v1-6-21805b2b516b@ideasonboard.com>
From: =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>
Content-Language: en-US, hu-HU
In-Reply-To: <20260313-mali-c55-fixes-v7-0-v1-6-21805b2b516b@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.45 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.71)[subject];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-55665-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B6E0F282199
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

2026. 03. 13. 11:49 keltezéssel, Jacopo Mondi írta:
> The Purple Fringe Correction module is enable by default with a POR
                                          enabled


> configuration which might not be correct for the lens/sensor combination
> in use.
> 
> If the Purple Fringe Correction module has to be used, it needs to be
> supported in the driver's uAPI and properly configured by userspace.
> 
> As the driver doesn't support it at the moment, bypass it by default.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---

Reviewed-by: Barnabás Pőcze <barnabas.pocze@ideasonboard.com>


>   drivers/media/platform/arm/mali-c55/mali-c55-params.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> index b9fc904a3844..de0e9d898db7 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> @@ -830,9 +830,10 @@ void mali_c55_params_init_isp_config(struct mali_c55 *mali_c55,
>   				 MALI_C55_REG_BYPASS_3_IRIDIX,
>   				 MALI_C55_REG_BYPASS_3_IRIDIX);
>   
> -	/* Bypass the colour noise reduction  */
> +	/* Bypass the colour noise reduction and the PF modules  */
>   	mali_c55_ctx_write(mali_c55, MALI_C55_REG_BYPASS_4,
> -			   MALI_C55_REG_BYPASS_4_CNR);
> +			   MALI_C55_REG_BYPASS_4_CNR |
> +			   MALI_C55_REG_BYPASS_4_PF_CORRECTION);
>   
>   	/* Disable the sinter module */
>   	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_SINTER_CONFIG,
> 


