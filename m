Return-Path: <linux-media+bounces-40083-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57779B29963
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 08:08:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C5DA3B624A
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 06:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0327B272E42;
	Mon, 18 Aug 2025 06:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FN0VphzA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF3227145E;
	Mon, 18 Aug 2025 06:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755497327; cv=none; b=HkblD2WyZO45fj0zrnh01aQ7o13lL7Ye2Xmswv9LWDpguCj6QzvPY1F/B35jZ4uPQxky+T3vrj7kqX5GbQvr7ieEovUVh1w/K7LMYPE5UzbvvejEkY2bmlHFBBckrVs2NDgAYFcE9+4Hy/QtoAtjH6uow6DUqyVdR+951u5qs0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755497327; c=relaxed/simple;
	bh=JNr0FlaqcehYTE4JfFhQ7mb0kdN5ZdsjaCiFa0Qr0Cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ucKKtUzhW5+0RM8W2CB+MWzsSAJhW/+ojD05cgLGRww9wUewFBMdZWvPsuk/dKF7QMCxbFdG3ojDIevJJZuAQrJOcpcgDFNnEfZvR6RN0HcTIw7EWpmQHUb2rZpfWDLSOrDGCD5PVd+KaTlKpbX/wZsM/nIdDkUPRITetHgxIK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FN0VphzA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HMWUUS006126;
	Mon, 18 Aug 2025 06:08:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kNFMf5NPJFJvkfWHRb9T2YA36IWt7Qp9VrTkdBsn5PE=; b=FN0VphzA+rj7UfmD
	PBtDKWvIM4v6CZEBJFNGxibCDAsMA/2K4/7e/R0ejorTOfv/S7+4RS8nvub2DojO
	gJy/WPTBrxOXQ8SNcQHKCIfovN1znvzK3/dd6pisqyBTAEbZ6EWnX0DyKRccYDNg
	ah8t4keJwTC4Ihg3NzG7d7cuG2EuddjbnvI1YjO6SUwf26FtHHKuJkcFpLswTE0p
	a39lAZQ0WosQjhBxlI340QlNrEZ+MB1uypQDSGSWOryIkFN5+/FVhy8KQNT2oR9m
	vLzC3Cr8oHbGSLoQ/UsNaf5YWSP4Jy4zSojgzixbVwHy8Uw9ZW7puaC72evLPM1a
	bNLnfg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj743exr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 06:08:36 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57I68aFx011165
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 06:08:36 GMT
Received: from [10.216.58.185] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 17 Aug
 2025 23:08:32 -0700
Message-ID: <6351f4f4-af2f-888c-7dcd-c66b1168afc8@quicinc.com>
Date: Mon, 18 Aug 2025 11:38:22 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 12/24] media: iris: Initialize and deinitialize encoder
 instance structure
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        "Vedang
 Nagar" <quic_vnagar@quicinc.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
 <20250813-iris-video-encoder-v2-12-c725ff673078@quicinc.com>
 <7f20abfe-7ff7-2f44-ab18-2ad70c8a3825@quicinc.com>
 <2163fa0e-68e2-32bd-8333-20894d4c1941@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <2163fa0e-68e2-32bd-8333-20894d4c1941@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: US1xG6cwvFs5KCKG4R-EIo9JfX8aIn4S
X-Proofpoint-ORIG-GUID: US1xG6cwvFs5KCKG4R-EIo9JfX8aIn4S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfX7u3wjYF+zTHN
 +GuAyqMeHNqlwQUaY5bnSxVheXAqW/GXcqlfXdYXxfqhRmzlP0kztazilPRyXaI8Wz5bwmZB73P
 shsaQ8sbAisU4UUDmyC4AiLXktMwvXON7Jo95eC7K3ne43eoGlLwhfkDKG01aK8CZg6FE/pMCzR
 DQ4cVqnJVSMufdm9YhRW7c69iJks4UofomezkukFwrBnwS3J14QxcfgpWbNlwGfzdbY3DPtZ8pO
 8Ko+4gM2/V/hFZ9dECHumIMxllPMXcoPZZXqYsbH3NWvcRME50VGLkw7AEfoJs3+LpRyWJiHckw
 G3pwfSXqOsumBOdTLkWgveDu66iOZ386pXD380hyHmwxdvayalmBwOzz3WB38dCWGXUBpvNV73q
 GpbSNYtf
X-Authority-Analysis: v=2.4 cv=MJtgmNZl c=1 sm=1 tr=0 ts=68a2c365 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=RaWs9BDKXswqdTXtL5wA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160033


On 8/18/2025 8:51 AM, Dikshita Agarwal wrote:
>>> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..e418d347ac111c1bc48304adafa259d697e49fed
>>> --- /dev/null
>>> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
>>> @@ -0,0 +1,65 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>>> + */
>>> +
>>> +#include "iris_buffer.h"
>>> +#include "iris_instance.h"
>>> +#include "iris_venc.h"
>>> +#include "iris_vpu_buffer.h"
>>> +
>>> +int iris_venc_inst_init(struct iris_inst *inst)
>>> +{
>>> +	struct v4l2_format *f;
>>> +
>>> +	inst->fmt_src = kzalloc(sizeof(*inst->fmt_src), GFP_KERNEL);
>>> +	inst->fmt_dst  = kzalloc(sizeof(*inst->fmt_dst), GFP_KERNEL);
>>> +	if (!inst->fmt_src || !inst->fmt_dst)
>>> +		return -ENOMEM;
>> What if inst->fmt_src succeeds while inst->fmt_dst fails, does it frees up
>> inst->fmt_src ?
>>
> would you prefer below?
> 
> if (!inst->fmt_src || !inst->fmt_dst) {
>     kfree(inst->fmt_src);
>     kfree(inst->fmt_dst);
>     return -ENOMEM;
> }
> 

Looks ok..

with that addressed,
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

> Thanks,
> Dikshita

