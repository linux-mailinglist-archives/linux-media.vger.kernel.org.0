Return-Path: <linux-media+bounces-43774-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31169BBD6C2
	for <lists+linux-media@lfdr.de>; Mon, 06 Oct 2025 11:20:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A40E3A4996
	for <lists+linux-media@lfdr.de>; Mon,  6 Oct 2025 09:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C7E266565;
	Mon,  6 Oct 2025 09:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q2BSDM3D"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2355A3FC7
	for <linux-media@vger.kernel.org>; Mon,  6 Oct 2025 09:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759742422; cv=none; b=cEN3QUyZHxSTw1FTh7/sFiRD2vBUA2HpMdd9JThgp/MfJOSaJr/jVek51IietZOn9gnFykG+Ejmcpw3KheALtNWojFKiIVGW/s6Ss3/KtRKV1q63tqicwg75PrNWbFIBN1gHNemanOxd9OFvEuZkKEc924IOXbSiXgjlGSIcx3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759742422; c=relaxed/simple;
	bh=+z5RsXcmsnLuH9oNH0dtACv/z+mVo02WavJT6h3Tmb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mjCXFM2c/JrpKqdsdWDjF46ovcuF1kfaYloRQSWdGjicJUlXsM2Hkj15YBM3gkO6zdNvkUUUL/7dKzSBERTSjz9npx1fMT+Y/wYTfYJkIX+rOuv0CqfidFYXTkSvE0fvivtInbhkfBl4Z6tXLtFMmlQTtOsCePUpeUlmaT6t0pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q2BSDM3D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5960G528006260
	for <linux-media@vger.kernel.org>; Mon, 6 Oct 2025 09:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ch18kniChG2tsKGJYqAIJlfKxhd34mEMTSP7HHJxa+w=; b=Q2BSDM3DsTGF7/0K
	uXAY2/t3FEUaRZmjpySbCnpdoClHNsxo9phEPQ6gBWa19C/YOIaNEFwYEjybyJDu
	swB6LJ1bI4V6yo8lvbtKGJIeQxWL8WUXUQch5Fk1IepuUapm5G5/imxYXcACdk6E
	mSuFuzzVT76N1blW7kJkZ9EqTbRBMMr4KIj3fRPs68iW6TQDUWeZTw9zufK42vQn
	KSi/LN9l2hMzB9efTMhVu5VzDpbXgh56XGibyj07bqVsYb4TFOc+jxYtwbIdQjlA
	GYu2/pIdCagT89jUuA7GIvkOXnJ3TY0Zw1Kpk0BuFTxzujdrjMIEK8jEAC90+22I
	N27e8Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junu3ffj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 06 Oct 2025 09:20:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d8c35f814eso11130871cf.0
        for <linux-media@vger.kernel.org>; Mon, 06 Oct 2025 02:20:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759742418; x=1760347218;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ch18kniChG2tsKGJYqAIJlfKxhd34mEMTSP7HHJxa+w=;
        b=PDFKYd07EySTJLcMY8fkb6k0OyKjBXFCjAEShOfCicrzeCDmc7etUuX63u55HJql4M
         BGb9Cs4PRkMX5cKrwnSlKwzDXTtn8LzDZIaPCsUHGBDGfgz5gyjv3cSnvR5kLuD3pTEc
         nPS7UexB3Q4lF69YZ+a2LHcCfTwKsFsaaIldtoBr8L3qo4giCrdCCC96HpE2QHjglCTO
         F3HREJi9XtwzRvq68dRx6NIlHGrIdvy42GH+YZuz53GEvZ3Bb7PFIFkmjQEYBdkRLZnc
         gSihJeEJF8Spm/iQ0kj1JRmI6jpXJUnlv8vKylvAhym+T4sf9Je3mUgfW+gAQWt5YdqG
         lqjQ==
X-Gm-Message-State: AOJu0YypaGOqMrcylmvO5OcLrL2Tys116yYmqmjsXkQC5WjX9l7FgN14
	6heQiNKEnkkZZNKEUbVNyLZ27cJK4JC5AXBX53mL3EiiXiCiAiFPShYleFKoqEmeufaOKaYjtgK
	9jx0DZNspPp6vFnL4LZgv0q7lNSIUZ+YBE+hrN5lBLb6LzIczS1PwV2dIaPrfz6S0Dw==
