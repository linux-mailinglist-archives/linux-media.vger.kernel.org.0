Return-Path: <linux-media+bounces-55734-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAXfL7A1tGn4igAAu9opvQ
	(envelope-from <linux-media+bounces-55734-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:05:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 678AA286A17
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:05:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D14673013254
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A489F3BD65F;
	Fri, 13 Mar 2026 16:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZnV2uCmt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C538627EFF7;
	Fri, 13 Mar 2026 16:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773417885; cv=none; b=pm4NIpjwpvyNyPMhXrExAE50aw67WqOBH4KplZHcc8YGkoYrmqNqLihkuN9t47lgdIN7KLR3QJOZg4nl1M0AhiNfWA0YnIu3gKduGFZXl6w6TfAE/U0gww5y+xwF1oJUCrnRS3OP1/auJgBTlBGToh8+aubGNp5zOiwRQfTnzA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773417885; c=relaxed/simple;
	bh=jYeg5qbLi0FFttCEkiPww5nskQYsa0sggqvW+/9q3WM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=agm8RqdMtk/kLjL66RsiIejEDw8E++zz/kI+jayIdZ3dbomE8zOsOdlb5lIJ/CNZG+h129xAXHlWuIcEuBkcnnPxFSnelUe2hCmD2aEejyiJ8oW/wDRtQ6swyEOXPiAmz2huatbSbtMGe7EOVdehkQXB+GUvNiJivkGkmM6K+DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZnV2uCmt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A867FD0;
	Fri, 13 Mar 2026 17:03:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773417813;
	bh=jYeg5qbLi0FFttCEkiPww5nskQYsa0sggqvW+/9q3WM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZnV2uCmtio2nUBtgi5Ia1sEMk9mTRWinTgKhkSt3vzyp5CKVoH1yS4T+XACCgU8V+
	 kxtyu3ozS14KWYM8eM/7fmFezj6YgkusEfqZcXpg7mnZ1n8V7uAa4B5S0JGO4Gu5Ug
	 2kUAZ8qjNYBeNQ2B46zHKL4ASuHp0QqC+CgmFAXA=
Message-ID: <abe739d4-f72e-44ce-a43e-102bdf744957@ideasonboard.com>
Date: Fri, 13 Mar 2026 16:04:39 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] media: mali-c55: Bypass the Iridix Tonemap engine
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Anthony McGivern <anthony.mcgivern@arm.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Nayden Kanchev <Nayden.Kanchev@arm.com>,
 Konstantin Babin <Konstantin.Babin@arm.com>,
 =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260313-mali-c55-fixes-v7-0-v2-0-885c07961f30@ideasonboard.com>
 <20260313-mali-c55-fixes-v7-0-v2-5-885c07961f30@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260313-mali-c55-fixes-v7-0-v2-5-885c07961f30@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55734-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 678AA286A17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi

On 13/03/2026 14:54, Jacopo Mondi wrote:
> The Iridix Tonemap engine, if not bypassed, applies a digital gain
> in order to compensate under-exposed images.
> 
> This however breaks the exposure and gain regulation performed on the
> sensor.
> 
> If the Iridix Tonemap has to be used, it need to be supported in the
> ISP uAPI and properly configured by userspace.
> 
> As the driver doesn't support it at the moment, bypass it by default.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

> ---
>   drivers/media/platform/arm/mali-c55/mali-c55-params.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> index 773e5b6a2b7e..b9fc904a3844 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> @@ -825,6 +825,11 @@ void mali_c55_params_init_isp_config(struct mali_c55 *mali_c55,
>   	/* Disable the temper module's DMA read/write */
>   	mali_c55_ctx_write(mali_c55, MALI_C55_REG_TEMPER_DMA_IO, 0x0);
>   
> +	/* Disable IRIDIX module. */
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BYPASS_3,
> +				 MALI_C55_REG_BYPASS_3_IRIDIX,
> +				 MALI_C55_REG_BYPASS_3_IRIDIX);
> +
>   	/* Bypass the colour noise reduction  */
>   	mali_c55_ctx_write(mali_c55, MALI_C55_REG_BYPASS_4,
>   			   MALI_C55_REG_BYPASS_4_CNR);
> 


