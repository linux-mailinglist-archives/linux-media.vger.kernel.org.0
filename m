Return-Path: <linux-media+bounces-36553-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C104FAF14A7
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 13:56:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7005F1C408BC
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 11:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA65A269D17;
	Wed,  2 Jul 2025 11:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QKmBzVRm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99172673B7;
	Wed,  2 Jul 2025 11:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751457354; cv=none; b=LeAqriy2mEjapv35/rfcffxkoUnPlTUKQ514u7WMHtuNRiGoFIZfVSi4G0yapwdUsaYFtSd9/F0U35gBvaluvNHgsFS9XcJJV7mDf3vfUBtUIKATdukdeOeVEEyQo1B1xyQzS3g/BnRp6e67ejuoQLaWzNr/L7oQo84YQoiv674=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751457354; c=relaxed/simple;
	bh=JKG4bTsUc4OMkDkUNEVDnvaZBSVqpkyFWjRSdRDgFyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BDwsyEkL6VHtj8EvjWECu8BfwBormkRzOapqwIjvbFn1drPhJ8l7rr6Y0Ms0H+ramAjE6OSFDerv+pKqKz7kLkziM3qwd09Dd0e+Y3osE+vsIbHf2baFUKVtvgKbRghutk0qZ+FffC3kwyavinx5An9QgjoGaQDCeK+KeL3G+eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QKmBzVRm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5626iHU4002161;
	Wed, 2 Jul 2025 11:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E1kdNW8YYBLwi5EQQTJ4MiR8ojIiKBMr9MuT+dS8cv8=; b=QKmBzVRmzeR9ZZzL
	r4pd+Me1dZhKH3Zl3iY+CKm5mY3+OZwBsOU6lwN+/ZxWC3Rk/B+XnNdxJN2CA8g5
	MxSxPkkBQdTOqLJLqnrohZCMtlEkqTJz453nEu3HKTJHCZc8ungScYfUiyM27+z7
	lo2Wxxvs0MpWMrixTvTenYSVVhBxTv5AL9aw9yzlpjNJ2QdKZrGJDPrTGUYY2KX9
	VjT+cDCpLc2i4j81jheWOO0o9ygAF/7ZauqVLDPW9X2RADp/19//EPqBP3G6leje
	N6kRXdIIYo/TSLFmw9u606PABzwb0zrWjTogmwCd+b+IpQFgLzOdhBsktYUaj6cp
	ihnkOw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcvcqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 11:55:47 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 562BtkT7021000
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 11:55:46 GMT
Received: from [10.50.58.161] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 2 Jul 2025
 04:55:43 -0700
Message-ID: <ae23ebae-3101-4a73-2bbd-0dabb4efaba1@quicinc.com>
Date: Wed, 2 Jul 2025 17:25:29 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 1/5] media: dt-bindings: add non-pixel property in iris
 schema
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <20250627-video_cb-v3-1-51e18c0ffbce@quicinc.com>
 <6fd3fa34-69e1-484f-ad6f-8caa852f1a6c@kernel.org>
 <dc6e82a1-82be-b8b8-31c3-8b85447d4e43@quicinc.com>
 <8b88cea4-b9f2-4365-829c-2a255aed6c69@kernel.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <8b88cea4-b9f2-4365-829c-2a255aed6c69@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KqOVzbqZ97s99M5XHOETyQxTHAWH92jO
X-Proofpoint-ORIG-GUID: KqOVzbqZ97s99M5XHOETyQxTHAWH92jO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA5NyBTYWx0ZWRfX3D/85o0mbvOF
 Oe6pJO1QDxyRPQTUL85VnnXcvsFax3P/a1jT/2HxQLGlBIgV/Jc4uFoiEjIXtj+xmat+oyfR679
 HpNg+M63Q2JUZbXq8DwR762tqOHx/9RfxkMBKNo/LwHTvhW1dq05Zp/OzRjE3gA8oZQB0gN08Ze
 jhe8PLBtP0N4GrDxWx6nouhi+qaXqcioambuFY0BDipavglrTMSnhDJ2W9Ya6QGMEpb/PBBlCJr
 eLKncY7Alg2qMG7vApnIFSzEF6el2kn/4hRYe3V4ZhpJ6tKoWOjymVSwuB3HuX1tS9q4nudliqS
 oBzHh5zcUZd+kPcDuJFT3In4zRgugTYAWehotJsE/lCv0zP1HXeIMkJ8KJqPM0Sb/3Xj1ngjjZD
 p2wdPoHTuBtYx5Ohc1Q7NxYjHdAQbCz62fKV6qRcZJsX8jknzUiISoDbgRHUrlMpsylDb4SX
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=68651e43 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=yYeFI0odNK6BD0YTbn8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020097



On 7/2/2025 5:17 PM, Krzysztof Kozlowski wrote:
> On 02/07/2025 13:45, Vikash Garodia wrote:
>>
>> On 7/2/2025 4:53 PM, Krzysztof Kozlowski wrote:
>>> On 27/06/2025 17:48, Vikash Garodia wrote:
>>>> +
>>>>      video-codec@aa00000 {
>>>>          compatible = "qcom,sm8550-iris";
>>>>          reg = <0x0aa00000 0xf0000>;
>>>> @@ -144,12 +176,16 @@ examples:
>>>>          resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>>>>          reset-names = "bus";
>>>>  
>>>> -        iommus = <&apps_smmu 0x1940 0x0000>,
>>>> -                 <&apps_smmu 0x1947 0x0000>;
>>>> +        iommus = <&apps_smmu 0x1947 0x0000>;
>>>
>>> I missed, that's technically ABI break and nothing in commit msg
>>> explains that. You need to clearly explain the reasons and impact.
>> No, it is not. Interface works well with old or new approach.
> 
> 
> You changed the order of IOMMUs, so yes it is. Which interface works
> well - FreeBSD? Or other? You are changing ABI for every user.
Why do i need to change, when without changing would work as well ?

> 
> Best regards,
> Krzysztof

