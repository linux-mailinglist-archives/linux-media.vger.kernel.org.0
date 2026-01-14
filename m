Return-Path: <linux-media+bounces-50635-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6D0D1C342
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 04:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9728730274C4
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 03:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47243148D2;
	Wed, 14 Jan 2026 03:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+EJeIpc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MsQMaoAg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6E53233EA
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 03:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768359877; cv=none; b=ayo1nqoOi+j0jCvH473hDvaDs54xc8ZegoDb6Tf66MzKKYT+yvO9v3a9D5KPLmTmZcoz3f06jfHJn/YHs495x3QvnG01wzU1BdtrWNQWDs3kDuNcr9BMNqOxvSCvtTw19Z1CKb5HuFOLrbfReR9JYazgx1NMeUsTqBOd8pS2hE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768359877; c=relaxed/simple;
	bh=GTMPEDNrBLyHN0wp7KDMVndxcqLfBS0dMT22LDMzci8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cLAzuAQbeF3HtP/LGZljma1BPE6NHId4VGdnBELWrWzU+7YQ7QPZExoBjsCqCfWSUZYbWq+5M+8ajQ6rgCIvVC7oA/VR1r/xDa2sprXcW1/mpiqBp9VW6cpBta11CV95aMvQlHnFiY2MhUk2IvOFGdXd4erBAJzE5QNRR+a6wjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+EJeIpc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MsQMaoAg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DNHXZC832879
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 03:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gi6H1IbiSBbwxG3r6XjrSpy5BkcycUOw5yz8GII7zEI=; b=S+EJeIpcM3hUFqOO
	BW6Aw8cQBAHqvg2oZUgL+WPoPHx00DSnrL0Sx0nxrMre27xu4OpvmfjKBIwNoC90
	cZbQcuDn1M+bqPTwHwSr8Ln9QLzICStMlQ2fukcHRJgAkvWIpc8apo5jiT0jcppU
	yuHqkksa+gdK2F0qW7h4ZPDb4Pqr3Z0NJIB1nytNaw5uaLZ8rJqen04HopV1Nzes
	Kn+k1alnLXHy8aEc5sEHdMEFYuyag54BjLrgemsK1kZYJ6aw7nmPEGrfV/uOeMBC
	FU5r/nMAbN/DqzBck6qhL7GtqDRlfYgggHBk8rFWoJlArN5kKY2uQ7DmE+HJuy7b
	DelS8g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnsyb9ned-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 03:04:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1d26abbd8so263797811cf.1
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 19:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768359872; x=1768964672; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gi6H1IbiSBbwxG3r6XjrSpy5BkcycUOw5yz8GII7zEI=;
        b=MsQMaoAgkVowx1E/DgvKOI7v6jA3S2asdCT+kptZEIN4mmqBO42PjOEbFzCkK4ekVN
         NxZPzaTxh17djMsbS7sCGZM3xWwvpIPiZeOaGrj6cY4YuggeozP5RuobwzxRp5XBYuOE
         +dW8cv+lEzxV6PTTHsMYhFHYEXg+olNLyY6utxlwqBwcP86vk8AHoGeI+v/sCqjc7wWu
         xjNYgE66hZGMN6AvON4K0E7rHdsql154dN4lavrlWLpoAn5HnEQCvZi0FkedTOxvUxr8
         TtlxlFkUxVc7yJIwPDKAOOXXvlB5iXxIOBIHB6jYgcPm8VvB13X6PrytOFlfYnSoIQYU
         mkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768359872; x=1768964672;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gi6H1IbiSBbwxG3r6XjrSpy5BkcycUOw5yz8GII7zEI=;
        b=AatWLmYGF7i4O4yERq21lyEORMQdMDcCNpRhCOizg4Cw3K5uBG2Jp2oNMLKJTvH39A
         UAfsc0OqM/VYg0IBvenMh4s61vFwsTtM2kTVG4HuHXvbQqKeHSC+4/pWcXTWrnz53X1D
         vW3UaWeaNm/1bXgs/Kt8LsfQfsymnnwRPlt1hcsobgYyiWUo0XzI7hkzxKRp87zvDUBF
         hEvkshczKKwVt3jM7X9v+ZrKZLGb5W12Nev768qGnaxmOwXGMQ/de+rJMwM4qAHm1kfd
         b2IGMjzn08wChfy2FY0r9v0OPSV/CnQj572cWAXp71UlBUqbbaRRGRP64zAI2RsBqECl
         roIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOPb3J7CbRUkho4Wj3/79zpneZQ/FrEZ5OhCUON88a0Fhl9NKBM6NvkwNozuBj1PmcfU5kUXs8lr+XMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmI1cq7MDq8wz9f/gSXFzndQX9Wtpu+m3hnkH26jA1JACRVLaE
	mIpqNdao8AyvWfP1XPuMrmcl3DB38zd/EdsX7kDpS0qIRi8PoPZ48Accp95dlFpTM+c9UqLq6/Y
	+7A91vxj+rv5iSLoDNQL+TZ7Jtw30wdqlA27T0ydJTTCVvBAzt2G+CkYSHm31PLgBAA==
X-Gm-Gg: AY/fxX7dPdjLb05fZIeDsek/GyQUuD+gt5WYf2LW4YMBfNun2RnNXBDM+q6lDI0zHFd
	u8U9iSH6BJIwmovdFFkEEMNCPfwBPjM8fUz0GefgyH6uAOU2WE81Izq7AmjVOuHC3zcpVs0Qr6U
	fcUbJUhqOqF7T41qLNHL6YNlicb/p2PW/zO2nAOWosRKnFtURoNf/1uxfN/3Zf5DacWH/fRZq4y
	7jGiuw0o+p5R339LRF8637hI/baMA5adkDj2HS6Hw7D0pmnO8pITT9lXWcrUcA4xfqMLjhD2Bvk
	UEbLtFFfLHHEHTjtF3HJSw2YZETjZ2Le0ELTJaioPw7sb0B7TYkR+K71Rb24BcYthcAadhuQZk2
	ITtF+/DhJJECEw+SQEW+uzs6zYdrDs15EU0kYCIZ7Jfb4bLB/iZSi4aZU1tyGOL3CWgtFA4M3xA
	==
