Return-Path: <linux-media+bounces-50850-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 544D0D2ECB3
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 10:33:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 56236303F98A
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 09:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 712353570B3;
	Fri, 16 Jan 2026 09:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fhMJDEgo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V/puADIc"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEFB2D5C9B
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 09:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768555979; cv=none; b=NNCQyyZsVj2QSgz6BwmQZMoizUHjqZ+8wtGrP4brjIC7YTOp/DozQVeeb/5l37u1/2u0aHinyygSm4d0cMAkkjAD3EShWB88NW5spgv2rPmQtrSubjojBl6CQcR/Qk2oNNqFszkRKBj2txMkUZhVMAPK1dsiKNT0SfHrma36fxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768555979; c=relaxed/simple;
	bh=4DK30zwrdkHkSbuIWBaRqIzhR+GfaeYi+4giTk1kn0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wjx1xV3z/E1XO5bupTY3mSGzz/vX5XYJO/hhMrDQbXZAAOpt5x8jW2RwE9XzrgfoE4gWZYo4O/Gqwnh3na3eqxxkWOSx2zbtcEjhHZmw3t+u8HH1cm07QdVETJ506Tpz79HvcvfF5hYTAvrRRMBLRj34o5ZliOLklJZF0K24JhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fhMJDEgo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V/puADIc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G8IZCQ3892789
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 09:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FzV/ocZOiQZRoHc+CgIt6IXIRkQY6672hlSeIuwn+AM=; b=fhMJDEgoNHMyq9oY
	W1rEXEsbFons1+UH1kZ8oyHfbxIXEFV8DzBubq16FLbeytjOV0b4HEbJx/8FHnTz
	6qP7a5TjXaZ4xm2uM0r/vet2FDVznVQ9AuoiBGcg9fz209FYZdZJ4oa3/1MbB8WG
	RjmnoLRCVd31ih0Ya9CABi2vjndlzCQQElmOaCoMoFXjFbDFNh8QvYTm18b6/VnL
	oXstbRDXUrcFKswPQ+p06yVWFkgm8/3yUQEJJsuefT0PKUGjZiFXEB00xxs3N1Z5
	EjXz7i8Mjk5Oe2eKE0j+6IXH9G4muJW1Cp9L14VNmf7dzaU+x+VKJfX25B6+9NOq
	haA5Wg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq9b09m1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 09:32:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a5bc8c43so262274485a.2
        for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 01:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768555976; x=1769160776; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FzV/ocZOiQZRoHc+CgIt6IXIRkQY6672hlSeIuwn+AM=;
        b=V/puADIcRQm86dleOD2Pyg7RgzYFc3Y1ur8qX8ZxO7StH+g6DexzUI0OUA0vRFoAj5
         R48REYYGvhmPzkLNf/lFYtv03ersbxOuXauVWT43pXvtC8cIHJNaVEACJT+xO50Pyqj6
         WKjNmF1nbD0iipjL3V7STnzmd0dh5VPP6yARZKfFkcRSScsCSiHTMulq1YBezRFgokmX
         MT+MGh2DIkmrYfc6rtUigbBblbRAGqgZ6n/KvFSrnypXn+cUYMTDNqFdI5q4FNQaY7Tv
         99KYjbt9RZQ59GVK0iQ7zDiykvOC5O0azwjDjLdZH49W42jVr7I3GqrGhq9r17wXXz0l
         rBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768555976; x=1769160776;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FzV/ocZOiQZRoHc+CgIt6IXIRkQY6672hlSeIuwn+AM=;
        b=KqUEHAVGdC7WPnhKniryBs7F7b7FBvFlxzh5/fv8ru13XagXgHnfCxrlT1svP638Fy
         HUxuJBIp9TqPZksrxJ5y1fsTZ+WbSMCE8sZjcJzjVZrNBlu2v6/ilFIsDg1Qrf6nUSh4
         aguwXhpoaWtf/en5N9Cg8G8rjZKd0rOVhZl3GFS7JI6uVaUd/wNz4cGeQEk4kLS5YvSm
         irHPILCKcJICTO6TlA+7Mt2/gJxPUhbZceUBO7kk3jMMcFYP1USNt1+F6dfYNbiV+vBg
         xkN7c/gg9dJBeltZ1ngtJuV5LmtboKmlUzZ1VnTdpQb910yTltk8kzjhahsydWBvpLgS
         XVZA==
