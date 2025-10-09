Return-Path: <linux-media+bounces-44038-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B67BC73EC
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 04:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81125189FDEC
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 02:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A4961DA60D;
	Thu,  9 Oct 2025 02:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SDxpMq/O"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37A7147C9B;
	Thu,  9 Oct 2025 02:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759978387; cv=none; b=ttVkMGi4pERP17IOnQac+RoFCM4F3ZIc8I8THzOxCRclgvjM910tTRAZk8GPIidy6w9RsdTTA1jLYaj3mhT9vXeRC2Am+S3DRDOCkIfnaAxZWi01slRsi8AHVvSuud/k8JKV+O9S1myTqwIHkCr6uNJCfNq++lmRl+qWjINVsQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759978387; c=relaxed/simple;
	bh=PZkP2iwejsibDir07G4hGghuPvQs2LumiFFkm7qI4Ao=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FY/A0JUWxTSn5cZLg+7n5t3eNLDXN08ZISe9zMpUpLQ1MrPk2CGWYuZiMsHVbwS7yRtCosaWCCsujWeS358aHbiCNOM1CrC+duY5nboIwl2TYtklQi1tDVcVH8FMT2vTBHuF0kPXPmHBqHYW1xlFndPReZhoFANpo3imQsVd7SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SDxpMq/O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5G18004415;
	Thu, 9 Oct 2025 02:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gtfn0roKHYaEpWWdUwjuUbhlnlojITr0mf1GX/TDhOE=; b=SDxpMq/O23qlJwNc
	yu2AlMGFaeTL+dgyTQcp6A3sC99jR4HhLzNqSesc0azLVS3yAVpEwQ/s1fuPGpP4
	4jG4Wkn5W92NoxD4Pwz9V4TmtwMmqqA4i3ZUDFg0EuJ6vqV8IggqHCDjkjZCobp9
	75Mz7gnuGWHtrA5iCpj+XI4hKLz7WD8U2IlyFPU0UhRqACBF0mZOFYdrcDqeutXo
	ZrpeCGtTUKiKguxRi/NIBAZ18AirZiU86V27OvPVMVolNkfC9CFbWO4s+dBUwI/N
	oOqlStUNGqn2LtuuiDnOx0/pb6xUkVog3G5U3iygmy+SLjuvJ7Ed5fU4HdDwWZ1d
	TzHPDQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ks7p2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 02:52:50 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5992qnQT024105
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Oct 2025 02:52:49 GMT
Received: from [10.216.44.193] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 8 Oct
 2025 19:52:44 -0700
