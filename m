Return-Path: <linux-media+bounces-23155-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA429EC4B3
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 07:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F54716871C
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 06:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8CCC1C4604;
	Wed, 11 Dec 2024 06:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dxZ0jaeu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52C32451C0;
	Wed, 11 Dec 2024 06:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733898271; cv=none; b=E48lqoc2GQRYy8cqXub/KFE0tNOIT+NXHOEZ2AN35DAwiXI+7iNS3ndg8C0r+e7f8nmRbrKY9DrpwxiIbf+iNostPBte+m66ziXwUV3oue0KLOD+LkHG56AhiwbcYUYNcEpt1NFvUWIlqlARz/SXlGGjP7Rm8TuyGMHurFw5D3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733898271; c=relaxed/simple;
	bh=cXsu/Gi3s+bedrEAgU2nKMRWj1f8OC+Z0CWG92qiJCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=n/qA6cQesJHUc/3B1+kTP557FTdEwOoBQ+ssTGQgx5E1AV9H8+q4QLbLUnlX4JyVLf1i1YsFeoDEPxPJb7vqPbzzRO7CbDdHQLKwqTJUYfXBRHX+aPJtC6Jd1kVdS1p5qkrZGHyE0DTAYtVX8xJUZnc3pMQUF1ObAwQnWvRaAmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dxZ0jaeu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB6JaCQ002655;
	Wed, 11 Dec 2024 06:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PA0rk8LB7k2DRfwNO6nYoqrgYmmGKKzQ3UQDmIENKTY=; b=dxZ0jaeuK5M0yoUk
	71k/2XnPHJ3y1TyqW900o9BSElheFDZvB44aeK5uvE3P5PYVEdaarZ3re900ixgM
	IdbH0ihShqGMXEBIOs5Ip1XOKywl9YnSIg3Ygpyg12MOZ9msWNxH+DLJ4U+hovFt
	SjujaEl/TnTlvh7FztFL9Ftbc4Sh8EaXH6f8bCRM9HLcD+lTxlFgUqF8ADsTl8zV
	5EJmrhxdseqPgOD5fel7JY7aS5BISo6cv0LAPp42vt7cUiW/7F2Q4iV2meW3KZd5
	IUKNMKY15bHlkAUdS81fQL1US33aqUTygIi5Lbu0bUKx/DLj0eygtLf/imZPPccM
	2XvVww==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43dxw46sxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 06:24:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BB6OIL6032101
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 06:24:18 GMT
Received: from [10.204.101.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Dec
 2024 22:24:12 -0800
Message-ID: <b4f35301-6361-9e07-73dc-023e87c80857@quicinc.com>
Date: Wed, 11 Dec 2024 11:54:09 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 27/28] media: iris: enable video driver probe of SM8250
 SoC
Content-Language: en-US
To: Stefan Schmidt <stefan.schmidt@linaro.org>
CC: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Hans
 Verkuil" <hverkuil@xs4all.nl>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas@ndufresne.ca>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
	<u.kleine-koenig@baylibre.com>,
        Jianhua Lu <lujianhua000@gmail.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241210-qcom-video-iris-v8-0-42c5403cb1a3@quicinc.com>
 <20241210-qcom-video-iris-v8-27-42c5403cb1a3@quicinc.com>
 <CAEvtbuuO5Ga+wW9rstX_e_RGnm5jSNSHmyy3w3M9FTopNhKttQ@mail.gmail.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <CAEvtbuuO5Ga+wW9rstX_e_RGnm5jSNSHmyy3w3M9FTopNhKttQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HWUIum05cGACm-Xsx1JAFYpE3BoK07t2
X-Proofpoint-GUID: HWUIum05cGACm-Xsx1JAFYpE3BoK07t2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 clxscore=1015 spamscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110046



On 12/10/2024 9:53 PM, Stefan Schmidt wrote:
> hello Dikshita,
> 
> On Tue, 10 Dec 2024 at 12:08, Dikshita Agarwal
> <quic_dikshita@quicinc.com> wrote:
>>
>> Initialize the platform data and enable video driver probe of SM8250
>> SoC. Add a kernel param to select between venus and iris drivers for
>> platforms supported by both drivers, for ex: SM8250.
>>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> 
> [...]
> 
>> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
>> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
>> @@ -17,6 +17,8 @@ static inline bool iris_valid_cap_id(enum platform_inst_fw_cap_type cap_id)
>>  static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>>  {
>>         switch (id) {
>> +       case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
>> +               return DEBLOCK;
>>         case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
>>                 return PROFILE;
>>         case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
>> @@ -32,6 +34,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>>                 return 0;
>>
>>         switch (cap_id) {
>> +       case DEBLOCK:
>> +               return V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER;
>>         case PROFILE:
> 
> The handling for DEBLOCK does not seem to be part of the SM8250
> enablement. Or did I miss something?
> It seems they should be part of a different patch that makes use of
> the DEBLOCK cap.
> 
this cap is part of platform caps of SM8250 and the value(set by
client/default) of this will set to firmware as part of start streaming
through set APIs.
{
+		.cap_id = DEBLOCK,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER,
+		.set = iris_set_u32,
+	},

Thanks,
Dikshita
> regards
> Stefan Schmidt

