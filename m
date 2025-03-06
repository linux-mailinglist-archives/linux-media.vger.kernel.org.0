Return-Path: <linux-media+bounces-27703-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1912BA54AAA
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 13:26:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 850477A7E13
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 12:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E242020C005;
	Thu,  6 Mar 2025 12:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Fj1z+LRY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B3E20B1EF;
	Thu,  6 Mar 2025 12:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741263989; cv=none; b=QEvQE4hi+mEsKVw61HHBFESS1mnXKzKpVV5XBST/CcKUCHeOcOlL5HZrHdWuorxuOdj5sZaUpOFap+XBM3s92IEcFSIgfPZAa6aVOcR2dCEbD4Xpag81TZanRLJmsK5nFee5JZE5us/SYXTCgWZaUTTcsGJUs0R0vVWoemC/n18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741263989; c=relaxed/simple;
	bh=CHuk/ovAJ999aY5RbZIIhjbrC7uJTWSrGoI0q/DkZRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Zdt7j67sf1nqWpQ1ZqEGq3h32P/PnwDDJIz7nPXvqoA83PIIktF+ktmlnl7WTqCNIQmcTVe3SUunN2s8IfJQQiU2kiIqBY4ImsFOj7F64nLhdMD6n+jia+msLCHrmYI/NwXc7hNFyY/sVegou6R55kRGwtyoIYUBpJ60PXIxqE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Fj1z+LRY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5269VQWM009868;
	Thu, 6 Mar 2025 12:26:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3nnBvDL230kr1pJsTyGV8JlQ4a3iW1xhIU5tFQGUF+4=; b=Fj1z+LRYw5/Q8DtC
	j7490h507Z3LwU0mUDbc1pG6P2p/AdZso4goNdoW4pbCG9y9aHdsLNKUi/CH7D0W
	wZI4Ip1XDpsKCJGunyYR/Ra/IYyfhhS+AtCold5GQ659DTf4gA5v8nWJc5qyYZP2
	iQop8VTpRY6vRaZKyijfKXlUqfa48KsGlxe5/w+8jbN7v10LRhvqPb/XmnryE8m+
	s48/BB570vyRRQ5hTeAyhekHY7ZquH6DqQSjrF3XT77L+e4Zx+slSM9ZCIrXVYBS
	A5rEJEPtUCWUSVa1HDjapjt0Tm2eNl9Fi9VcgNCfSU7RCmR8i4fBYNuYi0x87dCR
	v1eFeA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6ts0nc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 12:26:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 526CQMk0029425
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 12:26:22 GMT
Received: from [10.50.63.230] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Mar 2025
 04:26:19 -0800
Message-ID: <95c9ab98-cebd-2ec2-bdb2-2f63bedb3f86@quicinc.com>
Date: Thu, 6 Mar 2025 17:56:16 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 04/12] media: iris: Add internal buffer calculation
 for HEVC and VP9 decoders
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <quic_vgarodia@quicinc.com>,
        <quic_abhinavk@quicinc.com>, <mchehab@kernel.org>
CC: <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250305104335.3629945-1-quic_dikshita@quicinc.com>
 <20250305104335.3629945-5-quic_dikshita@quicinc.com>
 <ac44e16c-36af-471a-b47b-bb26ccd9f018@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <ac44e16c-36af-471a-b47b-bb26ccd9f018@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=HZbuTjE8 c=1 sm=1 tr=0 ts=67c9946f cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=1rF406xIJLHP53cuGdgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: j-Lw1dhPRhtHIhKdHhMM4m7aRlQwN1m7
X-Proofpoint-ORIG-GUID: j-Lw1dhPRhtHIhKdHhMM4m7aRlQwN1m7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_05,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060094



