Return-Path: <linux-media+bounces-37619-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D46B04010
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:34:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA0B41A63D98
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 13:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C33253954;
	Mon, 14 Jul 2025 13:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ni27Lgie"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73522417EE
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 13:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752499804; cv=none; b=a7c6a/xNqfIpp5wDMPmC8EOEQF4oZHqxKx534C7zkMn8TcR8gvSI8ROv1CLgxzNTxZcIlYPwer404kBjQPpyE0QtZZ3FQIZhPBIUk08ki0oJY0SZlxm7PNfnbzJXY9gpmlpSAVIkNfy5PIF0xJDc7dLxBvmJh73k6yDM+VD1XtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752499804; c=relaxed/simple;
	bh=3uKXuWP37D0CEeXXM1tywrvm2McS8VXMhZeTn28VHoI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tb6BWwe8FVetpJjRE8b2DI2dZeme0ZQn2+pyFnEx/jdVzOdD8+NcO+lewHAME34O927IMzTaD/nsElpz5C87drdRvm0NQd2GJyS8onYPXRGRVbHCx1fsOZabywAnk4NZS+C5UVVL7MWvU6RoenJOsb6rFyv1nVYDboRweUsF8dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ni27Lgie; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56ECYQXR032496
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 13:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EwocCM6XUaxUM6zqzmqtMLsjRln2ZwRH5MrCIvcpmqQ=; b=ni27LgiegFlY/Rqd
	7oocgMbfgVrGrmZLlh1wU+5fWe5lXdhnbpjBjLfspfNAvACzfPxjBDG7UJSHkVZs
	/p8Fb2FeDKLIq/x/54voDnw7RDbpboVEDnftVbB4E4Kb2hiqXd3LMRZDFVHPRf/1
	XZ89NbHnIfBMovimnGzgkobXxU4Pe5FRELVz6JAiTZsNY5QYRnOF+asOWCQu3v1k
	h8MbmNIf23va0W4Zi3h7wMI48cUCLac/m+feu6lHP/SCfPeh/OmN5AM9HhDK2Sft
	bapFm8gRZxa1kqQtkxYkffuQuyQI9G1P2cNHoF5wzhZeK3ysHiVBxOBpSy9dAbPj
	KAOO6A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47vvay1cqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 13:30:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7dbce38d456so84037985a.0
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 06:30:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752499800; x=1753104600;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EwocCM6XUaxUM6zqzmqtMLsjRln2ZwRH5MrCIvcpmqQ=;
        b=MydazPh0eeo+7moXvsycDYgbVqUaqbQtfHAx0oTh2tSX7Z+UXdxtCOpL2kvKA+uwAK
         6NmnERp3yGVIjnBpyU3G6kAT5zI/vrpFjaXRvYfNZoFLk4HxBjX3aw8gyP0KVT30X7cy
         /JirAzINBry/SbUXNZfg8AJLVMYnqRuC5sLC+64bntb8OY26yF25an4+Gw1RRZM91RyY
         +OkG83J81wV5kn1ZPUNzSn5rytNQv1JmOj9HyWNT/GKr4iaw3BFtZLHy2aB1Fe5aMtPo
         yY+U3cBwgNoxNSeAfyGM/m3WD2LINHuuPt5YgHc/UGGr0nGRY1kiQ/a/i2k6H2YruK4b
         Ylmw==
X-Forwarded-Encrypted: i=1; AJvYcCXR+7Hiwb0aQGFWhIx6Lq0DGsvaT6T2F+vu9CiNjYH0vRjZYlGIpKyWlQYd3I83nUwn9EtSBrmzhphPXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7gaHhlR6cellATw1dMJzBo/HwDJQWilZVk3LBwLS5nLTmOO98
	eHdRr5geF/1NLop0JIlNNLt7fl0pjdksa/JcMahPBGMt3doGRyi4g9QjS0WNJuBPkdC0gWKcX8D
	jUJbcoBkKEbGai7lRprmC+zv/lQ+C7syegwFwURuQk4/sKGbmHHsh0H1fD7/RmECc1Q==
X-Gm-Gg: ASbGnctPWh5rfdRlQ+GBduSULvDExVsRaqMetIt0sKBxONSUpOhARd+u9/C6CuiZjc6
	c74TgThn/I3YQYcXPPW36pXizhc/51BIPJhJzFV1jIvcIyC+t9zRyQNAnwzLMqxqclwnUuswma4
	J3A4/224J3FVIJjz+avy83fEnlYB2tP1QIVzZlqXsqC59EhOuLl29ZI2PJkPdw1qi9gissEymp2
	3fE7n0yjtCeNag5zscSsFCKX3JZkFaZUICjwGHIZZYqRMkI4EbN/bQ6JwWN4sjHu2oXEKU2cE0B
	nC0dcWh6WzbvqnR2VC+HBssFOawl94U+wVBCDD291mOyji0slqK70lN9MhMeP8/eRhCtVPsr0un
	0I/3ajnzVTMpHij0SqQbM
