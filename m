Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BB9F77C04C
	for <lists+linux-media@lfdr.de>; Mon, 14 Aug 2023 21:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbjHNTEV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Aug 2023 15:04:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231136AbjHNTEC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Aug 2023 15:04:02 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBBD3BC;
        Mon, 14 Aug 2023 12:04:00 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37EIGXwq007126;
        Mon, 14 Aug 2023 19:03:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Z4Zx6esT9dbnVhYos1nfMyx5fCiRnXT1A4pxoONmGlU=;
 b=ItLsLIbZluVHKjZez3zPHKbb0QJREpCDcEFsKoQPvzthTXu8jq+Zd5V1qKdIzZz5b73p
 oyLdONyyolgp87mZvOAcrFjMRHMG60L0VKOtnDvLMoqZWdBGUHjpyz3UdBgrkEzjx3ep
 qIJwR8Ey1AbkQvGLQGRrZD2YOHMyMEadnTPbYJu+O6byxW2DrAY+OzuXvWB7tXdt0U99
 4LznLtJ3F4RcVOtX4LGygrrDroBHRuRW1mRyPgttwZ8xmkBjp4xUf2rUWzG9Hq9Im6cE
 2/ouQ3YZBCdZ6QmZwtJrubA+q+CUfjcaxzREca1pXFtBa3Dsb/NShBDBFBqxv3+3hlru 5g== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sfh74h7q2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 14 Aug 2023 19:03:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37EJ3mWp012747
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 14 Aug 2023 19:03:48 GMT
Received: from [10.50.35.106] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 14 Aug
 2023 12:03:43 -0700
Message-ID: <9d1d6618-feb2-f95f-d417-071eccac0c9b@quicinc.com>
Date:   Tue, 15 Aug 2023 00:33:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 05/33] iris: vidc: add vb2 ops
Content-Language: en-US
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        <stanimir.k.varbanov@gmail.com>, <agross@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <mchehab@kernel.org>, <hans.verkuil@cisco.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <1690550624-14642-1-git-send-email-quic_vgarodia@quicinc.com>
 <1690550624-14642-6-git-send-email-quic_vgarodia@quicinc.com>
 <5e61d8ed25d74b242b0ac7ccc6f825861f0cbc68.camel@ndufresne.ca>
