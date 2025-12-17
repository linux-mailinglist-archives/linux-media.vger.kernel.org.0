Return-Path: <linux-media+bounces-48983-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B46CC7781
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 13:02:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D6E43045F3F
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 12:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A87033B6E9;
	Wed, 17 Dec 2025 12:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cfr4N9kU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gXfrvshJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE9233BBD4
	for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 12:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765972886; cv=none; b=n98oxgSZgYRRqswEmJsEvGiM7YnUknlhr8fpbTekvDwlEZSdOOZXStthaT3Nz/xtqe2G8X+RyB1NpqySNvW/Lh9EBQB7ZVdanGP6dB8erENTICPMBrTYPVu87Xr3GAHUzothoSJNxCEgbYTgdxyQJrFeSx+PY9p4b6NBykGRxmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765972886; c=relaxed/simple;
	bh=arELwse4/E+vJh0yULIHRYY9RRdM57IUW0I2mzCyPbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rJLlx8qLDpLXt7O9hginaE5upyrXQlNGQM257dvfe7nw/tyXiu8kQ3kxM9KsXbmxJR/u6GZ6aID0jilvL1tFrGqUnpVWOWA3N3NuBHami4VMFwnsS0pgIXyDElAeuLR9x/rzLbv70PJnD4ME10SzO+i907XFMBGljFv28d3fOzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cfr4N9kU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gXfrvshJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHAtdQk1904167
	for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 12:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ByKvMd85JKuxAMXI7vI0KR1rzjykBx3KAV0QrFPYzlI=; b=cfr4N9kUoXGWLBkf
	hssiJGniAOS/Oi6EPgxjXJSDb+z6ZVcS3OlVP/JngB6PJMXoKUQFBvS+qrM5NHRV
	nxLzVCwjwt2djhKhbWln1vxkjGnyHObSHU4zJzAxGXtwGvJ2JsSywVDU95G3siCZ
	sgJ4rVAjjQkovQtc8DBq9eRwLeHYVaVYZbUoY62VOAxmDq9Ab8udKIBKdTnZ230h
	F4jushBigoWSauLaDmhSc+f2ytvbmaZFX3mDiF50rLsiQFpO2xLzjUKGrFiIwNuR
	MxXj2ZTzEiLvmhHpBjIW/dOEjlyJ9dSmoHfpLjxsnDpQFULSc7MgpdmTFwNWPA0H
	ky8WSg==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3n331f72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 12:01:19 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-63fb6a61e8eso1628193d50.3
        for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 04:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765972879; x=1766577679; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ByKvMd85JKuxAMXI7vI0KR1rzjykBx3KAV0QrFPYzlI=;
        b=gXfrvshJcGpQxXI5qldSsToXqy9RPrlpa4UUPxaI0W2uDi44k2Kiu8EzklHBTsHMJR
         H38Fodd94PkJmsA8w/wu0vA2CwR8omIT0hQWYNNtqUVnR2+x2O6WVer50K3a2wNGz1yh
         LKABHfxfxtaxSqrEL3KAwwwbzS1GOBJgncvFFy+REnxR2uHpJRljlTtFf2Y6to3qwUUa
         sgfNSes+R6GrI5hqQuDZmer+9sVULyrzdmq1OIZgz4kGvvP7j9rzvqnDxa/F+Ous8p8j
         S68V/bSfRDqIU2FP71gFktv5DIJMuGy9M97/ya3UPoRO0tnarKuGybMbmNsz9d3zq/Le
         1vKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765972879; x=1766577679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ByKvMd85JKuxAMXI7vI0KR1rzjykBx3KAV0QrFPYzlI=;
        b=NDaNLJUQfDTUA/kUK3W44xiR/6GmXYol8u0h+53Q5NviWcKjg6l8u/3QkVXIWwsze1
         cynjrXnwWdLJ3t4kcFUMARJab1y+FCTuoDj6NS4v7s7YhhxKx+mXqClMVdlXDw2JYY6N
         nr3hDAZTyGAPZFp1n9UU79t3UhSnEDyhOtkySvyViIzP/BQIxMOHRONbsJJUKAuUUJp0
         9xuOBP8IhTexWYZzZTJPiNuftEoHCQ5E92EkYyR9JWsD/fkw8Xy/vUSBVkb+ZszbWpOA
         cRM0e2RSrPCFARM1PwiG7h7M7DB/uj9mG+ud36kZ1YKxglT2scwtEJkdesro+ZdZ+ZXK
         ESeg==
