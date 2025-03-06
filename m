Return-Path: <linux-media+bounces-27699-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 585EEA54A22
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 12:56:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 804E5188B789
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 11:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2CD20AF64;
	Thu,  6 Mar 2025 11:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gE5J01Zv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F171EE03B;
	Thu,  6 Mar 2025 11:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741262165; cv=none; b=PfHW+AXnGY2QCXHycTBKK/SwiimU9hASZ4+r0FOc6e3ldqBj0Qlo5uryiDcLwbnF8CuZ1lNBtVXDGpMzDY62YzSdg2b1d2ba4ZyMjDmJxCaQFwx1+E5ejy9MbqJpNB5uxiQu03UjmNXhr2YrZJHWKy8UYC0DScqMHtkbktDkyT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741262165; c=relaxed/simple;
	bh=Zs+OtU/6Yt+NhKmsapbVetDQRQuKHldrJPLNh1Dac0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qmeDQ8CXOewuWkKUM1UlPQ6yXz5YVmYKrot6/XORA2RAKw9KDFq84z3eqieJxsJKlYkneC2nw1SGGPbSzpfcR2ijxQKM06Fy5ydH0hJZwl/82ufsBbvbTZCGKPUdzM3rYt9G4qaoMh8ww5df/7cDxUofR8cv9PgMeZjGQ6dEhF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gE5J01Zv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5267uSqm028674;
	Thu, 6 Mar 2025 11:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GV50H3tjN/5akoMmiSdH/PMbSrrrQJbUGwBdQR/C4cc=; b=gE5J01ZvdVnZmQRU
	xY9nDg0vfqrBtE/l12iIiOhC2RtFefvEnTpIumy2ppDjnl/IrOY3E3111gGO/wgF
	k5HlAubtQSHZo3QJPcQhTZuVY8b3H58tqutuGufND1yAYpSEE8qmmm3Ux0JQs6Na
	ZFueixtZcMW/HeJ2FrCtIBb0g0NpLxHLI507vMIwXspuBXY6VJc2OsF103h+770i
	IoLLiN9Uykov3j9B9CpYgck5xxV8L6OCxTGzNjGBPZM5ZZ9ufkI7nUEf3dEhvErI
	8J+Lgr3MUfu/y1RF09S8M1HmbsQH3Xxk9RLpV2sEUPUSs/L6Uj05IucPacqX07Ay
	6p7hxQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4577rpgqwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 11:55:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 526BtvCC013613
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 11:55:57 GMT
Received: from [10.50.63.230] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Mar 2025
 03:55:54 -0800
Message-ID: <8967ae12-8b0e-7442-7a16-465f71e6f706@quicinc.com>
Date: Thu, 6 Mar 2025 17:25:51 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 01/12] media: iris: Add HEVC and VP9 formats for
 decoder
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <quic_vgarodia@quicinc.com>,
        <quic_abhinavk@quicinc.com>, <mchehab@kernel.org>
CC: <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250305104335.3629945-1-quic_dikshita@quicinc.com>
 <20250305104335.3629945-2-quic_dikshita@quicinc.com>
 <505c9ca6-7c69-4642-b03e-7df23af20484@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <505c9ca6-7c69-4642-b03e-7df23af20484@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EYQyQOmC c=1 sm=1 tr=0 ts=67c98d4e cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=LqOWpRZtMr9JUrO45AcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: S--RBXuxto3VC2PHP7-hgxh7q3RoTCj7
X-Proofpoint-GUID: S--RBXuxto3VC2PHP7-hgxh7q3RoTCj7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_05,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060089