X-Gm-Gg: ASbGnctSlyVNyc0IfmOiuosoHhY9+E4eXS49rgl/DqBKIqz5/nEQ7BUnk8v3fXmxnwv
	U7yMI2STB5z1FM/y6lOmFzKwSzeYviiarhr8wlHKfCaZhxTQn0uYiB1puTOSSMXaMEf8fuqSKm+
	/6TAdOLXLP5QXKykTDy6M2AauvAvlxG79Q9rej1NmPYl1dH0qWWbyelx2Y8SDP48BNb4z2hnyPr
	J5soOK/fBwZQI8YctvBip6L7vDYcne+8mNfJyvc2pGc5UZzEAT/BTXMGkJaZd/4t84upSX0ZCUB
	2afskzilxsJ3Rt/SPF30A3323xB6BbTmRzQWV4z3InGehrVkb21NG5Sj+xfJ5+o1ofQF/27q89w
	sEpDw7BmolDfTc8sxDkRvYDL1taM=
X-Received: by 2002:ac8:5fce:0:b0:4b5:e606:dc13 with SMTP id d75a77b69052e-4e576ae6a6bmr96762591cf.10.1759742417971;
        Mon, 06 Oct 2025 02:20:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBV9Zd/QB2x5+JdkTxQwqxdzWs0zfhbi9OLES7dJj3xqxLmh3J9kn0Sitv0LuTbN/cbiCltQ==
X-Received: by 2002:ac8:5fce:0:b0:4b5:e606:dc13 with SMTP id d75a77b69052e-4e576ae6a6bmr96762421cf.10.1759742417399;
        Mon, 06 Oct 2025 02:20:17 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869c4fd9esm1102808466b.76.2025.10.06.02.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 02:20:16 -0700 (PDT)
Message-ID: <dfc093a1-e13b-4342-9015-5a896bf18d5a@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 11:20:14 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Add UW cam
 actuator
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Daniel Scally <djrscally@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20251002-dw9800-driver-v1-0-c305328e44f0@fairphone.com>
 <20251002-dw9800-driver-v1-4-c305328e44f0@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251002-dw9800-driver-v1-4-c305328e44f0@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XiYaUCa_FMRa2LiaolCU-bwY6gaL_E9n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfX+R7Kxp9/vy0M
 WMTX285PZrm+NwJFfRr0gIMeHdDVFPXJyrEedH9XOVe924C6Nf2uxnTdMKONGV35ia5g8QCzaSi
 eZpGVhySNBBLRAnEcw3B+KFTqpSMu6DCWR6WiRZZyddje5xUMscYFyF61hpm7etSwmHQMTpJybE
 XT1gttlZeYOISgL9bQGNhiN1rBMkQCiTV2T3getL3Ie1qQCBph+MNqg1Q5Fmj+25E3zvsX0dfxi
 3hEiLt9ncZUNsBnJU2kavegFB5lMAPBv0GsuNoI8PqIvnpvRf7Wy0t20jxWz+W1PiL00RZ/Cfr6
 YGH2ZvGcsdeCvIr/yUxd5LAtUnWlZHUZdjO7sju5HTRrqhdN5014gpaFt/SXCylyLTI+vRMydHJ
 /W1gC63L5Rl1qXC58FsmBq5AEnd7WA==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e389d2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=6H0WHjuAAAAA:8 a=gTkJHdstRq_Xg2VDakwA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: XiYaUCa_FMRa2LiaolCU-bwY6gaL_E9n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023

On 10/2/25 12:15 PM, Griffin Kroah-Hartman wrote:
> Add a node for the Dongwoon DW9800K actuator, used for focus of the
> ultra-wide camera sensor.
> 
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index 2dd2c452592aa6b0ac826f19eb9cb1a8b90cee47..0e86cd5ff527925c7dba15c4e0ee5fc409fe4ce6 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -627,6 +627,15 @@ eeprom@50 {
>  };
>  
>  &cci0_i2c1 {
> +	camera_imx858_dw9800k: actuator@e {
> +		compatible = "dongwoon,dw9800k";
> +		reg = <0x0e>;
> +		vdd-supply = <&vreg_afvdd_2p8>;
> +
> +		dongwoon,sac-mode = <1>;

This property exists, but isn't documented (you need to extend the bindings)

> +		dongwoon,vcm-prescale = <16>;

This property is neither documented, nor consumed by the driver (it may
or may not matter to you, check against what your presumably-BSP driver
does with it)

Konrad

