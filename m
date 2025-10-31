Return-Path: <linux-media+bounces-46067-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFADC24A1E
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 11:54:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C302B3B6FA2
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 10:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75098342CA1;
	Fri, 31 Oct 2025 10:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a8c2Yrzy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89DA342CAC
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 10:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761908076; cv=none; b=e3JZgg6XA2xCbfA1JHutxlqS6D1WODR8HRVO+hJdm5vsRD2R0BAww+P0d3M8rcBjCoqp/CvXXdc39cALoGk8OJYRbqOCfAL0op/lAH4C95ZMaNAxiqi/7m87HBWhSoYh4XPS/gjHI+onh8efl0ZWdLsOH/vruS6UJ3u1UgLy2Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761908076; c=relaxed/simple;
	bh=fY9T44G2rdP+QOeg07l/fEMugOEpTS30JjO5Xg/LKe0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nGJ973G/4WrEe9+duUEwllJMbyS4dDDWnku9VqAQK+Nkqx3ktNyXUmVMY11FnKf6uDK1ZYjBMf1yh7BbulOJgtgTZIsvxKp80C2yPA8R9H8VGfblZ6SZIr8IuvotOLWcuRdSgAgosb24rpJAu18xCe/HBal8DeUrQcu5teC0ipU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a8c2Yrzy; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-46e6a689bd0so20223935e9.1
        for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 03:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761908073; x=1762512873; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KgYpWmS7pop07On6xWoaQMqh566AnesHArGMvB1beW4=;
        b=a8c2Yrzy+YwU2yC3jD+LsnpccQQIk9Woj5Qkbum6feP6WGbgw2toETsW1g3QWnM3DC
         0FQiuwZ/v2dupQ/L+zoY9pqQzCUK8qd91IspaDnJpEp/yP4tDiDS0sLz0zu4+LGCBo/s
         eYMy0Nme+24j2C/jHNRTFIr6QQKWrDaOntcfe5HV97O/tfwz5GP9aKEKE983AHPft9Bw
         goyPWanK76wrOm4r2Siill1nme5yrvol11lK5V9V7GMl0pOg0Iq42u1weM6k3i6UsFgi
         gQZgw9evCOsWH+OUPyCjyYMyNqTgkf6KCsAIwDjfnHEc5VrzA2gOsCKCUYJGRgEvXkxj
         ysdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761908073; x=1762512873;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KgYpWmS7pop07On6xWoaQMqh566AnesHArGMvB1beW4=;
        b=Xl66VnKOxUPW2Ml7o+Em8xm4xJx5nK5OM0lhNFOGJna1vCR/TFIjT5snZ5cYQixrwk
         ntyf1mYhOeIwZCq1oJ+6c7BPU/Mt3zmRJYZQgpQYJO2WEpAwZBXAu/XD0RuOqUXkfd0t
         eFSo/tT4qb9J/e18kd9w43SvWH71wil1UvCMv82TvNr4kl7ENIaVs0MJlLeR8VHtzqYD
         aDjsikkFFA7P174+4RNghBuYoj8ErpHUtsFlfM+o3/TvkOGwBWsTPkG29o9TH84vaWCT
         AAoSPGLbYJ90vYGT7p4aZN81Vo3frXSc940NikFlogG3KLZs9JMM/bRJEb75KCgI1RVz
         J9yw==
X-Gm-Message-State: AOJu0YymjbVj+EBbOS0guCKq/7MRY5tZlNdyN6DvOA3LXfsLBhf+Qw4n
	pvoX/ztfMCxACvKG+FXU/Caup1soid26lOkiXbGn6yVa2q5gNcY40xcpf5J7XMEr1EE=
X-Gm-Gg: ASbGncuh+0scJ4WaIm3oz5cLtk6O84i+m6m5FYbM/armzILbs2Y/LWcPts1aV0GsN84
	NSW2lPC1474j2L617jiy0oguPfH3pqMliwxFmU33woU8BXUdmWtQDKcNBZXrsIcWTK6cZ15i9jg
	aFlcmoKKrxmDgCMWPIWssnOWn3Q+36qlmVQWYi0IWM/p+Dzrrc4B4BxnieMFr2kp+7SAEGl0sHl
	xN65AjgaACvakV4SXxm2NFEh8boX7o9Kx4nKNnWBckEcfIswyJbPyzhO0Sj06RZaZnHXaR/OthW
	A87/RWmyWJ1S8K8yE/WPfi9rveWwnJ7Sa7GkSje6ykRc6r4SFaRHAVnqy4oWNub0Fb+BMb5Amng
	3Q00PKNmt+ukItHeW1qG+zc98BZdJZcAVBGqd/B9Ls1e3D4p8fSLvm9vI917lYhb925QTQbOWZp
	pYF2FrXTzKIKjdApaimOHV5kj1ge1sbphlphNvKYw9zyJpk4/8t+dT191iQ+Xpdq4=
