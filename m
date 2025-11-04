Return-Path: <linux-media+bounces-46241-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3788C2F560
	for <lists+linux-media@lfdr.de>; Tue, 04 Nov 2025 06:05:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCC08189C040
	for <lists+linux-media@lfdr.de>; Tue,  4 Nov 2025 05:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C98A2BE7B5;
	Tue,  4 Nov 2025 05:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p7LqwYB1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XV9cDdQ9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3E127E1A1
	for <linux-media@vger.kernel.org>; Tue,  4 Nov 2025 05:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762232718; cv=none; b=JpDtDhP1Hm+vAXzhi9MHsgDSjQ975cuXTi62nqpak5BEZIj62qFSZpXpnRchM2y/JmxsW8b8Lmcw8VyWxPbbFGylYZvSQ/l9t9RSujpNEqbs/lzoDgmB5UE9mPQbqkGBHZoKj79BA3Ws5/SEA5AwVr+Fq2o0o+2WaTyWHqNTBoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762232718; c=relaxed/simple;
	bh=5KxOHyiIhypJZX4aM3VJ3CV+lHcyJ3Aav/WgejwEmgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eJbtZzNmCVl6DH4ztu/fyAx7LZJlXLdzIf+KAE0TGeP9kUMLL5gUKMqhIeadrulvGgv1IeYuyp57Aduh8dgWd8uQ2J2KzXTnYYH+nwgRsUhNb/ZHVwY5V24K3FButP2VJEZHrZAfcJGMdDhpv0bWIxj7K2ZTS4WTIEwoIC9ruzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p7LqwYB1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XV9cDdQ9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A437A0F3729981
	for <linux-media@vger.kernel.org>; Tue, 4 Nov 2025 05:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3lrSI5zuo7WSHyyHIdvwvbcz1yXgCbVobzSvL8zws90=; b=p7LqwYB18YI7x+HJ
	R75HAS6x0+2WKgMClyOsyd+DrKle2qb80JsQ2lxR9s3iZFKilsrNspuyJ/SJwWWw
	iZKzRRurYX0s7yFV8855/aTV0NJ+5N0LUqVZDxeFdJ8HGYhSDvAUvUwToK0VWSeT
	AN6/uryzDmoq2pwdM2PXF8RuNx3t2FSOz0sAZzYajuSf+Xib0+ZaLG8vvh2yJ1l7
	Si0/K8+Qf8zOoOiQC5Wij+FrSdv+5idVeXFrvO3XNxc7poQPF+izL+fs7YGyUeF5
	n+sCmN9IgLAXvUiiHQF5FvMY686x3xi7qGnFAFixO4n5s/n9J7wng19cHPR4Kjee
	1hvz/w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70p89n7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 04 Nov 2025 05:05:15 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7900f597d08so4978929b3a.1
        for <linux-media@vger.kernel.org>; Mon, 03 Nov 2025 21:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762232714; x=1762837514; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3lrSI5zuo7WSHyyHIdvwvbcz1yXgCbVobzSvL8zws90=;
        b=XV9cDdQ9CHe1+jNsSEge3VhJmiZF+ZmysRjBFGDTX4Ir09muntptm4ycG9iZl4Ew7D
         dAcXVrpCPffh4y0LIJUAXlOchVOfzvlKjRjaGH/Dgl0PHez7eT4bJP2NJLXKGkcEmM3K
         5jbVmzsbutU5prUkPO824FW+8mFQm6MzkQ3pvc1jrXShvQHmMN/D9fY9Tgam7XiJauFs
         IYfS0ytfKbxzJzuZJkbh6IJScRzkyr6MgPIWkuD8Ms344M//r+EmEMpm44yDsnR+dHim
         SoeoTQIHDbQs8B+pS/gJqCe/Jx1wIQvTKFqTpPC6Db6repwBdORfdM7R/5hOykymjj8z
         9k3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762232714; x=1762837514;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3lrSI5zuo7WSHyyHIdvwvbcz1yXgCbVobzSvL8zws90=;
        b=WRts2qX8GBNMHr8Vus5m/UQQPMJzWf3OPUXmOVz1pOAtSejjB6sk9y65RbKA1/oV1U
         CY/ic2YIeJKH3CAjmoHHuMNLc/NjZE7LNaC5PWCP63nSfv7KIIPQr7WmgzZEML/BhvC4
         Vny9Ga4rcBiMYUqsx3kOzv+jQf/93CyRMghMtOJUzMjQjXIEFCDQrpL/w6Md9bMec0VY
         mnZBLKmcocE5FxS3ImvKUnuaI2E8WWqXDh2LCekM7X5LeWXJe2KmbqIeb9bID5G1TdUJ
         DO8xDoi79dW7OZIfeRHmBdwin1gzWaqR4cOTaB0pf8kH/1isOFxJ81eiK++b9vtuzwg+
         r/Uw==
