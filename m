Return-Path: <linux-media+bounces-34976-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 305E6ADB5BE
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 17:44:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7B2E7A467B
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 15:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9981F1927;
	Mon, 16 Jun 2025 15:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DwoWy/fp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D206264A86;
	Mon, 16 Jun 2025 15:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750088685; cv=none; b=F01kYaRcMD7pHHY1JXuRUROK1eAkn88EG6TZOm50ZehkJThtPgWxaUz2J4+0CgX9dBVRhzXdiC4SP92U3bbxdKl63FbpMwIazmSFZDgu4uuA9ujRO0vzTHh/3vf88L3q2YfiG2UnlPtGouKEvfJGdH3PpC/05AjZhKoR1waykGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750088685; c=relaxed/simple;
	bh=9rz+mrHPoaI5Kg2Za3krpinYLKHUEQEoj0pZqDoZb88=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SQgmFChtOK7MMv2VlID0L1E28ezRN+LFch9WV6dn/uMvnvVc3q6dw+7Ut+RnI++15o0YuYLfN5i0WwnlyKCKHMOhvx3ZmHUlNAzKoAdVsi52tYc8kmm0FPjnK3aQcaX72PELBt1fmLAua6Fdl/jJsM0jqmUMv20pQ/n+UMp+gls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DwoWy/fp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8vb7r005454;
	Mon, 16 Jun 2025 15:44:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mlaRo8vtmKHPBjk6pe+ClWtYueoxt98XtE8Z3PK40wE=; b=DwoWy/fpjrAmapp/
	RyVMlibZQ2FL4v4kwXYl4e+AbbkbNQ20MxW/cpXQDIT5d5A/4i4gx0ZprVpxSbIw
	RAnYVPAotXfuOILMy+pHY/swT9qLCtbxyK2yIyRLJd93xnGXyi8A5O/8t+Aaa6UW
	FHXlxyfdp9lDasP2OCSXZpYDqWJlWmjOdxnxX623XbKD5SVS+uTUynO9V5C6wBsy
	aDnY/xeGtzor+Km16s01XXlQnBpOpRSep6SXsWZCSqBd0v0mAtH4hkgmGhlsIMNx
	TYsLIXHAHGrNPdv1PPjEhjCE8BFZFAAdo5v91EcwN0CIyiwfyFb1prOZULOSfiJ4
	xHJcUg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hcw3b0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 15:44:35 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55GFiYB8001860
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 15:44:34 GMT
Received: from [10.50.31.25] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Jun
 2025 08:44:31 -0700
Message-ID: <dbbf8b29-0ef4-8ebe-9fd3-c4b2f9c57b29@quicinc.com>
Date: Mon, 16 Jun 2025 21:14:27 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 2/6] media: venus: vdec: Clamp parm smaller than 1fps
 and bigger than 240.
Content-Language: en-US
To: Ricardo Ribalda <ribalda@chromium.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20250111-fix-cocci-v6-0-1aa7842006cc@chromium.org>
 <20250111-fix-cocci-v6-2-1aa7842006cc@chromium.org>
 <41cba134-4c8c-bb6d-c68b-a7de8da0689c@quicinc.com>
 <CANiDSCsVN0gXd=0GLALYvoBZ=cBY8daAJBmL=NJ5UteikZLpNg@mail.gmail.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <CANiDSCsVN0gXd=0GLALYvoBZ=cBY8daAJBmL=NJ5UteikZLpNg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEwMSBTYWx0ZWRfX/Ljl0Jj4YzJk
 640lHU62e6N5nqCWRwG2KElJB2UvKGojtBigI2lmoWAN77F5hoz52dQIZqfAuewUhSVWJ9fWgPq
 d3s0o6wgOeGXVQLJ3J2Fc8uyQtrT1teKePUNJraqxCuCG/ETxwmTrc4lpU503Nowa9W1ygDD1Sv
 dEwcQpOfp/If3mqE+TzsAu6gTQ8mtfH1Vdp8kEj9/EerMq4uSGQcal52YV0jiEDQBNAvCYMPHSU
 /37raFyuoVDyNzR0zJxSTQQSex/y6B0JcXx5utt3p/12089MbGo6HzNO/6guDVUR7g0l92vE52Z
 xjjm2xi/guMq5SBunZEaTHA/weCJ7W7fLAm3uuWj3aUM04x15NW1vjjYrRFuT7D/SJ2ZtuvNie2
 r3PzDLiRLNtFAWvBtG7U52W+OY2xfcL2BEWcwQTMDzVptjiFU4t1Jdt48ylUCnCu8oe3war9
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=68503be3 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=xOd6jRPJAAAA:8 a=COk6AnOGAAAA:8 a=cm27Pg_UAAAA:8 a=lCR6N9lNe_t9pZXtK3cA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: aLYtIzwUcY_nBpW5e5Cue-KggdGJQG1f
X-Proofpoint-GUID: aLYtIzwUcY_nBpW5e5Cue-KggdGJQG1f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160101


