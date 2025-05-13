Return-Path: <linux-media+bounces-32386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 654E6AB5574
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 15:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D9C81B461B1
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 13:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 196CB28DF54;
	Tue, 13 May 2025 13:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iPeCrlGp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0318746E;
	Tue, 13 May 2025 13:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747141227; cv=none; b=MnP4xmIZTFjrni2lr7JVvAxkff2USJFQp/8Z5IzLhS6T09qGRZ55e048dji4kzizX5V4F+1L45+cirN0WGwR5bwJmKHbjU9zrigyhfdWFVTgsJDnOheVTzf44iUIGWT1Ux6U9FIGydtZVMRfJl/CGdqOXXNFd/bq3hmA6Fe4pBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747141227; c=relaxed/simple;
	bh=/yTHrsENHvwEbIAy1XdmqE7iQbmbIRh9I7LHqownfvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qqk3aPVEBH4tyhStf/QKZKESDP5tlYWRP88gBTh7kW7QsCnQ5jD9NqgvcNH7YluiUHfRu3hOi3tygMbNvhBDxWLuRHQNhaOvoqpFp/8RwE8s2vAG+xJWN4JVoxfnkJZJRstYQSQyYHt2a6clBScuhfcUCbFBuSOiDBH2+tKIRJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iPeCrlGp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DBuoQT017557;
	Tue, 13 May 2025 13:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dvURSM5w5D4KDrRXa6ZLLjS7kHr9xg498dTMYG1sdxQ=; b=iPeCrlGpB6czODXG
	IqcMtBHIgZWjIhhOLa1bDBz9s5ZNrgVYK8y/Vpn9P78DPu1NipdYmUtaqb7fwf0O
	TztS4/Aw1RcFIeY6WMMVtivhAiJ2LQC+BECyLz5/IQ19IyW1TCAOonZU1KZYi6KK
	8F2C10jQX0Mcq3TLZ2sIVHiDQdn6tlVhkudqMnEWlT1XrVtPBimsT2Z91cYOpTRu
	tlSvqM9bKOYi2FWrTBF4zlPSc/m98j2Xxl3L0SpeGkWEr69lPEg+CD652YC9NyWV
	L36rarJRq2U7Wp3/X2ys8FFeyEHipIlmmGbfW+2BFyL/xqO+NKRdFc1zflAcpCSr
	9v7yow==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46j03bfsq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 13:00:07 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54DD06ud029809
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 13:00:06 GMT
Received: from [10.204.100.69] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 13 May
 2025 06:00:04 -0700
Message-ID: <eed2f879-bdf3-b052-9259-4a4e28329fc6@quicinc.com>
Date: Tue, 13 May 2025 18:30:00 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/2] media: venus: fix OOB access issue while reading
 sequence changed events
Content-Language: en-US
To: Vedang Nagar <quic_vnagar@quicinc.com>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250215-venus-security-fixes-v2-0-cfc7e4b87168@quicinc.com>
 <20250215-venus-security-fixes-v2-2-cfc7e4b87168@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250215-venus-security-fixes-v2-2-cfc7e4b87168@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UdT_NJfYnTX6mnVHk1kQxbpKd1Ynmkr7
X-Authority-Analysis: v=2.4 cv=DOuP4zNb c=1 sm=1 tr=0 ts=68234257 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=cisr_2lu4Cp0-B_quIMA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: UdT_NJfYnTX6mnVHk1kQxbpKd1Ynmkr7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDEyMyBTYWx0ZWRfX7oTKL9rWMsGu
 IpaaMwbrZo3kBFsT+fH1ohDu19sv8RkvsoC1t1OiCW4zMjwEJ1PNTlf65NEJT0hUWH0qjVR2/9u
 bedv3OMIJDozhaHPsI6EePBmXzLZoHm/PbIXlEXr29EpAYDSlVZi634YEOBLB9GBhSUKEfXGQkH
 ZVdOAk3UQUr8OzNDZVezEVbJuu17AispvWAl0LmXfDEPrjxm30ozzauH7zFgcJ5qEoKtxQiKhzz
 1T6rBnUYBIYi1f7oU0S2iaFbJn1wpUXb3vNQgfj9C2tpVvtELeUcMYUz9HXZY0R2qDkYD8teqtW
 Pdf9WOiDg0HTc90p+ZBrWVJn1IKNhde0a00JykqiOimWHLqz4uxwcNsmBl05/cMhCBIWh76/ptX
 hoN6c8xjpUz9vVr0QVZdqnjz4eYNswoN4a2jJ9RGmvh+XmiuFuBJwS37pUffroIreg92HoTI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505130123



