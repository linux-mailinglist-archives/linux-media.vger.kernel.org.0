Return-Path: <linux-media+bounces-14931-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D177992E989
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 15:30:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0201A1C22A40
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 13:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD0015F404;
	Thu, 11 Jul 2024 13:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BW2Gixus"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A8E155740;
	Thu, 11 Jul 2024 13:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720704629; cv=none; b=etXaPEzDJLhYVPQWNaEJ/fILJyeiNxob3Qsdqcj+ZGQiP2UdjkwIzBW+XYnRGT6uxV8nOm3DVJDyRjSVndvMoGkqcxj5YsjkrznAe/tws8Oxs/ikjEd0Clz/5sraNwagPjZYubIHMV4c6UUHPejMWLlUoo3n8oS9TF/axF2AEHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720704629; c=relaxed/simple;
	bh=zBXnTupX6agqwu5I9JJwoTmnjOAq7HGv/adp9P0UmDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jKZFyScI3nhsJRsREvlZk5F7kex9PBl1dsvBJtBk44lFqWzyXQZH79b0dUlSuYET9vgdQFAKbdoUeToDvLOvhW4Hl7eusbGSfgRY6S08S7gfmgC2Dhag+PPoeknQ4nLMcYC1qoez7Vk5sbxn46T/HkblWYYJePFMSXOKyTYrL3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BW2Gixus; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46B4mjOs014557;
	Thu, 11 Jul 2024 13:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nn0IROJi4/TTuRWprP42UxnXjxXaTcfE4/Beqv+jUxU=; b=BW2Gixuse4A5NyLi
	L6j9WqnWwLdxnFaJRWT9IRjE+pRQRuLiA1diOYrwOfx4yeziYEZgPb7FHFbPPYhE
	6FDJpNfkxjdcRNbZGjRw9n3yAc5xnfMInIC2INkXfSSnLyLgD4+37/jIJGtjpuhl
	mREDPqNUm1L9NQUa2hfdendUqIbDdr6o2HoGedcl/DlxXGEPVTUDmtfd8A9x9fJc
	S5hFgElbS79tB10Au6+QKWlbXr+ZuXi2rRN4ZNOvcxwLG5VuWoyGU+D3tQF0zWzQ
	20Qeg8o5mzua2P4VSDmMHTQrts7VnKQziKaDFXv3Y3WmU9tqvsbM+49uRUPrvgnm
	ZwI1ww==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 409kdtmakw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 13:30:03 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46BDU16d014095
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 13:30:01 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Jul
 2024 06:29:55 -0700
Message-ID: <b73f1117-580b-46cf-8c56-9e78974b6e45@quicinc.com>
Date: Thu, 11 Jul 2024 21:29:53 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] media: qcom: camss: Add support for VFE hardware
 version Titan 780
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <quic_eberman@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Yongsheng Li
	<quic_yon@quicinc.com>
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-11-quic_depengs@quicinc.com>
 <7bc37232-4502-423b-ada6-e11dc518a0cc@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <7bc37232-4502-423b-ada6-e11dc518a0cc@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: btU7Q9rlNMgD8LGhQecmJ1c1ihMeO0XG
X-Proofpoint-GUID: btU7Q9rlNMgD8LGhQecmJ1c1ihMeO0XG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_09,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407110096

Hi Bryan,


On 7/10/2024 7:47 PM, Bryan O'Donoghue wrote:
> On 09/07/2024 17:06, Depeng Shao wrote:
>> Add support for VFE found on SM8550 (Titan 780). This implementation is
>> based on the titan 480 implementation. It supports the normal and lite
>> VFE.
>>
>> Co-developed-by: Yongsheng Li <quic_yon@quicinc.com>
>> Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
>> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/camss/Makefile    |   1 +
>>   .../media/platform/qcom/camss/camss-vfe-780.c | 404 ++++++++++++++++++
>>   2 files changed, 405 insertions(+)
>>   create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-780.c
>>
>> diff --git a/drivers/media/platform/qcom/camss/Makefile 
>> b/drivers/media/platform/qcom/camss/Makefile
>> index c336e4c1a399..a83b7a8dcef7 100644
>> --- a/drivers/media/platform/qcom/camss/Makefile
>> +++ b/drivers/media/platform/qcom/camss/Makefile
>> @@ -17,6 +17,7 @@ qcom-camss-objs += \
>>           camss-vfe-4-8.o \
>>           camss-vfe-17x.o \
>>           camss-vfe-480.o \
>> +        camss-vfe-780.o \
>>           camss-vfe-gen1.o \
>>           camss-vfe.o \
>>           camss-video.o \
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-780.c 
>> b/drivers/media/platform/qcom/camss/camss-vfe-780.c
>> new file mode 100644
>> index 000000000000..abef2d5b9c2e
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe-780.c
>> @@ -0,0 +1,404 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * camss-vfe-780.c

