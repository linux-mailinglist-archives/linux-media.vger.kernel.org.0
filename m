Return-Path: <linux-media+bounces-32415-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F0EAB59E4
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 18:30:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DC927B2DD5
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 16:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC85C8CE;
	Tue, 13 May 2025 16:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YL6aC13w"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962FD79D0
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 16:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747153836; cv=none; b=j4lBkN0sXbUpzDNqJExie1H3PW4lbwvwj3nRNVhaGtAoqJTji1bmxe+MPFTqeMuQYZd8fb42TH3akOPtyV6IiXTnP4UZZpYTKymwhX9BtQ3haxH/HVc3zAlsjVu0m9/qWaBaVvrgZL0oTfGm8xHsca+n9sl405KqMtB9dBti2Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747153836; c=relaxed/simple;
	bh=hhHXfZ7E3xeUa0XhjqJqxBq1kcMyIf2WAXH77tpAT+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ndqp4ID3/MYESNnu17iC0bF2QaSf0tHfxY5Wl3cDUWuY5amcQa0SZQyhuHCmdFvsM3v6yDy0jmhmLXu8Qnrpwi92tUqSTf1vbe2xOlPTQpV24W55kWvtEyHDl6mXmfJr2WjM5GGejKWYGqZxuD/oWNARjmWqHDp30zKBYlVPkEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YL6aC13w; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-442d146a1aaso53649825e9.1
        for <linux-media@vger.kernel.org>; Tue, 13 May 2025 09:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747153833; x=1747758633; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y0+mrjw/72/moWppNn3cqIQ/ovLQ2pGZYDbrCnyjrkY=;
        b=YL6aC13w0gYnTD9bHkWo+n4SwwMk2e6f7ve8dkSdukR2sZ6pDucKZfFlM1xVz8z38k
         7Akxfxo5+v8Dnc+8S0a7NusIs7Ui0JUSRTXUP6338R3bx59GEYsyqeRfJExtvTvETykN
         yrU70IIWQvGSigSeTACNnn9GQv0Ip8VZgXGIgKSKRhCfMs15hDwZ+qj02NCC4KdSgilQ
         +nbm3q3R+bkI7syJiDwU2i7dUyGyWtuoj9VmVUebp2QEai1QtQt+qzG+JNJywUCSXoHW
         t9kOg8F3lJ8Wnk5DT0qpSdsHGeVINmFVdMLnZByAk9lBmRajXPmHBb7mrYbwIAC95dth
         Vm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747153833; x=1747758633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0+mrjw/72/moWppNn3cqIQ/ovLQ2pGZYDbrCnyjrkY=;
        b=cJ/zzIvWzx+kh5mmg03BfDiIRKo8EwI30UpYcCC4/INcggsJlNm3uYxu5+OZhpyiWX
         DUKhBBaVgIv/eD0K0wW7iefgXWw9nCAoyq5U77Aovzkh96d7su1Vf9J5J8e5WqJrhK9p
         6kZIEujeH2LtwAQUv7CtovrK4NOVyN04KG7uzotrkBp4lPCgKkCEfFmbpnnS5s47DVkV
         DUAs8kFFQtw/xgARTcLrMe/fuYIGza8LD7PYW4HNJogZjA320EXMKqLDbM2QigzFm8j0
         YI8KZdAFjrwwHn+R0w6B78BRp9SfegGIqoE14t/GXc0vmxv0Uh9wJimO3wxLwrnp1usy
         t2Gg==
X-Gm-Message-State: AOJu0YwjvQVQoY0xy99RNJX1esdoV75aKzgXy06M05oWvbnwaqupKuJ6
	haTMNaDxArMTj61QoIwX74z0WE4H4m81fwyqowQC61D+EWj97F0pOc5yEqqDaAc=
X-Gm-Gg: ASbGncs+Scd6eff3k2/IFMEXvIMwuK8JamkVIM0Xkx88aS9XJHcu8Vtu4Iyz5M7O3nG
	HGjiLSZOFJPO9dowYheui7s5P6VuLlj85vtp7bwhV2qd6NlI17WOQ7tSnEz5F3gmckgDUfTFjGJ
	M/FGBPCA6FGGl4FzloMhQVh5yYOZh2gnUbHdHf6IlC4J+wfSgF8auQF2maJwb+/tB8l8pAqlscN
	FwIVlgezX/1P8Mk7iftNrH44w2AWKSJa0AQ0OZfwSmzjxhfwinsPbRMtdClPr+707rJHgoSbaBe
	5WV6AdAkt646UaDBOtzx+zjUAW7Jbwt47RWnWp0XDips9TQHNyW+qCH9M+9rf4RWi2lSEROmRSi
	oYVddsgC+6DLpQdxKjjSTL3k=