X-Gm-Message-State: AOJu0YyLZkdfz+5zyzOVWwvaPwGGYWvH6e2qOsvNESNwmq4n2q8xDRHg
	55BKlpKLffs2KUk5Dlq6fNCCLQ2+6ctXuNCPjDGFCD3+8rxylCrHJdShpHgNf8Is+qEOybJUysL
	ekXp4qwhf2bUGQMroKgmJArpKl1E42X2uz/K4oh1AUq18xjY6N6vWPhJhAPfq+3OTlPLcdRchNA
	==
X-Gm-Gg: ASbGnct6iJeryr8xl+lrkFDVkOFre9uqidfeBhyhO5phRqlrd0oI8vG9y1ZcT8Tsjh5
	QbguEV2dP8u7Aa0dR87fFUQrsetTtSqgtAbBn8Z9YsIVfLAELOf9OIiuMhx4vgVShuoWUmcZJe+
	y6gvb0W6NNW4F7fx5NGWQFQ2AJ929+HT6uRwm4t2wtSuappR1M22Fw10/0nRAUjkKSV7YN95V79
	d5PPqmTpjpDDmVyHSJbldmQL2uYdgk2L/s0yUuQLY4eM8jm0tNwpc4Ml/MsHfnpdO002fJSHJ4x
	4GzF2yyMKINxo5WzDXYJ2sM5h6OF6hETq96IMz+tHMc1gUSNZoj1I+dilq7Q9BsiZxsH50UR+Nv
	/6X2Y1Ck0fBVoobAt0ToUSwNzYnsg8SA=
X-Received: by 2002:a05:6a00:a2a:b0:7a2:7633:740 with SMTP id d2e1a72fcca58-7a7794c4f08mr13787213b3a.20.1762232714252;
        Mon, 03 Nov 2025 21:05:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+Acv32pnYysk+4SpRCBa0UD/THrObfwhbxNkIAS24kesRTJsUsrL/mWKTK9YoPwXkDYv5xw==
X-Received: by 2002:a05:6a00:a2a:b0:7a2:7633:740 with SMTP id d2e1a72fcca58-7a7794c4f08mr13787183b3a.20.1762232713630;
        Mon, 03 Nov 2025 21:05:13 -0800 (PST)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd079276asm1338561b3a.0.2025.11.03.21.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 21:05:13 -0800 (PST)
Message-ID: <864b723f-cecf-3332-ee1c-d4b868b6e592@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 10:35:08 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 4/5] media: iris: Define AV1-specific platform
 capabilities and properties
Content-Language: en-US
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251103-av1d_stateful_v3-v4-0-33cc1eaa83f2@oss.qualcomm.com>
 <20251103-av1d_stateful_v3-v4-4-33cc1eaa83f2@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251103-av1d_stateful_v3-v4-4-33cc1eaa83f2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KJQzik7K_NXBXZeOx8TZ8D0JlBRAkXr-
X-Proofpoint-GUID: KJQzik7K_NXBXZeOx8TZ8D0JlBRAkXr-
X-Authority-Analysis: v=2.4 cv=AsnjHe9P c=1 sm=1 tr=0 ts=6909898b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=FA4pU6PlB5ITOdvtZjkA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDAzOSBTYWx0ZWRfX6P68TUASXV1O
 /ohzc9LQkcWFNmezHpntATw4J6i/12JLPf62fiWR3n+xZ6jGRUjccGM2IS6jxuGUuMuQVTG7OXW
 gw/3u7YDlkpHNFNgnDdGmc+KHZ6RA6gsL/zhCy0xjNHD3NsmCeTOq7IicmRZj/C/CwF5pPNihka
 krUIrpSkYytESXq8rc5BjHG+7h2ILdNhStRF63USA1v2zb75cftFzC75dy1b2qxVRuaqoZ+nqos
 y4i+P3JxTUB3ne071pZkmtRo5BA2Z5yxTS1U3WmlCnSO/XsoAVoGa8tBRrf37ZGDEGUjnLbSAVI
 JCRfmxKuviN9bwTbFGsuqN0PYojRBGQb4h2DUuwN75Hx5VagyKOy4+wDNi+G+8knRfSDkuQb3UI
 3d5xiU5HLQs+Bbn0NWG82lYyjFJ14Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040039



