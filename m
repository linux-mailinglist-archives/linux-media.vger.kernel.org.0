Return-Path: <linux-media+bounces-36621-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 048D3AF6056
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 19:47:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78F244836C7
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 17:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B0A8309A75;
	Wed,  2 Jul 2025 17:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IuEjWV8K"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D27E1EE7C6;
	Wed,  2 Jul 2025 17:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751478429; cv=none; b=Yaol0YrJGqwlhQt7TEyLtLr8YDFEzonLWoHfkCYk5BQcAZefhiO2lPjXCu+WDbmZ6LDHPRAcEDQB+8WAgBps0wKsV16CTRTb86DW/STfwn2RUEqdBiUBIOPNSjwsB/rEpsrqGC0iKsVFBvO20RNegz7UhlaPsRgayfNBdjIlfUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751478429; c=relaxed/simple;
	bh=MiPwIOdM0JutTb0cBDl2M81NVDiYdpy04dBf18sA+Bk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rtDngw1c0rn4V8FStVnJfC/f25HsaKp8+ASUuwH2IVDrwBR8zt5nWBgWDwl55uT3TbmFdRhwVcuJ9GEyvyRuffkSAaW3U7A3ZjVU50cMZixFCGXhCmdG9DmkK1N9RS/BggKS9dwIkRhu4hBi/j2i6xh3gu+7+z4qSHD1aozhME0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IuEjWV8K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562Cowbn002651;
	Wed, 2 Jul 2025 17:46:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	krn+yT+A5nW8hyM3OIY3/wIWLOv0O6mRmlKsp5uBhX8=; b=IuEjWV8KlUyHox0d
	a5uz+vriemtSAPqzBP/PAjAA6ZdgTJXZXB6eUjvsoCvXDSBWWzyFYYDB2Slgeybp
	ry0lo9JB2ZXhe1uXjvzgHXVg8K2mvnhjYvSsxNNY7QidOQFya8hoeT04+ufT2bnQ
	yI6zYPSNBj8szk8louleoPckCJrbovwew8Xkc358lVGkaIdGnsMt1WUDGkdGR3ap
	ynV9e8PrlcCYpoXR1sRVfGs0ApV/R+i5jJSTbkglAvxu8AJVWIfVECOc4Owe3k2z
	JNQxTzNNaYB/VdqQqTLihS4lB1DvBynMg0gRUEBXU6QNbQ8+42LUvnSGH2aWqhOC
	xSvxnw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcwgwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 17:46:56 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 562Hktgj030256
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 17:46:55 GMT
Received: from [10.50.58.161] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 2 Jul 2025
 10:46:52 -0700
Message-ID: <7627d909-30d4-bf09-2736-a24bc91e28cf@quicinc.com>
Date: Wed, 2 Jul 2025 23:16:49 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] media: iris: Be explicit in naming of VPU2 power off
 handlers
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250702134227.211104-2-krzysztof.kozlowski@linaro.org>
 <7ee61b56-4c93-f6e2-d405-9f88f69af675@quicinc.com>
 <85c3e526-b654-473c-82f7-0183e5fb5dd3@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <85c3e526-b654-473c-82f7-0183e5fb5dd3@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -0Hr8E2waxkaWrYWqZ-df6qaWo3-amgC
X-Proofpoint-ORIG-GUID: -0Hr8E2waxkaWrYWqZ-df6qaWo3-amgC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE0NyBTYWx0ZWRfXySl7Qut20PZX
 gNVQPjDrPZ5XnJf+I8nVsif5IdCYcIVaQY2dxLFQ6D8qFNvkTjI9eV5SFsov5ZU5r9R9N6umYNq
 t3cQYVl6HqPeSk77pdo8PfSu89CbSiD3A5OAzVFVVsE+w1G3WB1yqFkqqeCBm+Mp1ZeJ36WqHVA
 vyL2naovc30Xdp7iDfaZKL4/L0EV9z5C7Zl18bBZiRTtNCwGy6Mgrc3QZFncmx/k93SMpBWFf7y
 p7j3M2yTiglwZnVvmRKOxovn9awRF0TUzdwVoGJtcC9t1DkLIthPr2k7ME3lR8/UuA9mwQiculb
 qgqrEfMjyzamR6R08ceS5xvCdmIE6kSco7HjiBp9KO1ZM3+qwxeeKRLMnO42f3yNkn4VYMcZTut
 9OqvE7vp30wwbWYdIrokbudlYJsFLh4b91eFBlDu+U2uGh7lY+uKpL3tmKa2Z7Rzg9e1U1TD
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=68657090 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=84x3ICFTYLOaS29QxbYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_02,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020147


On 7/2/2025 10:59 PM, Krzysztof Kozlowski wrote:
> On 02/07/2025 19:20, Vikash Garodia wrote:
>>>  
>>>  const struct vpu_ops iris_vpu2_ops = {
>>> -	.power_off_hw = iris_vpu_power_off_hw,
>>> -	.power_off_controller = iris_vpu_power_off_controller,
>>> +	.power_off_hw = iris_vpu2_power_off_hw,
>>> +	.power_off_controller = iris_vpu2_power_off_controller,
>> There was a reason to name it as VPU* independent, as it can be used for
>> multiple VPUs. There isn't any VPU specific code within iris_vpu_power_off_hw
>> that it needs to be associated to any VPU.>>
>>>  	.calc_freq = iris_vpu2_calc_freq,
>>>  };
>>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>>> index 9b7c9a1495ee..a2c8a1650153 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>>> @@ -104,7 +104,7 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
>>>  	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>>>  
>>>  disable_power:
>>> -	iris_vpu_power_off_hw(core);
>>> +	iris_vpu2_power_off_hw(core);
>> Again, its like VPU3 does something specific and then reuses the common handling.
>>
>> I do not see a point in making this change.
> 
> The point is expressed in commit msg so address that. Also, this will
> not be even correct for SM8750.
When changes are raised for SM8750, the need of it can be reviewed then. Raise
the patch for power off for SM8750 to review the incorrectness better.

Regards,
Vikash
> 
>>
>> Regards,
>> Vikash
>>>  }
>>>  
>>>  static void iris_vpu33_power_off_hardware(struct iris_core *core)
>>> @@ -142,7 +142,7 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
>>>  	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>>>  
> 
> Please kindly trim the replies from unnecessary context. It makes it
> much easier to find new content.
> 
> Best regards,
> Krzysztof

