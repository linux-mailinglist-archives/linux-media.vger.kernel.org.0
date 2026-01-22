Return-Path: <linux-media+bounces-51320-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePCqFDXScWk+MgAAu9opvQ
	(envelope-from <linux-media+bounces-51320-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 08:31:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C267662803
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 08:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6ABB64F2340
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 07:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69148237707;
	Thu, 22 Jan 2026 07:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AjvUrnr2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8574F48034C;
	Thu, 22 Jan 2026 07:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769067002; cv=none; b=pjLuRTkQ2b6WApi3qhpMyKuPmVgiWLH12xKozsVCzgiopkvyOnFXjIQTHuCbzYSYr1m1KxpmNJUl8HziNXjNdimDKPVj6YKa/+UU02iLdkAN4bnRoReICvSqXgCl/HM0QWrjVrp8oszQNHkjMKbDrIzVsYebMXktkmomARFdGCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769067002; c=relaxed/simple;
	bh=YM3AW0pVOXb3Lk6lSRKFCuhtCkxThfmSa0X3giOs3Vk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DBm5/VY7vfP+RwmMBc0L+eDPVrIyJwN6Nc8J3kIopRSHojbotwZVWR3EN5kSSC9q+Y0UOOLod342f4ovmYRtMecodXOS1OsSKxsEDfYfH935q2vgr1D9mFh/SrXduBDmpIe6gYBRAtaS2ZKVqjY1/8Aa9prj6VpzEgMjcxVyNMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AjvUrnr2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0AE942DD;
	Thu, 22 Jan 2026 08:29:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769066958;
	bh=YM3AW0pVOXb3Lk6lSRKFCuhtCkxThfmSa0X3giOs3Vk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AjvUrnr2MIoitiUEui+yFwQTXYSlRbhsqg8czhgqxFx9UtnM/pa93uFda4CBmaC2Z
	 17++e2yZhgAG27UPgby92Trn3IhJ8cHDaKiLaGz7L1A9ioDbaELqHkR0o2JPZvqziO
	 V9jxJyXuZrVSiNCUZwA+0LzT7l2cZLTN3lxObUdo=
Message-ID: <743ac9a0-e5a2-4052-8fb8-78bc6895f75b@ideasonboard.com>
Date: Thu, 22 Jan 2026 07:29:46 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for v6.19-rc6] media: mali-c55: Fix wrong comment of ISP
 block types
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 linux-kernel@vger.kernel.org
References: <20260119100801.865809-1-jacopo.mondi+renesas@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260119100801.865809-1-jacopo.mondi+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-51320-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[ideasonboard.com,none];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.scally@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,ideasonboard.com:mid,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: C267662803
X-Rspamd-Action: no action

Hi Jacopo

On 19/01/2026 10:08, Jacopo Mondi wrote:
> Some bad copy&paste happened in the description of the ISP block types
> and AWB_CONFIG got mixed up with SHADING_CONFIG.
> 
> Fix it by assigning to each block the correct type.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

> ---
> Do we still have time for v6.19 or is this too late ?
> Can I help fast-tracking this somehow ? Nothing critical, but it would be nice
> if this lands in the same release as the driver it fixes.
> ---
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
> --
> 2.52.0
> 