X-Forwarded-Encrypted: i=1; AJvYcCU9z6j5L72OD+wgp38/ApJo8iWyq6TUDcaxfroE6u1QPvq8G/CWcdcEyOeQojNoq50n6CdgJ9ENzXIIcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzB0uLz/LKdHRFJKYrKmTtDVfG6lkp52y8310s9RGV25pC6IvKL
	EUNAQ1th5Izd11Wzuqx21uqjlSbWKDAfaxeFBY5gIkBVCeAhmUvlOzdvWQc+aVUTGGWmRIlpRdP
	khTv1sv0SnE53m0fhsI1XUN29wqxi8Cb7QyrHzYwvI0N3yCb0fqHMxXeoEusQLGL9QQ==
X-Gm-Gg: AY/fxX5SYA97IXyizZP3VgXYgEiZ8vz86fz/ZBawsTFcSugJkST2i3q91bASCCRUsna
	0FGNU5G5j+JZsKjl/W+qEXff5LNu33FuFCdB1cmP8IwrVfHXL3YgIOkX/ZDn3gSBw82DisJmRAD
	wESrhJvjcD3hygiFHsC8qcoqI1rMkEgBfbZwpq2HUDnnGs+oLPJWyAAmLiL0JLjuPssTGre1iAv
	nO94hDW+KtNgktKHc8QL8p+knQkc3FW7Fpt8Qy7f4/mftDMEkGOIwJiTD/KR07ueSTvd4Z02oNN
	YIa+9Kf+ms9061c8r1tqq8rDmx4DtuD1UXxrb1wyKOt22IQATQuW7I8tZdq9oCFcLEdCU3oc2HU
	ens4+nNHPtemtOzpxCiZyFqvwWvXaPVnl+vu5dRm8ABexkZaBQZTKHZ/y0rAHYbKZDQ4yem9XbA
	==
X-Received: by 2002:a05:620a:3942:b0:8b2:dafb:9089 with SMTP id af79cd13be357-8c6a67899b0mr306190785a.67.1768555975729;
        Fri, 16 Jan 2026 01:32:55 -0800 (PST)
X-Received: by 2002:a05:620a:3942:b0:8b2:dafb:9089 with SMTP id af79cd13be357-8c6a67899b0mr306188385a.67.1768555975194;
        Fri, 16 Jan 2026 01:32:55 -0800 (PST)
Received: from [10.111.171.115] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a72602f3sm186480285a.40.2026.01.16.01.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 01:32:54 -0800 (PST)
Message-ID: <e27deffc-bbcc-48bc-9e4e-ce52698d98f3@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 17:32:45 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
 <20260115-sm6150_evk-v3-5-81526dd15543@oss.qualcomm.com>
 <3b16ffa2-1580-426c-aa9c-f377d913d49c@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <3b16ffa2-1580-426c-aa9c-f377d913d49c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: w2Odldr_rh_Wcl6t7lw2LrEUGO5UVizC
X-Proofpoint-ORIG-GUID: w2Odldr_rh_Wcl6t7lw2LrEUGO5UVizC
X-Authority-Analysis: v=2.4 cv=TcmbdBQh c=1 sm=1 tr=0 ts=696a05c8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=tQJASglR_GpgkQO9bp8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3MCBTYWx0ZWRfXyD9w0UxGmwDg
 xPXqTMMAhBmsO1tLt8XMi/OL0+/0/nMLBStagcs8fPo9qI4a3cBupzQ4hbM27bRwb3oqB+o7fxl
 fa9k/4mRXAsiPFlVSvc9jGyM5TocG9GG+osZqOvN5Y+pvqT8Z0zLzljixZfZCTNDwOn4WFh9T6+
 SsdY+w9aeC3OURwl3ApQEm6V9UzQwlTvUNY9fH3IOqY07CWU81tLDAOsHy0A1Blzf5DNIS3bESq
 keJCZUb49pGnTFkj4ZgjcCvR+7k019rFDVer765Oss/JiU1l0+FDghaw2KZVB2Dqa4z6oI3i5XS
 HIwE28e2xwHXzm0HCEOXHswVNFs79Re0B+6On7ByQncfRfjRDqERK5Np+UJQf49WWP8V9s2rGdG
 TW4keR/wEczdfJA6QTiX8YT6x27tambCBOsoelRpiN0RYxxxpUyMkfzuhJdP+DifNGqJRjoW7/f
 xORDkY3QzVt/WVeSw8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160070



