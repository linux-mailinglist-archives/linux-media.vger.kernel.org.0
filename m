Return-Path: <linux-media+bounces-32414-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 025A1AB59E1
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 18:30:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46A953A395A
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 16:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C6E2BF3C7;
	Tue, 13 May 2025 16:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q5oqYpU9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CB928DF0E
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 16:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747153802; cv=none; b=d1Gq0KhNWaVYNZw5R/LmqKH9JbAcWNtngcatxYqNzFDQxObhtAPbDaTM/BKCXHyixCP9AaKvDaJ2lZpw9XtVDDIIyvYpEgNH04f/f8tjyWA4QijJIM84Fr/HxZnQJ112SIr8nFDrS2SCKSA3OZt8LSKbnl1mZZcDNhf8nZZhaX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747153802; c=relaxed/simple;
	bh=66JNDyuwqPa/Hogugrn9BHCE4zV06caz6Wqc7A06/9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tf/4QBHhoPOYWrKRrdAJ71O9HmQ0+sOv39ArmHVbb5DmvjFnOQpG9hZ2i4qlsuwz4zb+4/tQ1+P1vqL/+m6qyNl4xJLnpuiAVBHvoQIoPanmYbDSg+GMlqySFPuS3AOUHMGyGH5wlTam9GG9xPvIswavooqY1Ic0b/dq9/3zRqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q5oqYpU9; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad220f139adso764166566b.1
        for <linux-media@vger.kernel.org>; Tue, 13 May 2025 09:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747153798; x=1747758598; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JlfkzZCZD4/24xU8EMBW/isquwTGR9YaBm+22/uBoN8=;
        b=q5oqYpU9Mqi8Rj1XP0Et77snfixUfR70vr3hZ1RHyWzthOHzNPRChwZsKwqHhlSOwf
         4m5tkKKcCMQGzfF5D4Yu6b98S8KmA70h3wWNUo31J7BDnvszOgLR7Zg5Jy87F+fgJZMd
         mveIORHspdNmxLVYJaDlnxd/UVy4E9N9G4Cm+/CKDnJab7VHWnNuDKcyBqQuQyu+Cs47
         ld5y23cl0Lu/T742zUWT8MSq3RioENOSobm/56s/fJ0xJyHqILxT++2YO19y8YftvDeP
         CHpEDuA+zmph2IN+xPUewAtBIYstiUZq/Smvk3SUZrLmTtQ14RRmqHwCqV7/wXGTd+o3
         g5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747153798; x=1747758598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JlfkzZCZD4/24xU8EMBW/isquwTGR9YaBm+22/uBoN8=;
        b=ef12Wgaq00sgbMc72queEe+Vhqgu46eSLMAOfH+E5YEeaYTzu7PybVemsTrK3731YH
         COyO59WEcuuysMY1KvNe1HzDQKmRTtqt/ln3CPQF1wMJGfJHkIQ6OI5seohyjbn7zAWz
         OTpLuD0dMWo1KCfHMolRqd+NXbUyzxBxG68K5+d86sZBeFtLgKpUQX0cdcOnAMpN1Zay
         hcxcX51fn2X6s1yiMKIX/Yo2OcCsbozQMNcbvdA+ZqJe/vaCvXSY5zDQnQS2biV+lPNV
         2i42sxQmXIOhofIz4c1uq2zi3mMgjVVXjROtGKmFY/J4BBWt8zAcOTMTUTcNQcEuHNU1
         A/Sg==
X-Gm-Message-State: AOJu0YzKNQ8bGief5g+sVwtaYZVGPm3tUiu3VJSbQVwLjLfs/aVPFJmP
	moEeIM9VDB84flJfFWR6Z9rYBnSUVAvv8QRBr/UXZlI/zLXv5IpSG473XT8fxIIjyfykpe0MPS4
	E7ik4xA==
X-Gm-Gg: ASbGncvtLZ4P3UHlaLcnz5yiX9PR48NhAYvkdLJM3MPsHA7Vq7R+L4DWrWg1KKRSTWO
	10g/pdqEZZCwhscC+EnrqF5iIjA3+D220NO3AGGb000lXBWn0Ijcqum5JGIdGzNy02KrLlNvHty
	sZpL/TQcS2Pduo1FswFsLfnBV2zFLWnafci3uKEVRNTgyjpwRbTuvnvd4USkM/G/6seMkK9IVRR
	wNZpuaWSsh+D9WjETErDcVFxdWKQpM4OujuRkEhGIktccYEVgD0GN1pVUQG0WdTODXlDLs/satY
	aDJ4RBWiYoPJ2PtYOffxyiFrTws9viLaXadg+jtOMoJm92u7uMVlSM50O2WXm+Ss2G2ShW578co
	sm4Mi1vstfdn1
X-Google-Smtp-Source: AGHT+IGhwhOx87DJd3VvuC4q3BMeRT9CwktgIlvOxVl5frP5brJchYa+P+lBfmHLSPA7snt+SPbevA==
X-Received: by 2002:a05:6000:1884:b0:3a2:2d6:4205 with SMTP id ffacd0b85a97d-3a202d6427cmr9570944f8f.47.1747153787322;
        Tue, 13 May 2025 09:29:47 -0700 (PDT)
Received: from [10.61.1.70] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ec98dsm16621191f8f.25.2025.05.13.09.29.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 09:29:46 -0700 (PDT)
Message-ID: <a032d182-141a-477e-b966-6477a24b015a@linaro.org>
Date: Tue, 13 May 2025 17:29:45 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 3/9] media: qcom: camss: remove .link_entities
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
 <20250513142353.2572563-4-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250513142353.2572563-4-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/05/2025 15:23, Vladimir Zapolskiy wrote:
