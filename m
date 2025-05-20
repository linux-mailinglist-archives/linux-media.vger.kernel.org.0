Return-Path: <linux-media+bounces-32940-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F41ECABE007
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 18:09:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B241316A8E4
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 16:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 432B426D4E6;
	Tue, 20 May 2025 16:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ls9reJSI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B8C26B946
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 16:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747757333; cv=none; b=TPyjSenPZPbSeWT3XIszZYFRDBkLXxLLvTG/gfdyZ9dQaH9hn5sQ9PNZXCpAti1EYYvpLlXDR1lWWoeIl4+uNqAEoysmDa+L57bQMWnW6KWYXhsd46jh8WGdQNrr5NbTmq+yBAO+g6qD/JBp90i5WuhZXkUbw7IeuMnAMlqAVNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747757333; c=relaxed/simple;
	bh=wYTaVwvNsbAu2UjkeaZU968DhSOzxXgvk2nExcpMZ7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uHoyfq1UwhMvkKJiHhKZ0eGP23Y4wxN5E4FIPtDMxoCBJbrfWcoABFtfbPgBW8+oUlbIFnFbQYyiJdLNQ9xJPjs9zWF++TnE2cjcavWkinAQvJPlVEE9qGhXkA3RdSto8B2RICO9oomflY23JZAv6PK5v7hURGlE1hbtGk8ydHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ls9reJSI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K80GxO020390
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 16:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZNBYPSDwYBwcL0JlUFsjFsIcMrNE3FHeUbnIgo/55M0=; b=ls9reJSIc0Ps1nQY
	X6+XHEewVfzKWf+aglBFzyw+7OddUtb6MPYGZ9flKuW/4FvbRW02V8u19R6r7oqO
	s+c2ya58YrsNTzHsmpTuap/no0YT/so4QVwUlJjqj8GbPG5WfEgEh7yXwW+ML+MZ
	9koRM1/MAR4741n8D+iw1ltdbwrkwt83XfqfZwVVuVKDx617Akwebml1UmJaWfgj
	DyibvQ/L1ky+e0ckVYoilFG2OvHXWNQnRKnA0No2IwFzri8OuwpjZ5VO/W8CLPBC
	5iPZBMMtC2LHgz0Ng8IDIlrNEBwvvZ6t1v+VSnbDpGFq1mu0TIIiyCveJx32M9pV
	nll/5A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pju7g9qn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 16:08:50 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f0c76e490cso14840036d6.1
        for <linux-media@vger.kernel.org>; Tue, 20 May 2025 09:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747757323; x=1748362123;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNBYPSDwYBwcL0JlUFsjFsIcMrNE3FHeUbnIgo/55M0=;
        b=e3NTqEM6akEXcK3eXjiahF/oBO1x+/EC7zM/VGNqRSmZiakApfHYFQfqS2IUsH1kRe
         0B6Ba7DjfQz90t1GqLIkUMpQO7mfqwzGlTuaeZMpZVajZZeAFErf/9cxMqJUOYazk7to
         904fVulgP/WqdLRJgjgyr4PCHQWna9VhoMhOXqT1s5K6bjPMlEEFemmi9PeFmwueup2m
         ILWBEoRS5MDVS76/ODIBEfpLvHmlNbi77HquT/EdmmnPskR9jBsdw5DnTwBPOEuKrjm5
         bl34oZh+SDW3KgRE4Sk+yclyX/+d+9+O6sN6RGlSFJzwrb5zQzCTlQwy8Zo4uNSRpL3i
         Z5pg==
X-Forwarded-Encrypted: i=1; AJvYcCWj+38I5shB8jqD9DUYpf/MMJT18grkRTAznTEFRiP3H+xr6s3IF4C8EUn4jJxcA3SABuJjD3uAX/mu5A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3ydf+hO9ZeMWvvRML/ZDmgTbU6jmu5DC7nc5DIH7zeFhQtjUP
	+8odgLL0M+AsghwOmAxB/hFToa6A9DzzwZIK05yd4WYDp8k4uD5EELyf7cgGCgCWdQMOBD73vjP
	6v98xnV/ft8HMI5IVCz5Cj3i9/nNe1a58S6bGGTwyrCtXl2JeI7v6Res/64lhDZz1Bw==
