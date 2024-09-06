Return-Path: <linux-media+bounces-17766-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEB696F310
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 13:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CF61284F95
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 11:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4BC1CB31E;
	Fri,  6 Sep 2024 11:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a2e2SYxL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A9E1CB306;
	Fri,  6 Sep 2024 11:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725622078; cv=none; b=P4h7avPUzIi7ZT8J81Eq7EQq09wSGz+jHCe4IP66Mr6xgeds2pTN6fNvxueDp0Yx3LVKV09xVcBD+1gae1iOjh9tBV4vuDA68OudZXcXj5Sqr8Qjrlgf9yf/FYXICD9QE3iuOgIy4neseAJl6DYCvjPiSu7v9QqKhUfHE8zu3AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725622078; c=relaxed/simple;
	bh=JS9tCM7zRwVfmi+uCTwHUfXz53NUIe6pPP+J2IRd2NU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=O7C6roVyIBQcTmqAN4IUSgGZNng6mjJQgPujUwFjs75knMN9USs5MresYUBPrAYVHTTvclYXIj3ORhLo6s0pfCO/mvX/ZuDdqjhj6dAToEFzWsRNRZSCVx0rTEv5QnEIfIhsTtxwZ/f1TYLOGPqRZdeR/ODX5HSnD0cfTomRW14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a2e2SYxL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4868WQma019626;
	Fri, 6 Sep 2024 11:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NuMwQdQx744DZopb396rXYPa1vSCfM568MDlnN/j46k=; b=a2e2SYxL66W4ugWU
	q8pzMonHXohTgIi7Px47VrIWfPh7+J2cBuzCXq2l7ddjdWxSaTjEkhI6Fm94dksC
	1SR3skyc2hVV1JEXBZyW5OH3Cq0oxsy2HXXPThsQjNx2G7TSECw3vI3oplkRjXGu
	lCIf/wcXbD/nohFcBPva4TqbzrYHIKLiyu65r8BGq+5XToTJrgcE8Zj8MjGvBT96
	fangiAIwyvXh8TVkJjgoqXUHhfS/ZGWikXB+uTm50JlOJ2jsmqyV4GhKRZtfkQZu
	C5TTFDzmeUxJe2bUL3vsMPaIdzyNT7teV2rV5Z58pn/3X7wMk8ZRABgu65DrCiAw
	K/EpxA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhwu243x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 11:27:50 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 486BRn6u028826
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Sep 2024 11:27:49 GMT
Received: from [10.204.100.69] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Sep 2024
 04:27:46 -0700
Message-ID: <edf7beb9-6457-f089-7fb6-f54a382d6e8b@quicinc.com>
Date: Fri, 6 Sep 2024 16:57:43 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 08/29] media: iris: implement boot sequence of the
 firmware
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-8-c5fdbbe65e70@quicinc.com>
 <3b578b1b-53d5-4f2d-a2b8-8483a4051a24@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <3b578b1b-53d5-4f2d-a2b8-8483a4051a24@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gOE_NPhob6W3D9x7PohB_vE9NflCPhoi
X-Proofpoint-GUID: gOE_NPhob6W3D9x7PohB_vE9NflCPhoi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_17,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409060083

Hi Bryan,

