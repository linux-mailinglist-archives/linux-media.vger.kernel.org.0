Return-Path: <linux-media+bounces-34285-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA96EAD0AFC
	for <lists+linux-media@lfdr.de>; Sat,  7 Jun 2025 04:31:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9518516EBE4
	for <lists+linux-media@lfdr.de>; Sat,  7 Jun 2025 02:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F435258CF2;
	Sat,  7 Jun 2025 02:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BiYoetnB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEDC8F6B;
	Sat,  7 Jun 2025 02:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749263487; cv=none; b=A6vLKEl3UX61uTkFAN9e8PwS8xyXHyLoWvw3Nr8Z8+WkAjhxvD2O1ankAZHOMn9X3Ln/69OOh5m3dN8oMPMvMWM70ryNFzGtE9MjDLKGCjRnSlNZCMYARczQfgw++sUdabxW780GSlvtcQl8zLzP4UCzSj9z48dt97cQxHo8cQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749263487; c=relaxed/simple;
	bh=WvX2Aivnre+CVC5o3Q/NVsvi810WLuAjSmUK63Fw5X8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EE9i/fNjWQKchRqDV8DkQt8bLUvxYiwfKBn16MEfrI+rn8PbHJplZlDlPQPCafQ9RsiwB9Jt94LnLXPBotCp1n3mBXun4C6CDimngOFA44c5SohJwvGz9MOUEt3dxREAdV8KCBfAAFA1UnQJs5KTC1L8PI4C02Y7IuRHykKaCLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BiYoetnB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5570gtOF010851;
	Sat, 7 Jun 2025 02:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mY9K+cFQ+u4HX575bPhCl1tPvcqdQwBiOJVIu5uMKOQ=; b=BiYoetnBF/pL5UL3
	teOq7qUHN59ALK5I49cBRoS5zyBbGyTq9zRE3Oid0bDZ6cKrsyuNHdO3Gxp8g9k7
	7ZYIol90RyCqtrzfdPXwO7j2NimInPJTZDdUhn2y5f0bt0wvR9uwTEPEOwhzWkGV
	zy5zDY+H98X7I0IfF6eMeAkhU9Gw7xZav70UIYMJWX5R46RhDjt8FFAKY/cGOY/p
	ZLwUK1kcbMAFVys9IuSZXHwZ+H1XDeUtseS80iKdyDsqA15TD+Ta34t4/BZmj123
	4166oagmX/iEeN/v6RzDS/5+CBG62SKpCtPG3x/5VYh/iZFNLPsRx1Vq76YTDrMs
	jrdzwg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474b4j03t4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Jun 2025 02:31:20 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5572VJ71007682
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 7 Jun 2025 02:31:19 GMT
Received: from [10.253.74.9] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Jun 2025
 19:31:14 -0700
Message-ID: <4ca3d1a6-4895-489a-87be-f883a001bc7c@quicinc.com>
Date: Sat, 7 Jun 2025 10:31:03 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
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
 <d5aee491-3ba2-4beb-8b8f-4ba8372e6d16@quicinc.com>
 <fa6a7983-27bf-40db-9843-0891bdadf523@linaro.org>
 <a258433f-f1da-4be7-a0af-645571aab871@oss.qualcomm.com>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <a258433f-f1da-4be7-a0af-645571aab871@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDAxNiBTYWx0ZWRfXxd8X/olsykxl
 2hESCMc97hfnjr0th8brjLYWEgcBU6UzhoIsYVpMmYAllCnAPXEu1mbJB2UuhlWlty0gdyMAUQV
 t+KZt8IKICLi62xPCcbO31AKkt2glijKTCy51nCPd6JEAsqsRfmYeUtUZ5g1lBdStpdnlFtpB06
 LvzU4T8+mU+8fnllpUpMWcgfLON2yGpPM2SKDLc3Vi64yfOtC+HnxkM06xAVSfTkY/cJ8cwHlEQ
 HzcM798+Bp+cYrq4Xkf8aK11fzWjbprq8q2s95NNHGGVSixt4jwX4qdXwl0lcPPQdgZMszPIyDC
 jfW8vkg3LXhtI68gDHiDL5D/IWa6/ssaMUa9tGCUpIUJi2HnIv8rBl3S9Ve3oZyG6osa6g93WjB
 bbMfXswU/ibDl4kNI80VOFxBhbbht9GoPbm3sKmARH+p6zkhRY+GEQ0M8yz16pFG8yOHZtQA
X-Proofpoint-GUID: Tz--MDi53MPffG3LLh7lFQfL2Ex9kM_o
X-Authority-Analysis: v=2.4 cv=Te6WtQQh c=1 sm=1 tr=0 ts=6843a478 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=QE5w7mNmil-R1KNRMYYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Tz--MDi53MPffG3LLh7lFQfL2Ex9kM_o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070016


