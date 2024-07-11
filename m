Return-Path: <linux-media+bounces-14923-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAA092E810
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 14:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A64BE2830E0
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 12:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F056F15B551;
	Thu, 11 Jul 2024 12:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fhLaLL/s"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E512C1459E3;
	Thu, 11 Jul 2024 12:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720700095; cv=none; b=VmeAFwm1zTX3aJb94m+JidBtq7NlMeugY9EgharAcuDb0dA8RRYq/KaY8ybdrTlJMCZ9h9mitD9Tte62i/ztkVrjkOV+x/seGd6BVf3SoO9HnEGCwIJV9DowaLdEGJ6b75v5bzo696OMiiQ89CtLfDQ2u6WHW9gLJ01m3SrsCQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720700095; c=relaxed/simple;
	bh=+2uWj0TW4GlldsC+qipkR3Acziv42Se89VikG8AuyHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Bse0kLFHMvfbf/O3xO/3qLdvoDTptqhZfDVoZwTvp+E7dttYjs0Co5JGw/WrLTf5yF0NMx9PuoQj/J9OkVT57u0Bqb8wpSzDiScl/2tcT8pKhr100G7ok5bwJbwJyVNrN0iRPu6YiGBlCjG3QKGbKDKNQP/V+nZBZO+Uu6p4hfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fhLaLL/s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46B4xNVn017908;
	Thu, 11 Jul 2024 12:14:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X8//7qjuGHqtL4VrFh89QIdRBYFbHVqjps+nq4rZxgQ=; b=fhLaLL/s0KK9pYxs
	DTivtA4Zy4kcDicbq63UAqFZLSrc9Oz7hHSEQ1Av1OvUZNsfCg0BVIBGNgeXkONE
	f6E1ZrKEmpYFJCKRBvqI30mzK1OxS8qFnB+vzI8cqIWC1KiyrH64QVuYSY8Q5ZjZ
	ciCP0FgPvKldHHPnDqOsCXZf7afMCnW//KmCIzH329+bOrZa6cXaNYottETSNGd2
	reaPwb5eE+JYeKvug0NFY171GvSb8y45SrXdbBWQaEXOAc3/ahEyXOyqjwl9haM/
	t9jb0i5ZDneL+87htM33opF0i6mRuzKuIHxcEVUHamB+XW+bKNLcmkAOhHaps/WN
	PvvdJA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40a8uhs1nf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 12:14:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46BCEmCi029573
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 12:14:48 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Jul
 2024 05:14:42 -0700
Message-ID: <1a6b8053-d053-4e84-a69a-c21d07f325bf@quicinc.com>
Date: Thu, 11 Jul 2024 20:14:40 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] media: qcom: camss: Add CSID Gen3 support for
 SM8550
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski
	<krzk@kernel.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <quic_eberman@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Yongsheng Li
	<quic_yon@quicinc.com>
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-10-quic_depengs@quicinc.com>
 <1da50dd1-b170-4775-94fc-19a10b7f9c47@kernel.org>
 <4c8095dd-4f96-4b0e-9282-8bdfb5badbc3@quicinc.com>
 <9255b3e4-874c-4919-b50a-919cf0f42f75@kernel.org>
 <064baf66-eecd-4982-864f-50b86b104ff6@quicinc.com>
 <4c26e896-69fa-413b-ace3-39c9698dd6aa@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <4c26e896-69fa-413b-ace3-39c9698dd6aa@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eAb3LG-DMK54KNfHIJ2ZvMlQd17Q5Ug3
X-Proofpoint-ORIG-GUID: eAb3LG-DMK54KNfHIJ2ZvMlQd17Q5Ug3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_08,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 mlxlogscore=842 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407110086

Hi Bryan,

On 7/11/2024 8:00 PM, Bryan O'Donoghue wrote:
> On 11/07/2024 12:41, Depeng Shao wrote:
>>>> Yes, these are some sequences to initialize the HW.
>>>
>>> Hm? It's like you ignore the problem and just answer with whatever to
>>> shut up the reviewer. Instead of replying with the same, address the
>>> problem. Why ordering is not a problem here?
>>>
>>
>> Sorry, I didn't mean that, was trying to understand the problem, then 
>> just sent out the mail by mistake.
>> Do you mean we should use writel to ensure the strict sequences?
>> Thanks for catching this problem, this problem is also in the the 
>> existing camss driver. I will check all of them in this series, but 
>> the problem in some existing camss drivers, maybe Bryan from Linaro 
>> can help to fix them, since I don't have these devices to verify the 
>> modifications.
> 
> _relaxed is used I'm sure because that's what's always been used and 
> what downstream does.
> 
> Is there a good reason for it ? None that I can think of.
> 
> Krzysztof is right, there's no good reason to use relaxed() here at all, 
> you should drop it.
> 
> ---
> bod

Sure, I will drop the _relaxed.

Most io_write don't use _relaxed in the Qualcomm downstream camera 
driver, but few strict timing required code really have this problem, I 
will fix them.

Thanks for highlight it.

Thanks,
Depeng

