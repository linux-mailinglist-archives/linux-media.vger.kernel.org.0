Return-Path: <linux-media+bounces-45390-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A9AC01780
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 15:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D27FF3A3FB3
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 13:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E85315D5A;
	Thu, 23 Oct 2025 13:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b5HxI8CD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06F6315D57
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 13:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761226311; cv=none; b=XCRWfB2uN3+9q2fjFEctSxbpvLkiGeTJj31fchj0pMFGM8oLiG/UOsiG0vdXPPiINnz5U9FRUSO5cz5c09t2Bolh8ezxiaEcqVpldOAkTj0ZsV2jhkKcXvt4eTXI3dQqKzjvjnIh7dm0IeJSk0PAmlzmiCK7Hh8s95xqpULMr5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761226311; c=relaxed/simple;
	bh=9ZKyN3cdb8SM8RV2bRmg2Dr4cVLPODTsGcnFJEUCYzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aCEkpalSqylIa+UKXVEXJiE7D3Nbih5cWmnnJ3uD6GjRh6HQxclMuGAJ1tT5KBMo5iXXI2DSNO1HTWrBl/AMR0E7O1riN1P7tO7/6gR5Vk5nRF+CSwy7+X2rq9n4PduYtQfIpLAtLGc5DYKJv73Cze2f0+mJ6HHih+5Q+iUjMWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b5HxI8CD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6xFDC029916
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 13:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RNvE9iSxoXTP/UG2qG1WyVpzFpKobLzR+EucBkWbTNc=; b=b5HxI8CD5xDzQUTd
	CHhuxudUqqwfII+P4qSWjh6Zp7qVu2MzBPYjuWPt1by4Aq7LVpJiaSzDFGP+LBWX
	MUPmiTEZMmundJTBYrvZI8wX38F8WXbHCBzRvaZEfZPI9yYibRjjY5qAmEoUcGur
	fhfkrI7zxs25Kh4B7cR7t/TJYcL7CXeL1ua8tgipYDiACgM9BEzyGHcD/JaNRo4R
	73Vd4gk6UYaziqBzNeR3RZmnyGNeDbXwWOnU13wD8rbUfFAMW9COa4ZQ8agZwkfn
	dW0F2hgnBYK6bHrZGKUHzOszsgAJAo8ELtnudZjEt2vRzQUbnLAtS8LCh8bFGlTC
	zyp4vQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2ge8hfj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 13:31:48 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5d7dce38a79so87389137.2
        for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 06:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761226308; x=1761831108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RNvE9iSxoXTP/UG2qG1WyVpzFpKobLzR+EucBkWbTNc=;
        b=vJFXG0JxkHpS8hidyuud65GfMSl61Fihz0Yz55rv/4tRuFO0pNijBKEx173RvSPW8c
         aiYIQH6xOnmGPm9DgIVbzPKsOe9dklBoaWC6zOHKhZddXf3SCb3Ox5PxpF9Qy3gWwIM2
         fA1o1wedCDe0ToCcyVbeyeIZ3zj+sEesgDpA7C7tDCeph7QUblk269peqYVoFPLw0aTA
         ZCqJzkFaxBdfop6scjnvmxZTHwlJ5MR6uUbWnJg23GOoZf6u/4srPNnVLgTm4BPdxYQ0
         /xPniavvZ/wkNo7Ns13EarATzTbUH3R23PnP6U0Ou5GeN8Peh4Ar3pF99DKjBM+ClBT9
         oGJw==
X-Forwarded-Encrypted: i=1; AJvYcCWy/UsVT7teZaJHGta3kNdyPfTg+epyogUFsAV8frVouTPBdYjEDTA84W/V67ndEPRdsEIaP6jllcoQag==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQn59j4yzC4YLpR3H3gGY870FRucDYD2UhwOfzQu+MVD225K0b
	Bh+9XLn82T0I9ZZJft9R73N8D9WsjX20uF1gyeqcHzIAjHAxEUNdWf5YzQizoO1vbOXBzfoo87Y
	gIcCKTdYKpx3ZECxUwJEjQiksOoexdpqlAgQiyLaw3eHxXyiGNMBvomI2RAvvyl110A==
X-Gm-Gg: ASbGncv/UYS/fuEyZ68r6d5/I4wbG4epmuapidcRc5ySOF1pbp7FfvMxXVOV4S+v9Jg
	UbLUKO7rSoGep27NOFd2h9hWlajjspGfoVOTxYTJe9BA0HSHUUI094vLrjaybVDolM7iCq3JrGC
	WRRQBhyXIVMj52XiRyUgHbilZfR6r9s10iZPqgMLX56kG1gpa9aBqXidWjZeLip8n7zFZ0jt5FQ
	0mYd2i+TsSMAi8qEcIvjjcZYTP5p1C8Vjbi/K7znwT6nHPnEDXvpUcbwHNxALcR9xSwMdPGT/zx
	92NUeefntcqS5DwxhP7B17BbrlkeU6KAO5QmVdb+sWZ1xbjjhhurEdjnbS1kLnwd6qu5CKDE8hd
	Z/sR+r05pO5OgHE+WS4w8dAuzzBlh0lHupsdbnruMg5YVFYQEyiYy9q1Z
