Return-Path: <linux-media+bounces-48962-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA5ECC676D
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 09:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18B54303ADE0
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 07:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F13346AD1;
	Wed, 17 Dec 2025 07:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fmiGwDaD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE71346A1E;
	Wed, 17 Dec 2025 07:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765956894; cv=none; b=AeOLSpkXu2j53ShDNKRl1X+H/eHhdPBcjzAg12ZR7WhBEgmkttZFcX0/sXjIvrACdoJzs5bP5EGUBBbyfty4FKUN+zCpLodKTWWsogiE8Y/dDx7Zf+BUGDM1jSXifRbWD4ykcxi4cllFVvaM4FZFD+jXdfmelWx5PXha/dLaSok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765956894; c=relaxed/simple;
	bh=5G9U5keRlXRDGsnnFBSP33qGOhqXJGp/relrAftusIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hHlY2NjeqwoHNaZ3p2Xjl3gaMTcFVbbxkANEpanRvO9ZGJ9fDBEij+tdSccIxkC3g+erKKaMCtgxudjuBcFYITD0raLkb6C7NqkSKHu1RwyavasiEa7V6I/0gDF35OOWStA6xkyI6/yC1GUZI4h4gkyAlHcjfm865zOiG9ShbNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fmiGwDaD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37B06581;
	Wed, 17 Dec 2025 08:34:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765956885;
	bh=5G9U5keRlXRDGsnnFBSP33qGOhqXJGp/relrAftusIc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fmiGwDaDU0dxs+lwfExEBGzONVo0+OnbTJVc/d5RNkpeWURktDpEUU9KlSgkuWasc
	 nTnY4zgY6yjkim7c5LobleUCIUkIbNwd4xygyvGIq5nAB9Zc/L5gDPZ+FqNsXzNCFr
	 nFY+ja0Cce6Qj1QfzeS8mmug3qkXqozzy+hNiSiY=
Message-ID: <5501ad49-06a0-41b9-98aa-65bb0a44e84c@ideasonboard.com>
Date: Wed, 17 Dec 2025 07:34:48 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] uapi: media: mali-c55-config: Remove version
 identifier
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251215-mali-c55-header-update-for-v6-19-rc1-v1-0-69f56dee3c71@ideasonboard.com>
 <20251215-mali-c55-header-update-for-v6-19-rc1-v1-3-69f56dee3c71@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20251215-mali-c55-header-update-for-v6-19-rc1-v1-3-69f56dee3c71@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/12/2025 13:20, Jacopo Mondi wrote:
> The Mali C55 driver uses the v4l2-isp framework, which defines its own
> versioning number which does not need to be defined again in each
> platform-specific header.
> 
> Remove the definition of mali_c55_param_buffer_version enumeration from
> the Mali C55 uAPI header.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   include/uapi/linux/media/arm/mali-c55-config.h | 9 ---------
>   1 file changed, 9 deletions(-)
> 
> diff --git a/include/uapi/linux/media/arm/mali-c55-config.h b/include/uapi/linux/media/arm/mali-c55-config.h
> index 109082c5694f6b927dc5511043e3bfbc27a0b675..3d335f950eeb1e58ed3cbb556752996f16441e55 100644
> --- a/include/uapi/linux/media/arm/mali-c55-config.h
> +++ b/include/uapi/linux/media/arm/mali-c55-config.h
> @@ -194,15 +194,6 @@ struct mali_c55_stats_buffer {
>   	__u32 reserved3[15];
>   } __attribute__((packed));
>   
> -/**
> - * enum mali_c55_param_buffer_version - Mali-C55 parameters block versioning
> - *
> - * @MALI_C55_PARAM_BUFFER_V1: First version of Mali-C55 parameters block
> - */
> -enum mali_c55_param_buffer_version {
> -	MALI_C55_PARAM_BUFFER_V1,
> -};
> -
>   /**
>    * enum mali_c55_param_block_type - Enumeration of Mali-C55 parameter blocks
>    *
> 


