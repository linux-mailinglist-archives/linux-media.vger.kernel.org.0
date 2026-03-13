Return-Path: <linux-media+bounces-55737-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAHmJ/E1tGn4igAAu9opvQ
	(envelope-from <linux-media+bounces-55737-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:06:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21180286A56
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:06:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6260B3029775
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BC8A3C2793;
	Fri, 13 Mar 2026 16:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wlgpO6YQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864DF3C5DBF;
	Fri, 13 Mar 2026 16:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773417894; cv=none; b=EA1Ght5Cj7kU4J5KEp14fE14eQ+1ht9ksbWXQmG5Up+Wj742wmWqkdInxwtB3k7PRlGBs93Q3faEdbaq254ScBE1GuK9swZutyIUB468f8laxBB50+aohn7Ci4l7IcFb3RNqdkMTpSjnz3lqN91/NWNoS4sNmvKGv8q3KGg+6fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773417894; c=relaxed/simple;
	bh=Qb9bXnSib9M2J/mpJAW3ZvnJz/M2knKeLihyrA8J3ZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P4K03Nmz9z1vuPKaZ++nvPinSMBr8FE4+obiS3LhXxqVp1nSyQOYS4DvRojBer98p8ca9F+QVvcQitWNHtokE7oF0awugy8Ax5Mtihnii3ehrpNO5kOTaA4DbMYvgEBzp2AJLm+T0LzIAe5pcGmYOolObZ2EW8sELpeeIeQasPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wlgpO6YQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D259ED0;
	Fri, 13 Mar 2026 17:03:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773417823;
	bh=Qb9bXnSib9M2J/mpJAW3ZvnJz/M2knKeLihyrA8J3ZQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=wlgpO6YQhZHmVkTxjQghT0wZJ2EW4ZyrPgCwCezFnCI6oIrmVvdQKo3CkjOUzX6Wh
	 DD5kCc+4HXOmAnxbTHgOO0wgvyP0eNr8UmEa5eVpnGkzqVC8JRMwaSxr4I9shSTBLx
	 HeuvuZwe6EB/c9Yxao9fF7K1yBMY4lX+hIsT7lmU=
Message-ID: <25e99098-1405-452d-874d-17a65372a5e1@ideasonboard.com>
Date: Fri, 13 Mar 2026 16:04:48 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] media: mali-c55: Bypass Purple Fringe Correction
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Anthony McGivern <anthony.mcgivern@arm.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Nayden Kanchev <Nayden.Kanchev@arm.com>,
 Konstantin Babin <Konstantin.Babin@arm.com>,
 =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260313-mali-c55-fixes-v7-0-v2-0-885c07961f30@ideasonboard.com>
 <20260313-mali-c55-fixes-v7-0-v2-6-885c07961f30@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260313-mali-c55-fixes-v7-0-v2-6-885c07961f30@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55737-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 21180286A56
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo

On 13/03/2026 14:54, Jacopo Mondi wrote:
> The Purple Fringe Correction module is enabled by default with a POR
> configuration which might not be correct for the lens/sensor combination
> in use.
> 
> If the Purple Fringe Correction module has to be used, it needs to be
> supported in the driver's uAPI and properly configured by userspace.
> 
> As the driver doesn't support it at the moment, bypass it by default.
> 
> Reviewed-by: Barnabás Pőcze <barnabas.pocze@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

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


