Return-Path: <linux-media+bounces-48602-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EFBCB449B
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 00:42:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73E6F303A183
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 23:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D52AC2080C1;
	Wed, 10 Dec 2025 23:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OMNSl30Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="THJCAQmN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980362236EE
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 23:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765409536; cv=none; b=LOkccK7C4AJPOk20dZLzOIU3PbwvyXiFOacvzbAy5tscxV+M/s9GetiOMlC1cc1lT+sg1OInO2u1dAXwcjtUpBRl7IKoYGcZcO+z+LgMrCX2A49qjBpMfh+BCLhueZ98BS1F47wg67UZn38G+drfjTR+QmrCp88C6aZRx9SkDYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765409536; c=relaxed/simple;
	bh=rXJV74PZyIbYYEVRta14gC5dqrfBIxemqO2KhdZsvro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NOCMmyKe0i5bAUZKth0CuS7dVC+EO+4eq47uJ/y42NJgRm/AtWbiG8Wf04y8Jk4BHH49GjobvPf2U/3FAANjC/nP599uD4ZZGANeYCW49fBwB7sB4KhsdpweH4DhWQNmC7TJdWB2ij63G/mvKqSwAnlBvjBMhYo+gRXUttCqiOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OMNSl30Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=THJCAQmN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALSkVU3563616
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 23:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	72wOWfJSiLX61EOVIuBgnxqqsc/NzdNGa9pHm8zDq20=; b=OMNSl30ZZn236X8s
	hfhk5/otAffDUSAPXV6kqAayzsjg5mEZoytfZ8CYHUnHX8tSWrhkxBDsUqmzNvK4
	iQOadsEC2oIR7yv/YyXOX+QQi2BN1lPR4HAL3B6OKPVaMqEDExlLB3sJ2HtGtyV4
	ks+REOyp190tk0NuQKrXMW5vksWMjbEu4+MqSw1iG5qXy4TXj5DrsYqUJtkcm8H+
	iNpq9kxGN5yx06shW47dKKkjR4xrV8c/pA8jj31zgupx3phw9yjRVEZXmQE10SQC
	rgvZ6TVQT2vkpafvU0fwRCidEP7Xq0L9Ghkuamk0VUcXJ257f2xNtQcQOBdBfiJW
	ciMI/Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aygtfgat5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 23:32:13 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bf06c3426b7so625075a12.3
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 15:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765409533; x=1766014333; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=72wOWfJSiLX61EOVIuBgnxqqsc/NzdNGa9pHm8zDq20=;
        b=THJCAQmN4FKDx7sQ7fiD2BcAxDMgHM32Pa6QVOCk7te0mx5kf8CWucfQy3zUKY2Ss2
         8HJKtooO1mrC1HyICvh4kE6Jh7xd0rq7ETMOFjTmtgF5GThGhzHw48w8qebMK7+yoKEa
         mksTfgxGqlxK+jvpvyCeZDVQqsjonB2AW9CTugCvD7mjJVLxRbS3oBybSnt5jgZBLR93
         lZgQ3zl/ktgu0fB8O2GXsTRI261YuPOFQmcXDkuKwqrkJas7aJ37mlZ650uYSf0WpNj5
         F7mr76neOh2OdIaA6CEnqjwaOh4AyPdYRNLgGg1hhKDrwiUoQanAAk+85oGW5iri/ZcH
         0IDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765409533; x=1766014333;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=72wOWfJSiLX61EOVIuBgnxqqsc/NzdNGa9pHm8zDq20=;
        b=QCCTaKRsCNOH/x/FKralI+4fyoTNPJPF9zd7gS+v6/XaBTC1DZOQ45JMDr5EemzxOR
         tNvxcMPDUR83QfdPjVj4fUI69OmeQNNA/xbzeXnWk+xr3sw1DHB43t9/ASZzL1I+B/bJ
         gmHLW9WIwW4ceaRzZO7u+ddMphUyboT7klHV00IYvpPg+w1aS8fSAc7WaemXR3ONhIVq
         PybTnMlQda7YQRftcvcM2IMB4nGV+1PCQit8oJdJjk56NVWiPi39tElLfJvc2cwZcPbn
         4EPrZMuI+3qf64tPL9bTG7Gy5vgS92K6+C0+rBNvQreKT+YSp3a5lEbnITzDVLy1bk5X
         x/tw==
