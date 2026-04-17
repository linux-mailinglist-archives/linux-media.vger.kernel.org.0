Return-Path: <linux-media+bounces-59024-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MAJMuFK4mnx4QAAu9opvQ
	(envelope-from <linux-media+bounces-59024-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 16:59:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9695641C54A
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 16:59:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 54229303763C
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 14:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463A627A133;
	Fri, 17 Apr 2026 14:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m0CBwsGg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NDX3CB5Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CF43C455B
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 14:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776437975; cv=none; b=Y3EliyCN04B/DUlBaZp/Qv6cdsYJ85YgjhwamAfdbzFsSOnaqc/X68/c4pdXOhcjlybOW8QcqagcM0wWo+1JhBwym0/tyjUrZAqjL4A4kQ0vIqw1W2csGQ+HXb48cM4OiX68pBMI2uNHa6aI0wCwE6LHgMSNzH8tjNd4JGZZ1sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776437975; c=relaxed/simple;
	bh=ZtFUMV5Ri6I8v15suLAsgMNDvgJXDSSXjxvMzdNSqxU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ggO245kpStIRkQRbWpFVc36VKnagTAVchZ/SfKB3kifd0NPFsPXU9Nfr9/L1cjT/66tEbjsg68ZXA4f3xLcNCFcyktBJwAYKXinuU9SOCq671hi4dladm3DN0JVhArYZwuoUIrNwoL4Tlm2Hijr6T7vA5sjl51ea16r4I0/XUYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m0CBwsGg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NDX3CB5Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H8nsNW3100250
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 14:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3aD0Ou79Jkc4NKI3Dc4kGnC0vDC6y9my+JqL2kx139I=; b=m0CBwsGg4zlDj+KA
	0bnuITrXs7Yxh+34Q7IOoublPE7KogVS0xJrOktdwklUGo1rb/gUQBE3pRXFmqiR
	fa5FUoWK/x6vVi3kEffWrjWNthjwalKe/2+Qg7yZUZG41IPf2HIngbuvyztXQ/pO
	rQnLxu11sMThOArmwY+Phqwb0D3E4mCi7cKVdWuoqsiXA7V8JTJngJFQFLBB3ZJz
	APH4SOcwaEW3l6zboZpsLVtmdtuTcWWa9rjzzJXgNS92ISHMawO7pUjL9JRnocFS
	Yy15Vc7ibGMI4buZF0b9BJt8SIFV03hJ8avCsJ2n8ojroCKqTBll7JBRybeFdqix
	FxYPvA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkhpu184x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 14:59:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b242062308so13824905ad.2
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 07:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776437972; x=1777042772; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3aD0Ou79Jkc4NKI3Dc4kGnC0vDC6y9my+JqL2kx139I=;
        b=NDX3CB5YmuXDTKIK4D0npI8CzNb2TgyFTmh5DkBFAO29Og0JeGPucX8MaSSKKBxwxs
         gTpZO5ZTKjITBzSwVs2mS9t2y9GalA1HF31Ow1ep+HohUfz0SHDY+Own+2iOQSLqa3hn
         QPX11LAX9oOV89CCmkzb4qLnsUh2J80kMbHgbO/qZ8xplu3CS1rCljkblo989wfoImzo
         M+51GqBjn0WZap/5JXD5JAiDx8l1Xnq2CDZ1/K2JR+feS/Xr3BoS3edrZxoVBHJe8G7T
         3D5x12q/jvEZa0zzI8ThJyVuoX6ghp7l7nfU10PLPrqvMAjVY1OQnvKKRiwPwIrjyDdW
         kD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776437972; x=1777042772;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3aD0Ou79Jkc4NKI3Dc4kGnC0vDC6y9my+JqL2kx139I=;
        b=CEyj9tzCueYlcTToYRIsl+w3cpH18V/NjEI2FGNo2lWFwnRVDGz3rqc2+lGEUEG9ww
         Puk/v+2USNz+wHOmjpzrIAelSTEm9LxksRgCSrYmA/RGEpHRVd9QcY42R/rJ5LK1O973
         7XZa7GGa2JeR+u9c6ebjQR7dEm4zjFEuSPi3aT/MzhYgSSOKosHDq78DiZ4lxOWinFkC
         yRQJJJ5SZoR1AIixMVg9NZNBZX66n2E/GnwjU3+2Gk4Mp9xSrjoavfKeVWrB+CutwVFD
         o4+osJxlp0FsQ+oTHC5aRVuWWkDEQeq0fIWf7yImgpNLX5x70uPASxaBWjRxF5jhZAEV
         uc8w==
X-Forwarded-Encrypted: i=1; AFNElJ/pu7vOScCMfxzjrox8cy/v7PVbGshc9YHHtMVK5Xo7apgJElDCDCOyhhoLzBoL+572Alpjq/CnBIcw3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVM+TiUicsBruT4/2D/RPOd4dHb5rPywMNVvg5AyLikaqMQu8O
	VT29u11/miHu3tpPUBbsX8rryG52zTvQPVnZMVVrMwrP2uqFFu/sHGuIhoecr8KTwY/xdt3g5qB
	fK9PifYD1vUuYjbfFvXi+pobE5krWzYIcLUzrY5R2sGoKQB2OIk1bTlSnJLM6xxyl6w==
X-Gm-Gg: AeBDietBmWzh4cSaOSXykSsULr/VdkLhGJNkrMWiUvPOmaXk23RUMkwbgwI6ULy83xN
	sp9IbVTHbmBu0wAtxxNrW7U9hEzGlsW4duF10o+RFJ8C6ZRhbx0ZIHH/QcoMAMZoI/ez4shHXso
	XZJvy+z2A1rK2ZswNoQ131P22iZxnPjZv3VljzCpHP38ce1dVuG9TwQT3hUVDMMwUbRLJo3aCGo
	d61c6/WsSbc2wg1WlfKTQEK/nP+1bNfWix8gKH/j7a8lXMejTIPpweKQefJ35IGNJDSDwUV0Vae
	9dNieCJFglLiaN/K6dbbnBsJbb02bQkMfqcYIjdn1TX9cDhqWYGIgzCewY7gIimTB83pdTM8zHk
	BPGQzOOxetmojQnUuwS9UOgvVa38vylj6HByG2O9sSj5g9m/825oW9v55UbS3SKSH
X-Received: by 2002:a17:902:f788:b0:2b2:d126:4e77 with SMTP id d9443c01a7336-2b5f9eaea76mr38560935ad.11.1776437971633;
        Fri, 17 Apr 2026 07:59:31 -0700 (PDT)
X-Received: by 2002:a17:902:f788:b0:2b2:d126:4e77 with SMTP id d9443c01a7336-2b5f9eaea76mr38560565ad.11.1776437971054;
        Fri, 17 Apr 2026 07:59:31 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab40786sm25205125ad.79.2026.04.17.07.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 07:59:30 -0700 (PDT)
Message-ID: <26b71f52-3355-d4e9-f640-007123e3aba2@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 20:29:21 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 02/11] media: iris: Add iris vpu bus support and register
 it with iommu_buses
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-2-7d3d1cf57b16@oss.qualcomm.com>
 <eqxeib5ci42ox4o7l45yjwgsjwjyhekojiigpxj6s5npjw5cwq@ggbtohqh3pip>
 <5dee6da0-9170-d9e0-5ff7-f8436331c6a9@oss.qualcomm.com>
