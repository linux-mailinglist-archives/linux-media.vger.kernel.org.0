Return-Path: <linux-media+bounces-39956-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B11CAB27BB0
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 10:52:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B72C67BD8D1
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 08:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C43EF259CA3;
	Fri, 15 Aug 2025 08:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="be7A3DMh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1362417D1;
	Fri, 15 Aug 2025 08:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755247946; cv=none; b=OSoor5gkPfxJZ1tlfx6x02GNO57JZkqVmxLV2+iWPgYZUKNOtdf1NMKDMsWJ13gwvngUqZBsQwDIE4uKBz+6MWBNuQow+oBCgaFQU2zMY5LpL23R1I3/9oIX5zKiSLCNCUYYLwj2RK77B3yXkG/FMbEMtoI7gVRL5FpuWz4eBys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755247946; c=relaxed/simple;
	bh=WYTfoIjNNJf8W7OFgvTEAHOvbi92HDJ1b2gWhoYBEV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TAgKmDDo77nkFSP12GivL00racFgWf9oVBv0pl06/gwZs7zXQcg8j68xUTn38VC70mh3IZiAWWEq/5kT9f1Lc6kUHwNWvQb9u3vyq9u5KiBSQVNhNhkmml1eWxgsiIdnrCEf2y6hVUZleqHPostfQ32g/mHIrpO5oVgc6FMXL8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=be7A3DMh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57F8638j002874;
	Fri, 15 Aug 2025 08:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	El+B9WnROaCTUjTP+GeuVNImqOu7u6uSX1ux0ImTnAQ=; b=be7A3DMh4yUI7rnU
	PQQD780pGnbOFTarlZ56OUpicrrUj+8lDtEGbq+zHlCHi65gw5eTEY4KELsU1o3D
	5qDOo0LIy8G1kZAZOuipojpRRXnY/cH0RF+txlzMal1fk1/YaFbu7EwnznWKN7JS
	uLq4N2lzu8aCWOOXbBrTO2mgdo9oI+8JBiC3guOFWMkXGbcPEM8YF3n3uXgYyBrL
	NozvwG/9zSTVYEd7SDaIAOFh1N+dmWtAooVvF1erb0RbgDZFOTfL1ur+9DuNb4SD
	GWAn2esDCHi6YEcrE431cgxNnT/shViOlKZShEWJTNoJXY9oBKDlaR72HOGwEXZL
	Q81S9w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdvak5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 08:52:16 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57F8qFGR022896
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 08:52:15 GMT
Received: from [10.253.75.233] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 15 Aug
 2025 01:52:12 -0700
Message-ID: <d4c0736b-5c17-4bce-86cf-6c0c48645667@quicinc.com>
Date: Fri, 15 Aug 2025 16:52:09 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: qcom: camss: Add support for TPG common
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss
	<rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20250717-lemans_tpg-v2-0-a2538659349c@quicinc.com>
 <20250717-lemans_tpg-v2-1-a2538659349c@quicinc.com>
 <6d43915b-756f-4ab3-accf-e0a5422db479@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
In-Reply-To: <6d43915b-756f-4ab3-accf-e0a5422db479@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689ef540 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=Dbw0RLX1Hy8_-nJpkfgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: BWqAGB9PoGkTJDhXlj7XNbUlCkQzhaM-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfXydbOKMEeuGA2
 krL4NuZwP0m1j/N4Ma+veUwD0I2EiZJdiE4YzRu1/ZGgFHflQ+YDGGittzLejaJtnZvBjAqJb30
 VzDbJAZfL85e3199tkJiH0hzFjEmvNKa7uV/RTo1ms4RaR1vAivKHuQm64SZHsGacjpkiBVuHhJ
 qvcPVyTC9PJ3qUqwuT5uwaw/gfLz1+nK9Vq83/hN7nlE35H3pKeioO+a1jDPbV9zPypSaMeo8UU
 pXUsnHmfDkin5VoXJKFae/cvq8Ax8cyAJM1k1HkZo3TkNCYgU5OVbSsoyuVJIIYMPdT6bMW+c62
 sFUAD0nQptuBrTkCTJNXxRtap7GNQSc+yLQoekh2MXRI0wmx4TCX3i4EoqtDlZs7EZXx20Du0eE
 ZYdmvWTQ
