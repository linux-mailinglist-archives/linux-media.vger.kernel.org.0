Return-Path: <linux-media+bounces-34722-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B9EAD876E
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 11:14:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F38C31E2B4B
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 09:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980E4279DD6;
	Fri, 13 Jun 2025 09:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eX8sfjU0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6FA279DB7
	for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 09:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749806015; cv=none; b=K8xaAt8v/ZP/F7kLIsy7VePlZcWD2cHEEjbbuvkMV5xVumbF+xv7cfN+QwhY36E3w2D+ZLbVEh8kvAw9mI7nHQ0ZBolt5TKP2JKl2y1Kcdr9/TKBtkI7g9OhDu//TXoWXAkzezM9s6ZksWln9vWJqgEFpCKS0qRHyYSH1xGyViw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749806015; c=relaxed/simple;
	bh=0Y6jj9KLtJf7LDEPJ7LwBrYF5ykPWh73hsXHYb3N9m0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nDkaozyeRuRVOee6rj5jbGyHsvbMU5bEwQMlQD+WmsNIVpLQdZ6WmVhtcMHYyE5zq4rCvSq0j6W2Va5FnpxoX+ENA0VqhVtqOz844TYe49HbNOadyVcXToIN8I3UM8ciEnBpJs7ZqClsXecAiZpj5WKJMBQ2clGatmoDBb7pIog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eX8sfjU0; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a5123c1533so1221310f8f.2
        for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 02:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749806012; x=1750410812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1aYNJkPV0aW25Kv1bxqP6lGz7djS3jyufH29SAsPd+Y=;
        b=eX8sfjU0OuJYBUc/YNoqshkt78VpSG345KRQ+Bnz7497qPvFCQaenijTi4oncKqPdZ
         /Kr5MrwCTrDbVoXPvuGQxcExbBfOr3DniCSQWDFeS3Fud2olx4BR3eK2VTnu+Xh1sdgh
         OJ3ixASS61vkFMdnqevoPoX5OTEeOkjivXXXZXukavdh4MzIebclNPmZsuy9t5hY/9G8
         NGBd/soSg3yucdoDTclgQfV6MgtNFKUBh4ACVwenFN0XXvez2Xxy0UETIeFBmEY+iZx7
         Ke5qFd7nDDzBT8pK6H0DuIzoK8RclJixvDoPU5YvKqO01liQc3l/v5nJv5ObQBqPe43i
         DT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749806012; x=1750410812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1aYNJkPV0aW25Kv1bxqP6lGz7djS3jyufH29SAsPd+Y=;
        b=EMe+6k/z+Q1j4gJKNjd6hEOQMhPgY/0xrsGdNdRed5g56vnHLJFjV0EMnldW7Pm9pq
         gxHPS9FBWLZZ1xKHqtzcYdHXzMReka5R+d9BDq5ZDPK+4hePEjPNk/8sZhm1Esbl2MrV
         ghwOPiRycDCoIz4/WCu54SWhKlpyu15c7nSAWyYV2LnGt1EK1606ioTB7OudB5NPj5sf
         7+xdIyrwxF/omIYkajru4Itz3KYZjklwk4gCK0DL0d9O2fZgSfVwMzLJiR+W5lf5XBoa
         j4mNIRQRYBiTVN4Br7/A3785iP/H/qXHPj/FhOw8D5DZTKhjv1+INNZVTaWShjhOyaBe
         mcYA==
X-Gm-Message-State: AOJu0YzjC2DXQ7eCcuwfbQjiefcNzby3bgWSNZCh052fZTsyELTMdiLZ
	z+Iv2cSZBfGcFniDa+it7SQbeqXLAj+gdLp4/gfJeuoRIHrXICbEp4O3zzxE5aFopHI=
X-Gm-Gg: ASbGncuuJurd/GcVnJRNBQ2k4F/W+CnvRf48OPbaP0L3PmdrU4pw/wykmdt1C8coiY8
	I0bSj+/H8IQXvyumqEPDnTyt3A/IEWWISGk8AodxwBc9HELo3i8uqXPMEC0DCVaHJFu/M0dX+qD
	iQdjQC+90H/UlQgZmrQD/t8Kzk6zj4C8EAc06cGYAbpJijUUcjgQxKVLlymnlb52q8Hy+exc+Y4
	d5scKe0uvsr3eCHyRw0x2qqEcVbDEj/1fTKf29lFuxPbAwqHouTp3ABcF0Wutq1QmsELAgdSKcb
	LimOra2HvEuXFnbdn40UlIN+bmDf4xjvGKKFEMTqk2xARSYzIIKqcouDH5rD0C9CB4YhAU0uR62
	5XJXCuNCf/3twKKWGFR3xjX8gAbI=