Message-ID: <0c0b6491-1def-d055-b689-2bb99f4306df@quicinc.com>
Date: Thu, 9 Oct 2025 08:22:41 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Charan Teja Kalla
	<charan.kalla@oss.qualcomm.com>,
        Bryan O'Donoghue <bod.linux@nxsw.ie>,
        "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Mauro
 Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
 <4a32bbec-2baf-4210-a7c1-1ddcd45d30c8@oss.qualcomm.com>
 <SuwJuCIcLVJwN3YeN1il6tB9wO9OH6bYcnbRpxpuI9Dl7piYLN-hVdnyv0Mal6N-W5pi2aCZI8MxHZDEkoE63A==@protonmail.internalid>
 <4d87d1ca-55b2-426e-aa73-e3fd8c6fe7bd@kernel.org>
 <10a8ccda-4e27-4b06-9a0e-608d6ade5354@nxsw.ie>
 <4cb4a92d-2f20-47c7-881e-aadcc6f83aa0@kernel.org>
 <1516f21e-aee3-42cf-b75e-61142dc9578d@oss.qualcomm.com>
 <9bae595a-597e-46e6-8eb2-44424fe21db6@linaro.org>
 <MMSKAu89Ew7StAeFBV442KfKNzmqbTSQ-maFG35Jr9d8PkUV2L4sx44R2DRevXA8mC45vkA398l2mvVzarZwew==@protonmail.internalid>
 <bcfbf35b-69ed-4f39-8312-6a53123cd898@kernel.org>
 <d46c0335-99d6-469f-a61f-aca4c851f745@kernel.org>
 <GyrcG3qBN7c5C7ajCs3EV81hWvuaVbg64CpzQ-X3d_p6EauoiKxSoG2aOKE21-j12SWFjNDjV-kVSwYYqVm_lQ==@protonmail.internalid>
 <a0dc93ec-e35c-409b-8dfb-1642c92a9f0c@kernel.org>
 <98e6acf8-80d7-4894-b4ce-ce74660722ef@kernel.org>
 <5085c857-f6e8-4faf-b61a-a9ee562ccf06@kernel.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <5085c857-f6e8-4faf-b61a-a9ee562ccf06@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXxqvEwSha6c+s
 tVQH7Uaziht8KROR5d/2vOw0rF9FlLRD+10ENxz9ubmTVwEb3DztoJG27OAmYgXF5lywL4+aFSb
 sqE6U1PS2jnaoLeQkAXELZG0bAeMPVf14rFPYLzb4PbTO/V2uMI/+GuVh/fRhChJ1PPpsPGXyc7
 y1YLSAmA2WmdW19p3xnYEh6krv3QgwqXKGnSGFNghE6ksuz/PHsMWBj7lBgv1OVGPLt+I0nKHTT
 KEYuN/k4JzO9wm0HY6wmRrBnCxF8SpYWA0nx68ZnfbfwtBex8UwcBz1G80dKOYIvcF4lgPvrOI6
 L2LL3iYLnR95CStVPaHh5Ss1P4L02XdcygY48tBy2t0GDk3RnyDNNV1rm31I4s/FA4BNkoOFPxE
 hLy3YAPeob2UUbZSc5jfr6D4NK+tHA==
X-Proofpoint-GUID: sOdZcMY9FRTU-0MvnQewv-pG5vYJFKR7
X-Proofpoint-ORIG-GUID: sOdZcMY9FRTU-0MvnQewv-pG5vYJFKR7
X-Authority-Analysis: v=2.4 cv=SJxPlevH c=1 sm=1 tr=0 ts=68e72382 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=zS5Hj0bcTTPWjRSGFTUA:9 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1011 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121


On 10/9/2025 6:34 AM, Krzysztof Kozlowski wrote:
> On 09/10/2025 09:55, Bryan O'Donoghue wrote:
>> On 09/10/2025 01:47, Krzysztof Kozlowski wrote:
>>>> Maybe it would be possible to also use an inferred FUNCTION_ID somehow
>>>> though TBH I think that's a work-around.
>>> Three months ago I gave you the answer for that - it is inferred by
>>> index on the list.
>>
>> But at least as I understand it, you can have multiple SID entries that 
>> need to map to a FUNCTION_ID which means you need to encode that 
>> inferred indexing in your driver.
> 
> Yes.
> 
>>
>> So you can't have the iommu code just know what to do.. it has to be 
>> driver specific.
> 
> Yes.
> 
>>
>> The iommu description for this platform basically lacks the data that 
>> _should_ be there -> FUNCTION_ID.
> 
> No. The index tells that already.

Hardware1 can have 2 iommus entries for FUNCTION_ID_1, while Hardware2 can have
3 iommus entry. It would be good to keep this info in devicetree, as it is still
hardware specific (function_id is the hardware identifier).
Defaulting the index would imply, the common device driver would need to book
keep the iommus and hardware id in driver for every SOC. Any mismatch in order
in DT and driver table would result in error too.

More importantly, this need to be agreed by IOMMU maintainer to extend the
iommus property.

Regards,
Vikash
> 
>>
>> The rule is that the DT should really describe the hardware right ?
> 
> It already does. Same as I wrote on IRC, DT already has all the
> information. Entry 0 has function ID-foo. Entry 1 has function ID-bar.
> Entry 2 has function ID-bar or whatever.
> 
> Best regards,
> Krzysztof

