Return-Path: <linux-media+bounces-46053-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E85C23831
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 08:15:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0A0AD347F17
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 07:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F25327207;
	Fri, 31 Oct 2025 07:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6cQL2rf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q7g1yt6Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7F72D6E6E
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 07:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761894894; cv=none; b=Lat3mu5q8+DoGTjPHSuxZ/b1MWAMYe2Vt/9ILjh7O15UujynbJMletnBVurw+l/JfcTSMeTAEByB4Qb6WRV4J/avnS3KvrQK6sIv9x436epGeIVmPcs9HpMeyg7qhs0QAtfR1vk0ZXbW8f5BnAHhCxBMySftBcoEtqwnT9lkJRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761894894; c=relaxed/simple;
	bh=ZjFiT163DU8f0vSN+tXKjOELPUt4rwlVM61p1bhcAHY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=mz25jfnXWdK+rsMoc8p/5p0s6m4YumFUKLX7LEpeEEKdOtbGs7Zg9pvZp8hf3EfPVaZfUxEl/92Ki3TnuYlzCvn3eWxDvMslbynjPRJBSlsDYYF1GQcBLjAE4aVRPX7njRvprCBYT5U5OQdpCDnzEDCv8OUalViBxUeuk2gAurs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6cQL2rf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q7g1yt6Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59ULC5cC872685
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 07:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c3If5XRwUcch6Vq5Jb3/Y5QIOP0LOmjER+KdRVCU5eg=; b=E6cQL2rfBG/rmNVM
	jtWQRvm0IA88wlS3RgVvE4p3oqDzg4xbHfBEvN7/0lfMJgk7Yyo1JhkMNwav9eY/
	FTxaPidpc98KFqdg911/TQ9o5o6L6u3g5kNcWZRXFAtbjqByJMkZwiIX5kcHJsct
	xeWbBBEt2iikmtpccEwDZ4Ejy4y2ghMedQjU2K0H9ze6a++umPQsv76AvlfrCs9m
	jPP070rrtgyjxmG2JN7mkg6rAHxQhPU2ZP3BMteYRNPV2R27LycWyL2RNxAfpiyU
	Lyjk+m+wsAad4pz2CLK1bgdneTdvIH2kBM4dvAw+C5wY/w+qUBlqZOiDjAvrM1C5
	I5WRUg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4fqn18hd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 07:14:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33dadf7c5beso1892167a91.0
        for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 00:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761894891; x=1762499691; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c3If5XRwUcch6Vq5Jb3/Y5QIOP0LOmjER+KdRVCU5eg=;
        b=Q7g1yt6YlBBEqLKfGVwKG4cMHLKt3XqUQgJ+so/zT+rG0R+fkujeYFQvDPHIwx8k7B
         LdEPjDMqCg4hIDRK2xuE3bWCYY5QkH6waawrfyvFQWieTcndca+85cEmnesBDwX8Pc4b
         EtBmhI05Dgrnhmnflpwv2PJ9x59W3wcDgFkvJ7s6faAe6zG3pjHKNl5Z3kA9rdF3n60u
         /jDX33Q/uFD9YumynDUuZE08e0Tir0csQG0VbiU8Iz436eV3GM6CcVhXgQnXLBew3xlh
         glmNUl3v6O/rclRVpghlaRt8LhahRl6q9YLsAxac1kFvm+fBVxt8Gmvd/HijrKwwKSbD
         NJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761894891; x=1762499691;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c3If5XRwUcch6Vq5Jb3/Y5QIOP0LOmjER+KdRVCU5eg=;
        b=QU7PzWUGcZ6oymhgPuuNRHs2Qf55Bc5ughQm8MFY98HvQHplNEx5Hy23LgAk9E6x8p
         2GlUoH/7zbwoYqYMZYX8Dj/sAUVP9CBgpq9UT5szlS6fuaeYbrLO+3vNB/cG+nond7bZ
         POZE9z1a7kwqqMfalUYdgcJ14fx9pOB5Uq/K2TOE8x1BhMS5LPecILx7ZBNGYb8nUqlA
         Ezb4jiZFIb3MUDugaD7UsJqFH32wGjZObyNHKXq3uXIDkn7Q2MKl5RJcOYPH2phU6GCO
         Sipe5pgj3Xomkae2IwijHSe9eTk8sRO/bE3T6O3QaI6M/b4tQhY6bmKUMXn6PAOYAaTD
         ZTMA==
