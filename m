Return-Path: <linux-media+bounces-43847-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B14BC1A92
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 16:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 63D494F48A5
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 14:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DE6D2E11C8;
	Tue,  7 Oct 2025 14:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RCNjlgwf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184532E173E
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 14:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759846287; cv=none; b=QhV9qscF5jikCfpsrFLiH/VqYAiVQeDBrOLH/bfgM56h4OJfWyJ1BirO7UQbOaJ2Jkqor3h/WfdH85Gjvdxm/I7EBBkbvmr19s770SoVUE42X4azKRASL+mH1wrBYe4nU31zEeODZ+Fd8QIJPyIcPvcIm96UFnXuN88xQjDGMTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759846287; c=relaxed/simple;
	bh=5wQfQwqYI2fZ4w1KXVMOyK6TI0qttDsdvBxjxVjo+ns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BuswhT0Yli7+31S7AJ+/jjWhEx5g2HzbzF9AmCOmqEYIWeqaCVbStKPs+4nJTCK0KIY2cro91Rrci+eJxTT8KLLqvrPpS1/VM//06xQPAuuh0121w4+BRvwZPOHfWrtxa9NvuhZX8Jhza4mEefhugyC7NDpM8E5QWgH3nvc4KfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RCNjlgwf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597CXkJD027377
	for <linux-media@vger.kernel.org>; Tue, 7 Oct 2025 14:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ktSaSroeEeu0/UwzC26whCkkXqXo9Ky2cJhuhNttXgY=; b=RCNjlgwfOop7gG5d
	arwVlWqSWExlXBE6AuPhk+OBM/Fi3R2S05wbdkdR11TQlbTGttahPn4eJx5RVywe
	rQ0LKj+G0QTwoIEYLDRU+sTorcqIZhyO1GDBKiHzUSH7kXgW2rlVhuK8pLN6oQZi
	4VRmdeEKvYRlue5bjWQqHZ1VNxjmx7nfF4AFYRCjSl2UN++KPN8YXZaP1N0IBU1V
	TQRvLb98F3O3c6SBcwn0UsAeJylMkjWshN8YO/S410q8JUv8Qp10ihZUAz9j5JQ8
	M404ZUaj6jOK4Hj2B062p6BD89kZ/9PESg0Rw35r/tT+0JqO5hYG4WKMwqAcADu4
	0sNCAA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn7rbw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 14:11:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77f5e6a324fso9895800b3a.0
        for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 07:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759846283; x=1760451083;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ktSaSroeEeu0/UwzC26whCkkXqXo9Ky2cJhuhNttXgY=;
        b=oAb18iyPjaehXLnyg707BXcKfLEUuCsTr3Pjjez4nn8SHqTGJKblJZNeS+bSPF6r1n
         bYKMrCPYb7NBcU0229T7KnEgPtHwyff07J0Qqry1UtIT62TlMQiyHW9yereEk28vTQYa
         EzS7gTTCTGTNX6C04Pxz87gGUzoIHYcdw28a+wuqjWWqoyMre7abgbt1uLA72Un9rJaR
         DsRYsrizRkb3YKCpiKnt78LaWUAk1Uiz5XUzOsaw1c1OabeMES4sl+4r9R1f3NyVSia/
         uboOjrhjj7TJnfnLPpwbXk+qqodFglRia7bh8Q6iyBX2KhMGDXAQmDu5O7t8nR+2MIM/
         nW3g==
X-Forwarded-Encrypted: i=1; AJvYcCVpIxZk/t26eiZar/RCTevWh5GHp6eMq0+El0PbuCwsf3v/GHPsZ/RwTTG95dIMz5jkLPj66uiZsHEo6g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5O0fUuKkt80AfK7r8Lm8WIjEqLhX/KLhcPCXkxUB3+bThtLjP
	0QZeKjrX4e30fQtMRaj+9arkJG/hTNPVto9Z+FJWgdPEJ3JD0mPbE4u8MKatbV5vb8MAQwLUKiP
	8Bh9/w6iVmVcLE482kudw08YsEBhfO1TWbMem29ftSzy4X4SPwoi8CToWlq/HAQaaGA==
X-Gm-Gg: ASbGncuC1EoT7jqLfx/ua94CS4F1HcYdkyRGffOd0jwJQ3l4zCrURXn2In5xyHJJzd2
	gNnjXcrkbCVuMaJ+BHZVuqI8mdL2Tow1P6NXJvogQO1osJeSVw18exPFDWszPZnNSmrfZqZ/+gP
	5fNnF24G15wsJD3NcxZHbk/QTLz/DRPb/I7HxGPEtvoDwe1w0i6fMZoHLCWtbSAkkYWljbZc1WO
	l/fiSa18lRziCwe+vT5Ws+Z9gnfN2lnNuwXQG7Q5i31TRcz07sj4pFe7Jmjm44a5WeIrF2zPgVY
	xr+JizRO3IdEKsP9r9ZNR5UoKQzaA5l5ij9gVKQRq2cgDjmfcVWpBaEYkZFRQHJMyhtsoS1p1A=
	=
X-Received: by 2002:a05:6a21:998e:b0:302:9f3b:3e5c with SMTP id adf61e73a8af0-32b620a8d65mr21677939637.39.1759846282898;
        Tue, 07 Oct 2025 07:11:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiWYBtr6EzAYm3iarthma/0DUKSsRzYme+v56XXtnu78Nq/GDSGSQ38ocKvh8T4EgfkEtS3g==
X-Received: by 2002:a05:6a21:998e:b0:302:9f3b:3e5c with SMTP id adf61e73a8af0-32b620a8d65mr21677873637.39.1759846282301;
        Tue, 07 Oct 2025 07:11:22 -0700 (PDT)