X-Received: by 2002:a05:622a:14c7:b0:501:4163:1f48 with SMTP id d75a77b69052e-5014821056amr20702811cf.19.1768359872135;
        Tue, 13 Jan 2026 19:04:32 -0800 (PST)
X-Received: by 2002:a05:622a:14c7:b0:501:4163:1f48 with SMTP id d75a77b69052e-5014821056amr20702291cf.19.1768359871456;
        Tue, 13 Jan 2026 19:04:31 -0800 (PST)
Received: from [10.111.171.115] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50148dd766fsm5818631cf.7.2026.01.13.19.04.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 19:04:30 -0800 (PST)
Message-ID: <98a26638-675b-4654-a940-898ba9e1af9c@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 11:04:26 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] media: qcom: camss: Add common TPG support
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260113-camss_tpg-v8-0-fa2cb186a018@oss.qualcomm.com>
 <20260113-camss_tpg-v8-1-fa2cb186a018@oss.qualcomm.com>
 <87a31d4e-b604-4b9a-92e9-75fd2748489a@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <87a31d4e-b604-4b9a-92e9-75fd2748489a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ZgGOJ6oVryoHru-omu-DByEbMazkuuky
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDAyMCBTYWx0ZWRfX+IsDKf3+I4uW
 7uJVydvZaDlM8Xz0EolzUiZR0+yCatSbwJC442OfeKfW0SpWUkwqzFAAbk2PUX/DTIfVHTEmPSh
 PQffquSQyvXmdm9po2kb2AeTcuXs/GInfBbJZcn0mGQo2v3yYAwYJdIr9dyPf2dd8//YD2egLEd
 0pqwnbJ9JsaBtNYWqOuFvKBOCSA6h/YASAASuEqUoruptcBFWwNrMcImtQlgnDQdCwe+qsJ5FtG
 uypHMwJJo7CCr4QBkRJ3O0TMEAmgbbh50KuTiLJ7CJMTv78ID9dQWIL5qVthldYmgLYXJPnCnWX
 TO5cJ/Wf4GqhiFJpureFmRBAqaW9km8qp2cEpGKuSLWR0huNq6XdtLZju4tLZW+1p9g9/DMR+WK
 3stbL/+TyAKxDxoyoobqCJyg36ShndO/bi8zn8oq6rm9umGzUmDKkglcNL68atlJJV4qzrHvKT3
 y5QLsHaDSO1Q/f76hKQ==
X-Proofpoint-GUID: ZgGOJ6oVryoHru-omu-DByEbMazkuuky
X-Authority-Analysis: v=2.4 cv=IpETsb/g c=1 sm=1 tr=0 ts=696707c1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5dRrolKJAAAA:8
 a=Dbw0RLX1Hy8_-nJpkfgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=y3-2bcJ53AEkEa81XYCb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140020

Hi Vladimir,

On 1/14/2026 12:27 AM, Vladimir Zapolskiy wrote:
> Hello Wenmeng.
> 
> On 1/13/26 11:03, Wenmeng Liu wrote:
>> Introduce a new common Test Pattern Generator (TPG) implementation for
>> Qualcomm CAMSS. This module provides a generic interface for pattern
>> generation that can be reused by multiple platforms.
>>
>> Unlike CSID-integrated TPG, this TPG acts as a standalone block
>> that emulates both CSIPHY and sensor behavior, enabling flexible test
>> patterns without external hardware.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/camss/Makefile    |   1 +
>>   drivers/media/platform/qcom/camss/camss-tpg.c | 710 ++++++++++++++++ 
>> ++++++++++
>>   drivers/media/platform/qcom/camss/camss-tpg.h | 127 +++++
>>   drivers/media/platform/qcom/camss/camss.h     |   5 +
>>   4 files changed, 843 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/ 
>> media/platform/qcom/camss/Makefile
>> index 
>> 5e349b4915130c71dbff90e73102e46dfede1520..d355e67c25700ac061b878543c32ed8defc03ad0 100644
>> --- a/drivers/media/platform/qcom/camss/Makefile
>> +++ b/drivers/media/platform/qcom/camss/Makefile
>> @@ -27,5 +27,6 @@ qcom-camss-objs += \
>>           camss-vfe.o \
>>           camss-video.o \
>>           camss-format.o \
>> +        camss-tpg.o \
> 
> While you're here, please sort and keep the lines in alphabetical order.
ACK.

> 
>>   obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
>> diff --git a/drivers/media/platform/qcom/camss/camss-tpg.c b/drivers/ 
>> media/platform/qcom/camss/camss-tpg.c
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..f4c015aafa202e5b64fafa3c543128fda6440b11
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/camss/camss-tpg.c
>> @@ -0,0 +1,710 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + *
>> + * Qualcomm MSM Camera Subsystem - TPG Module
>> + *
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>> +#include <media/media-entity.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-subdev.h>
>> +
>> +#include "camss-tpg.h"
>> +#include "camss.h"
>> +
>> +const char * const testgen_payload_modes[] = {
>> +    "Disabled",
>> +    "Incrementing",
>> +    "Alternating 0x55/0xAA",
>> +    "Reserved",
>> +    "Reserved",
>> +    "Pseudo-random Data",
>> +    "User Specified",
>> +    "Reserved",
>> +    "Reserved",
>> +    "Color bars",
>> +    "Reserved"
> 
> It makes little sense to mention the unsupported values, and then
> introduce enum tpg_testgen_mode to list the supported ones.
> 
This is for ctrl menu, will do as follow:
static const char * const testgen_payload_modes[] = {
     [TPG_PAYLOAD_MODE_DISABLED]          = "Disabled",
     [TPG_PAYLOAD_MODE_INCREMENTING]      = "Incrementing",
     [TPG_PAYLOAD_MODE_ALTERNATING_55_AA]       = "Alternating 0x55/0xAA",
     [TPG_PAYLOAD_MODE_RANDOM]      = "Pseudo-random Data",
     [TPG_PAYLOAD_MODE_USER_SPECIFIED]    = "User Specified",
     [TPG_PAYLOAD_MODE_COLOR_BARS]        = "Color bars",
};

>> +};
> 
> Are these test pattern modes specific to TPG Gen1 only?
> 
> CSID TPG uses a different 'csid_testgen_modes' list, and if the list 
> above is
> TPG Gen1 specific, it would make sense to place it right in camss-tpg- 
> gen1.c
> 

