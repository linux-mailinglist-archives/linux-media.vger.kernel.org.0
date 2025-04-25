Return-Path: <linux-media+bounces-31085-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA491A9D3B0
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 22:59:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85F994C0E85
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 20:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7424C2248A1;
	Fri, 25 Apr 2025 20:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aWbMlZeE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D6F2236FF
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 20:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745614755; cv=none; b=MBVVv280uS5zZgxEGBX43EqtFBKQUub4oc7ReKrp2IrYb7v9PqK5Dbuav8fL0+ix+7Py8GAYvXiBJp1lK0DQt/O/fnDwhMtCsNL0GLrCmye6VYEKvDLcNTzQG3+vdwDNszAOTZDtvakE7VbnYIaeZk93HgQsRYxc1Hwved8VWjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745614755; c=relaxed/simple;
	bh=U77G/pwPSxuG0YbGLIuyGneBztbU3/zw1RUcuJ9AOg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=maGfNy6kRrDobFZjePf4rcW0GepsetNvbhPoA1w+wLSCRjXUIT97VKG2QwreULj3IWptskjzRk+wgmOfQqIvYYNTeYXWFDfNjta7fTQB041gqdJVdf8jMEC99WK0FBSnDN8J3HnH7GRWPcULYm5phJlTXfUosCPXN4wAvhoUG+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aWbMlZeE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqf2031939
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 20:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5LRFKuyQj8tzl/ipkd3V4uRPUSagaj6nf2RE33l4njU=; b=aWbMlZeEd1EckDQS
	VPzjP/hQDdZRJxEh+p0DZGaTR1Hkao4CYTGWChsY5lnXcxzYS3HOzeHjRu+QprPt
	mDp6Qi9hkqNGXqgA89Z3497QMKG3kCyPmLQaaOhPhojaEBkBWTtF+x9VDOLpURjh
	ixWZm+31W7m9HRkenWmVRgbAkkJvs5LcieSU1Shg2wLNG8zDZsV5FHvU6wPeKxFz
	Upa8xM+v8ebRX2StHuc7ZwBM5yrLhrgzwjs4tV0WBbdXWXolQloCPXAl+pul0vCZ
	5ixhJRBNHX0IVbCcVmS5HUpCZtbc+Ozojj9W3S0P+QQKi272gI5WI+J2qFaseuNE
	3MHakg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgya8py-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 20:59:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8fd4ef023so6481726d6.2
        for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 13:59:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745614751; x=1746219551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5LRFKuyQj8tzl/ipkd3V4uRPUSagaj6nf2RE33l4njU=;
        b=DHM+g3/s+8U4BuGYnSC/0bVWktNuoUmAkO7PF31STWA5vwTlwn+nyMKmy306r0btKP
         34420LD1L8c1dy0fFpE4m3vfleeAuFSpZfGX6NB0v6uSUe7PkNoa0ioE63DHpZktyEod
         HtfpXcUQpzgjoBI+e6w+cYPuAcKi9oke2xMaBU3pVfFaCLy+cv4kHkquZDqNZhRS9Y+V
         lMQXiYerkQOERHYzj0RCG2Q4Sc9NCba0hXbCgKcHLA5j7Oe9MyZaw9OLC20XrMpiN9bb
         MTZ1eMsM8keZQ++CxSoBpJdACz84++O9iwI+NFgEoj6mm0l1VA9jv9PlW+AWmiqmd7Yw
         xEhA==
X-Forwarded-Encrypted: i=1; AJvYcCXSu25YjbAh129xMGbD9nC4eYQLPc2LwxDQnsnDOFsrDiDEdZdI/i+TytpyErNwroKZiKWAlmwjfFO0Xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIRE6PxbGFzn87FcxulY/H4eUOIRiHksjhhBi3KKgFmhI6zAbk
	6QUVNry0QwkrkQUevdq/AZcYP3fPAewAwFk4FS32/9vADSDiW/FdXUSTucUGp3vYjFH7HHuTrFB
	h+0TQNGgdrdm3BIQorpNBKQTdF5uOIgs7+WczkbdBqh0ldlrZTW6GYuqx35/CQA==
X-Gm-Gg: ASbGncvs7NNrrYrO0GOt7rOQliIZ2EgxMQdH8iJ9WdWZoIEqSslrBQJcoTDdURdKfG3
	rbKTaY+aj890GzBe4yEsOQu9dildmgYsSlVgsly+71DJGS0HsIdzYpGcCGY7QwtJYzyCkmmqLs6
	BeF1FmjHcGV85JxAzhEeWVFeuRJ7kKBvI5Z3BIhejLB1sJeWRFZ2Ad9cGut+s9rbUxBMk88qzoe
	zcixNM40/RH4xe90wPUP9KB+r+v5Xq1I5hmiapkWeHk6xott9SR0Yxa7C5FU32CnbwoA9+tjdRG
	MyjmiXanJ5V67Bifd2lK++g7s/dgW7Ml19N7+33LCEgXbGTffnmaIQjYyebBAE2rguU=
