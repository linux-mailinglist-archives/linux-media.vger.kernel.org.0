Return-Path: <linux-media+bounces-47160-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC93CC60048
	for <lists+linux-media@lfdr.de>; Sat, 15 Nov 2025 06:54:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5206E3BF4EC
	for <lists+linux-media@lfdr.de>; Sat, 15 Nov 2025 05:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31F12215F42;
	Sat, 15 Nov 2025 05:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Jdh4rJVU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8DE18CC13;
	Sat, 15 Nov 2025 05:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763186042; cv=none; b=smtSsV9vt2il/12RgPKEKGRGi8R+Qg1zr7/xNS5O/hzf9O6AQ1n4wSOG90xbTZw9QOsBtzbvFCmiNcpYODNXFT5fMCv+9DzWC6n8Y27ECp9cmbKjnEm1/esBKGDesR2AfL8XivM/rC2CVdBRmDLf2W4XvEtVPmYnTDOp7Yv5enU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763186042; c=relaxed/simple;
	bh=oGNpuLcmNm4SLYmLFUGFfU/kg9V/1OopHxb4g+2YNC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GANlP/0Tv3kkCJ+ZSyqsvivKXZWaKEX1GBfn7E1rn+bdNwSX4uwmReSGfw3/XDha+bbZwXnXWlRhLZOWeAGeILFpZkbBu/qogVwrnYjkdR4lFfMNrTLBCmVyNUC7FBHyqdu8HFIl3L/WOBPx2MnfBCxWDUEQLDuxaLyZcgmKF5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Jdh4rJVU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AF4e1sW1103566;
	Sat, 15 Nov 2025 05:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aJpW5j7MocVlQ3SqpFQ/R4aiA5eLAfFTD2hyk10hb8c=; b=Jdh4rJVUtezAxl6m
	nYzdvF2BfQolewQte7sObWllAVt/oJVg1cyoYQqaIuU3EraALk6F0s0BIV84prTN
	p9XeDlw29poWz3yCiZeM+CGy8pNXyKj08IkWcHasQUnn6lpqkK5it68xetQ2J2wB
	iQ/w9rCCqYhGLr71svK2PerMwARI8d3bhMlIyRZZOdyazl8CYNObANYWsHONCQnE
	O4PmxW+HFnxe1cfg9EtUcPDvnLhnVXsIxMj3ujzbSk+oPKBGcOK3vznZqiTGGO5h
	tIvs/PLAkX9KWoQtOB9DdEmgtB+T1LjCV/9HPEPYAZmwOb/JdxeapdFjQK8zpXUI
	kLlTAA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejph02w1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Nov 2025 05:53:47 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AF5rkUN010797
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Nov 2025 05:53:46 GMT
Received: from [10.216.38.157] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 21:53:39 -0800
Message-ID: <22350774-20da-42ff-a6c2-02fab121f4b5@quicinc.com>
Date: Sat, 15 Nov 2025 11:23:30 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: monaco-evk-camera: Add DT
 overlay
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikram Sharma
	<quic_vikramsa@quicinc.com>,
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
        Vishal Verma <quic_vishverm@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20251114064541.446276-1-quic_vikramsa@quicinc.com>
 <20251114064541.446276-4-quic_vikramsa@quicinc.com>
 <a5ae933d-c5d1-4094-b4a1-de52060e0786@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
In-Reply-To: <a5ae933d-c5d1-4094-b4a1-de52060e0786@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDA0NiBTYWx0ZWRfX5OxJQXPM193g
 stAn1JeRwBliK55fXewzsEyJGSawrtugqFizZuDvIszIkCaQdcd8AJuww38dMMktAi2i1xfOLoi
 XjzytoMPSaVpUy4Eq9CIzhJLMjoTFqdHhQD9dC/TUnk0ojNusnhwYuhbGqv7bejCYz8vvBf+/e4
 vVPiU1aeSq5simOtjWpXW1Xf22BopsofaZcEgwWXA+8MHEd+v6GGU+2CFlM19cRXDyiFB3J6in8
 Waf9XkPIptBLQI5VByYTjp5mCSeLXcKYm8vDKFByuhvwV8ffrjz8QQSdigtThAbvl2odRh4ePoG
 ahgx7IXgKst+m8fq0NJ6QHrEBkj5YYj92zCf+7ZdRtBVAxTENTnR5ESZN7wo+Vp6E08SGIzTE3I
 vd69MkFEcs34Y9n9rHMwAa5shtAfEA==
X-Proofpoint-GUID: tHKamVMcx8f6uAcjWA9C5Cik_mG7iFvA
X-Authority-Analysis: v=2.4 cv=E4vAZKdl c=1 sm=1 tr=0 ts=6918156b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=mZF60CUetaME7T47FmQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: tHKamVMcx8f6uAcjWA9C5Cik_mG7iFvA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-15_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511150046



On 15-11-2025 03:49, Konrad Dybcio wrote:
>> +&{/} {
>> +	vreg_cam1_2p8: vreg-cam1-2p8 {
> Where does this regulator lie physically? Is its presence dependent
> on the connection of the sensor, is it part of the EVK carrier board,
> or perhaps something else?
vreg_cam1_2p8 is a fixed 2.8 V regulator located on the EVK carrier board. 
It supplies the camera sensor’s AVDD rail and is enabled via GPIO 74, which is controlled by the TLMM block. 

> 
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vreg_cam1_2p8";
>> +		startup-delay-us = <10000>;
>> +		enable-active-high;
>> +		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&cam1_avdd_2v8_en_default>;
> property-n
> property-names
> 
> please
> 
ACK

> [...]
> 
>> +&tlmm {
>> +	/*
>> +	 * gpio67, gpio68, gpio69 provide MCLK0, MCLK1, MCLK2 for
>> +	 * CAM0, CAM1 and CAM2 respectively via the "cam_mclk" function.
>> +	 * So, here it's MCLK1 pin for instance.
>> +	 */
> I don't really see the value in these comments..
> 
> Vladimir requested you to move the 'description' (meaning the node
> describing the hardware, not a comment explaining the function of the
> DT hunk in natural language) to monaco.dtsi too
I’ve added descriptions to indicate which pins enable which camera MCLK/Regulators. If these aren’t considered useful, I can remove them.

Should I need to add hardware descriptions for all GPIOs (gpio67–69 for MCLK and gpio73–75 for regulator enable), even if they are unused?

I have referenced qcs6490-rb3gen2-vision-mezzanine.dtso for the MCLK pin hardware description (cam1_default).
All TLMM GPIOs mentioned above are muxed pins. As Bryan suggested in v4, these should go into the mezzanine-specific dtso. Do I need to extend this in monaco.dtsi as well?

-- 
Regards,
Nihal Kumar Gupta