On 2/15/2025 10:49 PM, Vedang Nagar wrote:
> num_properties_changed is being read from the message queue but is
> not validated. Value can be corrupted from the firmware leading to
> OOB read access issues. Add fix to read the size of the packets as
> well and crosscheck before reading from the packet.
> 
> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
> ---
>  drivers/media/platform/qcom/venus/hfi_msgs.c | 72 ++++++++++++++++++++++++----
>  1 file changed, 62 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.c b/drivers/media/platform/qcom/venus/hfi_msgs.c
> index 0a041b4db9efc549621de07dd13b4a3a37a70d11..2ad60a3fbfe0286de09a44664fc3b30259aa0368 100644
> --- a/drivers/media/platform/qcom/venus/hfi_msgs.c
> +++ b/drivers/media/platform/qcom/venus/hfi_msgs.c
> @@ -19,6 +19,16 @@
>  #define VER_STR_SZ		128
>  #define SMEM_IMG_OFFSET_VENUS	(14 * 128)
>  
> +static inline int increment_data_ptr(u8 *data_ptr, u32 *rem_bytes)
> +{
> +	if (*rem_bytes < sizeof(u32))
> +		return -EINVAL;
> +	data_ptr += sizeof(u32);
> +	*rem_bytes -= sizeof(u32);
> +
> +	return 0;
> +}
> +
>  static void event_seq_changed(struct venus_core *core, struct venus_inst *inst,
>  			      struct hfi_msg_event_notify_pkt *pkt)
>  {
> @@ -33,8 +43,8 @@ static void event_seq_changed(struct venus_core *core, struct venus_inst *inst,
>  	struct hfi_buffer_requirements *bufreq;
>  	struct hfi_extradata_input_crop *crop;
>  	struct hfi_dpb_counts *dpb_count;
> +	u32 ptype, rem_bytes;
>  	u8 *data_ptr;
> -	u32 ptype;
>  
>  	inst->error = HFI_ERR_NONE;
>  
> @@ -56,66 +66,108 @@ static void event_seq_changed(struct venus_core *core, struct venus_inst *inst,
>  	}
>  
>  	data_ptr = (u8 *)&pkt->ext_event_data[0];
> +	rem_bytes = pkt->shdr.hdr.size - sizeof(*pkt);
> +	if (rem_bytes - 4 < 0) {
> +		inst->error = HFI_ERR_SESSION_INSUFFICIENT_RESOURCES;
> +		goto done;
> +	}
> +
>  	do {
>  		ptype = *((u32 *)data_ptr);
>  		switch (ptype) {
>  		case HFI_PROPERTY_PARAM_FRAME_SIZE:
> -			data_ptr += sizeof(u32);
> +			if (increment_data_ptr(data_ptr, &rem_bytes))
> +				break;
Instead of doing this for every switch, better to do it once before the switch.
> +			if (rem_bytes < sizeof(struct hfi_framesize))
> +				break;
>  			frame_sz = (struct hfi_framesize *)data_ptr;
>  			event.width = frame_sz->width;
>  			event.height = frame_sz->height;
>  			data_ptr += sizeof(*frame_sz);
> +			rem_bytes -= sizeof(struct hfi_framesize);
for this one, lets store the size in a local variable, update for every switch,
and do the increment/decrement logic once at the end with that size. It avoids
doing the same logic for every switch.

Regards,
Vikash
>  			break;
>  		case HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT:
> -			data_ptr += sizeof(u32);
> +			if (increment_data_ptr(data_ptr, &rem_bytes))
> +				break;
> +			if (rem_bytes < sizeof(struct hfi_profile_level))
> +				break;
>  			profile_level = (struct hfi_profile_level *)data_ptr;
>  			event.profile = profile_level->profile;
>  			event.level = profile_level->level;
>  			data_ptr += sizeof(*profile_level);
> +			rem_bytes -= sizeof(struct hfi_profile_level);
>  			break;
>  		case HFI_PROPERTY_PARAM_VDEC_PIXEL_BITDEPTH:
> -			data_ptr += sizeof(u32);
> +			if (increment_data_ptr(data_ptr, &rem_bytes))
> +				break;
> +			if (rem_bytes < sizeof(struct hfi_bit_depth))
> +				break;
>  			pixel_depth = (struct hfi_bit_depth *)data_ptr;
>  			event.bit_depth = pixel_depth->bit_depth;
>  			data_ptr += sizeof(*pixel_depth);
> +			rem_bytes -= sizeof(struct hfi_bit_depth);
>  			break;
>  		case HFI_PROPERTY_PARAM_VDEC_PIC_STRUCT:
> -			data_ptr += sizeof(u32);
> +			if (increment_data_ptr(data_ptr, &rem_bytes))
> +				break;
> +			if (rem_bytes < sizeof(struct hfi_pic_struct))
> +				break;
>  			pic_struct = (struct hfi_pic_struct *)data_ptr;
>  			event.pic_struct = pic_struct->progressive_only;
>  			data_ptr += sizeof(*pic_struct);
> +			rem_bytes -= sizeof(struct hfi_pic_struct);
>  			break;
>  		case HFI_PROPERTY_PARAM_VDEC_COLOUR_SPACE:
> -			data_ptr += sizeof(u32);
> +			if (increment_data_ptr(data_ptr, &rem_bytes))
> +				break;
> +			if (rem_bytes < sizeof(struct hfi_colour_space))
> +				break;
>  			colour_info = (struct hfi_colour_space *)data_ptr;
>  			event.colour_space = colour_info->colour_space;
>  			data_ptr += sizeof(*colour_info);
> +			rem_bytes -= sizeof(struct hfi_colour_space);
>  			break;
>  		case HFI_PROPERTY_CONFIG_VDEC_ENTROPY:
> -			data_ptr += sizeof(u32);
> +			if (increment_data_ptr(data_ptr, &rem_bytes))
> +				break;
> +			if (rem_bytes < sizeof(u32))
> +				break;
>  			event.entropy_mode = *(u32 *)data_ptr;
>  			data_ptr += sizeof(u32);
> +			rem_bytes -= sizeof(u32);
>  			break;
>  		case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:
> -			data_ptr += sizeof(u32);
> +			if (increment_data_ptr(data_ptr, &rem_bytes))
> +				break;
> +			if (rem_bytes < sizeof(struct hfi_buffer_requirements))
> +				break;
>  			bufreq = (struct hfi_buffer_requirements *)data_ptr;
>  			event.buf_count = hfi_bufreq_get_count_min(bufreq, ver);
>  			data_ptr += sizeof(*bufreq);
> +			rem_bytes -= sizeof(struct hfi_buffer_requirements);
>  			break;
>  		case HFI_INDEX_EXTRADATA_INPUT_CROP:
> -			data_ptr += sizeof(u32);
> +			if (increment_data_ptr(data_ptr, &rem_bytes))
> +				break;
> +			if (rem_bytes < sizeof(struct hfi_extradata_input_crop))
> +				break;
>  			crop = (struct hfi_extradata_input_crop *)data_ptr;
>  			event.input_crop.left = crop->left;
>  			event.input_crop.top = crop->top;
>  			event.input_crop.width = crop->width;
>  			event.input_crop.height = crop->height;
>  			data_ptr += sizeof(*crop);
> +			rem_bytes -= sizeof(struct hfi_extradata_input_crop);
>  			break;
>  		case HFI_PROPERTY_PARAM_VDEC_DPB_COUNTS:
> -			data_ptr += sizeof(u32);
> +			if (increment_data_ptr(data_ptr, &rem_bytes))
> +				break;
> +			if (rem_bytes < sizeof(struct hfi_dpb_counts))
> +				break;
>  			dpb_count = (struct hfi_dpb_counts *)data_ptr;
>  			event.buf_count = dpb_count->fw_min_cnt;
>  			data_ptr += sizeof(*dpb_count);
> +			rem_bytes -= sizeof(struct hfi_dpb_counts);
>  			break;
>  		default:
>  			break;
> 