X-Received: by 2002:a05:620a:bcc:b0:7c0:bb63:5375 with SMTP id af79cd13be357-7c9606e2a2fmr207583485a.4.1745614751631;
        Fri, 25 Apr 2025 13:59:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxSw5TJpnLmV47NsHo1BnQTpTa/Sw5u0NUbO0lbNkne0UoYmYWA/fJrjJvN1Yw56jJoKlr6A==
X-Received: by 2002:a05:620a:bcc:b0:7c0:bb63:5375 with SMTP id af79cd13be357-7c9606e2a2fmr207581985a.4.1745614751239;
        Fri, 25 Apr 2025 13:59:11 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecfa375sm187614966b.121.2025.04.25.13.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 13:59:10 -0700 (PDT)
Message-ID: <f0443faf-ab55-4962-bab8-ddf31a751459@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 22:59:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/6] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD
 pmic,id=m regulators
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-3fd4124cf35a@linaro.org>
 <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-5-3fd4124cf35a@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-5-3fd4124cf35a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE1MCBTYWx0ZWRfX2B4w3+FuUCMW g+60jSC5OSUb7ii2AtvwVFJYR+MhrtCz4dAnOI2LsJVabQmpzFA/OsDYaIS9Y+PAIKdb49egLni +2+p8uWZl/W852nBeJ73QH7hCar7MBlqoOnGCCFjuj39JYbeqUYXM92uW5vXIT6O/Dq/iMtMqCZ
 usLpBjdoYvstuTEl0J6UyUIz7BUodazx9JMO6WSkYxBkgErxwLQ0oueLhGNZS816mQtOLKBPw6k 1SMYwD7Y/eTc+YW3Gobw8HINBZSfInSZTtsYpTJ1k4VvUWv7Ad0HoB6GeiFB01xJEJ1VqZCRM5C sLSN1O4LXgcTUXvCg40XkhyjA/VZg9j0RkWynswTdX09BuFiMMFrumPurRzeLm9skibdPAXb0iG
 UY9ugQjYCn+odIq2n0Uoh7gg52HHL/6hsDjhNbm57wBvG2SzdPj/pKnXUFss2IpCa7Q/qpgZ
X-Proofpoint-GUID: yrQnqthqTDITUWtL0s6OAUk5tSil_02M
X-Proofpoint-ORIG-GUID: yrQnqthqTDITUWtL0s6OAUk5tSil_02M
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680bf7a0 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=yamDa2HSj1aoHl3nUysA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=901 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250150

On 4/17/25 1:27 PM, Bryan O'Donoghue wrote:
> Add pmic,id = m rpmh to regulator definitions. This regulator set provides
> vreg_l3m_1p8 the regulator for the ov08x40 RGB sensor on the CRD.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> index e2f6e342db7e2f7cfbda17cbe28199546de5449d..74bf2f48d93522d3f5b7ca990c06519ca664d905 100644
> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> @@ -858,6 +858,36 @@ vreg_l3j_0p8: ldo3 {
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  	};
> +
> +	regulators-8 {
> +		compatible = "qcom,pm8010-rpmh-regulators";
> +		qcom,pmic-id = "m";
> +
> +		vdd-l1-l2-supply = <&vreg_s5j_1p2>;
> +		vdd-l3-l4-supply = <&vreg_s4c_1p8>;
> +		vdd-l7-supply = <&vreg_bob1>;
> +
> +		vreg_l3m_1p8: ldo3 {
> +			regulator-name = "vreg_l3m_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1808000>;

Is this and below +8000mV a fluke?

> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vrer_l4m_1p8: ldo4 {
> +			regulator-name = "vrer_l4m_1p8";

typo: vrer-vreg

> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1808000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7m_2p9: ldo7 {
> +			regulator-name = "vreg_l7m_2p9";
> +			regulator-min-microvolt = <2912000>;
> +			regulator-max-microvolt = <2912000>;

PM8010 coupled with SM8450 has:

regulator-min-microvolt = <2912000>;
regulator-max-microvolt = <3304000>;

although the x1e crd schem calls this pin ...2p9 (though the names are
doubtful at times too) - please check if the consumer is happy with 2.9v

