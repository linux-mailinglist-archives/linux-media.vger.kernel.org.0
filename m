Return-Path: <linux-media+bounces-39857-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C39B25A7B
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 06:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A09D02A7D53
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 04:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D6411FE47C;
	Thu, 14 Aug 2025 04:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="R9egz5S4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A9B79FE;
	Thu, 14 Aug 2025 04:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755145602; cv=none; b=AG3pcD7ifOSpiAg+/1Kx3N4naqJIBl+HhBV1AxCsUrFSYy9e/0DkIXod5bi13AVr7EeWcg6gD3SJO33/S1clwk5wR7PNDhvD+v5boEx0zGnwae4IsaPNGGPrkTdO9sAZ3tqtDwEc/wCbfo5DzyPfsqPbdjh4iY69oNmpWlfob58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755145602; c=relaxed/simple;
	bh=sBLUNb42w2jz2ZlgBmIQXwpPBdBWdvuXUkbV2elogYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QxbzrdGMiPZsWD5zlvKXfnhJ8lS9qD5Ll2fNwAZh1OaP072GaZrukOVRx6adNYgIMKlgZr8y7grZ8+juKgicCdc7gOkf8TDjkG6hshDzuKdDZPKwOMy6rZTfXjLr70dFfFj0pNR93resvR5X0n7RRfEYLEhmfLiOy9c1/Mk33CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=R9egz5S4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DN2rCR031245;
	Thu, 14 Aug 2025 04:26:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7DzY+zh6d6AHtlLEfK3xL+SfU30o5/x7or790c7+rfM=; b=R9egz5S4Nhd1pwuL
	mHgBh2XGXfMTtNBv0ObZq8ZpMYfsy1YEr4JlyE0Evrrh6TEWEjxWDbA6Uzmf7S2e
	X3NPpxvVD4I3uR1hSjUkvKUF1OahIOVM1AvZfcggQWs7D3A+K72dYwTNP9/PmZO/
	cDHtoj2ogkK8o+5x8KY/oV1WDm5DwT3b9F3noD7GK9M5O5ipUwvrq/CdysqivOwz
	KlfhMYuvqmRA0ktMW0yxlXxndNWEs4AkA1IP1vqTeXgnycd6lKTjCpbBAqGIsJoe
	A/GKZ3lXvhlOJ8tG0k9/0a1aa4shEL/HqU4dNrzDoGEaKSPScUwpmD0zDssf+he9
	bq7QiQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vs4sy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 04:26:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57E4QIs5024490
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 04:26:18 GMT
Received: from [10.50.36.96] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 13 Aug
 2025 21:26:13 -0700
Message-ID: <04b34250-520e-6320-bfcf-4dbb4ea0c523@quicinc.com>
Date: Thu, 14 Aug 2025 09:56:10 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/3] media: dt-bindings: qcom,sm8550-iris: Add SM8750
 video codec
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250804-sm8750-iris-v2-0-6d78407f8078@linaro.org>
 <20250804-sm8750-iris-v2-1-6d78407f8078@linaro.org>
 <683024c7-3740-cb9a-6924-33816edd63f3@quicinc.com>
 <8d8dcaef-eb96-4e7b-9a0a-8b3836cb284c@kernel.org>
 <e33a22ba-f82a-412a-b1fd-d1cd50f6b21d@kernel.org>
 <93e35282-52a3-4c3e-8065-b2a6c363c974@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <93e35282-52a3-4c3e-8065-b2a6c363c974@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfX+MUbxS/11pb8
 kxk1KZei8c2zDtpP88n6MZxSCboO7tADBSOSDaSIWyP/Am5iFRfhmakW9Le8RuzdAtvl1WJkQKD
 bW9q9/6Gdq0so6eEvoC9oOICIKZVvTgjtyMMR8APAvb3d3n39QUg6zngAjJVQFVTfGEuzcyWwoe
 yYdvCzTryv3/5R/SSwrWB5anEMr9NqEk2vjH16MToxcAQa7G6NniS+lfKC6SWhnAYv9vBRh6307
 mKSKtc+bn6vLGtfhxMuwPZyQRJiCu+ejjw4SEicbM4Od9hgLWNQw5zdVPx74ZuXcW/uchuVcCat
 KPg8CjTlPAL0zb2HEUm14EvelblVexjhW1WLPocaHexaE8a0DMrcNdoJ5xSzhlGVn2N+Akjfnh4
 gShMIy/m
X-Proofpoint-GUID: AzIbW23rQvmCWCXP-lbDAupKwO6q2rVk
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689d656b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=3k836agxgdhUhSIPf64A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: AzIbW23rQvmCWCXP-lbDAupKwO6q2rVk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110107



On 8/14/2025 2:45 AM, Bryan O'Donoghue wrote:
> On 12/08/2025 09:04, Krzysztof Kozlowski wrote:
>> On 12/08/2025 10:00, Krzysztof Kozlowski wrote:
>>> On 12/08/2025 09:54, Dikshita Agarwal wrote:
>>>>
>>>>
>>>> On 8/4/2025 7:07 PM, Krzysztof Kozlowski wrote:
>>>>> Add binding for Qualcom SM8750 Iris video codec, which comes with
>>>>> significantly different powering up sequence than previous SM8650, thus
>>>>> different clocks and resets.  For consistency keep existing clock and
>>>>> clock-names naming, so the list shares common part.
>>>>>
>>>>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>> ---
>>>>>   .../bindings/media/qcom,sm8750-iris.yaml           | 186
>>>>> +++++++++++++++++++++
>>>>>   1 file changed, 186 insertions(+)
>>>>>
>>>>
>>>> Query:
>>>> Can the additional reset and clocks be accommodated in existing 8550-iris
>>>
>>> No, different hardware. Although it is hardware from your domain and
>>> your company, so I would assume you know the answer.
>> I guess I misread - I thought you want to re-use existing properties or
>> something like that, but you just want to create one huge binding?
>>
>> No. Don't grow these unmaintainable patterns. We have been changing this
>> for some time already :/
>>
>> Best regards,
>> Krzysztof
> 
> @Dikshita can you revert here are you happy with a new binding or
> requesting in-line changes in Iris - my reading here is a binding is
> justified.
> 

Sure, but I was trying to understand how extending the current SM8550
binding for [1] wasn't an issue.

[1]
https://lore.kernel.org/linux-media/20250417-topic-sm8x50-iris-v10-v7-1-f020cb1d0e98@linaro.org/

Thanks,
Dikshita

> @Krzysztof
> https://lore.kernel.org/linux-arm-msm/fb8f154b-3da4-4bee-82e1-3a1597a35c46@kernel.org/
> 
> Are you sending a v3 here ?
> 
> I can also just add the OPP when applying this patch.
> 
> ---
> bod
> 

