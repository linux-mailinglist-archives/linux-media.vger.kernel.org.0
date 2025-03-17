Return-Path: <linux-media+bounces-28336-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38907A64082
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 07:00:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D48A13AD07D
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 06:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D85D2219E8C;
	Mon, 17 Mar 2025 06:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KEaACtEN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A967F219A67;
	Mon, 17 Mar 2025 06:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742191230; cv=none; b=YzGlnKYMg6YM2Y6+T7aI3Sl8A0DV5JqD3O9Kfx2VWbRjt2+yMTGnqymV50ET2LdyhD4Dw8caoVimrGwyIdGRoESiOietAClq8uJBXgF+yTyqEC9aRvKFDvBjsAdoD/nxG0VxwzaP7Ek8b1Xdeg8PIt88ZORZ+zC8pGnfMEnyhLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742191230; c=relaxed/simple;
	bh=KolPb0ZPx8rcPVhd+iIkVv8wTL1cMaWQTdS3A9h7eeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Y82piAzrHLD/YVbR3R0U5z19spdGnrSEhpf3eJNC000ltAtrZ2SLB8cjegwLdYgkg0Nj0Qu+nrLvzF7op7he/8mVB5wyXxS2HjZftxnezjUqadozS0kC6PTb8YpssEGJRVMetlzbEG5n3y4nSH4sdMO3B1RrfCMtb7OtDvHcFN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KEaACtEN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52GLG2u0028438;
	Mon, 17 Mar 2025 06:00:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A+dA4s4jwVJZgJSxp0R2I5Q/Rl0g+wdmKtRcggg0pxc=; b=KEaACtENJksCnYmn
	hRuZUk6Cg9wj4ItsgDUzTFBijg1qCJLGUD91SWYrOjd1mCACfxeE4E/rKuxQ077Y
	9sPr+HysEylR8alDCQIn0wHXg9sy4/O7iNbf1RTv20REozEazfwUyt3ih82McFce
	AgsL3/nJH51HMkRuprJmiau+45DbeJbiyPvUc6SwzbPXA3ep6odaEDKVNBtttLve
	1GJOuwzyI/2aqZmlRa3k8o2n83o8VVhZN/inR6S/CwJFTA3530KRovSdIFQ9IfYt
	tKxjTbF0c9SzNSw8696ImrRnFoHhkgbC50fkEs141zTNSkJc130p0jMx+kOLu5PN
	9VAcDA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1utuhhe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Mar 2025 06:00:24 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52H60NlF028526
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Mar 2025 06:00:23 GMT
Received: from [10.204.100.69] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 16 Mar
 2025 23:00:19 -0700
Message-ID: <b9743d3a-d0bb-385f-f21e-6b0c0be37fae@quicinc.com>
Date: Mon, 17 Mar 2025 11:30:16 +0530
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
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
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
 <3ec71075-b1ef-4366-b595-80fe41cd1e13@oss.qualcomm.com>
 <5qfe4gnjnttnpezj36rdsdbomghnz5ytj3hiecoingj7622o5a@h4tq4tzliwz4>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <5qfe4gnjnttnpezj36rdsdbomghnz5ytj3hiecoingj7622o5a@h4tq4tzliwz4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=67d7ba78 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=ZGXQcgbqD8WDeBfBLQcA:9 a=4gxJ66kGJAKMeDS_:21
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: KaW_Gi31VPCcydntAPzUYPCIhfEw1Syv
X-Proofpoint-ORIG-GUID: KaW_Gi31VPCcydntAPzUYPCIhfEw1Syv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_01,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170042


On 3/16/2025 12:02 AM, Dmitry Baryshkov wrote:
> On Sat, Mar 15, 2025 at 02:43:30PM +0100, Konrad Dybcio wrote:
>> On 3/11/25 1:03 PM, Vikash Garodia wrote:
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
>>
>> This path should use QCOM_ICC_TAG_ACTIVE_ONLY on both endpoints
>>
>>> +					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
>>> +					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>>> +			interconnect-names = "cpu-cfg",
>>> +					     "video-mem";
>>> +
>>> +			firmware-name = "qcom/vpu/vpu30_p4_s6.mbn";
> 
> Firmware-name should be a part of the board DT file rather than the SoC
> DT.
Given that video ip is independent of any board, remains same for any board
variant of SA8775p, and again for the same reason, PIL, aspects of video driver
was made out of probe, i would prefer to keep it in SOC. Again, this can be
overridden in board specific variant DT, if any case arise, incase.
>>
>> If it needs different firmware, I have my doubts over why 8550's data
>> would be fully reused. Are you sure everything in iris_platform_sm8550.c
>> applies?
> 
> If I understand correctly, the firmware is different, because the
> signature profile is different. The Iris core should be compatible.
That appropriately explains the need for different firmware.
> 
>>
>>> +			memory-region = <&pil_video_mem>;
>>> +
>>> +			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>>> +			reset-names = "bus";
>>> +
>>> +			iommus = <&apps_smmu 0x0880 0x0400>,
>>> +				 <&apps_smmu 0x0887 0x0400>;
>>> +			dma-coherent;
>>> +
>>> +			iris_opp_table: opp-table {
>>> +				compatible = "operating-points-v2";
>>> +
>>> +				opp-366000000 {
>>> +					opp-hz = /bits/ 64 <366000000>;
>>> +					required-opps = <&rpmhpd_opp_svs_l1>,
>>> +							<&rpmhpd_opp_svs_l1>;
>>> +				};
>>
>> Please add a newline between subsequent subnodes
>>
>> Konrad
Regards,
Vikash

