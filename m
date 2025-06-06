Return-Path: <linux-media+bounces-34252-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A8FAD0341
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 15:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 546531726F2
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 13:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB318289344;
	Fri,  6 Jun 2025 13:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HeKgCYiq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960AF2F2E;
	Fri,  6 Jun 2025 13:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749216780; cv=none; b=XB83UyI+TMyFmpfZfAgYz1FDdfzsc5cLZ87yiAL9Rhd5SPs48O5XWxh6JLZXEXiGi/Jowpi0RgssKI2Uk+w0HfOIZabEBP7r1ZDeE5EkBcKb20eyKu9m7tfZNzGSueItm22OMaguSF1EW+2378zIyy+efdpX49Dd1FcbXkK5DCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749216780; c=relaxed/simple;
	bh=6RuF3Znt+tzQ+CHuQwvoPvsyYVJVvXA7G1mYnBcSznQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bsX64u8Y+bEZR6x/gALOv5YCrOY1yzRRTd2J0AbfPw9ZWFvH7ft9AuKoNIylfTHI+46/kuNFQieiQHSS9eCIYUAe3j4jZDrgPaurAMQF2kE+xnltU4FEFoNMvv83PvsR8xAcH98DMW0YjTzCk71dwcCSIR+qPuxGJ7/M6jMAO6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HeKgCYiq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556AZi9a012803;
	Fri, 6 Jun 2025 13:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Es2qJC6PPNbgqcXhrSCL+dvAJQdmrGgRvfxTwABm56k=; b=HeKgCYiqFouGAnKU
	dQFUmPzWEWl7MX4kY7/Sq99hHU+VUllGwwM7zpGsAW4578gNyc1Op9Ih+8sFUnxj
	LxrMRqZy2bf5iTQPZhYiWu6rOtCQUoBSlNs9u2r3j19063VjToV1U4iKdsoBURSx
	bgzEF/RT9E1on64TMEGL7c2gRoFe8DloR+X2q3gpD85X5BMvbIkm6n9sPStNFocK
	DyIDZHRDtqCMtkOabQSmXOpxgqrNvMAwMreoJgalT9iyiywfIVj3h0azmmcPROO1
	OmctL6hfC3o+uxtmFoiimGFhnXah09+7Dubj0bOgA2xLqeKjC5WmAVxAEgGKCHa7
	DKNJig==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 473nphsqxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 13:32:51 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 556DWoRD025923
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Jun 2025 13:32:50 GMT
Received: from [10.253.79.143] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Jun 2025
 06:32:46 -0700
Message-ID: <d5aee491-3ba2-4beb-8b8f-4ba8372e6d16@quicinc.com>
Date: Fri, 6 Jun 2025 21:32:44 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        "Nicolas
 Dufresne" <nicolas.dufresne@collabora.com>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
 <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
 <5854a587-aba7-4e71-87f8-249ba00cbc59@linaro.org>
 <996c9a39-5520-4b43-adfa-06ce29223ba0@quicinc.com>
 <713b87cb-0003-4ee3-a599-9cd41629bb42@kernel.org>
 <7aa36a0f-6741-40c2-93f4-036823d245fd@quicinc.com>
 <247002c0-ee68-4d0d-857a-768bf68bce75@kernel.org>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <247002c0-ee68-4d0d-857a-768bf68bce75@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ELZWQvtfk4vMVcc4do65dkOWUgD4OYgl
