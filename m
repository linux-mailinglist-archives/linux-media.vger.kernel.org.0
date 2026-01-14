Return-Path: <linux-media+bounces-50659-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F214ED1D6A9
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 10:13:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E5FF03020980
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 09:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E637B381711;
	Wed, 14 Jan 2026 09:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jmbwtpIp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MMnfhxUA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C7138759E
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 09:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768381863; cv=none; b=sr4FCF4BA1Gsygj49UdsYTyNDOK5FyCvqhkz6fOWoXo+0VVzTvKIXVq/rluWlpxMiua9yxfeUC+B3IZJMKxex88cNU0/G3vx9QOYibBiYflz5snCzSg5hlZUUm53MNuEzeF4/Qybcyzsqyr2Fyvks6rZQkMPWiHHkuU0zjkUEW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768381863; c=relaxed/simple;
	bh=KqmCJ7ntm1OGH3eGMXJOxm6Ood+cQVFk/YCTSFpsBiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Js2eMItEemA1bm1I+xIk+cVoWJwCKUniKyul42UbC1HFtLoyOHGggrOwTC086gL+860NflUr5a2OxnPcZO/Lm7uMFIi9IbIMeQ+mcpUI0pbXpkEFJBsB2Dk1Csfez3o7LUkSNiTPFVIMTogcE6zoANw77TndLl/xVr1l9Xm2mVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jmbwtpIp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MMnfhxUA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E7jFg32976551
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 09:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4FMZa7ZHSstttEx5JquSC66UQvBOnUhm4EemIIqSfQE=; b=jmbwtpIprdDZck8u
	jhgVEWsMwO32JUrC3m38IA132VsBzs6QwWmJZsyOidoREmq0ipue4mE35X5Lshd9
	yPM4IHzR7KAmqgh+HMvLkfKJFaZOeuy/k/PQaBVCgDWnm7/StPj5NZgdqSto/1Wy
	x+s4QwU0p81VmKvKo1Lchdk0FCv8bIBKSnT6hVEAsdH9nRZXrFdOyrEphMyWWUYB
	6fcd4f6k2FVbFkgu1n3AxkIizJUl9HQv+hCf3mY4xv4LQSz2BUfNcxh11vWoKyn+
	PsOfoqjLonM8F3OunuO9k26Rio2VVI6PHwBlmnfKOFdBUmAkwsbdk3HcaFYCjt+o
	4LbmcQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnt63txqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 09:10:59 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7fc82eff4adso714949b3a.1
        for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 01:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768381859; x=1768986659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4FMZa7ZHSstttEx5JquSC66UQvBOnUhm4EemIIqSfQE=;
        b=MMnfhxUAR2Oj6dFlaQ25AvVnAPPa+MhAWOlZ+Ncxc+lm5CJ4eF/T/xUhGZBOFKmzRv
         hUpXAW8Oow4wbSZ81ybcEphHvDqE7UULkjE06TMg9v1T56WOn685nzWWwS4WnOyicyyg
         CYjeLhQd5+XmP1JL/BClv1+gElHWa9GwsmjsubWeGPxlRtHCYWKcjA5q52k1/NclwKFj
         prBAwKiHk9ruSdN5OK+Nm0JDVcWDneebz4snbiv/P1ZkDlTrBnVF5ZqlglpnR7JbYahW
         Ky6onAyJ1kESbuHYwCq3JeM7rHaVisos698L7eKdOapcOs5c9QoecEc7qYbIubICjwMs
         Qnkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768381859; x=1768986659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4FMZa7ZHSstttEx5JquSC66UQvBOnUhm4EemIIqSfQE=;
        b=Jquri9gCyc2xs5/5Q9KGoBnTEyKw3KfsxkaFLP+fJu76YcFPqXln+DlEmhF2FsgNHl
         BIccxH6SLZOXv2Zgv44bDqr1u1QX6uDzVEBqEmtK/4cy5wDa2CoNjKevybLJBGrSKP04
         nMFfFSU333R8OfL0BN/EIo2qzKu5AK2MURFsbezZqruxaLTrcxxVYsYMxdnEIpvHjJne
         nbz7iyTmxfWyTfRVOr2QYsR21B9+5u8kE5+2wTZ9b472p07JZ0PFn6GELXzxQwiiEgYN
         f7fb23jYosEoMwHD954/++GbX7gisa4fU1b/mrkDkzMyhRByoewVcNdzy0HHo+BClwIC
         vWIg==
X-Forwarded-Encrypted: i=1; AJvYcCVdKBDjgrobKmDyJJqtjcgzODJOtygZS57rXgaO8ZWjJJv4X9W0ON3lRpWhpfrB4qjtpo+qFwiphT/zZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLMZT2gMK8uerkbnyci+FrZ59jpnD3LQCfvYglMbsYRqimQile
	wyXKFL/tK13o/RnIyL9B57pDjPn8pGFK4Fuzc+LDmaFoZgaQE3Lkz5iHPHJk+vGRmp9YPZacj9m
	YnhrgWym0HxSNIi3BmyG/eoMwJgl2eNuZw3wtf2jwIiXwmHzW9gpe56eK6hJnfYTekQ==
