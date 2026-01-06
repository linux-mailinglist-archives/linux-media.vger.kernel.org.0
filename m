Return-Path: <linux-media+bounces-50059-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8569FCFA077
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 19:17:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5CEFF300A917
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 18:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529FB3570CB;
	Tue,  6 Jan 2026 18:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L8aLLcf7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ccPbBPTA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFE6352947
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 18:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767722675; cv=none; b=R592cpMrj5jxuv0FMdITBzqU5TeywqX35NrpPWuHLtX66uI5fw36K8GgmRqBLcZ3cp8ElpnTh7DejPW4p8RONmMv1/oMlKxW0DAXqZBvV0YUKK002XIf4l7RcoGQro58giH2c9Yqw1BWq3O3zi48GScEUpukwBUbOY+FxVUeY/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767722675; c=relaxed/simple;
	bh=7Xx+IDm74UfQJab0hVpqGn/x5xl+7KB5LM6pqt9Pfgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TKPRd4RHy2P57XVWAcQ42PjrWHSuh0xzhr6MJe5Fa94Xs7lNWKhZrbUwZF1ejYZY+S2gEZKcY/l05yIrlqKREfSTIN0spIZgLJXQJ2Q1yPzDd9eAxhcterT6iXGQCdN4cIWIC397ezOlUTBngRS0DqqeKeGDrJwv/mFSx6O7q94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L8aLLcf7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ccPbBPTA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606HSZtZ4091254
	for <linux-media@vger.kernel.org>; Tue, 6 Jan 2026 18:04:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uoYjH/FXizvbeOKacVEztDQIaTsAgvnDV35VsNgOY4c=; b=L8aLLcf7fy9Fv06l
	cgN8+xPqbPeMO53insFnNUq6Vwv7Fi6XjsY35BRtTewuqq9l/WKlI3qeAoMNUTag
	jjV+fSrMZfpwEZ7MFkVYSfTewkZ8aLv/Z5mRhO6fODpGjyoqCTB6tWo674CI9mBi
	pYCi15RPnZZm8oIcRinJbzbU9p9FIcFhSq5yZe1tVHoFNWZc5KZBFaEpXKD6pHrV
	EjQZrdKlUu5P5wDbsYHHBqJXEsQSHGSxFvQuLZ0NpuDGSdhFd5LPSIZY0UVXuU2i
	aJm7TUICnuMrUQlJLCqwB4gouHFyseKGem8t+KY/nruCs3JY5zSgj+2WSa+k5zn1
	0mvt9Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgyun9fd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 18:04:31 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ae26a77b76so478764eec.0
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 10:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767722670; x=1768327470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uoYjH/FXizvbeOKacVEztDQIaTsAgvnDV35VsNgOY4c=;
        b=ccPbBPTA2e8p6lpHS1kSWxbGLxpq6rS+0YVlNu5UASoatH/lbWDQ5d/QBI4hSP4uZd
         p1k+hhJwYWHZ6t3UQDNy4gJJi4T8T4l9VOeYooDuxBkqsWFOCA1YXKNhjpRGvD5PX9Fj
         rxjFY6bXHnQfe8wWRgwVY13WUtS9xCSFWKfr64daO9+avVV6tkHnDj924wrMLT8gGXhD
         2X3kixm1gFuHp6DtLyKQ/ExN8xLVMBPg+9DYuCA3RFolq3s3yZFyU/1CytcdlB1+qbQy
         EP6/IMYsR5YdA8/ktZJyIM4HoKkJrPlpGtx3/SE/krVANzp3kSCZIB25abvYVWGdilWV
         MzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767722670; x=1768327470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uoYjH/FXizvbeOKacVEztDQIaTsAgvnDV35VsNgOY4c=;
        b=sSsq0XBkKvejZhdMaejO0f4w0JrwBFWrSMs4f9aJIDJgmP79CKyVzHQECq4SSWFgCG
         7L4nwpdJrIcxKgLKOk6yEu+WZlPa4S7TRvroaN5jQIDJPzdO9n9Q91UukqCz74WQ2nZl
         LIn/WYbcHDiLfpapG3Phj/tejSKJasRGb/TYWITIk2P6b2UhfWGkGZjVRXYodW33tVi/
         ssvZ+IYcul8INX7PTFf5TU2nn7YpkJrm02Iacjt+aKoN1+gRKOQf2LWaWngPBzgw/mIo
         wyyk95V8ZzGg5Vy/7IyYNIt9XGU++VNX7oAGrDWj/xaoXe7vc7NmsLS3Pz2QmsDEGhl5
         zLWQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6aFzDSHxsnzA5c3BNqD5UB2pw2e+Zjggunt/6fvcRuPs5Dq8FdRbutZNBlkeYb+054a/kikR2U7uKrw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Q0zWgTSTe9ckSiP+mem8WLX5i+TChFQYOdMsUrollumA5w6x
	pJxm871kPjwMEA6Ifavncd8hvOz/KS11JvFT/KFhagIYeV7WXADFAr+YdATtbNpIN3nyT5uE5Gm
	N2aeQdD1qvL/vzMCd8LuKl84DsI+AlkFwXs0LvEEw98d+k0s1hS6J5HSDX3bI22AYMw==
X-Gm-Gg: AY/fxX40rwPopDuuByt3r+y/APHQh1SKM7xz3zBSScIa0NGsLmmsjE8YsgbQfxSJuXW
	UKckzGSQnPB0N/7BZTiq2iKRcs3g5AZyNKLGMqlQ1b9lD7+bPQP08VaSdkWwQOZUBdfOOfIkl0a
	4TyFyW8vMbyMG8Hk9hRZcdoaEo1bWk8w6Q+wESj0KM3zrR1vbqhWUzPFW47FU6+6PUZA+k/TKLE
	EIr5H/Rn0xXTeOnLR/9OWFf6kfyBy3JKWiOLrQ+hruRB+xfSCNkzsxqUq3hjaFzoHcikcdSk4V6
	WRx+VGODEIg8SRJWl/WgkQGYkToqt7n45qxoH2PXe3S5sKO7/S40//cXlKsQZ6o/9KjcZRoO2nx
	uNLxlD4ienO/sDuoIfCClJAJZBV8yvihCrVsEWuGZHeMe
