Return-Path: <linux-media+bounces-11428-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E417F8C4559
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 18:52:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 994FE281FCB
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 16:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 743011946F;
	Mon, 13 May 2024 16:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b8bL5T2q"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEFD18C3D;
	Mon, 13 May 2024 16:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715619139; cv=none; b=ulLDR7zAHADkUjwxcTWYCgtyv+2ji0Eq5Q9TpK3hUrkSxlmAAvR5F2atse5CqmeUQ6UV+eUMAiydDVT3lgjZbTL7IQPoaF6877er1VTSN1bKo/a8m5slwaL7ih10Cpidu5VAJqHiEN/IqpbEqrvG0+Y2BG/0PxSTZT1Gv1KeGNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715619139; c=relaxed/simple;
	bh=HxxOong3W3gZPaT5eDY3JXpmkoKgzN6SCBTlmXMa5lU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=L5iHmvFJpjyPp/zrxe6/x/hcOdhPEUHJ9p+gG0SRJATQFOYIYFAlpmO3B/Jde19oZeQDNfx8P+sg1Hy6RSPkquAVJgrG6qyN+M+7UCmH1Bd3MX+jdG2O5Jea6Gd1viVKzaJloxu4+aIeywDiIGvdCbuC/2UD900kJWofhUI6JEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b8bL5T2q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DBKFuT028330;
	Mon, 13 May 2024 16:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Es6jTmjTFhFxEXJqbKsv8hP+lTSCf3yS1oPECWLd7uU=; b=b8
	bL5T2qM6w6vWqsveIlmPT6FTE+fEHl/SgiNkv56tjxBXCYVJ0SIg76lJVLQgmOli
	17SFFFZc5wP6pDBDj+MvzoH2h0AAhphre+NP+OYqcJ0kcEobhDH1fPi3Bq+TcBw/
	QsdEVeBalSbAUGFnGF3hiKyk+HIxqJh+dc3k+zF8Pb0UM0UnyRTJG34OnFNdRbrn
	KzgjumTmYHZAyXeD743//D3gG6fegklJIgC2ka8Phusi+H2ZyJRYpSUV+Kz6zjVY
	ttLWSzC/dOm1fPYju+MhZ5juBzoHxUpLxhiR/v8ITbtB8qu8Cc2H5bJ1xhQLVNIA
	U4liJwWFrg04LepwDmcA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y1ymq45qg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 16:52:11 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44DGq9Uj022330
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 16:52:09 GMT
Received: from [10.251.44.40] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 May
 2024 09:52:04 -0700
Message-ID: <d53fec3e-e46c-4185-abcd-e621818057a5@quicinc.com>
Date: Mon, 13 May 2024 19:52:02 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] media: qcom: camss: Move format related functions
Content-Language: en-US
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <laurent.pinchart@ideasonboard.com>,
        <hverkuil-cisco@xs4all.nl>, <quic_hariramp@quicinc.com>
References: <20240411124543.199-1-quic_grosikop@quicinc.com>
 <20240411124543.199-6-quic_grosikop@quicinc.com>
 <c6797921-2c2b-4dc1-866e-011d10c9d3c2@linaro.org>
From: "Gjorgji Rosikopulos (Consultant)" <quic_grosikop@quicinc.com>
In-Reply-To: <c6797921-2c2b-4dc1-866e-011d10c9d3c2@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: w_TBqawH3ZvU1dG_Am_m1ksTWIZOPq5_
X-Proofpoint-ORIG-GUID: w_TBqawH3ZvU1dG_Am_m1ksTWIZOPq5_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_11,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405130109

Hi Vladimir,

Thanks for the review,


