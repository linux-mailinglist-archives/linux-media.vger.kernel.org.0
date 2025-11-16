Return-Path: <linux-media+bounces-47176-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6F9C61636
	for <lists+linux-media@lfdr.de>; Sun, 16 Nov 2025 14:51:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5B88D363FF7
	for <lists+linux-media@lfdr.de>; Sun, 16 Nov 2025 13:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBFD830C636;
	Sun, 16 Nov 2025 13:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oSfMkfip"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C55030C370
	for <linux-media@vger.kernel.org>; Sun, 16 Nov 2025 13:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763301036; cv=none; b=Q55z9ervwLAWo/9xBinqmEFr+HPGjmydSPPQRYenvBqHqAC9z8oJIYciUqPy/ut3Mv8gafL/vDYN8moOEZ99F9+S71od7e5/nXEAO7MyK6M+lHxuYZZt8UoXeSHWq1NlIXtNQguH2mJUVlnHTBt4YD86cjFQ5vkS7uhUcyDky0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763301036; c=relaxed/simple;
	bh=xBUF0BKkwZYKTEHzNdupGdJM5fWZSOcJ3Y3kn2tjKwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cn2YFHUvrC5L8bFRO3AIEZzsO/bY3ymLHs0KHrTpxPQd/1B04S8nsRlgRtJgwX0V5qN84lHLYUMSgTLrka2UDLzAhf2XZt8d5xpUV/voQJ2SQHC+2KX3wZfnTdTyCa4tf0ulzLyjPGPaC3QM7qypVo5DRo4BuXLEQYJwrTtZkDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oSfMkfip; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso22722705e9.2
        for <linux-media@vger.kernel.org>; Sun, 16 Nov 2025 05:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763301023; x=1763905823; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KsFsVjl8oE/lkkam5eLsiD3gLh4CJDHdyycJdfwM3co=;
        b=oSfMkfipw87dD/Lxt/KuuR+5Qg5KkKlCyCy+cQvbw1hnzQ7w0JzB6pUni2ZX3QJX9K
         pRrn2HEddNUzxaJ89hLcyNM5nNHWHfzOOtGRq3EBTD6yXpMnrH1feWDXBIFDLRs0ddN1
         s13YpA74AjqkUDMVNlLjOMd7KNsMPRjGRiGb4y2Dk4FftY0vXoU2nxjMzieDIyH1wsTm
         oQhGIyP51+9WLvYE7ylJj1luLhOgrkYYkJntd7spVZRmZCgR/MMywn3fNfO/VabD1ApB
         SZXgIORNtXc2Sis08NvrH33LDwXOcP7Tnc/zcmbtvCaZ8JOAdLdCmy3xnT6DAe353GQt
         Mbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763301023; x=1763905823;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KsFsVjl8oE/lkkam5eLsiD3gLh4CJDHdyycJdfwM3co=;
        b=osNExAXJDrucJhHuAQ+03icycUoZd6fRjYD+umD/+jWomEtHNP1PDi8sfUObdpYBxl
         geZvt4V6VZDhAnEhmjdMpkCM8eTcY2zMkuQ7kH2+y0Qh8PI34txDnu9D9Ll28oA4UF1c
         x3WDufc9/JSCHDYum6r1nSQYbz+FFJhAZFIbUpA7/uFmT2PwJusq0PfhXKSYWD6Pcnx3
         57mfR3JU0vxQEjlYtEkGahfpLw+5rsPPVGuX+ujOri9UjdspLyZZAOs6zYdlgR3z3FmD
         g/twKIdI72HnfsLXJbu4d3yRQxMV3BkmFAndHbYS3t7KSa2qkq80s34QB/fzeekeGQhb
         Xtow==
X-Forwarded-Encrypted: i=1; AJvYcCUo+Qk2kBYZXpmw6MP+CCrnBUS1o8Ns2pEhOmGHGHOJhFztvPe5RvBWmqS1IL+l6Xh1t/yN2HmjnGfx1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpMRvYURHqBJJ/ArXD5+QbyNWdRpRQdV4i+YF5daHV3f6nF6zu
	2LpwuTqqTfRcwSS214LI75h+TcVqbMTk8i6mZTcIIgN4PYQLxv2CHfcEN7q2pquJAik=