X-Forwarded-Encrypted: i=1; AJvYcCWfvpLhkl5fHF/ajILTtJShidmM5z4RE5xv92jCzfZF6xQ5XJglicKgU+v37zexvKJFQ6q0avr+jqlasg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHe0sXlN41LMy97upPCgGe6PkukodFglag2tFpcA0SzTl0jpKu
	MsETbwoVQTX9dvewuoL5iqVQwX+vJtaPXB8mmJaz4ko/ZN8st5VFCBnflNN2b646hH0jKDWq8mp
	H5xIR+fffOS5H2NZ9XCqqbMaGQMf4a98Y//YBh+QNoEWJql5evo8Xo46IprJ1Y3mizw==
X-Gm-Gg: AY/fxX5PuiJFoHhhk0Q5RdioQ4KDfT27PjgH3XDi/PkSs7ZwW9uh6EJe49Ggfceokjs
	MkUqv0L+hLbMTmVKSvEF01uVOuXKjPHKxScsseQxetoZgK/sNWV2ii/coi3e2UieXa+rXJYuurL
	CJXdHZouw3Y4gP77Hj2ldtJZocoKXQaTiAaUk82bwkHbK7PsHrsNkmnzhLMl6JBHxPlI71Fp92l
	3aS0Z2CSIB+2RFcGbGwsrrJyTLQuVey7Zf/GRc8EzV0Pf1KVYlnHVP8UoocTUeaxkDRIKQlU9jV
	kZ+AqtxD1myu2IJ4nik+54YEcftC31ERfs3fO3ZmFjdKqUGOOi/R/0CA02MxIK+mdJVWZSYh1gc
	BThTqudtFsNrMGChfDCgqjZ2avzejl4HQht4YclqJ
X-Received: by 2002:a05:7300:de43:b0:2a4:3593:9683 with SMTP id 5a478bee46e88-2ac052863bfmr2997621eec.0.1765409532944;
        Wed, 10 Dec 2025 15:32:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNQD2p30h9lcvMoSogf3NCKsroGTe8n4n7tWftmiXWX2enCj1ONNyHv8FufbPnjPJoS71nHQ==
X-Received: by 2002:a05:7300:de43:b0:2a4:3593:9683 with SMTP id 5a478bee46e88-2ac052863bfmr2997594eec.0.1765409532382;
        Wed, 10 Dec 2025 15:32:12 -0800 (PST)
Received: from [192.168.1.57] ([98.148.145.183])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ac1920fceesm1751292eec.5.2025.12.10.15.32.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 15:32:11 -0800 (PST)
Message-ID: <ba6f7d28-746b-4bb8-8f2f-3ec5666b71e5@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 15:32:10 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20251208-add-support-for-camss-on-kaanapali-v9-0-3fcd31258415@oss.qualcomm.com>
 <20251208-add-support-for-camss-on-kaanapali-v9-1-3fcd31258415@oss.qualcomm.com>
 <scnexmcrpemu6vcms3dmq7qjvx54h5pyumjvgqduospao4x2kt@hoi7zfygjq4f>
 <458a7841-e422-4cad-83de-f5b5c1b683a6@oss.qualcomm.com>
 <puv24qramoiq4qq3i4bibatg5ihnrv6hdloul5ajbblvasvwk3@nbse2m6aftkh>
 <2e38b9f3-8a35-4a27-82d3-c1d4996a1684@oss.qualcomm.com>
 <9ecf4783-e1a2-430b-a889-997689bafe45@oss.qualcomm.com>
 <qfhlyl46i7az56t5ceyo42mw55udzwhxgpygw3jnpw3onr6qc2@5r3i6tb6ac3v>
 <bf54a030-ee01-4b66-97d4-37f50a75d93c@oss.qualcomm.com>
 <r9iYRcJfz-QPlUHxIU_8vaHC87ctBayyOGVVtAbWEODCJjLkfQWv9rEX4b1zAIA_AWa47FcqNCmr7HxCetwcQw==@protonmail.internalid>
 <1c9db550-677e-4fdc-8929-89c21deecf17@linaro.org>
 <a512b470-4e8b-45b5-9cbc-06501e21163e@linaro.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <a512b470-4e8b-45b5-9cbc-06501e21163e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=At7jHe9P c=1 sm=1 tr=0 ts=693a02fd cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=BiHMn5M11h/vNwziJwzFrg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OIJDSj2hq_GxGYbuuZAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: T8gZUtTEoPOzrdUFyN89p4xS1QMeopRp