On 3/6/2025 5:47 AM, Bryan O'Donoghue wrote:
> On 05/03/2025 10:43, Dikshita Agarwal wrote:
>> Extend the decoder driver's supported formats to include HEVC (H.265)
>> and VP9. This change updates the format enumeration (VIDIOC_ENUM_FMT)
>> and allows setting these formats via VIDIOC_S_FMT.
>>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>   .../qcom/iris/iris_hfi_gen1_command.c         | 18 ++++-
>>   .../qcom/iris/iris_hfi_gen1_defines.h         |  2 +
>>   .../qcom/iris/iris_hfi_gen2_command.c         | 16 ++++-
>>   .../qcom/iris/iris_hfi_gen2_defines.h         |  3 +
>>   .../media/platform/qcom/iris/iris_instance.h  |  2 +
>>   drivers/media/platform/qcom/iris/iris_vdec.c  | 69 +++++++++++++++++--
>>   drivers/media/platform/qcom/iris/iris_vdec.h  | 11 +++
>>   drivers/media/platform/qcom/iris/iris_vidc.c  |  3 -
>>   8 files changed, 113 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> index 64f887d9a17d..1e774b058ab9 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> @@ -26,6 +26,20 @@ static u32 iris_hfi_gen1_buf_type_from_driver(enum
>> iris_buffer_type buffer_type)
>>       }
>>   }
>>   +static u32 iris_hfi_gen1_v4l2_to_codec_type(u32 pixfmt)
>> +{
>> +    switch (pixfmt) {
>> +    case V4L2_PIX_FMT_H264:
>> +        return HFI_VIDEO_CODEC_H264;
>> +    case V4L2_PIX_FMT_HEVC:
>> +        return HFI_VIDEO_CODEC_HEVC;
>> +    case V4L2_PIX_FMT_VP9:
>> +        return HFI_VIDEO_CODEC_VP9;
>> +    default:
>> +        return 0;
>> +    }
> 
> Unknown is 0 here - perhaps it should be a define.
> 
>> +}
>> +
>>   static int iris_hfi_gen1_sys_init(struct iris_core *core)
>>   {
>>       struct hfi_sys_init_pkt sys_init_pkt;
>> @@ -88,16 +102,18 @@ static int iris_hfi_gen1_sys_pc_prep(struct
>> iris_core *core)
>>   static int iris_hfi_gen1_session_open(struct iris_inst *inst)
>>   {
>>       struct hfi_session_open_pkt packet;
>> +    u32 codec;
>>       int ret;
>>         if (inst->state != IRIS_INST_DEINIT)
>>           return -EALREADY;
>>   +    codec = iris_hfi_gen1_v4l2_to_codec_type(inst->codec);
> 
> 
> You can return an error from this function - suggest better error handling is
> 
> if (!codec)
>     return -EINVAL; -ENO
> 
> or some other error value that makes more sense to you.
> 
This will never happen, as code will not reach to this point for
unsupported codec. I can just simply remove the default case.
>> +static u32 iris_hfi_gen2_v4l2_to_codec_type(struct iris_inst *inst)
>> +{
>> +    switch (inst->codec) {
>> +    case V4L2_PIX_FMT_H264:
>> +        return HFI_CODEC_DECODE_AVC;
>> +    case V4L2_PIX_FMT_HEVC:
>> +        return HFI_CODEC_DECODE_HEVC;
>> +    case V4L2_PIX_FMT_VP9:
>> +        return HFI_CODEC_DECODE_VP9;
>> +    default:
>> +        return 0;
> 
>>   static int iris_hfi_gen2_session_set_codec(struct iris_inst *inst)
>>   {
>>       struct iris_inst_hfi_gen2 *inst_hfi_gen2 =
>> to_iris_inst_hfi_gen2(inst);
>> -    u32 codec = HFI_CODEC_DECODE_AVC;
>> +    u32 codec = iris_hfi_gen2_v4l2_to_codec_type(inst);
> 
> Same comment for gen2
> 
>>         iris_hfi_gen2_packet_session_property(inst,
>>                             HFI_PROP_CODEC,
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> index 806f8bb7f505..2fcf7914b70f 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> @@ -104,6 +104,9 @@ enum hfi_color_format {
>>   enum hfi_codec_type {
>>       HFI_CODEC_DECODE_AVC            = 1,
>>       HFI_CODEC_ENCODE_AVC            = 2,
>> +    HFI_CODEC_DECODE_HEVC            = 3,
>> +    HFI_CODEC_ENCODE_HEVC            = 4,
>> +    HFI_CODEC_DECODE_VP9            = 5,
>>   };
>>     enum hfi_picture_type {
>> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h
>> b/drivers/media/platform/qcom/iris/iris_instance.h
>> index caa3c6507006..d8f076936c2b 100644
>> --- a/drivers/media/platform/qcom/iris/iris_instance.h
>> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
>> @@ -42,6 +42,7 @@
>>    * @sequence_out: a sequence counter for output queue
>>    * @tss: timestamp metadata
>>    * @metadata_idx: index for metadata buffer
>> + * @codec: codec type
>>    */
>>     struct iris_inst {
>> @@ -72,6 +73,7 @@ struct iris_inst {
>>       u32                sequence_out;
>>       struct iris_ts_metadata        tss[VIDEO_MAX_FRAME];
>>       u32                metadata_idx;
>> +    u32                codec;
>>   };
>>     #endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c
>> b/drivers/media/platform/qcom/iris/iris_vdec.c
>> index 4143acedfc57..cdcfe71f5b96 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>> @@ -32,6 +32,7 @@ int iris_vdec_inst_init(struct iris_inst *inst)
>>       f->fmt.pix_mp.width = DEFAULT_WIDTH;
>>       f->fmt.pix_mp.height = DEFAULT_HEIGHT;
>>       f->fmt.pix_mp.pixelformat = V4L2_PIX_FMT_H264;
>> +    inst->codec = f->fmt.pix_mp.pixelformat;
>>       f->fmt.pix_mp.num_planes = 1;
>>       f->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
>>       f->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst,
>> BUF_INPUT);
>> @@ -67,14 +68,67 @@ void iris_vdec_inst_deinit(struct iris_inst *inst)
>>       kfree(inst->fmt_src);
>>   }
>>   +static const struct iris_fmt iris_vdec_formats[] = {
>> +    [IRIS_FMT_H264] = {
>> +        .pixfmt = V4L2_PIX_FMT_H264,
>> +        .type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
>> +    },
>> +    [IRIS_FMT_HEVC] = {
>> +        .pixfmt = V4L2_PIX_FMT_HEVC,
>> +        .type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
>> +    },
>> +    [IRIS_FMT_VP9] = {
>> +        .pixfmt = V4L2_PIX_FMT_VP9,
>> +        .type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
>> +    },
>> +};
>> +
>> +static const struct iris_fmt *
>> +find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>> +{
>> +    const struct iris_fmt *fmt = iris_vdec_formats;
>> +    unsigned int size = ARRAY_SIZE(iris_vdec_formats);
>> +    unsigned int i;
> 
> Slightly neater as a reverse christmas tree.
> 
Noted.
>> +
>> +    for (i = 0; i < size; i++) {
>> +        if (fmt[i].pixfmt == pixfmt)
>> +            break;
>> +    }
>> +
>> +    if (i == size || fmt[i].type != type)
>> +        return NULL;
>> +
>> +    return &fmt[i];
>> +}
>> +
>> +static const struct iris_fmt *
>> +find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>> +{
>> +    const struct iris_fmt *fmt = iris_vdec_formats;
>> +    unsigned int size = ARRAY_SIZE(iris_vdec_formats);
>> +
>> +    if (index >= size || fmt[index].type != type)
>> +        return NULL;
>> +
>> +    return &fmt[index];
>> +}
>> +
>>   int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
>>   {
>> +    const struct iris_fmt *fmt;
>> +
>>       switch (f->type) {
>>       case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>> -        f->pixelformat = V4L2_PIX_FMT_H264;
>> +        fmt = find_format_by_index(inst, f->index, f->type);
>> +        if (!fmt)
>> +            return -EINVAL;
>> +
>> +        f->pixelformat = fmt->pixfmt;
>>           f->flags = V4L2_FMT_FLAG_COMPRESSED |
>> V4L2_FMT_FLAG_DYN_RESOLUTION;
>>           break;
>>       case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> +        if (f->index)
>> +            return -EINVAL;
>>           f->pixelformat = V4L2_PIX_FMT_NV12;
>>           break;
>>       default:
>> @@ -88,13 +142,15 @@ int iris_vdec_try_fmt(struct iris_inst *inst, struct
>> v4l2_format *f)
>>   {
>>       struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
>>       struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
>> +    const struct iris_fmt *fmt;
>>       struct v4l2_format *f_inst;
>>       struct vb2_queue *src_q;
>>         memset(pixmp->reserved, 0, sizeof(pixmp->reserved));
>> +    fmt = find_format(inst, pixmp->pixelformat, f->type);
>>       switch (f->type) {
>>       case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>> -        if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_H264) {
>> +        if (!fmt) {
>>               f_inst = inst->fmt_src;
>>               f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
>>               f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
>> @@ -102,7 +158,7 @@ int iris_vdec_try_fmt(struct iris_inst *inst, struct
>> v4l2_format *f)
>>           }
>>           break;
>>       case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> -        if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12) {
>> +        if (!fmt) {
>>               f_inst = inst->fmt_dst;
>>               f->fmt.pix_mp.pixelformat = f_inst->fmt.pix_mp.pixelformat;
>>               f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
>> @@ -145,13 +201,14 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct
>> v4l2_format *f)
>>         switch (f->type) {
>>       case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>> -        if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_H264)
>> +        if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
>>               return -EINVAL;
>>             fmt = inst->fmt_src;
>>           fmt->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>> -
>> -        codec_align = DEFAULT_CODEC_ALIGNMENT;
>> +        fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
>> +        inst->codec = fmt->fmt.pix_mp.pixelformat;
>> +        codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
> 
> For preference I'd choose a default assignment and then an if for whatever
> you choose as non-default.
> 
> codec_align = 16;
> if (inst->codec == V4L2_PIX_FMT_HEVC)
>     codec_align = 32;
> 
I don't see any issue with using ternary operator here, since it's just a
simple value selection.
>>           fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
>>           fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, codec_align);
>>           fmt->fmt.pix_mp.num_planes = 1;
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h
>> b/drivers/media/platform/qcom/iris/iris_vdec.h
>> index b24932dc511a..cd7aab66dc7c 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.h
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.h
>> @@ -8,6 +8,17 @@
>>     struct iris_inst;
>>   +enum iris_fmt_type {
>> +    IRIS_FMT_H264,
> 
> I persoanlly like to init enums = 0,
> 
we are initializing enum only if it starts with non zero value in the
driver code currently so would like to follow the same practise, unless
there is strong concern here.
> 
>> +    IRIS_FMT_HEVC,
>> +    IRIS_FMT_VP9,
>> +};
>> +
>> +struct iris_fmt {
>> +    u32 pixfmt;
>> +    u32 type;
>> +};
>> +
>>   int iris_vdec_inst_init(struct iris_inst *inst);
>>   void iris_vdec_inst_deinit(struct iris_inst *inst);
>>   int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f);
>> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c
>> b/drivers/media/platform/qcom/iris/iris_vidc.c
>> index ca0f4e310f77..6a6afa15b647 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
>> @@ -249,9 +249,6 @@ static int iris_enum_fmt(struct file *filp, void *fh,
>> struct v4l2_fmtdesc *f)
>>   {
>>       struct iris_inst *inst = iris_get_inst(filp, NULL);
>>   -    if (f->index)
>> -        return -EINVAL;
>> -
>>       return iris_vdec_enum_fmt(inst, f);
>>   }
>>   
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Thanks,
Dikshita

