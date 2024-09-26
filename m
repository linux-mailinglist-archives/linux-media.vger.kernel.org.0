Return-Path: <linux-media+bounces-18618-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C6F9871F4
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 12:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABA8F28BD93
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 10:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C90F1AD9E2;
	Thu, 26 Sep 2024 10:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CCu4k1XX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258231F95C;
	Thu, 26 Sep 2024 10:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727347702; cv=none; b=pcXaC8dUjuhQQuGpGVgQsiW7ukl8S5tFzf2m9/fn7MXGgqcby8o7/bxH5Xaajaz6c48CbdN5mcJIM5+H2b3+eCzp/qLJNkb+GwFIFnfSZhAdNAfE7RVzoYI3krdGOhcIsgs/yxXg5xfgdBcIYDKA89/mVM4Di0vrpzP73VUHDQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727347702; c=relaxed/simple;
	bh=0E6dV4hXT8EAIrFLvZB25w9mFGK0em9xFm4ZB2pBZxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rPXXizmFH9k/ftecHpxVqfEs+4ci3JGZ2ZXA218+ECETgjMmx4fDPrphkDkO1BH/UbtHa/EaNiXz9RIbsN9vZNi+oOIvTi7sXAKTYlfoOHmTu3nIHLtHe7ik0ETbX9EqnKasaux3I8vQYJ3ZcLkkJqZ+sdfFYvO24rv9iwLXhO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CCu4k1XX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48Q7X9Qg027668;
	Thu, 26 Sep 2024 10:48:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z7RVMgPf6rJIp+R//+JUBSfCRO68AP4/X/MdhaZ+6dM=; b=CCu4k1XXXMcBMxZg
	Al3QFi0Vw5+pDKk+4d21b+Xqlw6jRi2nJp2kBTnQUIAR3eXOjyHkO3uHVsCeckYt
	CAcDbSdFMlwIL0VSBR6JccM14kSiVc9Y+TH31MLtKdPn+UqK7IyhJLybLR31e5ml
	7Q7vz+x1zyhDZX4DmQWceKRBptpOenji7slgaxUga8HW/glPhHknPWmxk2boS1F7
	GitPZ4qiYF3jGYztLuu/pFIeiwMkvXvKDVpsI80EDuw96Cm54vqEpGHG185HcpKe
	wOQP2KlE8GcScndp3njz7GmmgcxdakaC+toFMzINd0odZWKbn6LTe84yS6LR+u8d
	Txariw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41spc2y37g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 10:48:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48QAm0Rr024695
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 10:48:00 GMT
Received: from [10.216.19.58] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 26 Sep
 2024 03:47:55 -0700
Message-ID: <40aab9ff-5b5a-3da9-bf82-558de9597036@quicinc.com>
Date: Thu, 26 Sep 2024 16:17:52 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 11/29] media: iris: implement reqbuf ioctl with
 vb2_queue_setup
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
 <20240827-iris_v3-v3-11-c5fdbbe65e70@quicinc.com>
 <fe16671f-0fd8-4c21-a6ee-7e821b6316ce@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <fe16671f-0fd8-4c21-a6ee-7e821b6316ce@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sTHGdAn1tUnEDpEUKmstiKGQI3b-eloM
X-Proofpoint-ORIG-GUID: sTHGdAn1tUnEDpEUKmstiKGQI3b-eloM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409260072