X-Forwarded-Encrypted: i=1; AJvYcCUaYHl+UREhx4ApcNrWm0QBXsR9FWEeNHHDCfChZoQGst8+cJwCjP684R1LGWL+LM8RM6BZoHFDrtmoeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAbDXEpCZDoxkCnPcLpqFEXYLlqyIV9VnOi1O0J3zZUNDyI+9S
	EaxEcz2p9S2b2wm3VDGhBCdBTROEwJxR1zC4PIJaERX3xGEY2e3PR9zPWGSGkilBfC9azMNvhaD
	3ZMW/C8TXKkSHxn3AnX2iImgMXK54qT3eEJkkuPob1wqrroGTcEWai8MCJ16CFwurhw==
X-Gm-Gg: AY/fxX67X2D1lSkMDpiBDfu4nCoeLeRMa6voItHTvlEebTkolhQbPEkwGXOx9DDvJ2P
	ApfECuspgGpep+wZTrGxSzN8DywN5DVTjRDXGFgEwNISabnLxm7eYFoeKSXp9SI3Y3Chaw7S8/e
	ewer170LX92uNXPx8/n0KV6+b3buoNsRzRB6K0ND8gHqDzr1DnQPm/pzsghtSRIyc/RICYyNsHV
	bKrtYgZlpfW7HrWMJDBz7gIALajhhONYv1VQDgycCxhhcmuphl32TChLAXB03duWg/4O9qcgyBr
	1WrKAl+lh4hIoF0pYGKanlWwTZ6a0UQJDCTMrh0+23NXZCLVlTd719B1bU3LXMNf98Z/4kFHdAH
	GrT+oPBMc9K3fz6RPTKD2B3w2haEEwwNuli6yeezMxf3SnH2xhwGPD/gYBQ4zSrCCfg==
X-Received: by 2002:a05:690c:c4d2:b0:78f:8601:b3d0 with SMTP id 00721157ae682-78f8601bdcfmr41442997b3.6.1765972879094;
        Wed, 17 Dec 2025 04:01:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbvc56X54KPxAsJNlVZkM62pygYiA8KVDpGS6lIwc62j+NJ/6ozCrv1vLxOorBH2EkU5M7wQ==
X-Received: by 2002:a05:690c:c4d2:b0:78f:8601:b3d0 with SMTP id 00721157ae682-78f8601bdcfmr41442747b3.6.1765972878505;
        Wed, 17 Dec 2025 04:01:18 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7ff90481edsm411917466b.34.2025.12.17.04.01.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 04:01:17 -0800 (PST)
Message-ID: <846ef50b-e703-4aeb-88a9-3b86715335ea@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 13:01:15 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
To: David Heidelberg <david@ixit.cz>,
        Richard Acayan
 <mailingradian@gmail.com>,
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
 <20251211014846.16602-6-mailingradian@gmail.com>
 <377c299a-2088-4fb5-befc-c8b1cea05848@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <377c299a-2088-4fb5-befc-c8b1cea05848@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA5MyBTYWx0ZWRfX6AGvYb4XNsMg
 gRQe0byuW9Tc8StLqggnQejX2srXaiMHcnd5aoBEHI2W8WpgaAfbfDXZoJoeK51EfZ/rH1wKbO9
 UAOGJLE60fx/bgRgF1+o5ZeAh91tPTeQIBJRT7Y4IttWwVM8E3fJPbJBcRDvlAeAA8MVtWDBGqn
 LRz5eeUUVgyeu5e2xzjYww8yKbk30DG9x/9it5BIYnDETzIC1J0vXxPPdZDdzYeCedGZN1d7A5z
 w5iiK6Cs4MxpL/vInShIXub+3B8ASFcHnw1QZYDWECiiZVaJuuokSZBuvN02IY6RSRz/Z04eE0n
 n0kthWWTerc6UXoKcQxf8uM47VKTwlXlWmkCUN6T8iFpOW34O2YBDlHwq89FeYXeLSY7rL7YVYy
 74I9VAZApnc3EqtwRbe1RrmBV4wdEg==
