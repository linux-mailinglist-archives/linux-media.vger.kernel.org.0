Return-Path: <linux-media+bounces-32941-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8190ABE076
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 18:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDA8D1B66001
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 16:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9126250C18;
	Tue, 20 May 2025 16:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nFmbxmKu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8979A2698AF
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 16:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747757848; cv=none; b=Ds430cUiNrxsbrcHScTnaqaQlwU2kWWQIXqDasQIGHndp33X0xoQ9dnlNSTu7iDG149UuH/mfGcc+1Rm1HdTcMtfbKjPJbcGXnDBouJ0Pzqi6B7Iyy1opxk4g9j1JPC76XYmNzWEV8OwSid14wlj6UWvQf9gSyVtMZUE87Zb4xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747757848; c=relaxed/simple;
	bh=eo2ll8aZP6fB5Qmh625oasg94Q1ESOBYvDMW/Yk3xZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q63zk+B32aRZwPh+7DQswIlcH8n+Bm/q/3vaPSdv2uCpBQw4/yD7DQAFvK1zKc8kVLNKCTxdJ2vsrwmbRtvB4aqyLCxmmoQ0ioTeOTi4Ru1iYOttUSIXZCLpQSpniTLHfcz3VX7jkN4/P3yXl5pKtRo7on8NuVzgTQs0p3hf08Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nFmbxmKu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KDrWG8032102
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 16:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b5DHEtpnOzGMRu3IyuKVwLv2uJQf2egjT6GFT5/7JmE=; b=nFmbxmKuKf0MajPi
	nbZFKIDahCZZWjKC4o4z+C+7Uwtmbo5b8w03GI+Qci8WtxU3iiW1jVPgVT59J7h6
	FWmXZ2yXvrk9ZUn/1klNHUtOQLeT107IQiAunmnZfX/0078ASXFr+kGPLt5kgsUG
	LrEMTczuuMupPVwEQlxkZopsAdRlPDAFlzqmih3Smh05TVZ9PUBXMRb1lPKQ+/FT
	wShnPkPJr/vpG5NAmSgoM8P3wU2wsJyuDAHrnXLlESkJ2sX10ejLo86/0D/yYbNz
	Hr3FSNyz2zqlBiG6Zs8fW8rkoQUpvO89MujXGK37ye+4a1TRwHESZF42HIUQWhEj
	23DJ1Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r1atmmer-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 16:17:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8b297c78aso11790236d6.0
        for <linux-media@vger.kernel.org>; Tue, 20 May 2025 09:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747757844; x=1748362644;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b5DHEtpnOzGMRu3IyuKVwLv2uJQf2egjT6GFT5/7JmE=;
        b=HanPC2oI9ifNcc7JRe+9ZCOV4EyHKMZMcqR1mBYZsS/ZgjhWp1qEmT/r/BMxT4boML
         L2zQTCmLN9sBoHuYuKOuKzFgZ492x/PLY83BWCYc6vXem4cDwJc5Bkuc9Jnr8c5fqGiX
         2zu1dZX6PMCcfxdOwoNWthN1hh5cDgFOwzh5flHLR5cjgb4sJvD5Po2RhKXxUA+r/v0+
         j87vccgqQ/hHsv5PNcHyxpEEbMN7x9BFHamtesNcw39R5JdEbURqyvB4A4A2s3cgbP5v
         cd/ALaErtiXkTaHfqNyfb7JxPP/nAh9gM+d7VhiVgdVIcdBrzg0phkp0SVOTRL0X2ye1
         mkSg==
X-Forwarded-Encrypted: i=1; AJvYcCXU7kMXKnrGrqK3VGJxnxbjfBqXp7pl/BcKkDeTkSYQ1BsPKa1PPqCpGIDdAbHYwWgSJuu4O933mNR8yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzadCxdXzzDH1Ot5XgaPcuCsWOSEnWe0uO/t9lfYGEfEfsXE+XN
	ucqIeIqk71kmDDGgGjzskQv42UR2eZYYTj1hkHHKJ67Ax2PKLVgsPy+QncomWqYjSRhGHMeQBP7
	azwc2vUE370RTqq8gczi2ELklcpUQ4DQFOOJO2z5arFtMblfPpyEsEAW+TakxhC0Fxg==
X-Gm-Gg: ASbGncs5yZvICAeQZD9Z0Cs49gGA23P6lPPJVSa7Ydi+wxR4IFMVT8zJYsC8WBzzOd8
	dE/5n1SQZxBodSRHIMq5aA+ELdh1Llxq7zTwiMo0rBGInIU6yyp+kEJW4gjHk+RwQHMoftrZcC2
	TwS2KI3+kC8wKeyJatsiSvbt2ECn3/C3N4qC5Ek0bMcdPtnAtdahj9/7DwE4f8LoxU1Ry3BP1sr
	lk3iNpd6XUzgL60kG7XbZa2PZK2ZB4luNST63NML4ddaJsCoHEHDV79GfMAdMB6BzA2bDlTUFWz
	nCagUdu6y7Oyp/aDJozJMQQIfgUhzvmdCmPtBpOKwxK0uyU7qSmLnUVbcdJmNRqTtA==
