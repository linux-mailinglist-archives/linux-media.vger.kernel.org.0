Return-Path: <linux-media+bounces-48989-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 30541CC7C7C
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 14:16:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2C5E318D409
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 13:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB5234A3C9;
	Wed, 17 Dec 2025 12:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DUzMzH+/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MD6EGg/u"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7CF3451A7
	for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 12:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765976224; cv=none; b=XG795tkTJ5HuCHVP+hVbw+fQJ8C9ETCs3ddhIgh256TWNS5FfMCF+lgAIIhCkyqfQHmADDCeDTK8jh3rNRhM4Ry22PTzB1V1NxSXGIEXGG3IVC+888F6BP5egRs0ctKdHNUzx6CQXklCH3RcRxkQruOLyMvj2uL8hl+VV9xmEBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765976224; c=relaxed/simple;
	bh=ztH074MDFqearVN3nF0jMLfGMXFpi7sRlzEIzX/mkrk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gjrgk0CieyfXafdIsxZAP3TPY/gLxrWnUNaFZMUAQX9YyJteYCR/go0whUyfvXKpxVfTnj/zA8o95jvrpOSGCDoCSI47cL8HmTF71Q1a0DPyCqOR4hU55zSovkiaV6G6+C+qYcB1kxJ40qm+cQaMU37fL8tDFx1pLqT9Wgwk4WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DUzMzH+/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MD6EGg/u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCL5iM3330428
	for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 12:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0xDNUQP8yPoy+Z+qqy+MqMkGS3ISZvZ/gefBftMMrmc=; b=DUzMzH+/R5zDPtea
	dB1BCwyGTIFdhv4XF8viFio1qNLGCLV3Ci/7do8JPzEyUCnEpfzRhp2CiOwK53p+
	U1dqW89xFOVDpUAPSuruXACP7eJDX6qfEgSSQfsn1WRhcXiVhgtEbSEVZLmjoUqe
	5Hk5/oGwb2MUHH8RMEHneh4McYGFD2j6/KyY/wfTknGNcq6e0aACMLf5Pl7t8CRH
	CNdw8cTznA0wBMkDUeMm2i7/P9Um24XUll0SmxequFtZiAwaegOKjEvutDfPEC/q
	Qxtcaq2rPycKUAr/kVlsuFzzj+icZJ5WdCiHlgyGzVwYNtkHIaudLp3acmWRRqfx
	o4mFnA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3nkkhgan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 12:57:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee07f794fcso16960201cf.2
        for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 04:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765976220; x=1766581020; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0xDNUQP8yPoy+Z+qqy+MqMkGS3ISZvZ/gefBftMMrmc=;
        b=MD6EGg/up4hCdlSZ7ZLSHrdCMP9QpPvnW4bgAb/ZmpnAVXVEEBW33MxsCl6CO+GZV+
         avcIc8hSbkv+QhqCUxDsoosxAvYuUtgMgcekyUXTYeXeY7sYX+yP29WhlImNerA7peKv
         xLnzFAYV6cSNYrUzB6g7jo50WUz+w4uA8RBpoU4YqQnl7Q428it/Y9Eg2Z1e2yW4jLdN
         rQnWNrWBmUPYeMg3Y2LZXgwXH/fgIpFciKKfBAMBasUln9dHH0FsS5SQqMrMOVPfLUaX
         7NneH5X7gG7S8oWu7po4uFsMujd+uVwU7Sef+CawdlVadWKWefb+BDhrNoCBbNasBAKm
         x2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765976220; x=1766581020;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0xDNUQP8yPoy+Z+qqy+MqMkGS3ISZvZ/gefBftMMrmc=;
        b=oWeL3pc3bS4eTVYio7sUimj4Qke84esbr2XchWCB7N9Zxm36gjkHrEJKFniGfTolZ5
         wY9n3hho78ihj4geje1YzPyISrTVBdHSlHud1s0MtSgTZqkipfOU7comzARsMK6vFlcN
         qNVxZpY7YLEe/gWCZCFS3NcBBIeiDxb+Uco8z2U/qtfaU51pvYp4J3vNJg9Yb7awuHQq
         zUEDxPSES1nNYl7TtHFGd5gcbHPfWnSLdkfQlEi9FymZVVZKepqtbAWCtFdqZD7HL/hs
         zHXbMOwNnt6aUJQcfWN2DYKDCAVGe8SVst26Y49uVtnwZ5jUWwNizu0iJyR8ncJeE+Vn
         WMpw==
X-Forwarded-Encrypted: i=1; AJvYcCVXiHVNVikvhzuPjNqeABEJpq2MA9mUdpO7o9cBB1AwBXHchQpa+ZQzxI7PntBC6O5ncynE4jY8UZe9sA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKtlIo9Tz0JEsNLN9EO48Q3S1zTj+fmWbifmXZSTtBQQEIX4lM
	84GF3OL81m/ZDGNhDdikTDIg0RHMjpy2Ed0xFJexBpbe+7pwM3NUqA0bPOGvVQeysthe4Zp24gO
	PssfP/PPxmEgCfWMibiX+2AHey3jXa2F2+3F25RAasp1TLcwZg4N7nC5GxJRo8GixGFS9FI1/Pg
	==
