Return-Path: <linux-media+bounces-44729-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD3CBE33C0
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 14:06:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 70B61356015
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 12:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61783321425;
	Thu, 16 Oct 2025 12:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iJedL3V2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E4C31D398;
	Thu, 16 Oct 2025 12:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760616372; cv=none; b=W3Anm/7J2qnpcoAsEDz7cOYj4mnmOU9nnnC/KiLAv1BTv+xEC0wtTjvNH5Gwetk+ykbRR3oWE0QnX+UBbUdAkoXgERbzkKsISH2jkj7BKq4ZswJdUQwLN8sr9K24TFrFPnoN5NRUAKftpgzmL0LgDSqBjb7NHN0KMK9b7M6TUUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760616372; c=relaxed/simple;
	bh=YKW7kKTHA/GhuT1Nmo4hIQ/Xoc63v38N11Oz9GvMzSw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=cg/uhyYJSvaL5gdeZ0byfROG5Jpfa+jJ14alxlTUi6bkvi7VU3ue0qZLgId9bigauZTCps1eg+GFKjx0PBQpFk0R3eXuY5TpV06+4+K7HBK8Ft0Q2ecmHQfCwacnxpF/zCyBn9MwA/8SeEuhWgl0d/wgcXp7acRF17loK824+78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iJedL3V2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G6nQuN024868;
	Thu, 16 Oct 2025 12:06:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tndW6FWfelcwppMrTFAhIr/kGMmLjnCFiY72W0/p4SA=; b=iJedL3V2b6gHR8D6
	UyLWoG37UCIpizuS2CDQmc4475yoWWWmUNyB2Vlg+Y29gQqEV461uDM2QT3PJk70
	wqWuZtZlLP5am00pjTCvi26fqsjkb9vVCH+zc+e7vwIMzqDl423JPqyW30n74fwf
	uu/fsUQZeQXXVq/ZpD3dD6WET6ZMadRqkmwwuMjryQo4rGRDNnyDbfxC7coEfh59
	uagJeNc3TdqBPbGxV1ZHSgYcDDVdmlq6ky1KqwvIVG8RARediNFRKJsAuLWKYjPo
	4dJqaWH9umt6xAI5pkGZs4shz2H9d9ktb7Q64CFAqluvE5pIDttFYH1NohnOeark
	BwkM5Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff105kh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Oct 2025 12:06:04 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59GC63QN012457
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Oct 2025 12:06:03 GMT
Received: from [10.206.103.106] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 16 Oct
 2025 05:05:57 -0700
Message-ID: <86776f4b-39db-44c7-b596-0fc551fa71ae@quicinc.com>
Date: Thu, 16 Oct 2025 17:35:54 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: qcs8300: Add CCI definitions
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
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
        Vishal Verma <quic_vishverm@quicinc.com>
References: <20251015131303.2797800-1-quic_vikramsa@quicinc.com>
 <20251015131303.2797800-3-quic_vikramsa@quicinc.com>
 <90cb8d1b-ebed-434e-9efd-9357e10a6ee0@linaro.org>
Content-Language: en-US
In-Reply-To: <90cb8d1b-ebed-434e-9efd-9357e10a6ee0@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX8mW7yUTlSPuI
 JHhM0QgAHOuEqo/2zjMOZASYuzR1Gayx8Hv8qn9BpAOZg93vmg+yym3YjWOaIRqXMAwZ90zyXiP
 v2g3mW08/qyDzDy5Z8Zzk0sAKp/dBOheDtgCwFyuJBtslpfMiIgDPkpNU61HTnc7cyBf0p5USlA
 ZzQqwFquLeFD6qlDVDPGoM7J6NETQDavHWI1b34MNjO6EcYSX7kDvUqLuGZW3RYP3BEIEdUjTQt
 jvLTFtH2kHEHNCro/KqU3uTuFDAFplMV6J4Xs4Mb0kFNmq7XkCI+a/GSwRXvUM9l/lk8Ri04qyS
 t/ODfqfH9xDPBUdSobFE4DNrfuoyrYDLsJzNK2skA==
X-Proofpoint-GUID: qkkpgcg1PDI5dpAuxiG1efb9nlNzIN-K
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68f0dfac cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bUjhYU86iB4VH6HtqekA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: qkkpgcg1PDI5dpAuxiG1efb9nlNzIN-K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018



On 16-10-2025 00:27, Vladimir Zapolskiy wrote:
>> +
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            status = "disabled";
> 
> Please remove empty lines between individual properties above and in two
> other introduced device tree nodes.
ACK

> 
>> +
>> +            cci0_i2c0: i2c-bus@0 {
>> +                reg = <0>;
>> +                clock-frequency = <1000000>;
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +            }; 
>> +
>>           camss: isp@ac78000 {
>>               compatible = "qcom,qcs8300-camss";
>>   @@ -5063,6 +5174,198 @@ tlmm: pinctrl@f100000 {
>>               #interrupt-cells = <2>;
>>               wakeup-parent = <&pdc>;
>>   +            cci0_i2c0_default: cci0-0-default-state {
> 
> I'd suggest to rename cciX_i2cY_* to cciX_Y_* to shorten the labels,
> also it will match device tree nodes. Here "i2c" suffix brings no
> valuable information.
> 
> Please reference to lemans.dtsi and sm8550.dtsi examples.
> 
ACK, Will address this in the next version.

>> +                sda-pins {
>> +                    pins = "gpio57";
>> +                    function = "cci_i2c_sda";
>> +                    drive-strength = <2>;
>> +                    bias-pull-up = <2200>; 

-- 
Regards,
Nihal Kumar Gupta


