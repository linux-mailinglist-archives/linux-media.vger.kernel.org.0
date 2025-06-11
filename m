Return-Path: <linux-media+bounces-34517-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 339EBAD59B7
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 17:09:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A1B53A933D
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 15:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED801DF25C;
	Wed, 11 Jun 2025 15:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dsAxDEb+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51921A8F79
	for <linux-media@vger.kernel.org>; Wed, 11 Jun 2025 15:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749654381; cv=none; b=bqLhbKktw1+RAa6x+KltfNijcozl5BxaL4nqbwxb6zFIlMdpbIHTrACIkvs8VvxzDR7/V+4slE4GiMxatv3NRWMwdDjr6aWRqDUstWotAILXlCMdv4lXyA+16XCIkRHWSelTUD5yBLQsy/sW74R4R8rnOhUjEgGEejJm/yWw0q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749654381; c=relaxed/simple;
	bh=uggfU/x1Y1OnYzacJ5PR1iziE7YguscIhi3wGXEOUqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sfFVCY9DGftrzsald9G81CWG4I8tFTW3sObxSo2IzkEattVdaU90TtOlEMCyj2hMjfNDkz2eZRovUw3fRS+Z5nk6/V1BFCPuFrKkis9oHDYzBSqWFxvPQsOOqQcGtSnRAbODfP8l64el7+4FTN5hEbTKr55YD99w+jfFpduiBwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dsAxDEb+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DCY4027349
	for <linux-media@vger.kernel.org>; Wed, 11 Jun 2025 15:06:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S/W6554sM4PStRUOoRj5glqk4SWBmtXAj26sF2oFq9A=; b=dsAxDEb+a0Up/7iQ
	DkYyHEvfQeibaM4ORr+xG2ilSZyA03pQpA9XG4SyDB+LSzlZsY+3ZQIZyyD4eAbO
	b8I67SbQPzLPgAXkZlZl06CrJ78YjH6f4C5nw3teaU21tmc5m/uWaJBF9h3DOz80
	rOcpTk83WtX+jDZP6W+URQgA7ahE6PZHPM4grcZdFRTjP2bQdSlcclaN7yARmOwb
	xv/TAuBZvTsJQ9Iez8o+AxsOCZwAM3vN7mpCc+iQxirrqgbFK5wjfS3JcvqdHHwA
	U0BAztx6r2/zbgh7E7Ze0Qad8Zj9eMJgX/DSxoSd7dqU8M2+Yv9Xc6cHeiXDAE2g
	YhrsVQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476jrhcc56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Jun 2025 15:06:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0976a24ceso21150785a.2
        for <linux-media@vger.kernel.org>; Wed, 11 Jun 2025 08:06:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749654377; x=1750259177;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S/W6554sM4PStRUOoRj5glqk4SWBmtXAj26sF2oFq9A=;
        b=VxlIyYMom7ERMR3H2lzFkMrJdOi9jhYOSqIoZj29IftVlJC6avCwPALaN6oKOemuhv
         p8jQ7U3OETFkv4j82oLkpV8W3HANpJ42QxBbA8a7Ae7A5qEV15yU6wBgyT9LrPvCpQXG
         cpXF4WuI0S2XZT38Ayk6NvGQMO/+kNAPjROEtvW4zK50npLr8X4VaQNAw6mzFpIQDXLC
         FLe9c08pBWchAIvNtkCHIjO/iWepSVaoSAbEwT9a+WOewgy0nDEi0nvfE8ZqzH/4cRH2
         B8sVbM8a0rDiub6VT4o2OQJGD5IZqtdHsc6qumoFcU0qrFqVRPY2IjUr9/qUV4EO2n9Y
         0l+A==
X-Forwarded-Encrypted: i=1; AJvYcCU1kZ/N/lRqI1rWw5PFegggfqvbvvCuqvMV6f+Qc6CV/JXzO3Q4TvKmD9Ur5gtLfX8AyKYJ+dbYtvp9bQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnEv3ccJGTgDT1x8B30mZVMHEctAwIP44vDc8PnxLrnW8QodDF
	2B+TmzADA1UNmGY78JB40wCN118hrhrB4tzBe5UV8T3Z8w2Big0bkI5NARkzIo4HjbJuqnJVgaU
	F5nS1i/ySpXklwyFpEURg0SQpggcIWUen6vDuWs7IXsMqJGOPQytmkOCwp9n3vjJhyA==