In-Reply-To: <5dee6da0-9170-d9e0-5ff7-f8436331c6a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Kd7idwYD c=1 sm=1 tr=0 ts=69e24ad4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=mC123iS2TVYQaReKmh0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: cCklMjwKsFu_yBa46-o15Fbv4cQtYteS
X-Proofpoint-ORIG-GUID: cCklMjwKsFu_yBa46-o15Fbv4cQtYteS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE1MCBTYWx0ZWRfX3PKMJ496dxh9
 c8i+3LrGOdYdzJkaozYvGmbcH44N/0tEkQ+r1W1exbeakgF1+MAPmHbFYdO7pO2GGUpw0nDRCeb
 BDeiilodFJovHUb17PcgwNjy9WmDXiyS2olMGoiVt3f4BP06Oqk5AAhlA+87+vgtkG9A1Vs+aE8
 Rmuee6WlJ/VKollbV7w6cZmyokDOo2GE4qDyX9WIfjsifjc8K7wM/MoamT8r+4Rt/vgB49MBILx
 jY7XPW7BBYl0fLul1MKHMkbyEZLtOFxiPc/9w95PuIFNMGnocwFbD5SRgbLcj+SX4eqtwjX3e9a
 TSFngcYsaCoKtNxvI8dJFtodCyeD2y2x/ND+hkstWkH879GCY5HaUwVENNML/8FWs/ZcNmMXxb7
 inKlGojIlLGcfmitp1Sw50/GJGYsbtNNUAo5qjN+0kcPTQ7FJbaoTeG2G3FbUm7cPvRpxViy8oH
 p0/72VKzjGigPEvuu1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170150
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59024-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9695641C54A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

apologies for re-sending (earlier responses was rejected due to HTML format)

