Return-Path: <linux-media+bounces-48876-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 632B3CC2F02
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 13:49:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B210304304A
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 12:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DA8E39BECA;
	Tue, 16 Dec 2025 12:38:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40C139BEA3;
	Tue, 16 Dec 2025 12:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765888699; cv=none; b=hBZPNqQPgRNzM4lVbu3iCSQ/hHAVKmmHVbkNmY/evlWtzuVQc9CMYvd8ur07N/YVZqWVmkUlL1H01MeQbdBSdCZXUUA6G7F4GKaKibvWbzNuxWlHB/pNuzhJZbz3ncvdEyd0OKcOiO8IKZZCsdffM5SakemhSEoOlKviGPs3V7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765888699; c=relaxed/simple;
	bh=Gmmw/TZ8a/avM5RAon/YG1ZlXi55WP3VA7k/C1t6MEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H5FeifmH+XQ5riVGePICael6B4UY+uIApvf0e9JiHBn8W+EJHX0+ykRxxHGQp3lLlAbvTqpvT5DhnNkW9uQjYd9MKXawKaQHljOh9CbTyJ9+UE3FWhXfK0FbY6+7C0uG6kRew0HuMX6cblrkI9cv9wf/QABxx0FG1cktqwIO5YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B985C4CEF1;
	Tue, 16 Dec 2025 12:38:18 +0000 (UTC)
Message-ID: <6e62636b-5164-4386-9782-3e8197683e43@nxsw.ie>
Date: Tue, 16 Dec 2025 12:38:16 +0000
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
 Daniel Scally <dan.scally@ideasonboard.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251215-mali-c55-header-update-for-v6-19-rc1-v1-0-69f56dee3c71@ideasonboard.com>
 <qHuyxg4frFKDSJM4RD1PqtVx7G5pItw_7wb2dRhy0G61Mis29jlLftxor8AgitMdn3wdzpzsKMEgM-cSxWaemQ==@protonmail.internalid>
 <20251215-mali-c55-header-update-for-v6-19-rc1-v1-1-69f56dee3c71@ideasonboard.com>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Content-Language: en-US
In-Reply-To: <20251215-mali-c55-header-update-for-v6-19-rc1-v1-1-69f56dee3c71@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/12/2025 13:20, Jacopo Mondi wrote:
> The Mali C55 driver uses the v4l2-isp framework, which defines its own
> versioning numbers.
> 
> Do not use the Mali C55 specific version identifier in the code example
> in the documentation of the Mali C55 stats and params metadata formats.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
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
> --
> 2.52.0
> 
> 

Feels like this should have a Fixes tag.

---
bod