On 3/6/2025 6:35 AM, Bryan O'Donoghue wrote:
> On 05/03/2025 10:43, Dikshita Agarwal wrote:
>> Add internal buffer count and size calculations for HEVC and VP9
>> decoders.
>>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>   .../media/platform/qcom/iris/iris_buffer.c    |   3 +
>>   .../platform/qcom/iris/iris_vpu_buffer.c      | 397 +++++++++++++++++-
>>   .../platform/qcom/iris/iris_vpu_buffer.h      |  46 +-
>>   3 files changed, 432 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c
>> b/drivers/media/platform/qcom/iris/iris_buffer.c
>> index e5c5a564fcb8..8c9d5b7fe75c 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
>> @@ -205,6 +205,9 @@ static u32 iris_bitstream_buffer_size(struct
>> iris_inst *inst)
>>       if (num_mbs > NUM_MBS_4K) {
>>           div_factor = 4;
>>           base_res_mbs = caps->max_mbpf;
>> +    } else {
>> +        if (inst->codec == V4L2_PIX_FMT_VP9)
>> +            div_factor = 1;
>>       }
>>         /*
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> index dce25e410d80..13ee93356bcb 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> @@ -31,6 +31,42 @@ static u32 hfi_buffer_bin_h264d(u32 frame_width, u32
>> frame_height, u32 num_vpp_p
>>       return size_h264d_hw_bin_buffer(n_aligned_w, n_aligned_h,
>> num_vpp_pipes);
>>   }
>>   +static u32 size_h265d_hw_bin_buffer(u32 frame_width, u32 frame_height,
>> u32 num_vpp_pipes)
>> +{
>> +    u32 product = frame_width * frame_height;
>> +    u32 size_yuv, size_bin_hdr, size_bin_res;
>> +
>> +    size_yuv = (product <= BIN_BUFFER_THRESHOLD) ?
>> +        ((BIN_BUFFER_THRESHOLD * 3) >> 1) : ((product * 3) >> 1);
> 
> When I read this code I have no way of knowing if it makes sense.
> 
> #define BIN_BUFFER_THRESHOLD        (1280 * 736)
> 
> ((BIN_BUFFER_THRESHOLD * 3) >> 1)
> 
> How/why is that correct ?
> 
Bin buffers are intermediate buffers which are used by different sub
hardware blocks within video IP. The calculation of these buffers are
hardware mandated. While we can't explain/justify every factor, these are
based on hardware constraints and validated with firmware requirements,
Software is just coding it up the way hardware specification defines it.
>> +    size_bin_hdr = size_yuv * H265_CABAC_HDR_RATIO_HD_TOT;
>> +    size_bin_res = size_yuv * H265_CABAC_RES_RATIO_HD_TOT;
>> +    size_bin_hdr = ALIGN(size_bin_hdr / num_vpp_pipes, DMA_ALIGNMENT) *
>> num_vpp_pipes;
>> +    size_bin_res = ALIGN(size_bin_res / num_vpp_pipes, DMA_ALIGNMENT) *
>> num_vpp_pipes;
>> +
>> +    return size_bin_hdr + size_bin_res;
>> +}
>> +
>> +static u32 hfi_buffer_bin_vp9d(u32 frame_width, u32 frame_height, u32
>> num_vpp_pipes)
>> +{
>> +    u32 _size_yuv = ALIGN(frame_width, 16) * ALIGN(frame_height, 16) * 3
>> / 2;
>> +    u32 _size = ALIGN(((max_t(u32, _size_yuv, ((BIN_BUFFER_THRESHOLD *
>> 3) >> 1)) *
>> +            VPX_DECODER_FRAME_BIN_HDR_BUDGET /
>> VPX_DECODER_FRAME_BIN_DENOMINATOR *
>> +            VPX_DECODER_FRAME_CONCURENCY_LVL) / num_vpp_pipes),
>> DMA_ALIGNMENT) +
>> +            ALIGN(((max_t(u32, _size_yuv, ((BIN_BUFFER_THRESHOLD * 3) >>
>> 1)) *
>> +            VPX_DECODER_FRAME_BIN_RES_BUDGET /
>> VPX_DECODER_FRAME_BIN_DENOMINATOR *
>> +            VPX_DECODER_FRAME_CONCURENCY_LVL) / num_vpp_pipes),
>> DMA_ALIGNMENT);
> 
> The size_yuv I guess just about makes sense but the _size component here is
> pretty hard to say whether or not this adds up.
> 
> Could you please add some comments to describe the calculations in these
> complex size/alignment clauses.
I believe the MACROS here defines the parameters used in calculation,
beyond this, its again how internal buffers (used by hardware) are
calculated by hardware and defined in the hardware specification.

Thanks,
Dikshita
> 
> ---
> bod

