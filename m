Return-Path: <linux-media+bounces-34262-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA2BAD0552
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 17:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 672C5189E852
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 15:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60E728B7DE;
	Fri,  6 Jun 2025 15:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nI8u/Ccn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2622B28983D;
	Fri,  6 Jun 2025 15:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749224129; cv=none; b=d+QKtUaP9Z+dNgxlkW/Z+dj4er2fw88uWrASiDIXG31unAApLhggPQvvZHcWl1PxLuyZ7P43nBf7W/kIZVbBSEyEzQuzGYdC5EFzVVDmmRjst451EZvgj/eVe6Z64OYFw7SOjsjOY832Njay0yb9pHrtVvl4RUhw0+xcS6ydebw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749224129; c=relaxed/simple;
	bh=8SY1GsuYfcNx8zwGx+fhS3YamoOR30i4JTZ3TgJntko=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=u9r73jhp+knxCYujG4T8Kp0Bmrz1Nw65weRCBjp0Ruff1VYZEasEjYNRI86j0qJvruiNJdcuFRvdYbNHwktBASRlnxzfFsRWmxCSquBLwrx2B74/hVvYSK88JOjJeN2vy5PDyoykCsonmmiTd8F6siqZcYS4WhKGCQlwp/bCrHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nI8u/Ccn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556F9FT7018079;
	Fri, 6 Jun 2025 15:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IHVYulWU7RDStgIiNys38hXNypv1tVavSEag4eeBhas=; b=nI8u/CcnO4RhT7XI
	sNjdnXGQzSBxPBMPIo9GaLIroCMP1UtJqVeBCqN4CY+RkVb9hWSNzukCKrv/e9Kq
	uj24XvXSxdeNWl96t93wJKk+1zhB/CWJFWDEAOP4pRDoSbxFmCe16Hjis29+Ezgd
	IqbKeLIvJCAK2ni4nnJGEuSDPP8mmRnmKXW4UI6QY0rBusYQs3M6CVH6RUeb60jo
	9PBOID58qRHqDyIe0aaoKe8prP5OxTNKlS2AzWimawoOoiIiNH8ca3INVXCPZ6IS
	c3+GP1bi9nDFqpjqV4+zvudx68MisRKNpdbxEb+HXNGrrw8+AJjNQUNMf4CPA92V
	aVX+Ag==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8qd3nq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 15:35:20 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 556FZJ15001636
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Jun 2025 15:35:19 GMT
Received: from [10.50.32.91] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Jun 2025
 08:35:15 -0700
Message-ID: <265b1625-bf53-ba5d-9dc5-eb2ab78fb822@quicinc.com>
Date: Fri, 6 Jun 2025 21:05:12 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Renjiang Han
	<quic_renjiang@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
CC: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
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
 <d5aee491-3ba2-4beb-8b8f-4ba8372e6d16@quicinc.com>
 <fa6a7983-27bf-40db-9843-0891bdadf523@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <fa6a7983-27bf-40db-9843-0891bdadf523@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sqKJ0bWR7sATR-9H6WTnIX8AJFHNxamg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDEzNyBTYWx0ZWRfX/RtdDxEWRVI1
 kL2t+6YDr++2G34Ofbyxc8X+MNNnjyWb2EZGCrnkPI+Hjk5WpUqjxfxM+Oou/DUtJpOt1txRj0b
 W6rVFmIWjDkt8zYTptRUNH+elBxffavWZl7lC8sRG4IuwPmP0oV2dijSsZAqTAqOSRYYUJAUk66
 Qeek+Jf8HSsVULEGeu9i+63xZAvMoxvfyIN/irFWTJ0tNIPJdYdD4fA5KVOhcaERMrQOe8WSyRs
 S+M+srP1z9BTkyccvtDy2gm1N0Wsf4ilMvhcPWmOzwN+Nd6g1as9VCtb2mXpvsCTdFzWDIUFjn0
 rKTqc07y0G8X8ueBnRWYzrO70DnHDBa4hVVmY8ZQo/ytXGP/GgAImcIhCyaYrpmXqGTvZ3aJCZR
 Zrn9s0b7fG7T0eYZ+UedxEin8IvMmhyyKsU5XlzVjaG/DQ1bKrQiiObEziut9fJhF9JSgiNp
