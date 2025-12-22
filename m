Return-Path: <linux-media+bounces-49320-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0091DCD545C
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 10:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF18E3011749
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 09:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3F4430F927;
	Mon, 22 Dec 2025 09:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CnUrm8gE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IsKYmXQG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A86C24E4C3
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 09:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766394898; cv=none; b=GdGuFL4LHa4u91NPwhVbb6ykk5f7MsFiOo8syjRyscEkZH/N+AGXL0d/v+5H4aatZrpcVMRgmsRl4eSpFOVfIknESVOdWn18WuNfI3EAgixQEczYAeyjaHw9I5gTvaTf9u1SH0turL9dGH/TJbtzxIdnnD/CoCoZzAupYR9HhrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766394898; c=relaxed/simple;
	bh=ur9NnLIS8RBXK2Q+yYFftw3P4Ul0eBOA0JYU3aQ5hlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NsvDkM90r6/7hgIjZOOB8VgMiWmoym1OBKrZe1Mx//62gsfysI9oz+OZiTmLK9cp1g55ukn1WWFsZeXKeMZ9F4Bm2Eil6vROZ3Q54AMerbJzOTmVdNiN6nHPDv9PgaQNrGtgm4KlNjOfH17VCGxfvQlMFU1dB4PJzQSOM9iBw/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CnUrm8gE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IsKYmXQG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM8BkXO4041292
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 09:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mRCRP5OSb+TpnfA9jIwKpoDJUZUYh47KN2C66SIErAY=; b=CnUrm8gEtrEtkm9v
	H8XMQO00EBJJb2uagEvQhPlqBVJ1HApA6azZPDKZHo5RodwWTjlJkHkkiRbwaYV8
	9CwY2iirf2a7nOqpGiXcJbPdIh001EUAv0Fx8yMHtbZLEmhu78UmxzeASlJpRIOT
	n0wvtF/o7yXx/7iIw+/VZXVPRLPeaLVcj9sJ1Mf8ryWWhkha0W7/s4ds0fA71R7M
	RSXwI7q2mzpFMCm0FE8xWwzUSwGySe6RP6aHke2pPUsDmWjhBTbaqz9BD5UitToU
	IMTF96+E6e63opscnNdW+IlM8xR8mDv+Zk6sGiaNNF9KO4YlF6W4gc9hsFKtmGsS
	we9mdQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mracegg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 09:14:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1f42515ffso89427211cf.0
        for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 01:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766394896; x=1766999696; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mRCRP5OSb+TpnfA9jIwKpoDJUZUYh47KN2C66SIErAY=;
        b=IsKYmXQGcOP/Nlve/Embii2/lori4nre87vcJOHBFBh8a+Tjy19IaMcvkpp32vdkdC
         ZE8FUNWa9lwNtHdq22ojp3r9qW0n267K5kqSehfvZRrhFqIWF4gG54yDk2zjQdUxVNW/
         kd2IC6IoiJs3iXeeZSQ7irJCRRI5j9FFXyEF5Yi/edsFD4QYtTb5OVxbIuKeJQ7YRicZ
         9k3qgEcFllQMmi+fRRyM2bUmyIR+IW1YcyXrOQeW84SVa6DDXaCAd04Edd/rgrVsLnLT
         sXNMPhasP7WVkN+2ENh1HsAV4zuLzBO3/9PkCVFTyJ06tzQxmhJo+8bl+OG7Aodta3n0
         FdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766394896; x=1766999696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mRCRP5OSb+TpnfA9jIwKpoDJUZUYh47KN2C66SIErAY=;
        b=d8B4eF0CTBQA15uUL5kP/9NdeuK3vg1H80bA+pLH1Dm/5tmManktNseWin1RzM4j/E
         /l72iDUvIcCtuZjiSogRwKgTI39mx4mRwH3mb+++gSBKwgHMdntrIv+WmKokqFnf3H7A
         QWcbamr1ilJV9LX6cn2v49QJ7DsojGbpAO76qN+3BDz94XPnbtQaMMlMYBjqcHc9+Iz9
         nyJ4N8wgi1BcThROasESAoMxZMFWZD+MXiV1vf1Xx9t9lVm/0RoW9RvfWfpT1/e721Mj
         d2M3x0YM1CQWRJCJsCjwLDB8vmN8cYATfqaoHtf8RJbKOAbi8uZ1Fc2mN6dF2yW8V8QV
         qgPA==
X-Forwarded-Encrypted: i=1; AJvYcCWmzf7e0quClX774ubO2GLYSl+++uKGl4VRGbAIU/8HUlzxW+4oMxdcEY+GRYp33I7pNp7VkvIvDQyxiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0fBY7rdnJqibKlJmHMmZoKWvLCTYCFoCfPGjoaTHoqklxTg+p
	XfChZ7a4p+ZjqCUdIOOCkWBzQh2QSH/AdBhyHziUY+q7hkUgGglZYu6ZERFvztwm/nYGDIwI/2F
	VDfRxQbEOnDll5LXsBJWoeTwdEmhrSNPJyUY2bP3KLRtMLkxSEVGDZZzq68I5yUCjUQ==