On 6/7/2025 10:13 AM, Dmitry Baryshkov wrote:
> On 06/06/2025 15:53, Bryan O'Donoghue wrote:
>> On 06/06/2025 14:32, Renjiang Han wrote:
>>>
>>> On 6/6/2025 8:56 PM, Krzysztof Kozlowski wrote:
>>>> On 06/06/2025 14:51, Renjiang Han wrote:
>>>>> On 6/6/2025 8:44 PM, Krzysztof Kozlowski wrote:
>>>>>> On 06/06/2025 14:37, Renjiang Han wrote:
>>>>>>> On 6/5/2025 8:34 PM, Bryan O'Donoghue wrote:
>>>>>>>> On 31/05/2025 01:05, Renjiang Han wrote:
>>>>>>>>>>> Note:
>>>>>>>>>>> This series consist of DT patches and a venus driver patch. 
>>>>>>>>>>> The patch
>>>>>>>>>>> 1/3, which is venus driver patch, can be picked 
>>>>>>>>>>> independently without
>>>>>>>>>>> having any functional dependency. But patch 2/3 & patch 3/3, 
>>>>>>>>>>> which are
>>>>>>>>>>> DT patches, still depend on [1].
>>>>>>>>>> I'd say 2/3 and 3/3 still depend on 1/3, otherwise we can get 
>>>>>>>>>> video
>>>>>>>>>> core
>>>>>>>>>> on QCS615 over(?)clocked.
>>>>>>>>> Agree, so we need to make sure that the driver patch is not 
>>>>>>>>> picked
>>>>>>>>> after the DT patch.
>>>>>>>> This statement is confusing.
>>>>>>>>
>>>>>>>> 1/3 states that there will be a fallback if there is no OPP table
>>>>>>>> present.
>>>>>>>>
>>>>>>>> Giving the code a glance, I believe that is so, freq_table 
>>>>>>>> should be
>>>>>>>> used if there is no OPP specified in the DT.
>>>>>>>>
>>>>>>>> I think we are having a hard time here understanding what you 
>>>>>>>> are saying.
>>>>>>>>
>>>>>>>> My understanding:
>>>>>>>>
>>>>>>>> - venus modification is standalone 1/3
>>>>>>>>     Qcs615 will fallback if no OPP is present
>>>>>>>>
>>>>>>>> - dt modification 2/3 3/3 is therefore also independent of driver
>>>>>>>>
>>>>>>>> ---
>>>>>>>> bod
>>>>>>> yes, let me re-spin this with driver patch alone. Once that gets 
>>>>>>> in,
>>>>>>> will bring in the DT patches.
>>>>>> Did you read my feedback? There is no "once that gets in". DTS is an
>>>>>> independent hardware description and your patchset claiming there is
>>>>>> dependency is just broken.
>>>>>>
>>>>>> I am repeating this since few emails, so shall I NAK it that you 
>>>>>> will
>>>>>> address the main issue you have?
>>>>>>
>>>>>> Best regards,
>>>>>> Krzysztof
>>>>> Hi Krzysztof
>>>>>
>>>>> SC7180 and QCS615 use the same video core. Only difference lies in 
>>>>> the
>>>>> freq_table for the video. Freq_table is generally determined at 
>>>>> SOC level.
>>>>> The Venus driver does not currently handle freq_table 
>>>>> compatibility well
>>>>> across platforms. This patch enables the driver to use the 
>>>>> OPP-table from
>>>>> the DT, addressing the frequency compatibility issue.
>>>> This does not resolve the main problem at all. If SW cannot use the
>>>> fallback alone, your fallback has no meaning and is not only confusing
>>>> but actually incorrect. And based on previous statements like
>>>> "overclocking" it is not only incorrect, but even harmful.
>>>>
>>>> Best regards,
>>>> Krzysztof
>>> The fallback is only triggered when there is no OPP table in the DT.
>>> Since the QCS615 DT will include an OPP table, the fallback logic will
>>> not be used.
>>>
>>> Also, if the freq from the freq_table and the OPP table are the same,
>>> would it be acceptable to drop the freq_table from the driver?
>
> No, it's not acceptable, because then you'll break support for old 
> DTs, which is a no-go.
>
>>
>> If you drop the freq_table, you will need to apply OPPs for the 
>> sc7180 to DTS first before venus or you'll break sc7180.
>>
>> I think TBH you should add a freq_tbl for QCS615 and make it so the 
>> order of patch application doesn't matter wrt adding OPP support.
>
> That would require adding board data for QCS615, which definitely 
> doesn't look like a good solution. It is _exactly_ the same as SC7180. 
> I'm against duplicating it just for the sake of having freq_tbl.
>
>>
>> - Add QCS freq_tbl
>> - Add OPP support
>>
>> Then do whatever in DTS, nothing can break in this case.
>>
>> As we've established the fallback isn't a fallback because it falls 
>> back to wrong data, so lets fix that.
>
> Why isn't it a fallback? With the driver changes in place, the 
> fallback is totally correct.
Agree.
Also, currently, both the freq_table and the opp-table are present
in the driver and DT code, and their frequency values are identical.
This driver patch is simply switching the frequency source from freq_table
to opp-table.
Therefore, I think this patch is an enhancement to the driver's
functionality and can be submitted independently, as it is not part of any
specific project.

-- 
Best Regards,
Renjiang


