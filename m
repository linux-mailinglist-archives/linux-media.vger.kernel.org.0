Return-Path: <linux-media+bounces-43593-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97226BB36DA
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 11:19:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91EFF160360
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 09:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BF19301464;
	Thu,  2 Oct 2025 09:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="prmAcJmC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EA13009D3
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 09:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759396718; cv=none; b=WdSZav+s0a4AeCDsMj5V5fKAojJ/Qv+HU7ruG4W9NqBz2jE8o04iPV7g/wkCDnbYXUhdGeA4NpTTN24nTZLKLQPq31goafbm/hPC8tr/IMcNi7KY8ZOLF94xA+jvKE1W+krREontGuQnVymKzv6vXKH9Ji94OBFjTLBo3K/TGDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759396718; c=relaxed/simple;
	bh=XkSkdSXsgfMPXwsjXUAjZ04k2p3MHMRytxkvvCYY3q0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sEWmjgW7JsZ6iinuPkGRZw3wPxY4DioNiaEA/FkncSx+jGMqCVFTtIvNj7xFmxJd/z5Ua641OdP+w5TvUkakZkU8VXUo4jRLXl1Z5s6DXrXUtsNl5DDQmqK1b2uAZ9vAuVuuNIsb48r1HPnyWtaDLP1TRZ86LwGWzryDwKfs/p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=prmAcJmC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5929IDCi031449
	for <linux-media@vger.kernel.org>; Thu, 2 Oct 2025 09:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LcvvFnzF0KOwaNSsgzDBR4ph/iQHXswkEDteYkhjnf8=; b=prmAcJmC/9eyxhA3
	cOXvEZxzo44+I8iDKa71qx2BT/Tq7KhyaOkIJ09JtUDrFVHHOIWyPkhdI3bp6fGu
	Xb+3d0OZO0o5AYld8+k/71Ie/KlvsICLI10SB2zWTuQU/oQmSTsCscGYAzWWTkEQ
	LwKDbwyAkhwUwQeQ0PVM/G2p+Ql3/UcAfv8BvNg7eXmhqpixVNbgHni1WVzN66QJ
	yMN5bsHerlSHo9CKrTaWlw46xJ2VmSWeQa0VldGNCxk3kFpPTnumSO8xnCcCsGuM
	Sbss1nKJchEB53JT7gsirGMyr9yQe9Ai2iOnsMJbgCCW7wxtK9VBmh1gzo3rliLU
	nqxyYQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vr7bg3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 09:18:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-28e538b5f23so8471705ad.3
        for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 02:18:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759396715; x=1760001515;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LcvvFnzF0KOwaNSsgzDBR4ph/iQHXswkEDteYkhjnf8=;
        b=Zu2gUUOcNlmUNpN1EiBdEe25BoqE/EKXAkothbSEf1wCKQwtqgqyhRdRLQIgbw2/vd
         9rCPDo2meY+XyUMMCIluZRZH3X9CrEaPbAhNqJBHwAsbDxDzN4dHYK1Mjq0DzbGgyyKx
         Y1H3z1AehZP6usSpEldEkxeDM8YWbL2vOoZqioYN+CNiabUPNe+FNMr6v/MKiawfyG3Q
         8GqCsqS7Yccm2pRYRwKGhMMxcB2WBdGVblN2NuXSOwOPDwID36zoJitGbv5hlfY195G0
         KYCneveiGV4cx4D+HjwFGQ4X4oOWc6166OTPhJ08+A9SBxcA7s/lNGokZl8n6O0/cH19
         RK4A==
X-Forwarded-Encrypted: i=1; AJvYcCX+SqwqCVo3XfKEwvFpo9Kvzxs69ee807AzF+/XuM6ORlchx5E5+RHeRUgQgoC4yTiyi8COKLRjIrEcfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRh+MkVPjlJbmyx2UZZOTW6AB0YnzLlNWpwMy2VuXLBS0s2rQY
	4rU0S3P4KLI5Tjhz2y2VRefmUGf/7P5sbtMW7yY+taq574L3Qxnr0sbHf3wIY12qBE+pVNX4Emi
	XyStUc+qGa5jyBgZg7O3ORKTeS3STAdUCGOBYAbNViGxBbGCSa/DdkYv2mxYNkpPJJw==
