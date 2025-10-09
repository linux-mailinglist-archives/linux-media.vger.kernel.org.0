Return-Path: <linux-media+bounces-44110-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B921ABC9DB3
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 17:50:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D9751A617CB
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 15:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFFD921FF21;
	Thu,  9 Oct 2025 15:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KOMlOhtG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA111217F2E
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 15:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760024992; cv=none; b=lYXH46c31puO2p3TJ837T2rFRRGiZ03MPbxGpuTuCAgRudMJjsE+7X15ZeyWdmJkXGO7pQ0PW5nyxtYAI0kThE+QlxD1K529MlXe4VYGCl6eBwzI3dgK+RFyUpPHWQipWMvSpRcGBaHOX1fi9fwz0keKsjtb9zXozJwn8Eoyovg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760024992; c=relaxed/simple;
	bh=mlCAB0eKwxYNcDGzeoqO8BJSAOKhfByyKqoFzB/0Z2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cX7eu2mDA2EWrcwoI3aGB8cYfhP9xGngRYXrJkU2ck2OG/zLdrlRVgk/Vl4eaUkP+zDV+uUpcDmcRtpNNig2wODIMD1GkOjBgAPDvkyDv/hXFGQtFqBysDRXKvzqKysmi1vVQyoCBFcH7lcobkYf4oGsI3tsV162PrTQBAZM7z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KOMlOhtG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599EisNs029129
	for <linux-media@vger.kernel.org>; Thu, 9 Oct 2025 15:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uSIEO9FcEVLvrDKCwD8f9+MHa+xIch9jA7I3Optg5D4=; b=KOMlOhtGSNijXzLC
	l+ejUhQg62Ov7TD5PhOw5FcLgZXpUwBl3PtcsvM/ERzeixfiODOJ0oSKKCyFEdHB
	0zMQnVhLHoCx7T1SJwZiWZoqWxeAhqcV8L2dYoXlwvgIX91briU2oJF3fBhQ6pM+
	Bp34GVQq5j3vjhc0+2MB7/0Mtg7KAtD9X62O+MP3QtwWW6x7t2H9tw28Lq4LJgl7
	jOzxzjQDFGqeOjDZyc8/yrTzYzu14qyEmUh3fevh8j4y3q5p651344je0rR5lCJT
	EUjn9g4S2oKdKtmsxN3I/9iFwk+/5UEG2mhz8PgItwafvwSawV7DK+o7B8CC7Vlx
	BAk9yA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kuf5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 15:49:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e231785cc3so5650841cf.1
        for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 08:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760024988; x=1760629788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uSIEO9FcEVLvrDKCwD8f9+MHa+xIch9jA7I3Optg5D4=;
        b=EDRr1jih6kbxY4Cqdoz+2RaPxVnLh7tt+guI0asqb58mJ8wOuB4I656UNJa5gmx1HY
         7YR963fbfsM38s0z9T9Ckpmqddh7n5zvqWYz1KZaw7a5+E8bsM8aHbRTDtMefwqiEL5L
         kBHbW3LuWhXpSyyl8njqoyl5Z4v56GpyDHHgFy70zUewSsKsKYmheCStsGTYtH9a5ATe
         gy3WsW+PyUGNYIRxT6xnHBpoLHEzsTKTYzQFoxBuNGNA36aIZR8iSn1gb5HE+qp065qo
         FXO7eTB8Vtiy4DBibF+onnuxCCouCZtnRPLWq//NeqHzZOEBuyXnZwgJIAlLBEaZamq8
         YmPg==
X-Forwarded-Encrypted: i=1; AJvYcCUJgZO9yQY/uOmHyEiZlLXO8F6nYdhGjHwxtCp4E8C1GFjrM1sG8R++ZxN2ERdLGKvIMma4/HzW94a20A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3O82cFnw7ix83lTvzDZ9vci7lzXMNo49KD5WjhVjLkUV1bcwA
	4f80VkAMQZw6hEZcit7xOxyBk/chhJNWKMP4e/zAQqLg0xC3Zc6Y105Uc+VuYkeAerUjMY8G/qS
	oWrRQ5qXJxvoEbKJXmAzESLDfvvoXG8BUVPZn9u2hOhswAbvCk2CVbCLexVKHMO4L9g==
