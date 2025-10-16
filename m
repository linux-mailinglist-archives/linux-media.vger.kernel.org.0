Return-Path: <linux-media+bounces-44709-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB66BE2D17
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 12:33:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 29E4534AB8C
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 10:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 460A02D0C7D;
	Thu, 16 Oct 2025 10:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L6fpOvo4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425835464F
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 10:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760610800; cv=none; b=GnEKniKN5z0OfRNGfY8+PbsOe3YRDkiMd04lYA1GHkahugnr9WbkJk55pwNKiEeofnRi/GDUw4YBApC2pWDIu1HdgdaogbjyygbHiUzMZOsLP1egZ3cayPvdzkmI9sYv17rEq7pFkOZpij+Dw49eY/8/97wG4xyMdrIz4YAtl3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760610800; c=relaxed/simple;
	bh=WFikhz7ZRtIbncmZ1wHT1zy/N5DaaleJOyfpRNbdok0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lclDuAonRxLbi2nWVdzlTrj23cnRK/oBClTYcfimHhAhLlguf8I4emCRS27d6rGf6U5ne/BaVhARec/dZuiFajxeewRSbX8aQRB3U/T54/zmxiSDI/FbzUaCFtMVOlYZSA65v4bdKznEl6S1RLfgQwoK/lvrobNWET959rFaC3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L6fpOvo4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G5n36F003544
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 10:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G7US01srTXfkHjr5hd7/lzike6tL4rbOPwhEWWKSwns=; b=L6fpOvo460KhSOZd
	IR1UNC51UDHLG9/U+HSEU7Sn9EXpTTvXH3GWmp7Ms949QvaVNuquvgHcfEi+/zjk
	yepd+WwUIb0wIcbfdk8KJWvwwQfFZiHjzsmtTDwtsUlTlv5bXLzq/lJzDHOPyhuZ
	r/TQxYCThokuZGANSVcrvyHjpPi24yutYk/FK3LjsxocD9w4+D36P5jKSTqWgNPU
	sdsFgLhwUfLB5WCmVQIUIvtpO0hpwdxkI6+sgQdBTooI0oIs4ei4wSQcXtDM6Xws
	3DLcZLjc/agLtLnKSUsjYjCgHzHQK/IWzdTRqV3mIF1ek3qF7FZyFr2vXotloMXv
	YqX7vQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49sua8pkke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 10:33:18 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-780fdbbdd20so699581b3a.1
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 03:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760610797; x=1761215597;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G7US01srTXfkHjr5hd7/lzike6tL4rbOPwhEWWKSwns=;
        b=lpioN+MqJnYSOAwWwCN4959qHeH+vH0c4Byzy0dx6XU74dzZb0uGrOnyfLISFZe7WC
         q5xK8xJhqQX4cs2oBc+SKqTQgzu9WzEM2NYgtywz2HrftBK/Y3alOI9vuBLfAVEmpvjs
         Hd3IHXGDwIV13NvwztqSsPLhgEqnbuG5vxsy1J0BEYY1cKGaU8sEEKtTLhgRosZIipcu
         IvaL5pRhDHyus/pareWQD74S/WW56/6Vq3Rlqoono3lIY31eeHWY/gcMgNZXa6na7U5X
         8/+q2yWNDc4Ci6LevriPzfWZjqLx/cWAm0sbNgxY4oWasPeX1YRIO/mZN8MGgPbk5+tJ
         UpNA==
X-Forwarded-Encrypted: i=1; AJvYcCUl0kXbiMsf9wqkVMzf7BBLJFj1MXhWoSp+QiF7ASYdGSAtMZYwq1UrkEF+ySw3l+BdJIET+8Aei6g9Aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwszG6k1Xt5YRlG1y0LEoX4njfLBsPR7JfnnoHIDu0ZiiB+2TFd
	Sc2/JQY1R3O32fbAVFVwMP6ff8E5C2cj8O2Wzvn7dt8e8EbXXiFPAKN2J4qYphRVSNhgPu+W1Da
	lEeqHGjcAMyrj14EywiVU01Fu3eH2T2DDsn7OCSo68Fd7dAj9XyAhQiKQvo7UdHyG3w==