X-Gm-Gg: ASbGncsO4ugqae0IINwi2S7NJQ80Ek2LoiRvt22fCi80gPyNM3gpKfl4NFVx+jfTPQ7
	i2c1K8Gfok0eo/WqyuVwu0WLkEwPG4DYBRuK36HvYu7aj8pYUt2DSIvaAWEyGugC/oCs3RJBcSy
	R3mGbESf1fDdV9zBsYGfuaroKYbXbNsCV2syihZhw70ER2JZryTnLc6g1ixCbTVQBowl4wDHYua
	s97Tz7TQh6bVQ3cQdqEGLsp1my8L0uieE+Dl9ga8j9c4t8ieIawIssWzDtHUwuLHbmcziNRZmZ3
	fW4Y8w97b8G6FH75tcW8c0p8klqb4uoFtLW6zR/X68vr69cLijYtWbMlAhMPzmhOmySDzYk0sXp
	zGxU=
X-Received: by 2002:a17:902:c406:b0:24c:7b94:2f53 with SMTP id d9443c01a7336-28e7f2a10demr93931775ad.6.1759396715223;
        Thu, 02 Oct 2025 02:18:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhzYstjWYoZe4E8zCtSfv3ZRHZZVXOJF8cEMsJj62R9ZlNmbcFVK5dMFHa1B45c75k5qPfGg==
X-Received: by 2002:a17:902:c406:b0:24c:7b94:2f53 with SMTP id d9443c01a7336-28e7f2a10demr93931415ad.6.1759396714718;
        Thu, 02 Oct 2025 02:18:34 -0700 (PDT)
Received: from [10.204.101.186] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d128132sm17746935ad.44.2025.10.02.02.18.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 02:18:34 -0700 (PDT)
Message-ID: <27381eb6-18b8-774d-5171-6326dc6bd9b4@oss.qualcomm.com>
Date: Thu, 2 Oct 2025 14:48:28 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/8] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-1-e323c0b3c0cd@oss.qualcomm.com>
 <nuunkv3xwfes6wed5xf4re2efakndvvrfl4lhmenilkic4sjiy@5cb2f5ygegvm>
 <522d7244-0003-a42e-9be0-1d353df8d5bd@oss.qualcomm.com>
 <oimuo26ohcye74j6rl5hfbmd4ip5wzudhyiaibf74b5zmjb4vl@xh3dnp7gmvq7>
 <7c6ab647-0c54-4480-9eb2-5c2bbf5f857d@oss.qualcomm.com>
 <b5d465e9-e84c-fabf-f275-3d0a5abf764f@oss.qualcomm.com>
 <2ppixuzddqmpa2d7nkvwwbfn4dnt7j7voyqfqcqeokbkzjg2lm@mokv4cihiuw2>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <2ppixuzddqmpa2d7nkvwwbfn4dnt7j7voyqfqcqeokbkzjg2lm@mokv4cihiuw2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zEKxhQiJ1L0s5PrhJ1hsrINei1FPgSh5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfX1ex1PBgBBHX1
 TvN6cuf/KWIHXZpKm9H9g325Cu1hAkIg32FOPIphtVXpGQwez01z+P4/wNPQ9W7obTL7MLODi2p
 CdkhkyzWRLiCmnNQtScjDf0oiYgxYLNc5sYJELsVgCmRux5THMGga7opDfkc9LqgZ2SzdcLosgr
 YPR19hiLo9DjtgAAWPniUQmy3iTrgRcVoEME1rhlVjusL/hB4LItlItRhzzWl1dHjiZtNwWkdse
 2siQLJPOXjn1gVHzT4We07CJRdId72/cEm95KDx39CCV7pBuB0agMpxb3tGjET7/NPikirE6y3d
 6ItzXGzhw1O9XHF2dRpjhakSw67Q1HQsIq+nsIIXNTbtWAhDQq6bhn2N1UJ7oz9ziVwYZBctQHn
 Gmfe9zCVvx0DQd8N2q7sSGm+LeS/Ig==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68de436c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=gimbRapRy-hzlna9Oi4A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: zEKxhQiJ1L0s5PrhJ1hsrINei1FPgSh5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_03,2025-10-02_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017


