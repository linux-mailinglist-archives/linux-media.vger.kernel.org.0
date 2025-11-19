Return-Path: <linux-media+bounces-47336-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8F8C6C234
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 01:31:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D67DB4E8C3F
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 00:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3663120468E;
	Wed, 19 Nov 2025 00:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P531fHNG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F2Ysgtyp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2AD19F115
	for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 00:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763512274; cv=none; b=taHQ4z985X3PskpD4afHZN7TX3MMk0351UYwLZK79qH0c7wPS1thRdQzPsvdvB5ahzyjOmvwhvKRCHgwSnSRj1ZD16GvV9RCBz9ePGBbg4biVlMK0Cjr9ntwNrSKSscNcWP6/0eDxUpTfeCE3inpa5QrQJ8O8EolRFgOa7KDkZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763512274; c=relaxed/simple;
	bh=ZJHdZJimWtkPVCuUGQ6OfH8HWHsmXEkIHEP7iT67of0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VV6HP2L00TWWYKZp6Pnhz15i6I18nq/GtI/Z3Bq4pMC1ihdmtn2BMJaJpecPRo/6F1A8+5EYjBo2nzuNnSC89dcyaBCk+436Nc9myyJ5UvYHj7CV+u6jKKFWD+pU8Ml9n0vwQJRsSA5qOBkDfzEr+bML0JggUIVA4GYonbTtLBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P531fHNG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F2Ysgtyp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIGVKnx2755013
	for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 00:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N7adh+QMbuIr/6x201cuN0jQKcW9XdaN1RQc3EyJZ9Y=; b=P531fHNGOidkuLS7
	6fL2EFI79b0AqTFgnnxsQa8GZbvuZhwLlA7GP3fHh6vkgW55xbHkUnecfQviu9AE
	4DmTG5n2lLVZPCyrB8vp+3jTRnv4+WG6oF+aoXcKL+DaaMe6ErGxtrjs2eH9vsaW
	v+EjKgKpY9sUhLCQFT49rUdBjPb3f972lwH4TpXWOTkrjoNnDyV0mw7t/d0h/WMV
	PZhmtczIxaxVOVftYpqTlOD4vohs5bovGWqPCx1yK7zzWKhs5dhKf9LeMUU1nMRD
	C6X9g0yjVRvJx5HkPZKxKpdxmlzaTd9en2PBP+xZxfVCJoo9xktdV6aJQZ2FFzyg
	u3yNgQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agnkj2jtx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 00:31:11 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b609c0f6522so13881395a12.3
        for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 16:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763512270; x=1764117070; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N7adh+QMbuIr/6x201cuN0jQKcW9XdaN1RQc3EyJZ9Y=;
        b=F2YsgtypGSTLK7a4EGSvZWAab8MO+cxDkqVfN/uIYreqTWQmRUF+7L2nmxmxsy1XUX
         ZU+e01DpBEKxj3OWH6ixPqboeSTYjUdR3fnCMPe7tqa5LQ45G0gdTVEaR3b+71NB0HUT
         J0rSBoOHsKUnGsbEf/SVDM5C0E9PcgcutbvIotQKBAZK1+NpL3m9j2mt0sEpfeo/ILFp
         7SLhCZTRxReTXwlpC5pXYhk2obZDrMxfjs4pryT/cZgvYHH7My4V9nJOlZocHWamqqiJ
         FcjL7P9B1+emRd5SWG0iZ2SYLqBK78UzvhjdKPoHYR/g0EyfAzd94Tb0KRhcOh9iQmAj
         Wneg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763512270; x=1764117070;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N7adh+QMbuIr/6x201cuN0jQKcW9XdaN1RQc3EyJZ9Y=;
        b=AgQ4Ma1WDrhY5chVA9RagVX3Rm5efOPR8xPh2G4t3qz18ZxNcFJoBM4k3btD+gr/Zn
         cWVuc+mbpljP+JAX2XxUa1M9yRt37Xy9IMV1GmGckiGghtL6ni8SBEm1hdqWF/ypsYPW
         EUmuAhjNaPIos3CV/8qn5jXFnO9saNsxS/NJtSvB0B+Wuuf9YoefNQveb6IOOSfT28FB
         eadxClcoMJCnk7v18UpjomSa5etD6SiOapjZZdW1FR9qDlHx3R1VnVonNKTkNsW8geIH
         NI/2JstodBAg8Ko2B9bi8uMyagc24FfczlItO6/XCM+X8gs1t1yGFwLRU1AjcN0FstOE
         NX4w==