>> +
>> +static u32 vfe_hw_version(struct vfe_device *vfe)
>> +{
>> +    u32 hw_version = readl_relaxed(vfe->base + VFE_HW_VERSION);
>> +
>> +    u32 gen = (hw_version >> 28) & 0xF;
>> +    u32 rev = (hw_version >> 16) & 0xFFF;
>> +    u32 step = hw_version & 0xFFFF;
>> +
>> +    dev_info(vfe->camss->dev, "VFE HW Version = %u.%u.%u\n", gen, 
>> rev, step);
>> +
>> +    return hw_version;
>> +}
> 
> This could be functionally decomposed into vfe_hw_version_v2() or 
> similar and exported by camss-vfe.c
> 
>> +

Yes, same with below comments, I will try to figure out which functions 
can be moved to common files.


>> +
>> +/*
>> + * vfe_isr - VFE module interrupt handler
>> + * @irq: Interrupt line
>> + * @dev: VFE device
>> + *
>> + * Return IRQ_HANDLED on success
>> + */
>> +static irqreturn_t vfe_isr(int irq, void *dev)
>> +{
>> +    /* Buf Done has beem moved to CSID in Titan 780.
>> +     * Disable VFE related IRQ.
>> +     * Clear the contents of this function.
>> +     * Return IRQ_HANDLED.
>> +     */
>> +    return IRQ_HANDLED;
>> +}
> 
> What's the point of this ISR at all if it never fires and just returns 
> done ?
> 
> Since it takes no action - it can't do anything useful and therefore if 
> it ever did fire, would fire ad infinitum.
> 
> Please drop
Sure, will drop it.


>> +
>> +static int vfe_get_output(struct vfe_line *line)
>> +{
>> +    struct vfe_device *vfe = to_vfe(line);
>> +    struct vfe_output *output;
>> +    unsigned long flags;
>> +
>> +    spin_lock_irqsave(&vfe->output_lock, flags);
>> +
>> +    output = &line->output;
>> +    if (output->state > VFE_OUTPUT_RESERVED) {
>> +        dev_err(vfe->camss->dev, "Output is running\n");
>> +        goto error;
>> +    }
>> +
>> +    output->wm_num = 1;
>> +
>> +    /* Correspondence between VFE line number and WM number.
>> +     * line 0 -> RDI 0, line 1 -> RDI1, line 2 -> RDI2, line 3 -> 
>> PIX/RDI3
>> +     * Note this 1:1 mapping will not work for PIX streams.
>> +     */
>> +    output->wm_idx[0] = line->id;
>> +    vfe->wm_output_map[line->id] = line->id;
>> +
>> +    output->drop_update_idx = 0;
>> +
>> +    spin_unlock_irqrestore(&vfe->output_lock, flags);
>> +
>> +    return 0;
>> +
>> +error:
>> +    spin_unlock_irqrestore(&vfe->output_lock, flags);
>> +    output->state = VFE_OUTPUT_OFF;
>> +
>> +    return -EINVAL;
>> +}
> 
> This is copy/paste from vfe480 and should be functionally decomposed 
> into a common function in camss-vfe.
Sure, the flow of some functions are same with other platform, and don't 
read/write registers, this can be moved to a common file and reused by 
all platform.
I will think about this.