X-Gm-Gg: ASbGncuihv33n91NpZ8Z7M5M2b2+BDpUgZI/0wqjiJ79lpfZe+Fy3YXO8svmIEB1OyN
	Bc3vttqubzmgkbaeNqCY7NmWSzHxUM6R0IhAKoMFM6iiB7iPk0JK9rNwEMM9bD/Cu4/iDy5Dhfv
	Efk7CslbjKj2BMG9hsBVFT3pB/lUc8Uj++OrYvyPEvLxfo7nP0IyqkvzrahpEHDGmlw974dWe5V
	Je/PUPSJBitROzq+xG0zyKp+IjVMKGbaB22ANiQLnD20VWvlAspWgQKL7+sS7D38q4ioqHrztmD
	MbOTEyRIT6+R9CXdHjw70ZMkCTGvd2u2vQDbV1rqkjifAScyxfqTw3q42JIUYzHK2HR45ycSWTi
	R/ewciyhjqQHibJlNzzcljbx6/ypShyP5EUj/PGRSiVK2AmYr71wWks8oKb9VeCcOtkxG7+Wku9
	lydIIiZPJ5JIZExPscDh62ClauKQ+zGHLa+Ha8M6rf/iuqivLItDGh
X-Google-Smtp-Source: AGHT+IGaoiDorkO7nqDxZYo6Led+8eqxFt8ey/tZ1b794CQxwAjAGn9Y0aIzFGj0WfPTFZQUIp1yNA==
X-Received: by 2002:a05:600c:4714:b0:477:8ba7:fe0a with SMTP id 5b1f17b1804b1-4778feaa8ffmr86129135e9.24.1763301022918;
        Sun, 16 Nov 2025 05:50:22 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477969b3c12sm91700015e9.13.2025.11.16.05.50.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 05:50:22 -0800 (PST)
Message-ID: <fd39f653-b7fc-4d1e-a70a-156aef4e4b60@linaro.org>
Date: Sun, 16 Nov 2025 13:50:20 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] media: qcom: camss: Add Kaanapali compatible camss
 driver
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
 <20251113-add-support-for-camss-on-kaanapali-v6-2-1e6038785a8e@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251113-add-support-for-camss-on-kaanapali-v6-2-1e6038785a8e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2025 03:29, Hangxiang Ma wrote:
> Add support for Kaanapali in the camss driver. Add high level resource
> information along with the bus bandwidth votes. Module level detailed
> resource information will be enumerated in the following patches of the
> series.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h |  1 +
>   2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2fbcd0e343aa..658d9c9183d4 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -34,6 +34,20 @@
>   
>   static const struct parent_dev_ops vfe_parent_dev_ops;
>   
> +static const struct resources_icc icc_res_kaanapali[] = {
> +	{
> +		.name = "ahb",
> +		.icc_bw_tbl.avg = 150000,
> +		.icc_bw_tbl.peak = 300000,
> +	},
> +	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
> +	{
> +		.name = "hf_mnoc",
> +		.icc_bw_tbl.avg = 471860,
> +		.icc_bw_tbl.peak = 925857,
> +	},
> +};
> +
>   static const struct camss_subdev_resources csiphy_res_8x16[] = {
>   	/* CSIPHY0 */
>   	{
> @@ -4291,6 +4305,13 @@ static void camss_remove(struct platform_device *pdev)
>   	camss_genpd_cleanup(camss);
>   }
>   
> +static const struct camss_resources kaanapali_resources = {
> +	.version = CAMSS_KAANAPALI,
> +	.pd_name = "top",
> +	.icc_res = icc_res_kaanapali,
> +	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
> +};
> +
>   static const struct camss_resources msm8916_resources = {
>   	.version = CAMSS_8x16,
>   	.csiphy_res = csiphy_res_8x16,
> @@ -4467,6 +4488,7 @@ static const struct camss_resources x1e80100_resources = {
>   };
>   
>   static const struct of_device_id camss_dt_match[] = {
> +	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
>   	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
>   	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
>   	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 901f84efaf7d..876cd2a64cbe 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -90,6 +90,7 @@ enum camss_version {
>   	CAMSS_845,
>   	CAMSS_8550,
>   	CAMSS_8775P,
> +	CAMSS_KAANAPALI,
>   	CAMSS_X1E80100,
>   };
>   
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