X-Proofpoint-GUID: ymisgVsxYoDYcyfNllZBwloSHN1NNucT
X-Proofpoint-ORIG-GUID: ymisgVsxYoDYcyfNllZBwloSHN1NNucT
X-Authority-Analysis: v=2.4 cv=U82fzOru c=1 sm=1 tr=0 ts=69429b8f cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QX4gbG5DAAAA:8 a=pGLkceISAAAA:8
 a=-PvwipDTlZT7saZ3bE4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170093

On 12/12/25 11:41 PM, David Heidelberg wrote:
> On 11/12/2025 02:48, Richard Acayan wrote:
>> The Sony IMX355 is the front camera on the Pixel 3a, mounted in portrait
>> mode. It is connected to CSIPHY1 and CCI I2C1, and uses MCLK2. Add
>> support for it.
>>
>> Co-developed-by: Robert Mader <robert.mader@collabora.com>
>> Signed-off-by: Robert Mader <robert.mader@collabora.com>
>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>> ---
>>   .../boot/dts/qcom/sdm670-google-sargo.dts     | 107 ++++++++++++++++++
>>   1 file changed, 107 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
>> index d01422844fbf..ede0ad7ded23 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
>> +++ b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
>> @@ -172,6 +172,34 @@ vreg_s2b_1p05: vreg-s2b-regulator {
>>           regulator-min-microvolt = <1050000>;
>>           regulator-max-microvolt = <1050000>;
>>       };
>> +
>> +    cam_front_ldo: cam-front-ldo-regulator {
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "cam_front_ldo";
>> +        regulator-min-microvolt = <1352000>;
>> +        regulator-max-microvolt = <1352000>;
>> +        regulator-enable-ramp-delay = <135>;
>> +
>> +        gpios = <&pm660l_gpios 4 GPIO_ACTIVE_HIGH>;
>> +        enable-active-high;
>> +
>> +        pinctrl-0 = <&cam_front_ldo_pin>;
>> +        pinctrl-names = "default";
>> +    };
>> +
>> +    cam_vio_ldo: cam-vio-ldo-regulator {
>> +        compatible = "regulator-fixed";
>> +        regulator-name = "cam_vio_ldo";
>> +        regulator-min-microvolt = <1800000>;
>> +        regulator-max-microvolt = <1800000>;
>> +        regulator-enable-ramp-delay = <233>;
>> +
>> +        gpios = <&pm660_gpios 13 GPIO_ACTIVE_HIGH>;
>> +        enable-active-high;
>> +
>> +        pinctrl-0 = <&cam_vio_pin>;
>> +        pinctrl-names = "default";
>> +    };
>>   };
>>     &apps_rsc {
>> @@ -392,6 +420,64 @@ vreg_bob: bob {
>>       };
>>   };
>>   +&camss {
>> +    vdda-phy-supply = <&vreg_l1a_1p225>;
>> +    vdda-pll-supply = <&vreg_s6a_0p87>;
> The vdda-pll-supply is already named wrongly, as 0p87 != 1.352
> 
> vreg_s6a_0p87: smps6 {
>                        regulator-min-microvolt = <1224000>;
>                        regulator-max-microvolt = <1352000>;
> 
> 
> 
> vdda-phy-supply is on sdm845 (0.75 - 0.8 V) and sdm670 different.
> sdm845: 0.8 V (should be 0.75 - 0.8 V) // OnePlus 6
> sc7280: 0.72 V - 1.05 V // Fairphone 5
> sdm670: 1.2 V
> 
> This may be correct, thou, but still feels like pretty huge diff.
> 
> Maybe someone from QCOM can confirm?

I can't find SDM670 data, but there's both 1.2 V and 0.88 V inputs
to the CSIPHYs on SDM845.

On downstream, i see SDM670 uses L1A @ 1.2 V and enables the REFGEN.
Maybe i can find something more concrete in a couple days.

Konrad