X-Gm-Gg: ASbGncu48NgIQUNOnsvurgczR5JQD/v7aazmQd98PZOjOl6n07n5/DhWySzliM8FAlC
	Y451UixhKAc+aqq0/l+adf0ictH3jrCoqen2N6U/6QzdEACyKzuwLosRQtOESZ6CnuYlULKQRWk
	tiJhsAO28oAEZYHzxCbZsCQnvSNh8Ea82IQiyBBKrdadbc5dkzLKmlKF7dvZInC+DYNR5vb2/85
	xqc11zUS9x1Db50k18fFxxAAm+tLMdHjJMHcmiRDzqk+wzE2iaOI1HxUeP25nsV0DeVhMpDkY4A
	viPL76KyCFCk4ZrbAlz/OVrplUg+7vQNhaWlY/9ghbKg14D4pWrF2pM67S+coqcCRDaZzbBd5Zb
	YbbOg9exy9HnVRRzL+DQ49Gg1fQt29LSE2y12gaMGK1g87+aVpVpYw1ygqz60I34qOIHE4g==
X-Received: by 2002:a05:6a00:2e03:b0:781:157b:3d2e with SMTP id d2e1a72fcca58-79387636930mr34814512b3a.21.1760610796800;
        Thu, 16 Oct 2025 03:33:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrLSzML+DluoqwIueLsJrUswg52tFyRY8b4V6YDJvsQCOJ7oWVWF0juXOq/0Srsugj9SZ/Vw==
X-Received: by 2002:a05:6a00:2e03:b0:781:157b:3d2e with SMTP id d2e1a72fcca58-79387636930mr34814486b3a.21.1760610796287;
        Thu, 16 Oct 2025 03:33:16 -0700 (PDT)
Received: from [10.133.33.12] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2c6csm21712627b3a.57.2025.10.16.03.33.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 03:33:15 -0700 (PDT)
Message-ID: <1aa133b9-2a99-47cb-8309-7e49b5dc4f85@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 18:33:10 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] media: qcom: camss: vfe: Add support for VFE 1080
To: Bryan O'Donoghue <bod@kernel.org>,
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
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <8d61f29b-ba02-4757-b8cd-5fb51b998acb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2iWD1erYcHLPNlVN9l4JTj_usEzPrCII
X-Authority-Analysis: v=2.4 cv=e5MLiKp/ c=1 sm=1 tr=0 ts=68f0c9ee cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RkO7Omd9_SwxoHUsMI8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDEzNCBTYWx0ZWRfX2PvCUNBYABj2
 gQ4qvVB8hjCuzN0AtwUuM8hDqYbOoWLVcdxjS2RDBtYesDdjeIOcThBPa5yjqEyHVZdXf9LNHFt
 iMrPr0EEBzTMpj9NW1cnsP1UgzvWP8iforI7vMBO7yYLEhtrp0Wq9Mds0AmxvFbToYNCHrkrnwk
 Ffi4BjMVDh+Z3d1RIvPKs2duNlU8aZRiKS1v1nOe9+U628zsGjWtl9rhJ2eHGBx1+I20ZyM4ZcR
 djHG1pHc771IomwfmL9ssAHulXXut11TSUl5O8qsGj7TgHUIUUAYtNe9kW4WivoETjayQlAtAgI
 3Y2BfGPRDojNdOq3vOUo21y2YwTCcxrvC8D0X4UknPy29pzYvftYCpGWXiXxcOUufT1owZZZ0kc
 SlDh3JyOSHKOMSlJ7IU3u7L/rveP0w==
X-Proofpoint-ORIG-GUID: 2iWD1erYcHLPNlVN9l4JTj_usEzPrCII
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510140134

On 10/16/2025 6:09 PM, Bryan O'Donoghue wrote:
> On 15/10/2025 03:56, Hangxiang Ma wrote:
>> +
>> +        /* Deferring the reg update until after CSID config */
>> +        if (!vfe->camss->res->vfe_res[vfe->id].vfe.is_deferred)
>> +            ops->reg_update(vfe, line->id);
>>       }
> 
> But why ?
> 
> ---
> bod

That a story. When testing the RDI path on Kaanapali, we found one image 
buffer starved at 19/20 stage. We want to capture 20 images but only 19 
received.

On Kaanapali, the AUP and RUP are split into two separate registers not 
a single one. Maybe this hardware change impacts something. Calling 
ops->reg_update() in vfe_enable_output_v2 function only applies one 
buffer address. The downstream code defers AUP and RUP to CSID 
configuration stage. We mimic that and find it can solve this issue.

---
Hangxiang

