Return-Path: <linux-media+bounces-43266-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A12ABA3FE0
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 15:57:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F0091892016
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 13:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 535A72F90C4;
	Fri, 26 Sep 2025 13:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kpp4eoz7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B1D2F83AC
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 13:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758894940; cv=none; b=rRvMHZV44nQ/H6Xhmgf6xnyXn8cUibHnOzlszMcMkJ9KSZDHquwMbjcnqd0OD7vTera74FK4xd/Ycs8Svw6buZ9XGLpKduhCLP5J+kvV+0v6aKxMMAeg4PPXR6Ht6KtxFhGk3vyt01WuxiRaQAxe+rUj1zOFweLVyRnbQE9AXkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758894940; c=relaxed/simple;
	bh=LJ+ueTE0bDWUCWdc4ScZPk1W991TIS8P7+CZKeVEoAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rLjvRGTqdW+6smpP1lA5aEEHAW2G+Y9Yfn6tNUlX+clm+nh6b9Gpp6HW+rmZ9HlzFKS2DXZp1ElavXIMqmEDVafcDze/25vme41YGoFnVmILgFXNG8Qdw6tfM5Mh430gYZsgJThQHkawH9/Nrq8AbaQfBUHQKIGjC46omVwwglw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kpp4eoz7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q9jh8e024023
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 13:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t/0WdPEeGFmFc2UEt2SE4Y9yd1OQcuTfJccTLwtozas=; b=kpp4eoz7wkAJpTiY
	w3yfFTh+Bpv9NrC+mwKmIufcC4wgRwEh4Rp/91KmFbSwub5F3gR5G8Cgf4vLupMV
	WWSEAna2qAB4KH1Ki0WdK6Yd/qvaWssNCr9utyk3p/XR/AEEna9LMubNb9cJo63M
	xzRuN48GwZ5WCO8Y70MU4j7NBoPKWuz1/m6hfTp9cxIusrHNm+sAYeJEbhxs2/Gr
	SedeS38rpCMEEKHZrGiC+93p9bNpj/ILJR7qoNCfMcc/qe3gLJgpO6KcKRrY5zBg
	cH6udCIlvXwNWbqOM8UoBitCikQX3bkWZNDEZ+ogwR4AmdpboAlvlRgAj8mKxa9F
	NQnEmg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49drfwgp6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 13:55:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b55118e2d01so1585805a12.1
        for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 06:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758894938; x=1759499738;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t/0WdPEeGFmFc2UEt2SE4Y9yd1OQcuTfJccTLwtozas=;
        b=CqEDkM3omnJkxduXri6sw+/qkYZfkRj+z28SYO/h8hDCruAKq6Pr9zX5ODZWJUpbbe
         cRZg7erWiiO1buecWNUlZDbYJghcy9XiVfpwPawVbxwfPQ9bt4CVDbUVBRA1QyUqKnIf
         mynM9umbA62AzXiaMzPTUiCZsR1NiorYyDtr4XQqnfjYVyIMssDJM35lKsY/IIKBhn0P
         j0wHFZHjk3q+l2F+4R3p0ntq5Sgh9VUvP7MSp/+9GZo5D3bi9+f0YUDCUQnWyXVehxvK
         4u4M0XnyrSDZfrSWendNUnQqEr76g2y7oIvw/aA4DhxDsEHEVc6RIYTCGnL0DmcvnQoQ
         mgGg==
X-Forwarded-Encrypted: i=1; AJvYcCUDl7OKaZQ2/xZHWx9kfB+SMVYr/uzSpJX1qvRvJRIIZghWsYZ43CVoK+lk3iDMmTz5iBKqXte3pfqhug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw40VFcDvb5Y6IsQHICSxd/klMplWznVX93Q0XXTiZpQ5IV9c4D
	a7JhxUodb0Y4ItszjxtMH7mQNZyQMQJLB3GXD+3OoeoIQaPQodfOCZBLSiNoyB84+AVpLXVO23G
	SQFOH4EuKBBVRYObanBbDY1HdGmyNKUhXIB6gv0lvrcsT3mP3bOor6rxHfHCuiy5bNA==
X-Gm-Gg: ASbGncszm+OZbGe51zfAXhaMQXO9WThi125BL0deLTP74mmhqowiR3/OVrLJuz72UUN
	JZOIBzgi+Gcvb1tK5sdf4DTEwl/gUYHn2bHAqcJVbyKHMmlGQLGvhx0/aAdd7jmlovCPsBwi2WQ
	70OLw0UIKfc2VwLoma+RaT1r8kSc7oy0W77JdymtPtdF+aTqYT9WxTxmnI5Ahc42gLRFgn1DGhx
	plopAuL6Pq+9LbYewcVthrlmaIxiloz4FLVaxgyL5RwmSx6m50lxFVdlqwuqP+RkRHerQ4KZ6S5
	x7VJ5padp4JhmDDofdo2iglaWUonNqPbSJqlXSz8wT5XQCVkz6G6RuNx+gPTSi55//y6+gna