On 9/27/2025 3:55 AM, Dmitry Baryshkov wrote:
> On Fri, Sep 26, 2025 at 07:25:30PM +0530, Vikash Garodia wrote:
>>
>> On 9/26/2025 5:17 PM, Konrad Dybcio wrote:
>>> On 9/25/25 9:38 PM, Dmitry Baryshkov wrote:
>>>> On Fri, Sep 26, 2025 at 01:01:29AM +0530, Vikash Garodia wrote:
>>>>>
>>>>> On 9/26/2025 12:55 AM, Dmitry Baryshkov wrote:
>>>>>> On Thu, Sep 25, 2025 at 04:44:39AM +0530, Vikash Garodia wrote:
>>>
>>>
>>> [...]
>>>
>>>>>>> +  power-domains:
>>>>>>> +    minItems: 5
>>>>>>> +    maxItems: 7
>>>>>>
>>>>>> You are sending bindings for a single device on a single platform. How
>>>>>> comes that it has min != max?
>>>>>
>>>>> I was planning to reuse this binding for the variant SOCs of kaanapali/vpu4. If
>>>>> we do not have min interface, then for those variants, we have to either have
>>>>> separate bindings or add if/else conditions(?). Introducing min now can make it
>>>>> easily usable for upcoming vpu4 variants.
>>>>
>>>> No, it makes it harder to follow the changes. This platform has
>>>> this-and-that requirements. Then you add another platform and it's clear
>>>> that the changes are for that platform. Now you have mixed two different
>>>> patches into a single one.
>>>
>>> Vikash, preparing for future submissions is a very good thing,
>>> however "a binding" can be thought of as a tuple of
>>>
>>> (compatible, allowed_properties, required_properties)
>>>
>>> which needs(asterisk) to remain immutable
>>>
>>> You can make changes to this file later, when introducing said
>>> platforms and it will be fine, so long as you preserve the same allowed
>>> and required properties that you're trying to associate with Kanaapali
>>> here
>>
>> Let say, we have a kaanapali hardware (calling it as kaanapali_next) with 6
>> power domains, instead of 7, given that one of the pipe is malfunctional or
>> fused out in that hardware distrubution, should the binding be extended for such
>> variant like below ?
> 
> This comes together with the description of kaanapali_next and a proper
> commit message, describing the usage of fuses in the nvram for this
> hardware, etc. My point is that you are adding support for a fixed class
> of hardware: normal Kaanapali device, no extras, no disabled blocks,
> etc. This class of hardware has a fixed connections between IP blocks,
> fixed number of cores, power domains, etc.
> 
> Only when we actually add kaanapali_next, kaanapali_lite, kaanapali+1 or
> kaanapali-minor it would be logical to extend the base declarations, add
> add if-conditions for both kaanapali and the new device (notice
> if-conditions for kaanapali too).
> 
> I can say it other way around: the bindings that you've submitted are
> not complete as you have not bound kaanapali desription according to its
> actual hardware.
> 
>>
>> power-domains:
>>   maxItems: 7
>>
>>   - if:
>>       properties:
>>         compatible:
>>           enum:
>>             - qcom,kaanapali_next-iris
>>     then:
>>       properties:
>>         power-domains:
>>           maxItems: 6
>>
>>     else:
>>       properties:
>>         power-domains:
>>           maxItems: 7
>>
>> Also, what is the downside in existing approach where we say that the hardware
>> can be functional with 5 pds, and 2 are optional based on hardware having them
>> or not ? So all combinations of [5, 6, 7] pds are valid. IIUC, the optional
>> entries are made for such cases where some hardware parts are variable, please
>> correct my understanding.
> 
> Kaanapali hardware is not variable, is it?

By variable i meant the hardware is functional with or without those bindings,
hence was keeping them as an interface but optional. If that fits into optional
category, i can keep it existing way, otherwise will update to fix binding.

Regards,
Vikash
> 
>>
>> Regards,
>> Vikash
>>
>>> (i.e. YAML refactors are OK but the result must come out identical)
>>>
>>> Konrad
> 