X-Gm-Gg: ASbGncuX9Q7k7mi0cQhU0nJmX/XluCtK08PmeZmbf2J3TDwvArjh6df9HK3WsTnSTzD
	sMu4u2Yr6aJSgOdq9lFfhFMJlgPdBxOzLDDvIuJGdgz1JmjW2E6Ntugh3Zs7FUriOnszhsgzuFm
	D36KWgIHQ93XZGmPZ+CnQ0jiBic3koqzL4hKlXHNbZ+/mHIg+lVN7Rumk7iNQzuZVjmH8H3oH4E
	cHyTxx8E3/kCO+wX7yadYg4J9KHC90jGOKwm12QWEjJgz9eRVZe+BGemupzoCBXjzaZkeYHQBa4
	lJwuDgYnvhgNjvceyEuHanKQcBgFn0i2ZUzGhqAlgFOemQHy58Ez8V490klJm5LQ4EhCjimqo48
	ezrXcXjWwzPCqgE8zVv28naheEJ4=
X-Received: by 2002:ac8:5fc3:0:b0:4b5:e9b6:c96 with SMTP id d75a77b69052e-4e6ead1deb0mr73885021cf.7.1760024988260;
        Thu, 09 Oct 2025 08:49:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHczPeydFcGNZDFNQ0JbS8P9KYbdiPFB5sssNB27pTfXWIBZDfWM5PA9UPMHckJKQxeckZRPA==
X-Received: by 2002:ac8:5fc3:0:b0:4b5:e9b6:c96 with SMTP id d75a77b69052e-4e6ead1deb0mr73884681cf.7.1760024987729;
        Thu, 09 Oct 2025 08:49:47 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d8c124a8sm2371766b.51.2025.10.09.08.49.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 08:49:47 -0700 (PDT)
Message-ID: <0a0afe32-7814-4901-bfbb-6694cd846257@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 17:49:45 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] media: iris: enable support for SC7280 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <20251008-iris-sc7280-v1-8-def050ba5e1f@oss.qualcomm.com>
 <3f1979d4-1438-4c9d-99db-d97a09c5c35b@oss.qualcomm.com>
 <gdui5coiazt5ynuz6c6mr5slau33vuewr55vx53m5zzyi537at@cs7dbgirijuw>
 <1118c126-4332-4f9b-afb8-d3da4fa7fa87@oss.qualcomm.com>
 <um6d7e2su4erqet5fxyaxpyulfrzqvadq4izxgmxu3tol3i7jk@godpxwsqeqzs>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <um6d7e2su4erqet5fxyaxpyulfrzqvadq4izxgmxu3tol3i7jk@godpxwsqeqzs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX0WnPwu2FVeFc
 qIgBLk++W5i+9Cwqutdunrj7dC6lYTKuLX1kzNf8kXMos8lJ2ew3mLCXDkhOMLfnwuSwghCUOZu
 4A8k043MkuTRAb0AlTbbk1grO0oxCYbBBFE/GDsy+12bWNp9EhKhEl+Lq+98nBdqvHowt5P2miD
 JO+gv07xRm+lRLy6xAWEPrc1TeoK5MtLl77c85r/I6CWEEaIgJDdLUPAKgvIBRVZOl3LSGSERib
 3r+GJStCSwS+zR7dvPizo9xoaC8NeroTPJg3TERgHuuQhFaaY5enVg66+abJsktsb/PJbq6A76E
 EpLWC0hheCQQd61sEkiuJGgtl7Yhy9HwUg/eOFT8YuQt76fDgR9v5MTzgrCWOJY5KvoDxQ5Qxdx
 3wUIyl45tuG+k+tulLuKujXnCiyOIQ==