X-Received: by 2002:a05:620a:4712:b0:7e3:297d:ec32 with SMTP id af79cd13be357-7e3297df03dmr166527485a.10.1752499800268;
        Mon, 14 Jul 2025 06:30:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4pVl04wh4MC/yMhCnGpjY5MlKKeWfA0cK5VDPj8AHG8h6eRZW2+HItMHeuT0gOF1TXD/tzA==
X-Received: by 2002:a05:620a:4712:b0:7e3:297d:ec32 with SMTP id af79cd13be357-7e3297df03dmr166519985a.10.1752499798442;
        Mon, 14 Jul 2025 06:29:58 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e91c81sm830369866b.37.2025.07.14.06.29.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 06:29:57 -0700 (PDT)
Message-ID: <d35d95a9-2844-4940-bfa0-aaae58de48e1@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 15:29:55 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/15] arm64: dts: qcom: x1e80100-t14s: Add pm8010
 camera PMIC with voltage levels for IR and RGB camera
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
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
 <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-12-0bc5da82f526@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-12-0bc5da82f526@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4hg6jfLwPPUzeFmggiXt7kqqgaAAXI4J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA3OSBTYWx0ZWRfX44Fuwr36q+ru
 hjYnvH0R4o59X1QupzUVtTNpfhRWYImAlLF2dpCSRqnSt5pdtBNW++/3GB/gBR1nNCyuRvgxIt9
 lcSIHNcCNGNdqi9xpDQ6NPOW4dM4qG/pDGVXReA+EbxlRP/vLYEWjPP09lNh3bgn/YiofDTa67q
 mjBFgBQ0hithajwVY9BDJPJVyQRrx0cTxvb+Pfid4kaMaueqmQ2aPX7hTgJJH7cX2G6dZ8D0+D0
 xt+evZCLjFz8VRkvZYqNIF3CT23Y6DR60MJy5sVDyXRCtRUOU29cKhQu+ZHUNw8MNh1EQkiPlGO
 sZ7+5x1P3dKPmXOvRshfRYXVYKG2mfNKxoKV3HysFKC0yj9qkb4NnHRVI7e6Ep7BIOcsMZXtEHK
 GOinHfy8PO+p5U7Pl8MWeLQyNus/GkFeyvSNVevE2Lb3T/Zp0cr0h7a2lHqTHzfgQu32sYx2
X-Authority-Analysis: v=2.4 cv=GNIIEvNK c=1 sm=1 tr=0 ts=68750659 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=tqOywgo3-Srlss81Y0MA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 4hg6jfLwPPUzeFmggiXt7kqqgaAAXI4J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140079

On 7/11/25 2:58 PM, Bryan O'Donoghue wrote:
> Add the PM8010 PMIC providing the following voltage rails:
> 
> vreg_l1m_r @ 1v2 IR sensor
> vreg_l2m_r @ 1v2 RGB sensor
> vreg_l3m_r @ 1v8 IR sensor
> vreg_l4m_r @ 1v8 RGB sensor
> vreg_l5m_r @ 2v8 IR sensor
> vreg_l7m_r @ 2v8 RGB sensor
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 59 ++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> index e19daf0f41f1f081e4b0c04be71e37f6ef492b6d..c9215c1a37cf4e7bad1512f52afdfc18ea616127 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> @@ -580,6 +580,13 @@ vreg_l6b_1p8: ldo6 {
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
> +		vreg_l7b_2p8: ldo7 {
> +			regulator-name = "vreg_l7b_2p8";
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <2800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
>  		vreg_l8b_3p0: ldo8 {
>  			regulator-name = "vreg_l8b_3p0";
>  			regulator-min-microvolt = <3072000>;
> @@ -823,6 +830,58 @@ vreg_l3j_0p8: ldo3 {
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
> +		vreg_l1m_1p2: ldo1 {
> +			regulator-name = "vreg_l1m_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1260000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2m_1p2: ldo2 {
> +			regulator-name = "vreg_l2m_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1260000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3m_1p8: ldo3 {
> +			regulator-name = "vreg_l3m_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1900000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4m_1p8: ldo4 {
> +			regulator-name = "vreg_l4m_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1900000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l5m_2p8: ldo5 {
> +			regulator-name = "vreg_l5m_2p9";
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <3072000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7m_2p8: ldo7 {
> +			regulator-name = "vreg_l7m_2p9";
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <3072000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};

Have you confirmed all these voltages on both T14s and yoga against
schematics or similar?

These vregs are widely configurable, so the reference values may
not be what the hardware expects..

Konrad

