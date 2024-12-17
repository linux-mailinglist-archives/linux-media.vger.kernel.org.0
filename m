Return-Path: <linux-media+bounces-23637-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BF89F5559
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 19:02:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 796E816349B
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 17:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C87B1FA260;
	Tue, 17 Dec 2024 17:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nHI5CiiR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9CD1F7563;
	Tue, 17 Dec 2024 17:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734457777; cv=none; b=sjOSSL/pGUf6rhF8DD+wDMogDCOQoFsfYn/Y89PJVzFDTgr1EDt89LSWzrQt8U0q179k9c5Ht1WMkWIRPjcCHqkP6UZTPxrSuxRe1gj0Y8x7sFNaVeXkSsIr3erSrJtQ4ltx6yLCWOZ+RppfW+kzJcWKklMCUP96GYUHUOlLgys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734457777; c=relaxed/simple;
	bh=zUY66eqgOltY8wKdpZHvKq/45XjgqeVNpER/TcFe6KM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DibWXB0XGfWLYgQQA5C6K2l69lkSafSPT/P1zixR4h41IbJhiNtNz1TAm2YjAn5dKZGM6tA7cgDrTS0cNi5w3KSDSuuExFTO3NRe8UU23ZGs4n4MVwv1J9l1YyMd4coh3a73OsIWOSg5dLs1wGq+VyC5w+eynSDV9AFEYNXLZWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nHI5CiiR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHEpfEQ003754;
	Tue, 17 Dec 2024 17:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O9Plx0bNtmhuCufstSEhSAO/gEk2mv9F+4PnW9ec0Z0=; b=nHI5CiiRmzFe/BbZ
	qb9ufp4rpgFDeuvZsDsnPrPAB2BXqneScgQKxYEwvwEb6lEh+pd9mjWB8pSAx+vb
	bmeZ4b4AJ8zF1gJfhQQDPMCuwZMsJuzHdnl2GuBnreryycnwZVYAFs8Q4H+Uhp3f
	Q9eltaMyaKCt2NlHG81ol8AbYC5V7Kgbfl09rmTZlY7gtrVieMInNGtWV3OArJYR
	zBgnBrYvyaKDwMyQfEowEpk0I9pYtzHLnuUIcuAedCSpHGZ026CwIALFhf+V+ljU
	95jENX7qERLKVfc3aERFvznl5w3E9H2cAfO7h34roUV+NuliW5gGyzfOw26FzUw0
	ed78LA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kbedrgsv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 17:49:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BHHnNU6014832
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 17:49:23 GMT
Received: from [10.50.34.207] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Dec
 2024 09:49:13 -0800
Message-ID: <3e6ab7aa-c606-49bc-8cc5-24c8a1edc081@quicinc.com>
Date: Tue, 17 Dec 2024 23:19:11 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/4] arm64: dts: qcom:
 qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <akapatra@quicinc.com>, <hariramp@quicinc.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
References: <20241217140656.965235-1-quic_vikramsa@quicinc.com>
 <20241217140656.965235-5-quic_vikramsa@quicinc.com>
 <22479c27-9265-4994-8974-9739ecbae5ee@linaro.org>
Content-Language: en-US
From: Vikram Sharma <quic_vikramsa@quicinc.com>
In-Reply-To: <22479c27-9265-4994-8974-9739ecbae5ee@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LIEX0_8K3eKu5wFpoMUkSDZCo6_8Oee2
X-Proofpoint-ORIG-GUID: LIEX0_8K3eKu5wFpoMUkSDZCo6_8Oee2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170137

