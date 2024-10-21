Return-Path: <linux-media+bounces-19992-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 213DD9A6847
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 14:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50B9A1C226C3
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 12:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E538D1F8F0D;
	Mon, 21 Oct 2024 12:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YcnYyxUl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554741F4714;
	Mon, 21 Oct 2024 12:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729513361; cv=none; b=DnAkOc8UbCP5K6fWouhUeHrIBxhSR8FMui/6c1GXDmJAebF9966gajIZxNniTQ+g08gHbpXxCCszXzoWFnu3foKWdrBkV96gDRF3BCK2uXuvxaRtiGeYsZMzW2/yT9+gIs3yWT1GGsNXAg9SFMZuOa1/GaQzTkp+n8gNkWIRR3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729513361; c=relaxed/simple;
	bh=LknK+bmwz1HcsCHFGbTuacYGi4dNazdLQR43QwJVFHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fJLQnEgLG/URZPR990t/k2U0qJOE2a15o13KZrlrh5J4btKa8rrda+ybitrWQRVdRrEuelq7GUc5XeTFMO/IL9NpGi+Rp3sjCe6zW9359+Xtiv8BlNU/gEX55YShiJnqsTrIwjDhbAZ0h9xHfm2sYy5Ujn4zS3IBv9jvadxQ3t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YcnYyxUl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LA97ZH012545;
	Mon, 21 Oct 2024 12:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YGbUV117vz4ntpz8yuZW40y8LXipHeKy2mpnqNfZXQU=; b=YcnYyxUlmzb6auXI
	BBHfeF3ekkVIaQiACdD7yVHuymE0HapdRVEtE1LIokt8ieGO+HisGA/YSj9K9xEA
	6WVDBwVk6R5pt9dsLzDjZnicGbf0HyvyiPtd8d2xTAbEdgq24lQDTftv8HKyI5PW
	o8j7rFJhh7jbHjHgdTca3ZZp7tDKD2L7Uo2xnmuy3Wie/SSWa0uWRZQ5eDoD1HJU
	snTrRdXUC7zoy/m0MNMgAn34wKJvwzvVFEjkZSg5AW5HfpUWtYIhX//aCrHYo+QN
	QHf3T1riGocog/q3FQmw/1SCNpbbwTIGW3RUp24R0Myw8N99E8vINd7FaoaFn/qj
	7FCOGQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6rj4nhx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 12:22:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49LCMPlS016807
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 12:22:25 GMT
Received: from [10.206.106.133] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Oct
 2024 05:22:17 -0700
Message-ID: <e2531d90-dbcb-4ba5-b153-fb8ca2ba7734@quicinc.com>
Date: Mon, 21 Oct 2024 17:52:14 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] media: dt-bindings: media: camss: Add
 qcom,sc7280-camss binding
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <akapatra@quicinc.com>, <hariramp@quicinc.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20241011140932.1744124-1-quic_vikramsa@quicinc.com>
 <20241011140932.1744124-2-quic_vikramsa@quicinc.com>
 <q63w23zeoteagtw3px4sk3il4567plydgdhckmvpiksm6qc5i2@3rcdrr5uribq>
Content-Language: en-US
From: Vikram Sharma <quic_vikramsa@quicinc.com>
In-Reply-To: <q63w23zeoteagtw3px4sk3il4567plydgdhckmvpiksm6qc5i2@3rcdrr5uribq>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qWAEw5uzhWxzsU_YX5UU8K6UwinM0zt6
X-Proofpoint-ORIG-GUID: qWAEw5uzhWxzsU_YX5UU8K6UwinM0zt6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0 spamscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1011
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410210088

Hi Krzysztof,

Thanks for your review. I will address the alignment issue as per DTS 
coding style and will submit v4 for review.

Thanks,
Vikram

