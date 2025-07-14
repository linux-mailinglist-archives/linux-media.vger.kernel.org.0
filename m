Return-Path: <linux-media+bounces-37618-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9FAB04001
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:32:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8428C4A36A6
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 13:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA4DF253B56;
	Mon, 14 Jul 2025 13:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KraOIjuM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1C7253956
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 13:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752499712; cv=none; b=JcL8Rld6ZkrBwfYWMT2x9gwpY1IR7RudaMEq/gEf22hDxQvUpGe84WCZz+EzSCjR/PkPdb+4cEePzxJMP90/aUQxib+4290SkhdAvUopxkuJ2tNNm+DgHz1VZnzn3TKIeRndULXdk37ocerBEMZy/9FpA4+jZ85t7AhaY1CXFwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752499712; c=relaxed/simple;
	bh=oHEQKwBatWKUIOpL/sm9kI7CU4MvbWDSdi+bybgSb3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N0bzx+Tob9BmjWJvAJFsaVMGQ/SqB5oSZ+l+BQn/BylVY1HYa7B6u0DVMs8HfU0ZtVQMIGv9CUdZ5knfJqEI+vzZfv9LCmOsgHbgSOnK0kdqOZCB+nxGt3fl9ixwYWSDJ9QvjPkg8YMoN3c0IQb7zAx8zxDdXjWqKwwkld5Mrq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KraOIjuM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E9wCGl021735
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 13:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ob9U6sQ6B7CRRePb9koAuef4V+KwLq5wrBJm+EnY7mw=; b=KraOIjuMYxXVQhaX
	kIZthTVA1UDkARf529A33L3Ay1OXUTbakbPknENdM/vzBHHWr5cqBo/IfPw1Sjha
	acRjGHbUtpZ7Y8ks9h8O0OtODmuuAtzk3beBDqBQBMTJbo//x2ylTASYwks2rvmr
	dYsQlszRZsS2qdfZ88J0cMxzxvGQ96fEiDVWGaf8Q8O1qFY/SdtYaVkCMXWkCSqx
	VRP1ZUSShkQxeKLuKjnzA+K+3oeGZch/Y0WVSHbZqqOBnoztqLmFfh1DPt4VzZ4t
	SW6Eh8+f1yQdfjkfzXvQTnWeSeoUPu6WcZ/EJ+SSayPySP17m9jo9dBMkl+l53MY
	oTI3Ng==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47uftmctf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 13:28:23 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fd1dcf1c5bso11845246d6.3
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 06:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752499702; x=1753104502;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ob9U6sQ6B7CRRePb9koAuef4V+KwLq5wrBJm+EnY7mw=;
        b=e5BEqwgO0coQ/GNHEG0QFbLOfelk9lGp466t+PZsfZWcJw8OXR7QZfbevEDQQHhPLs
         /B28XtTUHt7NpphZrz6DQeo7AOh63pXUaJK2R5EEvlpSpbCuDGNjQea+T8cId404A4dD
         Q1NRcLptPV0dWbwgQYAr5ZhGf3EaVFezyGezb4B89VZ/iS00mw3cS3BJLU+3l92viGA0
         0QUtqRL2PzYGPVqDM6yxaymvDqo4HiGH6uUgUn4txTQOQSxQGwzCIFgSelI2yqh51Nlk
         Mik4vn5u8hRDdlpmK5R1mgaRmKhe30KvTakPE9d5yV6jsR1MfWdrcrmtsf/JeUbbx58c
         MQ/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVWJPvx5N2YZwnCNSt9wASBlCcRydQCqhVUUgVy8+mucJlN1a0yTdHzeDnsxXZbJpLG1UrY1j8Qjx9v4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEf5Qk5hEO56jZeQOAkD4cQT9aaiLfoIYdFbUcVsuJVGxBV1aP
	vqVnXR3cfttMsAcQwknFRmNsAIVzptJGXbJnCUke2jNOc98gHY6MA8gQoTTU4X//nlP8rRkvp8X
	wJlb9NV+jEsMnUrv5gjlD4fzq/pJGXiINqalPA0O20YYF2moOcWyLpFEu3GjCUVnovQ==