X-Forwarded-Encrypted: i=1; AJvYcCWXYNQtaHhskw5UlFgG8wSCmaKZH8RBbN6BtIhu+PH1fcUS8Dl1Z1PuNsydri1HZfOOL8Deg+ExlZqcdg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf7xF42NV3f3OCLKFIa4V2/m+YdEq1cNfsP03/Tp3Zgqa0n9G5
	HgGWP/GWQRjZe01zS5/tKvdxGjnTwb7dVQzrD3XiAp+rUb4wqqoOy51r+l80kHZrLHWFi1omofY
	mmEE8bMxaATHje4vj14FE5Q301mTrbY9kSb7XIXEqEMQfvxwSuxA1OLVjfFrfxXsl5Q==
X-Gm-Gg: ASbGncti2F2MK0h+wByB1kWHKlwWntXJ1S9JM2M3O2TeDFV1QPV/BKFTTVhtc10IL1d
	tXWcyQLNQ9c+8Li3JliRMzn319Mk1sllBaC7UR+BOQkKWJGe0sNzpqJLU+YXEX5ceJswNq2qT+s
	KmZUJMb4CCX6vo/sD3sWBWluN9qMtEFRFRuxE3vDRYKO/V4PeBAGcURWvYWiCEQM6pAFRiPE9h1
	/AccD6/xPn6cGxUxJzfsW5Un2Sg35TbiDiYHmZMQKndE4U9eqkOZODDuJM6IlCo1bbIk2NisTgH
	ehxlepJvllN3H5yet3iNLW9AwNUzzoY+usguig/nVIdL2fhglsImriYnMs/9d3OOe6nOtypEPtq
	z4l0PfhKxg00942PiTEHBgYKMEOYEJLL5DTR7fZQ2
X-Received: by 2002:a05:7022:20c:b0:11b:38b6:a95a with SMTP id a92af1059eb24-11b40fc416bmr9550117c88.11.1763512269598;
        Tue, 18 Nov 2025 16:31:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9aTyhe3QihjQoXig54L488EL6koYTGGg77scgmXT7/fKmTmUcFZujSMAGlA9C7R+urkHskw==
X-Received: by 2002:a05:7022:20c:b0:11b:38b6:a95a with SMTP id a92af1059eb24-11b40fc416bmr9550096c88.11.1763512268863;
        Tue, 18 Nov 2025 16:31:08 -0800 (PST)
Received: from [192.168.1.57] ([98.148.145.183])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b0608861asm44526917c88.9.2025.11.18.16.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 16:31:08 -0800 (PST)
Message-ID: <2d94f235-0ce2-427f-a73f-05603faa37c1@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 16:31:07 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] media: qcom: camss: vfe: Add support for VFE 1080
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
 <20251113-add-support-for-camss-on-kaanapali-v6-5-1e6038785a8e@oss.qualcomm.com>
 <e1868739-2721-4d61-8e0c-eafd9369eabe@linaro.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <e1868739-2721-4d61-8e0c-eafd9369eabe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: W1kQ_qDKo1HOONQ7JgjFExTie-dIRjud
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDAwMiBTYWx0ZWRfX23lnusztReUJ
 2hs538l6sh11oPDmZOXidx5BmJYqJjAztNM24OQ35pnEGEoCEt+AexzLMt4UavIAMv5Ru+vuZqe
 PbXmDijOd9dTYBjyNKg8+wFQe8FElY1KfZPqTgxwbxkPWcbafmIbpqeJPY4Wd2gKO6/78ShFLmM
 SsytW1y8VfVcFJ0DLuKJKFmaL5jlJlAEKGjhCuHCL/SD/vkpar1MjbePWoOQkBQyJMbK8R/kSQN
 A+yGnEVgYHwh9gvmhU7Ct6nEuPJlTbVYPnNLss6SQr36V0DxpBetd4LBiWHoLr9maC99eGBFkiw
 4jLImRiHkg6P8Y0rGVKYTiRfVRRih1XswDm8B5trpF7WogZoa6QQDY/+/V8/m3XpNevXfgZXa5W
 N6+VlDHHwrVl14TKQce6XVINsXc5aQ==
