Return-Path: <linux-media+bounces-48960-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C36DCC675E
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 08:59:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 798BC30A3234
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 07:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72AA1345CAF;
	Wed, 17 Dec 2025 07:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="C05MKmR3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E66345756;
	Wed, 17 Dec 2025 07:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765956876; cv=none; b=MvImQY2uEKUhx+nDqXDQKYT/ZriGgGgUI4xtzgWZuwvh881jTOpe66UtlHGKTKOczp3fKBWGSPw2sBNKZzPaIydDG/qfpqFGKGPLR0WNzrIfsFEN6hKD47NDYyREnO/Oe6PyS1tZvtJjRrnKX/Gpx2vYdM4Cee052NYKnuQsFPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765956876; c=relaxed/simple;
	bh=tK/1/uuGCPycvpTp2bnkHoKJ5tPlaqyGvF9Wb76cHes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ESi3Um8uO+yl4AoHx3hl4dtaL6iDGm03g/1HBcLfnaFOYBxYUuhRmXB4nvIm08kovPO9BDqVXRIr3FyVRomChY2q9M3fRKQ4RI4kWI1AAVBWDmqXvuNYxI8Itp50K3Ndv76Pwh1X4obafPTH9sDufuoHNrqa48ACf+ic3zlKiZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=C05MKmR3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43F46581;
	Wed, 17 Dec 2025 08:34:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765956865;
	bh=tK/1/uuGCPycvpTp2bnkHoKJ5tPlaqyGvF9Wb76cHes=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C05MKmR3JChzRjLevUvuyJP9oQdNtnjsi3hYwgUaJEQU1abcSP+dgyU69OuqqJGV1
	 Ilfg2VXaFl/BJi8rFop4gpff+/GF/VWanlWJM2yl+0XzECc52IHX9nPFgDxggKw0uO
	 0gdnRd0tmwlGXbZ5lQA/qWnola4suabDObPDYkaY=
Message-ID: <0c41ca48-5b1f-4abd-a358-f5b0391cc87a@ideasonboard.com>
Date: Wed, 17 Dec 2025 07:34:27 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] Documentation: media: mali-c55: Use v4l2-isp version
 identifier
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251215-mali-c55-header-update-for-v6-19-rc1-v1-0-69f56dee3c71@ideasonboard.com>
 <20251215-mali-c55-header-update-for-v6-19-rc1-v1-1-69f56dee3c71@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20251215-mali-c55-header-update-for-v6-19-rc1-v1-1-69f56dee3c71@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Morning Jacopo - thanks for the set

On 15/12/2025 13:20, Jacopo Mondi wrote:
> The Mali C55 driver uses the v4l2-isp framework, which defines its own
> versioning numbers.
> 
> Do not use the Mali C55 specific version identifier in the code example
> in the documentation of the Mali C55 stats and params metadata formats.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst b/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
> index 696e0a645a7e0566921a3e9db3226b76d402f909..f8029bcb528283cddb1ea854b25469af97ecfa54 100644
> --- a/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
> +++ b/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
> @@ -44,7 +44,7 @@ member and userspace must populate the type member with a value from
>   	struct v4l2_isp_params_buffer *params =
>   		(struct v4l2_isp_params_buffer *)buffer;
>   
> -	params->version = MALI_C55_PARAM_BUFFER_V1;
> +	params->version = V4L2_ISP_PARAMS_VERSION_V1;
>   	params->data_size = 0;
>   
>   	void *data = (void *)params->data;
> 


