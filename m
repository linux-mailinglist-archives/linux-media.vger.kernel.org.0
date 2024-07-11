Return-Path: <linux-media+bounces-14910-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEF792E5E7
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 13:17:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62CA01C2178A
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 11:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 031AF15EFB6;
	Thu, 11 Jul 2024 11:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Iow4RJ32"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999F815AAC6;
	Thu, 11 Jul 2024 11:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720696156; cv=none; b=kBEKdSnA5qGk0Z3EhA2UVQfUE5GNM54JzQXjn26TcQOH+LwIUU8wUIK87c0e4+XlJ6EJj+UTkjWBjh26YG/zDhNdEXVKiH0pJ81+DPNrw/3gHXT3LW9gorezf4e301sSVUx6qs42lEli7q3ZTOpsyCeUyxWmA+YzBxizCtquLig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720696156; c=relaxed/simple;
	bh=i17G0coPG+cE6F3HQGpqmr7hbsjVb6+8p+njwvIMyh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tEFYD85Fw7Ol+2K1seUKblBGMQkGTBpiFeLCumh9jAqmH6TLGKDvkFBQkmMXIDxkLJg7XDZYrCOASaji5BE4VUxMPIcc3iwvBiGxUow1Q5sCFpQ6bpgySpmu8G+RqjogA2oblAW1YPOdQ8gGUUQdFr8YUBU+nMUCn1wHUqF+Hvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Iow4RJ32; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46B4nNNs026088;
	Thu, 11 Jul 2024 11:09:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A1XPAM9P0LS743NiuoHvPKKQYCQz9Sf9rgZ1IXH+nC8=; b=Iow4RJ32v2SjATUv
	rhRVerK2XYkEktHCiCu8Tp2wuYWCxy9zMOLtC9wQdgn3WkO9XjlPjKy4wuYUm/UI
	9QsWi3pmOWMGPmBlwdBgy9aHsf1K71xwR4U3GJl93ZTyTVRgdYPeUN2E4h6/80eI
	+WDM0PbKUKww9XobpO5psaCLXg6HuFKM/wlumJByHVmbYmaa0PWHA8XMG1sLQBoF
	qRYoHJiFUrJKgZzbFgN4Wfvt0pWpZb5SSagC8vpOur0SSxaw4slNluGDjCv/V0VD
	43pFlqT9Ahtnc6kyKdhHjgIaSQxpsSdqhVqc1A1e2s5Pa+mYrlfPj0MBPHAnoXj5
	sRPL/A==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406xpduuh4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 11:09:04 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46BB936C020318
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 11:09:03 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Jul
 2024 04:08:56 -0700
Message-ID: <4c8095dd-4f96-4b0e-9282-8bdfb5badbc3@quicinc.com>
Date: Thu, 11 Jul 2024 19:08:54 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] media: qcom: camss: Add CSID Gen3 support for
 SM8550
To: Krzysztof Kozlowski <krzk@kernel.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <quic_eberman@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Yongsheng Li
	<quic_yon@quicinc.com>
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-10-quic_depengs@quicinc.com>
 <1da50dd1-b170-4775-94fc-19a10b7f9c47@kernel.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <1da50dd1-b170-4775-94fc-19a10b7f9c47@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: P6ertHWV2n_aLlmyTnLjWnHcyG8KJ1Z6
X-Proofpoint-ORIG-GUID: P6ertHWV2n_aLlmyTnLjWnHcyG8KJ1Z6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_06,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407110079

Hi Krzysztof,

