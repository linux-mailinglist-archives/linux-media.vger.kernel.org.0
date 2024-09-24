Return-Path: <linux-media+bounces-18491-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A39D798409E
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 10:37:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66B75281C6C
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 08:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B7DF14F12D;
	Tue, 24 Sep 2024 08:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="W1GV9CO/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F7B1FB4;
	Tue, 24 Sep 2024 08:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727167042; cv=none; b=I4x6cmBsaZn7DZLeH4Zr1VPLjgGSe90d1GqpgAOLY+pU5pYxucas4diUBYj+T8gSNrbGIcylsyGArZCOtJRmbigRmxA0VmRwhgvj6uImVGQhd644AInh4mSzHsT06VGhCls1L4rOeGMZ4BGV2zFBU28k2I/5vg5c9UK93C6nz4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727167042; c=relaxed/simple;
	bh=Pe3pVF25/lxtU2W2xL43BEs3uV9Mc5GW2csRnndcuCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PTcIjooxqWfEVYm9uu047Rrs6P3W5xQkzJcMFsgVB34Xs64Aj5t7EgABZDD46g3N7tJFN4Sma+DXMf5KeF5qkLFBIrGY6WEWWEnVa5dyjoTyULVlgkIvruCm3e5kK3XU8hQVfutkwAJA44Dc7i4RvTQFY/nani7kS4XLN9Xyp9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=W1GV9CO/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48NMbrv3002210;
	Tue, 24 Sep 2024 08:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tvyQTrAtCTV/IHLMvn7hPwdjxCW23gZ2/+nJbTyrmrM=; b=W1GV9CO/yQmlya0c
	KIkgai0iqZApO2JGEoqHiDiki60+lcRnhIgnaIlVaplPCo0qMZZw+mBEj5KOTccr
	32X7cImJazYnwlZQzXGgLDW2E9mLI1FeNXUiL71hhCCicQpxWKudF/5XlQhA2kxO
	QNKUwLRsT0XfclRRcYiTaOJ2843OAUdbnl7UklWCYlK0jKXfrjSft1f0gtcBPUI/
	kxX1bEloZPyLH9ZqfLiSv95bwbKy1gxqjZWPd1cuFRNHPj8FqBgdkh3Fs6IeDub5
	hXNxwB/ZjrDYHssUAKAZBApjwr7NWkPyDNmkE5UO/ff9eKbwR/M/Tm2reQV8Lz+8
	n5CGXQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sn5bquwg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 08:37:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48O8b3Pe021864
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 08:37:03 GMT
Received: from [10.204.101.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Sep
 2024 01:36:59 -0700
Message-ID: <5f27cf8f-6246-3e18-ac3a-680eef98a9b6@quicinc.com>
Date: Tue, 24 Sep 2024 14:06:41 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 10/29] media: iris: implement power management
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
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-10-c5fdbbe65e70@quicinc.com>
 <d3679f2f-f177-494e-b68d-2a67b423d0cb@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <d3679f2f-f177-494e-b68d-2a67b423d0cb@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: R-k_a3L5_bn9FbDWRXILqW5Q9qa-hTr9
X-Proofpoint-GUID: R-k_a3L5_bn9FbDWRXILqW5Q9qa-hTr9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240059