Like other CAMSS nodes, the files placed in the core are meant to 
maintain consistency with the others.

>> +
>> +static const struct tpg_format_info formats_gen1[] = {
>> +    {
>> +        MEDIA_BUS_FMT_SBGGR8_1X8,
>> +        DATA_TYPE_RAW_8BIT,
> 
> Please replace it with MIPI_CSI2_DT_RAW8
>

ACK.>> +        ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
>> +        8,
>> +    },
>> +    {
>> +        MEDIA_BUS_FMT_SGBRG8_1X8,
>> +        DATA_TYPE_RAW_8BIT,
>> +        ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
>> +        8,
>> +    },
>> +    {
>> +        MEDIA_BUS_FMT_SGRBG8_1X8,
>> +        DATA_TYPE_RAW_8BIT,
>> +        ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
>> +        8,
>> +    },
>> +    {
>> +        MEDIA_BUS_FMT_SRGGB8_1X8,
>> +        DATA_TYPE_RAW_8BIT,
>> +        ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
>> +        8,
>> +    },
>> +    {
>> +        MEDIA_BUS_FMT_SBGGR10_1X10,
>> +        DATA_TYPE_RAW_10BIT,
> 
> MIPI_CSI2_DT_RAW10>

ACK.>> +        ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
>> +        10,
>> +    },
>> +    {
>> +        MEDIA_BUS_FMT_SGBRG10_1X10,
>> +        DATA_TYPE_RAW_10BIT,
>> +        ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
>> +        10,
>> +    },
>> +    {
>> +        MEDIA_BUS_FMT_SGRBG10_1X10,
>> +        DATA_TYPE_RAW_10BIT,
>> +        ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
>> +        10,
>> +    },
>> +    {
>> +        MEDIA_BUS_FMT_SRGGB10_1X10,
>> +        DATA_TYPE_RAW_10BIT,
>> +        ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
>> +        10,
>> +    },
>> +    {
>> +        MEDIA_BUS_FMT_SBGGR12_1X12,
>> +        DATA_TYPE_RAW_12BIT,
> 
> MIPI_CSI2_DT_RAW12
> 

ACK.>> +        ENCODE_FORMAT_UNCOMPRESSED_12_BIT,
>> +        12,
>> +    },
>> +    {
>> +        MEDIA_BUS_FMT_SGBRG12_1X12,
>> +        DATA_TYPE_RAW_12BIT,
>> +        ENCODE_FORMAT_UNCOMPRESSED_12_BIT,
>> +        12,
>> +    },
>> +    {
>> +        MEDIA_BUS_FMT_SGRBG12_1X12,
>> +        DATA_TYPE_RAW_12BIT,
>> +        ENCODE_FORMAT_UNCOMPRESSED_12_BIT,
>> +        12,
>> +    },
>> +    {
>> +        MEDIA_BUS_FMT_SRGGB12_1X12,
>> +        DATA_TYPE_RAW_12BIT,
>> +        ENCODE_FORMAT_UNCOMPRESSED_12_BIT,
>> +        12,
>> +    },
>> +    {
>> +        MEDIA_BUS_FMT_Y8_1X8,
>> +        DATA_TYPE_RAW_8BIT,
>> +        ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
>> +        8,
>> +    },
>> +    {
>> +        MEDIA_BUS_FMT_Y10_1X10,
>> +        DATA_TYPE_RAW_10BIT,
>> +        ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
>> +        10,
>> +    },
>> +};
>> +
>> +const struct tpg_formats tpg_formats_gen1 = {
>> +    .nformats = ARRAY_SIZE(formats_gen1),
>> +    .formats = formats_gen1
>> +};
>> +
>> +const struct tpg_format_info *tpg_get_fmt_entry(struct tpg_device *tpg,
>> +                        const struct tpg_format_info *formats,
>> +                        unsigned int nformats,
>> +                        u32 code)
>> +{
>> +    struct device *dev = tpg->camss->dev;
>> +    size_t i;
> 
> unsigned int i, size_t is very unexpected to get here.
> 

I have received comments on this.

https://lore.kernel.org/all/449ac3c3-1f6a-4e69-899d-c4e4577714a4@oss.qualcomm.com/

https://staticthinking.wordpress.com/2022/06/01/unsigned-int-i-is-stupid/>> 
+
>> +    for (i = 0; i < nformats; i++)
>> +        if (code == formats[i].code)
>> +            return &formats[i];
>> +
>> +    dev_warn(dev, "Unknown pixel format code=0x%08x\n", code);
> 
> Please remove dev_warn() completely, it opens a way to flood the kernel 
> log.
> 

This is an exception printout and will not appear under normal 
circumstances.>> +
>> +    return ERR_PTR(-EINVAL);
>> +}
>> +
>> +/*
>> + * tpg_set_clock_rates - set clock rates on tpg module
>> + * @tpg: tpg device
>> + */
>> +static int tpg_set_clock_rates(struct tpg_device *tpg)
>> +{
>> +    struct device *dev = tpg->camss->dev;
>> +    int ret;
>> +    int i;
>> +
>> +    for (i = 0; i < tpg->nclocks; i++) {
>> +        struct camss_clock *clock = &tpg->clock[i];
>> +        long round_rate;
>> +
>> +        if (clock->freq) {
>> +            round_rate = clk_round_rate(clock->clk, clock->freq[0]);
>> +            if (round_rate < 0) {
>> +                dev_err(dev, "clk round rate failed: %ld\n",
>> +                    round_rate);
>> +                return -EINVAL;
>> +            }
>> +
>> +            ret = clk_set_rate(clock->clk, round_rate);
>> +            if (ret < 0) {
>> +                dev_err(dev, "clk set rate failed: %d\n", ret);
>> +                return ret;
>> +            }
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +/*
>> + * tpg_set_power - Power on/off tpg module
>> + * @sd: tpg V4L2 subdevice
>> + * @on: Requested power state
>> + *
>> + * Return 0 on success or a negative error code otherwise
>> + */
>> +static int tpg_set_power(struct v4l2_subdev *sd, int on)
>> +{
>> +    struct tpg_device *tpg = v4l2_get_subdevdata(sd);
>> +    struct device *dev = tpg->camss->dev;
>> +
>> +    if (on) {
>> +        int ret;
>> +
>> +        ret = pm_runtime_resume_and_get(dev);
>> +        if (ret < 0)
>> +            return ret;
>> +
>> +        ret = tpg_set_clock_rates(tpg);
>> +        if (ret < 0) {
>> +            pm_runtime_put_sync(dev);
>> +            return ret;
>> +        }
>> +
>> +        ret = camss_enable_clocks(tpg->nclocks, tpg->clock, dev);
>> +        if (ret < 0) {
>> +            pm_runtime_put_sync(dev);
>> +            return ret;
>> +        }
>> +
>> +        tpg->res->hw_ops->reset(tpg);
>> +
>> +        tpg->res->hw_ops->hw_version(tpg);
>> +    } else {
>> +        camss_disable_clocks(tpg->nclocks, tpg->clock);
>> +
>> +        pm_runtime_put_sync(dev);
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +/*
>> + * tpg_set_stream - Enable/disable streaming on tpg module
>> + * @sd: tpg V4L2 subdevice
>> + * @enable: Requested streaming state
>> + *
>> + * Return 0 on success or a negative error code otherwise
>> + */
>> +static int tpg_set_stream(struct v4l2_subdev *sd, int enable)
>> +{
>> +    struct tpg_device *tpg = v4l2_get_subdevdata(sd);
>> +    int ret = 0;
>> +
>> +    if (enable) {
>> +        ret = v4l2_ctrl_handler_setup(&tpg->ctrls);
>> +        if (ret < 0) {
>> +            dev_err(tpg->camss->dev,
>> +                "could not sync v4l2 controls: %d\n", ret);
>> +            return ret;
>> +        }
>> +    }
>> +
>> +    ret = tpg->res->hw_ops->configure_stream(tpg, enable);
>> +
>> +    return ret;
>> +}
>> +
>> +/*
>> + * __tpg_get_format - Get pointer to format structure
>> + * @tpg: tpg device
>> + * @cfg: V4L2 subdev pad configuration
> 
> There is no such function argument. There are much more errors in
> the doxygen descriptions of functions, please remove all these
> doxygen comments, they do not bring anything valuable here.
> 


ACK.>> + * @pad: pad from which format is requested
>> + * @which: TRY or ACTIVE format
>> + *
>> + * Return pointer to TRY or ACTIVE format structure
>> + */
>> +static struct v4l2_mbus_framefmt *
>> +__tpg_get_format(struct tpg_device *tpg,
>> +         struct v4l2_subdev_state *sd_state,
>> +         unsigned int pad,
>> +         enum v4l2_subdev_format_whence which)
>> +{
>> +    if (which == V4L2_SUBDEV_FORMAT_TRY)
>> +        return v4l2_subdev_state_get_format(sd_state,
>> +                            pad);
>> +
>> +    return &tpg->fmt[pad];
>> +}
>> +
>> +/*
>> + * tpg_try_format - Handle try format by pad subdev method
>> + * @tpg: tpg device
>> + * @cfg: V4L2 subdev pad configuration
> 
> No such argument.
> 

ACK.>> + * @pad: pad on which format is requested
>> + * @fmt: pointer to v4l2 format structure
>> + * @which: wanted subdev format
>> + */
>> +static void tpg_try_format(struct tpg_device *tpg,
>> +               struct v4l2_subdev_state *sd_state,
>> +               unsigned int pad,
>> +               struct v4l2_mbus_framefmt *fmt,
>> +               enum v4l2_subdev_format_whence which)
>> +{
>> +    unsigned int i;
>> +
>> +    switch (pad) {
>> +    case MSM_TPG_PAD_SINK:
>> +        for (i = 0; i < tpg->res->formats->nformats; i++)
>> +            if (tpg->res->formats->formats[i].code == fmt->code)
>> +                break;
>> +
>> +        /* If not found, use SBGGR8 as default */
>> +        if (i >= tpg->res->formats->nformats)
>> +            fmt->code = MEDIA_BUS_FMT_SBGGR8_1X8;
>> +
>> +        fmt->width = clamp_t(u32, fmt->width, 1, 8191);
>> +        fmt->height = clamp_t(u32, fmt->height, 1, 8191);
>> +
>> +        fmt->field = V4L2_FIELD_NONE;
>> +        fmt->colorspace = V4L2_COLORSPACE_SRGB;
>> +
>> +        break;
>> +    case MSM_TPG_PAD_SRC:
>> +        *fmt = *__tpg_get_format(tpg, sd_state,
>> +                     MSM_TPG_PAD_SINK,
>> +                     which);
>> +
>> +        break;
>> +    }
>> +}
>> +
>> +/*
>> + * tpg_enum_mbus_code - Handle format enumeration
>> + * @sd: tpg V4L2 subdevice
>> + * @cfg: V4L2 subdev pad configuration
> 
> No such argument.
> 

ACK.>> + * @code: pointer to v4l2_subdev_mbus_code_enum structure
>> + * return -EINVAL or zero on success
>> + */
>> +static int tpg_enum_mbus_code(struct v4l2_subdev *sd,
>> +                  struct v4l2_subdev_state *sd_state,
>> +                  struct v4l2_subdev_mbus_code_enum *code)
>> +{
>> +    struct tpg_device *tpg = v4l2_get_subdevdata(sd);
>> +    struct v4l2_mbus_framefmt *format;
>> +
>> +    if (code->pad == MSM_TPG_PAD_SINK) {
>> +        if (code->index >= tpg->res->formats->nformats)
>> +            return -EINVAL;
>> +
>> +        code->code = tpg->res->formats->formats[code->index].code;
>> +    } else {
>> +        if (code->index > 0)
>> +            return -EINVAL;
>> +
>> +        format = __tpg_get_format(tpg, sd_state,
>> +                      MSM_TPG_PAD_SINK,
>> +                      code->which);
>> +
>> +        code->code = format->code;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +/*
>> + * tpg_enum_frame_size - Handle frame size enumeration
>> + * @sd: tpg V4L2 subdevice
>> + * @cfg: V4L2 subdev pad configuration
>> + * @fse: pointer to v4l2_subdev_frame_size_enum structure
>> + * return -EINVAL or zero on success
>> + */
>> +static int tpg_enum_frame_size(struct v4l2_subdev *sd,
>> +                   struct v4l2_subdev_state *sd_state,
>> +                   struct v4l2_subdev_frame_size_enum *fse)
>> +{
>> +    struct tpg_device *tpg = v4l2_get_subdevdata(sd);
>> +    struct v4l2_mbus_framefmt format;
>> +
>> +    if (fse->index != 0)
>> +        return -EINVAL;
>> +
>> +    format.code = fse->code;
>> +    format.width = 1;
>> +    format.height = 1;
>> +    tpg_try_format(tpg, sd_state, fse->pad, &format, fse->which);
>> +    fse->min_width = format.width;
>> +    fse->min_height = format.height;
>> +
>> +    if (format.code != fse->code)
>> +        return -EINVAL;
>> +
>> +    format.code = fse->code;
>> +    format.width = -1;
>> +    format.height = -1;
> 
> format.width and format.height are rewritten in the tpg_try_format(),
> so it makes no sense to assign them.
> 

This is use for pass parameters in.

> The problem is that for whatever reason you can tpg_try_format() twice
> in a raw, it looks wrong, and I'm certain you can modify the functions
> so that only one call would be needed.
> The first call is to get the supported minimum size, and the second call 
is to get the maximum size.

The tpg_try_format function can be used multiple times; I don't think 
it's necessary to write a new interface.

>> +    tpg_try_format(tpg, sd_state, fse->pad, &format, fse->which);
>> +    fse->max_width = format.width;
>> +    fse->max_height = format.height;
>> +
>> +    return 0;
>> +}
>> +
>> +/*
>> + * tpg_get_format - Handle get format by pads subdev method
>> + * @sd: tpg V4L2 subdevice
>> + * @cfg: V4L2 subdev pad configuration
>> + * @fmt: pointer to v4l2 subdev format structure
>> + *
>> + * Return -EINVAL or zero on success
>> + */
>> +static int tpg_get_format(struct v4l2_subdev *sd,
>> +              struct v4l2_subdev_state *sd_state,
>> +              struct v4l2_subdev_format *fmt)
>> +{
>> +    struct tpg_device *tpg = v4l2_get_subdevdata(sd);
>> +    struct v4l2_mbus_framefmt *format;
>> +
>> +    format = __tpg_get_format(tpg, sd_state, fmt->pad, fmt->which);
>> +    if (!format)
>> +        return -EINVAL;
>> +
>> +    fmt->format = *format;
>> +
>> +    return 0;
>> +}
>> +
>> +/*
>> + * tpg_set_format - Handle set format by pads subdev method
>> + * @sd: tpg V4L2 subdevice
>> + * @cfg: V4L2 subdev pad configuration
>> + * @fmt: pointer to v4l2 subdev format structure
>> + *
>> + * Return -EINVAL or zero on success
>> + */
>> +static int tpg_set_format(struct v4l2_subdev *sd,
>> +              struct v4l2_subdev_state *sd_state,
>> +              struct v4l2_subdev_format *fmt)
>> +{
>> +    struct tpg_device *tpg = v4l2_get_subdevdata(sd);
>> +    struct v4l2_mbus_framefmt *format;
>> +
>> +    format = __tpg_get_format(tpg, sd_state, fmt->pad, fmt->which);
>> +    if (!format)
>> +        return -EINVAL;
>> +
>> +    tpg_try_format(tpg, sd_state, fmt->pad, &fmt->format,
>> +               fmt->which);
>> +    *format = fmt->format;
>> +
>> +    if (fmt->pad == MSM_TPG_PAD_SINK) {
>> +        format = __tpg_get_format(tpg, sd_state,
>> +                      MSM_TPG_PAD_SRC,
>> +                      fmt->which);
>> +
>> +        *format = fmt->format;
>> +        tpg_try_format(tpg, sd_state, MSM_TPG_PAD_SRC,
>> +                   format,
>> +                   fmt->which);
>> +    }
>> +    return 0;
>> +}
>> +
>> +/*
>> + * tpg_init_formats - Initialize formats on all pads
>> + * @sd: tpg V4L2 subdevice
>> + * @fh: V4L2 subdev file handle
>> + *
>> + * Initialize all pad formats with default values.
>> + *
>> + * Return 0 on success or a negative error code otherwise
>> + */
>> +static int tpg_init_formats(struct v4l2_subdev *sd,
>> +                struct v4l2_subdev_fh *fh)
>> +{
>> +    struct v4l2_subdev_format format = {
>> +        .pad = MSM_TPG_PAD_SINK,
>> +        .which = fh ? V4L2_SUBDEV_FORMAT_TRY :
>> +                  V4L2_SUBDEV_FORMAT_ACTIVE,
>> +        .format = {
>> +            .code = MEDIA_BUS_FMT_SBGGR8_1X8,
>> +            .width = 1920,
>> +            .height = 1080
>> +        }
>> +    };
>> +
>> +    return tpg_set_format(sd, fh ? fh->state : NULL, &format);
>> +}
>> +
>> +/*
>> + * tpg_set_test_pattern - Set test generator's pattern mode
>> + * @tpg: TPG device
>> + * @value: desired test pattern mode
>> + *
>> + * Return 0 on success or a negative error code otherwise
>> + */
>> +static int tpg_set_test_pattern(struct tpg_device *tpg, s32 value)
>> +{
>> +    return tpg->res->hw_ops->configure_testgen_pattern(tpg, value);
>> +}
>> +
>> +/*
>> + * tpg_s_ctrl - Handle set control subdev method
>> + * @ctrl: pointer to v4l2 control structure
>> + *
>> + * Return 0 on success or a negative error code otherwise
>> + */
>> +static int tpg_s_ctrl(struct v4l2_ctrl *ctrl)
>> +{
>> +    struct tpg_device *tpg = container_of(ctrl->handler,
>> +                          struct tpg_device, ctrls);
>> +    int ret = -EINVAL;
>> +
>> +    switch (ctrl->id) {
>> +    case V4L2_CID_TEST_PATTERN:
>> +        ret = tpg_set_test_pattern(tpg, ctrl->val);
>> +        break;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static const struct v4l2_ctrl_ops tpg_ctrl_ops = {
>> +    .s_ctrl = tpg_s_ctrl,
>> +};
>> +
>> +/*
>> + * msm_tpg_subdev_init - Initialize tpg device structure and resources
>> + * @tpg: tpg device
> 
> And no 'camss' argument. The whole function description comment is quite
> useless, it can be just removed with no losses.
> 
ACK. will remove it all.>> + * @res: tpg module resources table
>> + * @id: tpg module id
>> + *
>> + * Return 0 on success or a negative error code otherwise
>> + */
>> +int msm_tpg_subdev_init(struct camss *camss,
>> +            struct tpg_device *tpg,
>> +            const struct camss_subdev_resources *res, u8 id)
>> +{
>> +    struct platform_device *pdev;
>> +    struct device *dev;
>> +    int i, j;
>> +
>> +    dev  = camss->dev;
>> +    pdev = to_platform_device(dev);
>> +
>> +    tpg->camss = camss;
>> +    tpg->id = id;
>> +    tpg->res = &res->tpg;
>> +    tpg->res->hw_ops->subdev_init(tpg);
>> +
>> +    tpg->base = devm_platform_ioremap_resource_byname(pdev, res- 
>> >reg[0]);
>> +    if (IS_ERR(tpg->base))
>> +        return PTR_ERR(tpg->base);
>> +
>> +    tpg->nclocks = 0;
>> +    while (res->clock[tpg->nclocks])
>> +        tpg->nclocks++;
>> +
>> +    if (tpg->nclocks) {
> 
> if (!tpg->nclocks)
>      return 0;
> 
ACK.>> +        tpg->clock = devm_kcalloc(dev,
>> +                      tpg->nclocks, sizeof(*tpg->clock),
>> +                      GFP_KERNEL);
>> +        if (!tpg->clock)
>> +            return -ENOMEM;
>> +
>> +        for (i = 0; i < tpg->nclocks; i++) {
>> +            struct camss_clock *clock = &tpg->clock[i];
>> +
>> +            clock->clk = devm_clk_get(dev, res->clock[i]);
>> +            if (IS_ERR(clock->clk))
>> +                return PTR_ERR(clock->clk);
>> +
>> +            clock->name = res->clock[i];
>> +
>> +            clock->nfreqs = 0;
>> +            while (res->clock_rate[i][clock->nfreqs])
>> +                clock->nfreqs++;
>> +
>> +            if (!clock->nfreqs) {
>> +                clock->freq = NULL;
>> +                continue;
>> +            }
>> +
>> +            clock->freq = devm_kcalloc(dev,
>> +                           clock->nfreqs,
>> +                           sizeof(*clock->freq),
>> +                           GFP_KERNEL);
>> +            if (!clock->freq)
>> +                return -ENOMEM;
>> +
>> +            for (j = 0; j < clock->nfreqs; j++)
>> +                clock->freq[j] = res->clock_rate[i][j];
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +/*
>> + * tpg_link_setup - Setup tpg connections
>> + * @entity: Pointer to media entity structure
>> + * @local: Pointer to local pad
>> + * @remote: Pointer to remote pad
>> + * @flags: Link flags
>> + *
>> + * Return 0 on success
>> + */
>> +static int tpg_link_setup(struct media_entity *entity,
>> +              const struct media_pad *local,
>> +              const struct media_pad *remote, u32 flags)
>> +{
>> +    if (flags & MEDIA_LNK_FL_ENABLED)
>> +        if (media_pad_remote_pad_first(local))
>> +            return -EBUSY;
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct v4l2_subdev_core_ops tpg_core_ops = {
>> +    .s_power = tpg_set_power,
>> +};
>> +
>> +static const struct v4l2_subdev_video_ops tpg_video_ops = {
>> +    .s_stream = tpg_set_stream,
>> +};
>> +
>> +static const struct v4l2_subdev_pad_ops tpg_pad_ops = {
>> +    .enum_mbus_code = tpg_enum_mbus_code,
>> +    .enum_frame_size = tpg_enum_frame_size,
>> +    .get_fmt = tpg_get_format,
>> +    .set_fmt = tpg_set_format,
>> +};
>> +
>> +static const struct v4l2_subdev_ops tpg_v4l2_ops = {
>> +    .core = &tpg_core_ops,
>> +    .video = &tpg_video_ops,
>> +    .pad = &tpg_pad_ops,
>> +};
>> +
>> +static const struct v4l2_subdev_internal_ops tpg_v4l2_internal_ops = {
>> +    .open = tpg_init_formats,
>> +};
>> +
>> +static const struct media_entity_operations tpg_media_ops = {
>> +    .link_setup = tpg_link_setup,
>> +    .link_validate = v4l2_subdev_link_validate,
>> +};
>> +
>> +/*
>> + * msm_tpg_register_entity - Register subdev node for tpg module
>> + * @tpg: tpg device
>> + * @v4l2_dev: V4L2 device
>> + *
>> + * Return 0 on success or a negative error code otherwise
>> + */
>> +int msm_tpg_register_entity(struct tpg_device *tpg,
>> +                struct v4l2_device *v4l2_dev)
>> +{
>> +    struct v4l2_subdev *sd = &tpg->subdev;
>> +    struct media_pad *pads = tpg->pads;
>> +    struct device *dev = tpg->camss->dev;
>> +    int ret;
>> +
>> +    v4l2_subdev_init(sd, &tpg_v4l2_ops);
>> +    sd->internal_ops = &tpg_v4l2_internal_ops;
>> +    sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
>> +             V4L2_SUBDEV_FL_HAS_EVENTS;
>> +    snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d",
>> +         MSM_TPG_NAME, tpg->id);
>> +    sd->grp_id = TPG_GUP_ID;
>> +    v4l2_set_subdevdata(sd, tpg);
>> +
>> +    ret = v4l2_ctrl_handler_init(&tpg->ctrls, 1);
>> +    if (ret < 0) {
>> +        dev_err(dev, "Failed to init ctrl handler: %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    tpg->testgen_mode = v4l2_ctrl_new_std_menu_items(&tpg->ctrls,
>> +                             &tpg_ctrl_ops, V4L2_CID_TEST_PATTERN,
>> +                             tpg->testgen.nmodes, 0, 0,
>> +                             tpg->testgen.modes);
>> +
> 
> Please remove a blank line above.
> 
ACK.>> +    if (tpg->ctrls.error) {
>> +        dev_err(dev, "Failed to init ctrl: %d\n", tpg->ctrls.error);
>> +        ret = tpg->ctrls.error;
>> +        goto free_ctrl;
>> +    }
>> +
>> +    tpg->subdev.ctrl_handler = &tpg->ctrls;
>> +
>> +    ret = tpg_init_formats(sd, NULL);
>> +    if (ret < 0) {
>> +        dev_err(dev, "Failed to init format: %d\n", ret);
>> +        goto free_ctrl;
>> +    }
>> +
>> +    pads[MSM_TPG_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
>> +    pads[MSM_TPG_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
> 
> Why do you need two pads for TPG?
> 
will fix it next version.

>> +
>> +    sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
> 
> TPG is not a video pixel encoding converter device.
> 

How about MEDIA_ENT_F_CAM_SENSOR?


>> +    sd->entity.ops = &tpg_media_ops;
>> +    ret = media_entity_pads_init(&sd->entity, MSM_TPG_PADS_NUM, pads);
>> +    if (ret < 0) {
>> +        dev_err(dev, "Failed to init media entity: %d\n", ret);
>> +        goto free_ctrl;
>> +    }
>> +
>> +    ret = v4l2_device_register_subdev(v4l2_dev, sd);
>> +    if (ret < 0) {
>> +        dev_err(dev, "Failed to register subdev: %d\n", ret);
>> +        media_entity_cleanup(&sd->entity);
>> +        goto free_ctrl;
>> +    }
>> +
>> +    return 0;
>> +
>> +free_ctrl:
>> +    v4l2_ctrl_handler_free(&tpg->ctrls);
>> +
>> +    return ret;
>> +}
>> +
>> +/*
>> + * msm_tpg_unregister_entity - Unregister tpg module subdev node
>> + * @tpg: tpg device
>> + */
>> +void msm_tpg_unregister_entity(struct tpg_device *tpg)
>> +{
>> +    v4l2_device_unregister_subdev(&tpg->subdev);
>> +    media_entity_cleanup(&tpg->subdev.entity);
>> +    v4l2_ctrl_handler_free(&tpg->ctrls);
>> +}
>> diff --git a/drivers/media/platform/qcom/camss/camss-tpg.h b/drivers/ 
>> media/platform/qcom/camss/camss-tpg.h
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..1a16addac19418f2f11d0b8abb1c865c99888bde
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/camss/camss-tpg.h
>> @@ -0,0 +1,127 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * camss-tpg.h
>> + *
>> + * Qualcomm MSM Camera Subsystem - TPG Module
>> + *
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + */
>> +#ifndef QC_MSM_CAMSS_TPG_H
>> +#define QC_MSM_CAMSS_TPG_H
>> +
>> +#include <linux/clk.h>
>> +#include <media/media-entity.h>
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-mediabus.h>
>> +#include <media/v4l2-subdev.h>
>> +
>> +#define MSM_TPG_PAD_SINK 0
>> +#define MSM_TPG_PAD_SRC 1
>> +#define MSM_TPG_PADS_NUM 2
>> +
>> +#define DATA_TYPE_RAW_8BIT        0x2a
>> +#define DATA_TYPE_RAW_10BIT        0x2b
>> +#define DATA_TYPE_RAW_12BIT        0x2c
> 
> Remove all above to get the macro values from include/media/mipi-csi2.h
> 
ACK.>> +
>> +#define ENCODE_FORMAT_UNCOMPRESSED_8_BIT    0x1
>> +#define ENCODE_FORMAT_UNCOMPRESSED_10_BIT    0x2
>> +#define ENCODE_FORMAT_UNCOMPRESSED_12_BIT    0x3
>> +#define ENCODE_FORMAT_UNCOMPRESSED_14_BIT    0x4
>> +#define ENCODE_FORMAT_UNCOMPRESSED_16_BIT    0x5
>> +#define ENCODE_FORMAT_UNCOMPRESSED_20_BIT    0x6
>> +#define ENCODE_FORMAT_UNCOMPRESSED_24_BIT    0x7
>> +
>> +#define TPG_GUP_ID 0
>> +#define MSM_TPG_NAME "msm_tpg"
> 
> Remove the macro, it's used only once in the code and more usecases are
> not expected happen.
> 
ACK.>> +
>> +enum tpg_testgen_mode {
>> +    TPG_PAYLOAD_MODE_DISABLED = 0,
>> +    TPG_PAYLOAD_MODE_INCREMENTING = 1,
>> +    TPG_PAYLOAD_MODE_ALTERNATING_55_AA = 2,
>> +    TPG_PAYLOAD_MODE_RANDOM = 5,
>> +    TPG_PAYLOAD_MODE_USER_SPECIFIED = 6,
>> +    TPG_PAYLOAD_MODE_COLOR_BARS = 9,
>> +    TPG_PAYLOAD_MODE_NUM_SUPPORTED_GEN1 = 9,
>> +};
>> +
>> +struct tpg_testgen_config {
>> +    enum tpg_testgen_mode mode;
>> +    const char * const*modes;
>> +    u8 nmodes;
>> +};
>> +
>> +struct tpg_format_info {
>> +    u32 code;
>> +    u8 data_type;
>> +    u8 encode_format;
>> +    u8 bpp;
>> +};
>> +
>> +struct tpg_formats {
>> +    unsigned int nformats;
>> +    const struct tpg_format_info *formats;
>> +};
>> +
>> +struct tpg_device;
>> +
>> +struct tpg_hw_ops {
>> +    int (*configure_stream)(struct tpg_device *tpg, u8 enable);
>> +
>> +    int (*configure_testgen_pattern)(struct tpg_device *tpg, s32 val);
>> +
>> +    u32 (*hw_version)(struct tpg_device *tpg);
>> +
>> +    int (*reset)(struct tpg_device *tpg);
>> +
>> +    void (*subdev_init)(struct tpg_device *tpg);
>> +};
>> +
>> +struct tpg_subdev_resources {
>> +    u8 lane_cnt;
>> +    u8 vc_cnt;
>> +    const struct tpg_formats *formats;
>> +    const struct tpg_hw_ops *hw_ops;
>> +};
>> +
>> +struct tpg_device {
>> +    struct camss *camss;
>> +    u8 id;
>> +    struct v4l2_subdev subdev;
>> +    struct media_pad pads[MSM_TPG_PADS_NUM];
>> +    void __iomem *base;
>> +    struct camss_clock *clock;
>> +    int nclocks;
>> +    struct tpg_testgen_config testgen;
>> +    struct v4l2_mbus_framefmt fmt[MSM_TPG_PADS_NUM];
>> +    struct v4l2_ctrl_handler ctrls;
>> +    struct v4l2_ctrl *testgen_mode;
>> +    const struct tpg_subdev_resources *res;
>> +    const struct tpg_format *formats;
>> +    unsigned int nformats;
>> +    u32 hw_version;
>> +};
>> +
>> +struct camss_subdev_resources;
>> +
>> +const struct tpg_format_info *tpg_get_fmt_entry(struct tpg_device *tpg,
>> +                        const struct tpg_format_info *formats,
>> +                        unsigned int nformats,
>> +                        u32 code);
>> +
>> +int msm_tpg_subdev_init(struct camss *camss,
>> +            struct tpg_device *tpg,
>> +            const struct camss_subdev_resources *res, u8 id);
>> +
>> +int msm_tpg_register_entity(struct tpg_device *tpg,
>> +                struct v4l2_device *v4l2_dev);
>> +
>> +void msm_tpg_unregister_entity(struct tpg_device *tpg);
>> +
>> +extern const char * const testgen_payload_modes[];
>> +
>> +extern const struct tpg_formats tpg_formats_gen1;
>> +
>> +extern const struct tpg_hw_ops tpg_ops_gen1;
>> +
>> +#endif /* QC_MSM_CAMSS_TPG_H */
>> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/ 
>> media/platform/qcom/camss/camss.h
>> index 
>> 9d9a62640e25dce0e8d45af9df01bbfd64b9bb4b..a892a87bed8bde8919200d6eac2b7a5338763c0e 100644
>> --- a/drivers/media/platform/qcom/camss/camss.h
>> +++ b/drivers/media/platform/qcom/camss/camss.h
>> @@ -21,6 +21,7 @@
>>   #include "camss-csid.h"
>>   #include "camss-csiphy.h"
>>   #include "camss-ispif.h"
>> +#include "camss-tpg.h"
>>   #include "camss-vfe.h"
>>   #include "camss-format.h"
>> @@ -52,6 +53,7 @@ struct camss_subdev_resources {
>>       char *interrupt[CAMSS_RES_MAX];
>>       union {
>>           struct csiphy_subdev_resources csiphy;
>> +        struct tpg_subdev_resources tpg;
>>           struct csid_subdev_resources csid;
>>           struct vfe_subdev_resources vfe;
>>       };
>> @@ -104,6 +106,7 @@ struct camss_resources {
>>       enum camss_version version;
>>       const char *pd_name;
>>       const struct camss_subdev_resources *csiphy_res;
>> +    const struct camss_subdev_resources *tpg_res;
>>       const struct camss_subdev_resources *csid_res;
>>       const struct camss_subdev_resources *ispif_res;
>>       const struct camss_subdev_resources *vfe_res;
>> @@ -111,6 +114,7 @@ struct camss_resources {
>>       const struct resources_icc *icc_res;
>>       const unsigned int icc_path_num;
>>       const unsigned int csiphy_num;
>> +    const unsigned int tpg_num;
>>       const unsigned int csid_num;
>>       const unsigned int vfe_num;
>>   };
>> @@ -121,6 +125,7 @@ struct camss {
>>       struct media_device media_dev;
>>       struct device *dev;
>>       struct csiphy_device *csiphy;
>> +    struct tpg_device *tpg;
>>       struct csid_device *csid;
>>       struct ispif_device *ispif;
>>       struct vfe_device *vfe;
>>
> 

Best regards,
Wenmeng


