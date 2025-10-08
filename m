Return-Path: <linux-media+bounces-43951-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0461BC440A
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 12:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4C831885CA2
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 10:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54262F532D;
	Wed,  8 Oct 2025 10:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d382UR+x"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56F42E2DEF
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 10:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759918130; cv=none; b=nok4FbDhxuKiDDaJMhhPbkN7AW22OPxXL/qAAU1CoQkhj408RYdMs8fIVUs3GJ5rWbHLWa8Ppue9VVx8ZivofZR7WJ9T6AMPXibmwO1q3QNjSp3L7SROQdpHjTMkodmVzShm0FVhTKplxieyhJeELbiRwXBu0lEItLzayT4JD5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759918130; c=relaxed/simple;
	bh=zuOs8T7fLtRsx2rbN/SbWVW9SGMe07Bf6XP12sXbvSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QWSmt3k62gAfomdQ2X98Koe56Ave8HVojLDD2Dj3KaI27GDHkQ0A1REoT75CeJwTbQGSjz0KLhxJI7AGaiSqMGLalrrJfJKa4H7nz5UQ+t/kei3u1+f3BEgovrNBEQbgnCF957UFMA+hk01f+dfSpwYaUUC96PMbsvtJWEg4s9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d382UR+x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890MJg021114
	for <linux-media@vger.kernel.org>; Wed, 8 Oct 2025 10:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yb77uwPvrX0HmHHrh/7RbLO2O8/7B/9lfzBzQHCPdJU=; b=d382UR+x20GSYTni
	aSJ6aH0t1OBNTWqYDFFN6sDYgskDXgHkYZxXQ9x6kXEQ5NdPufUz8o/g0ds4OsMl
	Iq6J6p3a6GAPyTOg+KyD07hpDhceuBJCQzcUFzd+x+DorywEJIILxgvR78lRj7Ee
	s1DGW9/f3tbOAnkAEdR7vniuhedczox2vlqHwfzMIUhFMcsIsfHatNACIUq/n/2Y
	2CVAPe9V66CcazTXes0Sgd9Sat5jhQRdtbGCJEFm6ZhmxvwQMdY99IIwlliawMbV
	16MBsfYpsd0J9efxOZX2sJZLN3Ac02Sn7a6PQg8Xap0NX1HHe9ITBlnTct9nCzBZ
	mqgx+w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1t0jx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 10:08:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e0f9bedf1aso22533561cf.0
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 03:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759918127; x=1760522927;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yb77uwPvrX0HmHHrh/7RbLO2O8/7B/9lfzBzQHCPdJU=;
        b=ULd6x3X8Y6h38boy1Nt24yAgXjDj74xtlmjCLUN275RLXKoUxycEwSkmFKePLvfneS
         4vTfArlqN6+zLp0e+34AGp9m4XQZymvY3oxOv0suPz/Vv0Z+XLMi/p5DIKAfkuOb3TAC
         OJN5VL80AOqUuzlcvORUL2JDnFZw55aDMQFZ7cLJQr1+CBZjDqeji0vMvt1IGz48aI78
         hOV4p6ZEHcLK8Rl90GKAqm5HJSLlH/uOxSkcvM1Z3psQnvv1XQ3R6JJPc9xdtnoHK+J9
         M5/NjRW1D520/y8YOAXrCmZQF8GVatvbgo6aAWg+8rrIJhbIX3l1aXvGlHT51sDg0LzQ
         rwtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWi2Q86PwPdZvmyhxcFwp21PhlvSXqOdMC3ZU+72lm8JSl3cqrhztATlhuUzVycvooHMq+QSckbBHJcxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbm3vZVoID0xPcyQKbYUnUxpiTYutwfVvHKxaZgRryHQICF4Fu
	N4ay/kn76scamwnjgNWNdbr4ci+uAIARx+ePV98NTT9N+CqkEmWwjnkSJBN3HWOvrrnwVMib+F+
	YxpiybjIfmZIt4mBas6YKNEV0+QVmMFkIDlsIqu+OuwXhUyTaMrz4t1vuyasAKq6pBg==
X-Gm-Gg: ASbGncuIAdRqQeoYLe/XUSWR8Cn2jMjrve6qekIEd7Z0CO2VBQxqRvZt33w13Iz6att
	KjMZxYTvgHQcVtFtrIBTliXmMlS+8TL734QqYdVjcxqB4oRdomh64nw6dYecC/SYNHACYrvKJZa
	MbiBbsJwzojoXBExKQYFXfuEkJwTc5dpeAKgPa+qMAoQMVBWpJcRVlwKKt6oue4c5TeqMq/K48J
	6mz1zLrJ8Vg2COKTmNkH1MIKUFP8nSC3VEFY/I9XMNj1WZRTy2GGlxAQVjFjAjh1DAwuLLINloi
	rFVbzFCaGc0VZx8j06g9wXSK6T5fTk6vW8hpyQNbkn6DaAY6gGHqJKUY37ryd7duQQsGy2vjKzC
	0fHWVUSRLDqcP4bEkLuXNw98Xmok=