X-Received: by 2002:ac5:ccd7:0:b0:552:40cd:4d8 with SMTP id 71dfb90a1353d-55685efb75amr1145193e0c.0.1761226307710;
        Thu, 23 Oct 2025 06:31:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqX+28d9ltJg5RXmi0zz1Laxbv+UmWM9hxqP0xoVRd+VBPPciaDezjwwmWDGu+5ZMh7iTJrQ==
X-Received: by 2002:ac5:ccd7:0:b0:552:40cd:4d8 with SMTP id 71dfb90a1353d-55685efb75amr1145173e0c.0.1761226307229;
        Thu, 23 Oct 2025 06:31:47 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d5144cfa4sm211886766b.60.2025.10.23.06.31.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 06:31:46 -0700 (PDT)
Message-ID: <41183580-b917-47c8-8612-426f3ae48e50@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 15:31:45 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, linux-firmware@kernel.org,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <2llwkhpwbkzqyvyoul2nwxf33d6jhuliblqng4u2bjtmsq7hlj@je3qrtntspap>
 <5a03b200-4e1f-082a-c83a-cb46ad4cea09@quicinc.com>
 <zj2dreqyj7fnhiophdtevhuaohlpk3uoccrslkqt5wjt2jhiip@gqnasgvu7ipq>
 <yeJvz1BmQX5QCjBXnjFbGz8gclNViebyCcZC1Rz2tfocg3MxOAncJZruBARGqAzxG_1UJmw35EUBl80KQy5Sqw==@protonmail.internalid>
 <f1e9ddb0-683d-4c91-f39b-6954c23f7f75@quicinc.com>
 <015dc909-ad0b-4367-8dac-bed53c4f7f9b@linaro.org>
 <k4al7vwl4qruiv7olqlj3qe4gah6qrboyzsbnvfarlgr3amili@wjmkthnxsgmf>
 <7933f6e4-e8e7-4d35-9295-e6b91adcc128@oss.qualcomm.com>
 <CAO9ioeUXsb9UisWbc763-2SvU_-2Ce7qmQ27Wzwt-fWSzHBAeQ@mail.gmail.com>
 <b7623cb3-07d6-49be-a8d7-f9512f3cb6ef@linaro.org>
 <hsj3ravxgkhnbnks7wl47qqwsef3loi44jkgahzgx2m7k4sjld@endp4nl3h6ek>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <hsj3ravxgkhnbnks7wl47qqwsef3loi44jkgahzgx2m7k4sjld@endp4nl3h6ek>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX5l8x+4EZ6B1o
 cf4Sr5CtrxPUYnpzhYzJyrP2GNiWsmCpAbi/2XAjPJvhVuhJ1UZ5eg/pEhbsHhN1YrIgQ2kpl7E
 obXSp0URQrhf+No46UnG/aa7iDP2meT8vbmLX3g09w1Rps3o+okmyyG7Ks3bY6PiNmBE0DwhwKO
 kThKJDUexGQwE1yuxF5cklaWyrifiuzesc1b8J1zwvZ6SHnS2KA9xDOJJljpm7XTxhomKz1/FnC
 qu/c91YYXeaOaEAnBHiVh6v1X9/h0+/gfnc7VHwySGT9CG1MEJVlks4DnITpXpuvXgGGYgZie8p
 7q8Ad286NN/JqynwtwuDYqNR9akjlmpa+3DXZijUJugGe72n0SFF1hYu2Yw55vIl/Y3abbb4BTk
 3yAqY3YJY8xuQxOBbH3RPzAGPM0LkQ==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68fa2e44 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=n1Ua2TvkZ0XBjMMAIBMA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: tvQGk1Uz3wRAbgefjnp0G5ezrYSqvHMT
X-Proofpoint-ORIG-GUID: tvQGk1Uz3wRAbgefjnp0G5ezrYSqvHMT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020

On 10/3/25 3:01 AM, Dmitry Baryshkov wrote:
> On Thu, Oct 02, 2025 at 04:07:37PM +0100, Bryan O'Donoghue wrote:
>> On 02/10/2025 15:59, Dmitry Baryshkov wrote:
>>>> * Iris could be then taught to expect vpu_whatever_gen2.mbn first, and if
>>>>    that is not found, attempt to load vpu_whatever.mbn (for the gen1 intf)
>>>>
>>>> WDYT?
>>> Well, I think that potentially complicates the driver by requiring
>>> support for both HFIs for the same platform, it requires detection,
>>
>> Doesn't have to be anything more complicated than a reserved string name.
>>
>> BTW you're right the main reason to support this is - in effect - ending of
>> support for gen1 firmware.
>>
>> But then in reality if that is the direction of travel, its in the interests
>> of upstream and users to make the transition.
> 
> Okay. I did a quick comparison. FP5 has gen1 firmware, is vendor-signed
> with the T2Mobile cert and I assume it is fused. We were going to drop
> support for sc7280 from venus in favour of supporting it in iris. What
> would be a migration plan for FP5 users?

Just like I explained, the iris driver would load in its place, it would
retrieve the firmware binary, decide which flavor of HFI it provides and
then decide which ops to use

Konrad