On 5/13/2024 6:39 PM, Vladimir Zapolskiy wrote:
> On 4/11/24 15:45, Gjorgji Rosikopulos wrote:
>> From: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
>>
>> Move out the format related helper functions from vfe and video in a
>> separate file. The goal here is to create a format API.
>>
>> Signed-off-by: Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>
>> Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/camss/Makefile    |  1 +
>>   .../media/platform/qcom/camss/camss-format.c  | 98 +++++++++++++++++++
>>   .../media/platform/qcom/camss/camss-format.h  |  5 +
>>   drivers/media/platform/qcom/camss/camss-vfe.c | 86 +++++-----------
>>   .../media/platform/qcom/camss/camss-video.c   | 26 +----
>>   5 files changed, 128 insertions(+), 88 deletions(-)
>>   create mode 100644 drivers/media/platform/qcom/camss/camss-format.c
>>
>> diff --git a/drivers/media/platform/qcom/camss/Makefile
>> b/drivers/media/platform/qcom/camss/Makefile
>> index 0d4389ab312d..e636968a1126 100644
>> --- a/drivers/media/platform/qcom/camss/Makefile
>> +++ b/drivers/media/platform/qcom/camss/Makefile
>> @@ -19,5 +19,6 @@ qcom-camss-objs += \
>>           camss-vfe-gen1.o \
>>           camss-vfe.o \
>>           camss-video.o \
>> +        camss-format.o \
>>     obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
>> diff --git a/drivers/media/platform/qcom/camss/camss-format.c
>> b/drivers/media/platform/qcom/camss/camss-format.c
>> new file mode 100644
>> index 000000000000..6279cb099625
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/camss/camss-format.c
>> @@ -0,0 +1,98 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/* Copyright (c) 2023, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2023 Qualcomm Technologies, Inc.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 and
>> + * only version 2 as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
> 
> SPDX-License-Identifier is fully sufficient, the licence description
> shall be removed.

I need to check, but as i can see with other files the license
description can be removed.

> 
>> +
>> +#include <linux/bug.h>
>> +#include <linux/errno.h>
>> +
>> +#include "camss-format.h"
>> +
>> +/*
>> + * camss_format_get_bpp - Map media bus format to bits per pixel
>> + * @formats: supported media bus formats array
>> + * @nformats: size of @formats array
>> + * @code: media bus format code
>> + *
>> + * Return number of bits per pixel
>> + */
>> +u8 camss_format_get_bpp(const struct camss_format_info *formats,
>> unsigned int nformats, u32 code)
>> +{
>> +    unsigned int i;
>> +
>> +    for (i = 0; i < nformats; i++)
>> +        if (code == formats[i].code)
>> +            return formats[i].mbus_bpp;
>> +
>> +    WARN(1, "Unknown format\n");
>> +
>> +    return formats[0].mbus_bpp;
>> +}
>> +
>> +/*
>> + * camss_format_find_code - Find a format code in an array
>> + * @code: a pointer to media bus format codes array
>> + * @n_code: size of @code array
>> + * @index: index of code in the array
>> + * @req_code: required code
>> + *
>> + * Return media bus format code
>> + */
>> +u32 camss_format_find_code(u32 *code, unsigned int n_code, unsigned
>> int index, u32 req_code)
>> +{
>> +    int i;
>> +
>> +    if (!req_code && index >= n_code)
>> +        return 0;
>> +
> 
> 0 as an error condition indicator is not very common, at least it shall be
> documented in the comment.

The original function was vfe_find_code. This change moves all format
related functions across the sub-device files to camss-format
I believe that 0 is default format.

> 
>> +    for (i = 0; i < n_code; i++) {
>> +        if (req_code) {
>> +            if (req_code == code[i])
>> +                return req_code;
>> +        } else {
>> +            if (i == index)
>> +                return code[i];
>> +        }
>> +    }
>> +
>> +    return code[0];
>> +}
>> +
>> +/*
>> + * camss_format_find_format - Find a format in an array
>> + * @code: media bus format code
>> + * @pixelformat: V4L2 pixel format FCC identifier
>> + * @formats: a pointer to formats array
>> + * @nformats: size of @formats array
>> + *
>> + * Return index of a format or a negative error code otherwise
>> + */
>> +int camss_format_find_format(u32 code, u32 pixelformat, const struct
>> camss_format_info *formats,
>> +                 unsigned int nformats)
>> +{
>> +    int i;
> 
> unsigned int i

Maybe it makes sense to go to all functions already existing in camss
and change int with unsigned int for for loops...

> 
>> +
>> +    for (i = 0; i < nformats; i++) {
>> +        if (formats[i].code == code &&
>> +            formats[i].pixelformat == pixelformat)
>> +            return i;
>> +    }
>> +
>> +    for (i = 0; i < nformats; i++) {
>> +        if (formats[i].code == code)
>> +            return i;
>> +    }
>> +
>> +    WARN_ON(1);
>> +
> 
> WARN_ON() is not needed here, it has to be removed.

Again this is migrated code from camss-video :/. I guess we need bigger
consensus to remove this WARN_ON. For me it makes sense to be removed.

~Gjorgji

