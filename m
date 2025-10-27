Return-Path: <linux-media+bounces-45639-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06282C0C97A
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 10:15:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAACA1882F83
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 09:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE262F0686;
	Mon, 27 Oct 2025 09:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PRwHfYS1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7CF2264A7
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 09:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761556087; cv=none; b=dRcS/NN/k8DIFQZpaRLHp4PefZWvtZNoFnoyCTYbsOGOj6ASMWXBJaqYj/d8Mgj1HDHdkwpg9T9cyaOzscSkY5c1Wwj8f3NJ/TKVPXd8C5/KWSd+gz93emB4TMppizyuDmfan5YSk5+MQ8ffxGrVQ92e8GOZzYBNYPX7zTIJQzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761556087; c=relaxed/simple;
	bh=xaZy/gj16Beuz4L45VtLG5e24gzCwOGdymyIAcSww2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O9HTlEXByyg82AyDYC0xTPPL6sjY0Dt4oPT+JWqCwfo2VC6Fdr42sW0ryBbOA1WnS5CcRcek8wcxb4JenRX/MnK4uDNMhoWARXGGyf1khzhpzZFdiCcCBBoDmg4KJTPRHAANx1gw4i6QPK+WIlAb3C+734Qa18asStdinS5rqD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PRwHfYS1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R7Jt0C2059245
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 09:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e4Y1a+e599JZIO5suSb7imEw71m3XxSWFRXejVg4+6g=; b=PRwHfYS1w/Zq8YeX
	gEa1IpV5vr6wl6YUP/oGTkEcIyc8SzCGmSqTtbkSdWaWryzUNHUH1xRAsh89ae+w
	G/QHdrV55D+8fJhFJBnVKVtmjlZyG5+AyThG0JIfn49tpk6XAZu5k5l2S3XQhIe1
	p59f7mRPN23wA1g+4VG1zHm+F47cqxUB1MwKJu+xMeVjE3UUSCF/zFXgMqJ3VMj2
	zUUd+bRgnOBh/Q7OGkWai3SjerNQQ7mM7mtm4s3lz107nvpx+t9QUnTZszunlEPf
	OHoGcOkF6zVnbniu/nrFjWfjG8xcBwyYVoObFidmH9KnjQyBLBY3UJN7JFpJil2/
	GLs7Kw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a248p89jn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 09:08:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32ee157b9c9so3442715a91.2
        for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 02:08:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761556084; x=1762160884;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e4Y1a+e599JZIO5suSb7imEw71m3XxSWFRXejVg4+6g=;
        b=aQ52X7rY72UxqpLpbP1T9+6y6OSa/lRhvZtHXCoVQSxKfkO3F8pBxWo2oGe2NfTJS1
         HA7z7W4oKcJphI1V2sDVc0EpZF9jdHI4cZJ/4sZBD+6uAXldVSDgeltbTIQjT89qeX7f
         oMtWHM6P9xE/1Kc+qxF6tKhJRKMVNowYtsQTqgI1xn/hq2m1nRCf79YmNZFQiA9ejztE
         tAeG7GXQC5uJEtjon94AHUcCUR3xL3LucdgG5pGpE7mAc2WD5agcxk7Ivzicg4Q7yBGO
         S+r78oz/hmcH6+lnrPHXg6tNG6VchD/885+VRyqPEF3MwZA0yQ0pFkbsq63bS9SZB/Zy
         aUcg==
X-Gm-Message-State: AOJu0YwQDeQXYo4AT/XDZQ8FMyhsHFTRl1lpyXCyVhGOvRD96DHSU5D+
	iMiz7Z2hqrWAgTbYtj3YLUaXXQa7PrUP79vh5bM7EgnAcKi55K0bXiiNTRjdkmjFIFgJLT2rQWn
	BlFaLeD5KinE70v0dLkpXNYC+MGxSbD2hxY4ZOJwrRbhl0/oFT+pj8jseNjHLpb9e/w==