X-Gm-Message-State: AOJu0YwfX74/q0eUdbKZtgOC5NtMri19xU2f/uVaOFNzRyhPEd3X8vVN
	jQyx+rK4YV02lQo3z0/0K23Xhdio1Kct/XfvTWyC4g/EofQ3SMwO+oj4WcG5i9Xq7TM3Z9QfYDG
	672OIV0GUMqPF4hc0ChaMovKqH6Ay9uay+lo5LZedaR/wiAH6CmSYx87JSe8Q9FoE1w==
X-Gm-Gg: ASbGnct9o4tpMZgnnfCHf7zCe9RelMJMdA8YswcR+qJmmP+ar1kYvA2yCnGLClaEuFB
	nusrYDdeP9Z77WN0+9YNwKHHJHR4yJJyS/ayXOR7ONblRDBfmi6kKEjKemKL5bMhx81viaRC4yr
	wmQgNKT7sagNitRXqeXwGNQZNcaCGfXqnwXD1IPFz0inHheDeCLOrL8LmxyTbyz6kSj9ZVYpdjG
	uULRbMmxRU8INGqiaoWl4T/wpMBraE3hMbgrjfxYki3IEyWQe61JpufC12M6CCDCv90VFys6HWZ
	3L4hKk75OyuBcy0dE9OFIflWO93EKGALt6yBnR/1kvNkVZUG9p4oJMJzMjTpB1zRLQilZvHgKlV
	nGS78Jo5aSC0k2xcXVaU3oxoNrZkRJP0=
X-Received: by 2002:a17:90b:3e88:b0:33b:b020:596a with SMTP id 98e67ed59e1d1-34082fd9e22mr3162362a91.10.1761894890991;
        Fri, 31 Oct 2025 00:14:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxE5d0p7YQ8HrhMd6PO5rEIxewNDCfeak5gUQQuTsaswaLZ4F+BbU9dYiUnhC3kQyw4MWkTg==
X-Received: by 2002:a17:90b:3e88:b0:33b:b020:596a with SMTP id 98e67ed59e1d1-34082fd9e22mr3162323a91.10.1761894890373;
        Fri, 31 Oct 2025 00:14:50 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34050980be1sm4859994a91.2.2025.10.31.00.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 00:14:49 -0700 (PDT)
Message-ID: <2dd8c1e1-1e05-1c81-cbb9-36ade7de513c@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 12:44:45 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: Re: [PATCH v1 2/4] media: qcom: iris: Add rotation support for
 encoder
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        vikash.garodia@oss.qualcomm.com, abhinav.kumar@linux.dev,
        bod@kernel.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
References: <20251015092708.3703-1-wangao.wang@oss.qualcomm.com>
 <20251015092708.3703-3-wangao.wang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251015092708.3703-3-wangao.wang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RL2+3oi+ c=1 sm=1 tr=0 ts=690461eb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Qa9o6sTEP_P653HxESMA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 5j43tzBxZatasTpP-4rd6FmDn0vB8Fz1
X-Proofpoint-GUID: 5j43tzBxZatasTpP-4rd6FmDn0vB8Fz1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA2NSBTYWx0ZWRfX39nXKzUxowRT
 SJkQd9eUU5e04jFroVfUer0Zrcldkwiy2tmNKEYEnmxe9mv/XDMHxcNg7KSmMYs5rvFFzoE6Jh/
 zwgW2/1gjyimAeEfB1rGXMUb3OE/Psdx2MSWF+QXnxExPRz29orVkAiMkPkpS3zQJcXXF1ZpHlf
 d/jgSv2vMQqac6eWViZDKq5scdEgyeU7rdzp6pkvPKOwQkjEjb9/gucov0D+XUALx8KT2yFGSkD
 UC2sfhRZfGs49kVU9zVWe30m5SxwZrbAxX/uohpuiI1a0/8bTcIX7QMORDulwsirSmx7+h6XxfW
 1MgVcukDgyrBtVmIFixV5ORHs4wA9HYYytLc+5xkPiiosLXR3dLz5uD9X7Byk/B4MYyW5XQbnNz
 ccghDTU/p2dqTBnsJHus9AjqLn+32A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310065