X-Google-Smtp-Source: AGHT+IE3alWrH41J3hcH6vTJi2hwMKkyZfn6scocaEdUFFDYekiDmAo0ABjY8dgwgsfR4/PiXaJFWg==
X-Received: by 2002:a05:600c:1c1d:b0:475:de14:db16 with SMTP id 5b1f17b1804b1-4773086e39amr28235695e9.25.1761908072942;
        Fri, 31 Oct 2025 03:54:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:d967:2bcf:d2d0:b324? ([2a01:e0a:cad:2140:d967:2bcf:d2d0:b324])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47733023256sm27547735e9.17.2025.10.31.03.54.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 03:54:32 -0700 (PDT)
Message-ID: <6e8266a5-99c8-4a34-8caf-fb828782d2a6@linaro.org>
Date: Fri, 31 Oct 2025 11:54:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/5] media: qcom: iris: Add scale support for encoder
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_qiweil@quicinc.com,
 quic_renjiang@quicinc.com
References: <20251031-iris_encoder_enhancements-v2-0-319cd75cbb45@oss.qualcomm.com>
 <20251031-iris_encoder_enhancements-v2-2-319cd75cbb45@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20251031-iris_encoder_enhancements-v2-2-319cd75cbb45@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/25 10:50, Wangao Wang wrote:
