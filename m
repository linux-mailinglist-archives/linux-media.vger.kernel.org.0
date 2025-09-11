Return-Path: <linux-media+bounces-42279-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8219FB52D07
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 11:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD71818822C2
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 09:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1320E2E264D;
	Thu, 11 Sep 2025 09:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PFpBBV/t"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE162E8B71;
	Thu, 11 Sep 2025 09:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757582437; cv=none; b=V9k0fQ30Ahshz90jDJ/wOlGK85mmE/WUEQ3lYpPpkF+21YQnLESnfyhToQDwawiT1pt12VYPhpiild1eNAW/meu0WKJTF+HREh/o7cD+aSOjZOiybvzSlq5iIOzrEDFoH9nmPdNl/gARhG766hxvguDoN3B6pubCtyTSDFcoRjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757582437; c=relaxed/simple;
	bh=VytaL+UJGz5BG/eriTvjFcXgGf6xuPyanSWu3Rgi+xE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pH62NQ35rgduATuAZuZI3/GKdsdSZ6WA+0Go8YwALdQ3FAGfhKHwaGYdWg9v9e7aAVFfSUv3w4C6K+gOoxG3YzCXSSzimzTt3GjPt9cESx6/LFF4yGuUioO0rFz2cGSJerxb45yPXhRJbBrbI7qkDVH4UNcFVcPP1HRBmVbhXfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PFpBBV/t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2Ibjw002402;
	Thu, 11 Sep 2025 09:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4FQn2gddC3/DV2qgU8ynuCwiXmOYDmwte8ix1cOJuVI=; b=PFpBBV/tjlu/7YXZ
	jow7Nr/OzibvH69nPjfAZpZ9BRBJ0XdEuoXaQ8X3+4fiVcxERpcj4tymfL3/yiHi
	GByJBvQaW3N2/ysWInpUUom6Rei82m5L/6ZWqhuHJK6yUz0Vpvs7FqMjOMeSwXT6
	MK+/IoKmE2RI831D/1PuSghr8pc2LTVhW/pWcniXFwi+SXCxU5rvduP83g/SLWV8
	0t8/Zvk5HK/QMSsZVzuRDnK6ZoXRWfKqurVTgAySnHNxkZ6PIulbALQr/LK8OoyG
	mueSUhXk4IP58FlR0RZJUznlrNDF6LDA8/KgQlDfrd+JF4YW8GzdmGqAOHCN/p4j
	jIil/g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bwsf6va-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 09:20:26 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58B9KP1u029809
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 09:20:25 GMT
Received: from [10.206.103.106] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 11 Sep
 2025 02:20:02 -0700
Message-ID: <3d26b554-727a-44cb-a1a9-56f49775ba3a@quicinc.com>
Date: Thu, 11 Sep 2025 14:49:59 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: monaco-evk-camera: Add DT overlay
To: Vikram Sharma <quic_vikramsa@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_svankada@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>
References: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
 <20250909114241.840842-4-quic_vikramsa@quicinc.com>
 <w54mpkzk7irjb7m5jiouxhj77czj4ex72oqioaph4o5qhcsay2@qjolctktsu4s>
 <8104bb41-e827-4daa-bc96-9b6678a9d345@quicinc.com>
Content-Language: en-US
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
In-Reply-To: <8104bb41-e827-4daa-bc96-9b6678a9d345@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bvSiUd5GLpTMlo4CYzoLmf7J1E0A9a6m
X-Proofpoint-GUID: bvSiUd5GLpTMlo4CYzoLmf7J1E0A9a6m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX/rhFzt0/h4Y8
 BkpTEowefkYsh1VecQco+uKmxpf5mFLU7S/9U52e5KrjN9CLbBvLGvYYsniy9sz9fIZouNXQwSW
 tJEBCQHWJRisF4Ix/Z75MY6cQszzDcenQPLQ6S8VTUwSd3WStu9nd8c5KdEfPA3fYzyxrxzSvz4
 +GTAW1k22WuuVYiM7h4xAG5Ajx5P6nJbstroT2PnRKIn/XYZ6vdqvG4x5VrMnwEsWsfxd/9iOzZ
 CzdOAOYAENf4Fjl/r590INhhXkfezPQxG2HQn8qZcG4Q/iTizNEXyDynnTjyX8z1CjR6zKMeSf5
 VS9x26S8Ea35dONBuE8eSrCV4WtauqlEO11lUyq7sAw9cfMO9p+H2WTDx5xeBA9J4HBW3bS/rOw
 Xf9uf+NC
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c2945a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=eIUALLlfMK20frBwWbIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1011
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018



On 10-09-2025 12:33, Vikram Sharma wrote:
> On 9/9/2025 7:31 PM, Dmitry Baryshkov wrote:
>> On Tue, Sep 09, 2025 at 05:12:40PM +0530, Vikram Sharma wrote:
>>> From: Nihal Kumar Gupta<quic_nihalkum@quicinc.com>
>>>
>>> Enable IMX577 sensor using the CCI1 interface on Monaco EVK.
>>> Camera reset is controlled through an I2C expander,
>>> and power supply is managed via tlmm GPIO74.
>> Why is done as an overlay? Is it a seprate mezzanine?
> It’s not a separate mezzanine; monaco-evk does not come with an attached camera 
> sensor by default.
> The overlay simply reflects an optional camera sensor attachment (e.g., IMX577 
> on CSIPHY1)
> That is why camera sensor is configured in monaco-evk-camera.dtso instead of 
> modifying the base monaco-evk.dts.
> Please suggest and alternative approach if you feel this is not correct

Dmitry, Do you agree with this justification or you have a follow-up comment?
Can we post v2 with the same change addressing other comments.

>>> Co-developed-by: Ravi Shankar<quic_rshankar@quicinc.com>
>>> Signed-off-by: Ravi Shankar<quic_rshankar@quicinc.com>
>>> Co-developed-by: Vishal Verma<quic_vishverm@quicinc.com>
>>> Signed-off-by: Vishal Verma<quic_vishverm@quicinc.com>
>>> Signed-off-by: Nihal Kumar Gupta<quic_nihalkum@quicinc.com>
>>> Signed-off-by: Vikram Sharma<quic_vikramsa@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/Makefile             |  4 +
>>>   .../boot/dts/qcom/monaco-evk-camera.dtso      | 98 +++++++++++++++++++
>>>   2 files changed, 102 insertions(+)
>>>   create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-camera.dtso
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-camera.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-camera.dtso
>>> new file mode 100644
>>> index 000000000000..5831b4de6eca
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-camera.dtso
>>> @@ -0,0 +1,98 @@
>>> +// SPDX-License-Identifier: BSD-3-Clause
>>> +/*
>>> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
>>> + */
>>> +
>>> +/* Camera Sensor overlay on top of Monaco EVK Core Kit */
>>> +
>>> +/dts-v1/;
>>> +/plugin/;
>>> +
>>> +#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
>>> +#include <dt-bindings/gpio/gpio.h>
>>> +
>>> +&{/} {
>> Is this a different product than just Monaco EVK?
> No.
>>
>>
>>> +	vreg_cam1_2p8: vreg_cam1_2p8 {
>>> +		compatible = "regulator-fixed";
>>> +		regulator-name = "vreg_cam1_2p8";
>>> +		startup-delay-us = <10000>;
>>> +		enable-active-high;
>>> +		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
>>> +	};
>>> +};
>>> +
> 
> Best Regards,
> 
> Vikram
> 
Regards,
Nihal Kumar Gupta