On 7/10/2024 7:20 PM, Krzysztof Kozlowski wrote:
> On 09/07/2024 18:06, Depeng Shao wrote:
>> The CSID in SM8550 is gen3, it has new register offset and new
>> functionality. The buf done irq,register update and reset are
>> moved to CSID gen3. And CSID gen3 has a new register block which
>> is named as CSID top, it controls the output of CSID, since the
>> CSID can connect to Sensor Front End (SFE) or original VFE, the
>> register in top block is used to control the HW connection.
>>
>> Co-developed-by: Yongsheng Li <quic_yon@quicinc.com>
>> Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
>> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/camss/Makefile    |   1 +
>>   .../platform/qcom/camss/camss-csid-gen3.c     | 445 ++++++++++++++++++
>>   .../platform/qcom/camss/camss-csid-gen3.h     |  26 +
>>   .../media/platform/qcom/camss/camss-csid.h    |   2 +
>>   4 files changed, 474 insertions(+)
>>   create mode 100644 drivers/media/platform/qcom/camss/camss-csid-gen3.c
>>   create mode 100644 drivers/media/platform/qcom/camss/camss-csid-gen3.h
>>
>> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
>> index e636968a1126..c336e4c1a399 100644
>> --- a/drivers/media/platform/qcom/camss/Makefile
>> +++ b/drivers/media/platform/qcom/camss/Makefile
>> @@ -7,6 +7,7 @@ qcom-camss-objs += \
>>   		camss-csid-4-1.o \
>>   		camss-csid-4-7.o \
>>   		camss-csid-gen2.o \
>> +		camss-csid-gen3.o \
>>   		camss-csiphy-2ph-1-0.o \
>>   		camss-csiphy-3ph-1-0.o \
>>   		camss-csiphy.o \
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>> new file mode 100644
>> index 000000000000..17fd7c5499de
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>> @@ -0,0 +1,445 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * camss-csid-gen3.c
>> + *
>> + * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module
>> + *
>> + * Copyright (c) 2024 Qualcomm Technologies, Inc.
>> + */
>> +#include <linux/completion.h>
>> +#include <linux/delay.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/of.h>
>> +
>> +#include "camss.h"
>> +#include "camss-csid.h"
>> +#include "camss-csid-gen3.h"
>> +
>> +
>> +#define CSID_TOP_IO_PATH_CFG0(csid)	(0x4 * (csid))
>> +#define		OUTPUT_IFE_EN 0x100
>> +#define		INTERNAL_CSID 1
>> +
>> +#define CSID_HW_VERSION		0x0
>> +#define		HW_VERSION_STEPPING	0
>> +#define		HW_VERSION_REVISION	16
>> +#define		HW_VERSION_GENERATION	28
>> +
>> +#define CSID_RST_CFG	0xC
>> +#define		RST_MODE		0
>> +#define		RST_LOCATION	4
>> +
>> +#define CSID_RST_CMD	0x10
>> +#define		SELECT_HW_RST	0
>> +#define		SELECT_SW_RST	1
>> +#define		SELECT_IRQ_RST	2
>> +
>> +#define CSID_CSI2_RX_IRQ_STATUS	0x9C
>> +#define	CSID_CSI2_RX_IRQ_MASK	0xA0
>> +#define CSID_CSI2_RX_IRQ_CLEAR	0xA4
>> +#define CSID_CSI2_RX_IRQ_SET	0xA8
>> +
>> +#define CSID_CSI2_RDIN_IRQ_STATUS(rdi)		(0xEC + 0x10 * (rdi))
>> +#define CSID_CSI2_RDIN_IRQ_MASK(rdi)		(0xF0 + 0x10 * (rdi))
>> +#define   CSID_CSI2_RDIN_INFO_FIFO_FULL 2
> 
> That's a random set of indentations.
> 

Thanks, will fixes this.

