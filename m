Return-Path: <linux-media+bounces-17826-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A50CE96FC56
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 21:48:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 385E928102E
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 19:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67BB01D6788;
	Fri,  6 Sep 2024 19:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Fy2+DCtI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB966EB7C;
	Fri,  6 Sep 2024 19:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725652097; cv=none; b=qxg6unGRNSuA16x0iuHXFpBAIcPWb5aOpvEUQNMP/JFQSUq+YwtWZl6hiw7iuOz9vi13/hAPm8W3GjtPpf0eKn8NxcKXx0HsAr4iY3KNZFbrDNr4+8PlhcoCxhT81OAPQ+MM/MDAtMsZgCfWSFO476tU+FfVQGrfdOEwTzeNmGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725652097; c=relaxed/simple;
	bh=Ue8pqHqk+M1slk9kDJ7vbKUUmH3JA70snSffYA+4/q0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=a2F/390nOplCjGnrQksOEnMMq7b/DApUJxzSw2KimwHz0F6h190DSnS7NNOtDDfpmtFL86HOORzTnMKvkiMfkNkwbpZ9176EuV5w4041UGDd6LHZRVG0PCqYfZu40pVn8Xi/fKy22Me/FD3EuDvXcDHsngiiLp4bZYtBnDtkj5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Fy2+DCtI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4868hk0f021803;
	Fri, 6 Sep 2024 19:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NA/5pkBd6SgZdss0M2e+CPDEPACI2C9W6/N8XKt+d2g=; b=Fy2+DCtIsEBGTy7r
	PBba8d3/Ld/fS/EhpHakTCbxJhHFd0+YgSdm0bqR6ADEHzX6Xi7hfSlbMCHxqZ7Q
	sEURJjMlCVkwwG3tNLjgtoE3SizRyYiaWn5CLOnRQNdBUTd79difxEqtMAtEZEnG
	91V4UlYtVa5O0K65lnTNa3F/g0e6P50VOmF9uFj615/TQX+3GOm8mr7zinzH9Fou
	YfnqBJcw1D/1sEi7dZOds4uFzWStlH1LQ+XEZC8+YGpZJQhGkTuNcLYqYHJhAMfP
	wGU05SEPJewe4d+uvWELnfgLlGPwjYJaVqhm3VloM/iCQVLM+2311DSh7Lvd4QDt
	itMk+A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhwu38sv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 19:48:09 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 486Jm8ZK021332
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Sep 2024 19:48:08 GMT
Received: from [10.216.47.237] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Sep 2024
 12:48:04 -0700
Message-ID: <463caa4f-c32c-d74c-a8c6-1afbc22a877d@quicinc.com>
Date: Sat, 7 Sep 2024 01:17:50 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 04/29] media: iris: initialize power resources
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-4-c5fdbbe65e70@quicinc.com>
 <81fd218f-aa0f-4710-b832-cab927bfab9d@kernel.org>
 <ba747923-38de-5c05-9220-762c5272ec74@quicinc.com>
 <76ffb882-10f9-4737-afa2-9bb60248835d@kernel.org>
 <f88d8596-c6a0-356e-060e-81d68f038995@quicinc.com>
 <c7fd8c50-d5d9-4210-8253-457d7523eb30@kernel.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <c7fd8c50-d5d9-4210-8253-457d7523eb30@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 24FuV94a64TqePv22neLw2nI7091OTZN
X-Proofpoint-ORIG-GUID: 24FuV94a64TqePv22neLw2nI7091OTZN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_05,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409060146

Hi,

On 9/6/2024 5:34 PM, Krzysztof Kozlowski wrote:
> On 06/09/2024 13:21, Vikash Garodia wrote:
>>>>>
>>>>>> +	}
>>>>>> +
>>>>>>  	ret = v4l2_device_register(dev, &core->v4l2_dev);
>>>>>>  	if (ret)
>>>>>>  		return ret;
>>>>>> @@ -88,8 +101,14 @@ static int iris_probe(struct platform_device *pdev)
>>>>>>  }
>>>>>>  
>>>>>>  static const struct of_device_id iris_dt_match[] = {
>>>>>> -	{ .compatible = "qcom,sm8550-iris", },
>>>>>> -	{ .compatible = "qcom,sm8250-venus", },
>>>>>> +	{
>>>>>> +		.compatible = "qcom,sm8550-iris",
>>>>>> +		.data = &sm8550_data,
>>>>>> +	},
>>>>>> +	{
>>>>>> +		.compatible = "qcom,sm8250-venus",
>>>>>> +		.data = &sm8250_data,
>>>>>
>>>>> You just added this. No, please do not add code which is immediatly
>>>>> incorrect.
>>>> It's not incorrect, in earlier patch we only added the compatible strings
>>>> and with this patch introducing the platform data and APIs to get it.
>>>
>>> It is incorrect to immediately remove it. You keep arguing on basic
>>> stuff. Sorry, but that is not how it works. If you add code and
>>> IMMEDIATELY remove it, then it means the code was not needed. Or was not
>>> correct. Choose one.
>> I think it is not removing it. It is adding platform data to compatibles
>> introduced in previous patch. Maybe it appears as if it is removing it.
> 
> I know how the diff works.
Perhaps, i have misunderstood. Are you suggesting to add compat data and
compatible string together in single patch rather than splitting it in 2 patches
? If so, that would essentially end up squashing patch #3 and #4. Let me know if
that would address your comment and we will plan to do that.

> The way you avoid solving the problem with trivial responses is not
> helping. We already have been there with another patchset from different
> person and it lead to annoying all DT maintainers and (usually very
> patient) some of networking folks. I ask you to approach to the review
> seriously.
Please be assured that all comments are valued upon and are being taken seriously.

> NAK.
> 
> Best regards,
> Krzysztof
> 
Regards,
Vikash

