Return-Path: <linux-media+bounces-30607-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F4CA950E1
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 14:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6E5E188EB30
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 12:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63880264A97;
	Mon, 21 Apr 2025 12:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cncwPx8b"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078624C85;
	Mon, 21 Apr 2025 12:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745238473; cv=none; b=GJhyaNG4wACHrw1zKI+05Ic0wSsiP1lUTVY9j41Pxqf9og9inEbx5tFm56z6q7TBjI517jyJoxM4CEb6BW4NTFE5y7riVJEFN9yacHPoYz6w9xdYuVuGoIp5Gx0M18SFUUxVjv/R8URRH3FtWGqo0MqwQCmLnoxdimbdmH9Jv2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745238473; c=relaxed/simple;
	bh=Lga4SQ1YKdH047BqCjt4UvsjVVRdjKUATPZCmLak1Yk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rYIsmwo8W1eubnjyDRrDycEskN+5BRnX/HVp2O6plQmTf5h25YDyAabR8kAZoiam7qcJ7gJUxJWvnkxurQRf3Lo9PN0i9Yum9J201SGaUShj8XL7znKzyv8kU1LiDGk2cPEQMYWo6RjumYJIMs4XZ5q1tmlopcXA+xKaHKb5fL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cncwPx8b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LAWNUZ025412;
	Mon, 21 Apr 2025 12:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pqZ9U1jRsr96bYu87sJMOtDCiZGC2tEtmMG3JM3z/eU=; b=cncwPx8bLKBz5VSo
	XOwOObljaUxnhPfJlHzYvcUCDxpR2LIEltgL8+ULZG63RQg3y5hPaW5E/XXSCFxv
	JkwfoEanV9FuFa8+weAiocizSgKBGupQN0Z2OCBP/N3/r6cylUHNmW6q3jt/BXKU
	TxzNfHP7tFCTAkULWULFykwqUs0JQy5JQQFiYsz3j7ziEfpUs76n3snB4tgmIUYb
	wqtgBTG3OK/0ItTs9TXMmzvBg0e/ZB1qy0EPReKrDO+xccQ/UcsAX/4deLO+Peco
	PxI88vOTjsIg8MXZme/lco/7NjYFJNzRBhACoSxkqyVFVVeNnyd/P76eawlz22Bz
	yP206A==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4642u9c7cb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 12:27:47 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53LCRk97031800
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 12:27:46 GMT
Received: from [10.204.100.69] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Apr
 2025 05:27:43 -0700
Message-ID: <fc38532c-06c9-2bc7-cbf9-9554e1f25ce6@quicinc.com>
Date: Mon, 21 Apr 2025 17:57:40 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: qcs8300: add support for video
 node
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250418-qcs8300_iris-v2-0-1e01385b90e9@quicinc.com>
 <20250418-qcs8300_iris-v2-2-1e01385b90e9@quicinc.com>
 <df97067e-a293-424d-aa19-24a99670a354@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <df97067e-a293-424d-aa19-24a99670a354@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=TYaWtQQh c=1 sm=1 tr=0 ts=680639c4 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=pr9gLcTrLKOj9eJSbYgA:9
 a=nbm2OD6Gl27TcRA3:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ZoipHZbbzAtDevHAf7Iv0oxrzSqEVRfh
X-Proofpoint-GUID: ZoipHZbbzAtDevHAf7Iv0oxrzSqEVRfh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_06,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=999 mlxscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210097



On 4/18/2025 3:57 PM, Bryan O'Donoghue wrote:
> On 18/04/2025 07:28, Vikash Garodia wrote:
>> Video node enables video on Qualcomm QCS8300 platform.
> 
> Add the IRIS video-codec node on QCS8300.
Ok.
> 
>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 71 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 71 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> index
>> 4a057f7c0d9fae0ebd1b3cf3468746b382bc886b..158779434f610b10ea82d2cdae08090a7a4402de 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> @@ -2929,6 +2929,77 @@ usb_2_dwc3: usb@a400000 {
>>               };
>>           };
>>   +        iris: video-codec@aa00000 {
>> +            compatible = "qcom,qcs8300-iris";
>> +
>> +            reg = <0x0 0x0aa00000 0x0 0xf0000>;
>> +            interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +            power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
>> +                    <&videocc VIDEO_CC_MVS0_GDSC>,
>> +                    <&rpmhpd RPMHPD_MX>,
>> +                    <&rpmhpd RPMHPD_MMCX>;
>> +            power-domain-names = "venus",
>> +                         "vcodec0",
>> +                         "mxc",
>> +                         "mmcx";
>> +
>> +            operating-points-v2 = <&iris_opp_table>;
>> +
>> +            clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
>> +                 <&videocc VIDEO_CC_MVS0C_CLK>,
>> +                 <&videocc VIDEO_CC_MVS0_CLK>;
>> +            clock-names = "iface",
>> +                      "core",
>> +                      "vcodec0_core";
>> +
>> +            interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>> +                     &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +                    <&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
>> +                     &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>> +            interconnect-names = "cpu-cfg",
>> +                         "video-mem";
>> +
>> +            memory-region = <&video_mem>;
>> +
>> +            resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>> +            reset-names = "bus";
>> +
>> +            iommus = <&apps_smmu 0x0880 0x0400>,
>> +                 <&apps_smmu 0x0887 0x0400>;
>> +            dma-coherent;
>> +
>> +            status = "disabled";
>> +
>> +            iris_opp_table: opp-table {
>> +                compatible = "operating-points-v2";
>> +
>> +                opp-366000000 {
>> +                    opp-hz = /bits/ 64 <366000000>;
>> +                    required-opps = <&rpmhpd_opp_svs_l1>,
>> +                            <&rpmhpd_opp_svs_l1>;
>> +                };
>> +
>> +                opp-444000000 {
>> +                    opp-hz = /bits/ 64 <444000000>;
>> +                    required-opps = <&rpmhpd_opp_nom>,
>> +                            <&rpmhpd_opp_nom>;
>> +                };
>> +
>> +                opp-533333334 {
>> +                    opp-hz = /bits/ 64 <533333334>;
>> +                    required-opps = <&rpmhpd_opp_turbo>,
>> +                            <&rpmhpd_opp_turbo>;
>> +                };
>> +
>> +                opp-560000000 {
>> +                    opp-hz = /bits/ 64 <560000000>;
>> +                    required-opps = <&rpmhpd_opp_turbo_l1>,
>> +                            <&rpmhpd_opp_turbo_l1>;
>> +                };
>> +            };
>> +        };
>> +
>>           videocc: clock-controller@abf0000 {
>>               compatible = "qcom,qcs8300-videocc";
>>               reg = <0x0 0x0abf0000 0x0 0x10000>;
>>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

