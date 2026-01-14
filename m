Return-Path: <linux-media+bounces-50693-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BADD1EB19
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 13:18:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 65DFC3017863
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 12:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03BD3396D39;
	Wed, 14 Jan 2026 12:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NBEgdzq+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KUgf5hOY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C058E396D1E
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 12:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768393100; cv=none; b=q3N5c11qOjMVxPcE3vzqpyYsm7gvVZdA6kBQuef3qiiDhqc21ifQk/NtI/NLyCDlLKli+a8++LLSTCzBVnI8FgaBMS2qNHGyR3hXy7gIv6TFkR2RU7oxqiSFXP0/dMPZBV4EwpFv4VFElF2XXMXVPqqGIifEtr9nTXP1ThhWDBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768393100; c=relaxed/simple;
	bh=2zRfs4yWtRB2FQdCxWrQw5e5E4Vy4baLQWMjLlVJBZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d5krjMlzutPEMuKG1nLcHuZn/8DuKaYs0l0xvF3C3Z/FqmrYTKRCbFV7AvO0UV5C7NZXl2eJ/5jZ+bXOMhHOZy/70aXbM7SEzgOcXh6n6ilMDhnrUjnapFHhfYp6cAeAixINtabBxOkRV2QB8a66Pb538YukLhGp59nGbWXu4Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NBEgdzq+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KUgf5hOY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E7jGId147871
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 12:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3GPCy4F6bx6FxUJajVS59UpWlfJyIChb0QiEPQLPPDI=; b=NBEgdzq+/vfcHUDB
	LT+Y7lKIlRVjd8E7p+GG97Bvxvqd2HX/nutSu7XMnV+HiBxKDd3jxpfQOLrlb53M
	5S7FnDOIcuKGNRuRVF3zSeCp+GpKSbN+jATVQJzkW51Bxw+dylrwffR74RatexDC
	BtTpN6VCIiIkGGDd9pzHFoetOM++ToQdiRbssml3ZcIuMIxOA914UgOaqQApDxh0
	ZMTEO6YG6gJS9hntkw6i+GRS6AQxChmYNOpEQCEmWr9t9zTQw3wUdacAx2Q0kK/+
	skjXX3MkcCzQQDQSCshoe+1X91y0Q6MW5g1klkUoAFiBZ7XbAZThG1M8tgIetB4Q
	pmsXfg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp6rah1g5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 12:18:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c5296c7e57so478632285a.1
        for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 04:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768393096; x=1768997896; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3GPCy4F6bx6FxUJajVS59UpWlfJyIChb0QiEPQLPPDI=;
        b=KUgf5hOYfsc5F9p21Uzx3wJzRaYRCtp9/k8mefAWRisld6cgcADJhcCzM3U1jEODM4
         MDJo5e6H7tb1/EeoerVkF1vqafyzENHcjApfVIQ5xuFRxYP0wTH2wrZOQ6ytM2HuDaqR
         pq8WJVHHml+wfVsgMNk1fmvS4/BMaR2XgJFrODHu5GZI8CUpYxLT3BzzqCZeiUsdEeLA
         saSEZoXySykJ1RH9Z4F4+IJ/sLiXhZu0a8MPLQQfFRwdjXnC5g5a7eomwB+ciQyB6kZ9
         7r16du0vwApMziDf/2NnpfMUyhKBglyFUAc9KtavbFRLLtXcnXFzlCbR3DJ39CCDYayK
         TkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768393096; x=1768997896;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3GPCy4F6bx6FxUJajVS59UpWlfJyIChb0QiEPQLPPDI=;
        b=LBy+ha3w8m/LYwwTopAFSB6t05AQ0O5ZuHNLZ00xc5R4nIpkl8GdVl9xmhweF1esN8
         iO1sMpji5LQRN3EvsOdYie5ZIVHwkGe5HHq+mDLgurXcLQxnFQg4nkpmizmG+65WLFJ5
         v/Q/z/O132K3/d8bIhG+lywrIf2ovLR2psG5q5lZV3Kqm2trsiLsjMEEC79l8Adwfr17
         /RTQQ4kveYzughZRl6KrYms3hOCrjpdtCG0Oo5vCprKbisUp4TqRlQv8xjaQA4p2Ruzr
         Tko1rrh0Cp1nWoH8j13vo/npGwbbalv1Jxu8aWJPNgmtg27HHuivU7zfRRCRO+ohZdpp
         ggxA==
X-Forwarded-Encrypted: i=1; AJvYcCUzjFLX3+2knKLOQvvlcyEiyrwDOMlX79FyLr2fiWgaZUIAnxPMPVkgnWHt3KLBKdGIlMVdhCnz5mMjkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOJ9frdKXyrTkTrjATP+YlfUbZ+62dCglorPhFnb7mX5i+K2jf
	Cpm6WaWVWvtZ8WdlF8vROqkI6OMhD5eUcj2zHjT9zi6sW2f1O9N8jzu5QAEwxI6JcmJbI8MqTSD
	7sc3lEUvGgW8VnUEsDrWAErYFPBx6UWXnI828Nzp0xqIucRFffwidl57zfwZ1Nzij+Q==
X-Gm-Gg: AY/fxX5c5Z5FphEI+EVJUXV3E3vrzQhIUyG7MYowb5ZtLLMM3aLx6ARF8RCEGeYzL93
	HiGZ6RVn701buJvGkM27IdwK9CwiH1EPi1je84vJ6UQJ7JPmJgyXy7hXdZYvTPf+iE5W9gEhV1q
	hxj1rv74oPPEb/OLgrjk8XUSUjo4Jp4GBfSbM/FQfHkWi5NUIhZ0IcgIIXag+QSbZ9OCqtbv+VT
	xEhgnUGGKaGW1UDQENRX0cnVG2Uac9G83JSNYxHp2oROPWiZvngGxwacTWQrtxbfim5ED53oKqe
	qOCr5CX5Wb6qPpVhRwkoSgnXB3MCe8m9kDFkK+47CP7phFdXQzIEF4FL6iSEK2/ygwTl4qA8x55
	u62iVUeiN5iALT9CRYxwjFPqX8MCkQqPJ7C+2HW73u7EU1u18qLgZLfhKa9Kuz0VkhROwi09nyA
	==
X-Received: by 2002:a05:620a:d95:b0:8ba:41b2:da01 with SMTP id af79cd13be357-8c52fbbfbbbmr336351285a.71.1768393095241;
        Wed, 14 Jan 2026 04:18:15 -0800 (PST)
X-Received: by 2002:a05:620a:d95:b0:8ba:41b2:da01 with SMTP id af79cd13be357-8c52fbbfbbbmr336344085a.71.1768393094365;
        Wed, 14 Jan 2026 04:18:14 -0800 (PST)
