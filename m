Return-Path: <linux-media+bounces-49661-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B40CCE8BB3
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 06:48:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E40E330136C7
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 05:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AAB82DC762;
	Tue, 30 Dec 2025 05:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b5LDw8Az";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QncZRnNg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C62239E80
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 05:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767073673; cv=none; b=cXgmEGTl/Ylx8Dv9rJLik1DFZv0fqMDuZM9VLHfgzIZ9JWCr1m0r8tEWPzREzukN6iBGg6JhupC1FsU2Cttx4LPm4ucvEY3ICZKGBUCPBmlvdVLMjeSj7s3B+m9e/L43eItunlvxjrxrIXGtq+Swg6QM9ZTa5jW05SZUMw24Qdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767073673; c=relaxed/simple;
	bh=NfJVYZHqL2GjqUM1gYbHfJnzSAZISiJYfElcxRNGEEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BdYAAuwYqeaUf8O6eBisXskQt6xoaIPwgp8W1Eh+5EM6+n0PfLrHfyL5LEzrT5DTulaaag3YJXPWpfwG0NWI8Ohwlz+DgvEHCGbIrElH0uueVL+r/CIivaDQiYPqWxbz75S4y/Bms4T+dXmFu9EoKo/HaYS6PDKk9SsKXGUor2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b5LDw8Az; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QncZRnNg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU3hgnx2546972
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 05:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ChOOaZx7bKMSfqzBY50DzgXLmE1Kif7ro1TALjzZP28=; b=b5LDw8Az6NhpinD+
	s993iN2Kzb16OqxSCuBakk8BGiWy09pI2xuULmTW/Yr6AkdV5IeEq5dK7HfEon+3
	lca0VMOR5i+isc5jlp6UD0EhjpEn5pt3oOd94kmqBpGmwQo+v6ChPX8aRvzaTZk1
	ACb1Eg6ZFaHHjl1S5iuH+VQjhRMsIIWiOx4uIzHfMwOXpQmPuDt4fzR1fW/PHCK4
	Mv2xyR/1CQo7JQdY52lf3R2uNI72ZlhyaAtUIztbIQFvPFDh8FzFXQbBDrrZOSpo
	ZIdVnsI9PCPmD+lAIxu3PFqkMiIkXt2Zkm4/liyB11yWDAsd0OKyRUhhBSx4TDIv
	g710AQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc7398741-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 05:47:50 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7bad1cef9bcso19974290b3a.1
        for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 21:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767073668; x=1767678468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ChOOaZx7bKMSfqzBY50DzgXLmE1Kif7ro1TALjzZP28=;
        b=QncZRnNgM8muWAO6Yk7Xsp+0qOA27hb9E5Acg1MRUEAo+enCLHnQMqPdV2cdQORBtf
         IFF6ssxb7kVpZmrw1ebE4xMCuXxZHJ0fbciiEUUmU+stHmwbvj9bbktIvhOUHBV/Ktcm
         G3vSY3c4TxP6i/fxCjGZ+1Doci/3uwxhbrKdKBe8tzVwwAEPUIGVkxJxg+dWwTpzKd8f
         Z3Kgz+eKyqHUnoEifZmkMD1IXCkDbRJvaA/MNILmv8oB+jiZ3WjcTaYWdKrXSQtQDTmV
         F1RKSm+Wkxbgk+CQAmPuMXk/fHN8pUkXxqqJz4wOq9COVhVRZ0Bsrj4XKs7asWLJrruY
         5IZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767073668; x=1767678468;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ChOOaZx7bKMSfqzBY50DzgXLmE1Kif7ro1TALjzZP28=;
        b=acrI8b1EJzCDq3IfcdG0W+H/whX22SI7j5xGauh/vfHj5mvUM2h+UIYFluzR2jGExu
         t+PX0utFsbpTQBbJDB+xWDZWQ0BDKi1a9bf4mRm/Ge6IJptZNyTdeGHz+lWjktBr11WV
         LoYA0VjWyWL0npIRO4mXSKoLKfuzv7XNrl3KniaqMZODu04AOBccFy5/ajaPXJ3MyguU
         NdESfWqkunY02jOIJ6VwPxsyfkS+BMSNZ4JVSCISzLN9JHrxv+UL+XgsyC5NWdS/MPJU
         Co1oLPpi8aWVi11u/Q3tVSgYgMnjNJ6ypbJPzSGNcybXOxfhWO2kcML18kOAzF3kOO5A
         15cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWS6KTKJNWuw2JFvDXlrEpbqoi6bkqg0Y1enrXfOwqS2xqJ42QtI8+srCuaVxm9q6Fv3P3x8HzezIBhIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YycQDo9MDnWNRp0aWZ14tcG7kRMwmSzTyOgqbnWJRPwOJScU+Ex
	J27mUg7BWdLkZyGKbgMkH3edulF9Ah7oPiXMFq1yfOTxl46PdKO9WzoaA+v12SErZEt3XRUVZ3E
	fZPRujXr6mfS8MjnrBIQYOwQXjg7iCKwpa0qTa3iY9QT5RWkeDuSTtfqh/2Dq60BSSw==