X-Authority-Analysis: v=2.4 cv=N8QpF39B c=1 sm=1 tr=0 ts=6842ee03 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=scSONbXNw8eJHw9vBkAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDEyMiBTYWx0ZWRfX2O+JbySA59j7
 E0P/k6LOqIR/dbtYJ0JEMQP8zzqj6m6s4Lrr6rmI+VRtnFLdBKQ4NNt8i+wOknpDc0zwUqf4skv
 tXUoXMQFHiJ98F2FRKPWobE4PT8JIqnzgk4ZEwZJ/3yxxc3g4+HZanwlmjGCBtIZ+LRIV5hwZij
 sMdb9+VfSvUv78qt8QEW5enhVUWiWQ8ApgEepdms32vG8vWfiRH9A8CiJGwWTInMUZ6f3bQm1kL
 x76Qe6z8wyxM73+YbxIsxlZ7U8I+95xJYR0b7K8WM8IJzBVkp2s8BXncNlH7i0fHwnkTxWPnTem
 e5DaAcy9I8/ILFGv+vVD3cQa8KNWMFon2VHTcwzk3N+8kWUFDaQp2yyTmsE7IokRqfHO4KNQZIH
 E4ELfFKSkFLsM0gm+ryeJdSBDM98vqHtLk5Zdk6J4CE7CIm+nrs7BMBopAIVSNmOYfdc0V+u
X-Proofpoint-GUID: ELZWQvtfk4vMVcc4do65dkOWUgD4OYgl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 mlxscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060122


On 6/6/2025 8:56 PM, Krzysztof Kozlowski wrote:
> On 06/06/2025 14:51, Renjiang Han wrote:
>> On 6/6/2025 8:44 PM, Krzysztof Kozlowski wrote:
>>> On 06/06/2025 14:37, Renjiang Han wrote:
>>>> On 6/5/2025 8:34 PM, Bryan O'Donoghue wrote:
>>>>> On 31/05/2025 01:05, Renjiang Han wrote:
>>>>>>>> Note:
>>>>>>>> This series consist of DT patches and a venus driver patch. The patch
>>>>>>>> 1/3, which is venus driver patch, can be picked independently without
>>>>>>>> having any functional dependency. But patch 2/3 & patch 3/3, which are
>>>>>>>> DT patches, still depend on [1].
>>>>>>> I'd say 2/3 and 3/3 still depend on 1/3, otherwise we can get video
>>>>>>> core
>>>>>>> on QCS615 over(?)clocked.
>>>>>> Agree, so we need to make sure that the driver patch is not picked
>>>>>> after the DT patch.
>>>>> This statement is confusing.
>>>>>
>>>>> 1/3 states that there will be a fallback if there is no OPP table
>>>>> present.
>>>>>
>>>>> Giving the code a glance, I believe that is so, freq_table should be
>>>>> used if there is no OPP specified in the DT.
>>>>>
>>>>> I think we are having a hard time here understanding what you are saying.
>>>>>
>>>>> My understanding:
>>>>>
>>>>> - venus modification is standalone 1/3
>>>>>     Qcs615 will fallback if no OPP is present
>>>>>
>>>>> - dt modification 2/3 3/3 is therefore also independent of driver
>>>>>
>>>>> ---
>>>>> bod
>>>> yes, let me re-spin this with driver patch alone. Once that gets in,
>>>> will bring in the DT patches.
>>> Did you read my feedback? There is no "once that gets in". DTS is an
>>> independent hardware description and your patchset claiming there is
>>> dependency is just broken.
>>>
>>> I am repeating this since few emails, so shall I NAK it that you will
>>> address the main issue you have?
>>>
>>> Best regards,
>>> Krzysztof
>> Hi Krzysztof
>>
>> SC7180 and QCS615 use the same video core. Only difference lies in the
>> freq_table for the video. Freq_table is generally determined at SOC level.
>> The Venus driver does not currently handle freq_table compatibility well
>> across platforms. This patch enables the driver to use the OPP-table from
>> the DT, addressing the frequency compatibility issue.
> This does not resolve the main problem at all. If SW cannot use the
> fallback alone, your fallback has no meaning and is not only confusing
> but actually incorrect. And based on previous statements like
> "overclocking" it is not only incorrect, but even harmful.
>
> Best regards,
> Krzysztof
The fallback is only triggered when there is no OPP table in the DT.
Since the QCS615 DT will include an OPP table, the fallback logic will
not be used.

Also, if the freq from the freq_table and the OPP table are the same,
would it be acceptable to drop the freq_table from the driver?

-- 
Best Regards,
Renjiang


