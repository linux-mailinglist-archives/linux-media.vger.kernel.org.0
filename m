Return-Path: <linux-media+bounces-51023-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F27F9D3A395
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 10:46:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D315630581EC
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 09:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29473563F8;
	Mon, 19 Jan 2026 09:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aMFNfIIz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jMeQ0pO4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14D9356A24
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 09:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768815908; cv=none; b=KvoEtg4y/fJsvFxg8ys9KIFr3dUlpEGTKOi1YWPctwbdl7enSA4vKAbTJzAXa1puKZA8nL2XiF+7OJfHikbtVtZEYhaECJc00liNYyv3YSfKP9qH/yGvrsxS+00QW8RDrWGOwj4qrw3z+2B8yQMOt1jHoIxYh7CBOL8Hf+pkJ2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768815908; c=relaxed/simple;
	bh=Eky4zJKJoTQ3zm8sUP/KZ+U0jQvyt7HWXjAmamgp+aU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=luui04Pnm2ig5T1e0WYbOCvL2YZ1G9diBIeVFTY62keSGUSOIB77tq4mVA9joh+JNGOculQCWTwQ6YlNiKPORP3st0ZIz8dByz7sm0KATYKsM3y35LX+Y5TP0hWIoa495q89ekrKmj22tQMYV47GSFEGsxGUHhSr4VAy3AqVf3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aMFNfIIz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jMeQ0pO4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J91DRW1150083
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 09:45:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l755jNiGbFC3lmwA6wLPzJTW9A6JK4qf69307aSR/i8=; b=aMFNfIIzom2Eazmr
	W9WyBcbXyr8XKQrNVoRP572J4IIlJIkAVljMHbD98GhNRTCaod5nGyXJGOvDRB8V
	k5pU+39ZjBOOp0dVqhms7zI+p6AJyrUaRiJEHxUtuCvC5+uPTgyu5z4tdmivCejH
	77sXu7zTapCiG6lNeqsJZtDD/jzamAeVmBD68m8fmZT4doKwva7B7PwjBaHQUTi7
	hjuBlSuJVgaTzAcHJBPgZeBADYAu/phoHdS4fBuhYgmjteKkMxpqmOuexsEq/eYX
	N88EOCtbzGtw8RHjuAQgPW9asQb3gxm+8mWXj2/ObrmGzYNzWSANlvs2QyL7Nzzz
	14HJPw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br04e4x9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 09:45:03 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c314af2d4so3037139a91.3
        for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 01:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768815903; x=1769420703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l755jNiGbFC3lmwA6wLPzJTW9A6JK4qf69307aSR/i8=;
        b=jMeQ0pO42o7BPALnZszmNk7i8PY4+SqYGLwIyOBna2pum80MC6jCQL6x8wUiy0Q2pJ
         5dSGo7ZRfASSodj3isbDTAkywrlNAk1KzAw0CeSszo9NV7Bmn3r9E5JAQgwB2LwxP/pW
         nBfNcNezLnR85bB9hf/cICJ5ltgGTsJlVBBeaUjaqBIxEE7OLgJJUX8qaunTy+K0LxNC
         SIMG1cr/VZnWj5PTw4Vq5RYpuRmIk0xjH+r+H3RVLZo5UqKhhqxi56QQjII6We6LKEY/
         CPgEv5u9lKxDyxIPKA6UNxDWuCVH/POmKJl6sR9EfIPwAuwcSqK7DQrwt8/I+l+fRr9f
         CTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768815903; x=1769420703;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l755jNiGbFC3lmwA6wLPzJTW9A6JK4qf69307aSR/i8=;
        b=aPCmqXhFGdaPuoxCOwihoXMIOu02/tILqGCoI1gde7W0+SKVM6kEYPI8RjQIVoMTvu
         HhY9CEMoh2Y6PU0/kL9tyiR6A1wvl9HtQtG80ZgyDK8QE2QaFYxe5WGy1JUh6p+N151E
         MT3YJ5FjzWam5KpNMQaHC0YBlDCHlBMWPo4E+AN9Jt3J4jU4CMJGRCwy5skZEIB2ISI3
         a9/PoG9un/a0zyMu2WIGWKwIFtiTUAHOomwKJtCCv5mFpoO4rBQnNpgkwUlAVvieTHRp
         AFKq9vDMreOHP6fApDk/FV0yb04NeqHKBMyhei2q5ONKv9NxvM9mT84c+YfqmnH8jXgG
         KhKA==
X-Forwarded-Encrypted: i=1; AJvYcCWtVOKFbsHtOu03X7+qrSgtyHDiDZeD+DHyLUrd1/1CwdlZ13kKPpTih3sh1/yDJCicAqa2S0P17gn/gw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0txGoLRbMtkda6YLeEJ2O4ejyz3BLybvXn8DGCQeUHMUso7YY
	UsKWIpF0o6KehYPbu6tBxE+iABeS5rj1eG8OYEnv36PacjfLAm1RNeCodgXo+8GzUzEstqTCbwn
	+++ce/s4ZJEB9SGsiKdXx8jzjPx3BGIjV7gjb96mWzMgdtf++W0wN7egmLNa99xwPSQ==