X-Gm-Gg: AY/fxX5IFsBMspmhGP//B7SQcCO4YPdJKlvg+6RjV0hrG9/fcj7r714MAZGwNjKTJ63
	VMDDUANFROl+qjzWpNVukN+fd1GK7K3KDra8zlTVzVeSGXFq0sURFlkf7pO/cyjVrjJksMvv0RD
	uql5TRPZFDyseaEEgnBG6QdIDb0dqLd7WFoagqV31LqiXf3wJVEI9AZ+poqBhiF0l1H3Xi/GRHr
	m/2IEk/JZul+P/x6HJfMDh0BtyoidouYoLVZ3XOmmn35msQDvhFUHdppqDrbmeBUk7EASAu8Mkh
	v9LY+XCSAFPH0tJYKZ+JVZJqNY046eznXyslO4aQNw6CODmtHzxzaPqDWm42tjJHrTx9SRnM9du
	yHb+C27X5Tlv8IBnlamTV1lnSSim75zGZZJiJDV4okQ==
X-Received: by 2002:a05:6a20:9389:b0:342:fa4f:5849 with SMTP id adf61e73a8af0-376a95c0819mr27756759637.39.1767073668292;
        Mon, 29 Dec 2025 21:47:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZO+AOIu3PgnRLN1dANeXl85T8xeyk5msoeAx1WHNbLWl5yW3BGHpoPE2oO31807mxaadKPA==
X-Received: by 2002:a05:6a20:9389:b0:342:fa4f:5849 with SMTP id adf61e73a8af0-376a95c0819mr27756732637.39.1767073667738;
        Mon, 29 Dec 2025 21:47:47 -0800 (PST)
Received: from [10.0.0.3] ([106.222.235.175])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7961fbb9sm26790168a12.2.2025.12.29.21.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 21:47:47 -0800 (PST)
Message-ID: <d8313fee-3f42-49cc-ba24-865dd60110a2@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 11:17:42 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/6] media: qcom: iris: Add Long-Term Reference support
 for encoder
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251219-batch2_iris_encoder_enhancements-v2-0-371f7fe24801@oss.qualcomm.com>
 <20251219-batch2_iris_encoder_enhancements-v2-2-371f7fe24801@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251219-batch2_iris_encoder_enhancements-v2-2-371f7fe24801@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _cP401fVvG48OyWyjTcUMB_NIZ6JFOZk