On 6/16/2025 5:14 PM, Ricardo Ribalda wrote:
> Hi Vikash
> 
> On Mon, 16 Jun 2025 at 13:04, Vikash Garodia <quic_vgarodia@quicinc.com> wrote:
>>
>>
>> On 1/11/2025 3:25 PM, Ricardo Ribalda wrote:
>>> The driver uses "whole" fps in all its calculations (e.g. in
>>> load_per_instance()). Those calculation expect an fps bigger than 1, and
>>> not big enough to overflow.
>>>
>>> Clamp the value if the user provides a parm that will result in an invalid
>>> fps.
>>>
>>> Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
>>> Closes: https://lore.kernel.org/linux-media/f11653a7-bc49-48cd-9cdb-1659147453e4@xs4all.nl/T/#m91cd962ac942834654f94c92206e2f85ff7d97f0
>>> Fixes: 7472c1c69138 ("[media] media: venus: vdec: add video decoder files")
>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>> ---
>>>  drivers/media/platform/qcom/venus/core.h | 2 ++
>>>  drivers/media/platform/qcom/venus/vdec.c | 5 ++---
>>>  2 files changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
>>> index 44f1c3bc4186..afae2b9fdaf7 100644
>>> --- a/drivers/media/platform/qcom/venus/core.h
>>> +++ b/drivers/media/platform/qcom/venus/core.h
>>> @@ -28,6 +28,8 @@
>>>  #define VIDC_RESETS_NUM_MAX          2
>>>  #define VIDC_MAX_HIER_CODING_LAYER 6
>>>
>>> +#define VENUS_MAX_FPS                        240
>>> +
>>>  extern int venus_fw_debug;
>>>
>>>  struct freq_tbl {
>>> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
>>> index 98c22b9f9372..c1d5f94e16b4 100644
>>> --- a/drivers/media/platform/qcom/venus/vdec.c
>>> +++ b/drivers/media/platform/qcom/venus/vdec.c
>>> @@ -481,11 +481,10 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>>>       us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
>>>       do_div(us_per_frame, timeperframe->denominator);
>>>
>>> -     if (!us_per_frame)
>>> -             return -EINVAL;
>>> -
>>> +     us_per_frame = max(USEC_PER_SEC, us_per_frame);
>> This logic changes the actual fps from client. Consider a regular encode usecase
>> from client setting an fps as 30. The "max(USEC_PER_SEC, us_per_frame)" would
>> override it to USEC_PER_SEC and then the subsequent logic would eventually make
>> fps to 1.
>> Please make it conditional to handle the 0 fps case, i guess that the objective
>> in above code, something like below
>> if (!us_per_frame)
>>   us_per_frame = USEC_PER_SEC;
> 
> You are correct. Thanks for catching it!
> 
> I think I prefer:
> us_per_frame = clamp(us_per_frame, 1, USEC_PER_SEC);
This is good.

Regards,
Vikash
> 
> Regards
> 
> 
> 
>>
>> Regards,
>> Vikash
>>>       fps = (u64)USEC_PER_SEC;
>>>       do_div(fps, us_per_frame);
>>> +     fps = min(VENUS_MAX_FPS, fps);
>>>
>>>       inst->fps = fps;
>>>       inst->timeperframe = *timeperframe;
>>>
> 
> 
> 
> --
> Ricardo Ribalda