X-Gm-Gg: AY/fxX5Y6NNixeIlEU3q2fmtm8hgWRXbgYrg3cAsnr/1NrnFQOzwxyCba1nKKfhboxS
	tZYEfOxBIstpV+NkmcbDvGOgYnDCAl3jIkUJAsisbvbUKNnaHbTmb8X+2DT99K17YzBRIgSe6PH
	nw6z48iKcQOwdvyMxfyBBtm1XImR2MKpUVBjE9Inze9lNm8rOmUqmhuz+Jvl4FJoJs75XP+A2SN
	YF8pavkus5IsCTBmgXNt5jnYYWm4K8zpRI9GDpPWrQdlb/plI05LxMRs4yYaSGzVuGw3I2Qla/W
	3L3dmSmv0gLL0DlzSBsGaZAvtzg1uzABqj9DUu+bIxJGEoDD/jKPISnlBW9oFfXmHR6HeNQytof
	IO3ucNQrv3ckVlwx3f1EbU2QPnySgR/tLxc/zo8HCq6i0EdsXNOp+PUmoe2DPvPV+XA==
X-Received: by 2002:a05:622a:4b:b0:4ee:2638:ea2 with SMTP id d75a77b69052e-4f1d05fc5acmr191874211cf.9.1765976220456;
        Wed, 17 Dec 2025 04:57:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0uXhmc9jYsTPLzPNNmrw1r6UcwzVCFaVA28oMEk+IYkHnnHxKBchHiLlmSJ6qbqmVUKxOBw==
X-Received: by 2002:a05:622a:4b:b0:4ee:2638:ea2 with SMTP id d75a77b69052e-4f1d05fc5acmr191874051cf.9.1765976220078;
        Wed, 17 Dec 2025 04:57:00 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa2e6dc1sm1936263166b.17.2025.12.17.04.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 04:56:59 -0800 (PST)
Message-ID: <a07ce738-b48d-4950-a25a-89a3874c4a84@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 13:56:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: sdm670: add camera mclk pins
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20251211014846.16602-1-mailingradian@gmail.com>
 <20251211014846.16602-5-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251211014846.16602-5-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6wzxzxe-g6e4uNk0k9ABZ9Sv_SQLR-Hb
X-Proofpoint-ORIG-GUID: 6wzxzxe-g6e4uNk0k9ABZ9Sv_SQLR-Hb
X-Authority-Analysis: v=2.4 cv=f/RFxeyM c=1 sm=1 tr=0 ts=6942a89d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=3dje6nBDnuay-3FIa4wA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEwMCBTYWx0ZWRfX5BhVIFF2Em5/
 Yzp4NlfSh0yBFO5vawus4K2oT3wHwlCkp2Eft40e1pjYFkqtWXlARkUYuWjVnpi0HcaPr2TEDnt
 n4JKe1v9ko/PFNXF670KeSJ+CqHIDtvton7ly+1Ku0I8PGf86JFMyx6akwGglrHhdcNpB3/fRKZ
 2FLecWjsDLb4U3cGqiKkUagBHIm3Lr+0CGqXJJ0uQhN1/k2E+FGSLWawgAy/B1byQGtW2B6iwOo
 AScNtjEUFa/uU5aFxlipCnIMtn6IzwOE92m1xkFnXbXaH/bvIwYvjxz42AuZyvpIMqCePgnUBDZ
 dMHLQNiIKiKQWxO2WStrtnAu2lCC0MbHANzfFrmuBEIZztHAXn2T5Pu0PD4240kVP6G+X3oi6Up
 N2HwBpYO6mIxqG+yVqzptB9ieR0e5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170100

On 12/11/25 2:48 AM, Richard Acayan wrote:
> The camera subsystem is added for the SoC common devicetree, but the
> mclk pins should also be common across the SoC. Add the mclk pins for
> the cameras.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/5135823c-f2e4-4873-9e3a-9d190cac0113@oss.qualcomm.com
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> index c275089237e4..69e84cd8ed27 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> @@ -1190,6 +1190,27 @@ tlmm: pinctrl@3400000 {
>  			gpio-ranges = <&tlmm 0 0 151>;
>  			wakeup-parent = <&pdc>;
>  
> +			cam_mclk0_default: cam-mclk0-default-state {
> +				pins = "gpio13";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk1_default: cam-mclk1-default-state {
> +				pins = "gpio14";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk2_default: cam-mclk2-default-state {
> +				pins = "gpio15";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};

There's also mclk3 on gpio16

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

