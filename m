Return-Path: <linux-media+bounces-44774-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2477ABE5CBB
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 01:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8921719A7549
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 23:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA2962E7BA5;
	Thu, 16 Oct 2025 23:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wn0ylk4L"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E572E62CF
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 23:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760657332; cv=none; b=CwGS6QhfTbleb48/+di6YswmpiIMK39hGk9m3MRMsfEJ3Vil2ks2ZTIrbCVvhQL+AGFugBZjWvuhZadoajD2DNldX3kk5Wkchb4wltIibay5A9TWyumCgdn6D6X9XR2VWP0u4J4AJ6BbgJQI1Jh/6ADbVZyG3gT741SoGUyY5/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760657332; c=relaxed/simple;
	bh=rlxaqT8IZi7KLirboMOLoCUue9uOBkoS1ATRvMw3124=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L41upLxFoKs3L/wAN2OxQEJzHJHtZkE96neDsrFU0oUExzIshXUOup3iLGnlS7qCD0PK/FAxLZiOBH8FxSMdCd9+ICOGxPmnSGGTF814xKMtAPP1u5Dj9tnnLri0Tq7SD1Uvyqen1iMf1zTicztz0/M6fo6t/bA9DR36sXTSSHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wn0ylk4L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLQIS025265
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 23:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RX63coALBF5N8Qboq9T43pP2xBguL49cxoQ5B66uUGw=; b=Wn0ylk4L0yHcTEw3
	hSsSZgRBCk7b0eVs7kla4J1QEZxdQzZCVyRbchPhwLMPfuo/XgKno9QUm80REGMG
	tXbOVy4R2/AKIiUvm/vgxVF7hNy2EVmkSsOE63jcRpchmzE3rMTIFImS7KVq7DIq
	kmfZjALBfHIYuYZYVzLVT2jifl4okqHm/tl4ydFN/ntqPRP/fcXsH7oYPNs7JAkz
	0lF7oAGu3fQDcgD0EeT3UdRh3Dx1OfD9tehiLYShpfK5Y+22OESV4rCz4SniI/al
	fDhJFfoflNwNglaa5JTImU4P4f/nFEmoMIioGzGJOKlJ+AH4pho2bf/4OzzT8Yd0
	bkKivA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdkj4j9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 23:28:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33428befd39so3187257a91.0
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 16:28:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760657328; x=1761262128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RX63coALBF5N8Qboq9T43pP2xBguL49cxoQ5B66uUGw=;
        b=Nlkz4j50a632ENcdLvgJ9qZ6Jwf4DPkm3avKsObIjSVDT0vHy2fF6ua4WBj+WU5Lej
         HK52nux8PfPWdzI95otWNgN16+5Gcc93BDXXFs6tkQjpWwuGqnr8DSLyV4g6wN9GtSaM
         owhOXi5Sa6ng62cTBRF3gbaWWq3yeMvBos0IDhax1txd5Sv8zngVxtHSBeT5fMwLJzzd
         ILNVDRwf+Ko+DuQdhPKR/KNlJ3y0edHdT54o+F35snvK1gvSmXXjzEDD4JTHqg4CEqys
         J9M5FMWmQ9qPjx5xyxWVlPeiWMJEdjr/ZH7fV9uafR1Y5n72/B5eAyi3grlMAk2onaZ7
         DKiw==
X-Forwarded-Encrypted: i=1; AJvYcCVjGrJz5dzYiCNRsB1znDyYcakwf09mLwPTj4OCP6t8QuYPBS9x38Sd+434Ytv5mXPwGpnaK2traZErRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0lUG47H0J7RANIiOZYmyPjrlXfp8qfVjM5/GvRRz2a20YD77E
	AuxKhKoNjs7Cra1G3kEfGo26GJsPiv75YothMgKyEFWG7fKA64Hdg70z2g7K/y/lQO7lRk8skSs
	ZKs61La4dbsAiNRwpyYfzvvopVLrUNOfP6cusuDji0wAqL1D2f1yMsKwgswIIA1GGiA==
X-Gm-Gg: ASbGncshj6Cs0lzuQbUpPYJKE/TwH1kHGsSH7KhdmuuBb/Ie8lp018xqvLt1b2f+q4u
	W2EIqS9MDWWWrF/OgHMvYJZH93lDLWL+zMjrsHZYOrneRjmAarvypaf6q0nZfKNpEBrFlRghAeV
	EOsN92BBpXUFg59tD+lLomd+u0DHEY5naVzFUyTOg5QdyqZsYtOnRc5eSTJXeQJmHEFG9VS7g/0
	3CCiWvE9QMi4zPlDlG1Hih35ClYzWwFyEd/nBJni9SBsYYkqEgboE75uWa6ZD+YUrmV9Vw0q3nh
	pb9ZiXaLFo6bnwYYd8Hc1aF23EAt226aHOghqgM/0SLlCNXRa6Y5tylwYEWfnm+Fycdd2Om2Qvz
	3yovkfFQK74kAq9NHi7vRpK37KrYAa7OX4cw7/c+G0XiyDzfChiAPMA==
