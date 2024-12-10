Return-Path: <linux-media+bounces-23127-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C08A39EBF92
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 00:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F9CF2857F0
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 23:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9197222C36E;
	Tue, 10 Dec 2024 23:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W3KSfrrz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A3622C34F
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 23:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733874399; cv=none; b=s1RICe7t1TgtBcB0JMpNilOx/rq6Gbs9xiOKKuq4v/vS24Tvy3VFqLZAMw0KYUYTVNraeUJrewgJb0BVgwL1t/CJbCX7/4VybyozMuvoG1nA8xEJLIHUaBJxPvf8EHP4Y+ytZw//CmJgbn1ntyb8TjI6nDcw7mwgiuvPoNNwbUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733874399; c=relaxed/simple;
	bh=NHZtn57HZS6Yilyx2+/BrLLakb8ArmT1ewmFrl32VwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j7XMGipCRNLtJYRa4naKwNr+WQLpSW8XCFo1OaEduTFikuhyQH8L3cjSr3RqpBTcfbF/IUERs21i4SE2yBxm3zf0tUJsDsR2/4iehRClz8jRNe8BRiuIKgj3KDMu/AwEZ8Uw36I7NKZcKcJ9ooatcZHO4YJNTF2Nn+JTcB2OYyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W3KSfrrz; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa6a3c42400so24788166b.0
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 15:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733874394; x=1734479194; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NplEXHZ5p1pND38luXCwrGYCymQMCNR0UaeJKC4t07Q=;
        b=W3KSfrrzuBiXFSn6jCiapQpXcSaMeYtlcSkxTvBRRh/7bCdv6zgK8e7q2509E6uuCV
         qGbBD365E+yqQDDc6kLhhmEAh4sAJZP1IP9SbWZ7EJVi7mXpjQ2QKOJEKlmAWAAmFn5n
         HtvN8tNWlPvso274vjK30x0jYxGUb5ASHFUdi9pd1CW6d7hGBsh5/h4dn9jDCrB8oLsH
         924HVf8B6B/eKU60ZgEVozjzACIl8rwuWkaM6srFcVPVaY5BBZp+tbI3pnCULkAE+zuR
         GKhFALGATxzXaD+48DgwqmQh3xo/CuYetY5Rz3bfQHl9Anze2t9lg+wS3/+49QohHLaW
         bRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733874394; x=1734479194;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NplEXHZ5p1pND38luXCwrGYCymQMCNR0UaeJKC4t07Q=;
        b=bSpSoobO4kLwXsgLHjkVkgJK4oAkhwGIKOSlGOhQCMuwI3IM5/u4pLv1q8rclGCKkG
         SE7E2YBltoI62LuOx2aB621NgshoGjKHfLKrrC/LGxJQVs8gEgj5vOFsIcT9UJ4yatp6
         OD2p70okWpNi6lBAdrJ3m19OcrPkOBaNYtuNdnmw1PyD6ZAw50Da+X/P6LNWmPKGpOgl
         ve4eluFbg/5+jx3+TwXlfret5XvOBOB0CMfNYwLlyg+vuDbMi3wfpycq6aD/hAS6Wk5L
         kF5EXcqMLqQdbZF4pN4xdpiW7dl0/dphdKQkH3mwH/tOmtZTBSYJy4QnWchgCLWGIORV
         8CTA==
X-Forwarded-Encrypted: i=1; AJvYcCU5IeWpMRm9bz/+0asVlWj7jgoDgx8jCYx4QAUT6dP4LtzZm6SjeXa/DzkJBFDFPa9LmG8Pvw0GIS34lA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz7skxFdo/fYf2f84F8elPqz27Pg3/vtnfp5+H3Ym/NnV78F46
	zHmf2CH/C/qMWb8ql5IQZ9JsFEWMt0y3K3XAe45JHmypDarJZMcjkoPa6+G+hJM=
X-Gm-Gg: ASbGncuW3Rw4/Kgx6ipfrdvkKaVla01crwIm4MRTWWGJrkwGxyyjaYtF4aznIoUUHoa
	Fuo/bEXqvLb8yIlxPw/SmM8YIBGKNdZlaDQy/Vb5c/5DVji2JPdb3eQ8O2qkKy7L4wM8xQF5HZ6
	RSS9WGrOvnQRm3alCzQfafalhH879MQb70w/ik8nq/765xI8GTGy4fIhHM1yOgz5LNSCvM5rjP2
	BTZGUZS46OB+wYibIe+Oy3ums1hgMLhcODBaCGMTf4kAYEzxqDV1S3dd0uFGS7a1KI=
X-Google-Smtp-Source: AGHT+IHVCiSt2Wj5v8UJC5YTQOaABktJaIKXEvGcyjlRlT/nK3Er7PVf+gwNDIiNgKiPwI1bZnszxQ==
X-Received: by 2002:a17:907:9145:b0:aa6:a526:e015 with SMTP id a640c23a62f3a-aa6b174c8e3mr47415766b.32.1733874394509;
        Tue, 10 Dec 2024 15:46:34 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa68dd43cefsm338697966b.50.2024.12.10.15.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 15:46:34 -0800 (PST)