>> +
>> +static int vfe_enable_output(struct vfe_line *line)
>> +{
>> +    struct vfe_device *vfe = to_vfe(line);
>> +    struct vfe_output *output = &line->output;
>> +    unsigned long flags;
>> +    unsigned int i;
>> +
>> +    spin_lock_irqsave(&vfe->output_lock, flags);
>> +
>> +    vfe_reg_update_clear(vfe, line->id);
>> +
>> +    if (output->state > VFE_OUTPUT_RESERVED) {
>> +        dev_err(vfe->camss->dev, "Output is not in reserved state %d\n",
>> +            output->state);
>> +        spin_unlock_irqrestore(&vfe->output_lock, flags);
>> +        return -EINVAL;
>> +    }
>> +
>> +    WARN_ON(output->gen2.active_num);
>> +
>> +    output->state = VFE_OUTPUT_ON;
>> +
>> +    output->sequence = 0;
>> +
>> +    vfe_wm_start(vfe, output->wm_idx[0], line);
>> +
>> +    for (i = 0; i < MAX_VFE_ACT_BUF; i++) {
>> +        output->buf[i] = vfe_buf_get_pending(output);
>> +        if (!output->buf[i])
>> +            break;
>> +        output->gen2.active_num++;
>> +        vfe_wm_update(vfe, output->wm_idx[0], 
>> output->buf[i]->addr[0], line);
>> +
>> +        vfe_reg_update(vfe, line->id);
> 
> I see this differs from vfe480 in that vfe_reg_update(vfe, line-id); is 
> done on each iteration of this loop whereas in 480 it is done directly 
> after the loop, seems to me this would be a valid fix for 480 too 
> leading to my next comment
> 

Yes, vfe-480 also need this.

>> +    }
>> +
>> +    spin_unlock_irqrestore(&vfe->output_lock, flags);
>> +
>> +    return 0;
>> +}
> 
> This function is so similar across different SoCs with very minor 
> differences that instead of copy/pasting and very slightly tweaking, we 
> should be functionally decomposing and using a flag of some kind to 
> differentaite between wait_reg_update logic in 480 and not in 780.
> 
> Again I think we should functionally decompose into camss-vfe.c and use 
> a flag to branch the logic for the very slight logical difference 
> between the two
> 
> vfe-480.c
> 
>          output->sequence = 0;
>          output->wait_reg_update = 0;
>          reinit_completion(&output->reg_update);
> 
> As a result your fix for line->id would be useful across SoCs instead of 
> isolated to vfe 780.
> 

Yes, some functions are same code flow, and don't read/write register, 
this can be moved to a common file and reused by all platform.
I will think about this.

>> +
>> +/*
>> + * vfe_enable - Enable streaming on VFE line
>> + * @line: VFE line
>> + *
>> + * Return 0 on success or a negative error code otherwise
>> + */
>> +static int vfe_enable(struct vfe_line *line)
>> +{
>> +    struct vfe_device *vfe = to_vfe(line);
>> +    int ret;
>> +
>> +    mutex_lock(&vfe->stream_lock);
>> +
>> +    vfe->stream_count++;
>> +
>> +    mutex_unlock(&vfe->stream_lock);
>> +
>> +    ret = vfe_get_output(line);
>> +    if (ret < 0)
>> +        goto error_get_output;
>> +
>> +    ret = vfe_enable_output(line);
>> +    if (ret < 0)
>> +        goto error_enable_output;
>> +
>> +    vfe->was_streaming = 1;
>> +
>> +    return 0;
>> +
>> +error_enable_output:
>> +    vfe_put_output(line);
>> +
>> +error_get_output:
>> +    mutex_lock(&vfe->stream_lock);
>> +
>> +    vfe->stream_count--;
>> +
>> +    mutex_unlock(&vfe->stream_lock);
>> +
>> +    return ret;
>> +}
> 
> Same thesis on functional decomposition - this should be moved to 
> camss-vfe.c and made common - its only a minor difference betwen the 
> required logic on different SoCs so there's not a compelling reason to 
> have largely identical functions living in difference .c files in the 
> same driver.
> 

Sure, I will check which functions can be moved to camss-vfe.c.

Thanks,
Depeng