Received: from [10.219.56.14] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099d4cfbesm15316893a12.28.2025.10.07.07.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 07:11:21 -0700 (PDT)
Message-ID: <4a32bbec-2baf-4210-a7c1-1ddcd45d30c8@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 19:41:16 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
 <f5ebf0d6-2f0b-45cc-b99a-b786e5df9edc@linaro.org>
 <5qsgbqml367yq6g5vb4lotrzulojqhi5zlwwribze373a63qrn@rxi4kwyt66m2>
 <4f38058d-a2f1-4ac5-b234-228cfb2e85ff@kernel.org>
 <1ad2ca1e-1d57-4ad8-a057-ab0d804f1d49@oss.qualcomm.com>
 <7da769b4-88e9-401f-bb21-0ff123818b9c@kernel.org>
 <6840d462-8269-4359-a6e5-d154842b62db@oss.qualcomm.com>
 <af0da28c-3ca0-41dc-aaa4-572723ea74bf@linaro.org>
 <klhvgzizub33f46buqsog54wqksqp24a5tijwyv355l2ao2imo@wdkojfebc6s2>
 <e1a6e75a-2a5d-44a2-8bbc-140eb86d1806@linaro.org>
 <2hh3zkdwgqbdurpr4tibr3gjat6arwl3dd3gxakdaagafwjdrm@aj5em4tbsjen>
Content-Language: en-US
From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
In-Reply-To: <2hh3zkdwgqbdurpr4tibr3gjat6arwl3dd3gxakdaagafwjdrm@aj5em4tbsjen>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX9abGN1e1tqbh
 QzxfU5s+AqsE87x6lEguxMLp+iYzQ3QoZHdYGGKsenjJRUbT4u6t9xY7LSMRQy5IAKprxPadnJ/
 pKe3bTlW8Dipp3TBe+pY2gais4g67qxDuj6vDP/MsZNCOSpfG5sdoZNOAPZmQZtnBt3RB1v6IwG
 jwtlG+tCoP6n4fUE7MKh3EPrG0hAZ9BZYFxSTGbHY2yIObt+XDkKmwqFUakgRN2VOpuQUTYK+BE
 8lvEJHdW9fdqHzAn7OY9Ba8YYS24rRcbLmuiFrVJYo6+HJYk9AdsQCzCKdXA1nLElYlCJdtdflm
 gFBvhY0y3QK2jCtrWKd3s0lwKWwpDlTeZOPN18l6YqSfTM9Bm5xMBX4btCGVL9OxE9xPQPEQvjX
 kuhTIHyJ1WLgmWv5z9nvl+G41FBWfw==
X-Proofpoint-GUID: PziRdMVPsBKA0NycAFLsRk2-wLo1qRdF
X-Proofpoint-ORIG-GUID: PziRdMVPsBKA0NycAFLsRk2-wLo1qRdF
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e51f8c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=XxnNId_WCiCfXLSGgVMA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001


On 7/4/2025 10:15 PM, Dmitry Baryshkov wrote:
> On Fri, Jul 04, 2025 at 09:23:06AM +0100, Bryan O'Donoghue wrote:
>> On 03/07/2025 22:23, Dmitry Baryshkov wrote:
>>>> I still give my RB for the series.
>>>>
>>>> To me the only question is should it be applied to sm8550 or to new SoCs
>>>> from now on, sa8775p, x1e and derivatives.
>>> I think we need to apply it to_all_ SoCs, maybe starting from MSM8x26
>>> and MSM8x16. Likewise, we need to think bout secure buffers usecase. And
>>> once we do that, we will realize that it also changes the ABI for all
>>> SoCs that support either Venus or Iris.
>> I think a dts change is a non-starter as its an ABI break.
>>
>> So if ABI break is out and reworking future dts to allow for a new device is
>> out, then some API change is needed to allow the driver to stop the kernel
>> automatically setting up the IOMMUs, create the new device as a platform
>> device not dependent on DT change and have the probe() of the relevant
>> drivers setup their own IOMMU extents based on - probably indexes we have in
>> the driver configuration parameters.
> 
> What about instead:
> 
> - keep IOMMU entries as is
> - Add iommu-maps, mapping the non-pixel SID

Otherways to avoid the ABI breakage:
a) Keep iommus max items as 2, which is unchanged.
b) Repeat the same sid for both entries, i.e.,
         iommus = <&apps_smmu 0x1940 0x0000>,
                - <&apps_smmu 0x1947 0x0000>;
	        + <&apps_smmu 0x1940 0x0000>;

and then create the new device as a platform device independent of dt.
RFC for this is posted[1].

However,  Dmitry(in offline forums) termed creating 2 same sid entries
as -- "ridiculous band-aid just to fulfill the "ABI" requirements and
really doesn't make sense". Looks Fair.

OTOH, To exactly implement the idea mentioned here, I have the below
questions, can you please help me with:
1) By keeping the entries in 'iommu=' as is, then add non-pixel sid in
iommu-maps actually creates the overlapping entries.

So, IIUC -- this requires changes to the iommu driver to ignore the
setting up the non-pixel sid(or whatever is mentioned in iommu-maps) and
then use newly created platform device to program the entries mentioned
in iommu-maps. Please CMIW.

If the above understanding correct -- Doesn't it look like we are trying
to fix in the iommu driver for the problem statement related to dt bindings?

2) However, I still think that problem statement of __non-eligibility
for video IP to create the sub devices in the dt__  is still valid and
can be taken separately and actually [1] is targetting this. I believe
this is atleast required for secure contexts. please CMIW.

[1]
https://lore.kernel.org/all/20250928171718.436440-1-charan.kalla@oss.qualcomm.com/

Thanks,
Charan> - In future expand iommu-maps, describing the secure contexts?


