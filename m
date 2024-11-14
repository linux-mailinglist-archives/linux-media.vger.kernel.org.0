Return-Path: <linux-media+bounces-21398-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A49149C839A
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 08:03:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1567DB2434B
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 07:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C68A1F7097;
	Thu, 14 Nov 2024 07:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="II/gBup6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE761F5834;
	Thu, 14 Nov 2024 07:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731567698; cv=none; b=fRbEmatz5hNO15D1MBEvCyH3RnSCmW8g2GeotPyastSRAZliOWEUes6Z2O7ljROr7DO966W5/GndCLaaJyb9WFvidFP9eQcG8wgLbhzG7GPd9xlgsfsif/TQMWD+nCLRvFj9evEztloaE12ZjSx826zRz1s6alV7ebDTwm/cjV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731567698; c=relaxed/simple;
	bh=WtGrUgiSDXf7nggniapDV2eei8PHzovoUUONkOCzrWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jnxG28bVK5yvgU6u/JGZXHtMmhlhfspXgm/WfzuF5P9KCI9Z/9X/akPBCJFr82IaTB0/cWC/9ngbsyPSuLO9azYJOfU8RQC/F7wGVBiAcm9v0a5EcxHmlS54AN/Y4EVxwUDyiuVi1TYzBfzVt4t7t1vy0cR+uNYZhvTeyp57krU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=II/gBup6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADNriPM030056;
	Thu, 14 Nov 2024 07:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HfDxNRltCeN0nnlnDpcvPuX9r4AmPoJxl12T4PhC8Qg=; b=II/gBup64xW+N8RI
	iRh9HuUT45PzBlgNCiv408c8jXa6xKqQx+0Itzfje18HOgXWCuIfz8/ABgZWOqCx
	51wxAFC581bZ9Pz8HxK9ON7U5vzZzucQRcFlfu6rIRvyOum1ElmXPa1pIwEtwq6P
	5kaZWcfWAB8T1W8X5g0U/vM3wfnpLcsIdVKaxBaLQ0btLXSciRgGGtlZtMWpkL6B
	8SmcVm6iqNCcsH1uUCM8UJh3GoFZvkO+c/DnZ2SNl41yVfaZdt/LtfZzD1LVB8f1
	RJ4UdMJY5UMNq7UC4xO6uB5rM+7ozXzA4nA6I8Uwc8iV9vNKlhMBD50zFO1Vxom8
	6i8MDw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42w66gs8u7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 07:01:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AE71MpN016625
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 07:01:22 GMT
Received: from [10.204.101.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 13 Nov
 2024 23:01:16 -0800
Message-ID: <7cbc4022-1787-6456-0fcb-ea08f1e12cde@quicinc.com>
Date: Thu, 14 Nov 2024 12:31:13 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 04/28] media: iris: introduce iris core state
 management with shared queues
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: Hans Verkuil <hverkuil@xs4all.nl>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
	<u.kleine-koenig@baylibre.com>,
        Jianhua Lu <lujianhua000@gmail.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241105-qcom-video-iris-v5-0-a88e7c220f78@quicinc.com>
 <20241105-qcom-video-iris-v5-4-a88e7c220f78@quicinc.com>
 <0d0e76ce-fac9-4cd9-b177-7180daffbf86@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <0d0e76ce-fac9-4cd9-b177-7180daffbf86@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EyuyfsJQjfI0bsEsTW1vkwQgQZwaWL-A
X-Proofpoint-ORIG-GUID: EyuyfsJQjfI0bsEsTW1vkwQgQZwaWL-A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411140051



