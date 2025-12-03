Return-Path: <linux-media+bounces-48124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B034C9DFC0
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 07:56:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E0EAA349D7A
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 06:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C033829ACCD;
	Wed,  3 Dec 2025 06:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bZxWYiYn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XYzCUxaO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1C72989A2
	for <linux-media@vger.kernel.org>; Wed,  3 Dec 2025 06:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764744956; cv=none; b=cEwrM8DJSbM4zUa9q/qMvigvCbNnx/C/olg58G23PJvoNGxV0kg32lP3UOQKzbSfPMfdgr2i3gc1ikuS/la9zeuk3k62YWbvvepUayaaHwBnN1hfBOS1GvyKwRFpumyIQvVXqLLX7sGwhxdwXskTtCv9T7PcZjgD8C2pSDnlPC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764744956; c=relaxed/simple;
	bh=kSAiVzBW7JJveNulSvQ9KHWFFT8tLUt+prfl3JJ5yoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gb3ni7ft3/BOAORHuagsVgmBsecRNRES9Qh8d3bIiE4xdCNsDmPyKo/J6FENfbSH8XNWGgPrXS5wmUetCUoQX+LahONKDdVeZqVbe0Q/Qz/B31M1WqEL6PKvC6EGVXYLGIwc1L6UknBv2nADL+3uoTDZdWOP3myoAkRpmRoM4c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bZxWYiYn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XYzCUxaO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B31W91V806006
	for <linux-media@vger.kernel.org>; Wed, 3 Dec 2025 06:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Gc8HlWAEbFNfkpgopN+Gxm44pPsbuw2lQifQzhvfUU=; b=bZxWYiYn7IVpFI32
	NdtdAKvNHtuF1Neu4IBVW+f7G1Up9PfNn61QGgIqgb2RNXfy606u2CjSaQmD1dkB
	337aCVgMFmurJYRXAeQv0WxNd56BJ03Kxc3m/WSH5Ep2bWTqCZo/rz4ILye3QiPt
	fk4eSM5sNKWVyIliCtTFiusforSJiLNQO0jg8DWdbC11ggVy1CmeADsZqgqaxqh2
	0dGjuymbk60BK3Z3jlhJrwS9Wv207gEomN77vv1TcZmLRda4LNNgdqB6YjOXCb6t
	ASuhfwFibw4aO4piLK+TSEnjrkFUqaxjTR+TtSBU4hWzAx1KkdWxO86VQTXOkxue
	/Rs/sQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atbmmgv65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Dec 2025 06:55:53 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b90740249dso9164571b3a.0
        for <linux-media@vger.kernel.org>; Tue, 02 Dec 2025 22:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764744953; x=1765349753; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Gc8HlWAEbFNfkpgopN+Gxm44pPsbuw2lQifQzhvfUU=;
        b=XYzCUxaOqCGvkcSd+C+EUFa282SEAywVor+j4jOfMYoNoBuYVO/3z2Kgj4LCtDl0WT
         SGijJeoB5/11MZkNNINB0dGbD8aVS8lHw1WpXwuh91wySP7XBa4+kPQXfyozakGjQsLS
         A/+n7s+HEJeMO8v211+bV7sRFspw7Z0dw0nvSFVJeS9V9g5JZKdjBfOqZrucWjgnkRC/
         KVAlTYMCchdKhO+tHic+Wn9Jh8ePaG9OC7YhowahgdmHM3lIwdBI+aGOKj7GJ4K0aflC
         KdFOEPnnxd9GvGxgMwtIcJ9P+VdbqkSj3PLXdaIxwo18IlGSF9zf6AdtS0KGAYgAlJHd
         /dHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764744953; x=1765349753;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Gc8HlWAEbFNfkpgopN+Gxm44pPsbuw2lQifQzhvfUU=;
        b=oORoG5wbUkmiBkxcXOvwEQwEHRUV9dmQiTMLZRJ4Clr6CZRZSz1UZC28qKnDwfuXui
         RoPfsJu5JkqeHbUAJpVolSpdSQFmZEQJ6jmfRdTC096KcLrFkcMs8l3r6HKFZSRbeQNQ
         aioCQAwKpkutdwkifu30Pt9swQ422BT0fI0xoVxXcim3yu+Tm9l3BOqXFgZxg4Qc428P
         PcTck2bxEzBofzLSOwpyTxAtqqMEUM/rrG10Qc5bNCKRY+OZpyfb+QomZEFvkyWYKlGt
         3D6lcZQxWRGaa+UdxwEWdYmhJfP+aq4h8KImEzpCRBle2xQ5vaj+sTGzSbEZ8zGRPP42
         yfng==
