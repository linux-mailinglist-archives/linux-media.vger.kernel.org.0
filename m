Return-Path: <linux-media+bounces-31601-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7C9AA74CF
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 16:23:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A4F94C2256
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 14:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EFE12566C4;
	Fri,  2 May 2025 14:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ojt82Pha"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8B4143748;
	Fri,  2 May 2025 14:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746195793; cv=none; b=AS6aj5RKwt5x8vXoWSj2g1tJMzRe9I2w0H64WPvTyDsoq4ZS21bh+ConSM39ulvhRS8+25JMyiH1brBl/q0mr8Ya1ZpGrJf4eG2H6XZ2fUjhpY0Q2B2HnNqmVdMtAvbi/8yGFWbkiyLw2/jXloXxnpEUxLWEOC+FgxxFNCZrla8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746195793; c=relaxed/simple;
	bh=UsaxBUe8wB5EI42mu8sdR9nmZ6AcEsiAMNvnajcq0zY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ClwGchNhgs+KXN/Sn+QO/yK6dwUyh6tWRWSzuihvDPt9048wULSzwgAwhT5Q8FIuvsWfk+vwoo0MrX3VFSt21+SNKlFNpLniA6KTfgGz/R0QveTynHeOZU0WM6mZN6KUOQT+Gei6pcgEgfEJaTjUvBA7i6PJXPvQe89PM6JAyXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ojt82Pha; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542CvdOH002845;
	Fri, 2 May 2025 14:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xTyPc5G6qVIUyKQaCQHypXRE2zULlXgjITrHeR77xKA=; b=Ojt82PhaGse7BL1R
	GqrOBZt3G2T0kcyBvzzdmp1otIU9Gx6/ZCDWj5fy0q/8Sr7jnCbktvoYMGZXGJSo
	yRq6neE0H8dgbNNhing/Ipi46TuI1U9yGKoKK+ZAPwzVqFSpFswE8KBnorQzvMAg
	u/bjrwU8NPSeqEDamk+8rOHtNM+S6ZH3av4pgjNQhMM/3vtuAyJ6BYQrsUPU5emA
	KHUj1euL4ck9W0H+SEzOrIPZLO/pGoMakwGXFgoQmRxKTUtVsiTVGoPv3/2DR8n1
	XF1vKSNF/k0h9VGNzfOpiq7zIL6dL6eaX4B8nO3l1zKbGB+gg1EyWVL4xtdn7qNV
	DajxWw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u78na9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 14:23:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 542EN5Hu007249
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 May 2025 14:23:05 GMT
Received: from [10.50.25.148] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 2 May 2025
 07:22:59 -0700
Message-ID: <a21e2c36-90a9-0259-2619-25fc47b34ab5@quicinc.com>
Date: Fri, 2 May 2025 19:52:56 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 13/23] media: iris: Send V4L2_BUF_FLAG_ERROR for
 buffers with 0 filled length
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rob Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>,
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
 <20250502-qcom-iris-hevc-vp9-v3-13-552158a10a7d@quicinc.com>
 <f9767d12-a9b4-41f3-bd96-f2b13cea5b86@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <f9767d12-a9b4-41f3-bd96-f2b13cea5b86@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDExNCBTYWx0ZWRfX1tl9/brMic8Q FrXR6eIsttiSgs4TR0il0+dlLeIrMV35zJkeQJ3bGl0pu/c7EgTneRiyrREHe0lj1obKiyQUMZC 2oPEVBYycIzuSTAauWGtWIrSB7fSPp04spVXZQpfLHDdfsRz6sJVx/il86944FpWBGX9Utv/xqS
 4m9pjfaiaf3FbUL0Pi0UCWSYPYFNbinPqoFtU0zmQ/+2mYO6cG0L2Q0Qm4RybNqjZ33hV3Xetsa avpr3PLD5lG1GG1h9e+ve4KDeomknAF4pgVj4TEguA1xfEJAuZ9fPjHSFdVJsV1TPKRVTB2Zs/T 2WlWnspi6wCyBYtBgDEH1SadNjNohlwk0qSFaX644mNXO2j4Fmb2Z58H6lL1c+AMrSys+Zf50Un
 n3KQ02zv1PS3adOioV5rfl+KrgZrxC3h9JTM/QZcZHbGJV2SaxrVsSOqTdIFxLaBfwPkMwuA
X-Proofpoint-GUID: 7CU9QU99cQF3xhLY-L_yW0H6wUkoKMOr
X-Authority-Analysis: v=2.4 cv=W404VQWk c=1 sm=1 tr=0 ts=6814d54a cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=Q1Ca2Uoc8Cyl_9njguYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 7CU9QU99cQF3xhLY-L_yW0H6wUkoKMOr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 impostorscore=0 mlxlogscore=861 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020114



On 5/2/2025 6:19 PM, Bryan O'Donoghue wrote:
> On 01/05/2025 20:13, Dikshita Agarwal wrote:
>> Firmware sends buffers with 0 filled length which needs to be dropped,
>> to achieve the same, add V4L2_BUF_FLAG_ERROR to such buffers.
>> Also make sure:
>> - These 0 length buffers are not returned as result of flush.
>> - Its not a buffer with LAST flag enabled which will also have 0 filled
>>    length.
>>
>> Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> index 4488540d1d41..3bb326843a7b 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> @@ -378,6 +378,12 @@ static int iris_hfi_gen2_handle_output_buffer(struct
>> iris_inst *inst,
>>         buf->flags = iris_hfi_gen2_get_driver_buffer_flags(inst,
>> hfi_buffer->flags);
>>   +    if (!buf->data_size && inst->state == IRIS_INST_STREAMING &&
>> +        !(hfi_buffer->flags & HFI_BUF_FW_FLAG_LAST) &&
>> +        !(inst->sub_state & IRIS_INST_SUB_DRC)) {
>> +        buf->flags |= V4L2_BUF_FLAG_ERROR;
>> +    }
>> +
>>       return 0;
>>   }
>>  
> 
> This is a pretty complex conjunctive clause.
> 
> Is it possible for say 1/3 of these logical criteria to be false ?
> 
> i.e. if you get to:
> 
> 1. buf->data_size && inst->state == IRIS_INST_STREAMING
This makes sure that the 0 length buffers are not returned as response to
flush.
> 2. !(hfi_buffer->flags & HFI_BUF_FW_FLAG_LAST)
This makes sure that we don't mark the buffer with last flag as error since
this will be also be a zero length buffer but a valid one.
> 
> is it possible to get to
> 
> 3. !(inst->sub_state & IRIS_INST_SUB_DRC)
I can remove this condition as first one captures the essence of this one.

Thanks,
Dikshita
> 
> ?
> 
> This also feels like a bugfix ?
> 
> ---
> bod

