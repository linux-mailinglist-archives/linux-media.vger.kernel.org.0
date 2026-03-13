Return-Path: <linux-media+bounces-55664-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIMSNuPys2nYdgAAu9opvQ
	(envelope-from <linux-media+bounces-55664-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 12:20:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4466B282219
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 12:20:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9BFA3281B47
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 11:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3AE138C425;
	Fri, 13 Mar 2026 11:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PBPrtpCB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0200C30F535;
	Fri, 13 Mar 2026 11:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400517; cv=none; b=nG67Cw3ydz5j2+S5uLd8t6OVNRBeN1eatzyyiwVJyZcAeL6nd+qzJ2LTHDffL2ciHNyEjE4WpIaWY6+GofoW1DrEGFSXEtBYbSH9txD8+oiL3+Dzla/dsFVbpj+2cT1+UPl9RhdG5DaHZzEwpLJTgFO5waKVrwhlrLdSfY+UHdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400517; c=relaxed/simple;
	bh=kMmGALnWLGvFiD6jFi+QoSr9fFa5yf5m/4E+WYBZ0rE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WoLxgOhZ0DCUtHpmaqJKmB9xqi1L1BHjBD7sTUiGyU76fnnNdm0CUsh+1u9nqEn2X1RzFkm8s+CDYoUslQRIaMZutPlQHInnd8OYgv7ptllgdJ812FN7eUwpsBl7UBP/b+cJuRjXXzNLz1Cs+k9/bt2PJ8L9xEEOCxcSI6qkPUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PBPrtpCB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.33.26] (185.182.214.153.nat.pool.zt.hu [185.182.214.153])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65501F52;
	Fri, 13 Mar 2026 12:14:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773400445;
	bh=kMmGALnWLGvFiD6jFi+QoSr9fFa5yf5m/4E+WYBZ0rE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PBPrtpCBM81Z1aVHU7oENe9VtyHgxxRrGu8XNrxXQ+7Ifq4CRgI/wr9rVFSsvuDcH
	 HFftME+cTxYlAluJmGKaC1I77GVL7dOrrIDAJpkbkvVhKZBAU0/wipVNuaSfyeMx6p
	 dBcGs6LQGRDgxStw6eoipzTiWyndZ1G9P6ss833A=
Message-ID: <36f2247c-cfd5-46b4-a16d-1afc3a6504d8@ideasonboard.com>
Date: Fri, 13 Mar 2026 12:15:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] media: mali-c55: Fix Iridix bypass macros
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Anthony McGivern <anthony.mcgivern@arm.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Nayden Kanchev <Nayden.Kanchev@arm.com>,
 Konstantin Babin <Konstantin.Babin@arm.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260313-mali-c55-fixes-v7-0-v1-0-21805b2b516b@ideasonboard.com>
 <20260313-mali-c55-fixes-v7-0-v1-4-21805b2b516b@ideasonboard.com>
From: =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>
Content-Language: en-US, hu-HU
In-Reply-To: <20260313-mali-c55-fixes-v7-0-v1-4-21805b2b516b@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.45 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.71)[subject];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-55664-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 4466B282219
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

2026. 03. 13. 11:49 keltezéssel, Jacopo Mondi írta:
> From: Daniel Scally <dan.scally@ideasonboard.com>
> 
> The Mali C55 Iridix block has a digital gain function and tone mapping
> function, whose enablement is controlled by two different bits
> in the BYPASS_3 register.
> 
> Unfortunately, the "Gain" and "Tonemap" bypass bit definitions are the
> wrong way around. Swap them so that the ISP is now operated with the
> "Iridix Gain" block enabled and default configured at a x1.0 gain and
> with the "Iridix Tonemap" disabled, as it was originally intended.

As far as I can see the current upstream driver does not bypass either of them,
so swapping them will have no direct effect.


> 
> Cc: stable@vger.kernel.org
> Fixes: 8ec187829a4c ("media: mali-c55: Fix Iridix bypass macros")

Where is this commit? I cannot seem to find it.


Reviewed-by: Barnabás Pőcze <barnabas.pocze@ideasonboard.com>


> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>   drivers/media/platform/arm/mali-c55/mali-c55-registers.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
> index f5a148add1c8..f098effde7b4 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
> @@ -128,8 +128,8 @@ enum mali_c55_interrupts {
>   #define MALI_C55_REG_BYPASS_3_SENSOR_OFFSET_PRE_SH	BIT(1)
>   #define MALI_C55_REG_BYPASS_3_MESH_SHADING		BIT(3)
>   #define MALI_C55_REG_BYPASS_3_WHITE_BALANCE		BIT(4)
> -#define MALI_C55_REG_BYPASS_3_IRIDIX			BIT(5)
> -#define MALI_C55_REG_BYPASS_3_IRIDIX_GAIN		BIT(6)
> +#define MALI_C55_REG_BYPASS_3_IRIDIX_GAIN		BIT(5)
> +#define MALI_C55_REG_BYPASS_3_IRIDIX			BIT(6)
>   #define MALI_C55_REG_BYPASS_4				0x18ec0
>   #define MALI_C55_REG_BYPASS_4_DEMOSAIC_RGB		BIT(1)
>   #define MALI_C55_REG_BYPASS_4_PF_CORRECTION		BIT(3)
> 