X-Gm-Gg: AZuq6aLfOKESdQ7PLR4Ws6Xh3EMpgUiw2T2C49f286JDdG3ahvHj/l2/CpVQAT40G+3
	m3Ce3o/TiOT5dKM38bW+ESg4cqP+1y0fGbrJsn/J2lFIREJPZmykH78PKiMgP89sqH7dtba7FBb
	IZcOkIc29LozV4v7u3IQ1is4viVA515Y6HuXjo/CBP2C6SDx1d7ZkQX474VL3oOJF1kALnnmZnf
	v6xqwzK7QQT9KTtrf0eD0Bzwf9sy44rDrvALg5QNkHfRiq5wR2gpDhY2+glt4eZfwnaVhU35o8S
	+ld2sDthUDwCsTBN81G9u/aWzs1ZCDlUB7yKFpu42bHzG0FghI+rTDJ+8ZDLvCQ2tiaraNH4BfN
	WI2ItPv0AktxELhgNUCJnFCyqj4wRm+GnJO1/27LtsvfD
X-Received: by 2002:a17:90b:33cb:b0:343:a631:28a8 with SMTP id 98e67ed59e1d1-3527329c911mr9818550a91.37.1768815902950;
        Mon, 19 Jan 2026 01:45:02 -0800 (PST)
X-Received: by 2002:a17:90b:33cb:b0:343:a631:28a8 with SMTP id 98e67ed59e1d1-3527329c911mr9818517a91.37.1768815902343;
        Mon, 19 Jan 2026 01:45:02 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352677c90easm11181982a91.4.2026.01.19.01.44.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 01:45:02 -0800 (PST)
Message-ID: <d1e513b4-3333-aa0a-410d-5ca6b5056a57@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 15:14:57 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 6/6] media: qcom: iris: Simplify COMV size calculation
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260109-batch2_iris_encoder_enhancements-v3-0-196855ef32ba@oss.qualcomm.com>
 <20260109-batch2_iris_encoder_enhancements-v3-6-196855ef32ba@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260109-batch2_iris_encoder_enhancements-v3-6-196855ef32ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J5OnLQnS c=1 sm=1 tr=0 ts=696dfd1f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=veCZvnjz67tEVBlp6j4A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA3OSBTYWx0ZWRfX4B0AMYweefBH
 VmSExkj21p4XW3A8ap4t+tZhqxUlzAvZm3ELtt2t3E+s9Ofks1b7zYQCabLqXa/wgHgSJEv0GIM
 7bvyYIgVEHPOZAASkSsjcp6iHjBY5fmHJVGfMUxUu4rCDj/kHYQ+EnNGO0Xe28Oi8Qmv+8lAfPY
 O2Rh2vjk1uo4tLr3g8DRQrZ41sMhqDI1L3wN7Nhf0zoazqcI6jFuX0rZK0XCTiqKiVl5rB5HaCc
 Rz3/DsIOJ9gPFpxlbbYZm4u/sTfCHxhsu4ZG+AAG7mdBMlrvSpmVJ2Y6Suz+O8o2k27HG/pfG/i
 vM+kHhR+lRzm1PHG1pysZlx95YxvvTiqhG5wTP78eOalvOCkYJF7bqLX3O+VtEyUwv8brbAUCSG
 vwbg6xc/1Y649+oI8O8yeNJkKykEwALeQnt+GV+wb9zVNuklX3GrbOtV812hDGaDhHcvVi2vdUQ
 r4egFDuaqeckC2tyU4w==
X-Proofpoint-GUID: tYeMFYVs85oa0lk9blDZoQZdTVkcjwOv
X-Proofpoint-ORIG-GUID: tYeMFYVs85oa0lk9blDZoQZdTVkcjwOv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190079



On 1/9/2026 1:12 PM, Wangao Wang wrote:
> Unify AVC/HEVC handling by computing codec and lcu_size upfront.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index c962042518fceb0f82a48956df01c8f3cd26df99..621d5c6b4940e146f117e6b206421127c7cf9656 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -739,16 +739,13 @@ static u32 iris_vpu_enc_comv_size(struct iris_inst *inst)
>  	u32 height = iris_vpu_enc_get_bitstream_height(inst);
>  	u32 width = iris_vpu_enc_get_bitstream_width(inst);
>  	u32 num_recon = hfi_buffer_get_recon_count(inst);
> -	u32 lcu_size = 16;
> +	u32 codec, lcu_size;
>  
> -	if (inst->codec == V4L2_PIX_FMT_HEVC) {
> -		lcu_size = 32;
> -		return hfi_buffer_comv_enc(width, height, lcu_size,
> -					   num_recon + 1, HFI_CODEC_ENCODE_HEVC);
> -	}
> +	codec = (inst->codec == V4L2_PIX_FMT_HEVC) ?
> +		HFI_CODEC_ENCODE_HEVC : HFI_CODEC_ENCODE_AVC;
> +	lcu_size = (inst->codec == V4L2_PIX_FMT_HEVC) ? 32 : 16;
>  
> -	return hfi_buffer_comv_enc(width, height, lcu_size,
> -				   num_recon + 1, HFI_CODEC_ENCODE_AVC);
> +	return hfi_buffer_comv_enc(width, height, lcu_size, num_recon + 1, codec);
>  }
>  
>  static inline
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