X-Proofpoint-ORIG-GUID: sqKJ0bWR7sATR-9H6WTnIX8AJFHNxamg
X-Authority-Analysis: v=2.4 cv=PrmTbxM3 c=1 sm=1 tr=0 ts=68430ab8 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=3HzSJax5ekaUL6_BMMgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060137


On 6/6/2025 8:23 PM, Bryan O'Donoghue wrote:
> On 06/06/2025 14:32, Renjiang Han wrote:
>>
>> On 6/6/2025 8:56 PM, Krzysztof Kozlowski wrote:
>>> On 06/06/2025 14:51, Renjiang Han wrote:
>>>> On 6/6/2025 8:44 PM, Krzysztof Kozlowski wrote:
>>>>> On 06/06/2025 14:37, Renjiang Han wrote:
>>>>>> On 6/5/2025 8:34 PM, Bryan O'Donoghue wrote:
>>>>>>> On 31/05/2025 01:05, Renjiang Han wrote:
>>>>>>>>>> Note:
>>>>>>>>>> This series consist of DT patches and a venus driver patch. The patch
>>>>>>>>>> 1/3, which is venus driver patch, can be picked independently without
>>>>>>>>>> having any functional dependency. But patch 2/3 & patch 3/3, which are
>>>>>>>>>> DT patches, still depend on [1].
>>>>>>>>> I'd say 2/3 and 3/3 still depend on 1/3, otherwise we can get video
>>>>>>>>> core
>>>>>>>>> on QCS615 over(?)clocked.
>>>>>>>> Agree, so we need to make sure that the driver patch is not picked
>>>>>>>> after the DT patch.
>>>>>>> This statement is confusing.
>>>>>>>
>>>>>>> 1/3 states that there will be a fallback if there is no OPP table
>>>>>>> present.
>>>>>>>
>>>>>>> Giving the code a glance, I believe that is so, freq_table should be
>>>>>>> used if there is no OPP specified in the DT.
>>>>>>>
>>>>>>> I think we are having a hard time here understanding what you are saying.
>>>>>>>
>>>>>>> My understanding:
>>>>>>>
>>>>>>> - venus modification is standalone 1/3
>>>>>>>     Qcs615 will fallback if no OPP is present
>>>>>>>
>>>>>>> - dt modification 2/3 3/3 is therefore also independent of driver
>>>>>>>
>>>>>>> ---
>>>>>>> bod
>>>>>> yes, let me re-spin this with driver patch alone. Once that gets in,
>>>>>> will bring in the DT patches.
>>>>> Did you read my feedback? There is no "once that gets in". DTS is an
>>>>> independent hardware description and your patchset claiming there is
>>>>> dependency is just broken.
>>>>>
>>>>> I am repeating this since few emails, so shall I NAK it that you will
>>>>> address the main issue you have?
>>>>>
>>>>> Best regards,
>>>>> Krzysztof
>>>> Hi Krzysztof
>>>>
>>>> SC7180 and QCS615 use the same video core. Only difference lies in the
>>>> freq_table for the video. Freq_table is generally determined at SOC level.
>>>> The Venus driver does not currently handle freq_table compatibility well
>>>> across platforms. This patch enables the driver to use the OPP-table from
>>>> the DT, addressing the frequency compatibility issue.
>>> This does not resolve the main problem at all. If SW cannot use the
>>> fallback alone, your fallback has no meaning and is not only confusing
>>> but actually incorrect. And based on previous statements like
>>> "overclocking" it is not only incorrect, but even harmful.
>>>
>>> Best regards,
>>> Krzysztof
>> The fallback is only triggered when there is no OPP table in the DT.
>> Since the QCS615 DT will include an OPP table, the fallback logic will
>> not be used.
>>
>> Also, if the freq from the freq_table and the OPP table are the same,
>> would it be acceptable to drop the freq_table from the driver?
> 
> If you drop the freq_table, you will need to apply OPPs for the sc7180 to DTS
> first before venus or you'll break sc7180.
> 
> I think TBH you should add a freq_tbl for QCS615 and make it so the order of
> patch application doesn't matter wrt adding OPP support.
That would my proposal too here. Add the proper table in driver resources for
QCS615, so that either of OPP or fallback would not matter and would be carrying
right values either way(no over clocking).

Regards,
Vikash
> 
> - Add QCS freq_tbl
> - Add OPP support
> 
> Then do whatever in DTS, nothing can break in this case.
> 
> As we've established the fallback isn't a fallback because it falls back to
> wrong data, so lets fix that.
> 
> ---
> bod