X-Forwarded-Encrypted: i=1; AJvYcCV28oXtwEbx9pQuyP5j9sK4fWKMNkft6dY7r6wzQt3T/wOBvwr0ss9uPCQdoDUzlzubUrAYC6r1Zb3pGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHnoe7Tg044GbYLXaZbfvGn7DLVAK/yNriJRGnFhJp+59ZW1vc
	6bKd1bR9fxkCXG+FN4JJzNoYDt41t9/zDbEDzYuodkNp8IGG3s76OkjvDXo5+vvxzq1O4qq+KRo
	dma3giJ1IJ3O/eFXSgfoGuEt753uZnrXWbX1ySUc3962W9IDGHTFMdVD5fF3XGQws6Q==
X-Gm-Gg: ASbGncsvTwqqeY2cwRxih26TKT16jfmaHpYZ4Ja0bFVoQTKtzd7Nf5ahQQYs7mmfI17
	UyvANXxfPuMCvID2vff7E/LEWtXUJju4OsRYtvMNPZ9ar1J3TmmYCOp3z3zWZjKXDnjf1patATZ
	dh7naJ3uVMUWvCwVagl2f/x0DFJube963jHNIDYp09/89whU9gOj2oFgYeyisykXwqltbVYXgX7
	QCjGFZ/WdYGt6RtyhlSF3AI+p/MOMpK/PphBrfiEAHD7lgbjCXfEAP1B4OjcNiDMixb7CuS7gMZ
	Y6VR6nLTwKTEq57ACMWmEtpcG1xLqMpmzxOZ7KMjRdYDlu4m1o+RmyiQ1i7+8URHW9DR9CEvoaO
	fuNrFN1Fx0iV/kdcUanviP9oNkbSLQ9f7H4SAzrPpFQ==
X-Received: by 2002:a05:6a00:1408:b0:7ad:9e8a:1f72 with SMTP id d2e1a72fcca58-7e00d23540amr1656595b3a.14.1764744952742;
        Tue, 02 Dec 2025 22:55:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFy6BbWe5iXG1PspJfr78gTzUyA9cIU+KwfZBHvL7Bj1N/RfarG+ErY6bpQT+qhJum4CdVO4g==
X-Received: by 2002:a05:6a00:1408:b0:7ad:9e8a:1f72 with SMTP id d2e1a72fcca58-7e00d23540amr1656556b3a.14.1764744952246;
        Tue, 02 Dec 2025 22:55:52 -0800 (PST)