X-Received: by 2002:a05:6a20:3d88:b0:2e6:a01e:f229 with SMTP id adf61e73a8af0-2e7cdda13b7mr9392160637.30.1758894937581;
        Fri, 26 Sep 2025 06:55:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQn3apaZplc6IpGFkileVv3rgMceoNRvwTZIfdt27hxJke1P6Jas/4sFLWPbGfnXSZUbQ8VQ==
X-Received: by 2002:a05:6a20:3d88:b0:2e6:a01e:f229 with SMTP id adf61e73a8af0-2e7cdda13b7mr9392141637.30.1758894937131;
        Fri, 26 Sep 2025 06:55:37 -0700 (PDT)
Received: from [10.204.100.85] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c057ecsm4478394b3a.80.2025.09.26.06.55.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 06:55:36 -0700 (PDT)
Message-ID: <b5d465e9-e84c-fabf-f275-3d0a5abf764f@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 19:25:30 +0530
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
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
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
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <7c6ab647-0c54-4480-9eb2-5c2bbf5f857d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MGikEkJmGBU_U9zevTNGGHA5unFtayY9
X-Authority-Analysis: v=2.4 cv=JKA2csKb c=1 sm=1 tr=0 ts=68d69b5a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=WMJ26Vy-SEQUeRUQdDoA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: MGikEkJmGBU_U9zevTNGGHA5unFtayY9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDA4OSBTYWx0ZWRfX+CIxnqoObKE9
 Z7OKUWhTlPL3vjKI98Jy5cOZN0eSVHqMskEHZ+9zNKnGWLdBHgoQJyQqjgvCofTntj4AMqjsTnL
 AnZ2YEjiQ/JAC/UOX+og3+GlQGveDUhhPUzCKjbN+DvREXDpGuukG4NaxxY90VwCniFRnd5T3gv
 heFlf5FVGEsp59WqxDi33nR1YeSIajBxhEixuZrKbN1AP7BXSyyOyW49Q1ICI/Drtkv0sILUOix
 rNs+81FK5qJ+P4bc81HWhyyx1q4Fh40ByIhhhYgtEgRhORDsoEcB3MfMHF4ZMojxbDpKrYEM9Wy
 eWJg216PDRMsJH2KqBR2YE3+yHyV92DL3uteLJmzPo/id7eF//MBp1zmR+Y+ezXqhqbjmmUDSJc
 zjJndLiSM20FmR/T7XCWxT6NVYut3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509260089


On 9/26/2025 5:17 PM, Konrad Dybcio wrote:
> On 9/25/25 9:38 PM, Dmitry Baryshkov wrote:
>> On Fri, Sep 26, 2025 at 01:01:29AM +0530, Vikash Garodia wrote:
>>>
>>> On 9/26/2025 12:55 AM, Dmitry Baryshkov wrote:
>>>> On Thu, Sep 25, 2025 at 04:44:39AM +0530, Vikash Garodia wrote:
> 
> 
> [...]
> 
>>>>> +  power-domains:
>>>>> +    minItems: 5
>>>>> +    maxItems: 7
>>>>
>>>> You are sending bindings for a single device on a single platform. How
>>>> comes that it has min != max?
>>>
>>> I was planning to reuse this binding for the variant SOCs of kaanapali/vpu4. If
>>> we do not have min interface, then for those variants, we have to either have
>>> separate bindings or add if/else conditions(?). Introducing min now can make it
>>> easily usable for upcoming vpu4 variants.
>>
>> No, it makes it harder to follow the changes. This platform has
>> this-and-that requirements. Then you add another platform and it's clear
>> that the changes are for that platform. Now you have mixed two different
>> patches into a single one.
> 
> Vikash, preparing for future submissions is a very good thing,
> however "a binding" can be thought of as a tuple of
> 
> (compatible, allowed_properties, required_properties)
> 
> which needs(asterisk) to remain immutable
> 
> You can make changes to this file later, when introducing said
> platforms and it will be fine, so long as you preserve the same allowed
> and required properties that you're trying to associate with Kanaapali
> here

Let say, we have a kaanapali hardware (calling it as kaanapali_next) with 6
power domains, instead of 7, given that one of the pipe is malfunctional or
fused out in that hardware distrubution, should the binding be extended for such
variant like below ?

power-domains:
  maxItems: 7

  - if:
      properties:
        compatible:
          enum:
            - qcom,kaanapali_next-iris
    then:
      properties:
        power-domains:
          maxItems: 6

    else:
      properties:
        power-domains:
          maxItems: 7

Also, what is the downside in existing approach where we say that the hardware
can be functional with 5 pds, and 2 are optional based on hardware having them
or not ? So all combinations of [5, 6, 7] pds are valid. IIUC, the optional
entries are made for such cases where some hardware parts are variable, please
correct my understanding.

Regards,
Vikash

> (i.e. YAML refactors are OK but the result must come out identical)
> 
> Konrad