X-Proofpoint-GUID: T8gZUtTEoPOzrdUFyN89p4xS1QMeopRp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE5MyBTYWx0ZWRfX+yXyrS7pSvHa
 ZVP8AYFMxFw3Rvx9jUcppyVyFiTZ0nideed6+Y7MwmIFvZ+xEk5HNrW83GNGV3WTIQCxy7e2v+K
 BX2wZu8gg/rbCM36WoFwflBxilfeFLoHumSYa8ZTZ6cPH/91vd9EZdf5ThYyg9q+2p1l13COhqQ
 Wf5b/gkDm6V8sDt7R272I6yrX8+4QpTOzoFZLuhZBA2Qkw992yYAAzl3hm6nXlSueKGie0USU60
 n0pRIHHzrKP6+ndP+8ScBrK9Wju5/vImhJ7gJf8oHFSW+jktql9HZNEhf2/XjZrXKr11eIRudDC
 cAFk5WXYOK3quuWxwG6nGo8KutFvbFSeeWdTIUkqHAR9tXvqxoMHbw+MCHtoYgj9mqaaZguGWmJ
 pRFVVfSgFvvTTtaBAyIsimwSWCjvow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100193


On 12/10/2025 2:05 PM, Bryan O'Donoghue wrote:
> On 10/12/2025 21:45, Bryan O'Donoghue wrote:
>> On 10/12/2025 19:36, Vijay Kumar Tumati wrote:
>>>
>>> On 12/10/2025 11:25 AM, Dmitry Baryshkov wrote:
>>>> On Wed, Dec 10, 2025 at 09:50:51AM -0800, Vijay Kumar Tumati wrote:
>>>>> On 12/8/2025 3:21 PM, Vijay Kumar Tumati wrote:
>>>>>> On 12/8/2025 2:48 PM, Dmitry Baryshkov wrote:
>>>>>>> On Mon, Dec 08, 2025 at 01:03:06PM -0800, Vijay Kumar Tumati wrote:
>>>>>>>> On 12/8/2025 11:53 AM, Dmitry Baryshkov wrote:
>>>>>>>>>> +  interconnects:
>>>>>>>>>> +    maxItems: 4
>>>>>>>>>> +
>>>>>>>>>> +  interconnect-names:
>>>>>>>>>> +    items:
>>>>>>>>>> +      - const: ahb
>>>>>>>>>> +      - const: hf_mnoc
>>>>>>>>>> +      - const: sf_icp_mnoc
>>>>>>>>>> +      - const: sf_mnoc
>>>>>>>>> You know... Failure to look around is a sin. What are the 
>>>>>>>>> names of
>>>>>>>>> interconnects used by other devices? What do they actually 
>>>>>>>>> describe?
>>>>>>>>>
>>>>>>>>> This is an absolute NAK.
>>>>>>>> Please feel free to correct me here but, a couple things.
>>>>>>>>
>>>>>>>> 1. This is consistent with
>>>>>>>> Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml. 
>>>>>>>> no?
>>>>>>> I see that nobody noticed an issue with Agatti, Lemans and Monaco
>>>>>>> bindings (Krzysztof?)
>>>>>>>
>>>>>>> Usually interconnect names describe the blocks that are connected.
>>>>>>> Here
>>>>>>> are the top results of a quick git grep of interconnect names 
>>>>>>> through
>>>>>>> arch/arm64/dts/qcom:
>>>>>>>
>>>>>>>        729 "qup-core",
>>>>>>>        717 "qup-config",
>>>>>>>        457 "qup-memory",
>>>>>>>         41 "usb-ddr",
>>>>>>>         41 "apps-usb",
>>>>>>>         39 "pcie-mem",
>>>>>>>         39 "cpu-pcie",
>>>>>>>         28 "sdhc-ddr",
>>>>>>>         28 "cpu-sdhc",
>>>>>>>         28 "cpu-cfg",
>>>>>>>         24 "mdp0-mem",
>>>>>>>         17 "memory",
>>>>>>>         14 "ufs-ddr",
>>>>>>>         14 "mdp1-mem",
>>>>>>>         14 "cpu-ufs",
>>>>>>>         13 "video-mem",
>>>>>>>         13 "gfx-mem",
>>>>>>>
>>>>>>> I hope this gives you a pointer on how to name the interconnects.
>>>>>>>
>>>>>>>> 2. If you are referring to some other targets that use, "cam_"
>>>>>>>> prefix, we
>>>>>>>> may not need that , isn't it? If we look at these interconnects
>>>>>>>> from camera
>>>>>>>> side, as you advised for other things like this?
>>>>>>> See above.
>>>>>> I see, so the names cam-cfg, cam-hf-mem, cam-sf-mem, cam-sf-icp-mem
>>>>>> should be ok?
>>>>>>
>>>>>> Or the other option, go exactly like
>>>>>> Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml.
>>>>>>
>>>>>> What would you advise?
>>>>>>
>>>>> To keep it consistent with the previous generations and still
>>>>> represent the
>>>>> block name, we will go ahead with the style in qcom,sc8280xp-
>>>>> camss.yaml. If
>>>>> anyone has any concerns, please do let us know.
>>>> Krzysztof, Bryan, your opinion? My preference would be to start using
>>>> sensible names, but I wouldn't enforce that.
>>>>
>>>>>>>>>> +
>>>>>>>>>> +  iommus:
>>>>>>>>>> +    items:
>>>>>>>>>> +      - description: VFE non-protected stream
>>>>>>>>>> +      - description: ICP0 shared stream
>>>>>>>>>> +      - description: ICP1 shared stream
>>>>>>>>>> +      - description: IPE CDM non-protected stream
>>>>>>>>>> +      - description: IPE non-protected stream
>>>>>>>>>> +      - description: JPEG non-protected stream
>>>>>>>>>> +      - description: OFE CDM non-protected stream
>>>>>>>>>> +      - description: OFE non-protected stream
>>>>>>>>>> +      - description: VFE / VFE Lite CDM non-protected stream
>>>>>>>>> This will map all IOMMUs to the same domain. Are you sure that
>>>>>>>>> this is
>>>>>>>>> what we want? Or do we wait for iommu-maps to be fixed?
>>>>> Yes, when it is available, we can start using iommu-maps to create
>>>>> separate
>>>>> context banks.
>>>> It would be necessary to justify removing items from the list. 
>>>> Wouldn't
>>>> it be better to map only necessary SIDs now and add other later 
>>>> once we
>>>> have iommu-maps?
>>> I will let Bryan take the call on this. He was the one who wanted all
>>> the SIDs in the bindings. Hi @Bryan, if you can kindly share your
>>> thoughts on this and the interconnect naming, we will go ahead and push
>>> rev 10 for this. I believe we have taken care of other things. Thank 
>>> you.
>>>>
>>
>> Since when are we delaying patches for future patches that may land 
>> never ?
>>
>> I'm fine with whatever clock name changes you can agree with Krzysztof
>> but it seems a bit ironic to me to be given feedback to "align with
>> previous dts" to then have the result be further change.
>>
>> I'd like a bit of stability and consistency TBH.
>>
>> ---
>> bod
>>
>
> My feedback is
>
> - Include the full list of SIDs
> - Stick to previous clock and interconnect names
>
> Your other alternative is to suspend Kaanapali CAMSS unless/until 
> iommu-map is landed.
>
> As I say though "change your patch until my other patch is landed" is 
> the opposite of how things are supposed to be done.
>
> I recommend you focus on your own series. If iommu-map gets merged 
> first, adapt.
>
> If not, don't delay your work to accommodate stuff that is up in the 
> air which for all you know may never land or may take six more months.
>
> ---
> bod
Makes sense. Thanks Bryan, Dmitry. We will update this to,

Interconnect names: cam_ahb, cam_hf_mnoc, cam_sf_mnoc, cam_sf_icp_mnoc, 
consistent with a set of previous generations.

CX domain AXI clock names: gcc_axi_hf, gcc_axi_sf, consistent with other 
bindings.

We will post rev10 with these. Thanks.