X-Authority-Analysis: v=2.4 cv=HrV72kTS c=1 sm=1 tr=0 ts=69536786 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IzfGebrgPFzWcUWWzKPHyQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pMfPH_gjMZfusMAboDYA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA1MSBTYWx0ZWRfX0uGPOy872hco
 dS6K99rdufmouj9H8ghV90rZ+8rMyTxJgpCqmnvAyaqwdvVhjazVLB42hB1gyELpsuc+lNcM13j
 CVrVcEvh2VFXPtMOZi0h01mCSvHS/KzSBMXrAvkAGSVQC1BYzkyboxkFlyPprgjaNDnawEMTPNs
 Bl2iRH6wIHe48VQMFASZTxOEbfRJwYQlbi9iO3xWNh+3ZMvSGsjj/Q7EEZ9MBKUK/c/go4DrImg
 y0oAzrg39n+hFXuFBuzm9/Xp5OySxfmzhqRL1C6DtR8gQG8b2a//5BsgKyjFM9PkXFmfxdV9+Io
 oXhlW3QoXXwnSBMUGRWFLW/xx+14zYQ5LWc/SAaJP7KtUz3/SQhnZBIpqNdGfLvO/tIbCCQazZg
 v2hDgfFWDCpNByEu3qejnbOwBgaG9j1qyV8VSyLt1bCMHza/IabP+G596ufzzZQT6/PLheU6uTE
 S1SbUG2+QDZ9QfbwMqw==
X-Proofpoint-ORIG-GUID: _cP401fVvG48OyWyjTcUMB_NIZ6JFOZk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300051