Received: from [10.111.171.115] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530a6c678sm161492885a.9.2026.01.14.04.18.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 04:18:13 -0800 (PST)
Message-ID: <a70f69e6-6ee6-4a96-88fc-c0ec4db48697@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 20:18:08 +0800
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
 <98a26638-675b-4654-a940-898ba9e1af9c@oss.qualcomm.com>
 <e1907273-3d14-41ee-9a22-a963f2b83d20@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <e1907273-3d14-41ee-9a22-a963f2b83d20@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEwMSBTYWx0ZWRfX3Nse0dBaQX1p
 e/IeiHJmuVpHd7CGHTNiRf7BCI8qZsGjB5P/dnoFk0TpnpLqnic9KtuIHIXbQzhZW8FtgCuvTYN
 w37tILZtRP5ZYAcjrHgKFdl4fBYkequlIwOAc6YirDZeCQmMikALh2SMUpnZlwmkiwj7TIh9Fto
 +1/xtaXHOjCun3kDCfGmfpJhbYBycGD5Ms/J8vJrJSr7Y5EJbuZDhO3sUZusDskuqJO2BChUhNQ
 QtA/+1ELfklIsMKhDIkRtw59urVv4BdLGdWbEkfsh1VhsAnuv7Aa9r+lutaGb5RLtRag4BGrivA
 wB1n1Y+/o5KiPvwiWNswa6Ks3fvi3KUbKK/7m+5RgjCiotXcEVQnrCOu9Edjq4kKVZK5hqZ2Sma
 tT/Ej1hP9iX0BR9MFtjngf729X/McmsJGtdVC2iCFyotkMM5z4GliQcBSP8Mbdb9Siw4YFPS9Md
 EfXchoVpI0UsX9fo8aw==
X-Proofpoint-GUID: Hg9hkLkDj0FO394OrHGKiE27JnSoFzO4
X-Proofpoint-ORIG-GUID: Hg9hkLkDj0FO394OrHGKiE27JnSoFzO4
X-Authority-Analysis: v=2.4 cv=L/EQguT8 c=1 sm=1 tr=0 ts=69678988 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=5dRrolKJAAAA:8 a=EUspDBNiAAAA:8
 a=Q0BQb3hy6yFQgCu-0S4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=y3-2bcJ53AEkEa81XYCb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140101


Hi Vladimir,


On 1/14/2026 1:05 PM, Vladimir Zapolskiy wrote:
> Hi Wenmeng.
> 
> On 1/14/26 05:04, Wenmeng Liu wrote:
>> Hi Vladimir,
>>
>> On 1/14/2026 12:27 AM, Vladimir Zapolskiy wrote:
>>> Hello Wenmeng.
>>>
>>> On 1/13/26 11:03, Wenmeng Liu wrote:
>>>> Introduce a new common Test Pattern Generator (TPG) implementation for
>>>> Qualcomm CAMSS. This module provides a generic interface for pattern
>>>> generation that can be reused by multiple platforms.
>>>>
>>>> Unlike CSID-integrated TPG, this TPG acts as a standalone block
>>>> that emulates both CSIPHY and sensor behavior, enabling flexible test
>>>> patterns without external hardware.
>>>>
>>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>>> ---
>>>>    drivers/media/platform/qcom/camss/Makefile    |   1 +
>>>>    drivers/media/platform/qcom/camss/camss-tpg.c | 710 ++++++++++++++++
>>>> ++++++++++
>>>>    drivers/media/platform/qcom/camss/camss-tpg.h | 127 +++++
>>>>    drivers/media/platform/qcom/camss/camss.h     |   5 +
>>>>    4 files changed, 843 insertions(+)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/
>>>> media/platform/qcom/camss/Makefile
>>>> index
>>>> 5e349b4915130c71dbff90e73102e46dfede1520..d355e67c25700ac061b878543c32ed8defc03ad0 100644
>>>> --- a/drivers/media/platform/qcom/camss/Makefile
>>>> +++ b/drivers/media/platform/qcom/camss/Makefile
>>>> @@ -27,5 +27,6 @@ qcom-camss-objs += \
>>>>            camss-vfe.o \
>>>>            camss-video.o \
>>>>            camss-format.o \
>>>> +        camss-tpg.o \
>>>
>>> While you're here, please sort and keep the lines in alphabetical order.
>> ACK.
>>
>>>
>>>>    obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
>>>> diff --git a/drivers/media/platform/qcom/camss/camss-tpg.c b/drivers/
>>>> media/platform/qcom/camss/camss-tpg.c
>>>> new file mode 100644
>>>> index
>>>> 0000000000000000000000000000000000000000..f4c015aafa202e5b64fafa3c543128fda6440b11
>>>> --- /dev/null
>>>> +++ b/drivers/media/platform/qcom/camss/camss-tpg.c
>>>> @@ -0,0 +1,710 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + *
>>>> + * Qualcomm MSM Camera Subsystem - TPG Module
>>>> + *
>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>> + */
>>>> +#include <linux/clk.h>
>>>> +#include <linux/delay.h>
>>>> +#include <linux/io.h>
>>>> +#include <linux/kernel.h>
>>>> +#include <linux/of.h>
>>>> +#include <linux/platform_device.h>
>>>> +#include <linux/pm_runtime.h>
>>>> +#include <media/media-entity.h>
>>>> +#include <media/v4l2-device.h>
>>>> +#include <media/v4l2-subdev.h>
>>>> +
>>>> +#include "camss-tpg.h"
>>>> +#include "camss.h"
>>>> +
>>>> +const char * const testgen_payload_modes[] = {
>>>> +    "Disabled",
>>>> +    "Incrementing",
>>>> +    "Alternating 0x55/0xAA",
>>>> +    "Reserved",
>>>> +    "Reserved",
>>>> +    "Pseudo-random Data",
>>>> +    "User Specified",
>>>> +    "Reserved",
>>>> +    "Reserved",
>>>> +    "Color bars",
>>>> +    "Reserved"
>>>
>>> It makes little sense to mention the unsupported values, and then
>>> introduce enum tpg_testgen_mode to list the supported ones.
>>>
>> This is for ctrl menu, will do as follow:
>> static const char * const testgen_payload_modes[] = {
>>       [TPG_PAYLOAD_MODE_DISABLED]          = "Disabled",
>>       [TPG_PAYLOAD_MODE_INCREMENTING]      = "Incrementing",
>>       [TPG_PAYLOAD_MODE_ALTERNATING_55_AA]       = "Alternating 
>> 0x55/0xAA",
>>       [TPG_PAYLOAD_MODE_RANDOM]      = "Pseudo-random Data",
>>       [TPG_PAYLOAD_MODE_USER_SPECIFIED]    = "User Specified",
>>       [TPG_PAYLOAD_MODE_COLOR_BARS]        = "Color bars",
>> };
>>
> 
> This is also not perfect, still userspace is misinformed about a number
> of possible TPG modes vs. a number of actually supported TPG modes.
> 
0x0: INCREMENTING
0x1: ALTERNATING_55_AA
0x4: RANDOM
0x5: USER_SPECIFIED
0x8: COLOR_BARS

These values come from the register configuration, these pattern values 
are consistent with the CSID TPG.
If want to make it continuous, need to add a mapping table. How about this?

>>>> +};
>>>
>>> Are these test pattern modes specific to TPG Gen1 only?
>>>
>>> CSID TPG uses a different 'csid_testgen_modes' list, and if the list
>>> above is
>>> TPG Gen1 specific, it would make sense to place it right in camss-tpg-
>>> gen1.c
>>>
>>
>> Like other CAMSS nodes, the files placed in the core are meant to
>> maintain consistency with the others.
> 
> Please elaborate, what does it mean "files placed in the core"?
> 
sorry, let me clarify this,
core file: camss-cisd.c camss-csiphy.c ...
hw version file: camss-csid-gen2.c camss-tpg-gen1.c
  > If technically possible, all local data shall be placed closer to 
