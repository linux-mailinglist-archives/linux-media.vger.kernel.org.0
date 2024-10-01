Return-Path: <linux-media+bounces-18918-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C58B98BCFE
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 15:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B7A9281B6C
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 13:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF0D21C3F06;
	Tue,  1 Oct 2024 13:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ME3flR14"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47B91C330A;
	Tue,  1 Oct 2024 13:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727787705; cv=none; b=m8YJqSNeOnq/c97cY+hQLWre759MB8mxIQCkYfDvAFkPWqu+N9EB5QNz+mud10hs34sTGa5Bm1Z9trHFq6QPvWxnkrjI4/F971s5KN5u5nrsHUMf5tRwbQlh4n/+B6D2OA09x8YRQv7v5yyBlMOjhYTADY3i/eZFAfUZ/NdAhDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727787705; c=relaxed/simple;
	bh=4Y5sGhZ97a7xeDkBrVP4lwYugZ/uKadI5LMPQi1+R+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KJEQ9oEap2OuBptDr0HEmICyNPSv6EYubJLaSkTfh83Y79mleDntA/EKBTRKX0jhGKOTWWqaTj9kiMYsy2koewqIHflJeHjheMm0xEG7q6VdI7/+uIZMe7QMMo/1UxPd9Cvivb0rVU8svMhhXHi0S1zqzJn3Ogh3NN3gcoUL9W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ME3flR14; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491BeuVl015368;
	Tue, 1 Oct 2024 13:01:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4KPBQuLEVZhgGC74rHGI458sjUcPHNjSF4cTzOGHiOg=; b=ME3flR14rIPcntiH
	WVxyIHMcKwF+jR+Mk5AhMv/cZI8ndhyEpq4jG7SLPR93heIc+PpWcG4ZgfXwuA/D
	usbekN+OeqFuVFA/sPNVP42aq2c3O/g34JjFazv+d9YxQIIXs0cVv8jF3umYqGio
	cyYAfps6ll9OpUXlfpeJOmWMmGEbYWJ86jUmoFmH94optSXSWrs0kVdzzwAm3yIT
	0C8Ab+sp4yTyb1s9GIOJ0/UnpRILhMMDUNrvWhM5tw9biINxAr92z4Sb2EMpbRQJ
	G0D3realXXJWJFfPFWSdmO6NJ/ks9bgOb5tdeKkTnjU9ZQo6zohsUFD0Fen1kt6R
	Ysoyow==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41x9vu89cq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 13:01:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 491D1Pmb018098
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Oct 2024 13:01:25 GMT
Received: from [10.216.35.199] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 1 Oct 2024
 06:01:20 -0700
Message-ID: <15703542-1b70-4042-86b9-7b3f3a675e3e@quicinc.com>
Date: Tue, 1 Oct 2024 18:31:16 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/29] media: iris: implement iris v4l2_ctrl_ops and
 prepare capabilities
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <quic_dikshita@quicinc.com>
CC: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-16-c5fdbbe65e70@quicinc.com>
 <gehwgofhviqcnopaughxfcpsqmbbiaayid2scgat4xnd5ngwmo@ylawfiup2tqc>
Content-Language: en-US
From: Vedang Nagar <quic_vnagar@quicinc.com>
In-Reply-To: <gehwgofhviqcnopaughxfcpsqmbbiaayid2scgat4xnd5ngwmo@ylawfiup2tqc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: L8Bu5gwRA3XyPMsIkRyxKCY1zoLCRxjn
X-Proofpoint-ORIG-GUID: L8Bu5gwRA3XyPMsIkRyxKCY1zoLCRxjn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1011 spamscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2410010083

Hi Dmitry,

On 8/29/2024 3:03 PM, Dmitry Baryshkov wrote:
> On Tue, Aug 27, 2024 at 03:35:41PM GMT, Dikshita Agarwal via B4 Relay wrote:
>> From: Vedang Nagar <quic_vnagar@quicinc.com>
>>
>> Implement s_ctrl and g_volatile_ctrl ctrl ops.
>> Introduce platform specific driver and firmware capabilities.
>> Capabilities are set of video specifications
>> and features supported by a specific platform (SOC).
>> Each capability is defined with min, max, range, default
>> value and corresponding HFI.
>>
>> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>  drivers/media/platform/qcom/iris/Makefile          |   1 +
>>  drivers/media/platform/qcom/iris/iris_buffer.c     |   3 +-
>>  drivers/media/platform/qcom/iris/iris_core.h       |   2 +
>>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 194 +++++++++++++++++++++
>>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  15 ++
>>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   4 +
>>  .../platform/qcom/iris/iris_hfi_gen2_command.c     |   1 +
>>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   9 +
>>  drivers/media/platform/qcom/iris/iris_instance.h   |   6 +
>>  .../platform/qcom/iris/iris_platform_common.h      |  71 ++++++++
>>  .../platform/qcom/iris/iris_platform_sm8250.c      |  56 ++++++
>>  .../platform/qcom/iris/iris_platform_sm8550.c      | 138 +++++++++++++++
>>  drivers/media/platform/qcom/iris/iris_probe.c      |   7 +
>>  drivers/media/platform/qcom/iris/iris_vdec.c       |  24 ++-
>>  drivers/media/platform/qcom/iris/iris_vdec.h       |   2 +-
>>  drivers/media/platform/qcom/iris/iris_vidc.c       |  16 +-
>>  16 files changed, 536 insertions(+), 13 deletions(-)

[Skipped]

>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> index a74114b0761a..6ad2ca7be0f0 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> @@ -108,6 +108,7 @@ static int iris_hfi_gen2_session_set_default_header(struct iris_inst *inst)
>>  	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>>  	u32 default_header = false;
>>  
>> +	default_header = inst->fw_cap[DEFAULT_HEADER].value;
> 
> This isn't related to the s_ctrl and g_volatile_ctrl. Please split this
> commit into the chunk that is actually related to that API and the rest
> of the changes.
Could you please help to provide more details on how are you expecting the
split of the patches?

Do you expect to split V4L2 ctrls_init/s_ctrl/g_ctrl in one patch and the
introduction of all the capabilities into another patch? We are not finding
it feasible to split the patch that way as in ctrl_init we read the
capability from platform data to initialize the respective control.

Regards,
Vedang Nagar
> 
>>  	iris_hfi_gen2_packet_session_property(inst,
>>  					      HFI_PROP_DEC_DEFAULT_HEADER,
>>  					      HFI_HOST_FLAGS_NONE,
> 
> 