> Add members enc_scale_width, enc_scale_height to the struct iris_inst to
> support scale requirements.
> 
> Add output width and height settings in iris_venc_s_fmt_output to
> enable scaling functionality.
> 
> Add VPSS buffer to platform data, which the scale function requires.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>   .../platform/qcom/iris/iris_hfi_gen2_command.c     |  4 ++--
>   .../platform/qcom/iris/iris_hfi_gen2_response.c    |  2 ++
>   drivers/media/platform/qcom/iris/iris_instance.h   |  4 ++++
>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 12 +++++++++++
>   drivers/media/platform/qcom/iris/iris_venc.c       | 23 +++++++++++++++++++++-
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  9 +++++----
>   6 files changed, 47 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index ada9b4d298ef10ac47a573061369828a1e150f85..6ec217268a2bc1f939fa33820c1ae19adaad2e96 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -194,8 +194,8 @@ static int iris_hfi_gen2_set_bitstream_resolution(struct iris_inst *inst, u32 pl
>   		payload_type = HFI_PAYLOAD_U32;
>   	} else {
>   		codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
> -		resolution = ALIGN(inst->fmt_dst->fmt.pix_mp.width, codec_align) << 16 |
> -			ALIGN(inst->fmt_dst->fmt.pix_mp.height, codec_align);
> +		resolution = ALIGN(inst->enc_scale_width, codec_align) << 16 |
> +			ALIGN(inst->enc_scale_height, codec_align);
>   		inst_hfi_gen2->dst_subcr_params.bitstream_resolution = resolution;
>   		payload_type = HFI_PAYLOAD_32_PACKED;
>   	}
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 2f1f118eae4f6462ab1aa1d16844b34e6e699f1e..dc3e606b6ab429a1d15536fa8316afb1e384d674 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -54,6 +54,8 @@ static u32 iris_hfi_gen2_buf_type_to_driver(struct iris_inst *inst,
>   			return BUF_SCRATCH_2;
>   	case HFI_BUFFER_PERSIST:
>   		return BUF_PERSIST;
> +	case HFI_BUFFER_VPSS:
> +		return BUF_VPSS;
>   	default:
>   		return 0;
>   	}
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index fbae1662947df73bb3d10b7892839fa1076b7e61..5ff01dd7177fc919d0cc69553fadede5801592a1 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -66,6 +66,8 @@ struct iris_fmt {
>    * @hfi_rc_type: rate control type
>    * @enc_raw_width: raw image width for encoder instance
>    * @enc_raw_height: raw image height for encoder instance
> + * @enc_scale_width: scale width for encoder instance
> + * @enc_scale_height: scale height for encoder instance
>    */
>   
>   struct iris_inst {
> @@ -106,6 +108,8 @@ struct iris_inst {
>   	u32				hfi_rc_type;
>   	u32				enc_raw_width;
>   	u32				enc_raw_height;
> +	u32				enc_scale_width;
> +	u32				enc_scale_height;
>   };
>   
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 36d69cc73986b74534a2912524c8553970fd862e..d3306189d902a1f42666010468c9e4e4316a66e1 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -729,6 +729,10 @@ static const u32 sm8550_dec_op_int_buf_tbl[] = {
>   	BUF_DPB,
>   };
>   
> +static const u32 sm8550_enc_ip_int_buf_tbl[] = {
> +	BUF_VPSS,
> +};
> +
>   static const u32 sm8550_enc_op_int_buf_tbl[] = {
>   	BUF_BIN,
>   	BUF_COMV,
> @@ -816,6 +820,8 @@ struct iris_platform_data sm8550_data = {
>   	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>   	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>   
> +	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
>   	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>   	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>   };
> @@ -908,6 +914,8 @@ struct iris_platform_data sm8650_data = {
>   	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>   	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>   
> +	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
>   	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>   	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>   };
> @@ -989,6 +997,8 @@ struct iris_platform_data sm8750_data = {
>   	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>   	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>   
> +	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
>   	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>   	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>   };
> @@ -1077,6 +1087,8 @@ struct iris_platform_data qcs8300_data = {
>   	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>   	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>   
> +	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
>   	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>   	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>   };
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 6adadc89e360a6e4bebe1f839d38892990e10fa2..17a2e59e4ba8ff650895dde9fe569da39ef88093 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -70,6 +70,8 @@ int iris_venc_inst_init(struct iris_inst *inst)
>   
>   	inst->enc_raw_width = DEFAULT_WIDTH;
>   	inst->enc_raw_height = DEFAULT_HEIGHT;
> +	inst->enc_scale_width = DEFAULT_WIDTH;
> +	inst->enc_scale_height = DEFAULT_HEIGHT;
>   
>   	memcpy(&inst->fw_caps[0], &core->inst_fw_caps_enc[0],
>   	       INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
> @@ -188,15 +190,32 @@ int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
>   
>   static int iris_venc_s_fmt_output(struct iris_inst *inst, struct v4l2_format *f)
>   {
> +	const struct iris_fmt *venc_fmt;
>   	struct v4l2_format *fmt;
> +	u32 codec_align;
>   
>   	iris_venc_try_fmt(inst, f);
>   
> -	if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
> +	venc_fmt = find_format(inst, f->fmt.pix_mp.pixelformat, f->type);
> +	if (!venc_fmt)
>   		return -EINVAL;
>   
> +	codec_align = venc_fmt->pixfmt == V4L2_PIX_FMT_HEVC ? 32 : 16;
> +
>   	fmt = inst->fmt_dst;
>   	fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +	/*
> +	 * If output format size != input format size,
> +	 * it is considered a scaling case,
> +	 * and the scaled size needs to be saved.
> +	 */
> +	if (f->fmt.pix_mp.width != fmt->fmt.pix_mp.width ||
> +	    f->fmt.pix_mp.height != fmt->fmt.pix_mp.height) {
> +		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
> +		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, codec_align);
> +		inst->enc_scale_width = f->fmt.pix_mp.width;
> +		inst->enc_scale_height = f->fmt.pix_mp.height;
> +	}
>   	fmt->fmt.pix_mp.num_planes = 1;
>   	fmt->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
>   	fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
> @@ -254,6 +273,8 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
>   
>   	inst->enc_raw_width = f->fmt.pix_mp.width;
>   	inst->enc_raw_height = f->fmt.pix_mp.height;
> +	inst->enc_scale_width = f->fmt.pix_mp.width;
> +	inst->enc_scale_height = f->fmt.pix_mp.height;
>   
>   	if (f->fmt.pix_mp.width != inst->crop.width ||
>   	    f->fmt.pix_mp.height != inst->crop.height) {
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index 4463be05ce165adef6b152eb0c155d2e6a7b3c36..db5adadd1b39c06bc41ae6f1b3d2f924b3ebf150 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -1131,10 +1131,11 @@ static u32 iris_vpu_enc_arp_size(struct iris_inst *inst)
>   
>   inline bool is_scaling_enabled(struct iris_inst *inst)
>   {
> -	return inst->crop.left != inst->compose.left ||
> -		inst->crop.top != inst->compose.top ||
> -		inst->crop.width != inst->compose.width ||
> -		inst->crop.height != inst->compose.height;
> +	struct v4l2_pix_format_mplane *dst_fmt = &inst->fmt_dst->fmt.pix_mp;
> +	struct v4l2_pix_format_mplane *src_fmt = &inst->fmt_src->fmt.pix_mp;
> +
> +	return dst_fmt->width != src_fmt->width ||
> +		dst_fmt->height != src_fmt->height;
>   }
>   
>   static inline
> 

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK

