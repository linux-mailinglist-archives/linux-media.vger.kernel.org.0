Return-Path: <linux-media+bounces-26042-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F60A32163
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 09:45:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E06661886F71
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 08:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6736205AB4;
	Wed, 12 Feb 2025 08:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HvRdISk0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16722205AA2
	for <linux-media@vger.kernel.org>; Wed, 12 Feb 2025 08:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739349902; cv=none; b=nSfPZG0M6ZJk6CtDhO8DXIOP9YpkHX0eDa1BE8vMJXe9KpriFy0Fyualm7SRtlmjmuH31fNKsQYFbt90EsGI1gvbiOZn4qB/c4Bi9zMqgS3esgjTW6xxWy6JOLYZo1Ro+S1/F2R0CR1xdC8WZciP7tcAD2/wZ/1Q3EEWWR+IGGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739349902; c=relaxed/simple;
	bh=GG96kYxVT32AyoidxXb0MTjchmdeVtz5Wf5oe567R+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mcGZ0Q1q5ze9ViJ+R4Eqy5X4RGpMEvdnEumqPUHwm37oQWNShJmQCYCYPsqYMOM5+554lkJGSTBGD9Godb4x3RUibnFbGX9zmNQwUO1Gx9wExgNayV/1v9PJvrJBmDwkJswI53JHtU/D0TZTfDX0UhlYGpmHpZfpnf9LHY04toc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HvRdISk0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51C21Huc010515;
	Wed, 12 Feb 2025 08:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rm+j9kIM91Kgr09YF8hBoG5OUFhgZbpX5d/YzaURlBM=; b=HvRdISk0NcbkNOOL
	pSptKOqDNnJ13DLrQjHsZ9Q/eVU3TZXOisCO4vKdNK7pDMWdiX44ABcB8Cd6Iam8
	8MjP0gQKIuiHgmby8111SXIRC1FxO+1Q/kb/BpNVBZZA3zr1O9OTIKjR3tISdipS
	nItarljzLT9TG8wwM6PKqr+lNILeK1Go7+1onq6Sj3Zs9ppN30cX62TI8XtFWFQE
	Fi3Up5oc5ZUFmX7ONapmA6sAKf/LihQhWqrgTVI4//Ztw6R0L652z6uJz1FxypvT
	zIK2BJGDzO+ctdsjN/O9BJNE3+BqQdwQBGR2Lw38P0pffUE9FJG7Mj+2MwEWzkR4
	H/nRvw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qcs5f7jr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 08:44:54 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51C8irlt023590
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 08:44:53 GMT
Received: from [10.204.66.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Feb
 2025 00:44:51 -0800
Message-ID: <5d406589-0e19-401a-8359-5a6168315bc7@quicinc.com>
Date: Wed, 12 Feb 2025 14:14:32 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] media: qcom: camss: Add support for VFE 690
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>
CC: <linux-media@vger.kernel.org>,
        Suresh Vankadara
	<quic_svankada@quicinc.com>
References: <20250210162843.609337-1-quic_vikramsa@quicinc.com>
 <20250210162843.609337-5-quic_vikramsa@quicinc.com>
 <f35f3b57-4cc5-432d-8a4d-8d0cfdbee7a5@linaro.org>
Content-Language: en-US
From: Vikram Sharma <quic_vikramsa@quicinc.com>
In-Reply-To: <f35f3b57-4cc5-432d-8a4d-8d0cfdbee7a5@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SopUZe4uV3McHViMZGtQ3HPMBPGkI1if
X-Proofpoint-GUID: SopUZe4uV3McHViMZGtQ3HPMBPGkI1if
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502120066