X-Received: by 2002:a05:6214:c67:b0:6f8:4719:c2 with SMTP id 6a1803df08f44-6f8b096f394mr86190656d6.11.1747757844468;
        Tue, 20 May 2025 09:17:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5E3avK+19A9Td517SGCLdTYA2yrGFAzKGrj13CJfDGLAXTQvQv4IifqqVvRyOTiit6RWrBw==
X-Received: by 2002:a05:6214:c67:b0:6f8:4719:c2 with SMTP id 6a1803df08f44-6f8b096f394mr86190426d6.11.1747757843833;
        Tue, 20 May 2025 09:17:23 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4f8e40sm739096966b.183.2025.05.20.09.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 09:17:23 -0700 (PDT)
Message-ID: <78314d48-4220-4d1a-a168-74268286fa2e@oss.qualcomm.com>
Date: Tue, 20 May 2025 18:17:21 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: qcs9075-rb8: Enable IMX577 camera
 sensor
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
 <20250514-rb8_camera-v1-4-bf4a39e304e9@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250514-rb8_camera-v1-4-bf4a39e304e9@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OfqYDgTY c=1 sm=1 tr=0 ts=682cab15 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=PwJnW-PDuis0shpFSnMA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: U_UufkqUpz1079hhHX6yvnXOYpiCYHEN
X-Proofpoint-GUID: U_UufkqUpz1079hhHX6yvnXOYpiCYHEN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEzNCBTYWx0ZWRfX7/zWa7DAnUga
 MHUFUDbInHTGJzuksjCG4NUSyF7lt+JguHTtPMzGUSUTLnhIky9sFxJAAuV4Uuh6Rzu22s1IL/d
 O9SP1g72MP1Yb9t7SzJ0+uaM/En9h3eT4cRJugYdZ5SVvqCxVVtMVCPNp4Gph+erUob7daPqonw
 7w2oJssDMRj/dxDwvBsLtJFYnsGa+tJiwWRTfKJwF7y1DRldxxHML+Nqkqmjle1QD7XLpSWWgiv
 EzuIWOYNafZJG04wUatu1CehgkEvYhRIRHdSn0Gt3QncyOwCv/q7zb3gQQFZ8sX9ujnrtCPXluq
 4iU2WwdN7mkbzXDlI+Q7QYByvCBmNzEYzKaXDNb6b2YR9L4PnMTQVIL/rfVEiRmCpybAowLwA5J
 OLq9UQPg28HFgJjbhsnhpLdO1hF+yA+CervM1jHkJOViUsxB4j87izXKMEcMOkRIQ1PNidcV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0 mlxlogscore=845
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200134

On 5/14/25 4:40 AM, Wenmeng Liu wrote:
> The qcs9075-iq-9075-evk board has 4 camera CSI interfaces.
> Enable the third interface with an imx577 sensor for qcs9075-iq-9075-evk.
> 
> An example media-ctl pipeline for the imx577 is:
> 
> media-ctl --reset
> media-ctl -V '"imx577 '0-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -V '"msm_csiphy3":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csiphy3":1->"msm_csid0":0[1]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> 
> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---

[...]

> +&cci0 {
> +	status = "disabled";
> +	pinctrl-0 = <&cci0_0_default>;
> +	pinctrl-1 = <&cci0_0_sleep>;
> +};

Let's keep them enabled

> +
> +&cci1 {
> +	status = "disabled";
> +	pinctrl-0 = <&cci1_0_default>;
> +	pinctrl-1 = <&cci1_0_sleep>;
> +};
> +
> +&cci2 {
> +	status = "disabled";
> +	pinctrl-0 = <&cci2_0_default>;
> +	pinctrl-1 = <&cci2_0_sleep>;
> +};
> +
> +&cci3 {
> +	status = "okay";
> +	pinctrl-0 = <&cci3_0_default>;
> +	pinctrl-1 = <&cci3_0_sleep>;
> +};

the preferred style is:

&cci3 {
	foo = "foo";
	bar = "bar";

	status = "okay";
};

> +
> +&cci3_i2c0 {
> +	camera@1a {
> +		compatible = "sony,imx577";
> +		reg = <0x1a>;
> +
> +		reset-gpios = <&tlmm 135 GPIO_ACTIVE_LOW>;
> +		pinctrl-names = "default", "suspend";
> +		pinctrl-0 = <&cam3_default>;
> +		pinctrl-1 = <&cam3_suspend>;

property-n
property-names

please

> +
> +		clocks = <&camcc CAM_CC_MCLK3_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK3_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		dovdd-supply = <&vreg_s4a>;
> +		avdd-supply = <&vreg_cam3_1p8>;
> +		/* dvdd-supply = <&vdc_5v>; */

Please either add it or remove the comment

[...]

>  
> +			cam0_default: cam0-default {
> +				mclk {
> +					pins = "gpio72";
> +					function = "cam_mclk";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +
> +				rst {
> +					pins = "gpio132";
> +					function = "gpio";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +			};
> +
> +			cam0_suspend: cam0-suspend {
> +				mclk {
> +					pins = "gpio72";
> +					function = "cam_mclk";

Don't you want to park the pin to "gpio" in suspend?

> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +
> +				rst {
> +					pins = "gpio132";
> +					function = "gpio";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +					output-low;
The GPIO framework should take care of output

Konrad