X-Proofpoint-GUID: BWqAGB9PoGkTJDhXlj7XNbUlCkQzhaM-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025



On 2025/7/17 20:42, Bryan O'Donoghue wrote:
> On 17/07/2025 04:20, Wenmeng Liu wrote:
>> Add support for TPG common, unlike CSID TPG, this TPG can
>> be seen as a combination of CSIPHY and sensor.
>>
>> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/camss/Makefile    |   1 +
>>   drivers/media/platform/qcom/camss/camss-tpg.c | 737 ++++++++++++++++ 
>> ++++++++++
>>   drivers/media/platform/qcom/camss/camss-tpg.h | 130 +++++
>>   drivers/media/platform/qcom/camss/camss.h     |   5 +
>>   4 files changed, 873 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/ 
>> media/platform/qcom/camss/Makefile
>> index 
>> 76845a456c459538b8e9f782dd58e3b59aff3ef1..e4cf3033b8798cf0ffeff85409ae4ed3559879c1 100644
>> --- a/drivers/media/platform/qcom/camss/Makefile
>> +++ b/drivers/media/platform/qcom/camss/Makefile
>> @@ -24,5 +24,6 @@ qcom-camss-objs += \
>>           camss-vfe.o \
>>           camss-video.o \
>>           camss-format.o \
>> +        camss-tpg.o \
>>   obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
>> diff --git a/drivers/media/platform/qcom/camss/camss-tpg.c b/drivers/ 
>> media/platform/qcom/camss/camss-tpg.c
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..3ef5b6dcdf2f7e8bbe442667d0fdf64ee30e2923
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/camss/camss-tpg.c
>> @@ -0,0 +1,737 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * camss-tpg.c
>> + *
>> + * Qualcomm MSM Camera Subsystem - TPG Module
>> + *
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + */
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/interrupt.h>
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
>> +    NULL,
>> +    NULL,
>> +    "Pseudo-random Data",
>> +    "User Specified",
>> +    NULL,
>> +    NULL,
>> +    "Color bars",
>> +    NULL
>> +};
> 
> This looks a bit strange.
> 
> What at the NULLs about ?
>

Will replace NULLs to "Reserved".

