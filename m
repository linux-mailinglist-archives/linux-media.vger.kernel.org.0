Return-Path: <linux-media+bounces-7148-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0117687D0CE
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 16:57:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7C7C281EB5
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 15:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C923FE47;
	Fri, 15 Mar 2024 15:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SS/ihv6v"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA9D3E48E
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 15:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710518234; cv=none; b=BsTaIedkVLLf+LHCIv/tZqdSw5EHaDdIlBtCCr2qSHxFc5Kbv7tObpqfyyp2fE/Za2+6xJSwR8HIposTgteXKpEsuR6wsd9aD3KfvhjdamXLg7+2z8sCAKsbvDiAQKAFx2dfMGXQqNBOjH6hsVY7pVmw/f8YgLGxcyxNnSTX9vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710518234; c=relaxed/simple;
	bh=qCRE9IHEK12CGr0shQLC9QgPbqXdh/5W7cVgri5TqPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XpOYaSQvjVs5fATHS0WTXkoKA4b5ZaArJeRuyb2KxPikxo9wGYIjkqae/gwPMgenfR/9lXiuWUJKMr6n1VDVN7mJkr4CXRglbYlA7nlmeCMCIc9lBd7D+EAW0y314tl9cc5kenL54CKo7orFaMZkxf9tDDiwpayZjSb6VKSkQnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SS/ihv6v; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710518231;
	bh=qCRE9IHEK12CGr0shQLC9QgPbqXdh/5W7cVgri5TqPU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SS/ihv6vNUhNXC//dkD6X07mjmDT5YiLiTo1ezQR0bCTez6+wOHvQxCTYhVRK/kMI
	 7eLy3PerlprNNhkL42vpU1c1rNW4YwWQ/AWBAkddLEzSBooK5ya5McGHo6WDtp8xiW
	 0xHDfBs29VqsUhcJiob6/pKMz/sbTfMRDDyNLm05N6TkvxGrCuDv+C9CjAQqnv7Ajq
	 2fcIvyaUeLX4CTeNrUt2vi3wsqpkvjjf2cZ7XCIjChfcu8r9k9zhowEofPrU3UD08O
	 bBY39MWtgCSWh/KmctTW21TpQPZ6aD452s04W33MSCWtTaGumxKgl5qZw4z/PRLTto
	 0y+/vc7wUMIAA==
Received: from [100.74.67.65] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4DBA03782110;
	Fri, 15 Mar 2024 15:57:10 +0000 (UTC)
Message-ID: <6dfc7411-56b2-464e-af9e-2b18bb0817c3@collabora.com>
Date: Fri, 15 Mar 2024 16:57:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 21/38] media: ccs: Move ccs_validate_csi_data_format up
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
 hongju.wang@intel.com, hverkuil@xs4all.nl,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dmitry Perchanov <dmitry.perchanov@intel.com>,
 "Ng, Khai Wen" <khai.wen.ng@intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-22-sakari.ailus@linux.intel.com>
From: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <20240313072516.241106-22-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/13/24 08:24, Sakari Ailus wrote:
> ccs_validate_csi_data_format() will soon be needed elsewhere, above its
> current location. Move it up.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
> ---
>   drivers/media/i2c/ccs/ccs-core.c | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 0cd8ee957655..0efbc63534bc 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -1979,6 +1979,20 @@ static int ccs_post_streamoff(struct v4l2_subdev *subdev)
>   	return pm_runtime_put(&client->dev);
>   }
>   
> +static const struct ccs_csi_data_format
> +*ccs_validate_csi_data_format(struct ccs_sensor *sensor, u32 code)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(ccs_csi_data_formats); i++) {
> +		if (sensor->mbus_frame_fmts & (1 << i) &&
> +		    ccs_csi_data_formats[i].code == code)
> +			return &ccs_csi_data_formats[i];
> +	}
> +
> +	return sensor->csi_format;
> +}
> +
>   static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
>   			      struct v4l2_subdev_state *sd_state,
>   			      struct v4l2_subdev_mbus_code_enum *code)
> @@ -2114,20 +2128,6 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
>   	}
>   }
>   
> -static const struct ccs_csi_data_format
> -*ccs_validate_csi_data_format(struct ccs_sensor *sensor, u32 code)
> -{
> -	unsigned int i;
> -
> -	for (i = 0; i < ARRAY_SIZE(ccs_csi_data_formats); i++) {
> -		if (sensor->mbus_frame_fmts & (1 << i) &&
> -		    ccs_csi_data_formats[i].code == code)
> -			return &ccs_csi_data_formats[i];
> -	}
> -
> -	return sensor->csi_format;
> -}
> -
>   static int ccs_set_format_source(struct v4l2_subdev *subdev,
>   				 struct v4l2_subdev_state *sd_state,
>   				 struct v4l2_subdev_format *fmt)

-- 
Julien Massot
Senior Software Engineer
Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