From:   Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <5e61d8ed25d74b242b0ac7ccc6f825861f0cbc68.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: u0HIOAiskvaDXGhtXgIAmb0_K8ntN6fu
X-Proofpoint-GUID: u0HIOAiskvaDXGhtXgIAmb0_K8ntN6fu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-14_16,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 impostorscore=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308140176
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/28/2023 11:33 PM, Nicolas Dufresne wrote:
> Le vendredi 28 juillet 2023 à 18:53 +0530, Vikash Garodia a écrit :
>> From: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>
>> This implements vb2 ops for streaming modes for
>> alloc, free, map and unmap buffers.
>>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> ---
>>  .../platform/qcom/iris/vidc/inc/msm_vidc_vb2.h     |  39 ++
>>  .../platform/qcom/iris/vidc/src/msm_vidc_vb2.c     | 605 +++++++++++++++++++++
>>  2 files changed, 644 insertions(+)
>>  create mode 100644 drivers/media/platform/qcom/iris/vidc/inc/msm_vidc_vb2.h
>>  create mode 100644 drivers/media/platform/qcom/iris/vidc/src/msm_vidc_vb2.c
>>
>> diff --git a/drivers/media/platform/qcom/iris/vidc/inc/msm_vidc_vb2.h b/drivers/media/platform/qcom/iris/vidc/inc/msm_vidc_vb2.h
>> new file mode 100644
>> index 0000000..12378ce
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/vidc/inc/msm_vidc_vb2.h
>> @@ -0,0 +1,39 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#ifndef _MSM_VIDC_VB2_H_
>> +#define _MSM_VIDC_VB2_H_
>> +
>> +#include <media/videobuf2-core.h>
>> +#include <media/videobuf2-v4l2.h>
>> +
>> +#include "msm_vidc_inst.h"
>> +
>> +struct vb2_queue *msm_vidc_get_vb2q(struct msm_vidc_inst *inst,
>> +				    u32 type, const char *func);
>> +
>> +/* vb2_mem_ops */
>> +void *msm_vb2_alloc(struct vb2_buffer *vb, struct device *dev,
>> +		    unsigned long size);
>> +void *msm_vb2_attach_dmabuf(struct vb2_buffer *vb, struct device *dev,
>> +			    struct dma_buf *dbuf, unsigned long size);
>> +
>> +void msm_vb2_put(void *buf_priv);
>> +int msm_vb2_mmap(void *buf_priv, struct vm_area_struct *vma);
>> +void msm_vb2_detach_dmabuf(void *buf_priv);
>> +int msm_vb2_map_dmabuf(void *buf_priv);
>> +void msm_vb2_unmap_dmabuf(void *buf_priv);
>> +
>> +/* vb2_ops */
>> +int msm_vb2_queue_setup(struct vb2_queue *q,
>> +			unsigned int *num_buffers, unsigned int *num_planes,
>> +			unsigned int sizes[], struct device *alloc_devs[]);
>> +int msm_vidc_start_streaming(struct msm_vidc_inst *inst, struct vb2_queue *q);
>> +int msm_vidc_stop_streaming(struct msm_vidc_inst *inst, struct vb2_queue *q);
>> +int msm_vb2_start_streaming(struct vb2_queue *q, unsigned int count);
>> +void msm_vb2_stop_streaming(struct vb2_queue *q);
>> +void msm_vb2_buf_queue(struct vb2_buffer *vb2);
>> +#endif // _MSM_VIDC_VB2_H_
>> diff --git a/drivers/media/platform/qcom/iris/vidc/src/msm_vidc_vb2.c b/drivers/media/platform/qcom/iris/vidc/src/msm_vidc_vb2.c
>> new file mode 100644
>> index 0000000..c936d95
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/vidc/src/msm_vidc_vb2.c
>> @@ -0,0 +1,605 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include "msm_vdec.h"
>> +#include "msm_venc.h"
>> +#include "msm_vidc_control.h"
>> +#include "msm_vidc_core.h"
>> +#include "msm_vidc_debug.h"
>> +#include "msm_vidc_driver.h"
>> +#include "msm_vidc_inst.h"
>> +#include "msm_vidc_internal.h"
>> +#include "msm_vidc_platform.h"
>> +#include "msm_vidc_power.h"
>> +#include "msm_vidc_vb2.h"
>> +
>> +struct vb2_queue *msm_vidc_get_vb2q(struct msm_vidc_inst *inst,
>> +				    u32 type, const char *func)
>> +{
>> +	struct vb2_queue *q = NULL;
>> +
>> +	if (type == INPUT_MPLANE) {
>> +		q = inst->bufq[INPUT_PORT].vb2q;
>> +	} else if (type == OUTPUT_MPLANE) {
>> +		q = inst->bufq[OUTPUT_PORT].vb2q;
>> +	} else {
>> +		i_vpr_e(inst, "%s: invalid buffer type %d\n",
>> +			__func__, type);
>> +	}
>> +	return q;
>> +}
>> +
>> +void *msm_vb2_alloc(struct vb2_buffer *vb, struct device *dev,
>> +		    unsigned long size)
>> +{
>> +	return (void *)0xdeadbeef;
>> +}
>> +
>> +void *msm_vb2_attach_dmabuf(struct vb2_buffer *vb, struct device *dev,
>> +			    struct dma_buf *dbuf, unsigned long size)
>> +{
>> +	struct msm_vidc_inst *inst;
>> +	struct msm_vidc_core *core;
>> +	struct msm_vidc_buffer *buf = NULL;
>> +	struct msm_vidc_buffer *ro_buf, *dummy;
>> +
>> +	if (!vb || !dev || !dbuf || !vb->vb2_queue) {
>> +		d_vpr_e("%s: invalid params\n", __func__);
>> +		return NULL;
>> +	}
>> +	inst = vb->vb2_queue->drv_priv;
>> +	inst = get_inst_ref(g_core, inst);
>> +	if (!inst || !inst->core) {
>> +		d_vpr_e("%s: invalid params %pK\n", __func__, inst);
>> +		return NULL;
>> +	}
>> +	core = inst->core;
>> +
>> +	buf = msm_vidc_fetch_buffer(inst, vb);
>> +	if (!buf) {
>> +		i_vpr_e(inst, "%s: failed to fetch buffer\n", __func__);
>> +		buf = NULL;
>> +		goto exit;
>> +	}
>> +	buf->inst = inst;
>> +	buf->dmabuf = dbuf;
>> +
>> +	if (is_decode_session(inst) && is_output_buffer(buf->type)) {
>> +		list_for_each_entry_safe(ro_buf, dummy, &inst->buffers.read_only.list, list) {
>> +			if (ro_buf->dmabuf != buf->dmabuf)
>> +				continue;
>> +			print_vidc_buffer(VIDC_LOW, "low ", "attach: found ro buf", inst, ro_buf);
>> +			buf->attach = ro_buf->attach;
>> +			ro_buf->attach = NULL;
>> +			goto exit;
>> +		}
>> +	}
>> +
>> +	buf->attach = call_mem_op(core, dma_buf_attach, core, dbuf, dev);
>> +	if (!buf->attach) {
>> +		buf->attach = NULL;
>> +		buf = NULL;
>> +		goto exit;
>> +	}
>> +	print_vidc_buffer(VIDC_LOW, "low ", "attach", inst, buf);
>> +
>> +exit:
>> +	if (!buf)
>> +		msm_vidc_change_state(inst, MSM_VIDC_ERROR, __func__);
>> +	put_inst(inst);
>> +	return buf;
>> +}
>> +
>> +void msm_vb2_put(void *buf_priv)
>> +{
>> +}
>> +
>> +int msm_vb2_mmap(void *buf_priv, struct vm_area_struct *vma)
>> +{
>> +	return 0;
>> +}
>> +
>> +void msm_vb2_detach_dmabuf(void *buf_priv)
>> +{
>> +	struct msm_vidc_buffer *vbuf = buf_priv;
>> +	struct msm_vidc_buffer *ro_buf, *dummy;
>> +	struct msm_vidc_core *core;
>> +	struct msm_vidc_inst *inst;
>> +
>> +	if (!vbuf || !vbuf->inst) {
>> +		d_vpr_e("%s: invalid params\n", __func__);
>> +		return;
>> +	}
>> +	inst = vbuf->inst;
>> +	if (!inst || !inst->core) {
>> +		d_vpr_e("%s: invalid params %pK\n", __func__, inst);
>> +		return;
>> +	}
>> +	core = inst->core;
>> +
>> +	if (is_decode_session(inst) && is_output_buffer(vbuf->type)) {
>> +		list_for_each_entry_safe(ro_buf, dummy, &inst->buffers.read_only.list, list) {
>> +			if (ro_buf->dmabuf != vbuf->dmabuf)
>> +				continue;
>> +			print_vidc_buffer(VIDC_LOW, "low ", "detach: found ro buf", inst, ro_buf);
>> +			ro_buf->attach = vbuf->attach;
>> +			vbuf->attach = NULL;
>> +			goto exit;
>> +		}
>> +	}
>> +
>> +	print_vidc_buffer(VIDC_LOW, "low ", "detach", inst, vbuf);
>> +	if (vbuf->attach && vbuf->dmabuf) {
>> +		call_mem_op(core, dma_buf_detach, core, vbuf->dmabuf, vbuf->attach);
>> +		vbuf->attach = NULL;
>> +	}
>> +
>> +exit:
>> +	vbuf->dmabuf = NULL;
>> +	vbuf->inst = NULL;
>> +}
>> +
>> +int msm_vb2_map_dmabuf(void *buf_priv)
>> +{
>> +	int rc = 0;
>> +	struct msm_vidc_buffer *buf = buf_priv;
>> +	struct msm_vidc_core *core;
>> +	struct msm_vidc_inst *inst;
>> +	struct msm_vidc_buffer *ro_buf, *dummy;
>> +
>> +	if (!buf || !buf->inst) {
>> +		d_vpr_e("%s: invalid params\n", __func__);
>> +		return -EINVAL;
>> +	}
>> +	inst = buf->inst;
>> +	inst = get_inst_ref(g_core, inst);
>> +	if (!inst || !inst->core) {
>> +		d_vpr_e("%s: invalid params\n", __func__);
>> +		return -EINVAL;
>> +	}
>> +	core = inst->core;
>> +
>> +	if (is_decode_session(inst) && is_output_buffer(buf->type)) {
>> +		list_for_each_entry_safe(ro_buf, dummy, &inst->buffers.read_only.list, list) {
>> +			if (ro_buf->dmabuf != buf->dmabuf)
>> +				continue;
>> +			print_vidc_buffer(VIDC_LOW, "low ", "map: found ro buf", inst, ro_buf);
>> +			buf->sg_table = ro_buf->sg_table;
>> +			buf->device_addr = ro_buf->device_addr;
>> +			ro_buf->sg_table = NULL;
>> +			goto exit;
>> +		}
>> +	}
>> +
>> +	buf->sg_table = call_mem_op(core, dma_buf_map_attachment, core, buf->attach);
>> +	if (!buf->sg_table || !buf->sg_table->sgl) {
>> +		buf->sg_table = NULL;
>> +		rc = -ENOMEM;
>> +		goto exit;
>> +	}
>> +	buf->device_addr = sg_dma_address(buf->sg_table->sgl);
>> +	print_vidc_buffer(VIDC_HIGH, "high", "map", inst, buf);
>> +
>> +exit:
>> +	if (rc)
>> +		msm_vidc_change_state(inst, MSM_VIDC_ERROR, __func__);
>> +	put_inst(inst);
>> +	return rc;
>> +}
>> +
>> +void msm_vb2_unmap_dmabuf(void *buf_priv)
>> +{
>> +	struct msm_vidc_buffer *vbuf = buf_priv;
>> +	struct msm_vidc_buffer *ro_buf, *dummy;
>> +	struct msm_vidc_core *core;
>> +	struct msm_vidc_inst *inst;
>> +
>> +	if (!vbuf || !vbuf->inst) {
>> +		d_vpr_e("%s: invalid params\n", __func__);
>> +		return;
>> +	}
>> +	inst = vbuf->inst;
>> +	if (!inst || !inst->core) {
>> +		d_vpr_e("%s: invalid params %pK\n", __func__, inst);
>> +		return;
>> +	}
>> +	core = inst->core;
>> +
>> +	if (is_decode_session(inst) && is_output_buffer(vbuf->type)) {
>> +		list_for_each_entry_safe(ro_buf, dummy, &inst->buffers.read_only.list, list) {
>> +			if (ro_buf->dmabuf != vbuf->dmabuf)
>> +				continue;
>> +			print_vidc_buffer(VIDC_LOW, "low ", "unmap: found ro buf", inst, ro_buf);
>> +			ro_buf->sg_table = vbuf->sg_table;
>> +			vbuf->sg_table = NULL;
>> +			vbuf->device_addr = 0x0;
>> +			goto exit;
>> +		}
>> +	}
>> +
>> +	print_vidc_buffer(VIDC_HIGH, "high", "unmap", inst, vbuf);
>> +	if (vbuf->attach && vbuf->sg_table) {
>> +		call_mem_op(core, dma_buf_unmap_attachment, core, vbuf->attach, vbuf->sg_table);
>> +		vbuf->sg_table = NULL;
>> +		vbuf->device_addr = 0x0;
>> +	}
>> +
>> +exit:
>> +	return;
>> +}
>> +
>> +int msm_vb2_queue_setup(struct vb2_queue *q,
>> +			unsigned int *num_buffers, unsigned int *num_planes,
>> +			unsigned int sizes[], struct device *alloc_devs[])
>> +{
>> +	int rc = 0;
>> +	struct msm_vidc_inst *inst;
>> +	struct msm_vidc_core *core;
>> +	int port;
>> +	struct v4l2_format *f;
>> +	enum msm_vidc_buffer_type buffer_type = 0;
>> +	enum msm_vidc_buffer_region region = MSM_VIDC_REGION_NONE;
>> +	struct context_bank_info *cb = NULL;
>> +	struct msm_vidc_buffers *buffers;
>> +
>> +	if (!q || !num_buffers || !num_planes ||
>> +	    !sizes || !q->drv_priv) {
>> +		d_vpr_e("%s: invalid params, q = %pK, %pK, %pK\n",
>> +			__func__, q, num_buffers, num_planes);
>> +		return -EINVAL;
>> +	}
>> +	inst = q->drv_priv;
>> +	if (!inst || !inst->core) {
>> +		d_vpr_e("%s: invalid params %pK\n", __func__, inst);
>> +		return -EINVAL;
>> +	}
>> +	core = inst->core;
>> +
>> +	if (is_state(inst, MSM_VIDC_STREAMING)) {
>> +		i_vpr_e(inst, "%s: invalid state %d\n", __func__, inst->state);
>> +		return -EINVAL;
>> +	}
>> +
>> +	port = v4l2_type_to_driver_port(inst, q->type, __func__);
>> +	if (port < 0)
>> +		return -EINVAL;
>> +
>> +	/* prepare dependency list once per session */
>> +	if (!inst->caps_list_prepared) {
>> +		rc = msm_vidc_prepare_dependency_list(inst);
>> +		if (rc)
>> +			return rc;
>> +		inst->caps_list_prepared = true;
>> +	}
>> +
>> +	/* adjust v4l2 properties for master port */
>> +	if ((is_encode_session(inst) && port == OUTPUT_PORT) ||
>> +	    (is_decode_session(inst) && port == INPUT_PORT)) {
>> +		rc = msm_vidc_adjust_v4l2_properties(inst);
>> +		if (rc) {
>> +			i_vpr_e(inst, "%s: failed to adjust properties\n", __func__);
>> +			return rc;
>> +		}
>> +	}
>> +
>> +	if (*num_planes && (port == INPUT_PORT || port == OUTPUT_PORT)) {
>> +		f = &inst->fmts[port];
>> +		if (*num_planes != f->fmt.pix_mp.num_planes) {
>> +			i_vpr_e(inst, "%s: requested num_planes %d not supported %d\n",
>> +				__func__, *num_planes, f->fmt.pix_mp.num_planes);
>> +			return -EINVAL;
>> +		}
>> +		if (sizes[0] < inst->fmts[port].fmt.pix_mp.plane_fmt[0].sizeimage) {
>> +			i_vpr_e(inst, "%s: requested size %d not acceptable\n",
>> +				__func__, sizes[0]);
>> +			return -EINVAL;
>> +		}
>> +	}
>> +
>> +	buffer_type = v4l2_type_to_driver(q->type, __func__);
>> +	if (!buffer_type)
>> +		return -EINVAL;
>> +
>> +	rc = msm_vidc_free_buffers(inst, buffer_type);
>> +	if (rc) {
>> +		i_vpr_e(inst, "%s: failed to free buffers, type %s\n",
>> +			__func__, v4l2_type_name(q->type));
>> +		return rc;
>> +	}
>> +
>> +	buffers = msm_vidc_get_buffers(inst, buffer_type, __func__);
>> +	if (!buffers)
>> +		return -EINVAL;
>> +
>> +	buffers->min_count = call_session_op(core, min_count, inst, buffer_type);
>> +	buffers->extra_count = call_session_op(core, extra_count, inst, buffer_type);
>> +	if (*num_buffers < buffers->min_count + buffers->extra_count)
>> +		*num_buffers = buffers->min_count + buffers->extra_count;
>> +	buffers->actual_count = *num_buffers;
>> +	*num_planes = 1;
>> +
>> +	buffers->size = call_session_op(core, buffer_size, inst, buffer_type);
>> +
>> +	inst->fmts[port].fmt.pix_mp.plane_fmt[0].sizeimage = buffers->size;
>> +	sizes[0] = inst->fmts[port].fmt.pix_mp.plane_fmt[0].sizeimage;
>> +
>> +	rc = msm_vidc_allocate_buffers(inst, buffer_type, *num_buffers);
>> +	if (rc) {
>> +		i_vpr_e(inst, "%s: failed to allocate buffers, type %s\n",
>> +			__func__, v4l2_type_name(q->type));
>> +		return rc;
>> +	}
>> +
>> +	region = call_mem_op(core, buffer_region, inst, buffer_type);
>> +	cb = msm_vidc_get_context_bank_for_region(core, region);
>> +	if (!cb) {
>> +		d_vpr_e("%s: Failed to get context bank device\n",
>> +			__func__);
>> +		return -EIO;
>> +	}
>> +	q->dev = cb->dev;
>> +
>> +	i_vpr_h(inst,
>> +		"queue_setup: type %s num_buffers %d sizes[0] %d cb %s\n",
>> +		v4l2_type_name(q->type), *num_buffers, sizes[0], cb->name);
>> +	return rc;
>> +}
>> +
>> +int msm_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
>> +{
>> +	int rc = 0;
>> +	struct msm_vidc_inst *inst;
>> +
>> +	if (!q || !q->drv_priv) {
>> +		d_vpr_e("%s: invalid input, q = %pK\n", __func__, q);
>> +		return -EINVAL;
>> +	}
>> +	inst = q->drv_priv;
>> +	if (!inst || !inst->core) {
>> +		d_vpr_e("%s: invalid params\n", __func__);
>> +		return -EINVAL;
>> +	}
>> +
>> +	rc = inst->event_handle(inst, MSM_VIDC_STREAMON, q);
>> +	if (rc) {
>> +		i_vpr_e(inst, "Streamon: %s failed\n", v4l2_type_name(q->type));
>> +		msm_vidc_change_state(inst, MSM_VIDC_ERROR, __func__);
>> +		goto exit;
>> +	}
>> +
>> +exit:
>> +	return rc;
>> +}
>> +
>> +int msm_vidc_start_streaming(struct msm_vidc_inst *inst, struct vb2_queue *q)
>> +{
>> +	enum msm_vidc_buffer_type buf_type;
>> +	int rc = 0;
>> +
>> +	if (q->type != INPUT_MPLANE && q->type != OUTPUT_MPLANE) {
>> +		i_vpr_e(inst, "%s: invalid type %d\n", __func__, q->type);
>> +		return -EINVAL;
>> +	}
>> +	if (!is_decode_session(inst) && !is_encode_session(inst)) {
>> +		i_vpr_e(inst, "%s: invalid session %d\n", __func__, inst->domain);
>> +		return -EINVAL;
>> +	}
>> +	i_vpr_h(inst, "Streamon: %s\n", v4l2_type_name(q->type));
>> +
>> +	if (!inst->once_per_session_set) {
> 
> This seems miss-placed, I think you should be able to move this into your driver
> open() call and drop the inst->once_per_session_set boolean>
The APIs being invoked under this condition can't be moved to open.
msm_vidc_session_set_codec is called to set the codec which is not known at
open, and only known at s_fmt.
buffer sizes for different internal buffer will be known only after s_fmt.
hence these setting are being done in start streaming.

Thanks,
Dikshita
>> +		inst->once_per_session_set = true;
>> +		rc = msm_vidc_session_set_codec(inst);
>> +		if (rc)
>> +			return rc;
>> +
>> +		if (is_encode_session(inst)) {
>> +			rc = msm_vidc_alloc_and_queue_session_int_bufs(inst,
>> +								       MSM_VIDC_BUF_ARP);
>> +			if (rc)
>> +				return rc;
>> +		} else if (is_decode_session(inst)) {
>> +			rc = msm_vidc_session_set_default_header(inst);
>> +			if (rc)
>> +				return rc;
>> +
>> +			rc = msm_vidc_alloc_and_queue_session_int_bufs(inst,
>> +								       MSM_VIDC_BUF_PERSIST);
>> +			if (rc)
>> +				return rc;
>> +		}
>> +	}
>> +
>> +	if (is_decode_session(inst))
>> +		inst->decode_batch.enable = msm_vidc_allow_decode_batch(inst);
>> +
>> +	msm_vidc_allow_dcvs(inst);
>> +	msm_vidc_power_data_reset(inst);
>> +
>> +	if (q->type == INPUT_MPLANE) {
>> +		if (is_decode_session(inst))
>> +			rc = msm_vdec_streamon_input(inst);
>> +		else if (is_encode_session(inst))
>> +			rc = msm_venc_streamon_input(inst);
>> +	} else if (q->type == OUTPUT_MPLANE) {
>> +		if (is_decode_session(inst))
>> +			rc = msm_vdec_streamon_output(inst);
>> +		else if (is_encode_session(inst))
>> +			rc = msm_venc_streamon_output(inst);
>> +	}
>> +	if (rc)
>> +		return rc;
>> +
>> +	/* print final buffer counts & size details */
>> +	msm_vidc_print_buffer_info(inst);
>> +
>> +	/* print internal buffer memory usage stats */
>> +	msm_vidc_print_memory_stats(inst);
>> +
>> +	buf_type = v4l2_type_to_driver(q->type, __func__);
>> +	if (!buf_type)
>> +		return -EINVAL;
>> +
>> +	/* queue pending buffers */
>> +	rc = msm_vidc_queue_deferred_buffers(inst, buf_type);
>> +	if (rc)
>> +		return rc;
>> +
>> +	/* initialize statistics timer(one time) */
>> +	if (!inst->stats.time_ms)
>> +		inst->stats.time_ms = ktime_get_ns() / 1000 / 1000;
>> +
>> +	/* schedule to print buffer statistics */
>> +	rc = schedule_stats_work(inst);
>> +	if (rc)
>> +		return rc;
>> +
>> +	if ((q->type == INPUT_MPLANE && inst->bufq[OUTPUT_PORT].vb2q->streaming) ||
>> +	    (q->type == OUTPUT_MPLANE && inst->bufq[INPUT_PORT].vb2q->streaming)) {
>> +		rc = msm_vidc_get_properties(inst);
>> +		if (rc)
>> +			return rc;
>> +	}
>> +
>> +	i_vpr_h(inst, "Streamon: %s successful\n", v4l2_type_name(q->type));
>> +	return rc;
>> +}
>> +
>> +int msm_vidc_stop_streaming(struct msm_vidc_inst *inst, struct vb2_queue *q)
>> +{
>> +	int rc = 0;
>> +
>> +	if (q->type != INPUT_MPLANE && q->type != OUTPUT_MPLANE) {
>> +		i_vpr_e(inst, "%s: invalid type %d\n", __func__, q->type);
>> +		return -EINVAL;
>> +	}
>> +	if (!is_decode_session(inst) && !is_encode_session(inst)) {
>> +		i_vpr_e(inst, "%s: invalid session %d\n", __func__, inst->domain);
>> +		return -EINVAL;
>> +	}
>> +	i_vpr_h(inst, "Streamoff: %s\n", v4l2_type_name(q->type));
>> +
>> +	if (q->type == INPUT_MPLANE) {
>> +		if (is_decode_session(inst))
>> +			rc = msm_vdec_streamoff_input(inst);
>> +		else if (is_encode_session(inst))
>> +			rc = msm_venc_streamoff_input(inst);
>> +	} else if (q->type == OUTPUT_MPLANE) {
>> +		if (is_decode_session(inst))
>> +			rc = msm_vdec_streamoff_output(inst);
>> +		else if (is_encode_session(inst))
>> +			rc = msm_venc_streamoff_output(inst);
>> +	}
>> +	if (rc)
>> +		return rc;
>> +
>> +	/* Input port streamoff */
>> +	if (q->type == INPUT_MPLANE) {
>> +		/* flush timestamps list */
>> +		msm_vidc_flush_ts(inst);
>> +	}
>> +
>> +	/* print internal buffer memory usage stats */
>> +	msm_vidc_print_memory_stats(inst);
>> +
>> +	i_vpr_h(inst, "Streamoff: %s successful\n", v4l2_type_name(q->type));
>> +	return rc;
>> +}
>> +
>> +void msm_vb2_stop_streaming(struct vb2_queue *q)
>> +{
>> +	struct msm_vidc_inst *inst;
>> +	int rc = 0;
>> +
>> +	if (!q || !q->drv_priv) {
>> +		d_vpr_e("%s: invalid input, q = %pK\n", __func__, q);
>> +		return;
>> +	}
>> +	inst = q->drv_priv;
>> +	if (!inst) {
>> +		d_vpr_e("%s: invalid params\n", __func__);
>> +		return;
>> +	}
>> +
>> +	rc = inst->event_handle(inst, MSM_VIDC_STREAMOFF, q);
>> +	if (rc) {
>> +		i_vpr_e(inst, "Streamoff: %s failed\n", v4l2_type_name(q->type));
>> +		msm_vidc_change_state(inst, MSM_VIDC_ERROR, __func__);
>> +	}
>> +}
>> +
>> +void msm_vb2_buf_queue(struct vb2_buffer *vb2)
>> +{
>> +	int rc = 0;
>> +	struct msm_vidc_inst *inst;
>> +	struct dma_buf *dbuf = NULL;
>> +	struct msm_vidc_core *core;
>> +	u64 ktime_ns = ktime_get_ns();
>> +
>> +	if (!vb2) {
>> +		d_vpr_e("%s: invalid params\n", __func__);
>> +		return;
>> +	}
>> +
>> +	inst = vb2_get_drv_priv(vb2->vb2_queue);
>> +	if (!inst || !inst->core) {
>> +		d_vpr_e("%s: invalid params\n", __func__);
>> +		return;
>> +	}
>> +	core = inst->core;
>> +
>> +	if (!vb2->planes[0].bytesused) {
>> +		if (vb2->type == INPUT_MPLANE) {
>> +			/* Expecting non-zero filledlen on INPUT port */
>> +			i_vpr_e(inst,
>> +				"%s: zero bytesused input buffer not supported\n", __func__);
>> +			rc = -EINVAL;
>> +			goto exit;
>> +		}
>> +	}
>> +
>> +	inst->last_qbuf_time_ns = ktime_ns;
>> +
>> +	if (vb2->type == INPUT_MPLANE) {
>> +		rc = msm_vidc_update_input_rate(inst, div_u64(ktime_ns, 1000));
>> +		if (rc)
>> +			goto exit;
>> +	}
>> +
>> +	/*
>> +	 * Userspace may close fd(from other thread), before driver attempts to call
>> +	 * dma_buf_get() in qbuf(FTB) sequence(for decoder output buffer) which may
>> +	 * lead to different kind of security issues. Add check to compare if dma_buf
>> +	 * address is matching with driver dma_buf_get returned address for that fd.
>> +	 */
>> +
>> +	dbuf = call_mem_op(core, dma_buf_get, inst, vb2->planes[0].m.fd);
>> +	if (dbuf != vb2->planes[0].dbuf) {
>> +		i_vpr_e(inst, "%s: invalid dmabuf address 0x%p expected 0x%p\n",
>> +			__func__, dbuf, vb2->planes[0].dbuf);
>> +		rc = -EINVAL;
>> +		goto exit;
>> +	}
>> +
>> +	if (is_decode_session(inst))
>> +		rc = msm_vdec_qbuf(inst, vb2);
>> +	else if (is_encode_session(inst))
>> +		rc = msm_venc_qbuf(inst, vb2);
>> +	else
>> +		rc = -EINVAL;
>> +	if (rc) {
>> +		print_vb2_buffer("failed vb2-qbuf", inst, vb2);
>> +		goto exit;
>> +	}
>> +
>> +exit:
>> +	if (dbuf)
>> +		call_mem_op(core, dma_buf_put, inst, dbuf);
>> +
>> +	if (rc) {
>> +		msm_vidc_change_state(inst, MSM_VIDC_ERROR, __func__);
>> +		vb2_buffer_done(vb2, VB2_BUF_STATE_ERROR);
>> +	}
>> +}
> 