Received: from [10.0.0.3] ([106.222.234.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15e7db416sm18819471b3a.41.2025.12.02.22.55.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 22:55:51 -0800 (PST)
Message-ID: <8dc699bf-1e3a-2899-fa20-2fe282ffc730@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 12:25:47 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/4] media: qcom: iris: Add B frames support for encoder
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251127-batch2_iris_encoder_enhancements-v1-0-5ea78e2de2ae@oss.qualcomm.com>
 <20251127-batch2_iris_encoder_enhancements-v1-3-5ea78e2de2ae@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251127-batch2_iris_encoder_enhancements-v1-3-5ea78e2de2ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Rjt4apVKfJjUg07N2LXQ1sgA1JDPERh2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA1MyBTYWx0ZWRfX/zAM/eLmSeH3
 7E3KvaBe5wfNUgWDqdRairiblqmQINLMjsollR/3HfSTIOxr6mMyTDPjhleHXb8TNyxKgz05msP
 XiuV1NiPo3YHmyL45jgHTuAKv0AM22qbaNQdAhLR0xGDCJ6Fn9cnRkJJv0PWAlCrngTXFGYNPDW
 Qs8xy+g9yh2dKCLMcRo6/EtXA/X7/LSXf+6JHifAi7Wt0m4VtNMG+tadwsxeX7vi3dp+3WFBqZG
 Lq1nGf+n0y4RXXb9XTRIHq9jRZVlxKdzyD4kC17+V0c5G174z5ggdPievzMaITC4Qq/wyn1BAHT
 z3uIItaMQPRFufPdNBiENo3COuSJFjxI4BjwSmTNm1T2R7fzHrSycp83Y1q+fIS2FLGGsXQhkVc
 7PY7RJ9uxMcWYm11uKrFaSAl+4Y4qQ==
X-Proofpoint-ORIG-GUID: Rjt4apVKfJjUg07N2LXQ1sgA1JDPERh2
X-Authority-Analysis: v=2.4 cv=ApjjHe9P c=1 sm=1 tr=0 ts=692fdef9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fQrT7HkFwVlTC8MbpnvDjA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=V_m5RLb0Y1Kj7dkc9tgA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030053



On 11/27/2025 1:14 PM, Wangao Wang wrote:
> Add support for B-frame configuration on both gen1 and gen2 encoders by
> enabling V4L2_CID_MPEG_VIDEO_B_FRAMES control.
> 
> Key changes:
> Added capability IDs for B-frame and intra period.
> Implemented handler for GOP structure with B-frames.
> Defined HFI property and structure for gen1.
> Updated platform tables and buffer logic for gen2.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 25 ++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  8 +++++++
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  6 ++++++
>  .../platform/qcom/iris/iris_platform_common.h      |  2 ++
>  .../media/platform/qcom/iris/iris_platform_gen1.c  | 19 +++++++++++++++-
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 10 +++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  6 +++++-
>  8 files changed, 75 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 33e104142a5bb51c952550fa45e81b3bdc723ac2..9aec8a2006e9f8e545d05e40cb68ef0ae8502f79 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -114,6 +114,8 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>  		return USE_LTR;
>  	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:
>  		return MARK_LTR;
> +	case V4L2_CID_MPEG_VIDEO_B_FRAMES:
> +		return B_FRAME;
>  	default:
>  		return INST_FW_CAP_MAX;
>  	}
> @@ -217,6 +219,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>  		return V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES;
>  	case MARK_LTR:
>  		return V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX;
> +	case B_FRAME:
> +		return V4L2_CID_MPEG_VIDEO_B_FRAMES;
>  	default:
>  		return 0;
>  	}
> @@ -1148,6 +1152,27 @@ int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_
>  					     &hfi_val, sizeof(u32));
>  }
>  
> +int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
> +{
> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	u32 gop_size = inst->fw_caps[GOP_SIZE].value;
> +	u32 b_frame = inst->fw_caps[B_FRAME].value;
> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	struct hfi_intra_period intra_period;
> +
> +	if (!gop_size || b_frame >= gop_size)
> +		return -EINVAL;
> +
> +	intra_period.pframes = (gop_size - 1) / (b_frame + 1);
> +	intra_period.bframes = b_frame;
> +
> +	return hfi_ops->session_set_property(inst, hfi_id,
> +					     HFI_HOST_FLAGS_NONE,
> +					     iris_get_port_info(inst, cap_id),
> +					     HFI_PAYLOAD_STRUCTURE,
> +					     &intra_period, sizeof(intra_period));
> +}
> +
>  int iris_set_properties(struct iris_inst *inst, u32 plane)
>  {
>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
> index 996c83fdc6f492dc252771129fc1d62e8b7a7e07..609258c81517b71523b682ca994786cdd020b07f 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.h
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
> @@ -41,6 +41,7 @@ int iris_set_ltr_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_ty
>  int iris_set_use_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
> +int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
>  int iris_set_properties(struct iris_inst *inst, u32 plane);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 139e7a9321d30d3e348671f99b0fa81afed4827e..fe51eccb903be146e83a4fb2faf4b4092875dea4 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -718,6 +718,14 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
>  		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_mark);
>  		break;
>  	}
> +	case HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD: {
> +		struct hfi_intra_period *in = pdata, *intra_period = prop_data;
> +
> +		intra_period->pframes = in->pframes;
> +		intra_period->bframes = in->bframes;
> +		packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_period);
> +		break;
> +	}
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> index 34249fc0d047918c2463517b8303e30df3666b97..476177add1ec860d46d85960dd09617ad347f60a 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> @@ -155,6 +155,7 @@
>  #define HFI_PROPERTY_PARAM_VENC_LTRMODE				0x200501c
>  #define HFI_PROPERTY_PARAM_VENC_MAX_NUM_B_FRAMES		0x2005020
>  #define HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE			0x2006001
> +#define HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD			0x2006003