X-Authority-Analysis: v=2.4 cv=cs+WUl4i c=1 sm=1 tr=0 ts=691d0fcf cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=BiHMn5M11h/vNwziJwzFrg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=EszM8AH1TrcyCSHxVMoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: W1kQ_qDKo1HOONQ7JgjFExTie-dIRjud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190002


On 11/18/2025 1:58 AM, Bryan O'Donoghue wrote:
> On 14/11/2025 03:29, Hangxiang Ma wrote:
>> Add Video Front End (VFE) version 1080 as found on the Kaanapali SoC.
>>
>> The FULL front end modules in Kaanapali camera subsystem are called TFEs
>> (Thin Front End), however, retaining the name VFE at places to maintain
>> consistency and avoid unnecessary code changes.
>>
>> This change limits the VFE output lines to 3 for now as constrained by
>> the CAMSS driver framework.
>>
>> Kaanapali architecture requires for the REG_UPDATE and AUP_UPDATE to be
>> issued after all of the CSID configuration has been done. Additionally,
>> the number of AUP_UPDATEs should match the number of buffers enqueued to
>> the write master while it's being enabled.
>>
>> Although the real time data from TFE goes through the RT_CAMNOC, we are
>> required to enable both the camnoc_rt_axi and camnoc_nrt_axi clocks for
>> the PDX_NOC, that follows both the RT and NRT NOCs in this architecture,
>> to ensure that both of the latter are idle after reset.
>>
>> Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
>> Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/camss/Makefile         |   1 +
>>   drivers/media/platform/qcom/camss/camss-vfe-1080.c | 197 
>> +++++++++++++++++++++
>>   drivers/media/platform/qcom/camss/camss-vfe.c      |  10 +-
>>   drivers/media/platform/qcom/camss/camss-vfe.h      |   2 +
>>   drivers/media/platform/qcom/camss/camss.c          | 143 
>> +++++++++++++++
>>   5 files changed, 351 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/Makefile 
>> b/drivers/media/platform/qcom/camss/Makefile
>> index 3a7ed4f5a004..dc41b0d6dc21 100644
>> --- a/drivers/media/platform/qcom/camss/Makefile
>> +++ b/drivers/media/platform/qcom/camss/Makefile
>> @@ -22,6 +22,7 @@ qcom-camss-objs += \
>>           camss-vfe-340.o \
>>           camss-vfe-480.o \
>>           camss-vfe-680.o \
>> +        camss-vfe-1080.o \
>>           camss-vfe-gen3.o \
>>           camss-vfe-gen1.o \
>>           camss-vfe.o \
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-1080.c 
>> b/drivers/media/platform/qcom/camss/camss-vfe-1080.c
>> new file mode 100644
>> index 000000000000..03938759c57b
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe-1080.c
>> @@ -0,0 +1,197 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * camss-vfe-1080.c
>> + *
>> + * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module v1080
>> + *
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/iopoll.h>
>> +
>> +#include "camss.h"
>> +#include "camss-vfe.h"
>> +
>> +/* VFE-1080 Bus Register Base Addresses */
>> +#define BUS_REG_BASE                (vfe_is_lite(vfe) ? 0x800 : 0x1000)
>> +
>> +#define VFE_BUS_WM_CGC_OVERRIDE            (BUS_REG_BASE + 0x08)
>> +#define        WM_CGC_OVERRIDE_ALL            (0x7FFFFFF)
>> +
>> +#define VFE_BUS_WM_TEST_BUS_CTRL        (BUS_REG_BASE + 0x128)
>> +
>> +#define VFE_BUS_WM_CFG(n)            (BUS_REG_BASE + 0x500 + (n) * 
>> 0x100)
>> +#define        WM_CFG_EN                BIT(0)
>> +#define        WM_VIR_FRM_EN                BIT(1)
>> +#define        WM_CFG_MODE                BIT(16)
>> +#define VFE_BUS_WM_IMAGE_ADDR(n)        (BUS_REG_BASE + 0x504 + (n) 
>> * 0x100)
>> +#define VFE_BUS_WM_FRAME_INCR(n)        (BUS_REG_BASE + 0x508 + (n) 
>> * 0x100)
>> +#define VFE_BUS_WM_IMAGE_CFG_0(n)        (BUS_REG_BASE + 0x50c + (n) 
>> * 0x100)
>> +#define        WM_IMAGE_CFG_0_DEFAULT_WIDTH        (0xFFFF)
>> +#define VFE_BUS_WM_IMAGE_CFG_2(n)        (BUS_REG_BASE + 0x514 + (n) 
>> * 0x100)
>> +#define        WM_IMAGE_CFG_2_DEFAULT_STRIDE        (0xFFFF)
>> +#define VFE_BUS_WM_PACKER_CFG(n)        (BUS_REG_BASE + 0x518 + (n) 
>> * 0x100)
>> +
>> +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(n)    (BUS_REG_BASE + 0x530 
>> + (n) * 0x100)
>> +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(n)    (BUS_REG_BASE + 0x534 
>> + (n) * 0x100)
>> +
>> +/* VFE lite has no such registers */
>> +#define VFE_BUS_WM_FRAMEDROP_PERIOD(n)        (BUS_REG_BASE + 0x538 
>> + (n) * 0x100)
>> +#define VFE_BUS_WM_FRAMEDROP_PATTERN(n)        (BUS_REG_BASE + 0x53c 
>> + (n) * 0x100)
>> +
>> +#define VFE_BUS_WM_MMU_PREFETCH_CFG(n)        (BUS_REG_BASE + 0x560 
>> + (n) * 0x100)
>> +#define VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(n)    (BUS_REG_BASE + 
>> 0x564 + (n) * 0x100)
>> +
>> +/*
>> + * IFE write master client IDs
>> + *
>> + * VIDEO_FULL            0
>> + * VIDEO_DC4_Y            1
>> + * VIDEO_DC4_C            2
>> + * VIDEO_DC16_Y            3
>> + * VIDEO_DC16_C            4
>> + * DISPLAY_DS2_Y        5
>> + * DISPLAY_DS2_C        6
>> + * FD_Y                7
>> + * FD_C                8
>> + * PIXEL_RAW            9
>> + * STATS_AEC_BG            10
>> + * STATS_AEC_BHIST        11
>> + * STATS_TINTLESS_BG        12
>> + * STATS_AWB_BG            13
>> + * STATS_AWB_BFW        14
>> + * STATS_AF_BHIST        15
>> + * STATS_ALSC_BG        16
>> + * STATS_FLICKER_BAYERRS    17
>> + * STATS_TMC_BHIST        18
>> + * PDAF_0            19
>> + * PDAF_1            20
>> + * PDAF_2            21
>> + * PDAF_3            22
>> + * RDI0                23
>> + * RDI1                24
>> + * RDI2                25
>> + * RDI3                26
>> + * RDI4                27
>> + *
>> + * IFE Lite write master client IDs
>> + *
>> + * RDI0            0
>> + * RDI1            1
>> + * RDI2            2
>> + * RDI3            3
>> + * GAMMA        4
>> + * STATES_BE        5
>> + */
>> +#define RDI_WM(n) ((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
>> +
>> +static void vfe_wm_start_1080(struct vfe_device *vfe, u8 wm, struct 
>> vfe_line *line)
>> +{
>> +    struct v4l2_pix_format_mplane *pix =
>> +        &line->video_out.active_fmt.fmt.pix_mp;
>> +
>> +    wm = RDI_WM(wm);
>> +
>> +    /* no clock gating at bus input */
>> +    writel(WM_CGC_OVERRIDE_ALL, vfe->base + VFE_BUS_WM_CGC_OVERRIDE);
>> +
>> +    writel(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
>> +
>> +    writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height 
>> >> 8,
>> +           vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
>> +    writel((WM_IMAGE_CFG_0_DEFAULT_WIDTH & 0xFFFF),
>> +           vfe->base + VFE_BUS_WM_IMAGE_CFG_0(wm));
>> +    writel(WM_IMAGE_CFG_2_DEFAULT_STRIDE,
>> +           vfe->base + VFE_BUS_WM_IMAGE_CFG_2(wm));
>> +    writel(0, vfe->base + VFE_BUS_WM_PACKER_CFG(wm));
>> +
>> +    /* no dropped frames, one irq per frame */
>> +    if (!vfe_is_lite(vfe)) {
>> +        writel(0, vfe->base + VFE_BUS_WM_FRAMEDROP_PERIOD(wm));
>> +        writel(1, vfe->base + VFE_BUS_WM_FRAMEDROP_PATTERN(wm));
>> +    }
>> +
>> +    writel(0, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(wm));
>> +    writel(1, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(wm));
>> +
>> +    writel(1, vfe->base + VFE_BUS_WM_MMU_PREFETCH_CFG(wm));
>> +    writel(0xFFFFFFFF, vfe->base + 
>> VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(wm));
>> +
>> +    writel(WM_CFG_EN | WM_CFG_MODE, vfe->base + VFE_BUS_WM_CFG(wm));
>> +}
>> +
>> +static void vfe_wm_stop_1080(struct vfe_device *vfe, u8 wm)
>> +{
>> +    wm = RDI_WM(wm);
>> +    writel(0, vfe->base + VFE_BUS_WM_CFG(wm));
>> +}
>> +
>> +static void vfe_wm_update_1080(struct vfe_device *vfe, u8 wm, u32 addr,
>> +                   struct vfe_line *line)
>> +{
>> +    wm = RDI_WM(wm);
>> +    writel((addr >> 8) & 0xFFFFFFFF, vfe->base + 
>> VFE_BUS_WM_IMAGE_ADDR(wm));
>
> What is the & 0xFFFFFFFF for ?
>
> u32 addr = 0x80008000;
>
> addr = addr >> 8;
>
> addr == 0x8000080;
>
> addr &= 0xFFFFFFFF;
>
> addr == 0x8000080;
>
Agreed. Redundant.
>> +
>> +    dev_dbg(vfe->camss->dev, "wm:%d, image buf addr:0x%x\n", wm, addr);
>> +}
>> +
>> +static void vfe_reg_update_1080(struct vfe_device *vfe, enum 
>> vfe_line_id line_id)
>> +{
>> +    int port_id = line_id;
>> +
>> +    camss_reg_update(vfe->camss, vfe->id, port_id, false);
>> +}
>> +
>> +static inline void vfe_reg_update_clear_1080(struct vfe_device *vfe,
>> +                         enum vfe_line_id line_id)
>> +{
>> +    int port_id = line_id;
>> +
>> +    camss_reg_update(vfe->camss, vfe->id, port_id, true);
>> +}
>> +
>> +static const struct camss_video_ops vfe_video_ops_1080 = {
>> +    .queue_buffer = vfe_queue_buffer_v2,
>> +    .flush_buffers = vfe_flush_buffers,
>> +};
>> +
>> +static void vfe_subdev_init_1080(struct device *dev, struct 
>> vfe_device *vfe)
>> +{
>> +    vfe->video_ops = vfe_video_ops_1080;
>> +}
>> +
>> +static void vfe_global_reset_1080(struct vfe_device *vfe)
>> +{
>> +    vfe_isr_reset_ack(vfe);
>> +}
>> +
>> +static irqreturn_t vfe_isr_1080(int irq, void *dev)
>> +{
>> +    /* nop */
>> +    return IRQ_HANDLED;
>> +}
>> +
>> +static int vfe_halt_1080(struct vfe_device *vfe)
>> +{
>> +    /* rely on vfe_disable_output() to stop the VFE */
>> +    return 0;
>> +}
>> +
>> +const struct vfe_hw_ops vfe_ops_1080 = {
>> +    .global_reset = vfe_global_reset_1080,
>> +    .hw_version = vfe_hw_version,
>> +    .isr = vfe_isr_1080,
>> +    .pm_domain_off = vfe_pm_domain_off,
>> +    .pm_domain_on = vfe_pm_domain_on,
>> +    .reg_update = vfe_reg_update_1080,
>> +    .reg_update_clear = vfe_reg_update_clear_1080,
>> +    .subdev_init = vfe_subdev_init_1080,
>> +    .vfe_disable = vfe_disable,
>> +    .vfe_enable = vfe_enable_v2,
>> +    .vfe_halt = vfe_halt_1080,
>> +    .vfe_wm_start = vfe_wm_start_1080,
>> +    .vfe_wm_stop = vfe_wm_stop_1080,
>> +    .vfe_buf_done = vfe_buf_done,
>> +    .vfe_wm_update = vfe_wm_update_1080,
>> +};
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c 
>> b/drivers/media/platform/qcom/camss/camss-vfe.c
>> index 2753c2bb6c04..0084a1a1e71d 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>> @@ -349,6 +349,7 @@ static u32 vfe_src_pad_code(struct vfe_line 
>> *line, u32 sink_code,
>>       case CAMSS_845:
>>       case CAMSS_8550:
>>       case CAMSS_8775P:
>> +    case CAMSS_KAANAPALI:
>>       case CAMSS_X1E80100:
>>           switch (sink_code) {
>>           case MEDIA_BUS_FMT_YUYV8_1X16:
>> @@ -521,7 +522,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
>>         spin_lock_irqsave(&vfe->output_lock, flags);
>>   -    ops->reg_update_clear(vfe, line->id);
>> +    if (ops->reg_update_clear)
>> +        ops->reg_update_clear(vfe, line->id);
>>         if (output->state > VFE_OUTPUT_RESERVED) {
>>           dev_err(vfe->camss->dev,
>> @@ -548,7 +550,10 @@ int vfe_enable_output_v2(struct vfe_line *line)
>>           output->gen2.active_num++;
>>           ops->vfe_wm_update(vfe, output->wm_idx[0],
>>                      output->buf[i]->addr[0], line);
>> -        ops->reg_update(vfe, line->id);
>> +
>> +        /* Deferring the reg update until after CSID config */
>> +        if (!vfe->camss->res->vfe_res[vfe->id].vfe.is_deferred)
>> +            ops->reg_update(vfe, line->id);
>
> if (vfe->camss->res->vfe_res[vfe->id].vfe.is_deferred)
>     continue;
>
> Instead of calling this "is_deferred" it should name the thing that is 
> deferred reg_update_is_deferred
>
> Is it really deferred or is it done elsewhere ? Deferred implies 
> something happens later and then you'd expect this flag to be cleared.
>
> But it's not cleared, this is a permenant logical change, not a deferral.
>
> Please come up with a better more precise name for this and make your 
> change the corner case not the default, logically.
>
Yes, we can change the name but fundamentally, this is the default 
expectation on KNP every time the stream is enabled. Probably, 
"reg_update_after_csid_config'.
>>       }
>>         spin_unlock_irqrestore(&vfe->output_lock, flags);
>> @@ -1998,6 +2003,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
>>       case CAMSS_845:
>>       case CAMSS_8550:
>>       case CAMSS_8775P:
>> +    case CAMSS_KAANAPALI:
>>       case CAMSS_X1E80100:
>>           ret = 16;
>>           break;
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h 
>> b/drivers/media/platform/qcom/camss/camss-vfe.h
>> index 0300efdb1c46..47851362edd4 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
>> @@ -133,6 +133,7 @@ struct vfe_isr_ops {
>>     struct vfe_subdev_resources {
>>       bool is_lite;
>> +    bool is_deferred;
>>       u8 line_num;
>>       bool has_pd;
>>       char *pd_name;
>> @@ -245,6 +246,7 @@ extern const struct vfe_hw_ops vfe_ops_170;
>>   extern const struct vfe_hw_ops vfe_ops_340;
>>   extern const struct vfe_hw_ops vfe_ops_480;
>>   extern const struct vfe_hw_ops vfe_ops_680;
>> +extern const struct vfe_hw_ops vfe_ops_1080;
>>   extern const struct vfe_hw_ops vfe_ops_gen3;
>>     int vfe_get(struct vfe_device *vfe);
>> diff --git a/drivers/media/platform/qcom/camss/camss.c 
>> b/drivers/media/platform/qcom/camss/camss.c
>> index 30e58aeea310..9b5350b9ff4e 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -217,6 +217,147 @@ static const struct camss_subdev_resources 
>> csid_res_kaanapali[] = {
>>       }
>>   };
>>   +/* In Kaanapali, CAMNOC requires all CAMNOC_RT_TFEX clocks
>> + * to operate on any TFE Full.
>> + */
>> +static const struct camss_subdev_resources vfe_res_kaanapali[] = {
>> +    /* VFE0 - TFE Full */
>> +    {
>> +        .regulators = {},
>> +        .clock = { "gcc_hf_axi", "vfe0_fast_ahb", "vfe0",
>> +               "camnoc_rt_vfe0", "camnoc_rt_vfe1", "camnoc_rt_vfe2",
>> +               "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
>> +        .clock_rate = { { 0 },
>> +                { 0 },
>> +                { 360280000, 480000000, 630000000, 716000000,
>> +                  833000000 },
>> +                { 0 },
>> +                { 0 },
>> +                { 0 },
>> +                { 200000000, 300000000, 400000000, 480000000 },
>> +                { 0 },
>> +                { 0 } },
>> +        .reg = { "vfe0" },
>> +        .interrupt = { "vfe0" },
>> +        .vfe = {
>> +            .line_num = 3,
>> +            .is_lite = false,
>> +            .is_deferred = true,
>> +            .has_pd = true,
>> +            .pd_name = "vfe0",
>> +            .hw_ops = &vfe_ops_1080,
>> +            .formats_rdi = &vfe_formats_rdi_845,
>> +            .formats_pix = &vfe_formats_pix_845
>> +        }
>> +    },
>> +    /* VFE1 - TFE Full */
>> +    {
>> +        .regulators = {},
>> +        .clock = { "gcc_hf_axi", "vfe1_fast_ahb", "vfe1",
>> +               "camnoc_rt_vfe0", "camnoc_rt_vfe1", "camnoc_rt_vfe2",
>> +               "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
>> +        .clock_rate = { { 0 },
>> +                { 0 },
>> +                { 360280000, 480000000, 630000000, 716000000,
>> +                  833000000 },
>> +                { 0 },
>> +                { 0 },
>> +                { 0 },
>> +                { 200000000, 300000000, 400000000, 480000000 },
>> +                { 0 },
>> +                { 0 } },
>> +        .reg = { "vfe1" },
>> +        .interrupt = { "vfe1" },
>> +        .vfe = {
>> +            .line_num = 3,
>> +            .is_lite = false,
>> +            .is_deferred = true,
>> +            .has_pd = true,
>> +            .pd_name = "vfe1",
>> +            .hw_ops = &vfe_ops_1080,
>> +            .formats_rdi = &vfe_formats_rdi_845,
>> +            .formats_pix = &vfe_formats_pix_845
>> +        }
>> +    },
>> +    /* VFE2 - TFE Full */
>> +    {
>> +        .regulators = {},
>> +        .clock = { "gcc_hf_axi", "vfe2_fast_ahb", "vfe2",
>> +               "camnoc_rt_vfe0", "camnoc_rt_vfe1", "camnoc_rt_vfe2",
>> +               "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
>> +        .clock_rate = { { 0 },
>> +                { 0 },
>> +                { 360280000, 480000000, 630000000, 716000000,
>> +                  833000000 },
>> +                { 0 },
>> +                { 0 },
>> +                { 0 },
>> +                { 200000000, 300000000, 400000000, 480000000 },
>> +                { 0 },
>> +                { 0 } },
>> +        .reg = { "vfe2" },
>> +        .interrupt = { "vfe2" },
>> +        .vfe = {
>> +            .line_num = 3,
>> +            .is_lite = false,
>> +            .is_deferred = true,
>> +            .has_pd = true,
>> +            .pd_name = "vfe2",
>> +            .hw_ops = &vfe_ops_1080,
>> +            .formats_rdi = &vfe_formats_rdi_845,
>> +            .formats_pix = &vfe_formats_pix_845
>> +        }
>> +    },
>> +    /* VFE3 - IFE Lite */
>> +    {
>> +        .regulators = {},
>> +        .clock = { "gcc_hf_axi", "vfe_lite_ahb", "vfe_lite",
>> +               "camnoc_rt_vfe_lite", "camnoc_rt_axi",
>> +               "camnoc_nrt_axi", "qdss_debug_xo" },
>> +        .clock_rate = { { 0 },
>> +                { 0 },
>> +                { 266666667, 400000000, 480000000 },
>> +                { 0 },
>> +                { 200000000, 300000000, 400000000, 480000000 },
>> +                { 0 },
>> +                { 0 } },
>> +        .reg = { "vfe_lite0" },
>> +        .interrupt = { "vfe_lite0" },
>> +        .vfe = {
>> +            .line_num = 4,
>> +            .is_lite = true,
>> +            .is_deferred = true,
>> +            .hw_ops = &vfe_ops_1080,
>> +            .formats_rdi = &vfe_formats_rdi_845,
>> +            .formats_pix = &vfe_formats_pix_845
>> +        }
>> +    },
>> +    /* VFE4 - IFE Lite */
>> +    {
>> +        .regulators = {},
>> +        .clock = { "gcc_hf_axi", "vfe_lite_ahb", "vfe_lite",
>> +               "camnoc_rt_vfe_lite", "camnoc_rt_axi",
>> +               "camnoc_nrt_axi", "qdss_debug_xo" },
>> +        .clock_rate = { { 0 },
>> +                { 0 },
>> +                { 266666667, 400000000, 480000000 },
>> +                { 0 },
>> +                { 200000000, 300000000, 400000000, 480000000 },
>> +                { 0 },
>> +                { 0 } },
>> +        .reg = { "vfe_lite1" },
>> +        .interrupt = { "vfe_lite1" },
>> +        .vfe = {
>> +            .line_num = 4,
>> +            .is_lite = true,
>> +            .is_deferred = true,
>> +            .hw_ops = &vfe_ops_1080,
>> +            .formats_rdi = &vfe_formats_rdi_845,
>> +            .formats_pix = &vfe_formats_pix_845
>> +        }
>> +    },
>> +};
>> +
>>   static const struct resources_icc icc_res_kaanapali[] = {
>>       {
>>           .name = "ahb",
>> @@ -4493,10 +4634,12 @@ static const struct camss_resources 
>> kaanapali_resources = {
>>       .pd_name = "top",
>>       .csiphy_res = csiphy_res_kaanapali,
>>       .csid_res = csid_res_kaanapali,
>> +    .vfe_res = vfe_res_kaanapali,
>>       .icc_res = icc_res_kaanapali,
>>       .icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
>>       .csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
>>       .csid_num = ARRAY_SIZE(csid_res_kaanapali),
>> +    .vfe_num = ARRAY_SIZE(vfe_res_kaanapali),
>>   };
>>     static const struct camss_resources msm8916_resources = {
>>
>
Thanks,

Vijay.