On 4/17/2026 8:22 PM, Vishnu Reddy wrote:
> On 4/14/2026 8:44 PM, Dmitry Baryshkov wrote:
>> On Tue, Apr 14, 2026 at 10:29:58AM +0530, Vishnu Reddy wrote:
>>> From: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>>>
>>> Add a dedicated iris VPU bus type and register it into the iommu_buses
>>> list. Iris devices require their own bus so that each device can run its
>>> own dma_configure() logic.
>> This really tells nothing, unless one has full context about the Iris
>> needs. Start by describing the issue (that the device needs to have
>> multiple devices talking to describe IOMMUs / VAs for several hardware
>> functions), then continue by describing what is needed from the IOMMU
>> subsys.
>
> This series handles firmware device which do not require multiple 
> devices part.
> given this device need for specific IOMMU configuration, I'll update 
> the description
> accordingly.
>
>>> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>>> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
>>> ---
>>>   drivers/iommu/iommu.c                           |  4 ++++
>>>   drivers/media/platform/qcom/iris/Makefile       |  4 ++++
>>>   drivers/media/platform/qcom/iris/iris_vpu_bus.c | 32 +++++++++++++++++++++++++
>>>   include/linux/iris_vpu_bus.h                    | 13 ++++++++++
>> How are you supposed to merge this? Through IOMMU tree? Through venus
>> tree? Can we add one single bus to the IOMMU code and use it for Iris,
>> Venus, FastRPC, host1x and all other device drivers which require
>> per-device DMA configuration?
>
> Separating out the bus definition and the Iris driver handling would 
> provide a
> cleaner merge path.
>
>> Your colleagues from the FastRPC team posted a very similar code few
>> weeks ago and got exactly the same feedback. Is there a reason why your
>> teams don't sync on the IOMMU parts at all?
>
> I would admit that I missed to review that, thank you for bringing 
> that discussion.
> FastRPC patches generalizes the handling for host1x, FastRPC and the 
> same can be
> extended for Iris. I have left few comments there.
>
>>>   4 files changed, 53 insertions(+)
>>>
>>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>>> index 61c12ba78206..d8ed6ef70ecd 100644
>>> --- a/drivers/iommu/iommu.c
>>> +++ b/drivers/iommu/iommu.c
>>> @@ -13,6 +13,7 @@
>>>   #include <linux/bug.h>
>>>   #include <linux/types.h>
>>>   #include <linux/init.h>
>>> +#include <linux/iris_vpu_bus.h>
>>>   #include <linux/export.h>
>>>   #include <linux/slab.h>
>>>   #include <linux/errno.h>
>>> @@ -179,6 +180,9 @@ static const struct bus_type * const iommu_buses[] = {
>>>   #ifdef CONFIG_CDX_BUS
>>>   	&cdx_bus_type,
>>>   #endif
>>> +#if IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS)
>>> +	&iris_vpu_bus_type,
>>> +#endif
>>>   };
>>>   
>>>   /*
>>> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
>>> index 2abbd3aeb4af..6f4052b98491 100644
>>> --- a/drivers/media/platform/qcom/iris/Makefile
>>> +++ b/drivers/media/platform/qcom/iris/Makefile
>>> @@ -31,3 +31,7 @@ qcom-iris-objs += iris_platform_gen1.o
>>>   endif
>>>   
>>>   obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
>>> +
>>> +ifdef CONFIG_VIDEO_QCOM_IRIS
>>> +obj-y += iris_vpu_bus.o
>>> +endif
>>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_bus.c b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
>>> new file mode 100644
>>> index 000000000000..b51bb4b82b0e
>>> --- /dev/null
>>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
>>> @@ -0,0 +1,32 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
>>> + */
>>> +
>>> +#include <linux/device.h>
>>> +#include <linux/of_device.h>
>>> +
>>> +#include "iris_platform_common.h"
>>> +
>>> +static int iris_vpu_bus_dma_configure(struct device *dev)
>>> +{
>>> +	const u32 *f_id = dev_get_drvdata(dev);
>>> +
>>> +	if (!f_id)
>>> +		return -ENODEV;
>>> +
>>> +	return of_dma_configure_id(dev, dev->parent->of_node, true, f_id);
>> I think it was discussed that this is not enough. Some of devices need
>> multiple function IDs.
>
> In this glymur series we are following the legacy way of handling 
> IOMMUs and does not
> require multi map.
>
> Thanks,
> Vishnu Reddy.
>
>>> +}
>>> +
>>> +const struct bus_type iris_vpu_bus_type = {
>>> +	.name = "iris-vpu-bus",
>>> +	.dma_configure = iris_vpu_bus_dma_configure,
>>> +};
>>> +EXPORT_SYMBOL_GPL(iris_vpu_bus_type);
>>> +
>>> +static int __init iris_vpu_bus_init(void)
>>> +{
>>> +	return bus_register(&iris_vpu_bus_type);
>>> +}
>>> +
>>> +postcore_initcall(iris_vpu_bus_init);
>>> diff --git a/include/linux/iris_vpu_bus.h b/include/linux/iris_vpu_bus.h
>>> new file mode 100644
>>> index 000000000000..5704b226f7d6
>>> --- /dev/null
>>> +++ b/include/linux/iris_vpu_bus.h
>>> @@ -0,0 +1,13 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
>>> + */
>>> +
>>> +#ifndef __IRIS_VPU_BUS_H__
>>> +#define __IRIS_VPU_BUS_H__
>>> +
>>> +#if IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS)
>>> +extern const struct bus_type iris_vpu_bus_type;
>>> +#endif
>>> +
>>> +#endif /* __IRIS_VPU_BUS_H__ */
>>>
>>> -- 
>>> 2.34.1
>>>