On 9/5/2024 6:04 PM, Bryan O'Donoghue wrote:
> On 27/08/2024 11:05, Dikshita Agarwal via B4 Relay wrote:
>> From: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>
>> Set memory region to firmware and implement boot sequence.
>>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/iris/Makefile          |  1 +
>>   drivers/media/platform/qcom/iris/iris_core.c       |  7 ++
>>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>>   .../platform/qcom/iris/iris_platform_sm8550.c      |  3 +
>>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 87 ++++++++++++++++++++++
>>   drivers/media/platform/qcom/iris/iris_vpu_common.h | 13 ++++
>>   6 files changed, 112 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/Makefile
>> b/drivers/media/platform/qcom/iris/Makefile
>> index ddd4c994a0b9..95f4e92fe085 100644
>> --- a/drivers/media/platform/qcom/iris/Makefile
>> +++ b/drivers/media/platform/qcom/iris/Makefile
>> @@ -8,5 +8,6 @@ iris-objs += iris_core.o \
>>                iris_probe.o \
>>                iris_resources.o \
>>                iris_vidc.o \
>> +             iris_vpu_common.o \
>>     obj-$(CONFIG_VIDEO_QCOM_IRIS) += iris.o
>> diff --git a/drivers/media/platform/qcom/iris/iris_core.c
>> b/drivers/media/platform/qcom/iris/iris_core.c
>> index 8c7d53c57086..5ad66ac113ae 100644
>> --- a/drivers/media/platform/qcom/iris/iris_core.c
>> +++ b/drivers/media/platform/qcom/iris/iris_core.c
>> @@ -6,6 +6,7 @@
>>   #include "iris_core.h"
>>   #include "iris_firmware.h"
>>   #include "iris_state.h"
>> +#include "iris_vpu_common.h"
>>     void iris_core_deinit(struct iris_core *core)
>>   {
>> @@ -39,10 +40,16 @@ int iris_core_init(struct iris_core *core)
>>       if (ret)
>>           goto error_queue_deinit;
>>   +    ret = iris_vpu_boot_firmware(core);
>> +    if (ret)
>> +        goto error_unload_fw;
>> +
>>       mutex_unlock(&core->lock);
>>         return 0;
>>   +error_unload_fw:
>> +    iris_fw_unload(core);
>>   error_queue_deinit:
>>       iris_hfi_queues_deinit(core);
>>   error:
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index 9c919367f9d7..47fdebd8135c 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -45,6 +45,7 @@ struct iris_platform_data {
>>       const char *fwname;
>>       u32 pas_id;
>>       struct tz_cp_config *tz_cp_config_data;
>> +    u32 core_arch;
>>   };
>>     #endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> index 1bb34c3e6e18..a559e095fefc 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> @@ -8,6 +8,8 @@
>>   #include "iris_platform_common.h"
>>   #include "iris_resources.h"
>>   +#define VIDEO_ARCH_LX 1
>> +
>>   static const struct icc_info sm8550_icc_table[] = {
>>       { "cpu-cfg",    1000, 1000     },
>>       { "video-mem",  1000, 15000000 },
>> @@ -48,4 +50,5 @@ struct iris_platform_data sm8550_data = {
>>       .fwname = "qcom/vpu/vpu30_p4.mbn",
>>       .pas_id = IRIS_PAS_ID,
>>       .tz_cp_config_data = &tz_cp_config_sm8550,
>> +    .core_arch = VIDEO_ARCH_LX,
>>   };
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> new file mode 100644
>> index 000000000000..df87b1b719a9
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> @@ -0,0 +1,87 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <linux/iopoll.h>
>> +
>> +#include "iris_core.h"
>> +#include "iris_vpu_common.h"
>> +
>> +#define CPU_BASE_OFFS                0x000A0000
>> +
>> +#define CPU_CS_BASE_OFFS            (CPU_BASE_OFFS)
>> +
>> +#define CTRL_INIT                (CPU_CS_BASE_OFFS + 0x48)
>> +#define CTRL_STATUS                (CPU_CS_BASE_OFFS + 0x4C)
>> +
>> +#define CTRL_ERROR_STATUS__M            0xfe
>> +
>> +#define QTBL_INFO                (CPU_CS_BASE_OFFS + 0x50)
>> +#define QTBL_ADDR                (CPU_CS_BASE_OFFS + 0x54)
>> +#define CPU_CS_SCIACMDARG3            (CPU_CS_BASE_OFFS + 0x58)
>> +#define SFR_ADDR                (CPU_CS_BASE_OFFS + 0x5C)
>> +#define UC_REGION_ADDR                (CPU_CS_BASE_OFFS + 0x64)
>> +#define UC_REGION_SIZE                (CPU_CS_BASE_OFFS + 0x68)
>> +
>> +#define CPU_CS_H2XSOFTINTEN            (CPU_CS_BASE_OFFS + 0x148)
>> +#define CPU_CS_X2RPMH                (CPU_CS_BASE_OFFS + 0x168)
>> +
>> +static void iris_vpu_setup_ucregion_memory_map(struct iris_core *core)
>> +{
>> +    u32 queue_size, value;
>> +
>> +    /* Iris hardware requires 4K queue alignment */
>> +    queue_size = ALIGN(sizeof(struct iris_hfi_queue_table_header) +
>> +        (IFACEQ_QUEUE_SIZE * IFACEQ_NUMQ), SZ_4K);
>> +
>> +    value = (u32)core->iface_q_table_daddr;
>> +    writel(value, core->reg_base + UC_REGION_ADDR);
>> +
>> +    /* Iris hardware requires 1M queue alignment */
>> +    value = ALIGN(SFR_SIZE + queue_size, SZ_1M);
>> +    writel(value, core->reg_base + UC_REGION_SIZE);
>> +
>> +    value = (u32)core->iface_q_table_daddr;
>> +    writel(value, core->reg_base + QTBL_ADDR);
>> +
>> +    writel(0x01, core->reg_base + QTBL_INFO);
> 
> A general comment I have is instead of writing hard-coded values to registers we
> should define at a minimum the bit-fields we use if not the entire set of
> bits-fields for the register.
> 
> The only exception to this is when we don't know what those values are - for
> example receiving a magic write sequence for a camera sensor.
> 
> In this case though we have full access to enumerate the register bit-fields.
> 
> Without looking at the register descriptions I guess this bit is an enable or a
> startup bit =>
> 
> #define QTBL_INFO_EN BIT(0)
Yes, we should expand the bits being set to provide better context to it. There
are few other places as well, primarily the power on/off sequences, will update it.

> 
> I'll not go through this series reiterating this comment but, it certainly
> applies to any bit-field/register in the same => please define at least the bits
> used if not the full set of bits for register writes instead of using magic
> numbers.
> 
> ---
> bod

Regards,
Vikash