>> +
>> +static const struct tpg_format_info formats_gen1[] = {
>> +    {
>> +        MEDIA_BUS_FMT_SBGGR8_1X8,
>> +        DATA_TYPE_RAW_8BIT,
>> +        ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
>> +    },
>> +    {
>> +        MEDIA_BUS_FMT_SGBRG8_1X8,
>> +        DATA_TYPE_RAW_8BIT,
>> +        ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
>> +    },
>> +    {
>> +        MEDIA_BUS_FMT_SGRBG8_1X8,
>> +        DATA_TYPE_RAW_8BIT,
>> +        ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
>> +    },
>> +    {
>> +        MEDIA_BUS_FMT_SRGGB8_1X8,
>> +        DATA_TYPE_RAW_8BIT,
>> +        ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
>> +    },
>> +    {
>> +        MEDIA_BUS_FMT_SBGGR10_1X10,
>> +        DATA_TYPE_RAW_10BIT,
>> +        ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
>> +    },
>> +    {
>> +        MEDIA_BUS_FMT_SGBRG10_1X10,
>> +        DATA_TYPE_RAW_10BIT,
>> +        ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
>> +    },
>> +    {
>> +        MEDIA_BUS_FMT_SGRBG10_1X10,
>> +        DATA_TYPE_RAW_10BIT,
>> +        ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
>> +    },
>> +    {
>> +        MEDIA_BUS_FMT_SRGGB10_1X10,
>> +        DATA_TYPE_RAW_10BIT,
>> +        ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
>> +    },
>> +    {
>> +        MEDIA_BUS_FMT_SBGGR12_1X12,
>> +        DATA_TYPE_RAW_12BIT,
>> +        ENCODE_FORMAT_UNCOMPRESSED_12_BIT,
>> +    },
>> +    {
>> +        MEDIA_BUS_FMT_SGBRG12_1X12,
>> +        DATA_TYPE_RAW_12BIT,
>> +        ENCODE_FORMAT_UNCOMPRESSED_12_BIT,
>> +    },
>> +    {
>> +        MEDIA_BUS_FMT_SGRBG12_1X12,
>> +        DATA_TYPE_RAW_12BIT,
>> +        ENCODE_FORMAT_UNCOMPRESSED_12_BIT,
>> +    },
>> +    {
>> +        MEDIA_BUS_FMT_SRGGB12_1X12,
>> +        DATA_TYPE_RAW_12BIT,
>> +        ENCODE_FORMAT_UNCOMPRESSED_12_BIT,
>> +    },
>> +    {
>> +        MEDIA_BUS_FMT_Y8_1X8,
>> +        DATA_TYPE_RAW_8BIT,
>> +        ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
>> +    },
>> +    {
>> +        MEDIA_BUS_FMT_Y10_1X10,
>> +        DATA_TYPE_RAW_10BIT,
>> +        ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
>> +    },
>> +};
>> +
>> +const struct tpg_formats tpg_formats_gen1 = {
>> +    .nformats = ARRAY_SIZE(formats_gen1),
>> +    .formats = formats_gen1
>> +};
>> +
>> +const struct tpg_format_info *tpg_get_fmt_entry(const struct 
>> tpg_format_info *formats,
>> +                        unsigned int nformats,
>> +                        u32 code)
>> +{
>> +    unsigned int i;
>> +
>> +    for (i = 0; i < nformats; i++)
>> +        if (code == formats[i].code)
>> +            return &formats[i];
>> +
>> +    WARN(1, "Unknown format\n");
>> +
>> +    return &formats[0];
>> +}
>> +
>> +/*
>> + * tpg_set_clock_rates - Calculate and set clock rates on tpg module
>> + * @tpg: tpg device
>> + */
>> +static int tpg_set_clock_rates(struct tpg_device *tpg)
>> +{
>> +    struct device *dev = tpg->camss->dev;
>> +    int i, j;
>> +    int ret;
>> +
>> +    for (i = 0; i < tpg->nclocks; i++) {
>> +        struct camss_clock *clock = &tpg->clock[i];
>> +        u64 min_rate = 0;
>> +        long round_rate;
>> +
>> +        camss_add_clock_margin(&min_rate);
> 
> Which clock is it we are setting here i.e. do we really need to care 
> about the rate at all ?

TPG generally uses the clocks from CSIPHY/CSID/AON. If we can ensure 
that the clocks required by TPG are enabled in CSID/VFE, then there's no 
need to configure them in the TPG node.

On Lemans (SA8775P), there's a special case where TPG requires the 
CAMNOC_AXI to be set to 400 MHz to function properly, while the sensor 
does not.

Therefore, I could consider leaving a clock configuration interface for 
TPG, with a fixed frequency value.what's your opinion?

>> +
>> +        for (j = 0; j < clock->nfreqs; j++)
>> +            if (min_rate < clock->freq[j])
>> +                break;
> 
> multi-line should be bracketed
> 
> for () {
>      if(x)
>          break;
> }
> 
>> +
>> +        if (j == clock->nfreqs) {
>> +            dev_err(dev,
>> +                "clock is too high for TPG\n");
>> +            return -EINVAL;
>> +        }
>> +
>> +        /* if clock is not available */
>> +        /* set highest possible tpg clock rate */
>> +        if (min_rate == 0)
>> +            j = clock->nfreqs - 1;
> 
> This makes sense for a CSIPHY where the pixel rate changes but, does it 
> make sense for the TPG ?

will remove it in next verion

>> +
>> +        round_rate = clk_round_rate(clock->clk, clock->freq[j]);
>> +        if (round_rate < 0) {
>> +            dev_err(dev, "clk round rate failed: %ld\n",
>> +                round_rate);
>> +            return -EINVAL;
>> +        }
>> +
>> +        tpg->timer_clk_rate = round_rate;
>> +
>> +        ret = clk_set_rate(clock->clk, tpg->timer_clk_rate);
>> +        if (ret < 0) {
>> +            dev_err(dev, "clk set rate failed: %d\n", ret);
>> +            return ret;
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
>> +        enable_irq(tpg->irq);
> 
> Do we need an IRQ for the TPG ?
> 
> What's the use-case for it ? I'm not necessarily asking to drop this 
> just to understand if it is really useful.

In latest versions TPG, TPG will have an RUP IRQ, but this is not 
strictly necessary and could be considered for removal.

>> +
>> +        tpg->res->hw_ops->reset(tpg);
>> +
>> +        tpg->res->hw_ops->hw_version(tpg);
>> +    } else {
>> +        disable_irq(tpg->irq);
>> +
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
>> +    tpg->res->hw_ops->configure_stream(tpg, enable);
>> +
>> +    return 0;
>> +}
>> +
>> +/*
>> + * __tpg_get_format - Get pointer to format structure
>> + * @tpg: tpg device
>> + * @cfg: V4L2 subdev pad configuration
>> + * @pad: pad from which format is requested
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
>> + * @pad: pad on which format is requested
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
>> +        /* Test generator is enabled, set format on source */
>> +        /* pad to allow test generator usage */
>> +
>> +        for (i = 0; i < tpg->res->formats->nformats; i++)
>> +            if (tpg->res->formats->formats[i].code == fmt->code)
>> +                break;
>> +
>> +        /* If not found, use SBGGR8 as default */
>> +        if (i >= tpg->res->formats->nformats)
>> +            fmt->code = MEDIA_BUS_FMT_SBGGR8_1X8;
> 
> If not found why set a default at all ?

This is a try function. If the target cannot be found, returning a 
default value might be a better approach.

>> +
>> +        fmt->width = clamp_t(u32, fmt->width, 1, 8191);
>> +        fmt->height = clamp_t(u32, fmt->height, 1, 8191);
>> +
>> +        fmt->field = V4L2_FIELD_NONE;
>> +        fmt->colorspace = V4L2_COLORSPACE_SRGB;
>> +
>> +        break;
>> +    case MSM_TPG_PAD_SRC:
>> +        /* Set and return a format same as sink pad */
>> +
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
>> + * @code: pointer to v4l2_subdev_mbus_code_enum structure
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
> 
> What is this test about and how does the index != 0 come to pass ?

When userspace calls VIDIOC_SUBDEV_ENUM_FRAME_SIZE to query formats, 
this value will be passed in to check the supported formats.

This ensures that the function only returns a single frame size per 
format, and avoids undefined behavior if the caller tries to enumerate 
beyond what's supported.

> 
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
> 
> Is EINVAL the right return value here ?

Yes i think, this indicates that the userspace transmitted the data in 
the wrong format.

> 
>> +
>> +    format.code = fse->code;
>> +    format.width = -1;
>> +    format.height = -1;
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
>> + * @res: tpg module resources table
>> + * @id: tpg module id
>> + *
>> + * Return 0 on success or a negative error code otherwise
>> + */
>> +int msm_tpg_subdev_init(struct camss *camss,
>> +            struct tpg_device *tpg,
>> +            const struct camss_subdev_resources *res, u8 id)
>> +{
>> +    struct device *dev = camss->dev;
>> +    struct platform_device *pdev = to_platform_device(dev);
>> +    int i, j;
>> +    int ret;
> 
> Reverse Christmas tree your declarations please.
> 
>> +
>> +    tpg->camss = camss;
>> +    tpg->id = id;
>> +    tpg->res = &res->tpg;
>> +    tpg->res->hw_ops->subdev_init(tpg);
>> +
>> +    /* Memory */
>> +    tpg->base = devm_platform_ioremap_resource_byname(pdev, res- 
>> >reg[0]);
>> +    if (IS_ERR(tpg->base))
>> +        return PTR_ERR(tpg->base);
>> +
>> +    /* Interrupt */
>> +    ret = platform_get_irq_byname(pdev, res->interrupt[0]);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    tpg->irq = ret;
>> +    snprintf(tpg->irq_name, sizeof(tpg->irq_name), "%s_%s%d",
>> +         dev_name(dev), MSM_TPG_NAME, tpg->id);
>> +
>> +    ret = devm_request_irq(dev, tpg->irq, tpg->res->hw_ops->isr,
>> +                   IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN,
>> +                   tpg->irq_name, tpg);
>> +    if (ret < 0) {
>> +        dev_err(dev, "request_irq failed: %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    /* Clocks */
>> +    tpg->nclocks = 0;
>> +    while (res->clock[tpg->nclocks])
>> +        tpg->nclocks++;
>> +
>> +    tpg->clock = devm_kcalloc(dev,
>> +                  tpg->nclocks, sizeof(*tpg->clock),
>> +                  GFP_KERNEL);
>> +    if (!tpg->clock)
>> +        return -ENOMEM;
>> +
>> +    for (i = 0; i < tpg->nclocks; i++) {
>> +        struct camss_clock *clock = &tpg->clock[i];
>> +
>> +        clock->clk = devm_clk_get(dev, res->clock[i]);
>> +        if (IS_ERR(clock->clk))
>> +            return PTR_ERR(clock->clk);
>> +
>> +        clock->name = res->clock[i];
>> +
>> +        clock->nfreqs = 0;
>> +        while (res->clock_rate[i][clock->nfreqs])
>> +            clock->nfreqs++;
>> +
>> +        if (!clock->nfreqs) {
>> +            clock->freq = NULL;
>> +            continue;
>> +        }
>> +
>> +        clock->freq = devm_kcalloc(dev,
>> +                       clock->nfreqs,
>> +                       sizeof(*clock->freq),
>> +                       GFP_KERNEL);
>> +        if (!clock->freq)
>> +            return -ENOMEM;
>> +
>> +        for (j = 0; j < clock->nfreqs; j++)
>> +            clock->freq[j] = res->clock_rate[i][j];
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
>> + * Rreturn 0 on success
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
>> +    if (tpg->ctrls.error) {
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
>> +
>> +    sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
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
>> 0000000000000000000000000000000000000000..63fdb090481cf1297890e3cd50191f4bc103fc95
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/camss/camss-tpg.h
>> @@ -0,0 +1,130 @@
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
>> +#include <linux/interrupt.h>
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
>> +
>> +#define ENCODE_FORMAT_UNCOMPRESSED_8_BIT    0x1
>> +#define ENCODE_FORMAT_UNCOMPRESSED_10_BIT    0x2
>> +#define ENCODE_FORMAT_UNCOMPRESSED_12_BIT    0x3
>> +#define ENCODE_FORMAT_UNCOMPRESSED_14_BIT    0x4
>> +#define ENCODE_FORMAT_UNCOMPRESSED_16_BIT    0x5
>> +#define ENCODE_FORMAT_UNCOMPRESSED_20_BIT    0x6
>> +#define ENCODE_FORMAT_UNCOMPRESSED_24_BIT    0x7
>> +
>> +#define MSM_TPG_NAME "msm_tpg"
>> +
>> +enum tpg_testgen_mode {
>> +    TPG_PAYLOAD_MODE_DISABLED = 0,
>> +    TPG_PAYLOAD_MODE_INCREMENTING = 1,
>> +    TPG_PAYLOAD_MODE_ALTERNATING_55_AA = 2,
>> +    TPG_PAYLOAD_MODE_RANDOM = 5,
>> +    TPG_PAYLOAD_MODE_USER_SPECIFIED = 6,
>> +    TPG_PAYLOAD_MODE_COLOR_BARS = 9,
>> +    TPG_PAYLOAD_MODE_NUM_SUPPORTED_GEN1 = 9, /* excluding disabled */
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
>> +    void (*configure_stream)(struct tpg_device *tpg, u8 enable);
>> +
>> +    int (*configure_testgen_pattern)(struct tpg_device *tpg, s32 val);
>> +
>> +    u32 (*hw_version)(struct tpg_device *tpg);
>> +
>> +    irqreturn_t (*isr)(int irq, void *dev);
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
>> +    void __iomem *base_clk_mux;
> 
> clk_mux ?
> 
> Can you please go through this list and remove anything that isn't being 
> used, don't just copy/paste existing code/structures.
> 

Sure, will check this.

> 
>> +    u32 irq;
>> +    char irq_name[30];
>> +    struct camss_clock *clock;
>> +    int nclocks;
>> +    u32 timer_clk_rate;
>> +    struct tpg_testgen_config testgen;
>> +    struct v4l2_mbus_framefmt fmt[MSM_TPG_PADS_NUM];
>> +    struct v4l2_ctrl_handler ctrls;
>> +    struct v4l2_ctrl *testgen_mode;
>> +    const struct tpg_subdev_resources *res;
>> +    const struct tpg_format *formats;
>> +    unsigned int nformats;
>> +};
>> +
>> +struct camss_subdev_resources;
>> +
>> +const struct tpg_format_info *tpg_get_fmt_entry(const struct 
>> tpg_format_info *formats,
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
>> b5600a8b2c4b3972633d42938feec9265b44dec5..99392e3bada80a8736b2c317308e510e5a7c66ea 100644
>> --- a/drivers/media/platform/qcom/camss/camss.h
>> +++ b/drivers/media/platform/qcom/camss/camss.h
>> @@ -21,6 +21,7 @@
>>   #include "camss-csid.h"
>>   #include "camss-csiphy.h"
>>   #include "camss-ispif.h"
>> +#include "camss-tpg.h"
>>   #include "camss-vfe.h"
>>   #include "camss-format.h"
>> @@ -51,6 +52,7 @@ struct camss_subdev_resources {
>>       char *interrupt[CAMSS_RES_MAX];
>>       union {
>>           struct csiphy_subdev_resources csiphy;
>> +        struct tpg_subdev_resources tpg;
>>           struct csid_subdev_resources csid;
>>           struct vfe_subdev_resources vfe;
>>       };
>> @@ -100,6 +102,7 @@ struct camss_resources {
>>       enum camss_version version;
>>       const char *pd_name;
>>       const struct camss_subdev_resources *csiphy_res;
>> +    const struct camss_subdev_resources *tpg_res;
>>       const struct camss_subdev_resources *csid_res;
>>       const struct camss_subdev_resources *ispif_res;
>>       const struct camss_subdev_resources *vfe_res;
>> @@ -107,6 +110,7 @@ struct camss_resources {
>>       const struct resources_icc *icc_res;
>>       const unsigned int icc_path_num;
>>       const unsigned int csiphy_num;
>> +    const unsigned int tpg_num;
>>       const unsigned int csid_num;
>>       const unsigned int vfe_num;
>>       int (*link_entities)(struct camss *camss);
>> @@ -118,6 +122,7 @@ struct camss {
>>       struct media_device media_dev;
>>       struct device *dev;
>>       struct csiphy_device *csiphy;
>> +    struct tpg_device *tpg;
>>       struct csid_device *csid;
>>       struct ispif_device *ispif;
>>       struct vfe_device *vfe;
>>
> ---
> bod


Thanks,
Wenmeng