On 1/16/2026 5:12 PM, Vladimir Zapolskiy wrote:
> On 1/15/26 12:12, Wenmeng Liu wrote:
>> Enable IMX577 via CCI on Taloss EVK Core Kit.
>>
>> The Talos EVK board does not include a camera sensor
>> by default, this DTSO has enabled the Arducam 12.3MP
>> IMX577 Mini Camera Module on the CSI-1 interface.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile                  |  3 ++
>>   .../boot/dts/qcom/talos-evk-camera-imx577.dtso     | 63 ++++++++++++ 
>> ++++++++++
>>   2 files changed, 66 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/ 
>> qcom/Makefile
>> index 
>> 00652614e73582fa9bd5fbeff4836b9496721d2d..be9aeff2cd1555bc436e1b8eb78d8e1c9b84f9c4 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -339,8 +339,11 @@ dtb-$(CONFIG_ARCH_QCOM)    += sm8650-qrd.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += sm8750-mtp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += sm8750-qrd.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += talos-evk.dtb
>> +dtbo-$(CONFIG_ARCH_QCOM)    += talos-evk-camera-imx577.dtbo
> 
> Please remind me, what does dtbo-y Makefile target serve for?
Rob mentioned:
https://lore.kernel.org/all/20260106192609.GA2581379-robh@kernel.org/

I checked, dtbo- is not an upstream usage, it will be updated form 
dtbo-$(CONFIG_ARCH_QCOM) to dtb-$(CONFIG_ARCH_QCOM) in the next version.

Thanks,
Wenmeng>
>> +talos-evk-camera-imx577-dtbs    := talos-evk.dtb talos-evk-camera- 
>> imx577.dtbo
>>   talos-evk-lvds-auo,g133han01-dtbs    := \
>>       talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
>> +dtb-$(CONFIG_ARCH_QCOM)    += talos-evk-camera-imx577.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += talos-evk-lvds-auo,g133han01.dtb
>>   x1e001de-devkit-el2-dtbs    := x1e001de-devkit.dtb x1-el2.dtbo
>>   dtb-$(CONFIG_ARCH_QCOM)    += x1e001de-devkit.dtb x1e001de-devkit- 
>> el2.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso b/ 
>> arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..53006a861878f9112673b9a0ad954bed7a5fdca5
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
>> @@ -0,0 +1,63 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +#include <dt-bindings/clock/qcom,qcs615-camcc.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +
>> +&camss {
>> +    vdd-csiphy-1p2-supply = <&vreg_l11a>;
>> +    vdd-csiphy-1p8-supply = <&vreg_l12a>;
>> +
>> +    status = "okay";
>> +
>> +    ports {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        port@1 {
>> +            reg = <1>;
>> +
>> +            csiphy1_ep: endpoint {
>> +                data-lanes = <0 1 2 3>;
>> +                remote-endpoint = <&imx577_ep1>;
>> +            };
>> +        };
>> +    };
>> +};
>> +
>> +&cci {
>> +    status = "okay";
>> +};
>> +
>> +&cci_i2c1 {
>> +    #address-cells = <1>;
>> +    #size-cells = <0>;
>> +
>> +    camera@1a {
>> +        compatible = "sony,imx577";
>> +        reg = <0x1a>;
>> +
>> +        reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
>> +        pinctrl-0 = <&cam2_default>;
>> +        pinctrl-names = "default";
>> +
>> +        clocks = <&camcc CAM_CC_MCLK2_CLK>;
>> +        assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
>> +        assigned-clock-rates = <24000000>;
>> +
>> +        avdd-supply = <&vreg_s4a>;
>> +
>> +        port {
>> +            imx577_ep1: endpoint {
>> +                link-frequencies = /bits/ 64 <600000000>;
>> +                data-lanes = <1 2 3 4>;
>> +                remote-endpoint = <&csiphy1_ep>;
>> +            };
>> +        };
>> +    };
>> +};
>>
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 




