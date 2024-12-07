Return-Path: <linux-media+bounces-22817-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C289E7FDC
	for <lists+linux-media@lfdr.de>; Sat,  7 Dec 2024 13:25:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A27312820C6
	for <lists+linux-media@lfdr.de>; Sat,  7 Dec 2024 12:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F144F148310;
	Sat,  7 Dec 2024 12:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nJZBlDqZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE72F149DF7
	for <linux-media@vger.kernel.org>; Sat,  7 Dec 2024 12:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733574298; cv=none; b=ikgY7T2pxuZkOlQ0oqhmtTJxLGEobUbQXx+l9G6xkUQHxtJh1n+CC2aH81J/yjcg9XLbDpHy/ZQmYK/n7IbbOmkGOkEkeKwLzbLnKz8nyesU7AOT0gpChOcUss28K/noyJFFx+uyJyfR+M3dlN2AYuGjmBdfKHtfWEpxjwQbv8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733574298; c=relaxed/simple;
	bh=Imkwjvr8OjZv9fFVDAgn9vb0dZxjoY+OVBVdlvMWILM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bH7YDiDy5k9sUh3Yp6ZV9FLkXork70Ng6zv2Au4kHebYJjjf/g28olt9qlIL+ai9E/IvhAUnqYwQP0XzcNppDUQ+YDdzfopV0ZTxlgHVhMGQS5R5gajCVFYlYyjvcLW71+UW8ArSd4mu/EGk3rPK0He1qj3NMHt4Vza1ypVHLVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nJZBlDqZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B7Bv7Ld022016
	for <linux-media@vger.kernel.org>; Sat, 7 Dec 2024 12:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pQ1BefPPZjsefk+Q7pM32V79KkOTPD7KhjkHUZEtT/k=; b=nJZBlDqZ+b9Yua5E
	mXTXJlvIv05Mqj5rN1UIOjD4GjbItQeFae8dq6PhSauWIDEcP3Axb7wFROEpYbNG
	x6wylpHx9NzKmL2DhQIXod/nA3HJ/D9sS1ZDNeAfmQs9C+0tc8DLN26DSJf1lfFw
	2J/kdJppCP4G2hl9y7to0N1gxxg3VvQXAPzsi/apeHsa42MQVNqfGh9bG/ZG0sWB
	SUa4XD5o2nZvdK/JFHpmrnOQSjfK1tyax6e8rT/fj9Iksxk8XkQGGTJhO2dRO0f6
	50q1XvTss7q8qFL6LalhOJ3k3cMOKvwiTgzKinzRgvhMm+yxC8wle2gDFjRatLeL
	nTlpuQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdc68pvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 07 Dec 2024 12:24:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b66a3c352bso22887485a.2
        for <linux-media@vger.kernel.org>; Sat, 07 Dec 2024 04:24:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733574289; x=1734179089;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pQ1BefPPZjsefk+Q7pM32V79KkOTPD7KhjkHUZEtT/k=;
        b=vuy/gWbYZzzRzr1YzWwl2C+RSC7zjzeuIl2BSPVqY2DT9Dp+KsCPLxaVtAmJ0ISKcd
         IW0H5YdegYSJ2z8calK4Oa3+QaATXBNT3yBp6m7hSWfDcSLE4Z5AO2Ic38ADivD8szUS
         EiNqUANVK9xZpAIjmiClne6z42H2RzsKgXP+RpSmIDqvSsmiKCgtsBmrCh99tPHzkwwD
         epMdaT6q46fhqv9CSSX3MoqCq9CxxPKE5d1GG5mOehSmBPptEj3J3+0t6ZKVMYhU26GF
         gIrQrjVf2fV+4e0fSB1QRF2inkV3ykfZZFAAtnf7ovuzAxy3Kdq37VEuABWDeAvoGfo5
         ZY3w==
X-Forwarded-Encrypted: i=1; AJvYcCUeMCxj2kFZ+iwdb7T3cQFbwwKv4FwW8aEWzgCe08ytcF4BxEEhi6qv0NQJIXr7VMtsCWkt6RHIL+mubg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHuvT2bEaJiWDZYabIP98ChvZfQQv8FkQ0BOov9Pz1MYGrRe3S
	ir3TNM2814d/FXDNCCY2Eaj/xcPzHj+E/9rKep6Bz61xDQ2UR0OSDWgbheAV87h7JjDOlpf5EGQ
	G80dJm1r2cexHZYGRgsX4kfwaHyPKU/pmHvtxeTNJdtDlj9uN/YdbHCnyyoJfpg==