X-Received: by 2002:a05:622a:cc:b0:4b5:eaee:1c04 with SMTP id d75a77b69052e-4e6eac002f8mr24163931cf.0.1759918126539;
        Wed, 08 Oct 2025 03:08:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGq5cTLJ2mJwk3+csFy7Zr1eDTsQM6gCeFtxrIkdUO4dqhY8aZdotYTGDmV81/UlCQ7NMHKtg==
X-Received: by 2002:a05:622a:cc:b0:4b5:eaee:1c04 with SMTP id d75a77b69052e-4e6eac002f8mr24163651cf.0.1759918126006;
        Wed, 08 Oct 2025 03:08:46 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652a9ebbsm1618598366b.7.2025.10.08.03.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 03:08:45 -0700 (PDT)
Message-ID: <5135823c-f2e4-4873-9e3a-9d190cac0113@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 12:08:43 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
To: Richard Acayan <mailingradian@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>
References: <20250905215516.289998-6-mailingradian@gmail.com>
 <20250905215516.289998-10-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250905215516.289998-10-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EjD3hvwdjejxnn3We6j6uQ0H9mldSgUc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfX2UnScY15JDJj
 i4xZCqvA8ixcVUS9iwLalRGO1p7OPTMwrr/GiGc22299gID5bqWjGw/NPD46bjILRD89Q32ZPGO
 QGEoUykggWjus7oyx1to8WWmaGEnDsHbGMgYCFXa8XPhrsPcEwE686LvORiHKYv2uUGClFGARCe
 xluY5/yObOsi4tT+XhZ6IGIpCsqqN1XL3+0RGFKBS8WWF/ArJl5dslULKnm/BvrQmpo34zTrQH/
 hkYFCywNxz9b0DiIezTaoPQjQXQeGAQPJ+Cn6J6APs4ZN6j1NiRB6CHtA10/8k28JV53wY1bSsa
 BKnGz5RM8i0azLSBfRH5PnRzDLpAXErebyXZCyv4Folt9o0jLxS4CZq17tvtOmIxDmMi0rSbbrA
 XH/M9HiTEwPz7E+1+ahBUqJsWKfsbA==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e63830 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=QX4gbG5DAAAA:8 a=pGLkceISAAAA:8
 a=CiInEcA6Zl_SvUJEBKkA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: EjD3hvwdjejxnn3We6j6uQ0H9mldSgUc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027

On 9/5/25 11:55 PM, Richard Acayan wrote:
> The Sony IMX355 is the front camera on the Pixel 3a, mounted in portrait
> mode. It is connected to CSIPHY1 and CCI I2C1, and uses MCLK2. Add
> support for it.
> 
> Co-developed-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

[...]

> +	cam_front_ldo: cam-front-ldo-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "cam_front_ldo";
> +		regulator-min-microvolt = <1352000>;
> +		regulator-max-microvolt = <1352000>;
> +		regulator-enable-ramp-delay = <135>;
> +
> +		gpios = <&pm660l_gpios 4 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&cam_front_ldo_pin>;
> +		pinctrl-names = "default";
> +	};
> +
> +	cam_vio_ldo: cam-vio-ldo-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "cam_vio_ldo";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-enable-ramp-delay = <233>;
> +
> +		gpios = <&pm660_gpios 13 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;

You say active-high for both regulators here..


> +&cci {
> +	pinctrl-0 = <&cci1_default &cam_mclk_default>;

mclk belongs to the camera device

[...]

> +&pm660_gpios {
> +	cam_vio_pin: cam-vio-state {
> +		pins = "gpio13";
> +		function = "normal";
> +		power-source = <0>;
> +		output-low;
> +	};
> +};
> +
>  &pm660_rradc {
>  	status = "okay";
>  };
> @@ -509,6 +604,13 @@ led-0 {
>  };
>  
>  &pm660l_gpios {
> +	cam_front_ldo_pin: cam-front-state {
> +		pins = "gpio4";
> +		function = "normal";
> +		power-source = <0>;
> +		output-low;
> +	};

..and then you set these pins to output-low

drop the output- properties as they shouldn't really be used anyway
and please settle on which way is "on"


> +
>  	vol_up_pin: vol-up-state {
>  		pins = "gpio7";
>  		function = "normal";
> @@ -548,6 +650,20 @@ &sdhc_1 {
>  &tlmm {
>  	gpio-reserved-ranges = <0 4>, <81 4>;
>  
> +	cam_front_default: cam-front-default-state {
> +		pins = "gpio9";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	cam_mclk_default: cam-default-state {
> +		pins = "gpio15";
> +		function = "cam_mclk";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};

this mclk definition you can push to the SoC DTSI becuase it's as
common as it gets for an internal function..

Konrad

