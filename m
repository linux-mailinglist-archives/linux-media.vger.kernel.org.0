Return-Path: <linux-media+bounces-31833-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0443AAC0C4
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 12:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFFAA3A8F4F
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 10:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C0F27703C;
	Tue,  6 May 2025 10:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OePdelaL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD6B26560B;
	Tue,  6 May 2025 10:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746525826; cv=none; b=tlM5C4+VdW9t+e9SWsSStY3P7ThdSbl6stYg7eo+v0uysBNyowbCyuhpgVh2VUobqbW2nU1CihFAMtgqe7Y72nZofuoi+yMdUWJXZZsYSNkQn6WmBr329ifBHtQsh9JHP2a/L/w8lgPu/rJ281GsUIDKHfjNhr/xFhYl7GVoeDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746525826; c=relaxed/simple;
	bh=4JKKox/gkNup5/ZUjddwfEl3PWXPEEdg4i1CKPn9FS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Q2WccBIlcJRCxRmWhJWTXddCPoI8yvKsE9vLgTfzTlNgaVSx2bwbqkoKSp3b8GE6kS1VhGyydrKOUooqcMWnmTYPmRjta7zfs44V60ii9QYafH2KGoAzsSGpTN2mXOpupxAdthljNdU5OQOp39b51HqZ/P2UBsv87DrJufMELP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OePdelaL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5468t4Fn024870;
	Tue, 6 May 2025 10:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4NczKeVkfrsG4oocFhRG8smHteaY3Yg3Jf/r6vK27jI=; b=OePdelaLB7ev/2ZM
	dZypRBOK2Y1qr9M4dO/vdn5CWzs45+dOLMfJnjd+GuwvdvRvtkpVLZ9UOWMSJBFm
	0L4OdnrMaM/T3w6Y3JF1n0Z1SCk7AOAUjICyD/EEg9b7aha/bxsQUF7EYOehdhjS
	VRlYNVvbdNHchXDlCsGP7aYk5+NLruAIUeofZf3PAvKyXjK8oZRWtw15JioCzjOh
	v0OGAcvQ8XqIgFS4bWdtx9JobJr9FIMShpBdJueXAy4KA/lfZ0ZqI/NhUROS3Hby
	k/ToTI3qlVZBqslAzfKWlFWXTMv7tLvUm8WI/a2R1iNoWnkf29je5xj0GVHvDmoj
	5DTDkw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5uustbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 10:03:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 546A3cTT017805
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 May 2025 10:03:38 GMT
Received: from [10.50.35.75] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 6 May 2025
 03:03:31 -0700
Message-ID: <f15280a5-deba-89b0-5a0f-f4e3adb562c3@quicinc.com>
Date: Tue, 6 May 2025 15:33:28 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 05/23] media: iris: Prevent HFI queue writes when core
 is in deinit state
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        "Hans
 Verkuil" <hverkuil@xs4all.nl>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>,
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>,
        <stable@vger.kernel.org>
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
 <20250502-qcom-iris-hevc-vp9-v3-5-552158a10a7d@quicinc.com>
 <250cdec3-1437-4c45-aab1-0428218b9437@linaro.org>
 <afd7c1c7-dade-4343-8e2f-1eea0e403c9c@oss.qualcomm.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <afd7c1c7-dade-4343-8e2f-1eea0e403c9c@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=L9cdQ/T8 c=1 sm=1 tr=0 ts=6819de7b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=G9j-nl7CaHHCvT6p390A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10
X-Proofpoint-GUID: qz1itZ5mVduT5oRTuYApYoXaLwQoErqJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDA5NiBTYWx0ZWRfX+TR7AVFTgml6
 Kxu1si14wvtPftTfIFrdtUdFvgBhJZtcduN3rkePcH+HFyrB5KwdZouuI1PXn+3ptWtG9WP8eMf
 dqz/um1goWrIKoxK8RIKrKaks0BTw0jRQYNfPtiKGhH27coi8Xq5qopwGaAojDR34qWne3FWUVq
 wnEqcKUV2emnvIQ9tHu9cadDKq3pZPisvuBicEhre/2JXSBZVYKf8AyYvWuwMR+DOZ68oglC9YC
 nypkoOwsGhjBbEe6xlVAPekVuUjZZhiugTBD4xC5ahiQcdpD5lXikJvbeiHAoaa7XL8q65Ttny7
 k7s+jdCL8iHttBbD1aXq0C0s6gIZYCnpKuKx502UJ7H1Ef1Y237iZLXETYdNqLKUczmCQD2IhMT
 N+B4vVHgV2qIZJVuMzsbg4CmJkh3orinhS+H9kB9i4VqwwMvqceDlNa63e9fbIBQqqadAHY/
X-Proofpoint-ORIG-GUID: qz1itZ5mVduT5oRTuYApYoXaLwQoErqJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_04,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999 spamscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060096



On 5/2/2025 7:24 PM, Konrad Dybcio wrote:
> On 5/2/25 2:22 PM, Bryan O'Donoghue wrote:
>> On 01/05/2025 20:13, Dikshita Agarwal wrote:
>>> -    if (core->state == IRIS_CORE_ERROR)
>>> +    if (core->state == IRIS_CORE_ERROR || core->state == IRIS_CORE_DEINIT)
>>>           return -EINVAL;
>>
>> Instead of checking for 2/3 of the states why not just check for the 1/3 ?
>>
>> enum iris_core_state {
>>         IRIS_CORE_DEINIT,
>>         IRIS_CORE_INIT,
>>         IRIS_CORE_ERROR,
>> };
>>
>> if (core->state != IRIS_CORE_INIT)
>>     return -EINVAL;
>>
>> Cleaner and more explicit - declaring the state you must be in, as opposed to a list of states you should not be in.
> 
> Being explicit in state machines helps maintainability - if we get
> e.g. IRIS_CORE_LIGHT_SLEEP down the line, this could easily fail
> 
Agree, would prefer to keep the check as is
if (core->state == IRIS_CORE_ERROR || core->state == IRIS_CORE_DEINIT)

Thanks,
Dikshita

> Konrad