X-Google-Smtp-Source: AGHT+IGW47TYDwlkxZMyvu4lj634mjFRvgCqkvRaKt0YG2LrxM+RfM/AFmBv8OvJjzRO2nK2t9L3Xg==
X-Received: by 2002:a05:6000:2502:b0:3a4:f024:6717 with SMTP id ffacd0b85a97d-3a568730dc7mr2113321f8f.53.1749806011699;
        Fri, 13 Jun 2025 02:13:31 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b1bc97sm1745386f8f.68.2025.06.13.02.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 02:13:31 -0700 (PDT)
Message-ID: <a020c020-c28d-4f06-aea1-483f404ed715@linaro.org>
Date: Fri, 13 Jun 2025 10:13:30 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] media: qcom: camss: simplify
 camss_subdev_notifier_complete() function
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
 <gH5U5Np4YjvmdEnO8j2Pam7buBgsyZNrP4crrHHDSDkI_2jijUdo7mWsUoJTGjJHnQPWy3SFa-MnK4TrhFLa4A==@protonmail.internalid>
 <20250513142353.2572563-7-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250513142353.2572563-7-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/05/2025 15:23, Vladimir Zapolskiy wrote:
> For sake of code simplicity and readability reduce the function code by
> one level of indentation, the change is non-functional.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 50 +++++++++++------------
>   1 file changed, 25 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 4e91e4b6ef52..39c5472f4552 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3385,35 +3385,35 @@ static int camss_subdev_notifier_complete(struct v4l2_async_notifier *async)
>   	struct camss *camss = container_of(async, struct camss, notifier);
>   	struct v4l2_device *v4l2_dev = &camss->v4l2_dev;
>   	struct v4l2_subdev *sd;
> -	int ret;
> 
>   	list_for_each_entry(sd, &v4l2_dev->subdevs, list) {
> -		if (sd->host_priv) {
> -			struct media_entity *sensor = &sd->entity;
> -			struct csiphy_device *csiphy =
> -					(struct csiphy_device *) sd->host_priv;
> -			struct media_entity *input = &csiphy->subdev.entity;
> -			unsigned int i;
> -
> -			for (i = 0; i < sensor->num_pads; i++) {
> -				if (sensor->pads[i].flags & MEDIA_PAD_FL_SOURCE)
> -					break;
> -			}
> -			if (i == sensor->num_pads) {
> -				dev_err(camss->dev,
> -					"No source pad in external entity\n");
> -				return -EINVAL;
> -			}
> +		struct csiphy_device *csiphy = sd->host_priv;
> +		struct media_entity *input, *sensor;
> +		unsigned int i;
> +		int ret;
> +
> +		if (!csiphy)
> +			continue;
> +
> +		input = &csiphy->subdev.entity;
> +		sensor = &sd->entity;
> +
> +		for (i = 0; i < sensor->num_pads; i++) {
> +			if (sensor->pads[i].flags & MEDIA_PAD_FL_SOURCE)
> +				break;
> +		}
> +		if (i == sensor->num_pads) {
> +			dev_err(camss->dev,
> +				"No source pad in external entity\n");
> +			return -EINVAL;
> +		}
> 
> -			ret = media_create_pad_link(sensor, i,
> -				input, MSM_CSIPHY_PAD_SINK,
> +		ret = media_create_pad_link(sensor, i, input,
> +				MSM_CSIPHY_PAD_SINK,
>   				MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
> -			if (ret < 0) {
> -				camss_link_err(camss, sensor->name,
> -					       input->name,
> -					       ret);
> -				return ret;
> -			}
> +		if (ret < 0) {
> +			camss_link_err(camss, sensor->name, input->name, ret);
> +			return ret;
>   		}
>   	}
> 
> --
> 2.45.2
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