On 10/15/2025 2:57 PM, Wangao Wang wrote:
> Add rotation control for encoder, enabling V4L2_CID_ROTATE and handling
>  90/180/270 degree rotation.
> 
> Add VPSS buffer to platform data, which the rotate function requires.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c | 34 ++++++++++++
>  drivers/media/platform/qcom/iris/iris_ctrls.h |  1 +
>  .../qcom/iris/iris_hfi_gen2_command.c         | 12 ++++-
>  .../qcom/iris/iris_hfi_gen2_defines.h         |  9 ++++
>  .../qcom/iris/iris_hfi_gen2_response.c        |  2 +
>  .../platform/qcom/iris/iris_platform_common.h |  1 +
>  .../platform/qcom/iris/iris_platform_gen2.c   | 20 +++++++
>  drivers/media/platform/qcom/iris/iris_utils.c |  6 +++
>  drivers/media/platform/qcom/iris/iris_utils.h |  1 +
>  .../platform/qcom/iris/iris_vpu_buffer.c      | 52 +++++++++++--------
>  10 files changed, 114 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 754a5ad718bc..00949c207ddb 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -98,6 +98,8 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>  		return B_FRAME_QP_H264;
>  	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP:
>  		return B_FRAME_QP_HEVC;
> +	case V4L2_CID_ROTATE:
> +		return ROTATION;
>  	default:
>  		return INST_FW_CAP_MAX;
>  	}
> @@ -185,6 +187,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>  		return V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP;
>  	case B_FRAME_QP_HEVC:
>  		return V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP;
> +	case ROTATION:
> +		return V4L2_CID_ROTATE;
>  	default:
>  		return 0;
>  	}
> @@ -883,6 +887,36 @@ int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>  				     &range, sizeof(range));
>  }
>  
> +int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	u32 hfi_val;
> +
> +	switch (inst->fw_caps[cap_id].value) {
> +	case 0:
> +		hfi_val = HFI_ROTATION_NONE;
> +		return 0;
> +	case 90:
> +		hfi_val = HFI_ROTATION_90;
> +		break;
> +	case 180:
> +		hfi_val = HFI_ROTATION_180;
> +		break;
> +	case 270:
> +		hfi_val = HFI_ROTATION_270;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32,
> +					     &hfi_val, sizeof(u32));
> +}
> +
>  int iris_set_properties(struct iris_inst *inst, u32 plane)
>  {
>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
> index 30af333cc494..3ea0a00c7587 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -32,6 +32,7 @@ int iris_set_min_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_i
>  int iris_set_max_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_properties(struct iris_inst *inst, u32 plane);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index c2258dfb2a8a..15db4f9e85ff 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -198,8 +198,12 @@ static int iris_hfi_gen2_set_bitstream_resolution(struct iris_inst *inst, u32 pl
>  		payload_type = HFI_PAYLOAD_U32;
>  	} else {
>  		codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
> -		resolution = ALIGN(inst->enc_bitstream_width, codec_align) << 16 |
> -			ALIGN(inst->enc_bitstream_height, codec_align);
> +		if (is_rotation_90_or_270(inst))
> +			resolution = ALIGN(inst->enc_bitstream_height, codec_align) << 16 |
> +				ALIGN(inst->enc_bitstream_width, codec_align);
> +		else
> +			resolution = ALIGN(inst->enc_bitstream_width, codec_align) << 16 |
> +				ALIGN(inst->enc_bitstream_height, codec_align);
>  		inst_hfi_gen2->dst_subcr_params.bitstream_resolution = resolution;
>  		payload_type = HFI_PAYLOAD_32_PACKED;
>  	}
> @@ -241,6 +245,10 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
>  		right_offset = (ALIGN(inst->enc_raw_width, codec_align) - inst->enc_raw_width);
>  		left_offset = inst->crop.left;
>  		top_offset = inst->crop.top;
> +		if (inst->fw_caps[ROTATION].value) {
> +			bottom_offset = 0;
> +			right_offset = 0;
> +		}

why is this needed?

>  	}
>  
>  	payload[0] = FIELD_PREP(GENMASK(31, 16), left_offset) | top_offset;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index aa1f795f5626..4edcce7faf5e 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -83,6 +83,15 @@ enum hfi_seq_header_mode {
>  };
>  
>  #define HFI_PROP_SEQ_HEADER_MODE		0x03000149
> +
> +enum hfi_rotation {
> +	HFI_ROTATION_NONE = 0x00000000,
> +	HFI_ROTATION_90   = 0x00000001,
> +	HFI_ROTATION_180  = 0x00000002,
> +	HFI_ROTATION_270  = 0x00000003,
> +};
> +
> +#define HFI_PROP_ROTATION			0x0300014b
>  #define HFI_PROP_SIGNAL_COLOR_INFO		0x03000155
>  #define HFI_PROP_PICTURE_TYPE			0x03000162
>  #define HFI_PROP_DEC_DEFAULT_HEADER		0x03000168
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 2f1f118eae4f..dc3e606b6ab4 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -54,6 +54,8 @@ static u32 iris_hfi_gen2_buf_type_to_driver(struct iris_inst *inst,
>  			return BUF_SCRATCH_2;
>  	case HFI_BUFFER_PERSIST:
>  		return BUF_PERSIST;
> +	case HFI_BUFFER_VPSS:
> +		return BUF_VPSS;
>  	default:
>  		return 0;
>  	}
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 58d05e0a112e..9a4232b1c64e 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -140,6 +140,7 @@ enum platform_inst_fw_cap_type {
>  	P_FRAME_QP_HEVC,
>  	B_FRAME_QP_H264,
>  	B_FRAME_QP_HEVC,
> +	ROTATION,
>  	INST_FW_CAP_MAX,
>  };
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 36d69cc73986..c2cba30be83d 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -588,6 +588,16 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>  		.flags = CAP_FLAG_OUTPUT_PORT,
>  		.set = iris_set_u32,
>  	},
> +	{
> +		.cap_id = ROTATION,
> +		.min = 0,
> +		.max = 270,
> +		.step_or_mask = 90,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_ROTATION,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_rotation,
> +	},
>  };
>  
>  static struct platform_inst_caps platform_inst_cap_sm8550 = {
> @@ -729,6 +739,10 @@ static const u32 sm8550_dec_op_int_buf_tbl[] = {
>  	BUF_DPB,
>  };
>  
> +static const u32 sm8550_enc_ip_int_buf_tbl[] = {
> +	BUF_VPSS,

VPSS would be needed for scaling as well, pls add in correct patch.

> +};
> +
>  static const u32 sm8550_enc_op_int_buf_tbl[] = {
>  	BUF_BIN,
>  	BUF_COMV,
> @@ -816,6 +830,8 @@ struct iris_platform_data sm8550_data = {
>  	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>  	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>  
> +	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
>  	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>  	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>  };
> @@ -908,6 +924,8 @@ struct iris_platform_data sm8650_data = {
>  	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>  	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>  
> +	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
>  	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>  	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>  };
> @@ -989,6 +1007,8 @@ struct iris_platform_data sm8750_data = {
>  	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>  	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>  
> +	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
>  	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>  	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>  };
> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
> index 85c70a62b1fd..97465dfbdec1 100644
> --- a/drivers/media/platform/qcom/iris/iris_utils.c
> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
> @@ -124,3 +124,9 @@ int iris_check_core_mbps(struct iris_inst *inst)
>  
>  	return 0;
>  }
> +
> +bool is_rotation_90_or_270(struct iris_inst *inst)
> +{
> +	return inst->fw_caps[ROTATION].value == 90 ||
> +		inst->fw_caps[ROTATION].value == 270;
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_utils.h b/drivers/media/platform/qcom/iris/iris_utils.h
> index 75740181122f..b5705d156431 100644
> --- a/drivers/media/platform/qcom/iris/iris_utils.h
> +++ b/drivers/media/platform/qcom/iris/iris_utils.h
> @@ -51,5 +51,6 @@ void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
>  int iris_wait_for_session_response(struct iris_inst *inst, bool is_flush);
>  int iris_check_core_mbpf(struct iris_inst *inst);
>  int iris_check_core_mbps(struct iris_inst *inst);
> +bool is_rotation_90_or_270(struct iris_inst *inst);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index 4463be05ce16..749cc3139de2 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -556,6 +556,22 @@ static u32 iris_vpu_dec_scratch1_size(struct iris_inst *inst)
>  		iris_vpu_dec_line_size(inst);
>  }
>  
> +static inline u32 iris_vpu_enc_get_bitstream_width(struct iris_inst *inst)
> +{
> +	if (is_rotation_90_or_270(inst))
> +		return inst->fmt_dst->fmt.pix_mp.height;
> +	else
> +		return inst->fmt_dst->fmt.pix_mp.width;
> +}
> +
> +static inline u32 iris_vpu_enc_get_bitstream_height(struct iris_inst *inst)
> +{
> +	if (is_rotation_90_or_270(inst))
> +		return inst->fmt_dst->fmt.pix_mp.width;
> +	else
> +		return inst->fmt_dst->fmt.pix_mp.height;
> +}
> +
>  static inline u32 size_bin_bitstream_enc(u32 width, u32 height,
>  					 u32 rc_type)
>  {
> @@ -638,10 +654,9 @@ static inline u32 hfi_buffer_bin_enc(u32 width, u32 height,
>  static u32 iris_vpu_enc_bin_size(struct iris_inst *inst)
>  {
>  	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
> +	u32 height = iris_vpu_enc_get_bitstream_height(inst);
> +	u32 width = iris_vpu_enc_get_bitstream_width(inst);
>  	u32 stage = inst->fw_caps[STAGE].value;
> -	struct v4l2_format *f = inst->fmt_dst;
> -	u32 height = f->fmt.pix_mp.height;
> -	u32 width = f->fmt.pix_mp.width;
>  	u32 lcu_size;
>  
>  	if (inst->codec == V4L2_PIX_FMT_HEVC)
> @@ -676,9 +691,8 @@ u32 hfi_buffer_comv_enc(u32 frame_width, u32 frame_height, u32 lcu_size,
>  
>  static u32 iris_vpu_enc_comv_size(struct iris_inst *inst)
>  {
> -	struct v4l2_format *f = inst->fmt_dst;
> -	u32 height = f->fmt.pix_mp.height;
> -	u32 width = f->fmt.pix_mp.width;
> +	u32 height = iris_vpu_enc_get_bitstream_height(inst);
> +	u32 width = iris_vpu_enc_get_bitstream_width(inst);
>  	u32 num_recon = 1;
>  	u32 lcu_size = 16;
>  
> @@ -958,9 +972,8 @@ u32 hfi_buffer_non_comv_enc(u32 frame_width, u32 frame_height,
>  static u32 iris_vpu_enc_non_comv_size(struct iris_inst *inst)
>  {
>  	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
> -	struct v4l2_format *f = inst->fmt_dst;
> -	u32 height = f->fmt.pix_mp.height;
> -	u32 width = f->fmt.pix_mp.width;
> +	u32 height = iris_vpu_enc_get_bitstream_height(inst);
> +	u32 width = iris_vpu_enc_get_bitstream_width(inst);
>  	u32 lcu_size = 16;
>  
>  	if (inst->codec == V4L2_PIX_FMT_HEVC) {
> @@ -1051,9 +1064,8 @@ u32 hfi_buffer_line_enc_vpu33(u32 frame_width, u32 frame_height, bool is_ten_bit
>  static u32 iris_vpu_enc_line_size(struct iris_inst *inst)
>  {
>  	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
> -	struct v4l2_format *f = inst->fmt_dst;
> -	u32 height = f->fmt.pix_mp.height;
> -	u32 width = f->fmt.pix_mp.width;
> +	u32 height = iris_vpu_enc_get_bitstream_height(inst);
> +	u32 width = iris_vpu_enc_get_bitstream_width(inst);
>  	u32 lcu_size = 16;
>  
>  	if (inst->codec == V4L2_PIX_FMT_HEVC) {
> @@ -1131,10 +1143,8 @@ static u32 iris_vpu_enc_arp_size(struct iris_inst *inst)
>  
>  inline bool is_scaling_enabled(struct iris_inst *inst)
>  {
> -	return inst->crop.left != inst->compose.left ||
> -		inst->crop.top != inst->compose.top ||
> -		inst->crop.width != inst->compose.width ||
> -		inst->crop.height != inst->compose.height;
> +	return inst->fmt_dst->fmt.pix_mp.width != inst->fmt_src->fmt.pix_mp.width ||
> +		inst->fmt_dst->fmt.pix_mp.height != inst->fmt_src->fmt.pix_mp.height;
>  }

this is needed for scaling as well? pls add in correct patch.

Thanks,
Dikshita

>  
>  static inline
> @@ -1291,9 +1301,8 @@ static inline u32 hfi_buffer_scratch1_enc(u32 frame_width, u32 frame_height,
>  static u32 iris_vpu_enc_scratch1_size(struct iris_inst *inst)
>  {
>  	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
> -	struct v4l2_format *f = inst->fmt_dst;
> -	u32 frame_height = f->fmt.pix_mp.height;
> -	u32 frame_width = f->fmt.pix_mp.width;
> +	u32 frame_height = iris_vpu_enc_get_bitstream_height(inst);
> +	u32 frame_width = iris_vpu_enc_get_bitstream_width(inst);
>  	u32 num_ref = 1;
>  	u32 lcu_size;
>  	bool is_h265;
> @@ -1389,9 +1398,8 @@ static inline u32 hfi_buffer_scratch2_enc(u32 frame_width, u32 frame_height,
>  
>  static u32 iris_vpu_enc_scratch2_size(struct iris_inst *inst)
>  {
> -	struct v4l2_format *f = inst->fmt_dst;
> -	u32 frame_width = f->fmt.pix_mp.width;
> -	u32 frame_height = f->fmt.pix_mp.height;
> +	u32 frame_height = iris_vpu_enc_get_bitstream_height(inst);
> +	u32 frame_width = iris_vpu_enc_get_bitstream_width(inst);
>  	u32 num_ref = 1;
>  
>  	return hfi_buffer_scratch2_enc(frame_width, frame_height, num_ref,