> There is no potential for a custom .link_entities callback,
> remove it by replacing with a common camss_link_entities().
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 14 +-------------
>   drivers/media/platform/qcom/camss/camss.h |  1 -
>   2 files changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 8c844ebf9cb6..2977aeaf27e1 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3143,7 +3143,6 @@ static int camss_init_subdevices(struct camss *camss)
>   }
>   
>   /*
> - * camss_link_entities - Register subdev nodes and create links
>    * camss_link_err - print error in case link creation fails
>    * @src_name: name for source of the link
>    * @sink_name: name for sink of the link
> @@ -3642,7 +3641,7 @@ static int camss_probe(struct platform_device *pdev)
>   	if (ret < 0)
>   		goto err_v4l2_device_unregister;
>   
> -	ret = camss->res->link_entities(camss);
> +	ret = camss_link_entities(camss);
>   	if (ret < 0)
>   		goto err_register_subdevs;
>   
> @@ -3726,7 +3725,6 @@ static const struct camss_resources msm8916_resources = {
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_8x16),
>   	.csid_num = ARRAY_SIZE(csid_res_8x16),
>   	.vfe_num = ARRAY_SIZE(vfe_res_8x16),
> -	.link_entities = camss_link_entities
>   };
>   
>   static const struct camss_resources msm8953_resources = {
> @@ -3740,7 +3738,6 @@ static const struct camss_resources msm8953_resources = {
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_8x96),
>   	.csid_num = ARRAY_SIZE(csid_res_8x53),
>   	.vfe_num = ARRAY_SIZE(vfe_res_8x53),
> -	.link_entities = camss_link_entities
>   };
>   
>   static const struct camss_resources msm8996_resources = {
> @@ -3752,7 +3749,6 @@ static const struct camss_resources msm8996_resources = {
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_8x96),
>   	.csid_num = ARRAY_SIZE(csid_res_8x96),
>   	.vfe_num = ARRAY_SIZE(vfe_res_8x96),
> -	.link_entities = camss_link_entities
>   };
>   
>   static const struct camss_resources sdm660_resources = {
> @@ -3764,7 +3760,6 @@ static const struct camss_resources sdm660_resources = {
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_660),
>   	.csid_num = ARRAY_SIZE(csid_res_660),
>   	.vfe_num = ARRAY_SIZE(vfe_res_660),
> -	.link_entities = camss_link_entities
>   };
>   
>   static const struct camss_resources sdm670_resources = {
> @@ -3775,7 +3770,6 @@ static const struct camss_resources sdm670_resources = {
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_670),
>   	.csid_num = ARRAY_SIZE(csid_res_670),
>   	.vfe_num = ARRAY_SIZE(vfe_res_670),
> -	.link_entities = camss_link_entities
>   };
>   
>   static const struct camss_resources sdm845_resources = {
> @@ -3787,7 +3781,6 @@ static const struct camss_resources sdm845_resources = {
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_845),
>   	.csid_num = ARRAY_SIZE(csid_res_845),
>   	.vfe_num = ARRAY_SIZE(vfe_res_845),
> -	.link_entities = camss_link_entities
>   };
>   
>   static const struct camss_resources sm8250_resources = {
> @@ -3801,7 +3794,6 @@ static const struct camss_resources sm8250_resources = {
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_8250),
>   	.csid_num = ARRAY_SIZE(csid_res_8250),
>   	.vfe_num = ARRAY_SIZE(vfe_res_8250),
> -	.link_entities = camss_link_entities
>   };
>   
>   static const struct camss_resources sc8280xp_resources = {
> @@ -3816,7 +3808,6 @@ static const struct camss_resources sc8280xp_resources = {
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_sc8280xp),
>   	.csid_num = ARRAY_SIZE(csid_res_sc8280xp),
>   	.vfe_num = ARRAY_SIZE(vfe_res_sc8280xp),
> -	.link_entities = camss_link_entities
>   };
>   
>   static const struct camss_resources sc7280_resources = {
> @@ -3830,7 +3821,6 @@ static const struct camss_resources sc7280_resources = {
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_7280),
>   	.csid_num = ARRAY_SIZE(csid_res_7280),
>   	.vfe_num = ARRAY_SIZE(vfe_res_7280),
> -	.link_entities = camss_link_entities
>   };
>   
>   static const struct camss_resources sm8550_resources = {
> @@ -3845,7 +3835,6 @@ static const struct camss_resources sm8550_resources = {
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_8550),
>   	.csid_num = ARRAY_SIZE(csid_res_8550),
>   	.vfe_num = ARRAY_SIZE(vfe_res_8550),
> -	.link_entities = camss_link_entities
>   };
>   
>   static const struct camss_resources x1e80100_resources = {
> @@ -3860,7 +3849,6 @@ static const struct camss_resources x1e80100_resources = {
>   	.csiphy_num = ARRAY_SIZE(csiphy_res_x1e80100),
>   	.csid_num = ARRAY_SIZE(csid_res_x1e80100),
>   	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
> -	.link_entities = camss_link_entities
>   };
>   
>   static const struct of_device_id camss_dt_match[] = {
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 63c0afee154a..1d0f83e4a2c9 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -107,7 +107,6 @@ struct camss_resources {
>   	const unsigned int csiphy_num;
>   	const unsigned int csid_num;
>   	const unsigned int vfe_num;
> -	int (*link_entities)(struct camss *camss);
>   };
>   
>   struct camss {

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

