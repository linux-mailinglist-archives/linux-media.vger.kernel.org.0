Return-Path: <linux-media+bounces-54642-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHuHIe98qWkg8gAAu9opvQ
	(envelope-from <linux-media+bounces-54642-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 13:54:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C218212288
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 13:54:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 79BDC3013B55
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 12:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BFDE39A7F4;
	Thu,  5 Mar 2026 12:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hbzzm3xM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g2tUZoVJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88EA39E6C2
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 12:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772715006; cv=none; b=STlhjhZAcfITN+Fl/etLPQLfTQI+bNmxgBzgd3I6iUrrPTf6tMNryf5d9hh/9wWEOeTS7rB0blqDVvwXx9mg8Y1bebE5EiZX4fenB5qZEc9qoaPqsGIS1CDast6c6jBcqWjSVqGDg9MM2cZPRMj2al4P47vhhXD+5j9Rnjl/hI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772715006; c=relaxed/simple;
	bh=ZFg7/u8ZIdxwTw/xcyxI9m8pz7Nrt/rFcRdfOhXHbUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bXy4XdXn2lAiNyPC74V3JF7h95e+Gga3AsgJGxmzEIJF2QkjJlNSqAK2JmyI6j4URkRjDq8KCJJAhsvsouYE8CCFrDSWjOq7M0znV3DwGwvJErs9oNlABgX9W61uO5MNDcBuP9EH5aEgM9LNTs9Q5DOnBaZ8CWr6Lcq6k+Ixev8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hbzzm3xM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g2tUZoVJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625CNCiT720360
	for <linux-media@vger.kernel.org>; Thu, 5 Mar 2026 12:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6JmYnhUipAmippdqvfiMhx5VT6VSiEPqmr3CxnTWWUE=; b=hbzzm3xMP64uFUyw
	c19PPTZYHOw6JiSxTvz2UfkpQ+mK4Mdx9U89pYzizpghyGRG+ji58x7Buz9RnjNF
	3s9TT4EfTVaZjd6qJNYDWQvnUzrgBWsmKtvUtX7yuh5Gjdud1pWcivavC9ZDPUcw
	8qa0m9zrMLm9lNgATa/EyAaqu2cZvPiJ5/AfgKQf5Fr4F9dYa6SjyTQ/McK4BM5u
	7QRcWOEl8K0CjOSKouZGNfcYgezikIGEm/aCvoBqguTQlwDtmhSVHDALMNxVGhqq
	C/+FYqEdGWkCvAXLF+rzjGccQfAi8TmJ+dhiIwzKBFKqxO+PY4zMrPtA6kl7Y08i
	5OxI8w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq9srg2da-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 12:50:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82984468f85so468004b3a.1
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 04:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772715002; x=1773319802; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6JmYnhUipAmippdqvfiMhx5VT6VSiEPqmr3CxnTWWUE=;
        b=g2tUZoVJt+vzxeLiHmh78a3/UNuZdrHxbWzRgn/cuwcN4ILG06gGgw/DPFosjE4LQX
         QSkuVxEPkC4etvTVRBypXMk8XwDep5vGwnz6chYA6hwynGjDdqAcFafTnWnV+oF+dcKZ
         hrpNRmYrNtejMlIRs0i5LynlbIApm2fUOPHSp5rFxAYxu6t1w/R1CIK9ZsdOvMJlwx0A
         ItItR6McYYCEbrY8byFA7gFwlt1vtR0lzR4866q2pI/O1nBegAIeSjQ2GFz+p/wshb5w
         Fj9VkI/+Az7i81f2+ab180BkSt5eGkt4eg9qxIn0Y9z5O5ooFXWMvqRwmiBhjX9pHul/
         H8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772715002; x=1773319802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6JmYnhUipAmippdqvfiMhx5VT6VSiEPqmr3CxnTWWUE=;
        b=sn3HLZ+2wS5PgeophmKaoQfDAPW6MNq129i39q0hZIbv2F/RHvH8+gklklfn8F0ngD
         m1PjltQJd9jwUSzLALSSxwbOoxCW2YhmKu3KsTEireaHaEL1ahBj8jVaKt6uFPOL5nHs
         Jjd7qbRxfE7une1IHFGkp4Eqqa1KZINgAqovQ1DrhLsG5L5AFDy6wyZ6Yeo7sC4tgpld
         CxrJXLTYsciRuI2mpCoZ2V8SFg7lAlDpe4wgwDzxaQqxsyDeqnzSLiN4XMvg732Po8JP
         4D8eJDRL9OeBdSZE1VgB6/MWBnRXrnn4kagFWgwW4bxNOPobJKnvrvlHhZN3fhGk8yrq
         e64Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJV4wneq/fLAEPa/NbE9g1cOKzVcxB/DRHKgxlMGXtHQZlAnjcDtPIg9oqj5LpYyhEWggw/CUnHYU4Ow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxga4k51mET/p2uJ5NV50CTtAMoURf+PbnWQgzuJg7H1Bg4R6i+
	dQnRhyXVsYOl8r/Dj+QvF+UiHvIie1QxizCPo2Oi+mjCLEheLlX77XISlvQHOruBI+Z6gfsxXXN
	i0rVHUDVZRp4PWKZJYC9y9NnsOY14HEvIeN0hUR31PAQOgwrkh5Qpx0WVXPk/WU2XAA==
X-Gm-Gg: ATEYQzyCoqrA0cNV4RZW9jByObJl2cf4KU0t7Z7qLfAUe7QXI3XSVhR2Qj7c8zjgpxE
	thbPyOkbvpmFb34oJRwEEX2sK0DxUDXfllQdtkZRUbxzAVyDqfTifE9GuYE8XEO47Lay0GFyQNb
	RB8zle/qHr/BLiFT2wFASWZYZWOI1YUfpny/ZJ5Yc2OkjMSmxLfg+fEsEB4fMelYbgwM++J8JCY
	Ro62ep9PflrjYkMPAFyYal/xDgmQJUTxbDPVGf9VFHvyFEMBLw33WBl+OlFF3vfRBmx8KEc63ac
	SWuOCwX6ZQkxqob1FzBlfBjLL4uLMPndC1KTdR0Dt3MAO6FnI3B2kse0hWaXsS/VwJe32nVoZoH
	WIrDps63k3s7jVDN8e/UW5cwAJ7n+tsQOaes7Y9IBxPfQxMNPELc3iKI=
X-Received: by 2002:a05:6a00:3d48:b0:81f:17b:c70f with SMTP id d2e1a72fcca58-82972b790c0mr5573420b3a.29.1772715002444;
        Thu, 05 Mar 2026 04:50:02 -0800 (PST)
X-Received: by 2002:a05:6a00:3d48:b0:81f:17b:c70f with SMTP id d2e1a72fcca58-82972b790c0mr5573373b3a.29.1772715001880;
        Thu, 05 Mar 2026 04:50:01 -0800 (PST)
Received: from [192.168.0.172] ([49.205.248.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a05c0b0sm21010147b3a.61.2026.03.05.04.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 04:50:01 -0800 (PST)
Message-ID: <6553cfcb-9399-4d17-a529-b07b421ed7e8@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 18:19:52 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] media: iris: add context bank devices using
 iommu-map
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-4-850043ac3933@oss.qualcomm.com>
 <rzi7qmzsofocwcqxhsqz3f3tl4ahqnwn34of6qcc54odpben5d@7okuqabxgdqh>
 <e12da06d-cad5-4967-af07-64c7c6e540f4@oss.qualcomm.com>
 <vi5v5bczg2wx2adfpr6ppqcad76oecitoyc7zd2i4lahla4buw@mqnppboxcyrs>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <vi5v5bczg2wx2adfpr6ppqcad76oecitoyc7zd2i4lahla4buw@mqnppboxcyrs>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a/I9NESF c=1 sm=1 tr=0 ts=69a97bfb cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=KPiuay1jFzAquJblYynD6w==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=LKgTpaOrzcEZM33zMgQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: -pWdRk5Jsvwl4CbbXDsglUvDSdvg32mq
X-Proofpoint-ORIG-GUID: -pWdRk5Jsvwl4CbbXDsglUvDSdvg32mq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDEwNCBTYWx0ZWRfX3zgqAG/90C74
 XDLVCHkfEooc3C+tz0yBkBO8WfRDg1R2K5Z3OqEwMVRrObeDCrOqjOotg9ZRcGk4PUPhxB2rtmc
 KFTYXh+v/TuBonubp7AGCcSkeeTeuMT7D4L/f4Erl3gmBui07Tc1loYIbyar9dIVMDJJJAQqWJp
 xy2ab2J0CYFrQUfRPbE5MRbcRuRbsmgSoijzcvHgh7ojeaXClC3AZ9Ofj1h+pQPEVouM+mZC8+3
 CV05FWy4+17+fUkWfpAmEIKzwIutm0+QfT0Io0xsuKlM8UK7xAbxzxnEqply8X6oZ2f9uAGAd8E
 wGQ5JQlDAYAtQbEgURsveFS0QKNkoFCLNUQbvwQnDchMT0IxVojUD+xHKzQ4BGaTnjFPkIb5b93
 zte4OWaujUUs6AhNfwdWF759szU3PEOrSk7FFyjCMVCWSEqMY+hsh1fN5NxKNB/wLH/dZaGgIe0
 xu2zKhr50z0hxYEjuRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050104
X-Rspamd-Queue-Id: 3C218212288
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54642-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 3/4/2026 3:55 AM, Dmitry Baryshkov wrote:
> On Wed, Mar 04, 2026 at 12:16:50AM +0530, Vikash Garodia wrote:
>>
>> On 2/28/2026 1:50 AM, Dmitry Baryshkov wrote:
>>> On Fri, Feb 27, 2026 at 07:41:20PM +0530, Vikash Garodia wrote:
>>>> Introduce different context banks(CB) and the associated buffer region.
>>>> Different stream IDs from VPU would be associated to one of these CB.
>>>> Multiple CBs are needed to increase the IOVA for the video usecases like
>>>> higher concurrent sessions.
>>>>
>>>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> ---
>>>>    .../platform/qcom/iris/iris_platform_common.h      | 18 +++++++
>>>>    drivers/media/platform/qcom/iris/iris_probe.c      | 60 ++++++++++++++++++++--
>>>>    drivers/media/platform/qcom/iris/iris_resources.c  | 36 +++++++++++++
>>>>    drivers/media/platform/qcom/iris/iris_resources.h  |  1 +
>>>>    4 files changed, 111 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>> index 5a489917580eb10022fdcb52f7321a915e8b239d..03c50d6e54853fca34d7d32f65d09eb80945fcdd 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>> @@ -204,6 +204,22 @@ struct icc_vote_data {
>>>>    	u32 fps;
>>>>    };
>>>> +enum iris_buffer_region {
>>>> +	IRIS_BITSTREAM_REGION		= BIT(0),
>>>> +	IRIS_NON_PIXEL_REGION		= BIT(1),
>>>> +	IRIS_PIXEL_REGION		= BIT(2),
>>>> +	IRIS_SECURE_BITSTREAM_REGION	= BIT(3),
>>>> +	IRIS_SECURE_NON_PIXEL_REGION	= BIT(4),
>>>> +	IRIS_SECURE_PIXEL_REGION	= BIT(5),
>>>
>>> Can a context bank belong to multiple regions at the same time?
>>
>> yes, they would.
> 
> How? Each set of CBs is defined by a separate function in the DT. How
> can CB belong to multiple regions? Could you please provide an example?

SM8550 would have same stream id for VPU hardwares (tensilica and 
vcodec) accessing bitstream and non pixel regions. Thereby non_pixel and 
bitstream regions would map to one CB.
While kaanapali would have different stream id for tensilica accessing 
non pixel region and vcodec accessing bitstream region, thereby having 
different CB.

> 
>>
>>>
>>>> +};
>>>> +
>>>> +struct iris_context_bank {
>>>> +	struct device *dev;
>>>
>>> Separate data and the actual device. Define a wrapper around struct
>>> device for the actual runtime usage.
>>
>> we still have to store the list of dynamically created device. Name can be
>> used to fetch the device from the list, i think the existing approach is
>> simpler ?
> 
> You don't need a list. You have an array of the size, which is known and
> fixed. You have at most 9 functions, which means less than 9 devices.
> 

as mentioned above, its not the same for all platforms to have one to 
one mapping between CBs and buffer region. Thereby indexing based on 
array would be an issue here
It would end up something like this, considering [dev region] array,

SM8550
non_pixel_device  non_pixel_region
non_pixel_device  bitstream_region
pixel_device      pixel_region

kaanapali
non_pixel_device  non_pixel_region
bitstream_device  bitstream_region
pixel_device      pixel_region


>>
>>>
>>>> +	const char *name;
>>>> +	const u32 f_id;
>>>> +	const enum iris_buffer_region region;
>>>> +};
>>>> +
>>>>    enum platform_pm_domain_type {
>>>>    	IRIS_CTRL_POWER_DOMAIN,
>>>>    	IRIS_HW_POWER_DOMAIN,
>>>> @@ -246,6 +262,8 @@ struct iris_platform_data {
>>>>    	u32 inst_fw_caps_enc_size;
>>>>    	const struct tz_cp_config *tz_cp_config_data;
>>>>    	u32 tz_cp_config_data_size;
>>>> +	struct iris_context_bank *cb_data;
>>>> +	u32 cb_data_size;
>>>
>>> Do they differ from platform to platform?
>> Yes
>>
>>> Mark them as const, it should be data only.
>>
>> cb_data_size can be marked as const
> 
> Why is cb_data non-const?

dev is being updated once created dynamically.

> 
>>
>>>
>>>>    	u32 core_arch;
>>>>    	u32 hw_response_timeout;
>>>>    	struct ubwc_config_data *ubwc_config;
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>>>> index ddaacda523ecb9990af0dd0640196223fbcc2cab..557adb038328a75510591d91569819abc0b7b1c9 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>>>> @@ -123,6 +123,49 @@ static int iris_init_resets(struct iris_core *core)
>>>>    				     core->iris_platform_data->controller_rst_tbl_size);
>>>>    }
>>>> +static void iris_destroy_child_device(struct iris_context_bank *cb)
>>>> +{
>>>> +	struct device *dev = cb->dev;
>>>> +
>>>> +	if (dev)
>>>> +		device_unregister(dev);
>>>> +
>>>> +	cb->dev = NULL;
>>>> +}
>>>> +
>>>> +static void iris_deinit_context_bank_devices(struct iris_core *core)
>>>> +{
>>>> +	struct iris_context_bank *cb;
>>>> +	int i;
>>>> +
>>>> +	for (i = 0; i < core->iris_platform_data->cb_data_size; i++) {
>>>> +		cb = &core->iris_platform_data->cb_data[i];
>>>> +		iris_destroy_child_device(cb);
>>>> +	}
>>>> +}
>>>> +
>>>> +static int iris_init_context_bank_devices(struct iris_core *core)
>>>> +{
>>>> +	struct iris_context_bank *cb;
>>>> +	int ret, i;
>>>> +
>>>> +	for (i = 0; i < core->iris_platform_data->cb_data_size; i++) {
>>>> +		cb = &core->iris_platform_data->cb_data[i];
>>>> +
>>>> +		ret = iris_create_child_device_and_map(core, cb);
>>>> +		if (ret)
>>>> +			goto err_deinit_cb;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +
>>>> +err_deinit_cb:
>>>> +	while (i-- > 0)
>>>> +		iris_destroy_child_device(&core->iris_platform_data->cb_data[i]);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>>    static int iris_init_resources(struct iris_core *core)
>>>>    {
>>>>    	int ret;
>>>> @@ -193,6 +236,7 @@ static void iris_remove(struct platform_device *pdev)
>>>>    		return;
>>>>    	iris_core_deinit(core);
>>>> +	iris_deinit_context_bank_devices(core);
>>>>    	video_unregister_device(core->vdev_dec);
>>>>    	video_unregister_device(core->vdev_enc);
>>>> @@ -275,12 +319,18 @@ static int iris_probe(struct platform_device *pdev)
>>>>    	platform_set_drvdata(pdev, core);
>>>> -	dma_mask = core->iris_platform_data->dma_mask;
>>>> -
>>>> -	ret = dma_set_mask_and_coherent(dev, dma_mask);
>>>> +	ret = iris_init_context_bank_devices(core);
>>>>    	if (ret)
>>>>    		goto err_vdev_unreg_enc;
>>>> +	dma_mask = core->iris_platform_data->dma_mask;
>>>> +
>>>> +	if (device_iommu_mapped(core->dev)) {
>>>> +		ret = dma_set_mask_and_coherent(core->dev, dma_mask);
>>>> +		if (ret)
>>>> +			goto err_deinit_cb;
>>>> +	}
>>>> +
>>>>    	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
>>>>    	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));
>>>> @@ -288,10 +338,12 @@ static int iris_probe(struct platform_device *pdev)
>>>>    	pm_runtime_use_autosuspend(core->dev);
>>>>    	ret = devm_pm_runtime_enable(core->dev);
>>>>    	if (ret)
>>>> -		goto err_vdev_unreg_enc;
>>>> +		goto err_deinit_cb;
>>>>    	return 0;
>>>> +err_deinit_cb:
>>>> +	iris_deinit_context_bank_devices(core);
>>>>    err_vdev_unreg_enc:
>>>>    	video_unregister_device(core->vdev_enc);
>>>>    err_vdev_unreg_dec:
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
>>>> index 773f6548370a257b8ae7332242544266cbbd61a9..be58e8620086d0f82c2c2bda29247483f5c56d79 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_resources.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
>>>> @@ -6,6 +6,7 @@
>>>>    #include <linux/clk.h>
>>>>    #include <linux/devfreq.h>
>>>>    #include <linux/interconnect.h>
>>>> +#include <linux/iris_vpu_bus.h>
>>>>    #include <linux/pm_domain.h>
>>>>    #include <linux/pm_opp.h>
>>>>    #include <linux/pm_runtime.h>
>>>> @@ -141,3 +142,38 @@ int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type
>>>>    	return 0;
>>>>    }
>>>> +
>>>> +static void iris_device_release(struct device *dev)
>>>> +{
>>>> +	dev_set_drvdata(dev, NULL);
>>>> +	kfree(dev);
>>>> +}
>>>> +
>>>> +int iris_create_child_device_and_map(struct iris_core *core, struct iris_context_bank *cb)
>>>> +{
>>>> +	struct device *dev;
>>>> +	int ret;
>>>> +
>>>> +	dev = kzalloc_obj(*dev);
>>>> +	if (!dev)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	dev->release = iris_device_release;
>>>> +	dev->bus = &iris_vpu_bus_type;
>>>> +	dev->parent = core->dev;
>>>> +	dev->coherent_dma_mask = core->iris_platform_data->dma_mask;
>>>> +	dev->dma_mask = &dev->coherent_dma_mask;
>>>> +
>>>> +	dev_set_name(dev, "%s", cb->name);
>>>> +	dev_set_drvdata(dev, cb);
>>>> +
>>>> +	ret = device_register(dev);
>>>> +	if (ret) {
>>>> +		put_device(dev);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	cb->dev = dev;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
>>>> index 6bfbd2dc6db095ec05e53c894e048285f82446c6..b7efe15facb203eea9ae13d5f0abdcc2ea718b4d 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_resources.h
>>>> +++ b/drivers/media/platform/qcom/iris/iris_resources.h
>>>> @@ -15,5 +15,6 @@ int iris_unset_icc_bw(struct iris_core *core);
>>>>    int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
>>>>    int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
>>>>    int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
>>>> +int iris_create_child_device_and_map(struct iris_core *core, struct iris_context_bank *cb);
>>>>    #endif
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>
> 


