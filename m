Return-Path: <linux-media+bounces-28421-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC293A67584
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 14:48:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 298DB188F8C2
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 13:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B346F20DD46;
	Tue, 18 Mar 2025 13:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Nldh1obG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A9E20D4F7;
	Tue, 18 Mar 2025 13:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742305436; cv=none; b=tgn/udLaC/YnThC0kp/jhmcNeTVz4eY/8pZXqtiAEtVuaZW/essNS9d6Ig6sTWrAU5e0BMGhN5zu1UvZEbWng2rsUsqi9qps16FLkq1kaWUDDj8cT7Gs5AeQHdTtja+4oTdcjsLnqBfHxvt6JhziU8lpUWIWbRdZqtQpyli91R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742305436; c=relaxed/simple;
	bh=7e6tc7W6eSh5Q9IAJsKFHKDH27Fn8VMcwF2P1v6x/IM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TYB8dnj/5UAeMNyh4dVUBiiJwMB8hfOvGWGmdv1UVJvEBXkMk5obfdKYXZmzAwC5tSvHTmjMqjFjpR23PuBvMgDdDoE9GNTluRr4+iiPQWXp4z8knNy/FYgHiF7hvm8y9YyvpIx3mB15rVZP4q0zvc2ydwFoxeTRvIF9LGS/lRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Nldh1obG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I9FExT013188;
	Tue, 18 Mar 2025 13:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WHJ/UqrTULl5utTn8q7XKvZ48Ug+9OxAQ3R7JxIZpkY=; b=Nldh1obGQieTcJWE
	xWyiYB6pk1dzaIDAal9bw8hRWm8t935sAJCCxTmALWdtbgwvuvMLa+yWhXliQQ68
	4QXFLxxwvWWYnNHapkITvlwMjFO0EXdflGlMBD28Rhn6mRAhXFTiF3MVfPjh95eX
	ImguYvc3Mm9rvq0CAXKd4wRRn4wqOe+wOqMYjE/QqdzXvgIpHrsaSqjcHhQ7SqUU
	yJ8uYs+UyPFNEQfv2bq/X8U59pULPuNwsLlUormvgppLR1+Ghq/uG/k8OEaZlKdb
	K1aB6VYRej1OO15ptLbjSW3eDN/RET4iRuCW+DDqLsGMMcY8ti7m0qyr1TSV3iyS
	/zVIUw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1sy0d29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 13:43:49 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52IDhmGw007028
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 13:43:48 GMT
Received: from [10.216.0.149] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Mar
 2025 06:43:43 -0700
Message-ID: <98a35a51-6351-5ebb-4207-0004e89682eb@quicinc.com>
Date: Tue, 18 Mar 2025 19:13:38 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sa8775p: add support for video node
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250311-dtbinding-v1-0-5c807d33f7ae@quicinc.com>
 <20250311-dtbinding-v1-3-5c807d33f7ae@quicinc.com>
 <awgq7zqeqkp2iwyk7vbn3mugsaq723bisxzhaswmzpt3iyc5rw@2vsarnkjdrjr>
 <909def95-0dc5-4002-8df3-8a4c6a8ee132@oss.qualcomm.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <909def95-0dc5-4002-8df3-8a4c6a8ee132@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nxXSx9EycH8l_4v0lrsMskTsNjXsxfM0
X-Proofpoint-ORIG-GUID: nxXSx9EycH8l_4v0lrsMskTsNjXsxfM0
X-Authority-Analysis: v=2.4 cv=XKcwSRhE c=1 sm=1 tr=0 ts=67d97895 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=_wXcZrkUdNFU5cDkhcgA:9 a=j9pjK8zFBowKvmVs:21
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180102


On 3/18/2025 5:52 PM, Konrad Dybcio wrote:
> On 3/17/25 12:31 PM, Dmitry Baryshkov wrote:
>> On Tue, Mar 11, 2025 at 05:33:55PM +0530, Vikash Garodia wrote:
>>> Video node enables video on Qualcomm SA8775P platform.
>>>
>>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 67 +++++++++++++++++++++++++++++++++++
>>>  1 file changed, 67 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> index 3394ae2d13003417a15e64c9e47833725ec779e6..09db8e2eb578f1cada0f4a15e3f844dc097bd46d 100644
>>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> @@ -10,6 +10,7 @@
>>>  #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
>>>  #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
>>>  #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
>>> +#include <dt-bindings/clock/qcom,sa8775p-videocc.h>
>>>  #include <dt-bindings/dma/qcom-gpi.h>
>>>  #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
>>>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>>> @@ -3783,6 +3784,72 @@ llcc: system-cache-controller@9200000 {
>>>  			interrupts = <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH>;
>>>  		};
>>>  
>>> +		iris: video-codec@aa00000 {
>>> +			compatible = "qcom,sa8775p-iris";
>>> +
>>> +			reg = <0 0x0aa00000 0 0xf0000>;
>>> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>>> +
>>> +			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
>>> +					<&videocc VIDEO_CC_MVS0_GDSC>,
>>> +					<&rpmhpd SA8775P_MXC>,
>>> +					<&rpmhpd SA8775P_MMCX>;
>>> +			power-domain-names = "venus",
>>> +					     "vcodec0",
>>> +					     "mx",
>>> +					     "mmcx";
>>> +			operating-points-v2 = <&iris_opp_table>;
>>> +
>>> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
>>> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
>>> +				 <&videocc VIDEO_CC_MVS0_CLK>;
>>> +			clock-names = "iface",
>>> +				      "core",
>>> +				      "vcodec0_core";
>>> +
>>> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
>>> +					&config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ALWAYS>,
>>> +					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
>>> +					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>>> +			interconnect-names = "cpu-cfg",
>>> +					     "video-mem";
>>> +
>>> +			firmware-name = "qcom/vpu/vpu30_p4_s6.mbn";
>>> +			memory-region = <&pil_video_mem>;
>>> +
>>> +			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>>> +			reset-names = "bus";
>>> +
>>> +			iommus = <&apps_smmu 0x0880 0x0400>,
>>> +				 <&apps_smmu 0x0887 0x0400>;
>>> +			dma-coherent;
>>
>> I think almost missed it:
>>
>> 	status = "disabled";
>>
>> Don't enable the device by default, there is a chance of the firmware
>> being not present.
> 
> On a sidenote, venus driver broke sync_state by requesting the firmware at
> load time, instead of at the time of first open (though the latter could
> introduce some latency on first video playback, but both are debatable) -
> what does iris do here?
iris does it on first open
Regards,
Vikash
> 
> Konrad> 