X-Proofpoint-GUID: Uhq2Y0USuMzrTtCr1OjWE6PKIEVGJazy
X-Proofpoint-ORIG-GUID: Uhq2Y0USuMzrTtCr1OjWE6PKIEVGJazy
X-Authority-Analysis: v=2.4 cv=SJxPlevH c=1 sm=1 tr=0 ts=68e7d99d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=LpQP-O61AAAA:8 a=lTMcXo_5zusfKqBCz9IA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 10/9/25 5:00 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 09, 2025 at 11:19:31AM +0200, Konrad Dybcio wrote:
>> On 10/8/25 9:25 PM, Dmitry Baryshkov wrote:
>>> On Wed, Oct 08, 2025 at 10:26:02AM +0200, Konrad Dybcio wrote:
>>>> On 10/8/25 6:33 AM, Dmitry Baryshkov wrote:
>>>>> As a part of migrating code from the old Venus driver to the new Iris
>>>>> one, add support for the SC7280 platform. It is very similar to SM8250,
>>>>> but it (currently) uses no reset controls (there is an optional
>>>>> GCC-generated reset, it will be added later) and no AON registers
>>>>> region. The Venus driver names this platform "IRIS2_1", so the ops in
>>>>
>>>> Which we've learnt in the past is "IRIS2, 1-pipe"
>>>
>>> Well, I'm open for better suggestions. iris_vpu2_no_aon_ops?
>>
>> [...]
>>
>>>>> +	writel(CTL_AXI_CLK_HALT | CTL_CLK_HALT,
>>>>> +	       core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
>>>>> +	writel(RESET_HIGH, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
>>>>> +	writel(0x0, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
>>>>> +	writel(0x0, core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
>>>>> +
>>>>> +disable_power:
>>>>> +	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
>>>>
>>>> ..for this line
>>>
>>> Not only. You missed the absense of AON_WRAPPER_MVP_NOC_LPI_CONTROL /
>>> AON_WRAPPER_MVP_NOC_LPI_STATUS. Which in theory can become a flag in
>>> iris_platform_data.
>>>
>>>>
>>>> but this could be added to that one instead, since both clk APIs and the
>>>> Iris wrappers around it are happy to consume a null pointer (funnily
>>>> enough this one returns !void and is never checked)
>>>>
>>>> similar story for other func additions
>>>
>>> In fact, initially I had them merged, but then I couldn't find an
>>> elegant way to handle AON regs. I can squash them back, if that's the
>>> consensus. Any idea regarding AON regs?
>>
>> Digging in techpack/video, I found:
>>
>> commit c543f70aca8d40c593b8ad342d42e913a422c552
>> Author: Priyanka Gujjula <pgujjula@codeaurora.org>
>> Date:   Fri Feb 14 13:38:31 2020 +0530
>>
>>     msm: vidc: Skip AON register programming for lagoon
>>     
>>     AON register programming is used to set NOC to low
>>     power mode during IRIS2 power off sequence. However
>>     AON register memory map is not applicable and hence
>>     skipping AON register programming for lagoon.
>>     
>>     Change-Id: Ib63248d118ed9fecfa5fa87925e8f69625dc1ba8
>>     Signed-off-by: Priyanka Gujjula <pgujjula@codeaurora.org>
>>
>>
>> lagoon being a downstream codename of the aforementioned sm6350
>>
>> Meaning yeah it's bus topology.. so I think an if-statement within
>> a common flow would be what we want here..
>>
>> perhaps
>>
>> if (core->iris_platform_data->num_vpp_pipe == 1)
>>
>> just like venus and downstream do for the most part, and kick the
>> can down the road.. In an unlikely event someone decides to implement
>> IRIS2_1 on a brand new SoC, we can delay our worries..
> 
> But this function is being used for VPU3 devices too, if I'm not
> mistaken. So it becomes a bit ugly... Also I'm not sure if this is
> really related to a num of VPP pipes or the CVP.

Oh.. hm.. maybe we can add a .aon_shutdown op? I'm not sure how
to proceed either

Konrad