X-Gm-Gg: AY/fxX6VjRn7raJq/Xv8GgCnordSOx8Xb4kJln8efFfLMzQ9Yi/G99NGWA43P/tANlG
	E9OKeP8MfEXTpx7mYCz/Jgz4vjad3hwTo9uvdqQGeleBYLor3mHfk5zYJMsITiev30vDbZUO9Xq
	xNyxCLebcz5wUIQn8xNxbadJ1uz9dLAu2f8z4beJYUJwyZja3BaFPsEwrggj4AU6Vq19Btouu84
	aHMfiHD9/MQGz6OtiZsgQCrMAbYbEs4MQXeTmcrAYswXmTXC4ocVZ0pv86I7p4Uiek3i5Th5byN
	0iYGy2VHhk4/TdAMU/y98QeZCL7/KIPUk9CZ0nFqcEhHUSSQMN4qDwrQhJYvXRG0mNnv47tRZPo
	KE3z9KbsYLKSQl1AyfNiXNT6b7DcxsF+5SBxgI93m2Fkb2w4KL2NvGZk9Nez0lpaS2qBvWgxdCv
	J3DRmXDg==
X-Received: by 2002:a05:6a00:4208:b0:81e:1b77:9e61 with SMTP id d2e1a72fcca58-81f81853057mr1758739b3a.25.1768381859209;
        Wed, 14 Jan 2026 01:10:59 -0800 (PST)
X-Received: by 2002:a05:6a00:4208:b0:81e:1b77:9e61 with SMTP id d2e1a72fcca58-81f81853057mr1758700b3a.25.1768381858718;
        Wed, 14 Jan 2026 01:10:58 -0800 (PST)
Received: from [10.133.33.186] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81e6772688asm14037376b3a.45.2026.01.14.01.10.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 01:10:58 -0800 (PST)
Message-ID: <c163d50f-d6ac-4a2b-beae-b33128d58912@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 17:10:53 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] media: dt-bindings: Add CAMSS device for SM8750
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20260113-sm8750-camss-v2-0-e5487b98eada@oss.qualcomm.com>
 <20260113-sm8750-camss-v2-1-e5487b98eada@oss.qualcomm.com>
 <20260114-notorious-bison-of-wholeness-0da70f@quoll>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <20260114-notorious-bison-of-wholeness-0da70f@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA3NCBTYWx0ZWRfX2mSLeeWIwRHI
 qbIo/iLdo2ZwL4HJHThv9GzPtpju7BYQWcazs3hEJxVuTGqJ0KSQ/xs1YjSvG9FTa+fdeIGcYg6
 jNj1hrxEkFRKjKiZbQszqifEr87BIffoXOb+w9Kx2b3hpK69UZ9r2VRsIj3gDDgmzamNqtU+c1+
 y9iMpkqxmAVouEZ2OI/96A7WZJWEOe3mBVFRdESNjK7k6lZqHfTDaEKyZerRjMFVLQAS4gFz6+4
 YmXJrCJIqTSZFfqO72G2mR4DMNBRDL+mkUVUK9ekwG8+gy1DoMcG0iQHJeDZDuahofnzcOaxHgd
 51gs/bBKtMnl4PODe+g+Gv0xIhUlZOd1afAIcGU/ZZ4AkBJ5d+RKQT+EJKYZuAyrK6PDdDFzKua
 eVsHhaBiUJeLdEpy+R6vqxt5Nt/31iHvegOqShTpHYhnR9qmU8oK1wzjlqltOEa0gg2J00TsPKW
 DSJ6slG3TNnOxHutYug==
X-Proofpoint-ORIG-GUID: l7BkohwYcxe26v4Xx-tA8XNSnzeC43_6
X-Proofpoint-GUID: l7BkohwYcxe26v4Xx-tA8XNSnzeC43_6
X-Authority-Analysis: v=2.4 cv=EujfbCcA c=1 sm=1 tr=0 ts=69675da4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=nXVHHlikLqQEmL3_ZCoA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140074

On 1/14/2026 4:39 PM, Krzysztof Kozlowski wrote:
> On Tue, Jan 13, 2026 at 02:28:27AM -0800, Hangxiang Ma wrote:
>> Add bindings for Camera Subsystem (CAMSS) on the Qualcomm SM8750 platform.
>>
>> The SM8750 platform provides:
>>
>> - 3 x VFE (Video Front End), 5 RDI per VFE
>> - 2 x VFE Lite, 4 RDI per VFE Lite
>> - 3 x CSID (CSI Decoder)
>> - 2 x CSID Lite
>> - 6 x CSIPHY (CSI Physical Layer)
>> - 2 x ICP (Image Control Processor)
>> - 1 x IPE (Image Processing Engine)
>> - 2 x JPEG DMA & Downscaler
>> - 2 x JPEG Encoder
>> - 1 x OFE (Offline Front End)
>> - 5 x RT CDM (Camera Data Mover)
>> - 3 x TPG (Test Pattern Generator)
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,sm8750-camss.yaml          | 663 +++++++++++++++++++++
> 
> Why are you changing the change IDs?
> 
> b4 diff '20260113-sm8750-camss-v2-0-e5487b98eada@oss.qualcomm.com'
> Grabbing thread from lore.kernel.org/all/20260113-sm8750-camss-v2-0-e5487b98eada@oss.qualcomm.com/t.mbox.gz
> Checking for older revisions
> Grabbing search results from lore.kernel.org
> ---
> Analyzing 8 messages in the thread
> Could not find lower series to compare against.
> 
> Look at your v1 b4 data. Now look at this one. This is completely messed
> up process, not how you are suppose to use b4.
> 
> You make it difficult for us to handle your patch and I do not see
> reason why this should be my cost.
> 
> 
> Best regards,
> Krzysztof
> 
Hi Krzysztof, sorry for this oversight. I did a rebase work for this 
series and found I couldn't fetch 'Reviewed-by' tags for the rebased 
one. I think that issue has the same substance with what you point out. 
Thank you for providing me the clues and apologize again.

Would it be acceptable for me to submit a v2 revision that only updates 
the 'change-id' in the cover letter? This approach seems to resolve the 
issue on my side and should help reduce your workload as well.

Best Regards,
Hangxiang