X-Gm-Gg: ASbGncvyVoyjbLKeb3VVh4thPAp+cO7F5rxnqIeArUWFfd6G6bhVtSNN/QOXNqIUS/m
	ahJGwy4pJ/j7V3/Frazpj0bX2g+rxiG/4G99PI4AdzbJOMHo+oYZEnmkQie/UJUegXbSpR2Y5CK
	Pa5m3HKSMOXYO/80nsXlqRGIzDwYzsSaa4muiZiD2QwHx5geryp+oKFDehcgQA8awPAKuatqlMQ
	WXgnXWfdDQ13KDkP3c9uCDC+pOVZs0Ybr1nN/sWGCgFzJ9EbCnZK0Eq2WV4ORBcGfInwbnxJN1J
	yy+m507me89+j+4GmHcIIfuK6UxWZ4Dq+O8iYOlveNQd23giSlx8+k8+Xmtu7i0QfQ==
X-Received: by 2002:a05:6214:48d:b0:6f8:af9c:b825 with SMTP id 6a1803df08f44-6f8b0881b2bmr101922296d6.3.1747757323158;
        Tue, 20 May 2025 09:08:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvxo25X0xwc+Sia4cHOSRvAs8I2RKXQTr31HG6wPXMbAy/2Bmn5DJMjpgKZAqen7UvAExheg==
X-Received: by 2002:a05:6214:48d:b0:6f8:af9c:b825 with SMTP id 6a1803df08f44-6f8b0881b2bmr101922106d6.3.1747757322446;
        Tue, 20 May 2025 09:08:42 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d437585sm740241366b.115.2025.05.20.09.08.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 09:08:41 -0700 (PDT)
Message-ID: <898a2204-f129-44d0-9f73-74370524112c@oss.qualcomm.com>
Date: Tue, 20 May 2025 18:08:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sa8775p: Add CCI definitions
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vikram Sharma <quic_vikramsa@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20250514-rb8_camera-v1-0-bf4a39e304e9@quicinc.com>
 <20250514-rb8_camera-v1-3-bf4a39e304e9@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250514-rb8_camera-v1-3-bf4a39e304e9@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XKEwSRhE c=1 sm=1 tr=0 ts=682ca912 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=IC-rWu3oLdSMw__OBeYA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Z5jHd27HvLBpfQPF3DeT8n2O7mYlXTfq
X-Proofpoint-GUID: Z5jHd27HvLBpfQPF3DeT8n2O7mYlXTfq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEzMyBTYWx0ZWRfX4YUZ5PF+Hple
 2iTvvtOAEE67jYkJJ/Jg/8KFrFY+0lVkJ98ly02aD9qRfYWB427rTyxN2Wu/vV4vkwwvE5S0Khb
 tXB9d9GTi4iRmCkKCm3vU7ceXz8p9mPjpGh2jD7eg0TIW1y/jeUCpFrY54zGAnR/4GVxnd4ehEU
 ibI2T84/+iQXGY0WPaDrCUnOWuXcd8h4Crc2104UgXFBG7rNfMjqAuCnbLuHQktKUkeubVa7hSs
 PaSCywsclvsDqk2OZcTSW+0jpCIrKWxdOWJpWcE55EIOF+cqSr6jrRcNBZuMPHW1w5ZInQQ+7Jb
 gdizGlz7BFVtxnmo2Xp8qjM6ZpFESB2g3JwVRzKOKrHUJcuQZC1okvb72Zkdau8DWrIp21BfWDf
 5XMBSUppq015tYetk2X3KcClA1yzkoEyZxlvs2u8lVX35mLw58DxuhuFZ00OZq+l8h+jTcPU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200133

On 5/14/25 4:40 AM, Wenmeng Liu wrote:
> Qualcomm SA8775P SoC contains 4 Camera Control Interface controllers.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 268 ++++++++++++++++++++++++++++++++++
>  1 file changed, 268 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 9a8f60db87b1afdf16cf55eb2e95f83eb45803a5..a867694b15b307344b72041e972bae6e7543a98f 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -3941,6 +3941,162 @@ videocc: clock-controller@abf0000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		cci0: cci@ac13000 {
> +			compatible = "qcom,sa8775p-cci", "qcom,msm8996-cci";
> +			#address-cells = <1>;
> +			#size-cells = <0>;

put these two above status, please

> +
> +			reg = <0x0 0xac13000 0x0 0x1000>;

0x0ac13000 so that it's nicely paddded to 8 hex digits

> +			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_0_CLK>,
> +				 <&camcc CAM_CC_CCI_0_CLK_SRC>;
Only CCI_0 and the SLOW_AHB clocks should be necessary

[...]

> +			cci0_0_default: cci0-0-default-state {
> +					pins = "gpio60", "gpio61";
> +					function = "cci_i2c";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;

Please set your editor's tab width to 8 spaces

Konrad