On 9/6/2024 6:20 PM, Bryan O'Donoghue wrote:
> On 27/08/2024 11:05, Dikshita Agarwal via B4 Relay wrote:
>> From: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>
>> Implement reqbuf IOCTL op and vb2_queue_setup vb2 op
>> in the driver with necessary hooks.
>>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
> 
>> +/*
>> + * NV12:
>> + * YUV 4:2:0 image with a plane of 8 bit Y samples followed
>> + * by an interleaved U/V plane containing 8 bit 2x2 subsampled
>> + * colour difference samples.
>> + *
>> + * <-------- Y/UV_Stride -------->
>> + * <------- Width ------->
>> + * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  ^           ^
>> + * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
>> + * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  Height      |
>> + * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |          y_scanlines
>> + * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
>> + * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
>> + * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
>> + * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  V           |
>> + * . . . . . . . . . . . . . . . .              |
>> + * . . . . . . . . . . . . . . . .              |
>> + * . . . . . . . . . . . . . . . .              |
>> + * . . . . . . . . . . . . . . . .              V
>> + * U V U V U V U V U V U V . . . .  ^
>> + * U V U V U V U V U V U V . . . .  |
>> + * U V U V U V U V U V U V . . . .  |
>> + * U V U V U V U V U V U V . . . .  uv_scanlines
>> + * . . . . . . . . . . . . . . . .  |
>> + * . . . . . . . . . . . . . . . .  V
>> + * . . . . . . . . . . . . . . . .  --> Buffer size alignment
> 
> Nice
> 
>> + *
>> + * y_stride : Width aligned to 128
>> + * uv_stride : Width aligned to 128
>> + * y_scanlines: Height aligned to 32
>> + * uv_scanlines: Height/2 aligned to 16
>> + * Total size = align((y_stride * y_scanlines
>> + *          + uv_stride * uv_scanlines , 4096)
>> + */
>> +static u32 iris_output_buffer_size_nv12(struct iris_inst *inst)
>> +{
>> +    u32 y_plane, uv_plane, y_stride, uv_stride, y_scanlines, uv_scanlines;
>> +    struct v4l2_format *f;
>> +
>> +    f = inst->fmt_dst;
>> +    y_stride = ALIGN(f->fmt.pix_mp.width, 128);
>> +    uv_stride = ALIGN(f->fmt.pix_mp.width, 128);
>> +    y_scanlines = ALIGN(f->fmt.pix_mp.height, 32);
>> +    uv_scanlines = ALIGN((f->fmt.pix_mp.height + 1) >> 1, 16);
>> +    y_plane = y_stride * y_scanlines;
>> +    uv_plane = uv_stride * uv_scanlines;
>> +
>> +    return ALIGN(y_plane + uv_plane, PIXELS_4K);
>> +}
>> +
>> +static u32 iris_input_buffer_size(struct iris_inst *inst)
>> +{
>> +    u32 base_res_mbs = NUM_MBS_4K;
>> +    u32 frame_size, num_mbs;
>> +    u32 div_factor;
>> +
>> +    num_mbs = iris_get_mbpf(inst);
>> +    if (num_mbs > NUM_MBS_4K) {
>> +        div_factor = 4;
>> +        base_res_mbs = BASE_RES_MB_MAX;
>> +    } else {
>> +        base_res_mbs = NUM_MBS_4K;
>> +        div_factor = 2;
>> +    }
>> +
>> +    /*
>> +     * frame_size = YUVsize / div_factor
>> +     * where YUVsize = resolution_in_MBs * MBs_in_pixel * 3 / 2
>> +     */
>> +
>> +    frame_size = base_res_mbs * (16 * 16) * 3 / 2 / div_factor;
>> +
>> +    return ALIGN(frame_size, PIXELS_4K);
>> +}
>> +
>> +int iris_get_buffer_size(struct iris_inst *inst,
>> +             enum iris_buffer_type buffer_type)
>> +{
>> +    switch (buffer_type) {
>> +    case BUF_INPUT:
>> +        return iris_input_buffer_size(inst);
>> +    case BUF_OUTPUT:
>> +        return iris_output_buffer_size_nv12(inst);
>> +    default:
>> +        return 0;
>> +    }
>> +}
>> +
>> +void iris_vb2_queue_error(struct iris_inst *inst)
>> +{
>> +    struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
>> +    struct vb2_queue *q;
>> +
>> +    q = v4l2_m2m_get_src_vq(m2m_ctx);
>> +    vb2_queue_error(q);
>> +    q = v4l2_m2m_get_dst_vq(m2m_ctx);
>> +    vb2_queue_error(q);
>> +}
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h
>> b/drivers/media/platform/qcom/iris/iris_buffer.h
>> new file mode 100644
>> index 000000000000..98844e89e0e3
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.h
>> @@ -0,0 +1,107 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights
>> reserved.
>> + */
>> +
>> +#ifndef _IRIS_BUFFER_H_
>> +#define _IRIS_BUFFER_H_
>> +
>> +#include <media/videobuf2-v4l2.h>
>> +
>> +struct iris_inst;
>> +
>> +#define to_iris_buffer(ptr)    container_of(ptr, struct iris_buffer, vb2)
>> +
>> +/**
>> + * enum iris_buffer_type
>> + *
>> + * BUF_INPUT: input buffer to the iris hardware
>> + * BUF_OUTPUT: output buffer from the iris hardware
>> + * BUF_BIN: buffer to store intermediate bin data
>> + * BUF_ARP: buffer for auto register programming
>> + * BUF_COMV: buffer to store colocated motion vectors
>> + * BUF_NON_COMV: buffer to hold config data for HW
>> + * BUF_LINE: buffer to store decoding/encoding context data for HW
>> + * BUF_DPB: buffer to store display picture buffers for reference
>> + * BUF_PERSIST: buffer to store session context data
>> + * BUF_SCRATCH_1: buffer to store decoding/encoding context data for HW
>> + */
>> +enum iris_buffer_type {
>> +    BUF_INPUT = 1,
>> +    BUF_OUTPUT,
>> +    BUF_BIN,
>> +    BUF_ARP,
>> +    BUF_COMV,
>> +    BUF_NON_COMV,
>> +    BUF_LINE,
>> +    BUF_DPB,
>> +    BUF_PERSIST,
>> +    BUF_SCRATCH_1,
>> +    BUF_TYPE_MAX,
>> +};
>> +
>> +/*
>> + * enum iris_buffer_attributes
>> + *
>> + * BUF_ATTR_DEFERRED: buffer queued by client but not submitted to
>> firmware.
>> + * BUF_ATTR_PENDING_RELEASE: buffers requested to be released from
>> firmware.
>> + * BUF_ATTR_QUEUED: buffers submitted to firmware.
>> + * BUF_ATTR_DEQUEUED: buffers received from firmware.
>> + * BUF_ATTR_BUFFER_DONE: buffers sent back to vb2.
>> + */
>> +enum iris_buffer_attributes {
>> +    BUF_ATTR_DEFERRED        = BIT(0),
>> +    BUF_ATTR_PENDING_RELEASE    = BIT(1),
>> +    BUF_ATTR_QUEUED            = BIT(2),
>> +    BUF_ATTR_DEQUEUED        = BIT(3),
>> +    BUF_ATTR_BUFFER_DONE        = BIT(4),
>> +};
>> +
>> +/**
>> + * struct iris_buffer
>> + *
>> + * @vb2: v4l2 vb2 buffer
>> + * @list: list head for the iris_buffers structure
>> + * @inst: iris instance structure
>> + * @type: enum for type of iris buffer
>> + * @index: identifier for the iris buffer
>> + * @fd: file descriptor of the buffer
>> + * @buffer_size: accessible buffer size in bytes starting from addr_offset
>> + * @data_offset: accessible buffer offset from base address
>> + * @data_size: data size in bytes
>> + * @device_addr: device address of the buffer
>> + * @kvaddr: kernel virtual address of the buffer
>> + * @dma_attrs: dma attributes
>> + * @flags: buffer flags. It is represented as bit masks.
>> + * @timestamp: timestamp of the buffer in nano seconds (ns)
>> + * @attr: enum for iris buffer attributes
>> + */
>> +struct iris_buffer {
>> +    struct vb2_v4l2_buffer        vb2;
>> +    struct list_head        list;
>> +    struct iris_inst        *inst;
>> +    enum iris_buffer_type        type;
>> +    u32                index;
>> +    int                fd;
>> +    size_t                buffer_size;
>> +    u32                data_offset;
>> +    size_t                data_size;
>> +    dma_addr_t            device_addr;
>> +    void                *kvaddr;
>> +    unsigned long            dma_attrs;
>> +    u32                flags; /* V4L2_BUF_FLAG_* */
>> +    u64                timestamp;
>> +    enum iris_buffer_attributes    attr;
>> +};
>> +
>> +struct iris_buffers {
>> +    struct list_head    list;
>> +    u32            min_count;
>> +    u32            actual_count;
>> +    u32            size;
>> +};
>> +
>> +int iris_get_buffer_size(struct iris_inst *inst, enum iris_buffer_type
>> buffer_type);
>> +void iris_vb2_queue_error(struct iris_inst *inst);
>> +
>> +#endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_core.h
>> b/drivers/media/platform/qcom/iris/iris_core.h
>> index 09a6904c7bb1..1f6eca31928d 100644
>> --- a/drivers/media/platform/qcom/iris/iris_core.h
>> +++ b/drivers/media/platform/qcom/iris/iris_core.h
>> @@ -28,6 +28,8 @@
>>    * @v4l2_dev: a holder for v4l2 device structure
>>    * @vdev_dec: iris video device structure for decoder
>>    * @iris_v4l2_file_ops: iris v4l2 file ops
>> + * @iris_v4l2_ioctl_ops: iris v4l2 ioctl ops
>> + * @vb2_ops: iris vb2 ops
>>    * @icc_tbl: table of iris interconnects
>>    * @icc_count: count of iris interconnects
>>    * @pmdomain_tbl: table of iris power domains
>> @@ -55,6 +57,7 @@
>>    * @core_init_done: structure of signal completion for system response
>>    * @intr_status: interrupt status
>>    * @sys_error_handler: a delayed work for handling system fatal error
>> + * @instances: a list_head of all instances
>>    */
>>     struct iris_core {
>> @@ -64,6 +67,8 @@ struct iris_core {
>>       struct v4l2_device            v4l2_dev;
>>       struct video_device            *vdev_dec;
>>       const struct v4l2_file_operations    *iris_v4l2_file_ops;
>> +    const struct v4l2_ioctl_ops        *iris_v4l2_ioctl_ops;
>> +    const struct vb2_ops            *iris_vb2_ops;
>>       struct icc_bulk_data            *icc_tbl;
>>       u32                    icc_count;
>>       struct dev_pm_domain_list        *pmdomain_tbl;
>> @@ -91,6 +96,7 @@ struct iris_core {
>>       struct completion            core_init_done;
>>       u32                    intr_status;
>>       struct delayed_work            sys_error_handler;
>> +    struct list_head            instances;
>>   };
>>     int iris_core_init(struct iris_core *core);
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h
>> b/drivers/media/platform/qcom/iris/iris_hfi_common.h
>> index e050b1ae90fe..f59ce97d5b7e 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
>> @@ -9,6 +9,7 @@
>>   #include <linux/types.h>
>>   #include <media/v4l2-device.h>
>>   +struct iris_inst;
>>   struct iris_core;
>>     enum hfi_packet_port_type {
>> @@ -47,6 +48,8 @@ struct iris_hfi_command_ops {
>>       int (*sys_image_version)(struct iris_core *core);
>>       int (*sys_interframe_powercollapse)(struct iris_core *core);
>>       int (*sys_pc_prep)(struct iris_core *core);
>> +    int (*session_open)(struct iris_inst *inst);
>> +    int (*session_close)(struct iris_inst *inst);
>>   };
>>     struct iris_hfi_response_ops {
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> index e778ae33b953..f8bd185bb68b 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> @@ -66,11 +66,51 @@ static int iris_hfi_gen1_sys_pc_prep(struct iris_core
>> *core)
>>       return iris_hfi_queue_cmd_write_locked(core, &pkt, pkt.hdr.size);
>>   }
>>   +static int iris_hfi_gen1_session_open(struct iris_inst *inst)
>> +{
>> +    struct hfi_session_open_pkt packet;
>> +    int ret;
>> +
>> +    packet.shdr.hdr.size = sizeof(struct hfi_session_open_pkt);
>> +    packet.shdr.hdr.pkt_type = HFI_CMD_SYS_SESSION_INIT;
>> +    packet.shdr.session_id = inst->session_id;
>> +    packet.session_domain = HFI_SESSION_TYPE_DEC;
>> +    packet.session_codec = HFI_VIDEO_CODEC_H264;
>> +
>> +    reinit_completion(&inst->completion);
>> +
>> +    ret = iris_hfi_queue_cmd_write(inst->core, &packet,
>> packet.shdr.hdr.size);
>> +    if (ret)
>> +        return ret;
>> +
>> +    return iris_wait_for_session_response(inst);
>> +}
>> +
>> +static void iris_hfi_gen1_packet_session_cmd(struct iris_inst *inst,
>> +                         struct hfi_session_pkt *packet,
>> +                         u32 ptype)
>> +{
>> +    packet->shdr.hdr.size = sizeof(*packet);
>> +    packet->shdr.hdr.pkt_type = ptype;
>> +    packet->shdr.session_id = inst->session_id;
>> +}
>> +
>> +static int iris_hfi_gen1_session_close(struct iris_inst *inst)
>> +{
>> +    struct hfi_session_pkt packet;
>> +
>> +    iris_hfi_gen1_packet_session_cmd(inst, &packet,
>> HFI_CMD_SYS_SESSION_END);
>> +
>> +    return iris_hfi_queue_cmd_write(inst->core, &packet,
>> packet.shdr.hdr.size);
>> +}
>> +
>>   static const struct iris_hfi_command_ops iris_hfi_gen1_command_ops = {
>>       .sys_init = iris_hfi_gen1_sys_init,
>>       .sys_image_version = iris_hfi_gen1_sys_image_version,
>>       .sys_interframe_powercollapse =
>> iris_hfi_gen1_sys_interframe_powercollapse,
>>       .sys_pc_prep = iris_hfi_gen1_sys_pc_prep,
>> +    .session_open = iris_hfi_gen1_session_open,
>> +    .session_close = iris_hfi_gen1_session_close,
>>   };
>>     void iris_hfi_gen1_command_ops_init(struct iris_core *core)
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
>> index 991d5a5dc792..da52e497b74a 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
>> @@ -9,19 +9,34 @@
>>   #include <linux/types.h>
>>     #define HFI_VIDEO_ARCH_OX                0x1
>> +
>> +#define HFI_SESSION_TYPE_DEC                2
>> +
>> +#define HFI_VIDEO_CODEC_H264                0x00000002
>> +
>>   #define HFI_ERR_NONE                    0x0
>>     #define HFI_CMD_SYS_INIT                0x10001
>>   #define HFI_CMD_SYS_PC_PREP                0x10002
>>   #define HFI_CMD_SYS_SET_PROPERTY            0x10005
>>   #define HFI_CMD_SYS_GET_PROPERTY            0x10006
>> +#define HFI_CMD_SYS_SESSION_INIT            0x10007
>> +#define HFI_CMD_SYS_SESSION_END                0x10008
>>   -#define HFI_PROPERTY_SYS_CODEC_POWER_PLANE_CTRL        0x5
>> -#define HFI_PROPERTY_SYS_IMAGE_VERSION            0x6
>> +#define HFI_ERR_SESSION_UNSUPPORTED_SETTING        0x1008
>> +#define HFI_ERR_SESSION_UNSUPPORT_BUFFERTYPE        0x1010
>> +#define HFI_ERR_SESSION_INVALID_SCALE_FACTOR        0x1012
>> +#define HFI_ERR_SESSION_UPSCALE_NOT_SUPPORTED        0x1013
>>     #define HFI_EVENT_SYS_ERROR                0x1
>> +#define HFI_EVENT_SESSION_ERROR                0x2
>> +
>> +#define HFI_PROPERTY_SYS_CODEC_POWER_PLANE_CTRL        0x5
>> +#define HFI_PROPERTY_SYS_IMAGE_VERSION            0x6
>>     #define HFI_MSG_SYS_INIT                0x20001
>> +#define HFI_MSG_SYS_SESSION_INIT            0x20006
>> +#define HFI_MSG_SYS_SESSION_END                0x20007
>>   #define HFI_MSG_SYS_COV                    0x20009
>>   #define HFI_MSG_SYS_PROPERTY_INFO            0x2000a
>>   @@ -32,6 +47,21 @@ struct hfi_pkt_hdr {
>>       u32 pkt_type;
>>   };
>>   +struct hfi_session_hdr_pkt {
>> +    struct hfi_pkt_hdr hdr;
>> +    u32 session_id;
>> +};
>> +
>> +struct hfi_session_open_pkt {
>> +    struct hfi_session_hdr_pkt shdr;
>> +    u32 session_domain;
>> +    u32 session_codec;
>> +};
>> +
>> +struct hfi_session_pkt {
>> +    struct hfi_session_hdr_pkt shdr;
>> +};
>> +
>>   struct hfi_sys_init_pkt {
>>       struct hfi_pkt_hdr hdr;
>>       u32 arch_type;
>> @@ -54,7 +84,7 @@ struct hfi_sys_pc_prep_pkt {
>>   };
>>     struct hfi_msg_event_notify_pkt {
>> -    struct hfi_pkt_hdr hdr;
>> +    struct hfi_session_hdr_pkt shdr;
>>       u32 event_id;
>>       u32 event_data1;
>>       u32 event_data2;
>> @@ -68,6 +98,17 @@ struct hfi_msg_sys_init_done_pkt {
>>       u32 data[];
>>   };
>>   +struct hfi_msg_session_hdr_pkt {
>> +    struct hfi_session_hdr_pkt shdr;
>> +    u32 error_type;
>> +};
>> +
>> +struct hfi_msg_session_init_done_pkt {
>> +    struct hfi_msg_session_hdr_pkt shdr;
>> +    u32 num_properties;
>> +    u32 data[];
>> +};
>> +
>>   struct hfi_msg_sys_property_info_pkt {
>>       struct hfi_pkt_hdr hdr;
>>       u32 num_properties;
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
>> index 3eb2ce99c614..c9b87ff4db3a 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
>> @@ -13,13 +13,54 @@ iris_hfi_gen1_sys_event_notify(struct iris_core
>> *core, void *packet)
>>       struct hfi_msg_event_notify_pkt *pkt = packet;
>>         if (pkt->event_id == HFI_EVENT_SYS_ERROR)
>> -        dev_err(core->dev, "sys error (type: %x, data1:%x, data2:%x)\n",
>> -            pkt->event_id, pkt->event_data1, pkt->event_data2);
>> +        dev_err(core->dev, "sys error (type: %x, session id:%x,
>> data1:%x, data2:%x)\n",
>> +            pkt->event_id, pkt->shdr.session_id, pkt->event_data1,
>> +            pkt->event_data2);
>>         iris_change_core_state(core, IRIS_CORE_ERROR);
>>       schedule_delayed_work(&core->sys_error_handler, msecs_to_jiffies(10));
>>   }
>>   +static void
>> +iris_hfi_gen1_event_session_error(struct iris_inst *inst, struct
>> hfi_msg_event_notify_pkt *pkt)
>> +{
>> +    switch (pkt->event_data1) {
>> +    /* non fatal session errors */
>> +    case HFI_ERR_SESSION_INVALID_SCALE_FACTOR:
>> +    case HFI_ERR_SESSION_UNSUPPORT_BUFFERTYPE:
>> +    case HFI_ERR_SESSION_UNSUPPORTED_SETTING:
>> +    case HFI_ERR_SESSION_UPSCALE_NOT_SUPPORTED:
>> +        dev_dbg(inst->core->dev, "session error: event id:%x, session
>> id:%x\n",
>> +            pkt->event_data1, pkt->shdr.session_id);
>> +        break;
>> +    /* fatal session errors */
>> +    default:
>> +        /*
>> +         * firmware fills event_data2 as an additional information about
>> the
>> +         * hfi command for which session error has ouccured.
>> +         */
>> +        dev_err(inst->core->dev,
>> +            "session error for command: %x, event id:%x, session id:%x\n",
>> +            pkt->event_data2, pkt->event_data1,
>> +            pkt->shdr.session_id);
>> +        iris_vb2_queue_error(inst);
>> +        break;
>> +    }
>> +}
>> +
>> +static void iris_hfi_gen1_session_event_notify(struct iris_inst *inst,
>> void *packet)
>> +{
>> +    struct hfi_msg_event_notify_pkt *pkt = packet;
>> +
>> +    switch (pkt->event_id) {
>> +    case HFI_EVENT_SESSION_ERROR:
>> +        iris_hfi_gen1_event_session_error(inst, pkt);
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +}
>> +
>>   static void iris_hfi_gen1_sys_init_done(struct iris_core *core, void
>> *packet)
>>   {
>>       struct hfi_msg_sys_init_done_pkt *pkt = packet;
>> @@ -99,6 +140,14 @@ static const struct iris_hfi_gen1_response_pkt_info
>> pkt_infos[] = {
>>        .pkt = HFI_MSG_SYS_PROPERTY_INFO,
>>        .pkt_sz = sizeof(struct hfi_msg_sys_property_info_pkt),
>>       },
>> +    {
>> +     .pkt = HFI_MSG_SYS_SESSION_INIT,
>> +     .pkt_sz = sizeof(struct hfi_msg_session_init_done_pkt),
>> +    },
>> +    {
>> +     .pkt = HFI_MSG_SYS_SESSION_END,
>> +     .pkt_sz = sizeof(struct hfi_msg_session_hdr_pkt),
>> +    },
>>   };
>>     static void iris_hfi_gen1_handle_response(struct iris_core *core,
>> void *response)
>> @@ -106,6 +155,7 @@ static void iris_hfi_gen1_handle_response(struct
>> iris_core *core, void *response
>>       const struct iris_hfi_gen1_response_pkt_info *pkt_info;
>>       struct device *dev = core->dev;
>>       struct hfi_pkt_hdr *hdr;
>> +    struct iris_inst *inst;
>>       bool found = false;
>>       unsigned int i;
>>   @@ -126,12 +176,38 @@ static void iris_hfi_gen1_handle_response(struct
>> iris_core *core, void *response
>>           return;
>>       }
>>   -    if (hdr->pkt_type == HFI_MSG_SYS_INIT)
>> +    if (hdr->pkt_type == HFI_MSG_SYS_INIT) {
>>           iris_hfi_gen1_sys_init_done(core, hdr);
>> -    else if (hdr->pkt_type == HFI_MSG_SYS_PROPERTY_INFO)
>> +    } else if (hdr->pkt_type == HFI_MSG_SYS_PROPERTY_INFO) {
>>           iris_hfi_gen1_sys_property_info(core, hdr);
>> -    else if (hdr->pkt_type == HFI_MSG_EVENT_NOTIFY)
>> -        iris_hfi_gen1_sys_event_notify(core, hdr);
>> +    } else if (hdr->pkt_type == HFI_MSG_EVENT_NOTIFY) {
>> +        struct hfi_session_pkt *pkt;
>> +
>> +        pkt = (struct hfi_session_pkt *)hdr;
>> +        inst = iris_get_instance(core, pkt->shdr.session_id);
>> +        if (inst) {
>> +            mutex_lock(&inst->lock);
>> +            iris_hfi_gen1_session_event_notify(inst, hdr);
>> +            mutex_unlock(&inst->lock);
>> +        } else {
>> +            iris_hfi_gen1_sys_event_notify(core, hdr);
>> +        }
>> +    } else {
>> +        struct hfi_session_pkt *pkt;
>> +
>> +        pkt = (struct hfi_session_pkt *)hdr;
>> +        inst = iris_get_instance(core, pkt->shdr.session_id);
>> +        if (!inst) {
>> +            dev_warn(dev, "no valid instance(pkt session_id:%x, pkt:%x)\n",
>> +                 pkt->shdr.session_id,
>> +                 pkt_info ? pkt_info->pkt : 0);
>> +            return;
>> +        }
>> +
>> +        mutex_lock(&inst->lock);
>> +        complete(&inst->completion);
>> +        mutex_unlock(&inst->lock);
> 
> You're if elsing alot here.
> 
> Why not just switch ?
> 
> Suggest a switch.
> 
> IMO @ the first else/if you're already 50/50 for making it a swtich and by
> the second else/if its required.
> 
Sure, we can move this to swicth case.
>> +    }
>>   }
>>     static void iris_hfi_gen1_flush_debug_queue(struct iris_core *core,
>> u8 *packet)
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
>> index 6ec83984fda9..76f0c9032a92 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
>> @@ -10,13 +10,18 @@
>>     struct iris_core;
>>   +#define to_iris_inst_hfi_gen2(ptr) \
>> +    container_of(ptr, struct iris_inst_hfi_gen2, inst)
>> +
>>   /**
>>    * struct iris_inst_hfi_gen2 - holds per video instance parameters for
>> hfi_gen2
>>    *
>>    * @inst: pointer to iris_instance structure
>> + * @packet: HFI packet
>>    */
>>   struct iris_inst_hfi_gen2 {
>>       struct iris_inst        inst;
>> +    struct iris_hfi_header        *packet;
>>   };
>>     void iris_hfi_gen2_command_ops_init(struct iris_core *core);
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> index 0871c0bdea90..a74114b0761a 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> @@ -85,11 +85,117 @@ static int iris_hfi_gen2_sys_pc_prep(struct
>> iris_core *core)
>>       return ret;
>>   }
>>   +static int iris_hfi_gen2_session_set_codec(struct iris_inst *inst)
>> +{
>> +    struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>> +    u32 codec;
>> +
>> +    codec = HFI_CODEC_DECODE_AVC;
>> +    iris_hfi_gen2_packet_session_property(inst,
>> +                          HFI_PROP_CODEC,
>> +                          HFI_HOST_FLAGS_NONE,
>> +                          HFI_PORT_NONE,
>> +                          HFI_PAYLOAD_U32_ENUM,
>> +                          &codec,
>> +                          sizeof(u32));
>> +
>> +    return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
>> +                    inst_hfi_gen2->packet->size);
>> +}
>> +
>> +static int iris_hfi_gen2_session_set_default_header(struct iris_inst *inst)
>> +{
>> +    struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>> +    u32 default_header = false;
>> +
>> +    iris_hfi_gen2_packet_session_property(inst,
>> +                          HFI_PROP_DEC_DEFAULT_HEADER,
>> +                          HFI_HOST_FLAGS_NONE,
>> +                          HFI_PORT_BITSTREAM,
>> +                          HFI_PAYLOAD_U32,
>> +                          &default_header,
>> +                          sizeof(u32));
>> +
>> +    return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
>> +                    inst_hfi_gen2->packet->size);
>> +}
>> +
>> +static int iris_hfi_gen2_session_open(struct iris_inst *inst)
>> +{
>> +    struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>> +    int ret;
>> +
>> +    inst_hfi_gen2->packet = kzalloc(4096, GFP_KERNEL);
>> +    if (!inst_hfi_gen2->packet)
>> +        return -ENOMEM;
>> +
>> +    iris_hfi_gen2_packet_session_command(inst,
>> +                         HFI_CMD_OPEN,
>> +                         HFI_HOST_FLAGS_RESPONSE_REQUIRED |
>> +                         HFI_HOST_FLAGS_INTR_REQUIRED,
>> +                         HFI_PORT_NONE,
>> +                         0,
>> +                         HFI_PAYLOAD_U32,
>> +                         &inst->session_id,
>> +                         sizeof(u32));
>> +
>> +    ret = iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
>> +                       inst_hfi_gen2->packet->size);
>> +    if (ret)
>> +        goto fail_free_packet;
>> +
>> +    ret = iris_hfi_gen2_session_set_codec(inst);
>> +    if (ret)
>> +        goto fail_free_packet;
>> +
>> +    ret = iris_hfi_gen2_session_set_default_header(inst);
>> +    if (ret)
>> +        goto fail_free_packet;
>> +
>> +    return ret;
>> +
>> +fail_free_packet:
>> +    kfree(inst_hfi_gen2->packet);
>> +    inst_hfi_gen2->packet = NULL;
>> +
>> +    return ret;
>> +}
>> +
>> +static int iris_hfi_gen2_session_close(struct iris_inst *inst)
>> +{
>> +    struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>> +    int ret;
>> +
>> +    if (!inst_hfi_gen2->packet)
>> +        return -EINVAL;
>> +
>> +    iris_hfi_gen2_packet_session_command(inst,
>> +                         HFI_CMD_CLOSE,
>> +                         (HFI_HOST_FLAGS_RESPONSE_REQUIRED |
>> +                         HFI_HOST_FLAGS_INTR_REQUIRED |
>> +                         HFI_HOST_FLAGS_NON_DISCARDABLE),
>> +                         HFI_PORT_NONE,
>> +                         inst->session_id,
>> +                         HFI_PAYLOAD_NONE,
>> +                         NULL,
>> +                         0);
>> +
>> +    ret = iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
>> +                       inst_hfi_gen2->packet->size);
>> +
>> +    kfree(inst_hfi_gen2->packet);
>> +    inst_hfi_gen2->packet = NULL;
>> +
>> +    return ret;
>> +}
>> +
>>   static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
>>       .sys_init = iris_hfi_gen2_sys_init,
>>       .sys_image_version = iris_hfi_gen2_sys_image_version,
>>       .sys_interframe_powercollapse =
>> iris_hfi_gen2_sys_interframe_powercollapse,
>>       .sys_pc_prep = iris_hfi_gen2_sys_pc_prep,
>> +    .session_open = iris_hfi_gen2_session_open,
>> +    .session_close = iris_hfi_gen2_session_close,
>>   };
>>     void iris_hfi_gen2_command_ops_init(struct iris_core *core)
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> index 4104479c7251..18cc9365ab75 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> @@ -13,6 +13,8 @@
>>   #define HFI_CMD_BEGIN                0x01000000
>>   #define HFI_CMD_INIT                0x01000001
>>   #define HFI_CMD_POWER_COLLAPSE            0x01000002
>> +#define HFI_CMD_OPEN                0x01000003
>> +#define HFI_CMD_CLOSE                0x01000004
>>   #define HFI_CMD_END                0x01FFFFFF
>>     #define HFI_PROP_BEGIN                0x03000000
>> @@ -25,12 +27,44 @@
>>   #define HFI_PROP_UBWC_BANK_SWZL_LEVEL2        0x03000007
>>   #define HFI_PROP_UBWC_BANK_SWZL_LEVEL3        0x03000008
>>   #define HFI_PROP_UBWC_BANK_SPREADING        0x03000009
>> +#define HFI_PROP_CODEC                0x03000100
>> +#define HFI_PROP_DEC_DEFAULT_HEADER        0x03000168
>>   #define HFI_PROP_END                0x03FFFFFF
>>   +#define HFI_SESSION_ERROR_BEGIN            0x04000000
>> +#define HFI_ERROR_UNKNOWN_SESSION        0x04000001
>> +#define HFI_ERROR_MAX_SESSIONS            0x04000002
>> +#define HFI_ERROR_FATAL                0x04000003
>> +#define HFI_ERROR_INVALID_STATE            0x04000004
>> +#define HFI_ERROR_INSUFFICIENT_RESOURCES    0x04000005
>> +#define HFI_ERROR_BUFFER_NOT_SET        0x04000006
>> +#define HFI_SESSION_ERROR_END            0x04FFFFFF
>> +
>>   #define HFI_SYSTEM_ERROR_BEGIN            0x05000000
>>   #define HFI_SYS_ERROR_WD_TIMEOUT        0x05000001
>>   #define HFI_SYSTEM_ERROR_END            0x05FFFFFF
>>   +enum hfi_codec_type {
>> +    HFI_CODEC_DECODE_AVC            = 1,
>> +    HFI_CODEC_ENCODE_AVC            = 2,
>> +};
>> +
>> +enum hfi_buffer_type {
>> +    HFI_BUFFER_BITSTREAM            = 0x00000001,
>> +    HFI_BUFFER_RAW                = 0x00000002,
>> +    HFI_BUFFER_METADATA            = 0x00000003,
>> +    HFI_BUFFER_SUBCACHE            = 0x00000004,
>> +    HFI_BUFFER_PARTIAL_DATA            = 0x00000005,
>> +    HFI_BUFFER_DPB                = 0x00000006,
>> +    HFI_BUFFER_BIN                = 0x00000007,
>> +    HFI_BUFFER_LINE                = 0x00000008,
>> +    HFI_BUFFER_ARP                = 0x00000009,
>> +    HFI_BUFFER_COMV                = 0x0000000A,
>> +    HFI_BUFFER_NON_COMV            = 0x0000000B,
>> +    HFI_BUFFER_PERSIST            = 0x0000000C,
>> +    HFI_BUFFER_VPSS                = 0x0000000D,
>> +};
>> +
>>   enum hfi_packet_firmware_flags {
>>       HFI_FW_FLAGS_SUCCESS            = 0x00000001,
>>       HFI_FW_FLAGS_INFORMATION        = 0x00000002,
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
>> index 9ea26328a300..09e7c07fdc5f 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
>> @@ -146,6 +146,45 @@ void iris_hfi_gen2_packet_image_version(struct
>> iris_core *core, struct iris_hfi_
>>                       NULL, 0);
>>   }
>>   +void iris_hfi_gen2_packet_session_command(struct iris_inst *inst, u32
>> pkt_type,
>> +                      u32 flags, u32 port, u32 session_id,
>> +                      u32 payload_type, void *payload,
>> +                      u32 payload_size)
>> +{
>> +    struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>> +    struct iris_core *core = inst->core;
>> +
>> +    iris_hfi_gen2_create_header(inst_hfi_gen2->packet, session_id,
>> core->header_id++);
>> +
>> +    iris_hfi_gen2_create_packet(inst_hfi_gen2->packet,
>> +                    pkt_type,
>> +                    flags,
>> +                    payload_type,
>> +                    port,
>> +                    core->packet_id++,
>> +                    payload,
>> +                    payload_size);
>> +}
>> +
>> +void iris_hfi_gen2_packet_session_property(struct iris_inst *inst,
>> +                       u32 pkt_type, u32 flags, u32 port,
>> +                       u32 payload_type, void *payload, u32 payload_size)
>> +{
>> +    struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>> +    struct iris_core *core = inst->core;
>> +
>> +    iris_hfi_gen2_create_header(inst_hfi_gen2->packet, inst->session_id,
>> core->header_id++);
>> +
>> +    iris_hfi_gen2_create_packet(inst_hfi_gen2->packet,
>> +                    pkt_type,
>> +                    flags,
>> +                    payload_type,
>> +                    port,
>> +                    core->packet_id++,
>> +                    payload,
>> +                    payload_size);
>> +}
>> +
>>   void iris_hfi_gen2_packet_sys_interframe_powercollapse(struct iris_core
>> *core,
>>                                  struct iris_hfi_header *hdr)
>>   {
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
>> index 163295783b7d..120592322e78 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
>> @@ -63,6 +63,13 @@ struct iris_hfi_packet {
>>     void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct
>> iris_hfi_header *hdr);
>>   void iris_hfi_gen2_packet_image_version(struct iris_core *core, struct
>> iris_hfi_header *hdr);
>> +void iris_hfi_gen2_packet_session_command(struct iris_inst *inst, u32
>> pkt_type,
>> +                      u32 flags, u32 port, u32 session_id,
>> +                      u32 payload_type, void *payload,
>> +                      u32 payload_size);
>> +void iris_hfi_gen2_packet_session_property(struct iris_inst *inst,
>> +                       u32 pkt_type, u32 flags, u32 port,
>> +                       u32 payload_type, void *payload, u32 payload_size);
>>   void iris_hfi_gen2_packet_sys_interframe_powercollapse(struct iris_core
>> *core,
>>                                  struct iris_hfi_header *hdr);
>>   void iris_hfi_gen2_packet_sys_pc_prep(struct iris_core *core, struct
>> iris_hfi_header *hdr);
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> index e208a5ae664a..dce2cf04a856 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> @@ -14,6 +14,17 @@ struct iris_hfi_gen2_core_hfi_range {
>>       int (*handle)(struct iris_core *core, struct iris_hfi_packet *pkt);
>>   };
>>   +struct iris_hfi_gen2_inst_hfi_range {
>> +    u32 begin;
>> +    u32 end;
>> +    int (*handle)(struct iris_inst *inst, struct iris_hfi_packet *pkt);
>> +};
>> +
>> +struct iris_hfi_gen2_packet_handle {
>> +    enum hfi_buffer_type type;
>> +    int (*handle)(struct iris_inst *inst, struct iris_hfi_packet *pkt);
>> +};
>> +
>>   static int iris_hfi_gen2_validate_packet(u8 *response_pkt, u8
>> *core_resp_pkt)
>>   {
>>       u32 response_pkt_size = 0;
>> @@ -57,6 +68,43 @@ static int iris_hfi_gen2_validate_hdr_packet(struct
>> iris_core *core, struct iris
>>       return ret;
>>   }
>>   +static int iris_hfi_gen2_handle_session_error(struct iris_inst *inst,
>> +                          struct iris_hfi_packet *pkt)
>> +{
>> +    struct iris_core *core = inst->core;
>> +    char *error;
>> +
>> +    switch (pkt->type) {
>> +    case HFI_ERROR_MAX_SESSIONS:
>> +        error = "exceeded max sessions";
>> +        break;
>> +    case HFI_ERROR_UNKNOWN_SESSION:
>> +        error = "unknown session id";
>> +        break;
>> +    case HFI_ERROR_INVALID_STATE:
>> +        error = "invalid operation for current state";
>> +        break;
>> +    case HFI_ERROR_INSUFFICIENT_RESOURCES:
>> +        error = "insufficient resources";
>> +        break;
>> +    case HFI_ERROR_BUFFER_NOT_SET:
>> +        error = "internal buffers not set";
>> +        break;
>> +    case HFI_ERROR_FATAL:
>> +        error = "fatal error";
>> +        break;
>> +    default:
>> +        error = "unknown";
>> +        break;
>> +    }
>> +
>> +    dev_err(core->dev, "session error received %#x: %s\n",
>> +        pkt->type, error);
>> +    iris_vb2_queue_error(inst);
>> +
>> +    return 0;
>> +}
> 
> This function should be void, the return code is always zero.
> 
>> +
>>   static int iris_hfi_gen2_handle_system_error(struct iris_core *core,
>>                            struct iris_hfi_packet *pkt)
>>   {
>> @@ -81,6 +129,22 @@ static int iris_hfi_gen2_handle_system_init(struct
>> iris_core *core,
>>       return 0;
>>   }
>>   +static int iris_hfi_gen2_handle_session_command(struct iris_inst *inst,
>> +                        struct iris_hfi_packet *pkt)
>> +{
>> +    int ret = 0;
>> +
>> +    switch (pkt->type) {
>> +    case HFI_CMD_CLOSE:
>> +        complete(&inst->completion);
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +
>> +    return ret;
>> +}
> 
> and here too.
> 
> Unless of course one of your progressive patches introduces error codes
> then all of these integer returning function that always return the same
> vale @ the end should be made into voids.
> 
These are the handlers invoked from iris_hfi_gen2_handle_session_response
and are of iris_hfi_gen2_inst_hfi_range struct type hence the same
prototype is followed for all handlers.
>> +
>>   static int iris_hfi_gen2_handle_image_version_property(struct iris_core
>> *core,
>>                                  struct iris_hfi_packet *pkt)
>>   {
>> @@ -163,6 +227,46 @@ static int
>> iris_hfi_gen2_handle_system_response(struct iris_core *core,
>>       return ret;
>>   }
>>   +static int iris_hfi_gen2_handle_session_response(struct iris_core *core,
>> +                         struct iris_hfi_header *hdr)
>> +{
>> +    struct iris_hfi_packet *packet;
>> +    struct iris_inst *inst;
>> +    u8 *pkt, *start_pkt;
>> +    int ret = 0;
>> +    int i, j;
>> +    static const struct iris_hfi_gen2_inst_hfi_range range[] = {
>> +        {HFI_SESSION_ERROR_BEGIN, HFI_SESSION_ERROR_END,
>> +         iris_hfi_gen2_handle_session_error},
>> +        {HFI_CMD_BEGIN, HFI_CMD_END,
>> +         iris_hfi_gen2_handle_session_command },
>> +    };
>> +
>> +    inst = iris_get_instance(core, hdr->session_id);
>> +    if (!inst)
>> +        return -EINVAL;
>> +
>> +    mutex_lock(&inst->lock);
>> +
>> +    start_pkt = (u8 *)((u8 *)hdr + sizeof(*hdr));
>> +    for (i = 0; i < ARRAY_SIZE(range); i++) {
>> +        pkt = start_pkt;
>> +        for (j = 0; j < hdr->num_packets; j++) {
>> +            packet = (struct iris_hfi_packet *)pkt;
>> +            if (packet->flags & HFI_FW_FLAGS_SESSION_ERROR)
>> +                iris_hfi_gen2_handle_session_error(inst, packet);
>> +
>> +            if (packet->type > range[i].begin && packet->type <
>> range[i].end)
>> +                ret = range[i].handle(inst, packet);
>> +            pkt += packet->size;
>> +        }
>> +    }
>> +
>> +    mutex_unlock(&inst->lock);
>> +
>> +    return ret;
>> +}
>> +
>>   static int iris_hfi_gen2_handle_response(struct iris_core *core, void
>> *response)
>>   {
>>       struct iris_hfi_header *hdr;
>> @@ -173,7 +277,10 @@ static int iris_hfi_gen2_handle_response(struct
>> iris_core *core, void *response)
>>       if (ret)
>>           return iris_hfi_gen2_handle_system_error(core, NULL);
>>   -    return iris_hfi_gen2_handle_system_response(core, hdr);
>> +    if (!hdr->session_id)
>> +        return iris_hfi_gen2_handle_system_response(core, hdr);
>> +    else
>> +        return iris_hfi_gen2_handle_session_response(core, hdr);
>>   }
>>     static void iris_hfi_gen2_flush_debug_queue(struct iris_core *core,
>> u8 *packet)
>> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h
>> b/drivers/media/platform/qcom/iris/iris_instance.h
>> index 63cb9d70166f..bb43119af352 100644
>> --- a/drivers/media/platform/qcom/iris/iris_instance.h
>> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
>> @@ -6,24 +6,46 @@
>>   #ifndef _IRIS_INSTANCE_H_
>>   #define _IRIS_INSTANCE_H_
>>   +#include <media/v4l2-ctrls.h>
>> +
>> +#include "iris_buffer.h"
>>   #include "iris_core.h"
>> +#include "iris_utils.h"
>>     /**
>>    * struct iris_inst - holds per video instance parameters
>>    *
>> + * @list: used for attach an instance to the core
>>    * @core: pointer to core structure
>> + * @session_id: id of current video session
>>    * @ctx_q_lock: lock to serialize queues related ioctls
>>    * @lock: lock to seralise forward and reverse threads
>>    * @fh: reference of v4l2 file handler
>> + * @fmt_src: structure of v4l2_format for source
>> + * @fmt_dst: structure of v4l2_format for destination
>> + * @crop: structure of crop info
>> + * @completions: structure of signal completions
>> + * @buffers: array of different iris buffers
>> + * @fw_min_count: minimnum count of buffers needed by fw
>> + * @once_per_session_set: boolean to set once per session property
>>    * @m2m_dev:    a reference to m2m device structure
>>    * @m2m_ctx:    a reference to m2m context structure
>>    */
>>     struct iris_inst {
>> +    struct list_head        list;
>>       struct iris_core        *core;
>> +    u32                session_id;
>>       struct mutex            ctx_q_lock;/* lock to serialize queues
>> related ioctls */
>>       struct mutex            lock; /* lock to serialize forward and
>> reverse threads */
>>       struct v4l2_fh            fh;
>> +    struct v4l2_format        *fmt_src;
>> +    struct v4l2_format        *fmt_dst;
>> +    struct iris_hfi_rect_desc    crop;
>> +    struct completion        completion;
>> +    struct iris_buffers        buffers[BUF_TYPE_MAX];
>> +    u32                fw_min_count;
>> +    bool                once_per_session_set;
>>       struct v4l2_m2m_dev        *m2m_dev;
>>       struct v4l2_m2m_ctx        *m2m_ctx;
>>   };
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index 899a696a931d..754cccc638a5 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -75,6 +75,7 @@ struct iris_platform_data {
>>       u32 hw_response_timeout;
>>       struct ubwc_config_data *ubwc_config;
>>       u32 num_vpp_pipe;
>> +    u32 max_session_count;
>>   };
>>     #endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
>> b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
>> index 1adbafa373a5..cbc5e84641f6 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
>> @@ -60,4 +60,5 @@ struct iris_platform_data sm8250_data = {
>>       .tz_cp_config_data = &tz_cp_config_sm8250,
>>       .hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>>       .num_vpp_pipe = 4,
>> +    .max_session_count = 16,
>>   };
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> index 950ccdccde31..57fe9986b8cf 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> @@ -74,4 +74,5 @@ struct iris_platform_data sm8550_data = {
>>       .hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>>       .ubwc_config = &ubwc_config_sm8550,
>>       .num_vpp_pipe = 4,
>> +    .max_session_count = 16,
>>   };
>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c
>> b/drivers/media/platform/qcom/iris/iris_probe.c
>> index 3222e9116551..5d492b3919cc 100644
>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>> @@ -36,6 +36,7 @@ static int iris_register_video_device(struct iris_core
>> *core)
>>       strscpy(vdev->name, "qcom-iris-decoder", sizeof(vdev->name));
>>       vdev->release = video_device_release;
>>       vdev->fops = core->iris_v4l2_file_ops;
>> +    vdev->ioctl_ops = core->iris_v4l2_ioctl_ops;
>>       vdev->vfl_dir = VFL_DIR_M2M;
>>       vdev->v4l2_dev = &core->v4l2_dev;
>>       vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
>> @@ -102,6 +103,7 @@ static int iris_probe(struct platform_device *pdev)
>>       if (!core->response_packet)
>>           return -ENOMEM;
>>   +    INIT_LIST_HEAD(&core->instances);
>>       INIT_DELAYED_WORK(&core->sys_error_handler, iris_sys_error_handler);
>>         core->reg_base = devm_platform_ioremap_resource(pdev, 0);
>> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c
>> b/drivers/media/platform/qcom/iris/iris_utils.c
>> new file mode 100644
>> index 000000000000..d7e7c9852aca
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
>> @@ -0,0 +1,55 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights
>> reserved.
>> + */
>> +
>> +#include <linux/pm_runtime.h>
>> +
>> +#include "iris_instance.h"
>> +#include "iris_utils.h"
>> +
>> +int iris_get_mbpf(struct iris_inst *inst)
>> +{
>> +    struct v4l2_format *inp_f;
>> +    int height, width;
>> +
>> +    inp_f = inst->fmt_src;
>> +    width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
>> +    height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
>> +
>> +    return NUM_MBS_PER_FRAME(height, width);
>> +}
>> +
>> +int iris_wait_for_session_response(struct iris_inst *inst)
>> +{
>> +    struct iris_core *core = inst->core;
>> +    u32 hw_response_timeout_val;
>> +    int ret;
>> +
>> +    hw_response_timeout_val =
>> core->iris_platform_data->hw_response_timeout;
>> +
>> +    mutex_unlock(&inst->lock);
>> +    ret = wait_for_completion_timeout(&inst->completion,
>> +                      msecs_to_jiffies(hw_response_timeout_val));
>> +    mutex_lock(&inst->lock);
>> +    if (!ret)
>> +        return -ETIMEDOUT;
>> +
>> +    return 0;
>> +}
>> +
>> +struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id)
>> +{
>> +    struct iris_inst *inst = NULL;
>> +
>> +    mutex_lock(&core->lock);
>> +    list_for_each_entry(inst, &core->instances, list) {
>> +        if (inst->session_id == session_id) {
>> +            mutex_unlock(&core->lock);
> drop
>> +            return inst;
> goto done;
> 
>> +        }
>> +    }
>> +    mutex_unlock(&core->lock);
>> +
>> +    return NULL;
>> +}
> 
> 
> done:
>     mutex_unlock();
>     return inst;
> 
> you actually use a pattern like that in iris_vb2_queue_setup() later in
> this patch.
> 
> Suggesting sticking to that pattern for this submission.
> 
Sure, sounds good.

>> diff --git a/drivers/media/platform/qcom/iris/iris_utils.h
>> b/drivers/media/platform/qcom/iris/iris_utils.h
>> new file mode 100644
>> index 000000000000..1c1e109d9b5b
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_utils.h
>> @@ -0,0 +1,38 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights
>> reserved.
>> + */
>> +
>> +#ifndef _IRIS_UTILS_H_
>> +#define _IRIS_UTILS_H_
>> +
>> +struct iris_core;
>> +#include "iris_buffer.h"
>> +
>> +struct iris_hfi_rect_desc {
>> +    u32 left;
>> +    u32 top;
>> +    u32 width;
>> +    u32 height;
>> +};
>> +
>> +#define NUM_MBS_PER_FRAME(height, width) \
>> +    (DIV_ROUND_UP(height, 16) * DIV_ROUND_UP(width, 16))
>> +
>> +static inline enum iris_buffer_type iris_v4l2_type_to_driver(u32 type)
>> +{
>> +    switch (type) {
>> +    case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>> +        return BUF_INPUT;
>> +    case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> +        return BUF_OUTPUT;
>> +    default:
>> +        return -EINVAL;
>> +    }
>> +}
>> +
>> +int iris_get_mbpf(struct iris_inst *inst);
>> +struct iris_inst *iris_get_instance(struct iris_core *core, u32
>> session_id);
>> +int iris_wait_for_session_response(struct iris_inst *inst);
>> +
>> +#endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c
>> b/drivers/media/platform/qcom/iris/iris_vb2.c
>> new file mode 100644
>> index 000000000000..3fd18b6773fd
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
>> @@ -0,0 +1,92 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights
>> reserved.
>> + */
>> +
>> +#include "iris_buffer.h"
>> +#include "iris_instance.h"
>> +#include "iris_vb2.h"
>> +#include "iris_vpu_buffer.h"
>> +
>> +int iris_vb2_queue_setup(struct vb2_queue *q,
>> +             unsigned int *num_buffers, unsigned int *num_planes,
>> +             unsigned int sizes[], struct device *alloc_devs[])
>> +{
>> +    enum iris_buffer_type buffer_type = 0;
>> +    struct iris_buffers *buffers;
>> +    struct iris_inst *inst;
>> +    struct iris_core *core;
>> +    struct v4l2_format *f;
>> +    int ret = 0;
>> +
>> +    if (!q || !num_buffers || !num_planes || !sizes)
>> +        return -EINVAL;
>> +
>> +    inst = vb2_get_drv_priv(q);
>> +    if (!inst || !inst->core)
>> +        return -EINVAL;
> 
> As mentioned preivously I believe most of these defensive coding checks
> should be dropped.
> 
> if vb2_get_drv_prv() can legitimately return an error then fine but, for
> example when is (!q) true and why ?
> 
> Its one thing checking the return value of a function that can return an
> error but, another thing checking the input parameters which you expect to
> be in a particular state already.
> 
> As a general principle you've presumably validated q, num_buffers,
> num_planes and sizes prior to callign this funcion.
Agree, these NULL checks can be removed.
> 
> Anyway feel free to ignore that input but then speak to why these
> parameters can legitimately be NULL or zero on the input.
> >> +
>> +    mutex_lock(&inst->lock);
>> +
>> +    core = inst->core;
>> +    f = V4L2_TYPE_IS_OUTPUT(q->type) ? inst->fmt_src : inst->fmt_dst;
>> +
>> +    if (*num_planes) {
>> +        if (*num_planes != f->fmt.pix_mp.num_planes ||
>> +            sizes[0] < f->fmt.pix_mp.plane_fmt[0].sizeimage) {
>> +            ret = -EINVAL;
>> +            goto unlock;
>> +        }
>> +    }
>> +
>> +    buffer_type = iris_v4l2_type_to_driver(q->type);
>> +    if (buffer_type == -EINVAL) {
>> +        ret = -EINVAL;
>> +        goto unlock;
>> +    }
>> +
>> +    if (!inst->once_per_session_set) {
>> +        inst->once_per_session_set = true;
>> +
>> +        mutex_lock(&core->lock);
>> +        if (core->state == IRIS_CORE_ERROR) {
>> +            mutex_unlock(&core->lock);
>> +            ret = -EIO;
>> +            goto unlock;
>> +        }
>> +        mutex_unlock(&core->lock);
> 
> There's really alot of checking the state of the core throughout the code.
> 
> I'm not saying that's wrong however at a minimum there's enough of this
> type of pattern to justify some sore of state verification
> >> +
>> +        ret = core->hfi_ops->session_open(inst);
>> +        if (ret) {
>> +            ret = -EINVAL;
>> +            dev_err(core->dev, "session open failed\n");
>> +            goto unlock;
>> +        }
> 
> I don't understand the lifetime of the core->lock mutex here.
> 
> It has verified the state as !ISIR_CORE_ERROR and then _released_ the lock
> so by the time you get to core->hfi_ops->session_open() you've not
> guaranteed the state at all.
> 
> Shouldn't you continue to hold the core mutex for the duration of the
> core->does_stuff() operation ?
> 
> i.e. the state was not !IRIS_CORE_ERROR at an indeterminate time prior to
> the next use of core-> ...
> 
> Perhaps this is all very obvious but, I'm not immediately understanding
> what the mutex gurantees nor for how long it does that.
> 
> Please think about the mutex lifetime in your next submission as well as if
> you believe you need it still when checking the state of the core, use some
> sort of function to do so, instead of continuously taking the mutex
> checking the state and releasing the mutex.
> 
> And like I say is "state" the only thing that mutex guarantees ?
> 
Correct, we don't need the core->lock to guarantee the core->state and at
the same time core state check is also not needed, so both will be removed.
the session_open is happening under inst->lock which is enough.
> <snip>
> 
>> +    mutex_lock(&core->lock);
>> +    if (core->state != IRIS_CORE_INIT) {
>> +        ret = -EINVAL;
>> +        goto unlock;
>> +    }
>> +    list_for_each_entry(i, &core->instances, list)
>> +        count++;
>> +
>> +    if (count < core->iris_platform_data->max_session_count)
>> +        list_add_tail(&inst->list, &core->instances);
>> +    else
>> +        ret = -EAGAIN;
>> +unlock:
>> +    mutex_unlock(&core->lock);
>> +
>> +    return ret;
>> +}
>> +
>> +static void iris_remove_session(struct iris_inst *inst)
>> +{
>> +    struct iris_core *core = inst->core;
>> +    struct iris_inst *i, *temp;
>> +
>> +    mutex_lock(&core->lock);
>> +    list_for_each_entry_safe(i, temp, &core->instances, list) {
>> +        if (i->session_id == inst->session_id) {
>> +            list_del_init(&i->list);
>> +            break;
>> +        }
>> +    }
>> +    mutex_unlock(&core->lock);
> 
> For example here - the mutex guards the linked list...
This is needed, when we iterate through the instances list in core, we need
to acquire the core->lock to guard it.
> 
> ---
> bod

