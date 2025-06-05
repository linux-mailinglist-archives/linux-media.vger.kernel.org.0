Return-Path: <linux-media+bounces-34111-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9546FACEE82
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 13:25:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 510EA1726B1
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 11:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4763E1F9F73;
	Thu,  5 Jun 2025 11:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b3s77L/o"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F8819E971;
	Thu,  5 Jun 2025 11:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749122709; cv=none; b=fz0+WIivrTwQ7vaQK58WhEUbvJAAOKJ+GR0aJAuEY8aQlzPbKFanYbf/QdAMsVUulTBdSWJGGDFJN0nb9APmS1qrgh8TTp1dlUitYJyUtB+cs6miMT8W0Mdnkb33/NKooq3IDqV2Dmt8E2SYhLZesywZuLK2YI8zqcGD2r4Kqk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749122709; c=relaxed/simple;
	bh=DpwVve9/0dG2uJ931UA1JbFVqhsw/zGBo0gOoDwj/+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qRT68E1LDrQZjqBWt9Jyk4FUupuWgWRnHk6ejCRZhqmPbsB5AmHSg5/JAjZJDpZiA8AIdZNXLXqjkCokdgkn12UiSW/3Dzr45EmJOPpNMheEfhuA0jHYGiLXEJns3pywuYpmdt9KZlbH+zPN/h0P5Rr5kpv+k6X3a5mdGb8hcnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b3s77L/o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5559f4kL012952;
	Thu, 5 Jun 2025 11:25:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DvbUUn1Orowm9QsrTQ7p9lFDHYwo9TUHwLS8Rj818Cc=; b=b3s77L/oa28wQVRy
	r+rHEjZPIj+FdhGquhF4aiPoSEWnVfxQ8LFr2UAv0k5JUS0MfCC84V7lP0v6as0m
	mkkSfS+LY6y7a0+kBlpVS8QR/goMde5xxguIcmajzdmgSE2hWDpxbSTBmw46VUOm
	NB+MtazyY4ymBCost36nP5Qa/WtyXcmpnBiVW2pyQuz0BL6HJqrcpcU7vJItm+Fo
	gXBKbiwqjSp2o9Bx9/UFBpAcFWzm0D+/E/mvSmXfVp6ijqyTgo9ZJ7914kdMggQ/
	z5KcykvhPpynq7YhTns7LSl1wy5Vz/MsGluUDbQ6PxkqoGR49JTSnYc/vZNGF6/C
	f5q2jQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47202wer5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jun 2025 11:25:02 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 555BP1cj030589
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Jun 2025 11:25:01 GMT
Received: from [10.231.216.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Jun 2025
 04:24:58 -0700
Message-ID: <903b0a04-f905-4a9f-b637-b146495988ea@quicinc.com>
Date: Thu, 5 Jun 2025 19:24:55 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
 <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
 <t6niql4jfotjnbducypwxkdjqt3or7k3rwmltvbhifmpphsiwy@er56ey4v2pzo>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <t6niql4jfotjnbducypwxkdjqt3or7k3rwmltvbhifmpphsiwy@er56ey4v2pzo>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: EIgdq4tmk_lkUKsfJz3t-P5peaQRfi_b
X-Proofpoint-GUID: EIgdq4tmk_lkUKsfJz3t-P5peaQRfi_b
X-Authority-Analysis: v=2.4 cv=Y/D4sgeN c=1 sm=1 tr=0 ts=68417e8f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=QPrIUxWvUZqGCaUyt4cA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDA5OSBTYWx0ZWRfX37eRkBBlMp10
 IxA5+hndJc23VphHkrE1aDGGZ5EIKSukx1o+at30sDpzWF7hYd17sPQMe8wYnBu0Cw0Zrct8P2C
 70bMWbn2riUws8WshI6FaRNjZ3/d3pSkkvJinuiDj/Wj95R9Tb1Cr6taCo7tA86UjduRc/qBkVV
 BOip3QdNJN5O0kQUYIS08IpvgkZzceQpCrZIbStOEut3fNjS//UlYgxVJjcTZQcO0LSPeJJQu8C
 RD1Lx/YK6qFLTcKrp6tNRqiper20tj98jqzF0GqHdMq9U+5lgln0G8TZecfi1bWxLy8T3Ts6Uzu
 3D399+6SROIFIRdhtRNAoyee9ZCKRM30FyyJqepdeXGDHyUOLl2qxkxhnXnFodZPC09q57/0xd8
 FFmqdngln7qBlENemeRBnGDfiVDALenaI+SUrMd23Zm6IIXt2MmL50RcprUY+Jugh/qyYco1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 mlxlogscore=394 malwarescore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050099


On 6/2/2025 2:16 PM, Dmitry Baryshkov wrote:
> On Sat, May 31, 2025 at 08:05:24AM +0800, Renjiang Han wrote:
>> On 5/31/2025 4:27 AM, Dmitry Baryshkov wrote:
>>> On Fri, May 30, 2025 at 09:32:12AM +0530, Renjiang Han wrote:
>>>> QCS615 uses the same video core as SC7180, so reuse the same resource
>>>> data of SC7180 for QCS615 to enable video functionality.
>>>>
>>>> There are no resources for the video-decoder and video-encoder nodes
>>>> in the device tree, so remove these two nodes from the device tree. In
>>>> addition, to ensure that the video codec functions properly, use [3]
>>>> to add encoder and decoder node entries in the venus driver.
>>>>
>>>> Validated this series on QCS615 and SC7180.
>>>>
>>>> Note:
>>>> This series consist of DT patches and a venus driver patch. The patch
>>>> 1/3, which is venus driver patch, can be picked independently without
>>>> having any functional dependency. But patch 2/3 & patch 3/3, which are
>>>> DT patches, still depend on [1].
>>> I'd say 2/3 and 3/3 still depend on 1/3, otherwise we can get video core
>>> on QCS615 over(?)clocked.
>> Agree, so we need to make sure that the driver patch is not picked after the
>> DT patch.
> Worse: we need to make sure that the driver patch is present in the
> branch which picks up DT patches. Otherwise building & testing that
> branch (which is not unfrequent when doing git bisect) will fail.
>
> The easiest way to ensure that is to merge driver changes in v6.N and
> then DT changes in v6.N+1.
Yes, now DT patches are pending videocc DT patch. I think the
venus driver patch will likely be picked no later than the DT patches.

-- 
Best Regards,
Renjiang


