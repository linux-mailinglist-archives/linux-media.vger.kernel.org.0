Return-Path: <linux-media+bounces-22814-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF4B9E78F1
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 20:28:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B810283B86
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2024 19:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6024020456E;
	Fri,  6 Dec 2024 19:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PowscZaj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B451F3D20;
	Fri,  6 Dec 2024 19:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733513294; cv=none; b=Aw5LtQvhUmhl6WQLppqX/ThgogcChg/qxpnxWyIMewAJAuyYk7plmhxViJJasUw5CsxYcSIVnh8vdIBmMg5pbE6NnMz61EMxFbSJyKBy8C3Ga7v4zvJ7H5wZ2ejK2czdbAM56U4jpzFfF2RjSu6Aic24y31QQrDBfUDPjBqTeiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733513294; c=relaxed/simple;
	bh=TBlY7HlJyHGCY6d05PVdDNcxH0MObt3VTaB7iMGwWLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jdWuaFJy3bwKNK7rUnd0HOYR3kQB8CL1TqhyOy7yQiqra02ODiZo0Ufy9+DoOakxkKn96RRtULc3u18RLuFfKPqyitOuR5p3iWFdVgnlisbuwVa5YgSrmcuL2fr6faUhrDmKxe7Eoq/lp/qEpEy42oy6Tb7pISuh5Xw69b8Fo/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PowscZaj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B69bsAG026476;
	Fri, 6 Dec 2024 19:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9fXlyu23uzCV1zvNU4ik8S0jFn//AXqMi8qLmT+ntI0=; b=PowscZaj37khuu0s
	62HBbUIBT0ODKF3uddT5hn/mzNSqKQgiHT5KCrjXcQ4hCsOdSDZCMTRcPr08Vh9V
	0P0Lwy6hi6ULdU2hMf1IfW0bG6LRvs7J1gbH2j17MGa+kMHFDULyEl8HB6+fy0sP
	mYqZdAaEi0QM9w056bu4FzYF7N8DuUa9bwm5I1IjWyguEz7lhiaAQI1rxAbNmJav
	YJxrE1+0YK/sodIsbmTTD/x2NiEXnouP3AD2fFN7NhoRMAWQpHzUAjZaA25FTTgB
	qblC4kV175VvMmVqz4sgk0lBVCO5BZLjAhV/65QUxVhjPQydkAVGv8uvV+zAgDKN
	HwL9lQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bxtc9h4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 19:28:04 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B6JS24q028092
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 19:28:03 GMT
Received: from [10.50.60.239] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Dec 2024
 11:27:54 -0800
Message-ID: <106b1945-e288-4522-8567-90cadcbc9148@quicinc.com>
Date: Sat, 7 Dec 2024 00:57:50 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] arm64: dts: qcom: sc7280: Add support for camss
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <akapatra@quicinc.com>, <hariramp@quicinc.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20241204100003.300123-1-quic_vikramsa@quicinc.com>
 <20241204100003.300123-5-quic_vikramsa@quicinc.com>
 <e586b76f-50a7-47cc-9ce6-a37f9b53262f@oss.qualcomm.com>
Content-Language: en-US
From: Vikram Sharma <quic_vikramsa@quicinc.com>
In-Reply-To: <e586b76f-50a7-47cc-9ce6-a37f9b53262f@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wNoMre80uxiPQiEvO5v_7Teu6WAOSpeU
X-Proofpoint-ORIG-GUID: wNoMre80uxiPQiEvO5v_7Teu6WAOSpeU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 impostorscore=0 phishscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060145


On 12/5/2024 9:58 PM, Konrad Dybcio wrote:
> On 4.12.2024 11:00 AM, Vikram Sharma wrote:
>> Add changes to support the camera subsystem on the SC7280.
>>
>> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
>> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>> ---
> [...]
>
> (isp@ as mentioned)
Hi Konrad,

Thanks for your review and comments.
I have posted V8 addressing these comments.

Best Regards,
Vikram

>
>> +			interconnects = <&gem_noc  MASTER_APPSS_PROC 0 &cnoc2 SLAVE_CAMERA_CFG 0>,
> QCOM_ICC_TAG_ACTIVE_ONLY
>
>> +					<&mmss_noc MASTER_CAMNOC_HF  0 &mc_virt SLAVE_EBI1     0>;
> QCOM_ICC_TAG_ALWAYS
>
>> +			interconnect-names = "ahb", "hf_0";
>> +
>> +			iommus = <&apps_smmu 0x800 0x4e0>;
>> +
>> +			power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
>> +					<&camcc CAM_CC_IFE_1_GDSC>,
>> +					<&camcc CAM_CC_IFE_2_GDSC>,
>> +					<&camcc CAM_CC_TITAN_TOP_GDSC>;
>> +			power-domain-names = "ife0", "ife1", "ife2", "top";
> vertical list, please
>
> Konrad