X-Received: by 2002:a17:90b:2b4b:b0:335:28ee:eebe with SMTP id 98e67ed59e1d1-33bcf908bc8mr1568412a91.30.1760657328173;
        Thu, 16 Oct 2025 16:28:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdlkJr++vWqphZc58l1HehQD9BXRaRbHvW5CoQYUc4yrWbI39Sys1IV5VOEPFpE87k3sOOng==
X-Received: by 2002:a17:90b:2b4b:b0:335:28ee:eebe with SMTP id 98e67ed59e1d1-33bcf908bc8mr1568392a91.30.1760657327731;
        Thu, 16 Oct 2025 16:28:47 -0700 (PDT)
Received: from [10.62.37.19] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bcfc12fa0sm359020a91.13.2025.10.16.16.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 16:28:47 -0700 (PDT)
Message-ID: <662a21a3-de8b-406f-a15d-b8a572aa79ab@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 16:28:45 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] media: qcom: camss: vfe: Add support for VFE 1080
To: Bryan O'Donoghue <bod@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-6-f5745ba2dff9@oss.qualcomm.com>
 <8d61f29b-ba02-4757-b8cd-5fb51b998acb@kernel.org>
 <FA4lDfkvC1Bdn7xJsoLXyWUEackUIfrSW4vn_6Q5YA5pDcNJ0QZ8EeU0CuEqKQuzdnYLC-AIvy9RhoY2ba5sbQ==@protonmail.internalid>
 <1aa133b9-2a99-47cb-8309-7e49b5dc4f85@oss.qualcomm.com>
 <f5df1c29-a1cd-4cc7-8ac4-b4aefc4225b0@kernel.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <f5df1c29-a1cd-4cc7-8ac4-b4aefc4225b0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _6_RqB56uIUDbv-Bz6-uvGsPk73ieXEM
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68f17fb1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=blchzdlE1R3GHN3_IVwA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: _6_RqB56uIUDbv-Bz6-uvGsPk73ieXEM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX/yX2mLvxY8VC
 gtwj0qk4ZGimtm67PPHO64GBW3h+weoRvcmMICMaLf4HLWjc4MZClbOUK5s6bmzv1tUA6gb9BD6
 uepjrOjG9iulr1xxjp0RrcIbN+9SQgqOLj0YXzCBe+2U7vxSfxQX5BisDS5SPURjEh5RNwoeEd4
 n2lXw4W0C5hEa/dqwPYnLlx2UgmvpTZrf58psUZKKQ3Tttdx/ymp23Xt+nlI3bxIYaGELIMqAte
 IA0J12bgJbmkN4eyc4MLu/m2YxFxXOv8M1B+17NT4Kq7m+NiRtDLnaPZKAtr59oaiLop0gBrHGv
 +Ef23BZ84CjQlKRyJM8FwNDIVQICT78NKTxz9c5KGfQ755JFLW4TpigViQZsdTjeCTqwvCWTkJV
 eQb772o6tcJw2reCT4D5SWw17hGX5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018


On 10/16/2025 3:54 AM, Bryan O'Donoghue wrote:
> On 16/10/2025 11:33, Hangxiang Ma wrote:
>>> But why ?
>>>
>>> ---
>>> bod
>> That a story. When testing the RDI path on Kaanapali, we found one image
>> buffer starved at 19/20 stage. We want to capture 20 images but only 19
>> received.
>>
>> On Kaanapali, the AUP and RUP are split into two separate registers not
>> a single one. Maybe this hardware change impacts something. Calling
>> ops->reg_update() in vfe_enable_output_v2 function only applies one
>> buffer address. The downstream code defers AUP and RUP to CSID
>> configuration stage. We mimic that and find it can solve this issue.
>>
>> ---
>> Hangxiang
>
> So this is the type of interesting detail that I'd go looking for in a 
> commit log, a comment in the code or a footnote in the cover letter.
>
> One or two sentences in the commit log will do.
>
> ---
> bod
>
@Bryan, let me throw a bit more light here. I don't think the 19/20 
buffers issue or the AUP-RUP register separation has anything to do 
about this (at least not the first for sure). Fundamentally, on 
Kaanapali architecture (or any architecture for that matter), the HW 
guidance is to issue the reg_update (corresponding register write) after 
all of the CSID configuration registers are written. It had always been 
working for other chip sets to write to this register first and then 
write the CSID registers but Kaanapali seems to have very strict 
dependency in the hardware about this sequence and with the original 
sequence, no RUP DONE or BUF DONE events are received at all. Hence the 
need for this change. The 19/20 buffer issue that Hangxiang mentioned 
about is a follow up of this where we enqueue two buffers to the RDI 
write master from 'vfe_enable_output_v2()' but issue only one AUP update 
after the CSID config. That was when we needed to add 
'CAMSS_INIT_BUF_COUNT' and use consistently at both places. Hope this 
makes sense now. Please let us know if you have any questions still. 
Thank you.