>> +#define   CSID_CSI2_RDIN_INFO_CAMIF_EOF 3
>> +#define   CSID_CSI2_RDIN_INFO_CAMIF_SOF 4
>> +#define   CSID_CSI2_RDIN_INFO_INPUT_EOF 9
>> +#define   CSID_CSI2_RDIN_INFO_INPUT_SOF 12
> 
> 
> ...
> 
>> +
>> +	writel_relaxed(val, csid->base + CSID_RDI_CFG0(vc));
>> +
>> +	val = 1 << RDI_CFG1_PACKING_FORMAT;
>> +	val |= 1 << RDI_CFG1_PIX_STORE;
>> +	val |= 1 << RDI_CFG1_DROP_H_EN;
>> +	val |= 1 << RDI_CFG1_DROP_V_EN;
>> +	val |= 1 << RDI_CFG1_CROP_H_EN;
>> +	val |= 1 << RDI_CFG1_CROP_V_EN;
>> +	val |= RDI_CFG1_EARLY_EOF_EN;
>> +
>> +	writel_relaxed(val, csid->base + CSID_RDI_CFG1(vc));
>> +
>> +	val = 0;
>> +	writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(vc));
>> +
>> +	val = 1;
>> +	writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(vc));
>> +
>> +	val = 0;
>> +	writel_relaxed(val, csid->base + CSID_RDI_CTRL(vc));
>> +
>> +	val = readl_relaxed(csid->base + CSID_RDI_CFG0(vc));
>> +	val |=  enable << RDI_CFG0_EN;
>> +	writel_relaxed(val, csid->base + CSID_RDI_CFG0(vc));
>> +}
>> +
> 
> such patterns and...
> 
>> + */
>> +static int csid_reset(struct csid_device *csid)
>> +{
>> +	unsigned long time;
>> +	u32 val;
>> +	int i;
>> +
>> +	reinit_completion(&csid->reset_complete);
>> +
>> +	writel_relaxed(1, csid->base + CSID_TOP_IRQ_CLEAR);
>> +	writel_relaxed(1, csid->base + CSID_IRQ_CMD);
>> +	writel_relaxed(1, csid->base + CSID_TOP_IRQ_MASK);
>> +
>> +	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
>> +		if (csid->phy.en_vc & BIT(i)) {
>> +			writel_relaxed(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
>> +						csid->base + CSID_BUF_DONE_IRQ_CLEAR);
>> +			writel_relaxed(0x1 << IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
>> +			writel_relaxed(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
>> +						csid->base + CSID_BUF_DONE_IRQ_MASK);
>> +		}
>> +
>> +	/* preserve registers */
>> +	val = (0x1 << RST_LOCATION) | (0x1 << RST_MODE);
>> +	writel_relaxed(val, csid->base + CSID_RST_CFG);
> 
> ... here - using everywhere relaxed here is odd and looks racy. These
> looks like some strict sequences.
> 
Yes, these are some sequences to initialize the HW.

> 
>> +
>> +	val = (0x1 << SELECT_HW_RST) | (0x1 << SELECT_IRQ_RST);
>> +	writel_relaxed(val, csid->base + CSID_RST_CMD);
>> +
>> +	time = wait_for_completion_timeout(&csid->reset_complete,
>> +					   msecs_to_jiffies(CSID_RESET_TIMEOUT_MS));
>> +	if (!time) {
>> +		dev_err(csid->camss->dev, "CSID reset timeout\n");
>> +		return -EIO;
>> +	}
>> +
> 
> 
>> +
>> +static void csid_subdev_init(struct csid_device *csid)
>> +{
>> +	csid->testgen.modes = csid_testgen_modes;
>> +	csid->testgen.nmodes = CSID_PAYLOAD_MODE_NUM_SUPPORTED_GEN2;
>> +}
>> +
>> +const struct csid_hw_ops csid_ops_gen3 = {
> 
> Isn't there a warning here?
> 
>> +	.configure_stream = csid_configure_stream,
>> +	.configure_testgen_pattern = csid_configure_testgen_pattern,
>> +	.hw_version = csid_hw_version,
>> +	.isr = csid_isr,
>> +	.reset = csid_reset,
>> +	.src_pad_code = csid_src_pad_code,
>> +	.subdev_init = csid_subdev_init,
>> +};
> 
> Your patchset does not apply at all. Tried v6.9, v6.10, next. I see some
> dependency above, but that means no one can test it and no one can apply it.
> 
> Fix the warnings, I cannot verify it but I am sure you have them.
> 

My code base is next master branch, do you mean the 'declared and not 
used' warning? I don't see this warning with below two version compiler 
even though I just pick this patch and pull the code the latest version. 
But it indeed have this issue, these structures are declared and will be 
used later in "media: qcom: camss: Add sm8550 resources" patch, will 
think about how to avoid this.

aarch64-linux-gnu-gcc (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0
aarch64-linux-gnu-gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0

---

  CALL    scripts/checksyscalls.sh
   CC [M]  drivers/media/platform/qcom/camss/camss-csid.o
   CC [M]  drivers/media/platform/qcom/camss/camss-csid-4-1.o
   CC [M]  drivers/media/platform/qcom/camss/camss-csid-4-7.o
   CC [M]  drivers/media/platform/qcom/camss/camss-csid-gen2.o
   CC [M]  drivers/media/platform/qcom/camss/camss-csid-gen3.o
   CC [M]  drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.o
   CC [M]  drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.o

---

89a4a25b7b56 (HEAD -> master) media: qcom: camss: Add CSID Gen3 support 
for SM8550
d0cfd24496d3 media: qcom: camss: csiphy-3ph: Add Gen2 v1.2 two-phase 
MIPI CSI-2 DPHY init
5795fd39a8ee dt-bindings: media: camss: Add qcom,sm8550-camss binding

> Best regards,
> Krzysztof
> 

Thanks,
Depeng

