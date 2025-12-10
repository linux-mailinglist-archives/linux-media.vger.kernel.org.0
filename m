Return-Path: <linux-media+bounces-48566-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 015CACB35D1
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 16:50:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF62B310E02D
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 15:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD90219E8;
	Wed, 10 Dec 2025 15:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q12QHbkD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X84+AkV3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562C626299
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 15:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765381683; cv=none; b=JwHfbPEpLIlheg+LzPoSq7y0MX/z39or6MlQAI91CW2Bj+UgBmatSaD6wCxahS86UXz7L0qXuFkuGSJs0r9WxYmf0VBXT6oVhHigVAjUCl85E5VXeJogbjawSSdJUyo2Ug5hfQH6EuvPUFVsFnlfrI/uhkQNAlBydrYpJ7gLeh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765381683; c=relaxed/simple;
	bh=zxzWHkHdlNOMeXVncXhQukYbqBLI1caIuljfXw/kOX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y4XC2dq9ONhZ6K7r/xqLji/KnmqXgtBEcjJzqW+bWuTX1hsmZurAY9M+CE5Y6HSk7usEnozV5nM4iWKvk7WI3FcGczRQs3keTofWRLBJoxYqTajsyal39R7xwrduddz/On2qyCFim/b+dgM5O+lJCTKL+5FVW/zWGM1j02c0PLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q12QHbkD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X84+AkV3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BAASXIi1802621
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 15:48:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qk1oxQfFmW1j0BGoNAZUI72PM8JpbvA0GKEGOSMYVA0=; b=Q12QHbkDzh8vdiiX
	mUAdJvIjWkpqvqb8U4CZm86VLnMJrNpg5tZbgPfjZKRY8LJoC0eAL9OeQxp+UO5q
	DcNnYg+de4lKr1T9nLEzIekiPJgTQaDEoHGG7lqJSd2foiV2j5l8b42lP9jZ0J/X
	ttUcvg5OgRXp39kTDu88XRxEdfeh6M4VoozB4im9obttfl+CE3Qs1mj5wCh8MLcu
	Vf0DAqs7aH+/ykIJbINBlVIJOwKzF0rjANRIToy31t3YgSnxNK4xqvLnZRrlOCoZ
	fX1XeHM60qpwGSvfdmyZeZAWs1qdYLSCv6my+qs3c3G3ut7MGAp23g0zEuqa5eKL
	FW4lSw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay753rxx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 15:48:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-295595cd102so129487575ad.3
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 07:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765381681; x=1765986481; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qk1oxQfFmW1j0BGoNAZUI72PM8JpbvA0GKEGOSMYVA0=;
        b=X84+AkV3g/fgZHuMeUwR3yKuYxf2C3M0DOyt/7t8BhNixsJxCayipskvsb6B6C7XMl
         6C0RHpR+UsgThpExNm9EZ2Qq0mbv/c+dmVl//v+SA0rAmnDcc+34IMy+voKmIlq0fbh0
         9wSAchvJPUO2HxR2Z9q6E1/UQnZzrXax0M3zLK2HdEroh4v3XesW1yZetlVG3Wrxt8li
         Gx7DgDIp7uHyllN0jo8ZAdo52aWWEYtGbxo7gT1AyeWCpKaLz+5XkdDPtOSyvfH8z5ht
         pfCq+45lmocUQVWMgr3vSidungvFjDZJOb/gqBfnCf36od9WJOWcMmNciHs+sPCRv98i
         zC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765381681; x=1765986481;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qk1oxQfFmW1j0BGoNAZUI72PM8JpbvA0GKEGOSMYVA0=;
        b=MJakaD+uveAffZmzaLmW1oskSwZ6Shj12ufvLYgns427BJdXWdMR4yaw6G3uQwXgIO
         l09QBEc2tTVGSJ5RIHcLbfXrnRk6fLrwcauV8k+1Bmrn8g4WLwWsk5flJpbU3cFRzCWZ
         Q+4Kzdtrw/Y46utk2gGecYb47std29NncI2oESXQdPNAh0TbVjd6DuvOQiV/EEm1ahzL
         I8ybHyrYrKlhSNo85NiCZrY0PfW3vXubRfi+SsGJQG50FusYZis706QrZDFP1YeoHFhp
         17ROah7u5VbATr4J3vF9YlIaPQcDvTeLhfE6Hdpm65jUYc7dTSmEKzS+UkuGCtOyLPCw
         zVwQ==
X-Forwarded-Encrypted: i=1; AJvYcCULolKU7Ij3Npa835dq1ujdOv3etkqabk3RpllLBRR6ZsBFKQQrfLtNljsSAyD78uVImkraKQiGivlCWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKkp1Z71OZ4vbYMiIU2tGPER358cNVloy6mnfK4c6RCjC+ZQMZ
	UV83j4MmF9Q5e/GQjbocPvlE76vtGY9WGFnJ2AAw4bpeZgA4Dz3nem93va0nk5aKd/dwTjQ83fI
	ulpR/i8Ign2K6CJSiFBCWEoFQsCvn54oHruAvzIwlaWkBFpfAMGOS72zsVdrUZtl0hA==
