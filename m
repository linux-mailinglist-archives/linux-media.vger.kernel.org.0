Return-Path: <linux-media+bounces-40232-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9635CB2BABC
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 09:29:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 840B65606E4
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 07:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 588D02D248C;
	Tue, 19 Aug 2025 07:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kI2AwKQd"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF9E27B353;
	Tue, 19 Aug 2025 07:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755588567; cv=none; b=RlDm6MhiIFeavbHe519BV6ankIxMzbp+oSYsGRF/umlhsZMt9EAEMnQDwG4t+E5nrOzUzOFpL5KGNekKmDsVXNewUQjAzCKensMq74nZPY3Ux9mtG7AjceOM2msNEwqI478PVr0ZjMDueFuA2CMVBHEyTIBwm3siOxDE4ZOLGhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755588567; c=relaxed/simple;
	bh=sWXNXrmpZM/zIPEpHXEp/nNdNOPPPh3S0g1xhyrueSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pX9pE6BjUvst2ZigPPKpkobbhg/j6XPxxyRg87PZCjxaPu984xpkB6K5QTp/+t7imYiCKJTTZ7LTi/Ix58WmpPMmdY87fqQ0w/KIwXHELoDTRPrmWWW98heXjqhQe4rSzVFgetQfmgBgrJaAH/Y5EATkM9b9jqaMbDG9i8HXIHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kI2AwKQd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J3FJ24026231;
	Tue, 19 Aug 2025 07:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YllUjDGa6oXUBXmA1B/7KGfSPr3rEXGRBzTtV3TN4K8=; b=kI2AwKQdTLnTvuHw
	Yv10bX/n1gt9Oku/rJB7VfDrzwGxr2nNW9cLfpCNDCVop2H404eQcofETJdSnxg7
	JD5VfjxikZQ5FKzTRJ5+P+6KOwgBbLcBU5Ls9yEQPQH1GuRIbfQbCRpLcZseTo+I
	00VCQV33ECxoqhFNwfmhS617hn2TViUipWHsxI0acQ3K1qZa/X3cnanIH+mdFCYz
	c6u2rn3/kjRaslFWVQhG6qMAvxdLDd9hxQOfVeG/AieOBzLeAbaVohNHLHiSkBvx
	08R92Of6G5ECP9M5xHx9V6PY+otxyAVf+eI0barST5f3ur9csLmLdRexrG0cjTub
	m0eVUw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhagyk1g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Aug 2025 07:29:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57J7TJd8005232
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Aug 2025 07:29:19 GMT
Received: from [10.50.26.158] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 19 Aug
 2025 00:29:15 -0700
Message-ID: <6f46f608-61a2-77d8-6a78-84fcf160865b@quicinc.com>
Date: Tue, 19 Aug 2025 12:59:12 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 08/24] media: iris: Allow stop on firmware only if
 start was issued.
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Mauro
 Carvalho Chehab" <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Vedang Nagar
	<quic_vnagar@quicinc.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
 <20250813-iris-video-encoder-v2-8-c725ff673078@quicinc.com>
 <4fe5d966-f788-4fd7-9e74-6d63ecc8dcb3@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <4fe5d966-f788-4fd7-9e74-6d63ecc8dcb3@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=D9xHKuRj c=1 sm=1 tr=0 ts=68a427d0 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=DPfoDAcuhgr0HiD5mycA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: c3GoDR1MgUynSv-XnAgBBn3CREAOobh7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyNCBTYWx0ZWRfX7xeYKbhKozTk
 MxmiE8q/ndagpXy07CHR0kr0HMRM0ALl/re6aU5ZcwrPvaE8omixsfcV1GTRfwZrrvtrxBfYxeH
 imwNkdypGOZuwARcVRuz9AEz+Mi8kUeUMgb5f6Io9E4Mv91V4TJxVX7AtQ+nxyl7TrH0NWqRzTS
 Bie5gJsIqed/bDc7RnXVebtNCZ5nWW6npWrcPelcnybtfWUcQUavPfyker7n1hvnrqnIcI6p5CK
 ziBuAReb3ywQKDnjN/4Wfj/LNYEQbt/1eu2NpJI6JNCd82Rertqpa1B5npr6BJBj8Dnum91vecq
 9Uq3T9JZ90TlHWWTiWStq6MVXCkOtxHxDHVgfQtqIw2hou8yMRMChjuUbqRF4lzMagSAxlQVnPR
 57LePZVy
X-Proofpoint-GUID: c3GoDR1MgUynSv-XnAgBBn3CREAOobh7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160024



On 8/16/2025 4:37 PM, Bryan O'Donoghue wrote:
> On 13/08/2025 10:37, Dikshita Agarwal wrote:
>> For HFI Gen1, the instances substate is changed to LOAD_RESOURCES only
>> when a START command is issues to the firmware. If STOP is called
>> without a prior START, the firmware may reject the command and throw
>> some erros.
>> Handle this by adding a substate check before issuing STOP command to
>> the firmware.
>>
>> Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
>> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> index
>> 5fc30d54af4dc34616cfd08813940aa0b7044a20..5f1748ab80f88393215fc2d82c5c6b4af1266090 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> @@ -184,11 +184,12 @@ static int iris_hfi_gen1_session_stop(struct
>> iris_inst *inst, u32 plane)
>>       u32 flush_type = 0;
>>       int ret = 0;
>>   -    if ((V4L2_TYPE_IS_OUTPUT(plane) &&
>> -         inst->state == IRIS_INST_INPUT_STREAMING) ||
>> +    if (((V4L2_TYPE_IS_OUTPUT(plane) &&
>> +          inst->state == IRIS_INST_INPUT_STREAMING) ||
> 
> this is becoming a highly complex clause
> 
>         if (((V4L2_TYPE_IS_OUTPUT(plane) &&
>               inst->state == IRIS_INST_INPUT_STREAMING) ||
>             (V4L2_TYPE_IS_CAPTURE(plane) &&
>              inst->state == IRIS_INST_OUTPUT_STREAMING) ||
>             inst->state == IRIS_INST_ERROR) &&
>                 inst->sub_state & IRIS_INST_SUB_LOAD_RESOURCES) {
> 
> can we not reduce down the number of conjunctions and dis-junctions here ?
> 
> Its getting hard to follow.
> 
> For example pivot on if (inst->sub_state & IRIS_INST_SUB_LOAD_RESOURCES)
> 
> or make it into a switch for inst->state... no that wouldn't work
> 
> Either way the complexity of this clause is indicating to me we need to do
> some decomposition.
> 
> Please consider if you can rationalise the logic here and make the code
> more readable.

Sure, I will see if some of these conditions can be absorbed in caller or
if handled by vb2 framework itself.

Thanks,
Dikshita
>>           (V4L2_TYPE_IS_CAPTURE(plane) &&
>>            inst->state == IRIS_INST_OUTPUT_STREAMING) ||
>> -        inst->state == IRIS_INST_ERROR) {
>> +        inst->state == IRIS_INST_ERROR) &&
>> +        inst->sub_state & IRIS_INST_SUB_LOAD_RESOURCES) {
>>           reinit_completion(&inst->completion);
>>           iris_hfi_gen1_packet_session_cmd(inst, &pkt,
>> HFI_CMD_SESSION_STOP);
>>           ret = iris_hfi_queue_cmd_write(core, &pkt, pkt.shdr.hdr.size);
>>
> 
> ---
> bod