the code,
> which uses it, and here the exported data is exported for nothing, but
> some "consistency".
> 
> You draw a line what data to place into the generic camss-tpg.c and to the
> specific camss-tpg-gen1.c, you should explain why data specific to TPG Gen1
> is placed into the generic code, while you've already set a different and
> dedicated place/file for storing this type of data?
> 
The reason I want to implement it this way is that the TPG's ctrl 
requires this structure for initialization (msm_tpg_register_entity).

Also it`s ok to push it to gen1 file.

>>>> +
>>>> +static const struct tpg_format_info formats_gen1[] = {
>>>> +    {
>>>> +        MEDIA_BUS_FMT_SBGGR8_1X8,
>>>> +        DATA_TYPE_RAW_8BIT,
>>>
>>> Please replace it with MIPI_CSI2_DT_RAW8
>>>
>>
>> ACK.>> +        ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
>>>> +        8,
>>>> +    },
>>>> +    {
>>>> +        MEDIA_BUS_FMT_SGBRG8_1X8,
>>>> +        DATA_TYPE_RAW_8BIT,
>>>> +        ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
>>>> +        8,
>>>> +    },
>>>> +    {
>>>> +        MEDIA_BUS_FMT_SGRBG8_1X8,
>>>> +        DATA_TYPE_RAW_8BIT,
>>>> +        ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
>>>> +        8,
>>>> +    },
>>>> +    {
>>>> +        MEDIA_BUS_FMT_SRGGB8_1X8,
>>>> +        DATA_TYPE_RAW_8BIT,
>>>> +        ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
>>>> +        8,
>>>> +    },
>>>> +    {
>>>> +        MEDIA_BUS_FMT_SBGGR10_1X10,
>>>> +        DATA_TYPE_RAW_10BIT,
>>>
>>> MIPI_CSI2_DT_RAW10>
>>
>> ACK.>> +        ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
>>>> +        10,
>>>> +    },
>>>> +    {
>>>> +        MEDIA_BUS_FMT_SGBRG10_1X10,
>>>> +        DATA_TYPE_RAW_10BIT,
>>>> +        ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
>>>> +        10,
>>>> +    },
>>>> +    {
>>>> +        MEDIA_BUS_FMT_SGRBG10_1X10,
>>>> +        DATA_TYPE_RAW_10BIT,
>>>> +        ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
>>>> +        10,
>>>> +    },
>>>> +    {
>>>> +        MEDIA_BUS_FMT_SRGGB10_1X10,
>>>> +        DATA_TYPE_RAW_10BIT,
>>>> +        ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
>>>> +        10,
>>>> +    },
>>>> +    {
>>>> +        MEDIA_BUS_FMT_SBGGR12_1X12,
>>>> +        DATA_TYPE_RAW_12BIT,
>>>
>>> MIPI_CSI2_DT_RAW12
>>>
>>
>> ACK.>> +        ENCODE_FORMAT_UNCOMPRESSED_12_BIT,
>>>> +        12,
>>>> +    },
>>>> +    {
>>>> +        MEDIA_BUS_FMT_SGBRG12_1X12,
>>>> +        DATA_TYPE_RAW_12BIT,
>>>> +        ENCODE_FORMAT_UNCOMPRESSED_12_BIT,
>>>> +        12,
>>>> +    },
>>>> +    {
>>>> +        MEDIA_BUS_FMT_SGRBG12_1X12,
>>>> +        DATA_TYPE_RAW_12BIT,
>>>> +        ENCODE_FORMAT_UNCOMPRESSED_12_BIT,
>>>> +        12,
>>>> +    },
>>>> +    {
>>>> +        MEDIA_BUS_FMT_SRGGB12_1X12,
>>>> +        DATA_TYPE_RAW_12BIT,
>>>> +        ENCODE_FORMAT_UNCOMPRESSED_12_BIT,
>>>> +        12,
>>>> +    },
>>>> +    {
>>>> +        MEDIA_BUS_FMT_Y8_1X8,
>>>> +        DATA_TYPE_RAW_8BIT,
>>>> +        ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
>>>> +        8,
>>>> +    },
>>>> +    {
>>>> +        MEDIA_BUS_FMT_Y10_1X10,
>>>> +        DATA_TYPE_RAW_10BIT,
>>>> +        ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
>>>> +        10,
>>>> +    },
>>>> +};
>>>> +
>>>> +const struct tpg_formats tpg_formats_gen1 = {
>>>> +    .nformats = ARRAY_SIZE(formats_gen1),
>>>> +    .formats = formats_gen1
>>>> +};
>>>> +
>>>> +const struct tpg_format_info *tpg_get_fmt_entry(struct tpg_device 
>>>> *tpg,
>>>> +                        const struct tpg_format_info *formats,
>>>> +                        unsigned int nformats,
>>>> +                        u32 code)
>>>> +{
>>>> +    struct device *dev = tpg->camss->dev;
>>>> +    size_t i;
>>>
>>> unsigned int i, size_t is very unexpected to get here.
>>>
>>
>> I have received comments on this.
>>
>> https://lore.kernel.org/all/449ac3c3-1f6a-4e69-899d- 
>> c4e4577714a4@oss.qualcomm.com/
>>
>> https://staticthinking.wordpress.com/2022/06/01/unsigned-int-i-is- 
>> stupid/>>
>> +
> 
> I see, in every programming language without type inference, including 
> C, types
> shall be as precise as possible. Here the usage of signed int or size_t 
> is stupid,
> because for a human being it adds completely wasted efforts to 
> comprehend, what
> does happen, when the local variable is negative, while it just can not 
> be such.
> 
ACK, will fix it.

>>>> +    for (i = 0; i < nformats; i++)
>>>> +        if (code == formats[i].code)
>>>> +            return &formats[i];
>>>> +
>>>> +    dev_warn(dev, "Unknown pixel format code=0x%08x\n", code);
>>>
>>> Please remove dev_warn() completely, it opens a way to flood the kernel
>>> log.
>>>
>>
>> This is an exception printout and will not appear under normal
>> circumstances.>> +
> 
> If it can be trivially triggered from the userspace, it is not an 
> exception.
> 
> I haven't yet tested the changes, what does happen, when an unsupported 
> pixel
> format is asked to be set from userspace? It's a regular operation, and it
> shall not litter the kernel log buffer.
> 
>>>> +    return ERR_PTR(-EINVAL);
> 
> This one is sufficient.
> 

ACK.>>>> +}
>>>> +
>>>> +/*
>>>> + * tpg_set_clock_rates - set clock rates on tpg module
>>>> + * @tpg: tpg device
>>>> + */
>>>> +static int tpg_set_clock_rates(struct tpg_device *tpg)
>>>> +{
>>>> +    struct device *dev = tpg->camss->dev;
>>>> +    int ret;
>>>> +    int i;
>>>> +
>>>> +    for (i = 0; i < tpg->nclocks; i++) {
>>>> +        struct camss_clock *clock = &tpg->clock[i];
>>>> +        long round_rate;
>>>> +
>>>> +        if (clock->freq) {
>>>> +            round_rate = clk_round_rate(clock->clk, clock->freq[0]);
>>>> +            if (round_rate < 0) {
>>>> +                dev_err(dev, "clk round rate failed: %ld\n",
>>>> +                    round_rate);
>>>> +                return -EINVAL;
>>>> +            }
>>>> +
>>>> +            ret = clk_set_rate(clock->clk, round_rate);
>>>> +            if (ret < 0) {
>>>> +                dev_err(dev, "clk set rate failed: %d\n", ret);
>>>> +                return ret;
>>>> +            }
>>>> +        }
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +/*
>>>> + * tpg_set_power - Power on/off tpg module
>>>> + * @sd: tpg V4L2 subdevice
>>>> + * @on: Requested power state
>>>> + *
>>>> + * Return 0 on success or a negative error code otherwise
>>>> + */
>>>> +static int tpg_set_power(struct v4l2_subdev *sd, int on)
>>>> +{
>>>> +    struct tpg_device *tpg = v4l2_get_subdevdata(sd);
>>>> +    struct device *dev = tpg->camss->dev;
>>>> +
>>>> +    if (on) {
>>>> +        int ret;
>>>> +
>>>> +        ret = pm_runtime_resume_and_get(dev);
>>>> +        if (ret < 0)
>>>> +            return ret;
>>>> +
>>>> +        ret = tpg_set_clock_rates(tpg);
>>>> +        if (ret < 0) {
>>>> +            pm_runtime_put_sync(dev);
>>>> +            return ret;
>>>> +        }
>>>> +
>>>> +        ret = camss_enable_clocks(tpg->nclocks, tpg->clock, dev);
>>>> +        if (ret < 0) {
>>>> +            pm_runtime_put_sync(dev);
>>>> +            return ret;
>>>> +        }
>>>> +
>>>> +        tpg->res->hw_ops->reset(tpg);
>>>> +
>>>> +        tpg->res->hw_ops->hw_version(tpg);
>>>> +    } else {
>>>> +        camss_disable_clocks(tpg->nclocks, tpg->clock);
>>>> +
>>>> +        pm_runtime_put_sync(dev);
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +/*
>>>> + * tpg_set_stream - Enable/disable streaming on tpg module
>>>> + * @sd: tpg V4L2 subdevice
>>>> + * @enable: Requested streaming state
>>>> + *
>>>> + * Return 0 on success or a negative error code otherwise
>>>> + */
>>>> +static int tpg_set_stream(struct v4l2_subdev *sd, int enable)
>>>> +{
>>>> +    struct tpg_device *tpg = v4l2_get_subdevdata(sd);
>>>> +    int ret = 0;
>>>> +
>>>> +    if (enable) {
>>>> +        ret = v4l2_ctrl_handler_setup(&tpg->ctrls);
>>>> +        if (ret < 0) {
>>>> +            dev_err(tpg->camss->dev,
>>>> +                "could not sync v4l2 controls: %d\n", ret);
>>>> +            return ret;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    ret = tpg->res->hw_ops->configure_stream(tpg, enable);
>>>> +
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +/*
>>>> + * __tpg_get_format - Get pointer to format structure
>>>> + * @tpg: tpg device
>>>> + * @cfg: V4L2 subdev pad configuration
>>>
>>> There is no such function argument. There are much more errors in
>>> the doxygen descriptions of functions, please remove all these
>>> doxygen comments, they do not bring anything valuable here.
>>>
>>
>>
>> ACK.
> 
> For clarity, I haven't commented all errors in the doxygen descriptions,
> because I expect that all of them will be removed.
> 

Yes, I will removed it all.

>>> + * @pad: pad from which format is requested
>>>> + * @which: TRY or ACTIVE format
>>>> + *
>>>> + * Return pointer to TRY or ACTIVE format structure
>>>> + */
>>>> +static struct v4l2_mbus_framefmt *
>>>> +__tpg_get_format(struct tpg_device *tpg,
>>>> +         struct v4l2_subdev_state *sd_state,
>>>> +         unsigned int pad,
>>>> +         enum v4l2_subdev_format_whence which)
>>>> +{
>>>> +    if (which == V4L2_SUBDEV_FORMAT_TRY)
>>>> +        return v4l2_subdev_state_get_format(sd_state,
>>>> +                            pad);
>>>> +
>>>> +    return &tpg->fmt[pad];
>>>> +}
>>>> +
>>>> +/*
>>>> + * tpg_try_format - Handle try format by pad subdev method
>>>> + * @tpg: tpg device
>>>> + * @cfg: V4L2 subdev pad configuration
>>>
>>> No such argument.
>>>
>>
>> ACK.>> + * @pad: pad on which format is requested
>>>> + * @fmt: pointer to v4l2 format structure
>>>> + * @which: wanted subdev format
>>>> + */
>>>> +static void tpg_try_format(struct tpg_device *tpg,
>>>> +               struct v4l2_subdev_state *sd_state,
>>>> +               unsigned int pad,
>>>> +               struct v4l2_mbus_framefmt *fmt,
>>>> +               enum v4l2_subdev_format_whence which)
>>>> +{
>>>> +    unsigned int i;
>>>> +
>>>> +    switch (pad) {
>>>> +    case MSM_TPG_PAD_SINK:
>>>> +        for (i = 0; i < tpg->res->formats->nformats; i++)
>>>> +            if (tpg->res->formats->formats[i].code == fmt->code)
>>>> +                break;
>>>> +
>>>> +        /* If not found, use SBGGR8 as default */
>>>> +        if (i >= tpg->res->formats->nformats)
>>>> +            fmt->code = MEDIA_BUS_FMT_SBGGR8_1X8;
>>>> +
>>>> +        fmt->width = clamp_t(u32, fmt->width, 1, 8191);
>>>> +        fmt->height = clamp_t(u32, fmt->height, 1, 8191);
>>>> +
>>>> +        fmt->field = V4L2_FIELD_NONE;
>>>> +        fmt->colorspace = V4L2_COLORSPACE_SRGB;
>>>> +
>>>> +        break;
>>>> +    case MSM_TPG_PAD_SRC:
>>>> +        *fmt = *__tpg_get_format(tpg, sd_state,
>>>> +                     MSM_TPG_PAD_SINK,
>>>> +                     which);
>>>> +
>>>> +        break;
>>>> +    }
>>>> +}
>>>> +
>>>> +/*
>>>> + * tpg_enum_mbus_code - Handle format enumeration
>>>> + * @sd: tpg V4L2 subdevice
>>>> + * @cfg: V4L2 subdev pad configuration
>>>
>>> No such argument.
>>>
>>
>> ACK.>> + * @code: pointer to v4l2_subdev_mbus_code_enum structure
>>>> + * return -EINVAL or zero on success
>>>> + */
>>>> +static int tpg_enum_mbus_code(struct v4l2_subdev *sd,
>>>> +                  struct v4l2_subdev_state *sd_state,
>>>> +                  struct v4l2_subdev_mbus_code_enum *code)
>>>> +{
>>>> +    struct tpg_device *tpg = v4l2_get_subdevdata(sd);
>>>> +    struct v4l2_mbus_framefmt *format;
>>>> +
>>>> +    if (code->pad == MSM_TPG_PAD_SINK) {
>>>> +        if (code->index >= tpg->res->formats->nformats)
>>>> +            return -EINVAL;
>>>> +
>>>> +        code->code = tpg->res->formats->formats[code->index].code;
>>>> +    } else {
>>>> +        if (code->index > 0)
>>>> +            return -EINVAL;
>>>> +
>>>> +        format = __tpg_get_format(tpg, sd_state,
>>>> +                      MSM_TPG_PAD_SINK,
>>>> +                      code->which);
>>>> +
>>>> +        code->code = format->code;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +/*
>>>> + * tpg_enum_frame_size - Handle frame size enumeration
>>>> + * @sd: tpg V4L2 subdevice
>>>> + * @cfg: V4L2 subdev pad configuration
>>>> + * @fse: pointer to v4l2_subdev_frame_size_enum structure
>>>> + * return -EINVAL or zero on success
>>>> + */
>>>> +static int tpg_enum_frame_size(struct v4l2_subdev *sd,
>>>> +                   struct v4l2_subdev_state *sd_state,
>>>> +                   struct v4l2_subdev_frame_size_enum *fse)
>>>> +{
>>>> +    struct tpg_device *tpg = v4l2_get_subdevdata(sd);
>>>> +    struct v4l2_mbus_framefmt format;
>>>> +
>>>> +    if (fse->index != 0)
>>>> +        return -EINVAL;
>>>> +
>>>> +    format.code = fse->code;
>>>> +    format.width = 1;
>>>> +    format.height = 1;
>>>> +    tpg_try_format(tpg, sd_state, fse->pad, &format, fse->which);
>>>> +    fse->min_width = format.width;
>>>> +    fse->min_height = format.height;
>>>> +
>>>> +    if (format.code != fse->code)
>>>> +        return -EINVAL;
>>>> +
>>>> +    format.code = fse->code;
>>>> +    format.width = -1;
>>>> +    format.height = -1;
>>>
>>> format.width and format.height are rewritten in the tpg_try_format(),
>>> so it makes no sense to assign them.
>>>
>>
>> This is use for pass parameters in.
>>
>>> The problem is that for whatever reason you can tpg_try_format() twice
>>> in a raw, it looks wrong, and I'm certain you can modify the functions
>>> so that only one call would be needed.
>>> The first call is to get the supported minimum size, and the second call
>> is to get the maximum size.
>>
>> The tpg_try_format function can be used multiple times; I don't think
>> it's necessary to write a new interface.
> 
> I didn't ask to write a new interface, please reread my comment.
> 
> Yon can write tpg_enum_frame_size() function, that tpg_try_format()
> is not called at all, but for an unclear reason here it's called twice.
> 
Sure, it will be implemented in a simpler way.

>>>> +    tpg_try_format(tpg, sd_state, fse->pad, &format, fse->which);
>>>> +    fse->max_width = format.width;
>>>> +    fse->max_height = format.height;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +/*
>>>> + * tpg_get_format - Handle get format by pads subdev method
>>>> + * @sd: tpg V4L2 subdevice
>>>> + * @cfg: V4L2 subdev pad configuration
>>>> + * @fmt: pointer to v4l2 subdev format structure
>>>> + *
>>>> + * Return -EINVAL or zero on success
>>>> + */
>>>> +static int tpg_get_format(struct v4l2_subdev *sd,
>>>> +              struct v4l2_subdev_state *sd_state,
>>>> +              struct v4l2_subdev_format *fmt)
>>>> +{
>>>> +    struct tpg_device *tpg = v4l2_get_subdevdata(sd);
>>>> +    struct v4l2_mbus_framefmt *format;
>>>> +
>>>> +    format = __tpg_get_format(tpg, sd_state, fmt->pad, fmt->which);
>>>> +    if (!format)
>>>> +        return -EINVAL;
>>>> +
>>>> +    fmt->format = *format;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +/*
>>>> + * tpg_set_format - Handle set format by pads subdev method
>>>> + * @sd: tpg V4L2 subdevice
>>>> + * @cfg: V4L2 subdev pad configuration
>>>> + * @fmt: pointer to v4l2 subdev format structure
>>>> + *
>>>> + * Return -EINVAL or zero on success
>>>> + */
>>>> +static int tpg_set_format(struct v4l2_subdev *sd,
>>>> +              struct v4l2_subdev_state *sd_state,
>>>> +              struct v4l2_subdev_format *fmt)
>>>> +{
>>>> +    struct tpg_device *tpg = v4l2_get_subdevdata(sd);
>>>> +    struct v4l2_mbus_framefmt *format;
>>>> +
>>>> +    format = __tpg_get_format(tpg, sd_state, fmt->pad, fmt->which);
>>>> +    if (!format)
>>>> +        return -EINVAL;
>>>> +
>>>> +    tpg_try_format(tpg, sd_state, fmt->pad, &fmt->format,
>>>> +               fmt->which);
>>>> +    *format = fmt->format;
>>>> +
>>>> +    if (fmt->pad == MSM_TPG_PAD_SINK) {
>>>> +        format = __tpg_get_format(tpg, sd_state,
>>>> +                      MSM_TPG_PAD_SRC,
>>>> +                      fmt->which);
>>>> +
>>>> +        *format = fmt->format;
>>>> +        tpg_try_format(tpg, sd_state, MSM_TPG_PAD_SRC,
>>>> +                   format,
>>>> +                   fmt->which);
>>>> +    }
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +/*
>>>> + * tpg_init_formats - Initialize formats on all pads
>>>> + * @sd: tpg V4L2 subdevice
>>>> + * @fh: V4L2 subdev file handle
>>>> + *
>>>> + * Initialize all pad formats with default values.
>>>> + *
>>>> + * Return 0 on success or a negative error code otherwise
>>>> + */
>>>> +static int tpg_init_formats(struct v4l2_subdev *sd,
>>>> +                struct v4l2_subdev_fh *fh)
>>>> +{
>>>> +    struct v4l2_subdev_format format = {
>>>> +        .pad = MSM_TPG_PAD_SINK,
>>>> +        .which = fh ? V4L2_SUBDEV_FORMAT_TRY :
>>>> +                  V4L2_SUBDEV_FORMAT_ACTIVE,
>>>> +        .format = {
>>>> +            .code = MEDIA_BUS_FMT_SBGGR8_1X8,
>>>> +            .width = 1920,
>>>> +            .height = 1080
>>>> +        }
>>>> +    };
>>>> +
>>>> +    return tpg_set_format(sd, fh ? fh->state : NULL, &format);
>>>> +}
>>>> +
>>>> +/*
>>>> + * tpg_set_test_pattern - Set test generator's pattern mode
>>>> + * @tpg: TPG device
>>>> + * @value: desired test pattern mode
>>>> + *
>>>> + * Return 0 on success or a negative error code otherwise
>>>> + */
>>>> +static int tpg_set_test_pattern(struct tpg_device *tpg, s32 value)
>>>> +{
>>>> +    return tpg->res->hw_ops->configure_testgen_pattern(tpg, value);
>>>> +}
>>>> +
>>>> +/*
>>>> + * tpg_s_ctrl - Handle set control subdev method
>>>> + * @ctrl: pointer to v4l2 control structure
>>>> + *
>>>> + * Return 0 on success or a negative error code otherwise
>>>> + */
>>>> +static int tpg_s_ctrl(struct v4l2_ctrl *ctrl)
>>>> +{
>>>> +    struct tpg_device *tpg = container_of(ctrl->handler,
>>>> +                          struct tpg_device, ctrls);
>>>> +    int ret = -EINVAL;
>>>> +
>>>> +    switch (ctrl->id) {
>>>> +    case V4L2_CID_TEST_PATTERN:
>>>> +        ret = tpg_set_test_pattern(tpg, ctrl->val);
>>>> +        break;
>>>> +    }
>>>> +
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +static const struct v4l2_ctrl_ops tpg_ctrl_ops = {
>>>> +    .s_ctrl = tpg_s_ctrl,
>>>> +};
>>>> +
>>>> +/*
>>>> + * msm_tpg_subdev_init - Initialize tpg device structure and resources
>>>> + * @tpg: tpg device
>>>
>>> And no 'camss' argument. The whole function description comment is quite
>>> useless, it can be just removed with no losses.
>>>
>> ACK. will remove it all.
> 
> Good, thank you.
> 
>>> + * @res: tpg module resources table
>>>> + * @id: tpg module id
>>>> + *
>>>> + * Return 0 on success or a negative error code otherwise
>>>> + */
>>>> +int msm_tpg_subdev_init(struct camss *camss,
>>>> +            struct tpg_device *tpg,
>>>> +            const struct camss_subdev_resources *res, u8 id)
>>>> +{
>>>> +    struct platform_device *pdev;
>>>> +    struct device *dev;
>>>> +    int i, j;
>>>> +
>>>> +    dev  = camss->dev;
>>>> +    pdev = to_platform_device(dev);
>>>> +
>>>> +    tpg->camss = camss;
>>>> +    tpg->id = id;
>>>> +    tpg->res = &res->tpg;
>>>> +    tpg->res->hw_ops->subdev_init(tpg);
>>>> +
>>>> +    tpg->base = devm_platform_ioremap_resource_byname(pdev, res-
>>>>> reg[0]);
>>>> +    if (IS_ERR(tpg->base))
>>>> +        return PTR_ERR(tpg->base);
>>>> +
>>>> +    tpg->nclocks = 0;
>>>> +    while (res->clock[tpg->nclocks])
>>>> +        tpg->nclocks++;
>>>> +
>>>> +    if (tpg->nclocks) {
>>>
>>> if (!tpg->nclocks)
>>>       return 0;
>>>
>> ACK.>> +        tpg->clock = devm_kcalloc(dev,
>>>> +                      tpg->nclocks, sizeof(*tpg->clock),
>>>> +                      GFP_KERNEL);
>>>> +        if (!tpg->clock)
>>>> +            return -ENOMEM;
>>>> +
>>>> +        for (i = 0; i < tpg->nclocks; i++) {
>>>> +            struct camss_clock *clock = &tpg->clock[i];
>>>> +
>>>> +            clock->clk = devm_clk_get(dev, res->clock[i]);
>>>> +            if (IS_ERR(clock->clk))
>>>> +                return PTR_ERR(clock->clk);
>>>> +
>>>> +            clock->name = res->clock[i];
>>>> +
>>>> +            clock->nfreqs = 0;
>>>> +            while (res->clock_rate[i][clock->nfreqs])
>>>> +                clock->nfreqs++;
>>>> +
>>>> +            if (!clock->nfreqs) {
>>>> +                clock->freq = NULL;
>>>> +                continue;
>>>> +            }
>>>> +
>>>> +            clock->freq = devm_kcalloc(dev,
>>>> +                           clock->nfreqs,
>>>> +                           sizeof(*clock->freq),
>>>> +                           GFP_KERNEL);
>>>> +            if (!clock->freq)
>>>> +                return -ENOMEM;
>>>> +
>>>> +            for (j = 0; j < clock->nfreqs; j++)
>>>> +                clock->freq[j] = res->clock_rate[i][j];
>>>> +        }
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +/*
>>>> + * tpg_link_setup - Setup tpg connections
>>>> + * @entity: Pointer to media entity structure
>>>> + * @local: Pointer to local pad
>>>> + * @remote: Pointer to remote pad
>>>> + * @flags: Link flags
>>>> + *
>>>> + * Return 0 on success
>>>> + */
>>>> +static int tpg_link_setup(struct media_entity *entity,
>>>> +              const struct media_pad *local,
>>>> +              const struct media_pad *remote, u32 flags)
>>>> +{
>>>> +    if (flags & MEDIA_LNK_FL_ENABLED)
>>>> +        if (media_pad_remote_pad_first(local))
>>>> +            return -EBUSY;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static const struct v4l2_subdev_core_ops tpg_core_ops = {
>>>> +    .s_power = tpg_set_power,
>>>> +};
>>>> +
>>>> +static const struct v4l2_subdev_video_ops tpg_video_ops = {
>>>> +    .s_stream = tpg_set_stream,
>>>> +};
>>>> +
>>>> +static const struct v4l2_subdev_pad_ops tpg_pad_ops = {
>>>> +    .enum_mbus_code = tpg_enum_mbus_code,
>>>> +    .enum_frame_size = tpg_enum_frame_size,
>>>> +    .get_fmt = tpg_get_format,
>>>> +    .set_fmt = tpg_set_format,
>>>> +};
>>>> +
>>>> +static const struct v4l2_subdev_ops tpg_v4l2_ops = {
>>>> +    .core = &tpg_core_ops,
>>>> +    .video = &tpg_video_ops,
>>>> +    .pad = &tpg_pad_ops,
>>>> +};
>>>> +
>>>> +static const struct v4l2_subdev_internal_ops tpg_v4l2_internal_ops = {
>>>> +    .open = tpg_init_formats,
>>>> +};
>>>> +
>>>> +static const struct media_entity_operations tpg_media_ops = {
>>>> +    .link_setup = tpg_link_setup,
>>>> +    .link_validate = v4l2_subdev_link_validate,
>>>> +};
>>>> +
>>>> +/*
>>>> + * msm_tpg_register_entity - Register subdev node for tpg module
>>>> + * @tpg: tpg device
>>>> + * @v4l2_dev: V4L2 device
>>>> + *
>>>> + * Return 0 on success or a negative error code otherwise
>>>> + */
>>>> +int msm_tpg_register_entity(struct tpg_device *tpg,
>>>> +                struct v4l2_device *v4l2_dev)
>>>> +{
>>>> +    struct v4l2_subdev *sd = &tpg->subdev;
>>>> +    struct media_pad *pads = tpg->pads;
>>>> +    struct device *dev = tpg->camss->dev;
>>>> +    int ret;
>>>> +
>>>> +    v4l2_subdev_init(sd, &tpg_v4l2_ops);
>>>> +    sd->internal_ops = &tpg_v4l2_internal_ops;
>>>> +    sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
>>>> +             V4L2_SUBDEV_FL_HAS_EVENTS;
>>>> +    snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d",
>>>> +         MSM_TPG_NAME, tpg->id);
>>>> +    sd->grp_id = TPG_GUP_ID;
>>>> +    v4l2_set_subdevdata(sd, tpg);
>>>> +
>>>> +    ret = v4l2_ctrl_handler_init(&tpg->ctrls, 1);
>>>> +    if (ret < 0) {
>>>> +        dev_err(dev, "Failed to init ctrl handler: %d\n", ret);
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    tpg->testgen_mode = v4l2_ctrl_new_std_menu_items(&tpg->ctrls,
>>>> +                             &tpg_ctrl_ops, V4L2_CID_TEST_PATTERN,
>>>> +                             tpg->testgen.nmodes, 0, 0,
>>>> +                             tpg->testgen.modes);
>>>> +
>>>
>>> Please remove a blank line above.
>>>
>> ACK.>> +    if (tpg->ctrls.error) {
>>>> +        dev_err(dev, "Failed to init ctrl: %d\n", tpg->ctrls.error);
>>>> +        ret = tpg->ctrls.error;
>>>> +        goto free_ctrl;
>>>> +    }
>>>> +
>>>> +    tpg->subdev.ctrl_handler = &tpg->ctrls;
>>>> +
>>>> +    ret = tpg_init_formats(sd, NULL);
>>>> +    if (ret < 0) {
>>>> +        dev_err(dev, "Failed to init format: %d\n", ret);
>>>> +        goto free_ctrl;
>>>> +    }
>>>> +
>>>> +    pads[MSM_TPG_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
>>>> +    pads[MSM_TPG_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
>>>
>>> Why do you need two pads for TPG?
>>>
>> will fix it next version.
>>
>>>> +
>>>> +    sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
>>>
>>> TPG is not a video pixel encoding converter device.
>>>
>>
>> How about MEDIA_ENT_F_CAM_SENSOR?
>>
> 
> Still not perfect, but probably it's better... At least it won't implicitly
> assume a presense of two pads on the media entity.
> 

Or just deleted it, if want to keep this,
will choose MEDIA_ENT_F_CAM_SENSOR.

and I will delete all sink code in this driver.

>>>> +    sd->entity.ops = &tpg_media_ops;
>>>> +    ret = media_entity_pads_init(&sd->entity, MSM_TPG_PADS_NUM, pads);
>>>> +    if (ret < 0) {
>>>> +        dev_err(dev, "Failed to init media entity: %d\n", ret);
>>>> +        goto free_ctrl;
>>>> +    }
>>>> +
>>>> +    ret = v4l2_device_register_subdev(v4l2_dev, sd);
>>>> +    if (ret < 0) {
>>>> +        dev_err(dev, "Failed to register subdev: %d\n", ret);
>>>> +        media_entity_cleanup(&sd->entity);
>>>> +        goto free_ctrl;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +
>>>> +free_ctrl:
>>>> +    v4l2_ctrl_handler_free(&tpg->ctrls);
>>>> +
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +/*
>>>> + * msm_tpg_unregister_entity - Unregister tpg module subdev node
>>>> + * @tpg: tpg device
>>>> + */
>>>> +void msm_tpg_unregister_entity(struct tpg_device *tpg)
>>>> +{
>>>> +    v4l2_device_unregister_subdev(&tpg->subdev);
>>>> +    media_entity_cleanup(&tpg->subdev.entity);
>>>> +    v4l2_ctrl_handler_free(&tpg->ctrls);
>>>> +}
>>>> diff --git a/drivers/media/platform/qcom/camss/camss-tpg.h b/drivers/
>>>> media/platform/qcom/camss/camss-tpg.h
>>>> new file mode 100644
>>>> index
>>>> 0000000000000000000000000000000000000000..1a16addac19418f2f11d0b8abb1c865c99888bde
>>>> --- /dev/null
>>>> +++ b/drivers/media/platform/qcom/camss/camss-tpg.h
>>>> @@ -0,0 +1,127 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>> +/*
>>>> + * camss-tpg.h
>>>> + *
>>>> + * Qualcomm MSM Camera Subsystem - TPG Module
>>>> + *
>>>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights
>>>> reserved.
>>>> + */
>>>> +#ifndef QC_MSM_CAMSS_TPG_H
>>>> +#define QC_MSM_CAMSS_TPG_H
>>>> +
>>>> +#include <linux/clk.h>
>>>> +#include <media/media-entity.h>
>>>> +#include <media/v4l2-ctrls.h>
>>>> +#include <media/v4l2-device.h>
>>>> +#include <media/v4l2-mediabus.h>
>>>> +#include <media/v4l2-subdev.h>
>>>> +
>>>> +#define MSM_TPG_PAD_SINK 0
>>>> +#define MSM_TPG_PAD_SRC 1
>>>> +#define MSM_TPG_PADS_NUM 2
>>>> +
>>>> +#define DATA_TYPE_RAW_8BIT        0x2a
>>>> +#define DATA_TYPE_RAW_10BIT        0x2b
>>>> +#define DATA_TYPE_RAW_12BIT        0x2c
>>>
>>> Remove all above to get the macro values from include/media/mipi-csi2.h
>>>
>> ACK.>> +
>>>> +#define ENCODE_FORMAT_UNCOMPRESSED_8_BIT    0x1
>>>> +#define ENCODE_FORMAT_UNCOMPRESSED_10_BIT    0x2
>>>> +#define ENCODE_FORMAT_UNCOMPRESSED_12_BIT    0x3
>>>> +#define ENCODE_FORMAT_UNCOMPRESSED_14_BIT    0x4
>>>> +#define ENCODE_FORMAT_UNCOMPRESSED_16_BIT    0x5
>>>> +#define ENCODE_FORMAT_UNCOMPRESSED_20_BIT    0x6
>>>> +#define ENCODE_FORMAT_UNCOMPRESSED_24_BIT    0x7
>>>> +
>>>> +#define TPG_GUP_ID 0
> 
> In addition to the previous review comments, please change the value to
> something other than default 0. This type of data can be placed outside
> of TPG specific code, it has a potential for further outbreak.
> 
ACK.

>>>> +#define MSM_TPG_NAME "msm_tpg"
>>>
>>> Remove the macro, it's used only once in the code and more usecases are
>>> not expected happen.
>>>
>> ACK.
> 
>>> +
>>>> +enum tpg_testgen_mode {
>>>> +    TPG_PAYLOAD_MODE_DISABLED = 0,
>>>> +  �� TPG_PAYLOAD_MODE_INCREMENTING = 1,
>>>> +    TPG_PAYLOAD_MODE_ALTERNATING_55_AA = 2,
>>>> +    TPG_PAYLOAD_MODE_RANDOM = 5,
>>>> +    TPG_PAYLOAD_MODE_USER_SPECIFIED = 6,
>>>> +    TPG_PAYLOAD_MODE_COLOR_BARS = 9,
>>>> +    TPG_PAYLOAD_MODE_NUM_SUPPORTED_GEN1 = 9,
>>>> +};
>>>> +
>>>> +struct tpg_testgen_config {
>>>> +    enum tpg_testgen_mode mode;
>>>> +    const char * const*modes;
>>>> +    u8 nmodes;
>>>> +};
>>>> +
>>>> +struct tpg_format_info {
>>>> +    u32 code;
>>>> +    u8 data_type;
>>>> +    u8 encode_format;
>>>> +    u8 bpp;
>>>> +};
>>>> +
>>>> +struct tpg_formats {
>>>> +    unsigned int nformats;
>>>> +    const struct tpg_format_info *formats;
>>>> +};
>>>> +
>>>> +struct tpg_device;
>>>> +
>>>> +struct tpg_hw_ops {
>>>> +    int (*configure_stream)(struct tpg_device *tpg, u8 enable);
>>>> +
>>>> +    int (*configure_testgen_pattern)(struct tpg_device *tpg, s32 val);
>>>> +
>>>> +    u32 (*hw_version)(struct tpg_device *tpg);
>>>> +
>>>> +    int (*reset)(struct tpg_device *tpg);
>>>> +
>>>> +    void (*subdev_init)(struct tpg_device *tpg);
>>>> +};
>>>> +
>>>> +struct tpg_subdev_resources {
>>>> +    u8 lane_cnt;
>>>> +    u8 vc_cnt;
>>>> +    const struct tpg_formats *formats;
>>>> +    const struct tpg_hw_ops *hw_ops;
>>>> +};
>>>> +
>>>> +struct tpg_device {
>>>> +    struct camss *camss;
>>>> +    u8 id;
>>>> +    struct v4l2_subdev subdev;
>>>> +    struct media_pad pads[MSM_TPG_PADS_NUM];
>>>> +    void __iomem *base;
>>>> +    struct camss_clock *clock;
>>>> +    int nclocks;
>>>> +    struct tpg_testgen_config testgen;
>>>> +    struct v4l2_mbus_framefmt fmt[MSM_TPG_PADS_NUM];
>>>> +    struct v4l2_ctrl_handler ctrls;
>>>> +    struct v4l2_ctrl *testgen_mode;
>>>> +    const struct tpg_subdev_resources *res;
>>>> +    const struct tpg_format *formats;
>>>> +    unsigned int nformats;
>>>> +    u32 hw_version;
>>>> +};
>>>> +
>>>> +struct camss_subdev_resources;
>>>> +
>>>> +const struct tpg_format_info *tpg_get_fmt_entry(struct tpg_device 
>>>> *tpg,
>>>> +                        const struct tpg_format_info *formats,
>>>> +                        unsigned int nformats,
>>>> +                        u32 code);
>>>> +
>>>> +int msm_tpg_subdev_init(struct camss *camss,
>>>> +            struct tpg_device *tpg,
>>>> +            const struct camss_subdev_resources *res, u8 id);
>>>> +
>>>> +int msm_tpg_register_entity(struct tpg_device *tpg,
>>>> +                struct v4l2_device *v4l2_dev);
>>>> +
>>>> +void msm_tpg_unregister_entity(struct tpg_device *tpg);
>>>> +
>>>> +extern const char * const testgen_payload_modes[];
>>>> +
>>>> +extern const struct tpg_formats tpg_formats_gen1;
>>>> +
>>>> +extern const struct tpg_hw_ops tpg_ops_gen1;
>>>> +
>>>> +#endif /* QC_MSM_CAMSS_TPG_H */
>>>> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/
>>>> media/platform/qcom/camss/camss.h
>>>> index
>>>> 9d9a62640e25dce0e8d45af9df01bbfd64b9bb4b..a892a87bed8bde8919200d6eac2b7a5338763c0e 100644
>>>> --- a/drivers/media/platform/qcom/camss/camss.h
>>>> +++ b/drivers/media/platform/qcom/camss/camss.h
>>>> @@ -21,6 +21,7 @@
>>>>    #include "camss-csid.h"
>>>>    #include "camss-csiphy.h"
>>>>    #include "camss-ispif.h"
>>>> +#include "camss-tpg.h"
>>>>    #include "camss-vfe.h"
>>>>    #include "camss-format.h"
>>>> @@ -52,6 +53,7 @@ struct camss_subdev_resources {
>>>>        char *interrupt[CAMSS_RES_MAX];
>>>>        union {
>>>>            struct csiphy_subdev_resources csiphy;
>>>> +        struct tpg_subdev_resources tpg;
>>>>            struct csid_subdev_resources csid;
>>>>            struct vfe_subdev_resources vfe;
>>>>        };
>>>> @@ -104,6 +106,7 @@ struct camss_resources {
>>>>        enum camss_version version;
>>>>        const char *pd_name;
>>>>        const struct camss_subdev_resources *csiphy_res;
>>>> +    const struct camss_subdev_resources *tpg_res;
>>>>        const struct camss_subdev_resources *csid_res;
>>>>        const struct camss_subdev_resources *ispif_res;
>>>>        const struct camss_subdev_resources *vfe_res;
>>>> @@ -111,6 +114,7 @@ struct camss_resources {
>>>>        const struct resources_icc *icc_res;
>>>>        const unsigned int icc_path_num;
>>>>        const unsigned int csiphy_num;
>>>> +    const unsigned int tpg_num;
>>>>        const unsigned int csid_num;
>>>>        const unsigned int vfe_num;
>>>>    };
>>>> @@ -121,6 +125,7 @@ struct camss {
>>>>        struct media_device media_dev;
>>>>        struct device *dev;
>>>>        struct csiphy_device *csiphy;
>>>> +    struct tpg_device *tpg;
>>>>        struct csid_device *csid;
>>>>        struct ispif_device *ispif;
>>>>        struct vfe_device *vfe;
>>>>
>>>
> 
Thanks for your review.
Wenmeng