On 11/11/2024 3:07 AM, Bryan O'Donoghue wrote:
> On 05/11/2024 06:55, Dikshita Agarwal wrote:
>> Introduce core state management for iris driver with necessary queues
>> needed for host firmware communication.
>>
>> There are 3 types of queues:
>> Command queue - driver to write any command to firmware.
>> Message queue - firmware to send any response to driver.
>> Debug queue - firmware to write debug messages.
>> Initialize and configire shared queues during probe.
>>
>> Different states for core:
>> IRIS_CORE_DEINIT - default state.
>> IRIS_CORE_INIT - core state with core initialized. FW loaded and HW
>> brought out of reset, shared queues established between host driver and
>> firmware.
>> IRIS_CORE_ERROR - error state.
>>        -----------
>>             |
>>             V
>>         -----------
>>         | DEINIT  |
>>         -----------
>>             ^
>>            / \
>>           /   \
>>          /     \
>>         /       \
>>        v         v
>>   -----------   ----------.
>>   |  INIT  |-->|  ERROR  |
>>   -----------   ----------.
>>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/iris/Makefile          |   4 +-
>>   drivers/media/platform/qcom/iris/iris_core.c       |  46 ++++++
>>   drivers/media/platform/qcom/iris/iris_core.h       |  23 +++
>>   drivers/media/platform/qcom/iris/iris_hfi_queue.c  | 123 +++++++++++++++
>>   drivers/media/platform/qcom/iris/iris_hfi_queue.h  | 175
>> +++++++++++++++++++++
>>   .../platform/qcom/iris/iris_platform_common.h      |   1 +
>>   .../platform/qcom/iris/iris_platform_sm8550.c      |   1 +
>>   drivers/media/platform/qcom/iris/iris_probe.c      |  20 +++
>>   drivers/media/platform/qcom/iris/iris_state.h      |  41 +++++
>>   drivers/media/platform/qcom/iris/iris_vidc.c       |   6 +
>>   10 files changed, 439 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/Makefile
>> b/drivers/media/platform/qcom/iris/Makefile
>> index 6de584090a3a..93711f108a77 100644
>> --- a/drivers/media/platform/qcom/iris/Makefile
>> +++ b/drivers/media/platform/qcom/iris/Makefile
>> @@ -1,5 +1,7 @@
>> -iris-objs += iris_hfi_gen1_command.o \
>> +iris-objs += iris_core.o \
>> +             iris_hfi_gen1_command.o \
>>                iris_hfi_gen2_command.o \
>> +             iris_hfi_queue.o \
>>                iris_platform_sm8550.o \
>>                iris_probe.o \
>>                iris_vidc.o \
>> diff --git a/drivers/media/platform/qcom/iris/iris_core.c
>> b/drivers/media/platform/qcom/iris/iris_core.c
>> new file mode 100644
>> index 000000000000..360a54909ef6
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_core.c
>> @@ -0,0 +1,46 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights
>> reserved.
>> + */
>> +
>> +#include "iris_core.h"
>> +#include "iris_state.h"
>> +
>> +void iris_core_deinit(struct iris_core *core)
>> +{
>> +    mutex_lock(&core->lock);
>> +    iris_hfi_queues_deinit(core);
>> +    core->state = IRIS_CORE_DEINIT;
>> +    mutex_unlock(&core->lock);
>> +}
>> +
>> +int iris_core_init(struct iris_core *core)
>> +{
>> +    int ret;
>> +
>> +    mutex_lock(&core->lock);
>> +    if (core->state == IRIS_CORE_INIT) {
>> +        ret = 0;
>> +        goto exit;
>> +    } else if (core->state == IRIS_CORE_ERROR) {
>> +        ret = -EINVAL;
>> +        goto error;
>> +    }
>> +
>> +    core->state = IRIS_CORE_INIT;
>> +
>> +    ret = iris_hfi_queues_init(core);
>> +    if (ret)
>> +        goto error;
>> +
>> +    mutex_unlock(&core->lock);
>> +
>> +    return 0;
>> +
>> +error:
>> +    core->state = IRIS_CORE_DEINIT;
>> +exit:
>> +    mutex_unlock(&core->lock);
>> +
>> +    return ret;
>> +}
>> diff --git a/drivers/media/platform/qcom/iris/iris_core.h
>> b/drivers/media/platform/qcom/iris/iris_core.h
>> index 73c835bb6589..5fd11c3f99c5 100644
>> --- a/drivers/media/platform/qcom/iris/iris_core.h
>> +++ b/drivers/media/platform/qcom/iris/iris_core.h
>> @@ -9,7 +9,9 @@
>>   #include <linux/types.h>
>>   #include <media/v4l2-device.h>
>>   +#include "iris_hfi_queue.h"
>>   #include "iris_platform_common.h"
>> +#include "iris_state.h"
>>     struct icc_info {
>>       const char        *name;
>> @@ -34,6 +36,15 @@ struct icc_info {
>>    * @clk_count: count of iris clocks
>>    * @resets: table of iris reset clocks
>>    * @iris_platform_data: a structure for platform data
>> + * @state: current state of core
>> + * @iface_q_table_daddr: device address for interface queue table memory
>> + * @sfr_daddr: device address for SFR (Sub System Failure Reason)
>> register memory
>> + * @iface_q_table_vaddr: virtual address for interface queue table memory
>> + * @sfr_vaddr: virtual address for SFR (Sub System Failure Reason)
>> register memory
>> + * @command_queue: shared interface queue to send commands to firmware
>> + * @message_queue: shared interface queue to receive responses from
>> firmware
>> + * @debug_queue: shared interface queue to receive debug info from firmware
>> + * @lock: a lock for this strucure
>>    */
>>     struct iris_core {
>> @@ -51,6 +62,18 @@ struct iris_core {
>>       u32                    clk_count;
>>       struct reset_control_bulk_data        *resets;
>>       const struct iris_platform_data        *iris_platform_data;
>> +    enum iris_core_state            state;
>> +    dma_addr_t                iface_q_table_daddr;
>> +    dma_addr_t                sfr_daddr;
>> +    void                    *iface_q_table_vaddr;
>> +    void                    *sfr_vaddr;
>> +    struct iris_iface_q_info        command_queue;
>> +    struct iris_iface_q_info        message_queue;
>> +    struct iris_iface_q_info        debug_queue;
>> +    struct mutex                lock; /* lock for core related
>> operations */
>>   };
>>   +int iris_core_init(struct iris_core *core);
>> +void iris_core_deinit(struct iris_core *core);
>> +
>>   #endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
>> b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
>> new file mode 100644
>> index 000000000000..bb7e0d747f0f
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
>> @@ -0,0 +1,123 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights
>> reserved.
>> + */
>> +
>> +#include "iris_core.h"
>> +#include "iris_hfi_queue.h"
>> +
>> +static void iris_hfi_queue_set_header(struct iris_core *core, u32 queue_id,
>> +                      struct iris_iface_q_info *iface_q)
>> +{
>> +    iface_q->qhdr->status = 0x1;
> 
> What does 0x1 indicate ?
> 
0x1 indicate the status as active, I will improve the comments for
structure defination as below to give more details.
@status: Queue status, bits (7:0), 0x1 - active, 0x0 - inactive

But do we really need to make this macro? there are many such values in the
same API, I think the details about these variables can be known from the
comments mentioned for this structure in the header file.

> Could this be a define instead of an assigned number ?
> 
>> +    iface_q->qhdr->start_addr = iface_q->device_addr;
>> +    iface_q->qhdr->header_type = IFACEQ_DFLT_QHDR;
>> +    iface_q->qhdr->queue_type = queue_id;
>> +    iface_q->qhdr->q_size = IFACEQ_QUEUE_SIZE / sizeof(u32);
>> +    iface_q->qhdr->pkt_size = 0; /* variable packet size */
>> +    iface_q->qhdr->rx_wm = 0x1;
>> +    iface_q->qhdr->tx_wm = 0x1;
>> +    iface_q->qhdr->rx_req = 0x1;
>> +    iface_q->qhdr->tx_req = 0x0;
>> +    iface_q->qhdr->rx_irq_status = 0x0;
>> +    iface_q->qhdr->tx_irq_status = 0x0;
>> +    iface_q->qhdr->read_idx = 0x0;
>> +    iface_q->qhdr->write_idx = 0x0;
>> +
>> +    /*
>> +     * Set receive request to zero on debug queue as there is no
>> +     * need of interrupt from video hardware for debug messages
>> +     */
>> +    if (queue_id == IFACEQ_DBGQ_ID)
>> +        iface_q->qhdr->rx_req = 0;
>> +}
>> +
>> +static void
>> +iris_hfi_queue_init(struct iris_core *core, u32 queue_id, struct
>> iris_iface_q_info *iface_q)
>> +{
>> +    struct iris_hfi_queue_table_header *q_tbl_hdr =
>> core->iface_q_table_vaddr;
>> +    u32 offset = sizeof(*q_tbl_hdr) + (queue_id * IFACEQ_QUEUE_SIZE);
>> +
>> +    iface_q->device_addr = core->iface_q_table_daddr + offset;
>> +    iface_q->kernel_vaddr =
>> +            (void *)((char *)core->iface_q_table_vaddr + offset);
>> +    iface_q->qhdr = &q_tbl_hdr->q_hdr[queue_id];
>> +
>> +    iris_hfi_queue_set_header(core, queue_id, iface_q);
>> +}
>> +
>> +static void iris_hfi_queue_deinit(struct iris_iface_q_info *iface_q)
>> +{
>> +    iface_q->qhdr = NULL;
>> +    iface_q->kernel_vaddr = NULL;
>> +    iface_q->device_addr = 0;
>> +}
>> +
>> +int iris_hfi_queues_init(struct iris_core *core)
>> +{
>> +    struct iris_hfi_queue_table_header *q_tbl_hdr;
>> +    u32 queue_size;
>> +
>> +    /* Iris hardware requires 4K queue alignment */
>> +    queue_size = ALIGN((sizeof(*q_tbl_hdr) + (IFACEQ_QUEUE_SIZE *
>> IFACEQ_NUMQ)), SZ_4K);
>> +    core->iface_q_table_vaddr = dma_alloc_attrs(core->dev, queue_size,
>> +                            &core->iface_q_table_daddr,
>> +                            GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
>> +    if (!core->iface_q_table_vaddr) {
>> +        dev_err(core->dev, "queues alloc and map failed\n");
>> +        return -ENOMEM;
>> +    }
>> +
>> +    core->sfr_vaddr = dma_alloc_attrs(core->dev, SFR_SIZE,
>> +                      &core->sfr_daddr,
>> +                      GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
>> +    if (!core->sfr_vaddr) {
>> +        dev_err(core->dev, "sfr alloc and map failed\n");
>> +        dma_free_attrs(core->dev, sizeof(*q_tbl_hdr),
>> core->iface_q_table_vaddr,
>> +                   core->iface_q_table_daddr, DMA_ATTR_WRITE_COMBINE);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    iris_hfi_queue_init(core, IFACEQ_CMDQ_ID, &core->command_queue);
>> +    iris_hfi_queue_init(core, IFACEQ_MSGQ_ID, &core->message_queue);
>> +    iris_hfi_queue_init(core, IFACEQ_DBGQ_ID, &core->debug_queue);
>> +
>> +    q_tbl_hdr = (struct iris_hfi_queue_table_header
>> *)core->iface_q_table_vaddr;
>> +    q_tbl_hdr->version = 0;
>> +    q_tbl_hdr->device_addr = (void *)core;
>> +    strscpy(q_tbl_hdr->name, "iris-hfi-queues", sizeof(q_tbl_hdr->name));
>> +    q_tbl_hdr->size = sizeof(*q_tbl_hdr);
>> +    q_tbl_hdr->qhdr0_offset = sizeof(*q_tbl_hdr) -
>> +        (IFACEQ_NUMQ * sizeof(struct iris_hfi_queue_header));
>> +    q_tbl_hdr->qhdr_size = sizeof(q_tbl_hdr->q_hdr[0]);
>> +    q_tbl_hdr->num_q = IFACEQ_NUMQ;
>> +    q_tbl_hdr->num_active_q = IFACEQ_NUMQ;
>> +
>> +     /* Write sfr size in first word to be used by firmware */
>> +    *((u32 *)core->sfr_vaddr) = SFR_SIZE;
>> +
>> +    return 0;
>> +}
>> +
>> +void iris_hfi_queues_deinit(struct iris_core *core)
>> +{
>> +    if (!core->iface_q_table_vaddr)
>> +        return;
>> +
>> +    iris_hfi_queue_deinit(&core->debug_queue);
>> +    iris_hfi_queue_deinit(&core->message_queue);
>> +    iris_hfi_queue_deinit(&core->command_queue);
>> +
>> +    dma_free_attrs(core->dev, SFR_SIZE, core->sfr_vaddr,
>> +               core->sfr_daddr, DMA_ATTR_WRITE_COMBINE);
>> +
>> +    core->sfr_vaddr = NULL;
>> +    core->sfr_daddr = 0;
>> +
>> +    dma_free_attrs(core->dev, sizeof(struct iris_hfi_queue_table_header),
>> +               core->iface_q_table_vaddr, core->iface_q_table_daddr,
>> +               DMA_ATTR_WRITE_COMBINE);
>> +
>> +    core->iface_q_table_vaddr = NULL;
>> +    core->iface_q_table_daddr = 0;
>> +}
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.h
>> b/drivers/media/platform/qcom/iris/iris_hfi_queue.h
>> new file mode 100644
>> index 000000000000..54994bb776f1
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.h
>> @@ -0,0 +1,175 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights
>> reserved.
>> + */
>> +
>> +#ifndef _IRIS_HFI_QUEUE_H_
>> +#define _IRIS_HFI_QUEUE_H_
>> +
>> +struct iris_core;
>> +
>> +/*
>> + * Maximum number of buffers which queue can hold until
>> + * hardware stops responding and driver times out.
>> + */
>> +#define IFACEQ_MAX_BUF_COUNT        50
> 
> Is there any reason 50 is chosen here ?
> 
> Could it be 32, 64 or another 0x10 aligned number ?
> 
This value was choosen based on experiements and obervations from the past.
But we can make it 64 as that is the MAX number of buffers v4l2 can queues
to driver at a given time.
>> +/*
>> + * Max session supported are 16.
>> + * this value is used to calcualte the size of
>> + * individual shared queue.
>> + */
>> +#define IFACE_MAX_PARALLEL_SESSIONS    16
>> +#define IFACEQ_DFLT_QHDR        0x0101
>> +#define IFACEQ_MAX_PKT_SIZE        1024 /* Maximum size of a packet in
>> the queue */
>> +
>> +/*
>> + * SFR: Subsystem Failure Reason
>> + * when hardware goes into bad state/failure, firmware fills this memory
>> + * and driver will get to know the actual failure reason from this SFR
>> buffer.
>> + */
>> +#define SFR_SIZE            SZ_4K /* Iris hardware requires 4K queue
>> alignment */
>> +
>> +#define IFACEQ_QUEUE_SIZE        (IFACEQ_MAX_PKT_SIZE * \
>> +                     IFACEQ_MAX_BUF_COUNT * IFACE_MAX_PARALLEL_SESSIONS)
>> +
>> +/*
>> + * Memory layout of the shared queues:
>> + *
>> + *   ||=================||  ^        ^         ^
>> + *   ||                 ||  |        |         |
>> + *   ||    Queue Table  || 288 Bytes |         |
>> + *   ||      Header     ||  |        |         |
>> + *   ||                 ||  |        |         |
>> + *   ||-----------------||  V        |         |
>> + *   ||-----------------||  ^        |         |
>> + *   ||                 ||  |        |         |
>> + *   ||  Command Queue  || 56 Bytes  |         |
>> + *   ||     Header      ||  |        |         |
>> + *   ||                 ||  |        |         |
>> + *   ||-----------------||  V       456 Bytes  |
>> + *   ||-----------------||  ^        |         |
>> + *   ||                 ||  |        |         |
>> + *   ||  Message Queue  || 56 Bytes  |         |
>> + *   ||     Header      ||  |        |         |
>> + *   ||                 ||  |        |         |
>> + *   ||-----------------||  V        |         Buffer size aligned to 4k
>> + *   ||-----------------||  ^        |         Overall Queue Size =
>> 2,404 KB
>> + *   ||                 ||  |        |         |
>> + *   ||   Debug Queue   || 56 Bytes  |         |
>> + *   ||     Header      ||  |        |         |
>> + *   ||                 ||  |        |         |
>> + *   ||=================||  V        V         |
>> + *   ||=================||           ^         |
>> + *   ||                 ||           |         |
>> + *   ||     Command     ||         800 KB      |
>> + *   ||      Queue      ||           |         |
>> + *   ||                 ||           |         |
>> + *   ||=================||           V         |
>> + *   ||=================||           ^         |
>> + *   ||                 ||           |         |
>> + *   ||     Message     ||         800 KB      |
>> + *   ||      Queue      ||           |         |
>> + *   ||                 ||           |         |
>> + *   ||=================||           V         |
>> + *   ||=================||           ^         |
>> + *   ||                 ||           |         |
>> + *   ||      Debug      ||         800 KB      |
>> + *   ||      Queue      ||           |         |
>> + *   ||                 ||           |         |
>> + *   ||=================||           V         |
>> + *   ||                 ||                     |
>> + *   ||=================||                     V
>> + */
>> +
>> +/*
>> + * Shared queues are used for communication between driver and firmware.
>> + * There are 3 types of queues:
>> + * Command queue - driver to write any command to firmware.
>> + * Message queue - firmware to send any response to driver.
>> + * Debug queue - firmware to write debug message.
>> + */
>> +
>> +/* Host-firmware shared queue ids */
>> +enum iris_iface_queue {
>> +    IFACEQ_CMDQ_ID,
>> +    IFACEQ_MSGQ_ID,
>> +    IFACEQ_DBGQ_ID,
>> +    IFACEQ_NUMQ, /* not an index */
>> +};
>> +
>> +/**
>> + * struct iris_hfi_queue_header
>> + *
>> + * @status: Queue status, qhdr_state define possible status
>> + * @start_addr: Queue start address in non cached memory
>> + * @type: qhdr_tx, qhdr_rx, qhdr_q_id and priority defines qhdr type
>> + * @q_size: Queue size
>> + *        Number of queue packets if pkt_size is non-zero
>> + *        Queue size in bytes if pkt_size is zero
>> + * @pkt_size: Size of queue packet entries
>> + *        0x0: variable queue packet size
>> + *        non zero: size of queue packet entry, fixed
>> + * @pkt_drop_cnt: Number of packets dropped by sender
>> + * @rx_wm: Receiver watermark, applicable in event driven mode
>> + * @tx_wm: Sender watermark, applicable in event driven mode
>> + * @rx_req: Receiver sets this bit if queue is empty
>> + * @tx_req: Sender sets this bit if queue is full
>> + * @rx_irq_status: Receiver sets this bit and triggers an interrupt to
>> + *        the sender after packets are dequeued. Sender clears this bit
>> + * @tx_irq_status: Sender sets this bit and triggers an interrupt to
>> + *        the receiver after packets are queued. Receiver clears this bit
>> + * @read_idx: Index till where receiver has consumed the packets from
>> the queue.
>> + * @write_idx: Index till where sender has written the packets into the
>> queue.
>> + */
>> +struct iris_hfi_queue_header {
>> +    u32 status;
>> +    u32 start_addr;
>> +    u16 queue_type;
>> +    u16 header_type;
>> +    u32 q_size;
>> +    u32 pkt_size;
>> +    u32 pkt_drop_cnt;
>> +    u32 rx_wm;
>> +    u32 tx_wm;
>> +    u32 rx_req;
>> +    u32 tx_req;
>> +    u32 rx_irq_status;
>> +    u32 tx_irq_status;
>> +    u32 read_idx;
>> +    u32 write_idx;
>> +};
>> +
>> +/**
>> + * struct iris_hfi_queue_table_header
>> + *
>> + * @version: Queue table version number
>> + * @size: Queue table size from version to last parametr in qhdr entry
>> + * @qhdr0_offset: Offset to the start of first qhdr
>> + * @qhdr_size: Queue header size in bytes
>> + * @num_q: Total number of queues in Queue table
>> + * @num_active_q: Total number of active queues
>> + * @device_addr: Device address of the queue
>> + * @name: Queue name in characters
>> + */
>> +struct iris_hfi_queue_table_header {
>> +    u32 version;
>> +    u32 size;
>> +    u32 qhdr0_offset;
>> +    u32 qhdr_size;
>> +    u32 num_q;
>> +    u32 num_active_q;
>> +    void *device_addr;
>> +    char name[256]; /* NUL-terminated array of characters */
>> +    struct iris_hfi_queue_header q_hdr[IFACEQ_NUMQ];
>> +};
>> +
>> +struct iris_iface_q_info {
>> +    struct iris_hfi_queue_header *qhdr;
>> +    dma_addr_t    device_addr;
>> +    void        *kernel_vaddr;
>> +};
>> +
>> +int iris_hfi_queues_init(struct iris_core *core);
>> +void iris_hfi_queues_deinit(struct iris_core *core);
>> +
>> +#endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index b3a2903698ff..dac64ec4bf03 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -31,6 +31,7 @@ struct iris_platform_data {
>>       unsigned int clk_tbl_size;
>>       const char * const *clk_rst_tbl;
>>       unsigned int clk_rst_tbl_size;
>> +    u64 dma_mask;
>>   };
>>     #endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> index dba8d3c22ce5..9b305b8e2110 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> @@ -36,4 +36,5 @@ struct iris_platform_data sm8550_data = {
>>       .opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>>       .clk_tbl = sm8550_clk_table,
>>       .clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
>> +    .dma_mask = GENMASK(31, 29) - 1,
>>   };
>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c
>> b/drivers/media/platform/qcom/iris/iris_probe.c
>> index ce16d894c809..0d858c7b015f 100644
>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>> @@ -168,15 +168,21 @@ static void iris_remove(struct platform_device *pdev)
>>       if (!core)
>>           return;
>>   +    iris_core_deinit(core);
>> +
>>       video_unregister_device(core->vdev_dec);
>>         v4l2_device_unregister(&core->v4l2_dev);
>> +
>> +    mutex_destroy(&core->lock);
>> +    core->state = IRIS_CORE_DEINIT;
> 
> This setting of the state is redundant, you've already set the state @
> iris_core_deinit();
Right, will fix.

Thanks,
Dikshita
> 
> ---
> bod

