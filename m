Return-Path: <linux-media+bounces-55667-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UN3XE570s2nYdgAAu9opvQ
	(envelope-from <linux-media+bounces-55667-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 12:27:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F4C28237C
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 12:27:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA634317EF03
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 11:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5C8538F644;
	Fri, 13 Mar 2026 11:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Xjnh8QDw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D0839023F;
	Fri, 13 Mar 2026 11:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773401214; cv=none; b=SagFjF2pcVlMwqMJqSbi5JpcxVH/p0zKF34ChjAx1Mz2rw14nsy3J3iOsS58sOl2pSgRnzPCJA/l5oicT9BwOeSbHJx9vm0i9euipnMlDKN3+zC9hYDXzWyqis0/xJGhBDXvJXrdbfur8+b11vDFh8GBpS3lPMGo+I1I3Ehhd/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773401214; c=relaxed/simple;
	bh=eg6KebwN4fAq2cOS/0FOuwPpitLLxIN5MQAFQp3A4Fk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HE52xEAJp5TAs+bVtpjxHWlryekGk1vLlW1Wr3arxjrSCM3dT9nBaEmqkxckeXv902VWCFPHkRmEKJWsv6nnTWEbojHwfq8Semd2mwGGBno0dXVoQvHgddPXi8ZwVvvhcSVnkTQhq8Mnj7gJUUrsL9LX+oKdNuhhy+bfabGBIf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Xjnh8QDw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0609FF52;
	Fri, 13 Mar 2026 12:25:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773401140;
	bh=eg6KebwN4fAq2cOS/0FOuwPpitLLxIN5MQAFQp3A4Fk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xjnh8QDwDi+L9vAdXDNhsKizfnXOj6dCZHUlS8PYGgc3bAArMY1VAU82kmjpZlwqI
	 CcSxVXkAMWLYEBpoAIdlX7sks2ocppy/7Lz6RzQnsbS3jGC8RzPpkjprtLKCIUrRER
	 Y4kDEm5ceZKsIOjgxwQY0gQfHwMuwz5zxRz8U68w=
Message-ID: <c9ab7242-2d40-4eec-a09b-efce4dd222c6@ideasonboard.com>
Date: Fri, 13 Mar 2026 11:26:46 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] media: mali-c55: Fix wrong comment of ISP block types
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Anthony McGivern <anthony.mcgivern@arm.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Nayden Kanchev <Nayden.Kanchev@arm.com>,
 Konstantin Babin <Konstantin.Babin@arm.com>,
 =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260313-mali-c55-fixes-v7-0-v1-0-21805b2b516b@ideasonboard.com>
 <20260313-mali-c55-fixes-v7-0-v1-1-21805b2b516b@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260313-mali-c55-fixes-v7-0-v1-1-21805b2b516b@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55667-lists,linux-media=lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E5F4C28237C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo

On 13/03/2026 10:49, Jacopo Mondi wrote:
> Some bad copy&paste happened in the description of the ISP block types
> and AWB_CONFIG got mixed up with SHADING_CONFIG.
> 
> Fix it by assigning to each block the correct type.
> 
> As only the comment is changed, there is no uABI breakage or regression.
> 
> Cc: stable@vger.kernel.org
> Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

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