X-Gm-Gg: ASbGnctgEmMmA5MKE6JLdyrIQAL+f2+YcS12v6sBtDze+WfCzD7kdyLcp9ShFm8vc5K
	oV1B+Y/2h3NqCUB2LRuij/DbLSOC8NUpZ5/58mjFaaQ3Z+9q6eg6gKmz8+Qi4tw7F11RD9FDsg2
	F4QQVgoL+c/zdV3+hGH9dzxomAUmuGQGeq/JhXmSHLS0fUi8RuTbSSpEH62vvaV6MOHzNpkIht+
	3DVzTneY3vZeQvUtqaZnMvqu/clXm5UQ1F/xSkdkq3gw7oEBten397Dqyh4qG54SwyMP7ThNb0s
	uMvIIT4695UAsxfxnDh1dCg1DSvaHH4N5meKcBH8U0F5E571bAk6PzgXbCqDKAo+cyXhUKmSTDv
	+sns=
X-Received: by 2002:a05:620a:29d2:b0:7c5:687f:d79d with SMTP id af79cd13be357-7d3a87f04afmr205897885a.8.1749654377332;
        Wed, 11 Jun 2025 08:06:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT1MIvBRTLARWB0wt/VEh6LTMpBio201lRkK2h9aABclFE5ka3MIzIuUcHTp49tOwLuqThGA==
X-Received: by 2002:a05:620a:29d2:b0:7c5:687f:d79d with SMTP id af79cd13be357-7d3a87f04afmr205895085a.8.1749654376840;
        Wed, 11 Jun 2025 08:06:16 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade31cc25b7sm832539666b.66.2025.06.11.08.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 08:06:15 -0700 (PDT)
Message-ID: <946e3208-4783-464a-af58-68c4f79d327c@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 17:06:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
 <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
 <5854a587-aba7-4e71-87f8-249ba00cbc59@linaro.org>
 <996c9a39-5520-4b43-adfa-06ce29223ba0@quicinc.com>
 <713b87cb-0003-4ee3-a599-9cd41629bb42@kernel.org>
 <7aa36a0f-6741-40c2-93f4-036823d245fd@quicinc.com>
 <247002c0-ee68-4d0d-857a-768bf68bce75@kernel.org>
 <d5aee491-3ba2-4beb-8b8f-4ba8372e6d16@quicinc.com>
 <5b6864a9-f0ee-4bc5-aba2-c165d14b0b75@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5b6864a9-f0ee-4bc5-aba2-c165d14b0b75@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EovSrTcA c=1 sm=1 tr=0 ts=68499b6a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=-sEhWvhX9MohxhsycYcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: S8iNHzEOA74h1kljTztTBiwZQLmOst_2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEyNiBTYWx0ZWRfX0WIDslqFWLnF
 s1lbiHOylcVFR2QfjWjvp6f/kIoZ/J0jJXEWi5fidrydG72HJ9pOzounJfWZQbewc3kTONbrzuo
 yG6MZkEuw86A/rN/tl755dTSdzpxiZqt6q+2ZznjEmhhiGoYbExzK6UNeLkJeL9iSogrWEsVM8k
 MajJfyM6c+oRXFFfW0KOLZbeAgR8QslZxDznVx8iiW4OV5sRVBTvBQgzkmv1jsN4G+2WQj76o61
 hF4VT+gUMJDLAPI9JPnafw/Tjixd1TajcIQLbc48bL8ZYw2H1GN9O9udK4MubMIJoi8bEdD7yM/
 KULCil1Zu9fJd2JFoGa4WcDWZJYUIoqhmYZ0DkxRpoR0qwv8tucC0RiUrq+BmHAV/25EbsRJS+T
 SBx8pDcOZTK++N9WTXsYk92aaJZU4YIkqJ4F/pt8NcjJKf0awDZNVLY2aMHc3WIXfEXzXCBS
X-Proofpoint-GUID: S8iNHzEOA74h1kljTztTBiwZQLmOst_2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110126

On 6/7/25 11:46 AM, Krzysztof Kozlowski wrote:
> On 06/06/2025 15:32, Renjiang Han wrote:
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
>>>>>>>     Qcs615 will fallback if no OPP is present
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
> 
> No. I don't think you understand how fallback works. Fallback will be
> applied on any QCS615 DTS without front compatible.

Please read each other's messages..

Krzysztof refers to the fallback compatible mechanism, which means
the proposed QCS615 node will match against the driver containing the
sc7180 compatible.

BOD refers to the driver falling back to using the hardcoded sc7180
freq_table when the OPP table is absent (which will not be the case
for QCS615 since the node will be introduced with an OPP table on
day 0).

This patchset is okay to merge in proposed order (dt patches a cycle
after the venus patch)

Konrad