On 2/11/2025 2:08 AM, Bryan O'Donoghue wrote:
> On 10/02/2025 16:28, Vikram Sharma wrote:
>> Add support for VFE found on SA8775P (Titan 690). This VFE is
>> different from vfe 780 w.r.t few register offsets.
>> It supports two full and five lite VFE.
>>
>> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
>> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/camss/Makefile    |   1 +
>>   .../media/platform/qcom/camss/camss-vfe-690.c | 163 +++++++++++++++
>>   drivers/media/platform/qcom/camss/camss-vfe.c |   5 +-
>>   drivers/media/platform/qcom/camss/camss-vfe.h |   1 +
>>   drivers/media/platform/qcom/camss/camss.c     | 192 ++++++++++++++++++
>>   5 files changed, 361 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-690.c
>>
>> diff --git a/drivers/media/platform/qcom/camss/Makefile 
>> b/drivers/media/platform/qcom/camss/Makefile
>> index f1d0e9a00220..284f1775f62f 100644
>> --- a/drivers/media/platform/qcom/camss/Makefile
>> +++ b/drivers/media/platform/qcom/camss/Makefile
>> @@ -18,6 +18,7 @@ qcom-camss-objs += \
>>           camss-vfe-4-8.o \
>>           camss-vfe-17x.o \
>>           camss-vfe-480.o \
>> +        camss-vfe-690.o \
>>           camss-vfe-780.o \
>>           camss-vfe-gen1.o \
>>           camss-vfe.o \
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-690.c 
>> b/drivers/media/platform/qcom/camss/camss-vfe-690.c
>> new file mode 100644
>> index 000000000000..92c92065f65b
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe-690.c
>> @@ -0,0 +1,163 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module v690 
>> (SA8755P)
>> + *
>> + * Copyright (c) 2025 Qualcomm Technologies, Inc.
>> + */
>> +
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/iopoll.h>
>> +
>> +#include "camss.h"
>> +#include "camss-vfe.h"
>> +
>> +#define VFE_TOP_CORE_CFG        (0x24)
>> +#define BUS_REG_BASE            (vfe_is_lite(vfe) ? 0x480 : 0x400)
>> +
>> +#define VFE_BUS_WM_CGC_OVERRIDE        (BUS_REG_BASE + 0x08)
>> +#define    WM_CGC_OVERRIDE_ALL        (0x7FFFFFF)
>> +
>> +#define VFE_BUS_WM_TEST_BUS_CTRL    (BUS_REG_BASE + 0xFC)
>> +
>> +#define VFE_BUS_WM_CFG(n)        (BUS_REG_BASE + 0x200 + (n) * 0x100)
>> +#define        WM_CFG_EN            BIT(0)
>> +#define        WM_VIR_FRM_EN            BIT(1)
>> +#define        WM_CFG_MODE            BIT(16)
>> +#define VFE_BUS_WM_IMAGE_ADDR(n)    (BUS_REG_BASE + 0x204 + (n) * 
>> 0x100)
>> +#define VFE_BUS_WM_FRAME_INCR(n)    (BUS_REG_BASE + 0x208 + (n) * 
>> 0x100)
>> +#define VFE_BUS_WM_IMAGE_CFG_0(n)    (BUS_REG_BASE + 0x20c + (n) * 
>> 0x100)
>> +#define        WM_IMAGE_CFG_0_DEFAULT_WIDTH    (0xFFFF)
>> +#define VFE_BUS_WM_IMAGE_CFG_2(n)    (BUS_REG_BASE + 0x214 + (n) * 
>> 0x100)
>> +#define        WM_IMAGE_CFG_2_DEFAULT_STRIDE    (0xFFFF)
>> +#define VFE_BUS_WM_PACKER_CFG(n)    (BUS_REG_BASE + 0x218 + (n) * 
>> 0x100)
>> +
>> +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(n)    (BUS_REG_BASE + 0x230 
>> + (n) * 0x100)
>> +#define VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(n)    (BUS_REG_BASE + 0x234 
>> + (n) * 0x100)
>> +#define VFE_BUS_WM_FRAMEDROP_PERIOD(n)        (BUS_REG_BASE + 0x238 
>> + (n) * 0x100)
>> +#define VFE_BUS_WM_FRAMEDROP_PATTERN(n)        (BUS_REG_BASE + 0x23c 
>> + (n) * 0x100)
>> +
>> +#define VFE_BUS_WM_MMU_PREFETCH_CFG(n)        (BUS_REG_BASE + 0x260 
>> + (n) * 0x100)
>> +#define VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(n)    (BUS_REG_BASE + 
>> 0x264 + (n) * 0x100)
>> +
>> +/*
>> + * Bus client mapping:
>> + *
>> + * VFE:
>> + * 16 = RDI0, 17 = RDI1, 18 = RDI2
>> + *
>> + * VFE LITE:
>> + * 0 = RDI0, 1 = RDI1, 2 = RDI2, 3 = RDI3, 4 = RDI4, 5 = RDI5
>> + */
>> +#define RDI_WM(n)            ((vfe_is_lite(vfe) ? 0x0 : 0x10) + (n))
>> +
>> +static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct 
>> vfe_line *line)
>> +{
>> +    struct v4l2_pix_format_mplane *pix =
>> +        &line->video_out.active_fmt.fmt.pix_mp;
>> +
>> +    wm = RDI_WM(wm);
>> +
>> +    writel(WM_CGC_OVERRIDE_ALL, vfe->base + VFE_BUS_WM_CGC_OVERRIDE);
>> +    /* no clock gating at bus input */
>> +    writel(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
>> +
>> +    writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height,
>> +           vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
>> +    writel(WM_IMAGE_CFG_0_DEFAULT_WIDTH & 0xFFFF,
>> +           vfe->base + VFE_BUS_WM_IMAGE_CFG_0(wm));
>> +    writel(WM_IMAGE_CFG_2_DEFAULT_STRIDE,
>> +           vfe->base + VFE_BUS_WM_IMAGE_CFG_2(wm));
>> +
>> +    writel(0x0, vfe->base + VFE_BUS_WM_PACKER_CFG(wm));
>> +
>> +    /* TOP CORE CFG */
>> +    writel(0x600000, vfe->base + VFE_TOP_CORE_CFG);
>> +
>> +    /* no dropped frames, one irq per frame */
>> +    writel(0, vfe->base + VFE_BUS_WM_FRAMEDROP_PERIOD(wm));
>> +    writel(1, vfe->base + VFE_BUS_WM_FRAMEDROP_PATTERN(wm));
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
>> +static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
>> +{
>> +    wm = RDI_WM(wm);
>> +    writel(0, vfe->base + VFE_BUS_WM_CFG(wm));
>> +}
>> +
>> +static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
>> +              struct vfe_line *line)
>> +{
>> +    wm = RDI_WM(wm);
>> +    writel(addr, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
>> +
>> +    dev_dbg(vfe->camss->dev, "wm:%d, image buf addr:0x%x\n",
>> +        wm, addr);
>> +}
>> +
>> +static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id 
>> line_id)
>> +{
>> +    int port_id = line_id;
>> +
>> +    camss_reg_update(vfe->camss, vfe->id, port_id, false);
>> +}
>> +
>> +static inline void vfe_reg_update_clear(struct vfe_device *vfe,
>> +                    enum vfe_line_id line_id)
>> +{
>> +    int port_id = line_id;
>> +
>> +    camss_reg_update(vfe->camss, vfe->id, port_id, true);
>> +}
>> +
>> +static const struct camss_video_ops vfe_video_ops_690 = {
>> +    .queue_buffer = vfe_queue_buffer_v2,
>> +    .flush_buffers = vfe_flush_buffers,
>> +};
>> +
>> +static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
>> +{
>> +    vfe->video_ops = vfe_video_ops_690;
>> +}
>> +
>> +static void vfe_global_reset(struct vfe_device *vfe)
>> +{
>> +    vfe_isr_reset_ack(vfe);
>> +}
>> +
>> +static irqreturn_t vfe_isr(int irq, void *dev)
>> +{
>> +    /* nop */
>> +    return IRQ_HANDLED;
>> +}
>> +
>> +static int vfe_halt(struct vfe_device *vfe)
>> +{
>> +    /* rely on vfe_disable_output() to stop the VFE */
>> +    return 0;
>> +}
>> +
>> +const struct vfe_hw_ops vfe_ops_690 = {
>> +    .global_reset = vfe_global_reset,
>> +    .hw_version = vfe_hw_version,
>> +    .isr = vfe_isr,
>> +    .pm_domain_off = vfe_pm_domain_off,
>> +    .pm_domain_on = vfe_pm_domain_on,
>> +    .reg_update = vfe_reg_update,
>> +    .reg_update_clear = vfe_reg_update_clear,
>> +    .subdev_init = vfe_subdev_init,
>> +    .vfe_disable = vfe_disable,
>> +    .vfe_enable = vfe_enable_v2,
>> +    .vfe_halt = vfe_halt,
>> +    .vfe_wm_start = vfe_wm_start,
>> +    .vfe_wm_stop = vfe_wm_stop,
>> +    .vfe_buf_done = vfe_buf_done,
>> +    .vfe_wm_update = vfe_wm_update,
>> +};
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c 
>> b/drivers/media/platform/qcom/camss/camss-vfe.c
>> index 9ffa6bc72cf1..71857c68bbed 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>> @@ -346,6 +346,7 @@ static u32 vfe_src_pad_code(struct vfe_line 
>> *line, u32 sink_code,
>>       case CAMSS_8280XP:
>>       case CAMSS_845:
>>       case CAMSS_8550:
>> +    case CAMSS_8775P:
>>           switch (sink_code) {
>>           case MEDIA_BUS_FMT_YUYV8_1X16:
>>           {
>> @@ -908,7 +909,8 @@ static int vfe_match_clock_names(struct 
>> vfe_device *vfe,
>>         return (!strcmp(clock->name, vfe_name) ||
>>           !strcmp(clock->name, vfe_lite_name) ||
>> -        !strcmp(clock->name, "vfe_lite"));
>> +        !strcmp(clock->name, "vfe_lite") ||
>> +        !strcmp(clock->name, "camnoc_axi"));
>>   }
>>     /*
>> @@ -1972,6 +1974,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
>>       case CAMSS_8280XP:
>>       case CAMSS_845:
>>       case CAMSS_8550:
>> +    case CAMSS_8775P:
>>           ret = 16;
>>           break;
>>       default:
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h 
>> b/drivers/media/platform/qcom/camss/camss-vfe.h
>> index 9dec5bc0d1b1..a9322f4440ae 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
>> @@ -243,6 +243,7 @@ extern const struct vfe_hw_ops vfe_ops_4_7;
>>   extern const struct vfe_hw_ops vfe_ops_4_8;
>>   extern const struct vfe_hw_ops vfe_ops_170;
>>   extern const struct vfe_hw_ops vfe_ops_480;
>> +extern const struct vfe_hw_ops vfe_ops_690;
>>   extern const struct vfe_hw_ops vfe_ops_780;
>>     int vfe_get(struct vfe_device *vfe);
>> diff --git a/drivers/media/platform/qcom/camss/camss.c 
>> b/drivers/media/platform/qcom/camss/camss.c
>> index 9458cba1b50f..4df31c89c20c 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -2478,6 +2478,196 @@ static const struct camss_subdev_resources 
>> csid_res_8775p[] = {
>>       },
>>   };
>>   +static const struct camss_subdev_resources vfe_res_8775p[] = {
>> +    /* VFE0 */
>> +    {
>> +        .regulators = {},
>> +
>> +        .clock = { "cpas_vfe0", "vfe0", "vfe0_fast_ahb",
>> +               "cpas_ahb", "gcc_axi_hf", "gcc_axi_sf",
>> +               "core_ahb", "cpas_fast_ahb_clk", "camnoc_axi",
>> +               "icp_ahb"},
>> +        .clock_rate = {
>> +            { 0 },
>> +            { 480000000 },
>> +            { 300000000, 400000000 },
>> +            { 300000000, 400000000 },
>> +            { 0 },
>> +            { 0 },
>> +            { 0, 80000000 },
>> +            { 300000000, 400000000 },
>> +            { 400000000 },
>> +            { 0 },
>> +        },
>> +
>> +        .reg = { "vfe0" },
>> +        .interrupt = { "vfe0" },
>> +        .vfe = {
>> +            .line_num = 3,
>> +            .is_lite = false,
>> +            .has_pd = false,
>> +            .pd_name = NULL,
>> +            .hw_ops = &vfe_ops_690,
>> +            .formats_rdi = &vfe_formats_rdi_845,
>> +            .formats_pix = &vfe_formats_pix_845
>> +        }
>> +    },
>> +    /* VFE1 */
>> +    {
>> +        .regulators = {},
>> +
>> +        .clock = { "cpas_vfe1", "vfe1", "vfe1_fast_ahb",
>> +               "cpas_ahb", "gcc_axi_hf", "gcc_axi_sf",
>> +               "core_ahb", "cpas_fast_ahb_clk", "camnoc_axi",
>> +               "icp_ahb"},
>> +        .clock_rate = {
>> +            { 0 },
>> +            { 480000000 },
>> +            { 300000000, 400000000 },
>> +            { 300000000, 400000000 },
>> +            { 0 },
>> +            { 0 },
>> +            { 0, 80000000 },
>> +            { 300000000, 400000000 },
>> +            { 400000000 },
>> +            { 0 },
>> +        },
>> +
>> +        .reg = { "vfe1" },
>> +        .interrupt = { "vfe1" },
>> +        .vfe = {
>> +            .line_num = 3,
>> +            .is_lite = false,
>> +            .has_pd = false,
>> +            .pd_name = NULL,
>> +            .hw_ops = &vfe_ops_690,
>> +            .formats_rdi = &vfe_formats_rdi_845,
>> +            .formats_pix = &vfe_formats_pix_845
>> +        }
>> +    },
>> +
>> +    /* VFE2 (lite) */
>> +    {
>> +        .regulators = {},
>> +
>> +        .clock = { "cpas_ife_lite", "vfe_lite_ahb",
>> +               "vfe_lite_csid", "vfe_lite_cphy_rx",
>> +               "vfe_lite"},
>> +        .clock_rate = {
>> +            { 0, 0, 0, 0  },
>> +            { 300000000, 400000000, 400000000, 400000000 },
>> +            { 400000000, 400000000, 400000000, 400000000 },
>> +            { 400000000, 400000000, 400000000, 400000000 },
>> +            { 480000000, 600000000, 600000000, 600000000 },
>> +        },
>> +        .reg = { "vfe_lite0" },
>> +        .interrupt = { "vfe-lite0" },
>> +        .vfe = {
>> +            .line_num = 4,
>> +            .is_lite = true,
>> +            .hw_ops = &vfe_ops_690,
>> +            .formats_rdi = &vfe_formats_rdi_845,
>> +            .formats_pix = &vfe_formats_pix_845
>> +        }
>> +    },
>> +    /* VFE3 (lite) */
>> +    {
>> +        .regulators = {},
>> +
>> +        .clock = { "cpas_ife_lite", "vfe_lite_ahb",
>> +               "vfe_lite_csid", "vfe_lite_cphy_rx",
>> +               "vfe_lite"},
>> +        .clock_rate = {
>> +            { 0, 0, 0, 0  },
>> +            { 300000000, 400000000, 400000000, 400000000 },
>> +            { 400000000, 400000000, 400000000, 400000000 },
>> +            { 400000000, 400000000, 400000000, 400000000 },
>> +            { 480000000, 600000000, 600000000, 600000000 },
>> +        },
>> +        .reg = { "vfe_lite1" },
>> +        .interrupt = { "vfe-lite1" },
>> +        .vfe = {
>> +            .line_num = 4,
>> +            .is_lite = true,
>> +            .hw_ops = &vfe_ops_690,
>> +            .formats_rdi = &vfe_formats_rdi_845,
>> +            .formats_pix = &vfe_formats_pix_845
>> +        }
>> +    },
>> +    /* VFE4 (lite) */
>> +    {
>> +        .regulators = {},
>> +
>> +        .clock = { "cpas_ife_lite", "vfe_lite_ahb",
>> +               "vfe_lite_csid", "vfe_lite_cphy_rx",
>> +               "vfe_lite"},
>> +        .clock_rate = {
>> +            { 0, 0, 0, 0  },
>> +            { 300000000, 400000000, 400000000, 400000000 },
>> +            { 400000000, 400000000, 400000000, 400000000 },
>> +            { 400000000, 400000000, 400000000, 400000000 },
>> +            { 480000000, 600000000, 600000000, 600000000 },
>> +        },
>> +        .reg = { "vfe_lite2" },
>> +        .interrupt = { "vfe-lite2" },
>> +        .vfe = {
>> +            .line_num = 4,
>> +            .is_lite = true,
>> +            .hw_ops = &vfe_ops_690,
>> +            .formats_rdi = &vfe_formats_rdi_845,
>> +            .formats_pix = &vfe_formats_pix_845
>> +        }
>> +    },
>> +    /* VFE5 (lite) */
>> +    {
>> +        .regulators = {},
>> +
>> +        .clock = { "cpas_ife_lite", "vfe_lite_ahb",
>> +               "vfe_lite_csid", "vfe_lite_cphy_rx",
>> +               "vfe_lite"},
>> +        .clock_rate = {
>> +            { 0, 0, 0, 0  },
>> +            { 300000000, 400000000, 400000000, 400000000 },
>> +            { 400000000, 400000000, 400000000, 400000000 },
>> +            { 400000000, 400000000, 400000000, 400000000 },
>> +            { 480000000, 600000000, 600000000, 600000000 },
>> +        },
>> +        .reg = { "vfe_lite3" },
>> +        .interrupt = { "vfe-lite3" },
>> +        .vfe = {
>> +            .line_num = 4,
>> +            .is_lite = true,
>> +            .hw_ops = &vfe_ops_690,
>> +            .formats_rdi = &vfe_formats_rdi_845,
>> +            .formats_pix = &vfe_formats_pix_845
>> +        }
>> +    },
>> +    /* VFE6 (lite) */
>> +    {
>> +        .regulators = {},
>> +
>> +        .clock = { "cpas_ife_lite", "vfe_lite_ahb",
>> +               "vfe_lite_csid", "vfe_lite_cphy_rx",
>> +               "vfe_lite"},
>> +        .clock_rate = {
>> +            { 0, 0, 0, 0  },
>> +            { 300000000, 400000000, 400000000, 400000000 },
>> +            { 400000000, 400000000, 400000000, 400000000 },
>> +            { 400000000, 400000000, 400000000, 400000000 },
>> +            { 480000000, 600000000, 600000000, 600000000 },
>> +        },
>> +        .reg = { "vfe_lite4" },
>> +        .interrupt = { "vfe-lite4" },
>> +        .vfe = {
>> +            .line_num = 4,
>> +            .is_lite = true,
>> +            .hw_ops = &vfe_ops_690,
>> +            .formats_rdi = &vfe_formats_rdi_845,
>> +            .formats_pix = &vfe_formats_pix_845
>> +        }
>> +    },
>> +};
>> +
>>   static const struct resources_icc icc_res_sa8775p[] = {
>>       {
>>           .name = "ahb",
>> @@ -3469,9 +3659,11 @@ static const struct camss_resources 
>> sa8775p_resources = {
>>       .csiphy_res = csiphy_res_8775p,
>>       .csid_res = csid_res_8775p,
>>       .csid_wrapper_res = &csid_wrapper_res_sa8775p,
>> +    .vfe_res = vfe_res_8775p,
>>       .icc_res = icc_res_sa8775p,
>>       .csiphy_num = ARRAY_SIZE(csiphy_res_8775p),
>>       .csid_num = ARRAY_SIZE(csid_res_8775p),
>> +    .vfe_num = ARRAY_SIZE(vfe_res_8775p),
>>       .icc_path_num = ARRAY_SIZE(icc_res_sa8775p),
>>       .link_entities = camss_link_entities
>>   };
>
> There's a pretty superficial difference between 780 and 990
>
> git diff drivers/media/platform/qcom/camss/camss-vfe-690.c 
> drivers/media/platform/qcom/camss/camss-vfe-780.c
>
> linux-media-qcom-camss/master?
> 3c3
> <  * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module v690 
> (SA8755P)
> ---
> >  * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module v780 
> (SM8550)
> 5c5
> <  * Copyright (c) 2025 Qualcomm Technologies, Inc.
> ---
> >  * Copyright (c) 2024 Qualcomm Technologies, Inc.
> 15,16c15
> < #define VFE_TOP_CORE_CFG        (0x24)
> < #define BUS_REG_BASE            (vfe_is_lite(vfe) ? 0x480 : 0x400)
> ---
> > #define BUS_REG_BASE            (vfe_is_lite(vfe) ? 0x200 : 0xC00)
>
> 19c18
> < #define    WM_CGC_OVERRIDE_ALL        (0x7FFFFFF)
> ---
> > #define        WM_CGC_OVERRIDE_ALL        (0x7FFFFFF)
> 21c20
> < #define VFE_BUS_WM_TEST_BUS_CTRL    (BUS_REG_BASE + 0xFC)
> ---
> > #define VFE_BUS_WM_TEST_BUS_CTRL    (BUS_REG_BASE + 0xDC)
> 46,47c45,46
> <  * VFE:
> <  * 16 = RDI0, 17 = RDI1, 18 = RDI2
> ---
> >  * Full VFE:
> >  * 23 = RDI0, 24 = RDI1, 25 = RDI2
> 50c49
> <  * 0 = RDI0, 1 = RDI1, 2 = RDI2, 3 = RDI3, 4 = RDI4, 5 = RDI5
> ---
> >  * 0 = RDI0, 1 = RDI1, 2 = RDI3, 4 = RDI4
> 52c51
> < #define RDI_WM(n)            ((vfe_is_lite(vfe) ? 0x0 : 0x10) + (n))
> ---
> > #define RDI_WM(n)            ((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
> 61d59
> <     writel(WM_CGC_OVERRIDE_ALL, vfe->base + VFE_BUS_WM_CGC_OVERRIDE);
> 62a61,62
> >     writel(WM_CGC_OVERRIDE_ALL, vfe->base + VFE_BUS_WM_CGC_OVERRIDE);
> >
> 65c65
> <     writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height,
> ---
> >     writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height 
> >> 8,
> 67c67
> <     writel(WM_IMAGE_CFG_0_DEFAULT_WIDTH & 0xFFFF,
> ---
> >     writel((WM_IMAGE_CFG_0_DEFAULT_WIDTH & 0xFFFF),
> 71,75c71
> <
> <     writel(0x0, vfe->base + VFE_BUS_WM_PACKER_CFG(wm));
> <
> <     /* TOP CORE CFG */
> <     writel(0x600000, vfe->base + VFE_TOP_CORE_CFG);
>
> What's this for ?
>
> ---
> >     writel(0, vfe->base + VFE_BUS_WM_PACKER_CFG(wm));
> 99c95
> <     writel(addr, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
> ---
> >     writel((addr >> 8) & 0xFFFFFFFF, vfe->base + 
> VFE_BUS_WM_IMAGE_ADDR(wm));
> 120c116
> < static const struct camss_video_ops vfe_video_ops_690 = {
> ---
> > static const struct camss_video_ops vfe_video_ops_780 = {
> 127c123
> <     vfe->video_ops = vfe_video_ops_690;
> ---
> >     vfe->video_ops = vfe_video_ops_780;
> 147c143
> < const struct vfe_hw_ops vfe_ops_690 = {
> ---
> > const struct vfe_hw_ops vfe_ops_780 = {
>
> I don't really see much logical difference here to justify all of the 
> copy/paste code.
>
> Could you comment on some set of offsets passed in the VFE resources 
> structure ?
>
> If not an offset then perhaps a camss-vfe-gen3.c file which contains 
> the shared code and wrappering that shared code in camss-vfe-690 and 
> vfe-780 respectively ?
>
> Actually, I think that's the way to go, for his level of similarity it 
> should be possible to move the share code 1:1 in many cases to a 
> shared file.
>
Agree with your suggestion to move common code to *_gen3.c. Next patch 
in this series will take care of that.
Additionally I will add more info regarding the delta for 'vfe 780' vs 
'vfe 690'.

Best Regards,
Vikram
> ---
> bod