X-Gm-Gg: ASbGncuCox4TLB90TiFMnekniKQMnzXvBUx+bvMYmSnzANyBxGjcj2Qp9e1bSn2tFAr
	gBLsdd+9GEQQmGqd2qIfRIC+hdm5Lq8avIIwL8BtzvL/vL5yViBiBUpu4xGM1rrg0J9ydMDEP7O
	BppgTrcpRe76bts2UtK1hHjnQQxFTQ+sJH0sl7Gs/E7aFHV0bGJucA/Uwkc43uPy7Ln3fCBcWvC
	bY//+8VoyMMDIaGcD6HgfqTA/IvUVJuvS1Ia5+HXV1wGepmPxITnQwd0kb8z0S+NGD0OVk0Wyc9
	gth5ZFSeKGkMhoQUFHcERYdZiQsLujv/lixR+v5cSIfoNgOVI85V9ZYA6NFLmo8eYbbMqXWt7Nx
	tbnl7VZXO4D8Z1Yhjs4lneT78bXqYhPw=
X-Received: by 2002:a17:90b:3f8d:b0:32e:6fae:ba52 with SMTP id 98e67ed59e1d1-33bcf861b1amr45274326a91.6.1761556084099;
        Mon, 27 Oct 2025 02:08:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0/79wQGGq3i/2KRwCbvC13rn0zdVoPUj1sxcPuVD15ZoSzM0WOdn3jI17amdl/sfebNMkjQ==
X-Received: by 2002:a17:90b:3f8d:b0:32e:6fae:ba52 with SMTP id 98e67ed59e1d1-33bcf861b1amr45274288a91.6.1761556083591;
        Mon, 27 Oct 2025 02:08:03 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed70a83csm7668596a91.4.2025.10.27.02.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 02:08:03 -0700 (PDT)
Message-ID: <36543c8c-5a69-56ed-7d96-a3f5d7396b89@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 14:37:59 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 5/5] media: iris: Add internal buffer calculation for
 AV1 decoder
Content-Language: en-US
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20251017-av1_irisdecoder-v2-0-964a5478139e@oss.qualcomm.com>
 <20251017-av1_irisdecoder-v2-5-964a5478139e@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251017-av1_irisdecoder-v2-5-964a5478139e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Zvzg6t7G c=1 sm=1 tr=0 ts=68ff3674 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EzenAR4kRIeeF1N0nxAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA4NCBTYWx0ZWRfX0prYV0fQKZQ9
 82xy6cSbE2y9qGlqFGRneNL9IWz+Ip4ku4XDP75ejXvBh9Pu5/SCR8tJENWcq0N41kEvH5w+Q/C
 hvzHfyagV1LxKRNfX89Nkh6wKlNstul/KdaQ6ucJKKHZyjyockiIMDCdGWxhSZCOWrEYAYWSzkH
 /WpCJtxgL+7C8wKKrMOo23TGHhA91rHZYTLYhTdycYwzsuQk2CkW3ITeRf0LnMdMlfm3xUm8Gck
 lgdi1RxT8nhFjDPl3tPz9XvBhk8SLuOkBWNm2x6WxojzHif3Jq/gkLq99cR0VibeQ3Z8OZLjaRJ
 5mK4gV5MLk3sL3whg3GSL+nrerZwHWrKD8x+AKFH7ZIOCGGTL5kNoDgwDrM11i19XB86o3xGnbf
 qv4GvpQNoNJWWTNZbebPqJj03LCuMw==
X-Proofpoint-ORIG-GUID: loBDskazjM9flZSjYSgUrj9prG8AgJvA
X-Proofpoint-GUID: loBDskazjM9flZSjYSgUrj9prG8AgJvA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270084