X-Gm-Gg: ASbGncvI7nwpmnrV+qNk5gu7PzQCDFU6WWcJHT0NXDYz3dwNlfSJcfl5+bjM2HqE+pS
	b31SFA7m6LiKfWBrLWaVMn+i5YpaYgAn9DFoeIPzXYLAoAZHAAXFzDJcgzbMZoovCQcxGkhudh0
	ag6rdyH8qU2f/H2/8KBnNV8mHHxT7i07sQ7oK37zVwo071QUW6lcKglkA0Hg/ABZT4IdL/cR7kK
	AO2d3/CNPglkszK7OjBm8BCjuOMPQMsEw/+EQCf7UXkrszp9W+DZqh0x9WRMYt0IQEGeQROuj0w
	Jmz+ChJfX46rzFbsJQM6mFgNZ0VAc+A=
X-Received: by 2002:a05:620a:2681:b0:7b1:4579:80fd with SMTP id af79cd13be357-7b6bcaf410dmr314488285a.7.1733574289355;
        Sat, 07 Dec 2024 04:24:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFq8U8Ty2ix6xok3zzJyL1MAVWdr2aIcau1ywhGnswjMwOh+jLaNEvEH5AowyHkAWxYwSII3Q==
X-Received: by 2002:a05:620a:2681:b0:7b1:4579:80fd with SMTP id af79cd13be357-7b6bcaf410dmr314486985a.7.1733574288928;
        Sat, 07 Dec 2024 04:24:48 -0800 (PST)
Received: from [192.168.212.163] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e92a79sm380101066b.43.2024.12.07.04.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Dec 2024 04:24:48 -0800 (PST)
Message-ID: <3c34afac-478d-47a6-97df-cc45415f6411@oss.qualcomm.com>
Date: Sat, 7 Dec 2024 13:24:45 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-clk@vger.kernel.org
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
 <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-6-54075d75f654@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-6-54075d75f654@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DwVa8hvCyA1OTcQ0GgumW3tXFpyLD8XK
X-Proofpoint-GUID: DwVa8hvCyA1OTcQ0GgumW3tXFpyLD8XK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412070103

On 19.11.2024 2:10 PM, Bryan O'Donoghue wrote:
> Add dtsi to describe the xe180100 CAMSS block
> 
> 4 x CSIPHY
> 2 x CSID
> 2 x CSID Lite
> 2 x IFE
> 2 x IFE Lite
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 180 +++++++++++++++++++++++++++++++++
>  1 file changed, 180 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index c19754fdc7e0fa4f674ce19f813db77fe2615cf3..f23352493cb270c0fdc3c42add032286601db1e9 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -4730,6 +4730,186 @@ cci1_i2c1: i2c-bus@1 {
>  			};
>  		};
>  
> +		camss: camss@ac62000 {
> +			compatible = "qcom,x1e80100-camss";
> +
> +			reg = <0 0x0acb7000 0 0x2000>,
> +			      <0 0x0acb9000 0 0x2000>,
> +			      <0 0x0acbb000 0 0x2000>,
> +			      <0 0x0acb6000 0 0x1000>,
> +			      <0 0x0ace4000 0 0x1000>,
> +			      <0 0x0ace6000 0 0x1000>,
> +			      <0 0x0ace8000 0 0x1000>,
> +			      <0 0x0acec000 0 0x4000>,
> +			      <0 0x0acc7000 0 0x2000>,
> +			      <0 0x0accb000 0 0x2000>,
> +			      <0 0x0ac62000 0 0x2a00>,
> +			      <0 0x0ac71000 0 0x2a00>;
> +
> +			reg-names = "csid0",

Please remove the blank lines between x and x-names

> +				    "csid1",
> +				    "csid2",
> +				    "csid_wrapper",

This doesn't seem to match what the commit msg promises

[...]

> +
> +			iommus = <&apps_smmu 0x800 0x60>,
> +				 <&apps_smmu 0x820 0x60>,
> +				 <&apps_smmu 0x840 0x60>,
> +				 <&apps_smmu 0x860 0x60>,
> +				 <&apps_smmu 0x1800 0x60>,
> +				 <&apps_smmu 0x1820 0x60>,
> +				 <&apps_smmu 0x1840 0x60>,
> +				 <&apps_smmu 0x1860 0x60>,
> +				 <&apps_smmu 0x18a0 0x00>,
> +				 <&apps_smmu 0x18e0 0x00>,
> +				 <&apps_smmu 0x1900 0x00>,
> +				 <&apps_smmu 0x1980 0x20>,
> +				 <&apps_smmu 0x19a0 0x20>;

>>> for pair in a:
...     print(hex(pair[0] & ~pair[1]))
... 
0x800
0x800
0x800
0x800
0x1800
0x1800
0x1800
0x1800
0x18a0
0x18e0
0x1900
0x1980
0x1980

Please remove the duplicates

> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_CAMERA_CFG 0>,

QCOM_ICC_TAG_ACTIVE_ONLY

> +					<&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI1 0>,
> +					<&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI1 0>,
> +					<&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI1 0>;

QCOM_ICC_TAG_ALWAYS

Konrad