On 12/19/2025 1:12 PM, Wangao Wang wrote:
> Add Long-Term Reference(LTR) frame support for both gen1 and gen2
> encoders by enabling the following V4L2 controls:
> V4L2_CID_MPEG_VIDEO_LTR_COUNT
> V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES
> V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 128 +++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |   5 +
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  25 ++++
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  24 ++++
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   3 +
>  .../platform/qcom/iris/iris_platform_common.h      |   6 +
>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  30 +++++
>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  30 +++++
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  20 +++-
>  9 files changed, 267 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index eae4fedc929e980eb001a5a6625159958d53a3d1..428203af725ab5697ee42b5adf9557c65fafd7f4 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -108,6 +108,12 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>  		return IR_TYPE;
>  	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:
>  		return IR_PERIOD;
> +	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:
> +		return LTR_COUNT;
> +	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:
> +		return USE_LTR;
> +	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:
> +		return MARK_LTR;
>  	default:
>  		return INST_FW_CAP_MAX;
>  	}
> @@ -205,6 +211,12 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>  		return V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE;
>  	case IR_PERIOD:
>  		return V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD;
> +	case LTR_COUNT:
> +		return V4L2_CID_MPEG_VIDEO_LTR_COUNT;
> +	case USE_LTR:
> +		return V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES;
> +	case MARK_LTR:
> +		return V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX;
>  	default:
>  		return 0;
>  	}
> @@ -1025,6 +1037,122 @@ int iris_set_ir_period_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_ty
>  					     &ir_period, sizeof(u32));
>  }
>  
> +int iris_set_ltr_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	u32 ltr_count = inst->fw_caps[cap_id].value;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	struct hfi_ltr_mode ltr_mode;
> +
> +	if (!ltr_count)
> +		return -EINVAL;
> +
> +	ltr_mode.count = ltr_count;
> +	ltr_mode.mode = HFI_LTR_MODE_MANUAL;
> +	ltr_mode.trust_mode = 1;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_STRUCTURE,
> +					     &ltr_mode, sizeof(ltr_mode));
> +}
> +
> +int iris_set_use_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	struct vb2_queue *sq = v4l2_m2m_get_src_vq(inst->m2m_ctx);
> +	struct vb2_queue *dq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
> +	u32 ltr_count = inst->fw_caps[LTR_COUNT].value;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	struct hfi_ltr_use ltr_use;
> +
> +	if (!vb2_is_streaming(sq) && !vb2_is_streaming(dq))
> +		return -EINVAL;
> +
> +	if (!ltr_count)
> +		return -EINVAL;
> +
> +	ltr_use.ref_ltr = inst->fw_caps[cap_id].value;
> +	ltr_use.use_constrnt = true;
> +	ltr_use.frames = 0;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_STRUCTURE,
> +					     &ltr_use, sizeof(ltr_use));
> +}
> +
> +int iris_set_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	struct vb2_queue *sq = v4l2_m2m_get_src_vq(inst->m2m_ctx);
> +	struct vb2_queue *dq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
> +	u32 ltr_count = inst->fw_caps[LTR_COUNT].value;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	struct hfi_ltr_mark ltr_mark;
> +
> +	if (!vb2_is_streaming(sq) && !vb2_is_streaming(dq))
> +		return -EINVAL;
> +
> +	if (!ltr_count)
> +		return -EINVAL;
> +
> +	ltr_mark.mark_frame = inst->fw_caps[cap_id].value;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_STRUCTURE,
> +					     &ltr_mark, sizeof(ltr_mark));
> +}
> +
> +int iris_set_ltr_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	u32 ltr_count = inst->fw_caps[cap_id].value;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +
> +	if (!ltr_count)
> +		return -EINVAL;
> +
> +	if (inst->hfi_rc_type == HFI_RC_CBR_VFR ||
> +	    inst->hfi_rc_type == HFI_RC_CBR_CFR ||
> +	    inst->hfi_rc_type == HFI_RC_OFF) {
> +		inst->fw_caps[LTR_COUNT].value = 0;
> +		return -EINVAL;
> +	}
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_U32,
> +					     &ltr_count, sizeof(u32));
> +}
> +
> +int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	struct vb2_queue *sq = v4l2_m2m_get_src_vq(inst->m2m_ctx);
> +	struct vb2_queue *dq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
> +	u32 ltr_count = inst->fw_caps[LTR_COUNT].value;
> +	u32 hfi_val = inst->fw_caps[cap_id].value;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +
> +	if (!vb2_is_streaming(sq) && !vb2_is_streaming(dq))
> +		return -EINVAL;
> +
> +	if (!ltr_count || hfi_val == INVALID_DEFAULT_MARK_OR_USE_LTR)
> +		return -EINVAL;
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
> index a0d5338bdc910bd30407132e8b700c333ad74e4c..996c83fdc6f492dc252771129fc1d62e8b7a7e07 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -36,6 +36,11 @@ int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>  int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_ir_period_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_ir_period_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_ltr_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_ltr_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_use_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_properties(struct iris_inst *inst, u32 plane);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 4d9632ba86bc8f629cee6d726eb44efcdeba2475..139e7a9321d30d3e348671f99b0fa81afed4827e 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -693,6 +693,31 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
>  		packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_refresh);
>  		break;
>  	}
> +	case HFI_PROPERTY_PARAM_VENC_LTRMODE: {
> +		struct hfi_ltr_mode *in = pdata, *ltr_mode = prop_data;
> +
> +		ltr_mode->mode = in->mode;
> +		ltr_mode->count = in->count;
> +		ltr_mode->trust_mode = in->trust_mode;
> +		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_mode);
> +		break;
> +	}
> +	case HFI_PROPERTY_CONFIG_VENC_USELTRFRAME: {
> +		struct hfi_ltr_use *in = pdata, *ltr_use = prop_data;
> +
> +		ltr_use->frames = in->frames;
> +		ltr_use->ref_ltr = in->ref_ltr;
> +		ltr_use->use_constrnt = in->use_constrnt;
> +		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_use);
> +		break;
> +	}
> +	case HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME: {
> +		struct hfi_ltr_mark *in = pdata, *ltr_mark = prop_data;
> +
> +		ltr_mark->mark_frame = in->mark_frame;
> +		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_mark);
> +		break;
> +	}
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> index 04c79ee0463d7f32a2042044fe4564718cc01561..34249fc0d047918c2463517b8303e30df3666b97 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> @@ -147,8 +147,16 @@
>  #define HFI_INTRA_REFRESH_RANDOM		0x5
>  
>  #define HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH			0x200500d
> +
> +#define HFI_LTR_MODE_DISABLE			0x0
> +#define HFI_LTR_MODE_MANUAL			0x1
> +#define HFI_LTR_MODE_PERIODIC			0x2
> +
> +#define HFI_PROPERTY_PARAM_VENC_LTRMODE				0x200501c
>  #define HFI_PROPERTY_PARAM_VENC_MAX_NUM_B_FRAMES		0x2005020
>  #define HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE			0x2006001
> +#define HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME			0x2006009
> +#define HFI_PROPERTY_CONFIG_VENC_USELTRFRAME			0x200600a
>  #define HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER	0x2006008
>  
>  struct hfi_pkt_hdr {
> @@ -460,6 +468,22 @@ struct hfi_intra_refresh {
>  	u32 mbs;
>  };
>  
> +struct hfi_ltr_mode {
> +	u32 mode;
> +	u32 count;
> +	u32 trust_mode;
> +};
> +
> +struct hfi_ltr_use {
> +	u32 ref_ltr;
> +	u32 use_constrnt;
> +	u32 frames;
> +};
> +
> +struct hfi_ltr_mark {
> +	u32 mark_frame;
> +};
> +
>  struct hfi_event_data {
>  	u32 error;
>  	u32 height;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index f6a214a6815420f299be70f80732943d02168f0c..2b8c87c25a066ead30bb1b134bdc3fe1e84e8f05 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -71,6 +71,9 @@ enum hfi_rate_control {
>  #define HFI_PROP_MIN_QP_PACKED			0x0300012f
>  #define HFI_PROP_MAX_QP_PACKED			0x03000130
>  #define HFI_PROP_IR_RANDOM_PERIOD		0x03000131
> +#define HFI_PROP_LTR_COUNT			0x03000134
> +#define HFI_PROP_LTR_MARK			0x03000135
> +#define HFI_PROP_LTR_USE			0x03000136
>  #define HFI_PROP_TOTAL_BITRATE			0x0300013b
>  #define HFI_PROP_MAX_GOP_FRAMES			0x03000146
>  #define HFI_PROP_MAX_B_FRAMES			0x03000147
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index dd0a4210a2647ff4dadf8d67b71c6f4a22deb548..c48dfb6d47734fadd4f2e4123c93560f55355b86 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -29,6 +29,9 @@ struct iris_inst;
>  #define MAX_QP_HEVC				63
>  #define DEFAULT_QP				20
>  #define BITRATE_DEFAULT			20000000
> +#define INVALID_DEFAULT_MARK_OR_USE_LTR		-1
> +#define MAX_LTR_FRAME_COUNT_GEN1		4
> +#define MAX_LTR_FRAME_COUNT_GEN2		2
>  
>  enum stage_type {
>  	STAGE_1 = 1,
> @@ -148,6 +151,9 @@ enum platform_inst_fw_cap_type {
>  	VFLIP,
>  	IR_TYPE,
>  	IR_PERIOD,
> +	LTR_COUNT,
> +	USE_LTR,
> +	MARK_LTR,
>  	INST_FW_CAP_MAX,
>  };
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> index e7645bd60eb46785e0110a34f3257f7c37bbfca5..13cee5f72a443b85136d30b41b589aeb0db8eb9a 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> @@ -249,6 +249,36 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
>  		.flags = CAP_FLAG_OUTPUT_PORT,
>  		.set = iris_set_ir_period_gen1,
>  	},
> +	{
> +		.cap_id = LTR_COUNT,
> +		.min = 0,
> +		.max = MAX_LTR_FRAME_COUNT_GEN1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROPERTY_PARAM_VENC_LTRMODE,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_ltr_count_gen1,
> +	},
> +	{
> +		.cap_id = USE_LTR,
> +		.min = 0,
> +		.max = ((1 << MAX_LTR_FRAME_COUNT_GEN1) - 1),
> +		.step_or_mask = 0,
> +		.value = 0,
> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_USELTRFRAME,
> +		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_use_ltr,
> +	},
> +	{
> +		.cap_id = MARK_LTR,
> +		.min = 0,
> +		.max = (MAX_LTR_FRAME_COUNT_GEN1 - 1),
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME,
> +		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_mark_ltr,
> +	},
>  };
>  
>  static struct platform_inst_caps platform_inst_cap_sm8250 = {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 585f0aedc0eb5e80fd108929e1861101a7bab2be..99d8e1e59e6bfd5e4ab0fd2b5831f74c54b6e87d 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -637,6 +637,36 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>  			CAP_FLAG_DYNAMIC_ALLOWED,
>  		.set = iris_set_ir_period_gen2,
>  	},
> +	{
> +		.cap_id = LTR_COUNT,
> +		.min = 0,
> +		.max = MAX_LTR_FRAME_COUNT_GEN2,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_LTR_COUNT,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_ltr_count_gen2,
> +	},
> +	{
> +		.cap_id = USE_LTR,
> +		.min = 0,
> +		.max = ((1 << MAX_LTR_FRAME_COUNT_GEN2) - 1),
> +		.step_or_mask = 0,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_LTR_USE,
> +		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_use_and_mark_ltr,
> +	},
> +	{
> +		.cap_id = MARK_LTR,
> +		.min = INVALID_DEFAULT_MARK_OR_USE_LTR,
> +		.max = (MAX_LTR_FRAME_COUNT_GEN2 - 1),
> +		.step_or_mask = 1,
> +		.value = INVALID_DEFAULT_MARK_OR_USE_LTR,
> +		.hfi_id = HFI_PROP_LTR_MARK,
> +		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
> +		.set = iris_set_use_and_mark_ltr,
> +	},
>  };
>  
>  static struct platform_inst_caps platform_inst_cap_sm8550 = {
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index 1e54ace966c74956208d88f06837b97b1fd48e17..b7413edfbc5646fbdee6139d1e6897d730e2c8d1 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -668,6 +668,19 @@ static u32 iris_vpu_enc_bin_size(struct iris_inst *inst)
>  				  num_vpp_pipes, inst->hfi_rc_type);
>  }
>  
> +static inline u32 hfi_buffer_get_recon_count(struct iris_inst *inst)
> +{
> +	u32 num_ref = 1;
> +	u32 ltr_count;
> +
> +	ltr_count = inst->fw_caps[LTR_COUNT].value;
> +
> +	if (ltr_count)
> +		num_ref = num_ref + ltr_count;
> +
> +	return num_ref;
> +}
> +
>  static inline
>  u32 hfi_buffer_comv_enc(u32 frame_width, u32 frame_height, u32 lcu_size,
>  			u32 num_recon, u32 standard)
> @@ -693,7 +706,7 @@ static u32 iris_vpu_enc_comv_size(struct iris_inst *inst)
>  {
>  	u32 height = iris_vpu_enc_get_bitstream_height(inst);
>  	u32 width = iris_vpu_enc_get_bitstream_width(inst);
> -	u32 num_recon = 1;
> +	u32 num_recon = hfi_buffer_get_recon_count(inst);
>  	u32 lcu_size = 16;
>  
>  	if (inst->codec == V4L2_PIX_FMT_HEVC) {
> @@ -1402,10 +1415,9 @@ static u32 iris_vpu_enc_scratch2_size(struct iris_inst *inst)
>  {
>  	u32 frame_height = iris_vpu_enc_get_bitstream_height(inst);
>  	u32 frame_width = iris_vpu_enc_get_bitstream_width(inst);
> -	u32 num_ref = 1;
> +	u32 num_ref = hfi_buffer_get_recon_count(inst);
>  
> -	return hfi_buffer_scratch2_enc(frame_width, frame_height, num_ref,
> -				       false);
> +	return hfi_buffer_scratch2_enc(frame_width, frame_height, num_ref, false);
>  }
>  
>  static u32 iris_vpu_enc_vpss_size(struct iris_inst *inst)
> 

