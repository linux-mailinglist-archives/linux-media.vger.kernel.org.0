Return-Path: <linux-media+bounces-48961-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F8BCC6693
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 08:49:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 106FE30A4236
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 07:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB58346784;
	Wed, 17 Dec 2025 07:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UsKd67ha"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B38345CD5;
	Wed, 17 Dec 2025 07:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765956885; cv=none; b=slnV0vyoj0V1Jc3iZxXuLeuNGMyHladK5qDbN2wgN9GNK4QUfL+2rT5HSK+lZ9fA4svRxeeaHJjOivWgQEC0HdBlGRSLcei7MeKkDuPA2tBS5SaGqiOuBFRKRVOLG971Bms0QM2j9wYXS+ZnfZfKwTBAtAPWkoFq74YycVhDf4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765956885; c=relaxed/simple;
	bh=26yo6RUk3vLNPJ4mTLH51PlgRIgCAWFblxKoIxgw8CQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BpAey5pHtrALgomgx0dE2Vp0WrPQgunnk4WK14wufzWHQlg8EAHQi2hGcZrYJCTiYSmc4fWdvCa4Xy5Fe2QR41Ukx3ISbF53acy6kW8jPmv6aQfmS+YgnlDqUscyLVZVZrNvom7zcVBSptS4+QgjNk4YQ04WXs5DB+6b2ucVW9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UsKd67ha; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 572DC581;
	Wed, 17 Dec 2025 08:34:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765956875;
	bh=26yo6RUk3vLNPJ4mTLH51PlgRIgCAWFblxKoIxgw8CQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UsKd67hagUu2eFsob8+kAZ27HOzHJvS5FLd9/gDX+lN2Ahg1Xh3QgJ/v9EWija8be
	 RbNDva47gGb5PZrwCnRFk1iWbLj0qvGMPXIjBbAzBeNcNja9ZiMtPKpRnvO7iocUZZ
	 E1MvBfrv5wmBOEH/hgDRld1+78C53tUI1TPw015k=
Message-ID: <ca49e400-e24b-4817-8e8e-858623352c69@ideasonboard.com>
Date: Wed, 17 Dec 2025 07:34:37 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: mali-c55: Remove duplicated version check
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251215-mali-c55-header-update-for-v6-19-rc1-v1-0-69f56dee3c71@ideasonboard.com>
 <20251215-mali-c55-header-update-for-v6-19-rc1-v1-2-69f56dee3c71@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20251215-mali-c55-header-update-for-v6-19-rc1-v1-2-69f56dee3c71@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/12/2025 13:20, Jacopo Mondi wrote:
> The Mali C55 driver uses the v4l2-isp framework, which performs
> validation of the parameters buffer versioning in the
> v4l2_isp_params_validate_buffer() function.
> 
> It is not necessary to replicate the validation of the parameters buffer
> versioning in the platform-specific implementation.
> 
> Remove it.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

> ---
>   drivers/media/platform/arm/mali-c55/mali-c55-params.c | 7 -------
>   1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> index 082cda4f4f63e880162896ff0f893cd774982d51..be0e909bcf29f62c01c75d711c21278faf7c9de5 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> @@ -582,13 +582,6 @@ static int mali_c55_params_buf_prepare(struct vb2_buffer *vb)
>   	struct mali_c55 *mali_c55 = params->mali_c55;
>   	int ret;
>   
> -	if (config->version != MALI_C55_PARAM_BUFFER_V1) {
> -		dev_dbg(mali_c55->dev,
> -			"Unsupported extensible format version: %u\n",
> -			config->version);
> -		return -EINVAL;
> -	}
> -
>   	ret = v4l2_isp_params_validate_buffer_size(mali_c55->dev, vb,
>   			v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
>   	if (ret)
> 