X-Gm-Gg: ASbGncslba6Ha2PE6MXgNEdjgzDoUGLCKgOftN0HNnGjeqyCSWQQyaAt220TvKU6tOC
	X5j1MvgL/6+7D3l60SD0ILH7e5GS7Buaqrrkd1QQ8yekjSMaLrZ6b/4XZ7Ju/qyMusR6YdGDgK4
	muYKbJdnh6hgtiYTkSMGsCwzraFJd6JWHnnn14uGgXLUi+3Jbwrnk6dkjaLazZpklZO3amxrmhd
	VIBegVfML376d4DTnPB99Oe+aVyBs9+0Poi1ws1dZ1x31OUBe3RQXMVgZUzfVqiKYGDqBJME+WR
	NIq3wM7+8Ke9LtXlVgS4scKi1UdO90IzLTrvGno4b8uto9aNO3kWs3j+wGDxifhoHUkYG60s9qw
	y1sHg2f+6QUL9zvvdv4PL
X-Received: by 2002:a05:620a:394b:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7ddeb8a4a8cmr654568785a.10.1752499702295;
        Mon, 14 Jul 2025 06:28:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8Im8XF0a7klJdUS69ADOk3tOusKi5hYyzJtkL4/kjokc0qUJhiJ6sJr4jnvb6Fh5hB1siVQ==
X-Received: by 2002:a05:620a:394b:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7ddeb8a4a8cmr654567185a.10.1752499701899;
        Mon, 14 Jul 2025 06:28:21 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e91a0bsm819346166b.7.2025.07.14.06.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 06:28:21 -0700 (PDT)
Message-ID: <fc21ee61-188e-42a3-b9f6-4b81a72d388f@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 15:28:18 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/15] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB
 sensor on CSIPHY4
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
 <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-11-0bc5da82f526@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-11-0bc5da82f526@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AI4FyeZ1 c=1 sm=1 tr=0 ts=687505f7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=qEq-IjhxTDjyFSs2OvYA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: _nRN_l99pWPgSfH1SeOqC1w_L3SO1Afs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA3OSBTYWx0ZWRfX5aWNpL96u4l9
 OXrX722ZASFL6VQxW7FdsXMiEDtDy/Jui+XribYdFnIpfYASe/d7y5s1j2Y60rght4hoRWD8DEh
 YxG8fIX8dJ5nTYmayr/y2sOuA9iCKB/i7Ms36SGsVmLa8ULPMFhgmQ25jKhg23HIpIOAULf43k0
 eqZJ2RcauzlrEoNwjm2FhVyhAEuIo/1DPTdvElPPBjiQWImT7pdeyen5Lcq/eKoXDwCrCr//XWB
 6/PQbD7LeuzYSX6SgO3paXpTbOxy8KiTIvgjJSz425kHF1Yqm9Ki+3Vsvl6cHVhEV//yyoYNLT0
 ttLNnlKUvQpoXTWx57sYEbHruTKRbPU/b5o5BF9B8qLXvy8Z2hGaduWM+Ber5pWL2n7mIIqZmBU
 c8WfXJF5ERWe+3nm9HSb53jU76xMny0yuCNKcbIMWLR5omksUSzwhGlFKVAECVbDtmiiqPr5
X-Proofpoint-GUID: _nRN_l99pWPgSfH1SeOqC1w_L3SO1Afs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140079

On 7/11/25 2:58 PM, Bryan O'Donoghue wrote:
> Define ov08x40 on cci1_i2c1. The RGB sensor appears on the AON CCI pins
> connected to CSIPHY4 in four lane mode.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi | 78 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> index 08268f60c305cd69baf937fced6d37f2ea788b62..ace4ab2b9fc0faac8233a40220aafba200ff05d9 100644
> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> @@ -6,6 +6,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/gpio-keys.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  
> @@ -996,6 +997,67 @@ &gpu {
>  	status = "okay";
>  };
>  
> +&camss {
> +	status = "okay";
> +
> +	ports {
> +		/*
> +		 * port0 => csiphy0
> +		 * port1 => csiphy1
> +		 * port2 => csiphy2
> +		 * port3 => csiphy4

As I've mentioned in the past, this seems SoC-specific (and perhaps
the csiphyN naming is confusing, as it refers to a lane within the
phy, rather than the index of the instance of a phy..)

Konrad