On 11/3/2025 6:54 PM, Deepa Guthyappa Madivalara wrote:
> Defining platform specific capabilities specific to AV1 decoder.
> Set and subscribe to manadatory properties to firmware for AV1.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.h     |   1 +
>  drivers/media/platform/qcom/iris/iris_ctrls.c      |   8 ++
>  drivers/media/platform/qcom/iris/iris_hfi_common.h |   3 +
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     |  85 ++++++++++++++-
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  10 +-
>  .../platform/qcom/iris/iris_hfi_gen2_response.c    |  22 ++++
>  .../platform/qcom/iris/iris_platform_common.h      |  11 ++
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 119 ++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_vidc.c       |   1 +
>  9 files changed, 256 insertions(+), 4 deletions(-)

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
> index 325d30fce5c99185b61ff989fbfd4de9a56762b2..5ef365d9236c7cbdee24a4614789b3191881968b 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.h
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.h
> @@ -42,6 +42,7 @@ enum iris_buffer_type {
>  	BUF_SCRATCH_1,
>  	BUF_SCRATCH_2,
>  	BUF_VPSS,
> +	BUF_PARTIAL,
>  	BUF_TYPE_MAX,
>  };
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 754a5ad718bc37630bb861012301df7a2e7342a1..620c7e1bd273e25febd8ca70dd1dcfb0b862692b 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -98,6 +98,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>  		return B_FRAME_QP_H264;
>  	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP:
>  		return B_FRAME_QP_HEVC;
> +	case V4L2_CID_MPEG_VIDEO_AV1_PROFILE:
> +		return PROFILE_AV1;
> +	case V4L2_CID_MPEG_VIDEO_AV1_LEVEL:
> +		return LEVEL_AV1;
>  	default:
>  		return INST_FW_CAP_MAX;
>  	}
> @@ -185,6 +189,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>  		return V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP;
>  	case B_FRAME_QP_HEVC:
>  		return V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP;
> +	case PROFILE_AV1:
> +		return V4L2_CID_MPEG_VIDEO_AV1_PROFILE;
> +	case LEVEL_AV1:
> +		return V4L2_CID_MPEG_VIDEO_AV1_LEVEL;
>  	default:
>  		return 0;
>  	}
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> index b51471fb32c70acee44c37f8e9dce0c6bc0b6ccc..3edb5ae582b49bea2e2408c4a5cfc0a742adc05f 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> @@ -141,6 +141,9 @@ struct hfi_subscription_params {
>  	u32	profile;
>  	u32	level;
>  	u32	tier;
> +	u32	drap;
> +	u32	film_grain;
> +	u32	super_block;
>  };
>  
>  u32 iris_hfi_get_v4l2_color_primaries(u32 hfi_primaries);
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 6a772db2ec33fb002d8884753a41dc98b3a8439d..b00594bb3c8871b80a5d7c0e4f4a84d983fd77e8 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -10,6 +10,7 @@
>  
>  #define UNSPECIFIED_COLOR_FORMAT 5
>  #define NUM_SYS_INIT_PACKETS 8
> +#define NUM_COMV_AV1 18
>  
>  #define SYS_INIT_PKT_SIZE (sizeof(struct iris_hfi_header) + \
>  	NUM_SYS_INIT_PACKETS * (sizeof(struct iris_hfi_packet) + sizeof(u32)))
> @@ -121,6 +122,7 @@ static u32 iris_hfi_gen2_get_port_from_buf_type(struct iris_inst *inst,
>  		case BUF_COMV:
>  		case BUF_NON_COMV:
>  		case BUF_LINE:
> +		case BUF_PARTIAL:
>  			return HFI_PORT_BITSTREAM;
>  		case BUF_OUTPUT:
>  		case BUF_DPB:
> @@ -380,6 +382,9 @@ static int iris_hfi_gen2_set_profile(struct iris_inst *inst, u32 plane)
>  	case V4L2_PIX_FMT_H264:
>  		profile = inst->fw_caps[PROFILE_H264].value;
>  		break;
> +	case V4L2_PIX_FMT_AV1:
> +		profile = inst->fw_caps[PROFILE_AV1].value;
> +		break;
>  	}
>  
>  	inst_hfi_gen2->src_subcr_params.profile = profile;
> @@ -409,6 +414,9 @@ static int iris_hfi_gen2_set_level(struct iris_inst *inst, u32 plane)
>  	case V4L2_PIX_FMT_H264:
>  		level = inst->fw_caps[LEVEL_H264].value;
>  		break;
> +	case V4L2_PIX_FMT_AV1:
> +		level = inst->fw_caps[LEVEL_AV1].value;
> +		break;
>  	}
>  
>  	inst_hfi_gen2->src_subcr_params.level = level;
> @@ -496,10 +504,12 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
>  
>  static int iris_hfi_gen2_set_tier(struct iris_inst *inst, u32 plane)
>  {
> -	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>  	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>  	u32 tier = inst->fw_caps[TIER].value;
>  
> +	tier = (inst->codec == V4L2_PIX_FMT_AV1) ? inst->fw_caps[TIER_AV1].value :
> +							inst->fw_caps[TIER].value;
>  	inst_hfi_gen2->src_subcr_params.tier = tier;
>  
>  	return iris_hfi_gen2_session_set_property(inst,
> @@ -525,6 +535,40 @@ static int iris_hfi_gen2_set_frame_rate(struct iris_inst *inst, u32 plane)
>  						  sizeof(u32));
>  }
>  
> +static int iris_hfi_gen2_set_film_grain(struct iris_inst *inst, u32 plane)
> +{
> +	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> +	u32 film_grain = inst->fw_caps[FILM_GRAIN].value;
> +
> +	inst_hfi_gen2->src_subcr_params.film_grain = film_grain;
> +
> +	return iris_hfi_gen2_session_set_property(inst,
> +						  HFI_PROP_AV1_FILM_GRAIN_PRESENT,
> +						  HFI_HOST_FLAGS_NONE,
> +						  port,
> +						  HFI_PAYLOAD_U32_ENUM,
> +						  &film_grain,
> +						  sizeof(u32));
> +}
> +
> +static int iris_hfi_gen2_set_super_block(struct iris_inst *inst, u32 plane)
> +{
> +	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> +	u32 super_block = inst->fw_caps[SUPER_BLOCK].value;
> +
> +	inst_hfi_gen2->src_subcr_params.super_block = super_block;
> +
> +	return iris_hfi_gen2_session_set_property(inst,
> +						  HFI_PROP_AV1_SUPER_BLOCK_ENABLED,
> +						  HFI_HOST_FLAGS_NONE,
> +						  port,
> +						  HFI_PAYLOAD_U32_ENUM,
> +						  &super_block,
> +						  sizeof(u32));
> +}
> +
>  static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 plane)
>  {
>  	const struct iris_platform_data *pdata = inst->core->iris_platform_data;
> @@ -548,6 +592,9 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
>  		{HFI_PROP_LINEAR_STRIDE_SCANLINE,     iris_hfi_gen2_set_linear_stride_scanline },
>  		{HFI_PROP_TIER,                       iris_hfi_gen2_set_tier                   },
>  		{HFI_PROP_FRAME_RATE,                 iris_hfi_gen2_set_frame_rate             },
> +		{HFI_PROP_AV1_FILM_GRAIN_PRESENT,     iris_hfi_gen2_set_film_grain             },
> +		{HFI_PROP_AV1_SUPER_BLOCK_ENABLED,    iris_hfi_gen2_set_super_block            },
> +		{HFI_PROP_OPB_ENABLE,                 iris_hfi_gen2_set_opb_enable             },
>  	};
>  
>  	if (inst->domain == DECODER) {
> @@ -561,6 +608,9 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
>  			} else if (inst->codec == V4L2_PIX_FMT_VP9) {
>  				config_params = pdata->dec_input_config_params_vp9;
>  				config_params_size = pdata->dec_input_config_params_vp9_size;
> +			} else if (inst->codec == V4L2_PIX_FMT_AV1) {
> +				config_params = pdata->dec_input_config_params_av1;
> +				config_params_size = pdata->dec_input_config_params_av1_size;
>  			} else {
>  				return -EINVAL;
>  			}
> @@ -615,6 +665,9 @@ static int iris_hfi_gen2_session_set_codec(struct iris_inst *inst)
>  		break;
>  	case V4L2_PIX_FMT_VP9:
>  		codec = HFI_CODEC_DECODE_VP9;
> +		break;
> +	case V4L2_PIX_FMT_AV1:
> +		codec = HFI_CODEC_DECODE_AV1;
>  	}
>  
>  	iris_hfi_gen2_packet_session_property(inst,
> @@ -780,6 +833,11 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
>  		change_param_size =
>  			core->iris_platform_data->dec_input_config_params_vp9_size;
>  		break;
> +	case V4L2_PIX_FMT_AV1:
> +		change_param = core->iris_platform_data->dec_input_config_params_av1;
> +		change_param_size =
> +			core->iris_platform_data->dec_input_config_params_av1_size;
> +		break;
>  	}
>  
>  	payload[0] = HFI_MODE_PORT_SETTINGS_CHANGE;
> @@ -862,6 +920,16 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
>  				payload_size = sizeof(u32);
>  				payload_type = HFI_PAYLOAD_U32;
>  				break;
> +			case HFI_PROP_AV1_FILM_GRAIN_PRESENT:
> +				payload[0] = subsc_params.film_grain;
> +				payload_size = sizeof(u32);
> +				payload_type = HFI_PAYLOAD_U32;
> +				break;
> +			case HFI_PROP_AV1_SUPER_BLOCK_ENABLED:
> +				payload[0] = subsc_params.super_block;
> +				payload_size = sizeof(u32);
> +				payload_type = HFI_PAYLOAD_U32;
> +				break;
>  			default:
>  				prop_type = 0;
>  				ret = -EINVAL;
> @@ -917,6 +985,11 @@ static int iris_hfi_gen2_subscribe_property(struct iris_inst *inst, u32 plane)
>  			subscribe_prop_size =
>  				core->iris_platform_data->dec_output_prop_vp9_size;
>  			break;
> +		case V4L2_PIX_FMT_AV1:
> +			subcribe_prop = core->iris_platform_data->dec_output_prop_av1;
> +			subscribe_prop_size =
> +				core->iris_platform_data->dec_output_prop_av1_size;
> +			break;
>  		}
>  	}
>  
> @@ -1092,6 +1165,8 @@ static u32 iris_hfi_gen2_buf_type_from_driver(u32 domain, enum iris_buffer_type
>  		return HFI_BUFFER_ARP;
>  	case BUF_VPSS:
>  		return HFI_BUFFER_VPSS;
> +	case BUF_PARTIAL:
> +		return HFI_BUFFER_PARTIAL_DATA;
>  	default:
>  		return 0;
>  	}
> @@ -1104,7 +1179,13 @@ static int iris_set_num_comv(struct iris_inst *inst)
>  	u32 num_comv;
>  
>  	caps = core->iris_platform_data->inst_caps;
> -	num_comv = caps->num_comv;
> +
> +	/*
> +	 * AV1 needs more comv buffers than other codecs.
> +	 * Update accordingly.
> +	 */
> +	num_comv = (inst->codec == V4L2_PIX_FMT_AV1) ?
> +				NUM_COMV_AV1 : caps->num_comv;
>  
>  	return core->hfi_ops->session_set_property(inst,
>  						   HFI_PROP_COMV_BUFFER_COUNT,
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index 3d56f257bc5620aacec2bb7e11253dc7c83b7db9..12b4c6517bf094e3e98332a1b2b70ac5a349b863 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -89,10 +89,18 @@ enum hfi_seq_header_mode {
>  #define HFI_PROP_DEC_START_FROM_RAP_FRAME	0x03000169
>  #define HFI_PROP_NO_OUTPUT			0x0300016a
>  #define HFI_PROP_BUFFER_MARK			0x0300016c
> +#define HFI_PROP_WORST_COMPRESSION_RATIO	0x03000174
> +#define HFI_PROP_WORST_COMPLEXITY_FACTOR	0x03000175
>  #define HFI_PROP_RAW_RESOLUTION		0x03000178
>  #define HFI_PROP_TOTAL_PEAK_BITRATE		0x0300017C
> -#define HFI_PROP_OPB_ENABLE			0x03000184
> +#define HFI_PROP_AV1_FILM_GRAIN_PRESENT		0x03000180
> +#define HFI_PROP_AV1_SUPER_BLOCK_ENABLED	0x03000181
> +#define HFI_PROP_AV1_OP_POINT				0x03000182
> +#define HFI_PROP_OPB_ENABLE                 0x03000184
> +#define HFI_PROP_AV1_TILE_ROWS_COLUMNS      0x03000187
> +#define HFI_PROP_AV1_DRAP_CONFIG            0x03000189
>  #define HFI_PROP_COMV_BUFFER_COUNT		0x03000193
> +#define HFI_PROP_AV1_UNIFORM_TILE_SPACING	0x03000197
>  #define HFI_PROP_END				0x03FFFFFF
>  
>  #define HFI_SESSION_ERROR_BEGIN			0x04000000
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 2f1f118eae4f6462ab1aa1d16844b34e6e699f1e..eb3373f0ad4a1b26fb847db02449ec8d8cb3bdbb 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -54,6 +54,8 @@ static u32 iris_hfi_gen2_buf_type_to_driver(struct iris_inst *inst,
>  			return BUF_SCRATCH_2;
>  	case HFI_BUFFER_PERSIST:
>  		return BUF_PERSIST;
> +	case HFI_BUFFER_PARTIAL_DATA:
> +		return BUF_PARTIAL;
>  	default:
>  		return 0;
>  	}
> @@ -72,6 +74,7 @@ static bool iris_hfi_gen2_is_valid_hfi_buffer_type(u32 buffer_type)
>  	case HFI_BUFFER_DPB:
>  	case HFI_BUFFER_PERSIST:
>  	case HFI_BUFFER_VPSS:
> +	case HFI_BUFFER_PARTIAL_DATA:
>  		return true;
>  	default:
>  		return false;
> @@ -596,6 +599,10 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>  		inst->fw_caps[PROFILE_H264].value = subsc_params.profile;
>  		inst->fw_caps[LEVEL_H264].value = subsc_params.level;
>  		break;
> +	case V4L2_PIX_FMT_AV1:
> +		inst->fw_caps[PROFILE_AV1].value = subsc_params.profile;
> +		inst->fw_caps[LEVEL_AV1].value = subsc_params.level;
> +		break;
>  	}
>  
>  	inst->fw_caps[POC].value = subsc_params.pic_order_cnt;
> @@ -608,6 +615,11 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>  		iris_inst_change_state(inst, IRIS_INST_ERROR);
>  	}
>  
> +	if (inst->codec == V4L2_PIX_FMT_AV1) {
> +		inst->fw_caps[FILM_GRAIN].value = subsc_params.film_grain;
> +		inst->fw_caps[SUPER_BLOCK].value = subsc_params.super_block;
> +	}
> +
>  	inst->fw_min_count = subsc_params.fw_min_count;
>  	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
>  	inst->buffers[BUF_OUTPUT].size = pixmp_op->plane_fmt[0].sizeimage;
> @@ -711,6 +723,12 @@ static int iris_hfi_gen2_handle_session_property(struct iris_inst *inst,
>  	case HFI_PROP_NO_OUTPUT:
>  		inst_hfi_gen2->hfi_frame_info.no_output = 1;
>  		break;
> +	case HFI_PROP_AV1_FILM_GRAIN_PRESENT:
> +		inst_hfi_gen2->src_subcr_params.film_grain = pkt->payload[0];
> +		break;
> +	case HFI_PROP_AV1_SUPER_BLOCK_ENABLED:
> +		inst_hfi_gen2->src_subcr_params.super_block = pkt->payload[0];
> +		break;
>  	case HFI_PROP_QUALITY_MODE:
>  	case HFI_PROP_STAGE:
>  	case HFI_PROP_PIPE:
> @@ -841,6 +859,10 @@ static void iris_hfi_gen2_init_src_change_param(struct iris_inst *inst)
>  		subsc_params->profile = inst->fw_caps[PROFILE_H264].value;
>  		subsc_params->level = inst->fw_caps[LEVEL_H264].value;
>  		break;
> +	case V4L2_PIX_FMT_AV1:
> +		subsc_params->profile = inst->fw_caps[PROFILE_AV1].value;
> +		subsc_params->level = inst->fw_caps[LEVEL_AV1].value;
> +		break;
>  	}
>  
>  	subsc_params->pic_order_cnt = inst->fw_caps[POC].value;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 9aca70b4c0690f0d8d799e2a9976bd20d6bb8c94..9b9eccc639338e617ee859993de5efa0fce6ae74 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -100,6 +100,13 @@ enum platform_inst_fw_cap_type {
>  	LEVEL_H264,
>  	LEVEL_HEVC,
>  	LEVEL_VP9,
> +	PROFILE_AV1,
> +	LEVEL_AV1,
> +	TIER_AV1,
> +	DRAP,
> +	FILM_GRAIN,
> +	SUPER_BLOCK,
> +	ENH_LAYER_COUNT,
>  	INPUT_BUF_HOST_MAX_COUNT,
>  	OUTPUT_BUF_HOST_MAX_COUNT,
>  	STAGE,
> @@ -237,6 +244,8 @@ struct iris_platform_data {
>  	unsigned int dec_input_config_params_hevc_size;
>  	const u32 *dec_input_config_params_vp9;
>  	unsigned int dec_input_config_params_vp9_size;
> +	const u32 *dec_input_config_params_av1;
> +	unsigned int dec_input_config_params_av1_size;
>  	const u32 *dec_output_config_params;
>  	unsigned int dec_output_config_params_size;
>  	const u32 *enc_input_config_params;
> @@ -251,6 +260,8 @@ struct iris_platform_data {
>  	unsigned int dec_output_prop_hevc_size;
>  	const u32 *dec_output_prop_vp9;
>  	unsigned int dec_output_prop_vp9_size;
> +	const u32 *dec_output_prop_av1;
> +	unsigned int dec_output_prop_av1_size;
>  	const u32 *dec_ip_int_buf_tbl;
>  	unsigned int dec_ip_int_buf_tbl_size;
>  	const u32 *dec_op_int_buf_tbl;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 3b61723dbf27e9ba8d427686e44cf048a0ab7c5b..58ef29bc31aa8b907a09b77087475a34b77e9654 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -64,6 +64,16 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>  		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>  		.set = iris_set_u32_enum,
>  	},
> +	{
> +		.cap_id = PROFILE_AV1,
> +		.min = V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN,
> +		.max = V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN),
> +		.value = V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN,
> +		.hfi_id = HFI_PROP_PROFILE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_u32_enum,
> +	},
>  	{
>  		.cap_id = PROFILE_VP9,
>  		.min = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
> @@ -147,6 +157,33 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>  		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>  		.set = iris_set_u32_enum,
>  	},
> +	{
> +		.cap_id = LEVEL_AV1,
> +		.min = V4L2_MPEG_VIDEO_AV1_LEVEL_2_0,
> +		.max = V4L2_MPEG_VIDEO_AV1_LEVEL_6_1,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_2_0) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_2_1) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_2_2) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_2_3) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_3_0) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_3_1) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_3_2) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_3_3) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_4_0) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_4_1) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_4_2) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_4_3) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_5_0) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_5_1) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_5_2) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_5_3) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_6_0) |
> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_6_1),
> +		.value = V4L2_MPEG_VIDEO_AV1_LEVEL_6_1,
> +		.hfi_id = HFI_PROP_LEVEL,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_u32_enum,
> +	},
>  	{
>  		.cap_id = TIER,
>  		.min = V4L2_MPEG_VIDEO_HEVC_TIER_MAIN,
> @@ -158,6 +195,53 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>  		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>  		.set = iris_set_u32_enum,
>  	},
> +	{
> +		.cap_id = TIER_AV1,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_TIER,
> +		.flags = CAP_FLAG_INPUT_PORT,
> +		.set = iris_set_u32,
> +	},
> +	{
> +		.cap_id = DRAP,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_AV1_DRAP_CONFIG,
> +		.flags = CAP_FLAG_INPUT_PORT,
> +		.set = iris_set_u32,
> +	},
> +	{
> +		.cap_id = FILM_GRAIN,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_AV1_FILM_GRAIN_PRESENT,
> +		.flags = CAP_FLAG_VOLATILE,
> +	},
> +	{
> +		.cap_id = SUPER_BLOCK,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_AV1_SUPER_BLOCK_ENABLED,
> +	},
> +	{
> +		.cap_id = ENH_LAYER_COUNT,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_AV1_OP_POINT,
> +		.flags = CAP_FLAG_INPUT_PORT,
> +		.set = iris_set_u32,
> +	},
>  	{
>  		.cap_id = INPUT_BUF_HOST_MAX_COUNT,
>  		.min = DEFAULT_MAX_HOST_BUF_COUNT,
> @@ -701,6 +785,19 @@ static const u32 sm8550_vdec_input_config_param_vp9[] = {
>  	HFI_PROP_LEVEL,
>  };
>  
> +static const u32 sm8550_vdec_input_config_param_av1[] = {
> +	HFI_PROP_BITSTREAM_RESOLUTION,
> +	HFI_PROP_CROP_OFFSETS,
> +	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
> +	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
> +	HFI_PROP_PROFILE,
> +	HFI_PROP_LEVEL,
> +	HFI_PROP_TIER,
> +	HFI_PROP_AV1_FILM_GRAIN_PRESENT,
> +	HFI_PROP_AV1_SUPER_BLOCK_ENABLED,
> +	HFI_PROP_SIGNAL_COLOR_INFO,
> +};
> +
>  static const u32 sm8550_venc_input_config_params[] = {
>  	HFI_PROP_COLOR_FORMAT,
>  	HFI_PROP_RAW_RESOLUTION,
> @@ -738,11 +835,18 @@ static const u32 sm8550_vdec_subscribe_output_properties_vp9[] = {
>  	HFI_PROP_PICTURE_TYPE,
>  };
>  
> +static const u32 sm8550_vdec_subscribe_output_properties_av1[] = {
> +	HFI_PROP_PICTURE_TYPE,
> +	HFI_PROP_WORST_COMPRESSION_RATIO,
> +	HFI_PROP_WORST_COMPLEXITY_FACTOR,
> +};
> +
>  static const u32 sm8550_dec_ip_int_buf_tbl[] = {
>  	BUF_BIN,
>  	BUF_COMV,
>  	BUF_NON_COMV,
>  	BUF_LINE,
> +	BUF_PARTIAL,
>  };
>  
>  static const u32 sm8550_dec_op_int_buf_tbl[] = {
> @@ -807,11 +911,14 @@ struct iris_platform_data sm8550_data = {
>  		sm8550_vdec_input_config_param_vp9,
>  	.dec_input_config_params_vp9_size =
>  		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
> +	.dec_input_config_params_av1 =
> +		sm8550_vdec_input_config_param_av1,
> +	.dec_input_config_params_av1_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
>  	.dec_output_config_params =
>  		sm8550_vdec_output_config_params,
>  	.dec_output_config_params_size =
>  		ARRAY_SIZE(sm8550_vdec_output_config_params),
> -
>  	.enc_input_config_params =
>  		sm8550_venc_input_config_params,
>  	.enc_input_config_params_size =
> @@ -832,6 +939,9 @@ struct iris_platform_data sm8550_data = {
>  	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
>  	.dec_output_prop_vp9_size =
>  		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
> +	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
> +	.dec_output_prop_av1_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
>  
>  	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>  	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
> @@ -901,6 +1011,10 @@ struct iris_platform_data sm8650_data = {
>  		sm8550_vdec_input_config_param_vp9,
>  	.dec_input_config_params_vp9_size =
>  		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
> +	.dec_input_config_params_av1 =
> +		sm8550_vdec_input_config_param_av1,
> +	.dec_input_config_params_av1_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
>  	.dec_output_config_params =
>  		sm8550_vdec_output_config_params,
>  	.dec_output_config_params_size =
> @@ -926,6 +1040,9 @@ struct iris_platform_data sm8650_data = {
>  	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
>  	.dec_output_prop_vp9_size =
>  		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
> +	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
> +	.dec_output_prop_av1_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
>  
>  	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>  	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index d38d0f6961cd5cb9929e2aecbec7353dcc2d4a7d..05eec18f937a51d3c081d0f98a8ffa6bbd30d166 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -178,6 +178,7 @@ int iris_open(struct file *filp)
>  	INIT_LIST_HEAD(&inst->buffers[BUF_SCRATCH_1].list);
>  	INIT_LIST_HEAD(&inst->buffers[BUF_SCRATCH_2].list);
>  	INIT_LIST_HEAD(&inst->buffers[BUF_VPSS].list);
> +	INIT_LIST_HEAD(&inst->buffers[BUF_PARTIAL].list);
>  	init_completion(&inst->completion);
>  	init_completion(&inst->flush_completion);
>  
> 

