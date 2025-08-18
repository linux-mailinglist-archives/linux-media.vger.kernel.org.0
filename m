Return-Path: <linux-media+bounces-40084-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15514B29970
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 08:10:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80E3B189FB15
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 06:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A8B272E45;
	Mon, 18 Aug 2025 06:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="emfUwLou"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCEC54758;
	Mon, 18 Aug 2025 06:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755497445; cv=none; b=FNq5UEEYfZIpvuWFotIGv4LLfPKPO3lho0nivumNv9QGuNM9Tc9xYpi2nAFx1NQRwLwTdbAGaU7duwgEu4PagRNDid/cz0ZyltIxm9QeqfKqpNIhjlJiDzW6zL/HLSS48v5lTGlaJhMtZxx9ZTxHoP+cptO3+wpdh42lPEPzm44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755497445; c=relaxed/simple;
	bh=WVi/CRyA32PYH3kmhlG9jBvAUnW/KDwCmkPrhns0Y+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=M92PWaLRyAFrl9wgDVqg8d4ealm0QPeVNf5PjyRYPqZK9UQLaLc1v3cHTBBRBG8WJ+GXyqDOGhdASUAhyFBYnWsZ0HCM+mEPlgAfvW3TMVIbm+lGtuju6psolXH6qSwN+Fdkfte48BUxKsTB3xRKzDxLpOqgfiOpuUtQL4mRZEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=emfUwLou; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HNrog7013836;
	Mon, 18 Aug 2025 06:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SpBdYx+beH/Co5nZd0XC/2uaG0MNe64EDpp/8vtf7ow=; b=emfUwLou71qTpr7i
	KIoBELO2Dwu3yjDZtdkFUgYHyr4rkI6eIgbTZ/XucQXXaLA5ycm0DE5Oq5+A9//5
	K23kvo++3bJWDWoTdEAGkGEk1DS+hSHbmX5O/wAPhrEkLKhiZKqPXphiAS+PxQbM
	14nN8fJyth2/OZy8peqUd3Afa9MpufGKMyzrnNKII/YJemoht3cBVzyV/w4/g7rS
	dAd/apzlP1347a7m4ame2Aut6cN32NmXO/4edDFAPXr2LDId5e83XpTfu7AjJUkF
	nkTsPyel05SBpPpG7FvX9Xpc7Lu+ustCixU+jGfXFCFrFqAdSbwyNMoMguAUutmm
	TQl7GA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jfbnbppk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 06:10:32 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57I6AVu7030031
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 06:10:31 GMT
Received: from [10.216.58.185] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 17 Aug
 2025 23:10:27 -0700
Message-ID: <dc2c31d7-2972-8129-7b43-267273e8beea@quicinc.com>
Date: Mon, 18 Aug 2025 11:40:24 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 14/24] media: iris: Add support for
 ENUM_FRAMESIZES/FRAMEINTERVALS for encoder
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
 <20250813-iris-video-encoder-v2-14-c725ff673078@quicinc.com>
 <3954667c-5b27-38b6-f6b9-1943b29d6594@quicinc.com>
 <3615936a-b33d-57ef-39f6-02d0e8b74433@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <3615936a-b33d-57ef-39f6-02d0e8b74433@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAwMSBTYWx0ZWRfXynwpO6/lqJxE
 k6qQSpEFbwalcChZPhx5W43xQt92KjOwDbfFzJo6b8Rr6fCGZI/At4WNZ58LPKaXiAC/9+/gZve
 DzOrOhuP90sIe1Z3wL25UUt9OYTqIWThLZdzIhxWQ9Pwzn3Zfm2VzH/1tm8GLz1dCS2/tEAM2Z5
 lCHeB+xdza32aVOU15fYdcK0NZ10bHpmTrj3Vr0JoiRjFRDfw2GA2OC2uALxDAD29KT1n+QZNgX
 TDLq6FH6LLzB/qPIbj8GD6gvDomj91UiEEoTKk6fq0f3rGadYVDvwBuOkUxdxRUX57Aqe15aatI
 DhpyOvc5EgMpMjZO4aFZc6dkYcjoSaonSUigNsWhT5A9Xm4YoFaawp8sT0cGWgj//vCtqcS+f4j
 PVZXZG8S
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=68a2c3d8 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=FHYOSQfEjAPHiCk0ulsA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: IyKWvKNlUJFyCuVnyNE4UZPwc81UDDIg
X-Proofpoint-ORIG-GUID: IyKWvKNlUJFyCuVnyNE4UZPwc81UDDIg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160001


On 8/18/2025 8:51 AM, Dikshita Agarwal wrote:
>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>> index d3026b2bcb708c7ec31f134f628df7e57b54af4f..1e2fadfe17672029b46e07ce00a8e31e0711fd58 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>> @@ -354,6 +354,7 @@ struct iris_platform_data sm8550_data = {
>>>  	.num_vpp_pipe = 4,
>>>  	.max_session_count = 16,
>>>  	.max_core_mbpf = NUM_MBS_8K * 2,
>>> +	.max_core_mbps = ((7680 * 4320) / 256) * 60,
>>>  	.input_config_params_default =
>>>  		sm8550_vdec_input_config_params_default,
>>>  	.input_config_params_default_size =
>>> @@ -429,6 +430,7 @@ struct iris_platform_data sm8650_data = {
>>>  	.num_vpp_pipe = 4,
>>>  	.max_session_count = 16,
>>>  	.max_core_mbpf = NUM_MBS_8K * 2,
>>> +	.max_core_mbps = ((7680 * 4320) / 256) * 60,
>>>  	.input_config_params_default =
>>>  		sm8550_vdec_input_config_params_default,
>>>  	.input_config_params_default_size =
>>> @@ -500,6 +502,7 @@ struct iris_platform_data qcs8300_data = {
>>>  	.num_vpp_pipe = 2,
>>>  	.max_session_count = 16,
>>>  	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
>>> +	.max_core_mbps = ((7680 * 4320) / 256) * 60, //TODO confirm!!
>> TODO ? 4k@60 is supported mbps for qcs8300
> It was a miss, will remove the TODO.
> 

With that fixed..

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