X-Gm-Gg: AY/fxX5oFAEVOxBpMyfrp/iS/qjkrA2ZkPaP9CkBsiOqagEDkF0lL9E2seG1Gx+Zlnp
	UCaeyYJ39hIgdWv4kWLwgeVj1HI5r4F5dR/rpbAcUK3keNPGbMKkrq/tqhA6U7VdZoQr9EJcreX
	HtOEwhGkeDSm3FAO/2szG8rM+d2zI2lOneEV2JhBxFfj10NvG1IhRzGZG3P1vfLVLT5Ydq6IPoy
	TPiHi5CjHqbBZWLSia4NR9iTurx3cVmc8zsAGWzm+LKSs175kDdhhQvA/vz9amTIDAJRFxR4raT
	8acyuqlzNc0TNoc214tgS5UfdVmE5HBvtIrJjNzuVC5RHIafOD21rHAGHXnsGLUmwx8AkZICmsD
	/EsL/cYFXc+ZpaxaDNSNbAzoA3bu1zULMxtEF4Xs+7zEVKKGoUUevS8QTKTqEL2ey+3w6aLTG
X-Received: by 2002:a05:622a:1c09:b0:4ee:1f5b:73bc with SMTP id d75a77b69052e-4f4abda9e33mr146731171cf.66.1766394895573;
        Mon, 22 Dec 2025 01:14:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEsaMkIX8VGMxD5HKWooqZ2QsBqfbq2fDV3gh30qB2FGM9enLCWRhM/xyl+pqC4YBuZRoCTw==
X-Received: by 2002:a05:622a:1c09:b0:4ee:1f5b:73bc with SMTP id d75a77b69052e-4f4abda9e33mr146730981cf.66.1766394895192;
        Mon, 22 Dec 2025 01:14:55 -0800 (PST)
Received: from [10.38.247.176] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac65344bsm71991781cf.28.2025.12.22.01.14.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 01:14:54 -0800 (PST)
Message-ID: <29b790df-5a4e-4e9c-a613-f2385fbd75cf@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 17:14:50 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: imx412: Extend the power-on waiting time
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Wenmeng Liu <quic_wenmliu@quicinc.com>
References: <20251222-imx412-v1-1-51c7e724b376@oss.qualcomm.com>
 <aUkLKECix4vohyTB@kekkonen.localdomain>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <aUkLKECix4vohyTB@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RBXFWx6cfYSjoEtiMWXUxe80Yu8fiDbA
X-Proofpoint-GUID: RBXFWx6cfYSjoEtiMWXUxe80Yu8fiDbA
X-Authority-Analysis: v=2.4 cv=e9wLiKp/ c=1 sm=1 tr=0 ts=69490c10 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=EQDSYwjwO3wIgHZP3M4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4MyBTYWx0ZWRfXyil10L2ha/g2
 hD9jRP97lZXk5edmXuVnAnr9DOjYURXrhsnVJL+8ZVaUC6yGsrovls3uJysW5uZkYqomLhXV7vv
 Ybpp0ZA47XQAlXJeA7Rp0XQAwDE804a4w5nYyUqK9wEyV+yoPlFdXxHazZNvzXP7ZUR0rCyZp2L
 3dP3dCZf3QNxwPCNr0N7SbLl0IpkPRa+S3eqfaokBmIYWLl8SnRLF2+G5508z2+Cz8oJpPh4SwP
 zLFNi/ESqi+z5xPhYubJmYjP7V7RBtAQaFy119gMSaLTK/J3OZ54XBxCw44SnNAzx+HzMTSD5LI
 jeskeMsDhOQHk5msOM7JPVwoJnzTbc3+utsank3ZvhV2pia5Abp372aGBWX8/btYDWlmwvtKoWH
 SNIWrwmgtERfukyhnHpSV0hohDlrAZxNQ1IDsFoUeUHV7AfFaJ5LduxKPbU3pdnfDFa9r34chIs
 52iSLklJBvo+AId7KSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220083



On 12/22/2025 5:11 PM, Sakari Ailus wrote:
> Hi Wenmeng,
> 
> Thanks for the patch.
> 
> On Mon, Dec 22, 2025 at 05:04:07PM +0800, Wenmeng Liu wrote:
>> From: Wenmeng Liu <quic_wenmliu@quicinc.com>
>>
>> The Arducam IMX577 module requires a longer reset time than the 1000µs
>> configured in the current driver. Increase the wait time after power-on
>> to ensure proper initialization.
> 
> Is this somehow specific to the Arducam module? If so, what's there in the
> module that requires this?
> 
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>> Signed-off-by: Wenmeng <wenmeng.liu@oss.qualcomm.com>
>> ---
> 
> Which one is the right one?

Hi Sakari,

Sorry that there was an issue with the signature of this patch. Here is 
the correct one:
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

Thanks,
Wenmeng