On 10/18/2025 12:05 AM, Deepa Guthyappa Madivalara wrote:
> Implement internal buffer count and size calculations for AV1 decoder
> for all the buffer types required by the AV1 decoder, including BIN,
> COMV, PERSIST, LINE, and PARTIAL.
> 
> This ensures the hardware decoder has properly allocated memory for AV1
> decoding operations, enabling correct AV1 video playback.
> 
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.h     |   1 +
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 298 ++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.h | 116 ++++++++
>  3 files changed, 411 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
> index 5ef365d9236c7cbdee24a4614789b3191881968b..75bb767761824c4c02e0df9b765896cc093be333 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.h
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.h
> @@ -27,6 +27,7 @@ struct iris_inst;
>   * @BUF_SCRATCH_1: buffer to store decoding/encoding context data for HW
>   * @BUF_SCRATCH_2: buffer to store encoding context data for HW
>   * @BUF_VPSS: buffer to store VPSS context data for HW
> + * @BUF_PARTIAL: buffer for AV1 IBC data
>   * @BUF_TYPE_MAX: max buffer types
>   */
>  enum iris_buffer_type {
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index 4463be05ce165adef6b152eb0c155d2e6a7b3c36..e03ae7cfc9551dd2450b27d5d19ef1d23bba4c99 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -9,6 +9,17 @@
>  #include "iris_hfi_gen2_defines.h"
>  

<snip>

>  static u32 iris_vpu_dec_bin_size(struct iris_inst *inst)
>  {
>  	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
> @@ -472,6 +718,8 @@ static u32 iris_vpu_dec_bin_size(struct iris_inst *inst)
>  		return hfi_buffer_bin_h265d(width, height, num_vpp_pipes);
>  	else if (inst->codec == V4L2_PIX_FMT_VP9)
>  		return hfi_buffer_bin_vp9d(width, height, num_vpp_pipes);
> +	else if (inst->codec == V4L2_PIX_FMT_AV1)
> +		return hfi_buffer_bin_av1d(width, height, num_vpp_pipes);
>  
>  	return 0;
>  }
> @@ -487,18 +735,33 @@ static u32 iris_vpu_dec_comv_size(struct iris_inst *inst)
>  		return hfi_buffer_comv_h264d(width, height, num_comv);
>  	else if (inst->codec == V4L2_PIX_FMT_HEVC)
>  		return hfi_buffer_comv_h265d(width, height, num_comv);
> -
> +	else if (inst->codec == V4L2_PIX_FMT_AV1) {
> +		if (inst->fw_caps[DRAP].value)
> +			return 0;
> +		else
> +			return hfi_buffer_comv_av1d(width, height, num_comv);
> +	}

newline is required before return.

>  	return 0;
>  }
>  

<snip>

> +static u32 iris_vpu_dec_partial_size(struct iris_inst *inst)
> +{
> +	struct v4l2_format *f = inst->fmt_src;
> +	u32 height = f->fmt.pix_mp.height;
> +	u32 width = f->fmt.pix_mp.width;
> +
> +	return hfi_buffer_ibc_av1d(width, height);
> +}
> +
>  static inline
>  u32 hfi_buffer_comv_enc(u32 frame_width, u32 frame_height, u32 lcu_size,
>  			u32 num_recon, u32 standard)
> @@ -1414,7 +1688,9 @@ static int output_min_count(struct iris_inst *inst)
>  
>  	/* fw_min_count > 0 indicates reconfig event has already arrived */
>  	if (inst->fw_min_count) {
> -		if (iris_split_mode_enabled(inst) && inst->codec == V4L2_PIX_FMT_VP9)
> +		if (iris_split_mode_enabled(inst) &&
> +		    (inst->codec == V4L2_PIX_FMT_VP9 ||
> +		     inst->codec == V4L2_PIX_FMT_VP9))

This change doesn't make any sense, do you mean V4L2_PIX_FMT_AV1?

>  			return min_t(u32, 4, inst->fw_min_count);
>  		else
>  			return inst->fw_min_count;
> @@ -1422,6 +1698,8 @@ static int output_min_count(struct iris_inst *inst)
>  
>  	if (inst->codec == V4L2_PIX_FMT_VP9)
>  		output_min_count = 9;
> +	else if (inst->codec == V4L2_PIX_FMT_AV1)
> +		output_min_count = 11;
>  
>  	return output_min_count;
>  }
> @@ -1444,6 +1722,7 @@ u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
>  		{BUF_PERSIST,     iris_vpu_dec_persist_size         },
>  		{BUF_DPB,         iris_vpu_dec_dpb_size             },
>  		{BUF_SCRATCH_1,   iris_vpu_dec_scratch1_size        },
> +		{BUF_PARTIAL,     iris_vpu_dec_partial_size         },
>  	};
>  

