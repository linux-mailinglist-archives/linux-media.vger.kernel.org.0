Return-Path: <linux-media+bounces-48994-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3BBCC8249
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 15:20:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3522F302F5D3
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 14:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD8A738256F;
	Wed, 17 Dec 2025 14:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O4J8y2oU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D313737D113;
	Wed, 17 Dec 2025 14:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765981204; cv=none; b=J4yJRx9/OdpckXJB3rAVi6sP31UoPvLm1GIfPotmV4zO8OhWxniqqoUCsXeVh1Gf841NHE2UhR6mPdl8vKqTfTerUISd8qt52v1tSkqKJld+RNGUMPq6wCZxjq8O23oxgHBALN7GULPUL29yyPUVankoUNa6IFJLqu6J9yQxYlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765981204; c=relaxed/simple;
	bh=4kZCK74PIEWACZQt3qV6hJGqqouRyUridzPudHa8LeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iPNSTRY2Cbb2YRvtWYtELoZEhXgxGCmznKatVCwHDy4RrPFVCzsUBLEz9kvIksHijqShHDMyMu7GQwVlbfY+/m3y6Xb3gthqLqdDXs3IVKF3kQ6IP248BOCfstkXqGhz8udhEVxL3MlzbwRRpnjZuhQfI77KMw2Ek1XMnkgJD5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O4J8y2oU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKnJW2465103;
	Wed, 17 Dec 2025 14:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n3wjoFjFX7e0nRTUtCuDG6KEqGwUEIVHx6duZb7nqZ4=; b=O4J8y2oUC0xVt1lh
	h/tqYKk4MorXc/aFlj3/4EzePrD/TCkwZk2uH6fu/kMaz6LRSnDScjQ/41fAZIoH
	rh7E8BTM8KMh/L/WtqJ2Gi8i8dtE6RbfKJ+o7siva5J8PFXAMBj5l45R8cMDuZu6
	EO/707XEm0u+MCbqNvi6p32yMb9T56P84QSeO7xd6yWbJwm5hu0PP2+wykfrJ8YY
	7k5G5gUtnIqXd/hQpDldXin1g2jvV7vqvKQK7q6Z188WXTMxmyliywulKPKmIf12
	H0btfEfYg2T9MfzJyWS0zgA0Ixs0TLA/Lu/elMVzJULDblZS40DehNT26e1aJnB5
	AtQwsw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fe2aq0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 14:19:52 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5BHEJp5I024099
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 14:19:51 GMT
Received: from [10.206.103.106] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 17 Dec
 2025 06:19:45 -0800
Message-ID: <facbe87c-a2e1-4cc2-8dc1-30f716814588@quicinc.com>
Date: Wed, 17 Dec 2025 19:49:42 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] arm64: dts: qcom: monaco-evk-camera: Add DT
 overlay
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Ravi Shankar
	<quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>
References: <20251216062223.2474216-1-quic_nihalkum@quicinc.com>
 <20251216062223.2474216-6-quic_nihalkum@quicinc.com>
 <5bd29b5f-6fcf-428d-b451-698d92f0883e@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
In-Reply-To: <5bd29b5f-6fcf-428d-b451-698d92f0883e@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: R3RHhPMXwoLMY-DxpQ7nJtdArbYiyuaT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDExMSBTYWx0ZWRfX5Eg330TVav/Q
 unL4LPNZ2jyKYB/rHi0bw6rlOlVfe3gFQgcQS47DgKcZZvF7VPcKScF6sC6CIfRSmFxh8a8bLoq
 RGu1gOgzI6K9GxpahzYSXxpHwNv4cw7llyOFc497AULkw/ER1s389z9CG9/pummMQEralkeUBCm
 VeF1HQapJrWYl2bn4I/yNUxeVi0ewFwmGl+85lk/DcJQQkvrE5+3eGfMZ6FkGy37QeTzx40+AIj
 q2fw2SiGKLNQYvjrn9Wpxc2NrrWYQaESC4hPIYKKhbGkkxuazVxD4AlNwDzNKaWRJcoqC4xhxYF
 E5ZZZ8+ijY6gdzuy6feaFUuwlr+9uzNfCafXE0VWZ+Sawn4Ue6Whk18eTJXK7BfjANoIxqN4BrF
 jJVZIdTgNjjVNAHB/lXgi7ova4sZ0g==
X-Proofpoint-ORIG-GUID: R3RHhPMXwoLMY-DxpQ7nJtdArbYiyuaT
X-Authority-Analysis: v=2.4 cv=HpN72kTS c=1 sm=1 tr=0 ts=6942bc08 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=5vMn2XeAW159kYVkZ7kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170111



On 16-12-2025 13:05, Vladimir Zapolskiy wrote:
>> @@ -0,0 +1,67 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> 
> Year is missing.
> 
This is as per new yearless copyright format.

>> + */
>> + 
>> +
>> +            csiphy1_ep: endpoint {
>> +                clock-lanes = <7>;
> 
> Please remove 'clock-lanes' property here.
> 
ACK

>> +                data-lanes = <0 1 2 3>;
>> +                remote-endpoint = <&imx577_ep1>;
>> +            };
>> +        };
>> +    };
>> +            imx577_ep1: endpoint {
>> +                link-frequencies = /bits/ 64 <600000000>;
>> +                data-lanes = <0 1 2 3>;
> 
> data-lanes property value should be '1 2 3 4>', 0 is for the clock lane.
> 
> On CAMSS side this cannot be changed, unfortunately it's a lingering issue.
> 
So, I should set data-lanes = <1 2 3 4> in imx577_ep1, and keep csiphy1_ep as <0 1 2 3>, correct?
Is there a reason CAMSS side can’t change this? We should handle it properly in future targets.

>> +                remote-endpoint = <&csiphy1_ep>;
>> +            };
>> +        };
>> +    };
>> +};
> 
> If only one of 3 defined from 4/5 regulators is used, do you really wish
> to describle all 3 in advance? You may consider to remove 2 currently unused
> GPIO controlled regulator descriptions, and squash this change with 4/5.
As discussed, we agreed to add support for other sensors: https://lore.kernel.org/all/4b73f64a-1e28-4f25-80d2-3d59575b9da2@oss.qualcomm.com

Regulator changes are in monaco-evk.dts, and sensor overlay changes are present in monaco-evk-camera-imx577.dtso
It’s better to keep these as separate patches rather than merging them into one.

-- 
Regards,
Nihal Kumar Gupta