On 10/11/2024 8:19 PM, Krzysztof Kozlowski wrote:
> On Fri, Oct 11, 2024 at 07:39:25PM +0530, Vikram Sharma wrote:
>> @@ -0,0 +1,440 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +
> Drop blank line (that's a new finding, I would not complain except that
> I expect new version, see further).
>
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        camss: camss@acaf000 {
>> +            compatible = "qcom,sc7280-camss";
>> +
>> +            clocks = <&clock_camcc CAM_CC_CAMNOC_AXI_CLK>,
>> +                <&clock_camcc CAM_CC_IFE_0_CSID_CLK>,
> Alignment did not improve. Please carefully read DTS coding style.
>
>> +                <&clock_camcc CAM_CC_IFE_1_CSID_CLK>,
>> +                <&clock_camcc CAM_CC_IFE_2_CSID_CLK>,
>> +                <&clock_camcc CAM_CC_IFE_LITE_0_CSID_CLK>,
>> +                <&clock_camcc CAM_CC_IFE_LITE_1_CSID_CLK>,
>> +                <&clock_camcc CAM_CC_CSIPHY0_CLK>,
>> +                <&clock_camcc CAM_CC_CSI0PHYTIMER_CLK>,
>> +                <&clock_camcc CAM_CC_CSIPHY1_CLK>,
>> +                <&clock_camcc CAM_CC_CSI1PHYTIMER_CLK>,
>> +                <&clock_camcc CAM_CC_CSIPHY2_CLK>,
>> +                <&clock_camcc CAM_CC_CSI2PHYTIMER_CLK>,
>> +                <&clock_camcc CAM_CC_CSIPHY3_CLK>,
>> +                <&clock_camcc CAM_CC_CSI3PHYTIMER_CLK>,
>> +                <&clock_camcc CAM_CC_CSIPHY4_CLK>,
>> +                <&clock_camcc CAM_CC_CSI4PHYTIMER_CLK>,
>> +                <&gcc GCC_CAMERA_AHB_CLK>,
>> +                <&gcc GCC_CAMERA_HF_AXI_CLK>,
>> +                <&clock_camcc CAM_CC_CPAS_AHB_CLK>,
>> +                <&clock_camcc CAM_CC_IFE_0_AXI_CLK>,
>> +                <&clock_camcc CAM_CC_IFE_0_CLK>,
>> +                <&clock_camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
>> +                <&clock_camcc CAM_CC_IFE_1_AXI_CLK>,
>> +                <&clock_camcc CAM_CC_IFE_1_CLK>,
>> +                <&clock_camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
>> +                <&clock_camcc CAM_CC_IFE_2_AXI_CLK>,
>> +                <&clock_camcc CAM_CC_IFE_2_CLK>,
>> +                <&clock_camcc CAM_CC_IFE_2_CPHY_RX_CLK>,
>> +                <&clock_camcc CAM_CC_IFE_LITE_0_CLK>,
>> +                <&clock_camcc CAM_CC_IFE_LITE_0_CPHY_RX_CLK>,
>> +                <&clock_camcc CAM_CC_IFE_LITE_1_CLK>,
>> +                <&clock_camcc CAM_CC_IFE_LITE_1_CPHY_RX_CLK>;
>> +
>> +            clock-names = "camnoc_axi",
>> +                "csi0",
> Alignment did not improve. Please carefully read DTS coding style.
>
>> +                "csi1",
>> +                "csi2",
>> +                "csi3",
>> +                "csi4",
>> +                "csiphy0",
>> +                "csiphy0_timer",
>> +                "csiphy1",
>> +                "csiphy1_timer",
>> +                "csiphy2",
>> +                "csiphy2_timer",
>> +                "csiphy3",
>> +                "csiphy3_timer",
>> +                "csiphy4",
>> +                "csiphy4_timer",
>> +                "gcc_camera_ahb",
>> +                "gcc_camera_axi",
>> +                "soc_ahb",
>> +                "vfe0_axi",
>> +                "vfe0",
>> +                "vfe0_cphy_rx",
>> +                "vfe1_axi",
>> +                "vfe1",
>> +                "vfe1_cphy_rx",
>> +                "vfe2_axi",
>> +                "vfe2",
>> +                "vfe2_cphy_rx",
>> +                "vfe0_lite",
>> +                "vfe0_lite_cphy_rx",
>> +                "vfe1_lite",
>> +                "vfe1_lite_cphy_rx";
>> +
>> +            interconnects = <&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_CAMERA_CFG 0>,
>> +                <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI1 0>;
> Alignment did not improve. Please carefully read DTS coding style.
>
>> +
>> +            interconnect-names = "ahb", "hf_0";
>> +
>> +            interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
>> +                <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> Alignment did not improve. Please carefully read DTS coding style.
>
>> +                <GIC_SPI 640 IRQ_TYPE_EDGE_RISING>,
>> +                <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
>> +                <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
>> +                <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
>> +                <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
>> +                <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
>> +                <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
>> +                <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
>> +                <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
>> +                <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
>> +                <GIC_SPI 641 IRQ_TYPE_EDGE_RISING>,
>> +                <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
>> +                <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
>> +
>> +            interrupt-names = "csid0",
>> +                "csid1",
>> +                "csid2",
>> +                "csid_lite0",
> Alignment did not improve. Please carefully read DTS coding style.
>
>> +                "csid_lite1",
>> +                "csiphy0",
>> +                "csiphy1",
>> +                "csiphy2",
>> +                "csiphy3",
>> +                "csiphy4",
>> +                "vfe0",
>> +                "vfe1",
>> +                "vfe2",
>> +                "vfe_lite0",
>> +                "vfe_lite1";
>> +
>> +            iommus = <&apps_smmu 0x800 0x4e0>;
>> +
>> +            power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
>> +                <&camcc CAM_CC_IFE_1_GDSC>,
> Alignment did not improve. Please carefully read DTS coding style.
>
>> +                <&camcc CAM_CC_IFE_2_GDSC>,
>> +                <&camcc CAM_CC_TITAN_TOP_GDSC>;
>> +
>> +            power-domains-names = "ife0", "ife1", "ife2", "top";
>> +
>> +            reg = <0x0 0x0acb3000 0x0 0x1000>,
>> +                <0x0 0x0acba000 0x0 0x1000>,
>> +                <0x0 0x0acc1000 0x0 0x1000>,
> Alignment did not improve. Please carefully read DTS coding style.
>
>> +                <0x0 0x0acc8000 0x0 0x1000>,
>> +                <0x0 0x0accf000 0x0 0x1000>,
>> +                <0x0 0x0ace0000 0x0 0x2000>,
>> +                <0x0 0x0ace2000 0x0 0x2000>,
>> +                <0x0 0x0ace4000 0x0 0x2000>,
>> +                <0x0 0x0ace6000 0x0 0x2000>,
>> +                <0x0 0x0ace8000 0x0 0x2000>,
>> +                <0x0 0x0acaf000 0x0 0x4000>,
>> +                <0x0 0x0acb6000 0x0 0x4000>,
>> +                <0x0 0x0acbd000 0x0 0x4000>,
>> +                <0x0 0x0acc4000 0x0 0x4000>,
>> +                <0x0 0x0accb000 0x0 0x4000>;
>> +
>> +            reg-names = "csid0",
>> +                "csid1",
>> +                "csid2",
>> +                "csid_lite0",
> Alignment did not improve. Please carefully read DTS coding style.
>
>> +                "csid_lite1",
>> +                "csiphy0",
>> +                "csiphy1",
>> +                "csiphy2",
> Best regards,
> Krzysztof
>