X-Received: by 2002:a05:7301:1a04:b0:2ae:4f61:892e with SMTP id 5a478bee46e88-2b16f9293fcmr2664471eec.36.1767722670401;
        Tue, 06 Jan 2026 10:04:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsg6oBHLPeBiWqo2V9wrHF2AafFO/aPeVSn8WYZodXTtdnJzkxJvkIxgi7Yhd/Olvi/BswGg==
X-Received: by 2002:a05:7301:1a04:b0:2ae:4f61:892e with SMTP id 5a478bee46e88-2b16f9293fcmr2664449eec.36.1767722669798;
        Tue, 06 Jan 2026 10:04:29 -0800 (PST)
Received: from [172.20.10.12] ([172.56.240.157])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707b2256sm4044156eec.25.2026.01.06.10.04.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 10:04:29 -0800 (PST)
Message-ID: <0a9bfef7-0d9c-4567-a430-81bae7b13aba@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 10:04:27 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] media: dt-bindings: Add CAMSS device for SM8750
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com
References: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
 <20251126-add-support-for-camss-on-sm8750-v1-2-646fee2eb720@oss.qualcomm.com>
 <20251127-smart-tuatara-of-downpour-88c16d@kuoka>
 <d2794210-dfbf-4c73-8158-c28595bd73d5@linaro.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <d2794210-dfbf-4c73-8158-c28595bd73d5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE1NiBTYWx0ZWRfX+9BEyOJORjVH
 xVK4wL5WxB8mN7AxpLZJ8pvdjp+zw01e6kzCeuZOTTip2AO2L9NgFQTZoHDbkbeX0NQjFvD1lBR
 HH7qKAJgQES9pJnwK+SHvy74nkV9io4jxD5Tb7Ek2TYOm9mDrHuXcgyUSvMieb8Fu24a1amh66N
 ECSdPUpgQQJvJfhjjtr0ujc0Qc38v1DYNVRc0l9rKWlqTlcbkx0tYC6NTzvis0ZkoCoaP3nyDfM
 LuSA9thHoNYmQrbv4uY7RBIGNn/TK/ktiFU6GlDltWlysDVB1MQq5So/v5ZTERnW++vlydJsBFQ
 h9DV5F8G/WoDvoJANuRQgUtqXQbbLaIu+J264nIyzXyPAITRcPMsgSPtafBxCkgfIeRryc7+yEO
 Dp5Qv0J+0DUFRfdk8ETLwF8+oYyxTvnE5ddZUgYEP3WQzdJ0i4mIySzt/YM/4qktgKB0jrO2wnp
 4OOS+JbGrZKQWguSH4g==
X-Authority-Analysis: v=2.4 cv=YqIChoYX c=1 sm=1 tr=0 ts=695d4eaf cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=J3Fo5nLEaHaPiRlpdRcYgw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=4ttYkhS-lo2g2XGx6woA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: fzV2WpPg9qz95NHSXE-A4RxZl3sIK95-
X-Proofpoint-ORIG-GUID: fzV2WpPg9qz95NHSXE-A4RxZl3sIK95-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060156


On 12/3/2025 5:31 PM, Vladimir Zapolskiy wrote:
> On 11/27/25 10:10, Krzysztof Kozlowski wrote:
>> On Wed, Nov 26, 2025 at 01:38:35AM -0800, Hangxiang Ma wrote:
>>> Add the compatible string "qcom,sm8750-camss" to support the Camera
>>
>> s/to support the/for the/
>>
>> Bindings do not support hardware.
>>
>>> Subsystem (CAMSS) on the Qualcomm SM8750 platform.
>>>
>>> The SM8750 platform provides:
>>> - 3 x VFE, 5 RDI per VFE
>>> - 2 x VFE Lite, 4 RDI per VFE Lite
>>> - 3 x CSID
>>> - 2 x CSID Lite
>>> - 6 x CSIPHY
>>> - 2 x ICP
>>> - 1 x IPE
>>> - 2 x JPEG DMA & Downscaler
>>> - 2 x JPEG Encoder
>>> - 1 x OFE
>>> - 5 x RT CDM
>>> - 3 x TPG
>>>
>>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>> ---
>>>   .../bindings/media/qcom,sm8750-camss.yaml          | 664 
>>> +++++++++++++++++++++
>>>   1 file changed, 664 insertions(+)
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/media/qcom,sm8750-camss.yaml 
>>> b/Documentation/devicetree/bindings/media/qcom,sm8750-camss.yaml
>
> <snip>
>
>>> +
>>> +  vdd-csiphy0-0p88-supply:
>>
>> 88->8, so: vdd-csiphy0-0p8-supply:
>
> I would make a minor correction here, it'd be rather 0p9.
Sure, thanks.
>
>> Same in other places. This is how it is called for every binding.
>>
>>> +    description:
>>> +      Phandle to a 0.88V regulator supply to CSIPHY0 core block.
>>> +
>>> +  vdd-csiphy0-1p2-supply:
>>> +    description:
>>> +      Phandle to a 1.2V regulator supply to CSIPHY0 pll block.
>>> +
>>> +  vdd-csiphy1-0p88-supply:
>>> +    description:
>>> +      Phandle to a 0.88V regulator supply to CSIPHY1 core block.
>