On 9/5/2024 6:53 PM, Bryan O'Donoghue wrote:
> On 27/08/2024 11:05, Dikshita Agarwal via B4 Relay wrote:
>> From: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>
>> Implement runtime power management for iris including
>> platform specific power on/off sequence.
>>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> 
>> +int iris_hfi_pm_suspend(struct iris_core *core)
>> +{
>> +    int ret;
>> +
>> +    if (!mutex_is_locked(&core->lock))
>> +        return -EINVAL;
>> +
>> +    if (core->state != IRIS_CORE_INIT)
>> +        return -EINVAL;
> 
> Reiterating a previous point
> 
> Are these checks realistic or defensive coding ?
This state check is needed here, since its a delayed autosuspend work and
sys error handler from the reverse thread can move the state to core deinit
state anytime.
>> +
>> +    if (!core->power_enabled) {
>> +        dev_err(core->dev, "power not enabled\n");
>> +        return 0;
>> +    }
> 
> Similarly is this a real check an error that can happen and if so how ?
> 
We can remove this check from here.
>> +
>> +    ret = iris_vpu_prepare_pc(core);
>> +    if (ret) {
>> +        dev_err(core->dev, "prepare pc ret %d\n", ret);
>> +        pm_runtime_mark_last_busy(core->dev);
>> +        return -EAGAIN;
>> +    }
>> +
>> +    ret = iris_set_hw_state(core, false);
>> +    if (ret)
>> +        return ret;
>> +
>> +    iris_power_off(core);
>> +
>> +    return 0;
>> +}
>> +
>> +int iris_hfi_pm_resume(struct iris_core *core)
>> +{
>> +    const struct iris_hfi_command_ops *ops;
>> +    int ret;
>> +
>> +    ops = core->hfi_ops;
>> +
>> +    ret = iris_power_on(core);
>> +    if (ret)
>> +        goto error;
>> +
>> +    ret = iris_set_hw_state(core, true);
>> +    if (ret)
>> +        goto err_power_off;
>> +
>> +    ret = iris_vpu_boot_firmware(core);
>> +    if (ret)
>> +        goto err_suspend_hw;
>> +
>> +    ret = ops->sys_interframe_powercollapse(core);
>> +    if (ret)
>> +        goto err_suspend_hw;
>> +
>> +    return 0;
>> +
>> +err_suspend_hw:
>> +    iris_set_hw_state(core, false);
>> +err_power_off:
>> +    iris_power_off(core);
>> +error:
>> +    dev_err(core->dev, "failed to resume\n");
>> +
>> +    return -EBUSY;
>> +}
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h
>> b/drivers/media/platform/qcom/iris/iris_hfi_common.h
>> index c3d5b899cf60..e050b1ae90fe 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
>> @@ -46,6 +46,7 @@ struct iris_hfi_command_ops {
>>       int (*sys_init)(struct iris_core *core);
>>       int (*sys_image_version)(struct iris_core *core);
>>       int (*sys_interframe_powercollapse)(struct iris_core *core);
>> +    int (*sys_pc_prep)(struct iris_core *core);
>>   };
>>     struct iris_hfi_response_ops {
>> @@ -53,6 +54,8 @@ struct iris_hfi_response_ops {
>>   };
>>     int iris_hfi_core_init(struct iris_core *core);
>> +int iris_hfi_pm_suspend(struct iris_core *core);
>> +int iris_hfi_pm_resume(struct iris_core *core);
>>     irqreturn_t iris_hfi_isr(int irq, void *data);
>>   irqreturn_t iris_hfi_isr_handler(int irq, void *data);
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> index 8f045ef56163..e778ae33b953 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> @@ -56,10 +56,21 @@ static int
>> iris_hfi_gen1_sys_interframe_powercollapse(struct iris_core *core)
>>       return ret;
>>   }
>>   +static int iris_hfi_gen1_sys_pc_prep(struct iris_core *core)
>> +{
>> +    struct hfi_sys_pc_prep_pkt pkt;
>> +
>> +    pkt.hdr.size = sizeof(struct hfi_sys_pc_prep_pkt);
>> +    pkt.hdr.pkt_type = HFI_CMD_SYS_PC_PREP;
>> +
>> +    return iris_hfi_queue_cmd_write_locked(core, &pkt, pkt.hdr.size);
>> +}
>> +
>>   static const struct iris_hfi_command_ops iris_hfi_gen1_command_ops = {
>>       .sys_init = iris_hfi_gen1_sys_init,
>>       .sys_image_version = iris_hfi_gen1_sys_image_version,
>>       .sys_interframe_powercollapse =
>> iris_hfi_gen1_sys_interframe_powercollapse,
>> +    .sys_pc_prep = iris_hfi_gen1_sys_pc_prep,
>>   };
>>     void iris_hfi_gen1_command_ops_init(struct iris_core *core)
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
>> index 5c07d6a29863..991d5a5dc792 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
>> @@ -12,6 +12,7 @@
>>   #define HFI_ERR_NONE                    0x0
>>     #define HFI_CMD_SYS_INIT                0x10001
>> +#define HFI_CMD_SYS_PC_PREP                0x10002
>>   #define HFI_CMD_SYS_SET_PROPERTY            0x10005
>>   #define HFI_CMD_SYS_GET_PROPERTY            0x10006
>>   @@ -48,6 +49,10 @@ struct hfi_sys_get_property_pkt {
>>       u32 data;
>>   };
>>   +struct hfi_sys_pc_prep_pkt {
>> +    struct hfi_pkt_hdr hdr;
>> +};
>> +
>>   struct hfi_msg_event_notify_pkt {
>>       struct hfi_pkt_hdr hdr;
>>       u32 event_id;
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> index 807266858d93..0871c0bdea90 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> @@ -66,10 +66,30 @@ static int
>> iris_hfi_gen2_sys_interframe_powercollapse(struct iris_core *core)
>>       return ret;
>>   }
>>   +static int iris_hfi_gen2_sys_pc_prep(struct iris_core *core)
>> +{
>> +    struct iris_hfi_header *hdr;
>> +    u32 packet_size;
>> +    int ret;
>> +
>> +    packet_size = sizeof(*hdr) + sizeof(struct iris_hfi_packet);
>> +    hdr = kzalloc(packet_size, GFP_KERNEL);
>> +    if (!hdr)
>> +        return -ENOMEM;
>> +
>> +    iris_hfi_gen2_packet_sys_pc_prep(core, hdr);
>> +    ret = iris_hfi_queue_cmd_write_locked(core, hdr, hdr->size);
>> +
>> +    kfree(hdr);
>> +
>> +    return ret;
>> +}
>> +
>>   static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
>>       .sys_init = iris_hfi_gen2_sys_init,
>>       .sys_image_version = iris_hfi_gen2_sys_image_version,
>>       .sys_interframe_powercollapse =
>> iris_hfi_gen2_sys_interframe_powercollapse,
>> +    .sys_pc_prep = iris_hfi_gen2_sys_pc_prep,
>>   };
>>     void iris_hfi_gen2_command_ops_init(struct iris_core *core)
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> index 3e3e4ddfe21f..4104479c7251 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> @@ -12,6 +12,7 @@
>>     #define HFI_CMD_BEGIN                0x01000000
>>   #define HFI_CMD_INIT                0x01000001
>> +#define HFI_CMD_POWER_COLLAPSE            0x01000002
>>   #define HFI_CMD_END                0x01FFFFFF
>>     #define HFI_PROP_BEGIN                0x03000000
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
>> index 8266eae5ff94..9ea26328a300 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
>> @@ -162,3 +162,16 @@ void
>> iris_hfi_gen2_packet_sys_interframe_powercollapse(struct iris_core *core,
>>                       &payload,
>>                       sizeof(u32));
>>   }
>> +
>> +void iris_hfi_gen2_packet_sys_pc_prep(struct iris_core *core, struct
>> iris_hfi_header *hdr)
>> +{
>> +    iris_hfi_gen2_create_header(hdr, 0 /*session_id*/, core->header_id++);
>> +
>> +    iris_hfi_gen2_create_packet(hdr,
>> +                    HFI_CMD_POWER_COLLAPSE,
>> +                    HFI_HOST_FLAGS_NONE,
>> +                    HFI_PAYLOAD_NONE,
>> +                    HFI_PORT_NONE,
>> +                    core->packet_id++,
>> +                    NULL, 0);
>> +}
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
>> index eba109efeb76..163295783b7d 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
>> @@ -65,5 +65,6 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core
>> *core, struct iris_hfi_heade
>>   void iris_hfi_gen2_packet_image_version(struct iris_core *core, struct
>> iris_hfi_header *hdr);
>>   void iris_hfi_gen2_packet_sys_interframe_powercollapse(struct iris_core
>> *core,
>>                                  struct iris_hfi_header *hdr);
>> +void iris_hfi_gen2_packet_sys_pc_prep(struct iris_core *core, struct
>> iris_hfi_header *hdr);
>>     #endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
>> b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
>> index b24d4640fea9..3a511d5e5cfc 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
>> @@ -3,6 +3,8 @@
>>    * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights
>> reserved.
>>    */
>>   +#include <linux/pm_runtime.h>
>> +
>>   #include "iris_core.h"
>>   #include "iris_hfi_queue.h"
>>   #include "iris_vpu_common.h"
>> @@ -145,13 +147,27 @@ int iris_hfi_queue_cmd_write(struct iris_core
>> *core, void *pkt, u32 pkt_size)
>>   {
>>       int ret;
>>   +    ret = pm_runtime_resume_and_get(core->dev);
>> +    if (ret < 0)
>> +        goto exit;
>> +
>>       mutex_lock(&core->lock);
>>       ret = iris_hfi_queue_cmd_write_locked(core, pkt, pkt_size);
>> -    if (ret)
>> +    if (ret) {
>>           dev_err(core->dev, "iris_hfi_queue_cmd_write_locked failed with
>> %d\n", ret);
>> -
>> +        mutex_unlock(&core->lock);
>> +        goto exit;
>> +    }
>>       mutex_unlock(&core->lock);
>>   +    pm_runtime_mark_last_busy(core->dev);
>> +    pm_runtime_put_autosuspend(core->dev);
>> +
>> +    return 0;
>> +
>> +exit:
>> +    pm_runtime_put_sync(core->dev);
>> +
>>       return ret;
>>   }
>>   diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index 4577977f9f8c..899a696a931d 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -8,6 +8,7 @@
>>     #define IRIS_PAS_ID                9
>>   #define HW_RESPONSE_TIMEOUT_VALUE               (1000) /* milliseconds */
>> +#define AUTOSUSPEND_DELAY_VALUE            (HW_RESPONSE_TIMEOUT_VALUE +
>> 500) /* milliseconds */
>>     extern struct iris_platform_data sm8550_data;
>>   extern struct iris_platform_data sm8250_data;
>> @@ -40,10 +41,22 @@ struct ubwc_config_data {
>>       u32    bank_spreading;
>>   };
>>   +struct iris_core_power {
>> +    u64 clk_freq;
>> +    u64 icc_bw;
>> +};
>> +
>> +enum platform_pm_domain_type {
>> +    IRIS_CTRL_POWER_DOMAIN,
>> +    IRIS_HW_POWER_DOMAIN,
>> +};
>> +
>>   struct iris_platform_data {
>>       void (*init_hfi_command_ops)(struct iris_core *core);
>>       void (*init_hfi_response_ops)(struct iris_core *core);
>>       struct iris_inst *(*get_instance)(void);
>> +    const struct vpu_ops *vpu_ops;
>> +    void (*set_preset_registers)(struct iris_core *core);
>>       const struct icc_info *icc_tbl;
>>       unsigned int icc_tbl_size;
>>       const char * const *pmdomain_tbl;
>> @@ -61,6 +74,7 @@ struct iris_platform_data {
>>       u32 core_arch;
>>       u32 hw_response_timeout;
>>       struct ubwc_config_data *ubwc_config;
>> +    u32 num_vpp_pipe;
>>   };
>>     #endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
>> b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
>> index b83665a9c5a2..1adbafa373a5 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
>> @@ -7,6 +7,12 @@
>>   #include "iris_platform_common.h"
>>   #include "iris_resources.h"
>>   #include "iris_hfi_gen1.h"
>> +#include "iris_vpu_common.h"
>> +
>> +static void iris_set_sm8250_preset_registers(struct iris_core *core)
>> +{
>> +    writel(0x0, core->reg_base + 0xB0088);
>> +}
>>     static const struct icc_info sm8250_icc_table[] = {
>>       { "cpu-cfg",    1000, 1000     },
>> @@ -36,6 +42,8 @@ struct iris_platform_data sm8250_data = {
>>       .get_instance = iris_hfi_gen1_get_instance,
>>       .init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
>>       .init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
>> +    .vpu_ops = &iris_vpu2_ops,
>> +    .set_preset_registers = iris_set_sm8250_preset_registers,
>>       .icc_tbl = sm8250_icc_table,
>>       .icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
>>       .clk_rst_tbl = sm8250_clk_reset_table,
>> @@ -51,4 +59,5 @@ struct iris_platform_data sm8250_data = {
>>       .pas_id = IRIS_PAS_ID,
>>       .tz_cp_config_data = &tz_cp_config_sm8250,
>>       .hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>> +    .num_vpp_pipe = 4,
>>   };
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> index 91bfc0fa0989..950ccdccde31 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> @@ -7,9 +7,15 @@
>>   #include "iris_hfi_gen2.h"
>>   #include "iris_platform_common.h"
>>   #include "iris_resources.h"
>> +#include "iris_vpu_common.h"
>>     #define VIDEO_ARCH_LX 1
>>   +static void iris_set_sm8550_preset_registers(struct iris_core *core)
>> +{
>> +    writel(0x0, core->reg_base + 0xB0088);
>> +}
>> +
>>   static const struct icc_info sm8550_icc_table[] = {
>>       { "cpu-cfg",    1000, 1000     },
>>       { "video-mem",  1000, 15000000 },
>> @@ -48,6 +54,8 @@ struct iris_platform_data sm8550_data = {
>>       .get_instance = iris_hfi_gen2_get_instance,
>>       .init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>>       .init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>> +    .vpu_ops = &iris_vpu3_ops,
>> +    .set_preset_registers = iris_set_sm8550_preset_registers,
>>       .icc_tbl = sm8550_icc_table,
>>       .icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
>>       .clk_rst_tbl = sm8550_clk_reset_table,
>> @@ -65,4 +73,5 @@ struct iris_platform_data sm8550_data = {
>>       .core_arch = VIDEO_ARCH_LX,
>>       .hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>>       .ubwc_config = &ubwc_config_sm8550,
>> +    .num_vpp_pipe = 4,
>>   };
>> diff --git a/drivers/media/platform/qcom/iris/iris_power.c
>> b/drivers/media/platform/qcom/iris/iris_power.c
>> new file mode 100644
>> index 000000000000..e697c27c8a8a
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_power.c
>> @@ -0,0 +1,35 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights
>> reserved.
>> + */
>> +
>> +#include "iris_core.h"
>> +#include "iris_power.h"
>> +#include "iris_vpu_common.h"
>> +
>> +void iris_power_off(struct iris_core *core)
>> +{
>> +    if (!core->power_enabled)
>> +        return;
> 
> <snip>
> 
>> +
>> +int iris_power_on(struct iris_core *core)
>> +{
>> +    int ret;
>> +
>> +    if (core->power_enabled)
>> +        return 0;
> 
> When do you call either of these functions without the state already being
> known ?
> 
> You're guarding against reentrancy - but are these functions reentrant in
> your logic ?
> 
> If not then the checks are redundant.
> 
Sure, We can remove core->power_enabled check from all the places.
>> +}
>> diff --git a/drivers/media/platform/qcom/iris/iris_power.h
>> b/drivers/media/platform/qcom/iris/iris_power.h
>> new file mode 100644
>> index 000000000000..ff9b6be3b086
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_power.h
>> @@ -0,0 +1,14 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights
>> reserved.
>> + */
>> +
>> +#ifndef _IRIS_POWER_H_
>> +#define _IRIS_POWER_H_
>> +
>> +struct iris_core;
>> +
>> +int iris_power_on(struct iris_core *core);
>> +void iris_power_off(struct iris_core *core);
>> +
>> +#endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c
>> b/drivers/media/platform/qcom/iris/iris_probe.c
>> index ecf1a50be63b..3222e9116551 100644
>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>> @@ -4,6 +4,7 @@
>>    */
>>     #include <linux/module.h>
>> +#include <linux/pm_runtime.h>
>>     #include "iris_core.h"
>>   #include "iris_vidc.h"
>> @@ -111,17 +112,25 @@ static int iris_probe(struct platform_device *pdev)
>>       if (core->irq < 0)
>>           return core->irq;
>>   +    pm_runtime_set_autosuspend_delay(core->dev, AUTOSUSPEND_DELAY_VALUE);
>> +    pm_runtime_use_autosuspend(core->dev);
>> +    ret = devm_pm_runtime_enable(core->dev);
>> +    if (ret) {
>> +        dev_err(core->dev, "failed to enable runtime pm\n");
>> +        goto err_runtime_disable;
>> +    }
>> +
>>       ret = iris_init_isr(core);
>>       if (ret) {
>>           dev_err_probe(core->dev, ret, "Failed to init isr\n");
>> -        return ret;
>> +        goto err_runtime_disable;
>>       }
>>         core->iris_platform_data = of_device_get_match_data(core->dev);
>>       if (!core->iris_platform_data) {
>>           ret = -ENODEV;
>>           dev_err_probe(core->dev, ret, "init platform failed\n");
>> -        return ret;
>> +        goto err_runtime_disable;
>>       }
>>         iris_init_ops(core);
>> @@ -131,12 +140,12 @@ static int iris_probe(struct platform_device *pdev)
>>       ret = iris_init_resources(core);
>>       if (ret) {
>>           dev_err_probe(core->dev, ret, "init resource failed\n");
>> -        return ret;
>> +        goto err_runtime_disable;
>>       }
>>         ret = v4l2_device_register(dev, &core->v4l2_dev);
>>       if (ret)
>> -        return ret;
>> +        goto err_runtime_disable;
>>         ret = iris_register_video_device(core);
>>       if (ret)
>> @@ -159,10 +168,58 @@ static int iris_probe(struct platform_device *pdev)
>>       video_unregister_device(core->vdev_dec);
>>   err_v4l2_unreg:
>>       v4l2_device_unregister(&core->v4l2_dev);
>> +err_runtime_disable:
>> +    pm_runtime_set_suspended(core->dev);
>> +
>> +    return ret;
>> +}
>> +
>> +static int iris_pm_suspend(struct device *dev)
>> +{
>> +    struct iris_core *core;
>> +    int ret;
>> +
>> +    if (!dev || !dev->driver)
>> +        return 0;
> 
> Why/when/how ?
> 
> :g/Zap redundant checks///g
I agree, not needed, will remove these checks.
> 
> ---
> bod

