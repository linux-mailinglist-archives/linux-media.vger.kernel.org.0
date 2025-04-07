Return-Path: <linux-media+bounces-29487-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FB1A7DADB
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 12:15:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A3F73AAFDC
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 10:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 737E6230BDA;
	Mon,  7 Apr 2025 10:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="drjT/U5b"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA3D2E628;
	Mon,  7 Apr 2025 10:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744020946; cv=none; b=JnPWYkJVS4mVBZ93H61A92N+PLr9J/Pabh08yuUKsbPSUR3Bf6BrfngDCGXXolcO2ooPC4g4s+bp2PcX/Mbw1oKgshXp8AJw50ow9TpxsxIPE9b64d603uz8E62zujJ0ssg6SrlgGP6g49S2zWX1EO3R+uFalQ64rtUuSqmCux8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744020946; c=relaxed/simple;
	bh=9eS9ezE6nh3MaPNTOipDBVMFwr7xraog6zifkWPaG7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oQgMjEVSvh2CnNVftkGqdm+Jaz3bRPrjsTjaFvjkFVyDSWhh9FmRY5/O3S8o5Bn04kLXocliNDmK23dviI194GOhwCW7bREFsn//P64nCtjZUKp3LuR8Pe8ojxIpmu+p+HQq1Je3VECtSnuxiYTACYLGrv1HvfhxQ+ojTEZ67ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=drjT/U5b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dkMn022387;
	Mon, 7 Apr 2025 10:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cC7dQ/4Rpl+FzxIxIIoDZjdcvC0HIZnYG6XWQRhxNQM=; b=drjT/U5bgEZiythJ
	T6Zea4PTqEsPwW4sCnbXGTiwAaJI6hGY+BeN6ggqyh/yEu8w2/OPe91S3Ra3Kx8Q
	QKFdoDl3+XDhOE0XWDEkEySzl+K+pSuUUK6WSLEbFNFsoxFPHr7JpTx/pHd28LGb
	MzFbU7L+p3MQpmK/9v6tXVBPl1yllhbha+2tVxKT4zbwIENVOE2lnCng7wjACRKs
	BfIiVxLYrJOz9qVSMKcMEnYVXgWp6pu7JWWsQ3kG3wggW94NhEFr9CW+5eI6jXJo
	K0tSxKMZ25/O0LOAzwbqc5t3PxV05rQje0vRVnNTg38KsTrThAnRrdI5GYx+JGYC
	jrj7yg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrbvug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 10:15:39 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 537AFcU2019519
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Apr 2025 10:15:38 GMT
Received: from [10.64.69.186] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 7 Apr 2025
 03:15:36 -0700
Message-ID: <84fd283a-ca87-4689-8955-855f7275d6d1@quicinc.com>
Date: Mon, 7 Apr 2025 18:15:18 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] media: qcom: camss: Add sa8775p camss TPG support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss
	<rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20250211-sa8775p_tpg-v1-0-3f76c5f8431f@quicinc.com>
 <012b0381-a5d1-49bc-aa59-aae0d35aa034@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
In-Reply-To: <012b0381-a5d1-49bc-aa59-aae0d35aa034@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oHsdj4GrodkDQnrDNYRqnzt2c2VBHhz8
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f3a5cc cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=yDHa7VgQrPWfl1kdwn4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: oHsdj4GrodkDQnrDNYRqnzt2c2VBHhz8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 clxscore=1011 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070073

On 2025/2/11 18:19, Bryan O'Donoghue wrote:
> On 11/02/2025 10:07, Wenmeng Liu wrote:
>> SA8775P is a Qualcomm SoC. This series adds driver changes to
>> bring up the TPG interfaces in SA8775P.
>>
>> We have tested this on qcs9100-ride board with 'Test Pattern Generator'.
>> Unlike CSID TPG, this TPG can be seen as a combination of CSIPHY and 
>> sensor.
>>
>> Tested with following commands:
>> - media-ctl --reset
>> - v4l2-ctl -d /dev/v4l-subdev0 -c test_pattern=0
>> - media-ctl -V '"msm_tpg0":0[fmt:SRGGB10/4608x2592 field:none]'
>> - media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4608x2592 field:none]'
>> - media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4608x2592 field:none]'
>> - media-ctl -l '"msm_tpg0":1->"msm_csid0":0[1]'
>> - media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>> - v4l2-ctl -d /dev/v4l-subdev0 -c test_pattern=9
>> - yavta -B capture-mplane -n 5 -f SRGGB10P -s 4608x2592 /dev/video0
>>    --capture=7
>>
>> Used following tools for the sanity check of these changes.
>>
>> - make -j32 W=1
>> - ./scripts/checkpatch.pl
>>
>> ---
>> This patch series depends on patch series:
>> https://lore.kernel.org/linux-media/20250210162843.609337-1-quic_vikramsa@quicinc.com/
>> ---
>>
>> ---
>> Wenmeng Liu (3):
>>        media: qcom: camss: Add support for TPG common
>>        media: qcom: camss: Add link support for TPG common
>>        media: qcom: camss: tpg: Add TPG support for SA8775P
>>
>>   drivers/media/platform/qcom/camss/Makefile         |   2 +
>>   drivers/media/platform/qcom/camss/camss-csid-690.c |  15 +
>>   drivers/media/platform/qcom/camss/camss-csid.c     |  44 +-
>>   drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 245 +++++++
>>   drivers/media/platform/qcom/camss/camss-tpg.c      | 737 
>> +++++++++++++++++++++
>>   drivers/media/platform/qcom/camss/camss-tpg.h      | 130 ++++
>>   drivers/media/platform/qcom/camss/camss.c          | 113 ++++
>>   drivers/media/platform/qcom/camss/camss.h          |   5 +
>>   8 files changed, 1282 insertions(+), 9 deletions(-)
>> ---
>> base-commit: c1696380f08cf7cc68560a11f2e8c51cb24aa7ba
>> change-id: 20250211-sa8775p_tpg-7de227a82eb4
>>
>> Best regards,
> 
> Great to see this work.
> 
> I think the TPG should be another type of PHY.
> 
> ---
> bod

Hi bryan,

Do you mean to handle TPG like CSIPHY and embed it into the CSIPHY driver?

thanks
Wenmeng