On 12/17/2024 8:10 PM, Vladimir Zapolskiy wrote:
> On 12/17/24 16:06, Vikram Sharma wrote:
>> The Vision Mezzanine for the RB3 ships with an imx577 camera sensor.
>> Enable the IMX577 on the vision mezzanine.
>>
>> An example media-ctl pipeline for the imx577 is:
>>
>> media-ctl --reset
>> media-ctl -v -V '"imx577 '19-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
>> media-ctl -V '"msm_csiphy3":0[fmt:SRGGB10/4056x3040]'
>> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
>> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
>> media-ctl -l '"msm_csiphy3":1->"msm_csid0":0[1]'
>> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>>
>> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F 
>> /dev/video0
>>
>> Signed-off-by: Hariram Purushothaman <quic_hariramp@quicinc.com>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile             |   4 +
>>   .../qcs6490-rb3gen2-vision-mezzanine.dtso     | 109 ++++++++++++++++++
>>   2 files changed, 113 insertions(+)
>>   create mode 100644 
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile 
>> b/arch/arm64/boot/dts/qcom/Makefile
>> index 4686f2a8ddd8..a7e88fcabded 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -115,6 +115,10 @@ dtb-$(CONFIG_ARCH_QCOM)    += qcs404-evb-1000.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += qcs404-evb-4000.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += qcs615-ride.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += qcs6490-rb3gen2.dtb
>> +
>> +qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb 
>> qcs6490-rb3gen2-vision-mezzanine.dtbo
>> +
>> +dtb-$(CONFIG_ARCH_QCOM)    += qcs6490-rb3gen2-vision-mezzanine.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += qcs8300-ride.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += qcs8550-aim300-aiot.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += qcs9100-ride.dtb
>> diff --git 
>> a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso 
>> b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
>> new file mode 100644
>> index 000000000000..7782c4aee576
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
>> @@ -0,0 +1,109 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + */
>> +
>> +/*
>> + * Camera Sensor overlay on top of rb3gen2 core kit.
>> + */
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/clock/qcom,camcc-sc7280.h>
>
> Please sort the header files alphabetically.
Thanks for your comments Vladimir.
Will take care in next version.
>
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>
> Please put these two lines right after the comments header.
ACK.
>
>> +&camss {
>> +    vdda-phy-supply = <&vreg_l10c_0p88>;
>> +    vdda-pll-supply = <&vreg_l6b_1p2>;
>> +
>> +    status = "okay";
>> +
>> +    ports {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        /* The port index denotes CSIPHY id i.e. csiphy3 */
>> +        port@3 {
>> +            reg = <3>;
>> +
>> +            csiphy3_ep: endpoint {
>> +                clock-lanes = <7>;
>> +                data-lanes = <0 1 2 3>;
>> +                remote-endpoint = <&imx577_ep>;
>> +            };
>> +        };
>> +    };
>> +};
>> +
>> +&cci1 {
>> +    status = "okay";
>> +};
>> +
>> +&cci1_i2c1 {
>> +    #address-cells = <1>;
>> +    #size-cells = <0>;
>> +
>> +    camera@1a {
>> +        compatible = "sony,imx577";
>> +
>> +        reg = <0x1a>;
>> +
>> +        reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
>> +        pinctrl-names = "default", "suspend";
>> +        pinctrl-0 = <&cam2_default>;
>> +        pinctrl-1 = <&cam2_suspend>;
>> +
>> +        clocks = <&camcc CAM_CC_MCLK3_CLK>;
>> +        assigned-clocks = <&camcc CAM_CC_MCLK3_CLK>;
>> +        assigned-clock-rates = <24000000>;
>> +
>> +        dovdd-supply  = <&vreg_l18b_1p8>;
>
> Please remove double space before '='.
Sure.
>
>> +        avdd-supply = <&vph_pwr>;
>> +        dvdd-supply = <&vph_pwr>;
>> +
>> +        port {
>> +            imx577_ep: endpoint {
>> +                clock-lanes = <7>;
>
> It is an invalid property/value of the sensor, please remove it.
Will check more on this internally and respond back.
>
>> +                link-frequencies = /bits/ 64 <600000000>;
>> +                data-lanes = <0 1 2 3>;
>
> data-lanes = <1 2 3 4>;
Will check more on this internally and respond back
>
>> +                remote-endpoint = <&csiphy3_ep>;
>> +            };
>> +        };
>> +    };
>> +};
>> +
>> +&tlmm {
>> +    cam2_default: cam2-default-state {
>> +        mclk-pins {
>> +            pins = "gpio67";
>> +            function = "cam_mclk";
>> +            drive-strength = <2>;
>> +            bias-disable;
>> +        };
>> +
>> +        rst-pins {
>> +            pins = "gpio78";
>> +            function = "gpio";
>> +            drive-strength = <2>;
>> +            bias-disable;
>> +        };
>> +    };
>> +
>> +    cam2_suspend: cam2-suspend-state {
>> +        mclk-pins {
>> +            pins = "gpio67";
>> +            function = "cam_mclk";
>> +            drive-strength = <2>;
>> +            bias-pull-down;
>> +        };
>> +
>> +        rst-pins {
>> +            pins = "gpio78";
>> +            function = "gpio";
>> +            drive-strength = <2>;
>> +            bias-pull-down;
>> +            output-low;
>> +        };
>
> I have doubts that it's proper to embed a reset gpio into driver's
> pinctrl suspend/resume power management.
>
> Konrad, can you please confirm that it's really accepted?
>
> I'd rather ask to remove this reset pin control.
Will discuss this with Konrad and respond.
>> +    };
>> +};
>
> -- 
> Best wishes,
> Vladimir

Best Regards,
Vikram