do we need to set HFI_PROPERTY_PARAM_VENC_MAX_NUM_B_FRAMES as well for
gen1? Please check.

>  #define HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME			0x2006009
>  #define HFI_PROPERTY_CONFIG_VENC_USELTRFRAME			0x200600a
>  #define HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER	0x2006008
> @@ -484,6 +485,11 @@ struct hfi_ltr_mark {
>  	u32 mark_frame;
>  };
>  
> +struct hfi_intra_period {
> +	u32 pframes;
> +	u32 bframes;
> +};
> +
>  struct hfi_event_data {
>  	u32 error;
>  	u32 height;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index c48dfb6d47734fadd4f2e4123c93560f55355b86..34deb32eb5be0899fee779ff99b3f4b8bd91529f 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -154,6 +154,8 @@ enum platform_inst_fw_cap_type {
>  	LTR_COUNT,
>  	USE_LTR,
>  	MARK_LTR,
> +	B_FRAME,
> +	INTRA_PERIOD,
>  	INST_FW_CAP_MAX,
>  };
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> index 13cee5f72a443b85136d30b41b589aeb0db8eb9a..b76f0ecaa721f3469bc63b7ff4ce5fc6ea19a8e1 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> @@ -177,7 +177,6 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
>  		.max = (1 << 16) - 1,
>  		.step_or_mask = 1,
>  		.value = 30,
> -		.set = iris_set_u32

what is being removed here and why?

>  	},
>  	{
>  		.cap_id = ENTROPY_MODE,
> @@ -279,6 +278,24 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
>  		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
>  		.set = iris_set_mark_ltr,
>  	},
> +	{
> +		.cap_id = B_FRAME,
> +		.min = 0,
> +		.max = 3,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +	},
> +	{
> +		.cap_id = INTRA_PERIOD,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD,
> +		.flags = CAP_FLAG_OUTPUT_PORT,
> +		.set = iris_set_intra_period,
> +	},
>  };
>  

>  static struct platform_inst_caps platform_inst_cap_sm8550 = {
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index 8139fefe40fe179ff7862bbca879ce94c71c1f89..4a854a4dab322eabb16a52b1cf816c18d78acc81 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -670,11 +670,15 @@ static u32 iris_vpu_enc_bin_size(struct iris_inst *inst)
>  
>  static inline u32 hfi_buffer_get_recon_count(struct iris_inst *inst)
>  {
> +	u32 bframe_count, ltr_count;
>  	u32 num_ref = 1;
> -	u32 ltr_count;
>  
> +	bframe_count = inst->fw_caps[B_FRAME].value;
>  	ltr_count = inst->fw_caps[LTR_COUNT].value;
>  
> +	if (bframe_count)
> +		num_ref = 2;

this would impact the scratch2 size calculation as well, please check if
this is as expected for scratch2.

Thanks,
Dikshita
> +
>  	if (ltr_count)
>  		num_ref = num_ref + ltr_count;
>  
> 