X-Google-Smtp-Source: AGHT+IFiMx0PHpryfZjti8dFMYzI7ozYl98emISBX02Ot6Xi/FmpdomquUyyKQTrPKwdudeN4Ve79A==
X-Received: by 2002:a05:600c:628c:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-442d6d6ad9dmr155985705e9.18.1747153832930;
        Tue, 13 May 2025 09:30:32 -0700 (PDT)
Received: from [10.61.1.70] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebd46aa4sm21624935e9.1.2025.05.13.09.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 09:30:32 -0700 (PDT)
Message-ID: <583aede4-5e7c-429d-823d-5b7395090d64@linaro.org>
Date: Tue, 13 May 2025 17:30:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 2/9] media: qcom: camss: remove duplicated
 csiphy_formats_sc7280 data
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
 <20250513142353.2572563-3-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250513142353.2572563-3-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/05/2025 15:23, Vladimir Zapolskiy wrote:
> It's sufficient to have just one previously set csiphy_formats_sdm845 data.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss-csiphy.c |  5 -----
>   drivers/media/platform/qcom/camss/camss-csiphy.h |  1 -
>   drivers/media/platform/qcom/camss/camss.c        | 10 +++++-----
>   3 files changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index c622efcc92ff..2de97f58f9ae 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -103,11 +103,6 @@ const struct csiphy_formats csiphy_formats_8x96 = {
>   	.formats = formats_8x96
>   };
>   
> -const struct csiphy_formats csiphy_formats_sc7280 = {
> -	.nformats = ARRAY_SIZE(formats_sdm845),
> -	.formats = formats_sdm845
> -};
> -
>   const struct csiphy_formats csiphy_formats_sdm845 = {
>   	.nformats = ARRAY_SIZE(formats_sdm845),
>   	.formats = formats_sdm845
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
> index ab91273303b9..895f80003c44 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -126,7 +126,6 @@ void msm_csiphy_unregister_entity(struct csiphy_device *csiphy);
>   
>   extern const struct csiphy_formats csiphy_formats_8x16;
>   extern const struct csiphy_formats csiphy_formats_8x96;
> -extern const struct csiphy_formats csiphy_formats_sc7280;
>   extern const struct csiphy_formats csiphy_formats_sdm845;
>   
>   extern const struct csiphy_hw_ops csiphy_ops_2ph_1_0;
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index f76773dbd296..8c844ebf9cb6 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1481,7 +1481,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>   		.csiphy = {
>   			.id = 0,
>   			.hw_ops = &csiphy_ops_3ph_1_0,
> -			.formats = &csiphy_formats_sc7280
> +			.formats = &csiphy_formats_sdm845,
>   		}
>   	},
>   	/* CSIPHY1 */
> @@ -1496,7 +1496,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>   		.csiphy = {
>   			.id = 1,
>   			.hw_ops = &csiphy_ops_3ph_1_0,
> -			.formats = &csiphy_formats_sc7280
> +			.formats = &csiphy_formats_sdm845,
>   		}
>   	},
>   	/* CSIPHY2 */
> @@ -1511,7 +1511,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>   		.csiphy = {
>   			.id = 2,
>   			.hw_ops = &csiphy_ops_3ph_1_0,
> -			.formats = &csiphy_formats_sc7280
> +			.formats = &csiphy_formats_sdm845,
>   		}
>   	},
>   	/* CSIPHY3 */
> @@ -1526,7 +1526,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>   		.csiphy = {
>   			.id = 3,
>   			.hw_ops = &csiphy_ops_3ph_1_0,
> -			.formats = &csiphy_formats_sc7280
> +			.formats = &csiphy_formats_sdm845,
>   		}
>   	},
>   	/* CSIPHY4 */
> @@ -1541,7 +1541,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>   		.csiphy = {
>   			.id = 4,
>   			.hw_ops = &csiphy_ops_3ph_1_0,
> -			.formats = &csiphy_formats_sc7280
> +			.formats = &csiphy_formats_sdm845,
>   		}
>   	},
>   };

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