Message-ID: <814941e4-90f8-40f8-a7aa-cd8edda000e2@linaro.org>
Date: Tue, 10 Dec 2024 23:46:33 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] media: qcom: camss: add support for SDM670 camss
To: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20241210233534.614520-7-mailingradian@gmail.com>
 <20241210233534.614520-10-mailingradian@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241210233534.614520-10-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/2024 23:35, Richard Acayan wrote:
> The camera subsystem for the SDM670 the same as on SDM845 except with
> 3 CSIPHY ports instead of 4. Add support for the SDM670 camera
> subsystem.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 191 ++++++++++++++++++++++
>   1 file changed, 191 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 9fb31f4c18ad..389b49606be0 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -738,6 +738,185 @@ static const struct camss_subdev_resources vfe_res_660[] = {
>   	}
>   };
>   
> +static const struct camss_subdev_resources csiphy_res_670[] = {
> +	/* CSIPHY0 */
> +	{
> +		.regulators = {},

> +	/* CSID0 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },

Please move these regulators into the CSIPHY declaration.

https://lore.kernel.org/linux-arm-msm/20241206191900.2545069-4-quic_vikramsa@quicinc.com

> +		.clock = { "cpas_ahb", "soc_ahb", "vfe0",
> +				"vfe0_cphy_rx", "csi0" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 100000000, 320000000, 404000000, 480000000, 600000000 },
> +				{ 384000000 },
> +				{ 19200000, 75000000, 384000000, 538666667 } },
> +		.reg = { "csid0" },
> +		.interrupt = { "csid0" },
> +		.csid = {
> +			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +
> +	/* CSID1 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },
> +		.clock = { "cpas_ahb", "soc_ahb", "vfe1",
> +				"vfe1_cphy_rx", "csi1" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 100000000, 320000000, 404000000, 480000000, 600000000 },
> +				{ 384000000 },
> +				{ 19200000, 75000000, 384000000, 538666667 } },
> +		.reg = { "csid1" },
> +		.interrupt = { "csid1" },
> +		.csid = {
> +			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +
> +	/* CSID2 */
> +	{
> +		.regulators = { "vdda-phy", "vdda-pll" },
> +		.clock = { "cpas_ahb", "soc_ahb", "vfe_lite",
> +				"vfe_lite_cphy_rx", "csi2" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 100000000, 320000000, 404000000, 480000000, 600000000 },
> +				{ 384000000 },
> +				{ 19200000, 75000000, 384000000, 538666667 } },
> +		.reg = { "csid2" },
> +		.interrupt = { "csid2" },
> +		.csid = {
> +			.is_lite = true,
> +			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	}
> +};
> +
> +static const struct camss_subdev_resources vfe_res_670[] = {
> +	/* VFE0 */
> +	{
> +		.regulators = {},
> +		.clock = { "camnoc_axi", "cpas_ahb", "soc_ahb",
> +				"vfe0", "vfe0_axi" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 100000000, 320000000, 404000000, 480000000, 600000000 },
> +				{ 0 } },
> +		.reg = { "vfe0" },
> +		.interrupt = { "vfe0" },
> +		.vfe = {
> +			.line_num = 4,
> +			.has_pd = true,
> +			.pd_name = "ife0",
> +			.hw_ops = &vfe_ops_170,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +
> +	/* VFE1 */
> +	{
> +		.regulators = {},
> +		.clock = { "camnoc_axi", "cpas_ahb", "soc_ahb",
> +				"vfe1", "vfe1_axi" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 100000000, 320000000, 404000000, 480000000, 600000000 },
> +				{ 0 } },
> +		.reg = { "vfe1" },
> +		.interrupt = { "vfe1" },
> +		.vfe = {
> +			.line_num = 4,
> +			.has_pd = true,
> +			.pd_name = "ife1",
> +			.hw_ops = &vfe_ops_170,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +
> +	/* VFE-lite */
> +	{
> +		.regulators = {},
> +		.clock = { "camnoc_axi", "cpas_ahb", "soc_ahb",
> +				"vfe_lite" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 100000000, 320000000, 404000000, 480000000, 600000000 } },
> +		.reg = { "vfe_lite" },
> +		.interrupt = { "vfe_lite" },
> +		.vfe = {
> +			.is_lite = true,
> +			.line_num = 4,
> +			.hw_ops = &vfe_ops_170,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	}
> +};
> +
>   static const struct camss_subdev_resources csiphy_res_845[] = {
>   	/* CSIPHY0 */
>   	{
> @@ -2582,6 +2761,17 @@ static const struct camss_resources sdm660_resources = {
>   	.link_entities = camss_link_entities
>   };
>   
> +static const struct camss_resources sdm670_resources = {
> +	.version = CAMSS_845,
> +	.csiphy_res = csiphy_res_670,
> +	.csid_res = csid_res_670,
> +	.vfe_res = vfe_res_670,
> +	.csiphy_num = ARRAY_SIZE(csiphy_res_670),
> +	.csid_num = ARRAY_SIZE(csid_res_670),
> +	.vfe_num = ARRAY_SIZE(vfe_res_670),
> +	.link_entities = camss_link_entities
> +};
> +
>   static const struct camss_resources sdm845_resources = {
>   	.version = CAMSS_845,
>   	.csiphy_res = csiphy_res_845,
> @@ -2627,6 +2817,7 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
>   	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
>   	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
> +	{ .compatible = "qcom,sdm670-camss", .data = &sdm670_resources },
>   	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
>   	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
>   	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },

Otherwise LGTM.

---
bod