X-Gm-Gg: AY/fxX6fZVE1JaxPvtdwSyBLT3M9DiVjwWsR27VyW+fnAO7UqUyVXTAhnUy/cMf8hGT
	l1AKIcJU3Ng4vUjF+JTSxcbd2L2uxvWvEoBkALs6iDldhhfVh/cWd8ZaAH8UFMpMTGld6LR7K9N
	KMZ9lcIHDTz6Xl+A4m8fWullHfcBdNTaCOfUJZbppCyU654g4njtsVlA+caexE8+T65DacdYq8/
	Mqq5MVoaiKPgKQMkLiSMzKu9yodKXixmsjL7+qug3/6lgY/HiA2ZXE3Z5OcS+SlpZ7KZlAdBgUd
	EyS6oC5LG6Qua2aJuwgWUwc3FGI69fRI63Bsx/6wHhlwSskz6d7XzGkosMB5qwcdLMJRjS+khvW
	1O7AhGNTv/8pDQHmVRVf1stBFL3SZJVJa+BQM4Rgvzc0n
X-Received: by 2002:a17:902:ea05:b0:298:68e:405e with SMTP id d9443c01a7336-29ec27f9101mr34852905ad.59.1765381680931;
        Wed, 10 Dec 2025 07:48:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjaz47RPM3BTgq+t2/uAuzI8RhqBQTqzjbVQ00bNUJHKcVw/21DQ6pw9tCiddYKcvs3IuIsA==
X-Received: by 2002:a17:902:ea05:b0:298:68e:405e with SMTP id d9443c01a7336-29ec27f9101mr34852465ad.59.1765381680496;
        Wed, 10 Dec 2025 07:48:00 -0800 (PST)
Received: from [192.168.0.171] ([49.205.251.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4cf9acsm185291845ad.28.2025.12.10.07.47.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 07:48:00 -0800 (PST)
Message-ID: <4411f6ee-478f-487e-8f95-bf0959363e97@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 21:17:54 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] media: iris: Move vpu register defines to common
 header file
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251210-knp_video-v4-0-8d11d840358a@oss.qualcomm.com>
 <20251210-knp_video-v4-4-8d11d840358a@oss.qualcomm.com>
 <4pxuzfdcwr56gtt4rjgodvtmf6cgprpb3czyrqjktx6qk5kryb@njj7xwtnnjpi>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <4pxuzfdcwr56gtt4rjgodvtmf6cgprpb3czyrqjktx6qk5kryb@njj7xwtnnjpi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cYjfb3DM c=1 sm=1 tr=0 ts=69399631 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=oHgmLS9T6KHqMfKxrEeemw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=9GnT8YxiTCS33XBb7xIA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: J1vBMR_1TAeBlggJvTuibiNU-SKY8ubN
X-Proofpoint-GUID: J1vBMR_1TAeBlggJvTuibiNU-SKY8ubN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDEyOCBTYWx0ZWRfX3wul+IffGYLl
 cNfTWBWXE1HJMVODi8oGcZ4hYlv5Jgt1qlBuI98FFwZzI9CUri8F3yxsywnu97OYMsyJOfjDpl7
 0SgzzXtnPU0cumgEzrVMzBqaNXloji+TyPPh83pUkg9eti6hy1a4zOLwNG2Q6BIbgIHo9E7izcJ
 dN6U9qkVDTEHbTi6dKqo4buiLF/o8Gtiju3fA/Hp53zLKgN/vq2grvCUFYAodyHGeUqb32H8jDL
 7/kg8cHH1SnmVBr0zCBgxnubXOr04z+D+rMeB1AJcr89EEeNRr8cvlu03CuIYS7CHO7V2Z+yePp
 GKL137Ejy+gvp5Pty5QcvdVnr0WSoK1Laja/+GuOTtqlU6EmMcFL3GtfmuMan8/oujdR1ciKdDd
 vdmLYspKzOwW24dorlt0cTohGcWirg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_01,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100128


On 12/10/2025 8:33 PM, Dmitry Baryshkov wrote:
> On Wed, Dec 10, 2025 at 06:06:02PM +0530, Vikash Garodia wrote:
>> Some of vpu4 register defines are common with vpu3x. Move those into the
>> common register defines header. This is done to reuse the defines for
>> vpu4 in subsequent patch which enables the power sequence for vpu4.
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> You have missed my CdB / SoB tags here.

Sure thing.

Bryan,

let me know if you can add while raising the PR, or else i can send a 
new revision.

Regards,
Vikash


