Return-Path: <linux-media+bounces-36018-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B36F5AEA129
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 16:48:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23EC616A644
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 14:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB44F2EACE2;
	Thu, 26 Jun 2025 14:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y/E10TB4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC602E92B5
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 14:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750948989; cv=none; b=r7g45YGYloxgXhTUc7SqyGWKIouwt43vmfoRlamURXzRNnY1S3XSA9qEbtarlG2L+7dgP/vDMpySrLYwT5RdB0lObkFWG5P2Q0+tKToOnsi6GDxuaWS0VwGHINgEG95E1A6zMhPxJrtWKJXoqQELvBruGMjCU3ygKxv4tzSrfek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750948989; c=relaxed/simple;
	bh=0HQe4a5YAaE+Ad0zFk1lrQjmoZlsGV3tH1gFwEFjugE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZGfGm8H38MJvNaWcVsHMWkfGsmDxZVnYwJbzHQ94l36Hzn13De1iYQpHQDLL95oT4JZSgkpY7xl7PiXxKMw//L6t2atDeFfO6pUAdRGtShnXFnexRKzcOi7lNjESvTP3zZ44dQ9bJCoeQirYdouVyUHJikCOyTY0hUTCqz+Ggls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y/E10TB4; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a53359dea5so701161f8f.0
        for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 07:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750948985; x=1751553785; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z831f9YRlmJ4qRXB7hGrw59vzBeO06ggJ4eQEzvfgkY=;
        b=Y/E10TB4X5IXUSpuyqVHWOf2t6buTOY71jfF9+Kk574uU2JZWQ9xiqQLwxFB49NhDR
         D2YoescEGNdGCZOH/TGrUjk3Ft9yF3A4QBk+tL7Jv8UijizmaBfr4KSxn59ToFHthWu3
         OVWxddtnd/CS02Z17HWHZK2PFuU+1zzeQqx2bjsvYrPSv2nKv+8uSPBibnZwI3t6xMWs
         ttqHHy1IKieAUM1Pb1wgHTuZZMNBY65M/OQYMCKH2eP7Nw9ofKdJ9Nd164sTtiMfbBsm
         WCl0qJN1K/4RC/WNZQQXmEv0GbXmNnLa7YEvZ7Cj0fGKqP46Qw45lGbvfwMKW6THMA6d
         /fVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750948985; x=1751553785;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z831f9YRlmJ4qRXB7hGrw59vzBeO06ggJ4eQEzvfgkY=;
        b=THHqHtk0vZ34TechCQAjiTKKFU0YGQLLAdl2oSlE/Db55OSJlTadhGQ/5PfgD/3daJ
         kVW9iz/lBLtRe87zmFfL7TR6gJdhpC/PJnKh7NAbFVCx4VOTMaO7ICBNP/Bk1k4NNsO2
         y50+CuaStkP48Mgm7+kcBYQ2fhGCayuwO8mSvodHtSIPKAyhcHjL3sLpHFMmn8yMlk9Q
         0mMPtC7tYcCX6ADI0FmjXbOSGdigJgg2Hf2/1d8tAnr28WuXo61hIR8rqee6hUdGizaz
         Dw0f50tyHnBGcibTfos6yIJA48NuFnQb0d02AyTkXCz8zr03ig7wsi/PJQXi3f16R2BE
         AlXg==
X-Forwarded-Encrypted: i=1; AJvYcCXRU5OQJO/Gvzppm9fiSlXaqNXYPJ99O1GKWbU2iuOAQH0v++DLBlOlfVyPZB+p6NiF+wvNUlopreTIfw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1PdAdWCA8UAoghWE8jpGWpVq5aPPFkFi2Mq0cgccPArGioQaB
	IIKO2LKQ0bjy3cLLldlhGiL+tN9mhFfGIUUcG1zNIU3qIsfeTtN3wbnB56Voi3vvl5M=
X-Gm-Gg: ASbGncveuVf1X5QRK6U46ik6QHLuK74T9fg6y1lcNO119UnZ1AUoyHqGMsPNVuym0WZ
	Wz6+Jy05W8muaOhUdsUuCgzPug4A/5FnlZlVPdubzDw3omvJEcILEnIEYNHQj5vMZnHYg3iUz3l
	mBeOPKWg99vrjqtWLZz6VQ4KF6eXWsMCZJQ2TdfLXbynKFjHVrhpNLsY3gsisGD3DiU/07UBWvX
	H3ygfWCoLLrvCa8LIkjLobI8k2lskpnY7ZXIcNT4yeTuL9pklN+JgKZwPcQH3wnrgphfLj7xxUI
	3PcxDz2l47J/UeXKzKUwRksiBVqKguW2D4ehEPAeMCpU/6CAqYGldTrWZpVGBql+ZI9oFW7FJ6A
	F6Q8EE0srCzjjEnVBMp0/L+xuhbs=
X-Google-Smtp-Source: AGHT+IHMkEIhXu88th1KWxayLdmKeMcAoyNbn8OAmQCdqS96iqF5uFX0aWqA0DysUZKYfz0SmlgVjw==
X-Received: by 2002:a5d:5889:0:b0:3a5:3b63:58f0 with SMTP id ffacd0b85a97d-3a6ed62e062mr5972463f8f.18.1750948985398;
        Thu, 26 Jun 2025 07:43:05 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fab6esm98471f8f.31.2025.06.26.07.43.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 07:43:04 -0700 (PDT)
Message-ID: <4ef8adb1-df85-4396-a414-469025276a2b@linaro.org>
Date: Thu, 26 Jun 2025 15:43:02 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] media: venus: hfi_plat_v6_lite: Populate decode
 capabilities
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, krzk+dt@kernel.org,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org,
 robh@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
 andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-4-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250626135931.700937-4-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/06/2025 14:59, Jorge Ramirez-Ortiz wrote:
> Add hfi platform file with decoding capabilities for hfi v6_lite.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/venus/Makefile    |   2 +-
>   .../media/platform/qcom/venus/hfi_platform.c  |   2 +
>   .../media/platform/qcom/venus/hfi_platform.h  |   1 +
>   .../qcom/venus/hfi_platform_v6_lite.c         | 148 ++++++++++++++++++
>   4 files changed, 152 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c
> 
> diff --git a/drivers/media/platform/qcom/venus/Makefile b/drivers/media/platform/qcom/venus/Makefile
> index 91ee6be10292..4a6a942db58b 100644
> --- a/drivers/media/platform/qcom/venus/Makefile
> +++ b/drivers/media/platform/qcom/venus/Makefile
> @@ -5,7 +5,7 @@ venus-core-objs += core.o helpers.o firmware.o \
>   		   hfi_venus.o hfi_msgs.o hfi_cmds.o hfi.o \
>   		   hfi_parser.o pm_helpers.o dbgfs.o \
>   		   hfi_platform.o hfi_platform_v4.o \
> -		   hfi_platform_v6.o hfi_plat_bufs_v6.o \
> +		   hfi_platform_v6.o hfi_plat_bufs_v6.o hfi_platform_v6_lite.o \
>   
>   venus-dec-objs += vdec.o vdec_ctrls.o
>   venus-enc-objs += venc.o venc_ctrls.o
> diff --git a/drivers/media/platform/qcom/venus/hfi_platform.c b/drivers/media/platform/qcom/venus/hfi_platform.c
> index 643e5aa138f5..f56b8f9946d7 100644
> --- a/drivers/media/platform/qcom/venus/hfi_platform.c
> +++ b/drivers/media/platform/qcom/venus/hfi_platform.c
> @@ -13,6 +13,8 @@ const struct hfi_platform *hfi_platform_get(enum hfi_version version)
>   		return &hfi_plat_v4;
>   	case HFI_VERSION_6XX:
>   		return &hfi_plat_v6;
> +	case HFI_VERSION_6XX_LITE:
> +		return &hfi_plat_v6_lite;
>   	default:
>   		break;
>   	}
> diff --git a/drivers/media/platform/qcom/venus/hfi_platform.h b/drivers/media/platform/qcom/venus/hfi_platform.h
> index ec89a90a8129..6356e4bd0de2 100644
> --- a/drivers/media/platform/qcom/venus/hfi_platform.h
> +++ b/drivers/media/platform/qcom/venus/hfi_platform.h
> @@ -58,6 +58,7 @@ struct hfi_platform {
>   
>   extern const struct hfi_platform hfi_plat_v4;
>   extern const struct hfi_platform hfi_plat_v6;
> +extern const struct hfi_platform hfi_plat_v6_lite;
>   
>   const struct hfi_platform *hfi_platform_get(enum hfi_version version);
>   unsigned long hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 codec,
> diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c b/drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c
> new file mode 100644
> index 000000000000..41958a3e353b
> --- /dev/null
> +++ b/drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c
> @@ -0,0 +1,148 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025, The Linux Foundation. All rights reserved.
> + */
> +#include "hfi_platform.h"
> +
> +static const struct hfi_plat_caps caps[] = {
> +{
> +	.codec = HFI_VIDEO_CODEC_H264,
> +	.domain = VIDC_SESSION_TYPE_DEC,
> +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1080, 1},
> +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
> +	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
> +	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
> +	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
> +	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
> +	.num_caps = 7,
> +	.pl[0] = {HFI_H264_PROFILE_BASELINE, HFI_H264_LEVEL_1},
> +	.pl[1] = {HFI_H264_PROFILE_MAIN, HFI_H264_LEVEL_41},
> +	.pl[2] = {HFI_H264_PROFILE_HIGH, HFI_H264_LEVEL_5},
> +	.pl[3] = {HFI_H264_PROFILE_CONSTRAINED_BASE, HFI_H264_LEVEL_41},
> +	.pl[4] = {HFI_H264_PROFILE_CONSTRAINED_HIGH, HFI_H264_LEVEL_41},
> +	.num_pl = 5,
> +	.fmts[0] = {HFI_BUFFER_OUTPUT, HFI_COLOR_FORMAT_NV12_UBWC},
> +	.fmts[1] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12_UBWC},
> +	.fmts[2] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12},
> +	.fmts[3] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV21},
> +	.num_fmts = 4,
> +}, {
> +	.codec = HFI_VIDEO_CODEC_HEVC,
> +	.domain = VIDC_SESSION_TYPE_DEC,
> +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1080, 1},
> +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
> +	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
> +	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
> +	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
> +	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
> +	.num_caps = 7,
> +	.pl[0] = {HFI_HEVC_PROFILE_MAIN, HFI_HEVC_LEVEL_5 | HFI_HEVC_TIER_MAIN},
> +	.pl[1] = {HFI_HEVC_PROFILE_MAIN10, HFI_HEVC_LEVEL_5 | HFI_HEVC_TIER_MAIN},
> +	.num_pl = 2,
> +	.fmts[0] = {HFI_BUFFER_OUTPUT, HFI_COLOR_FORMAT_NV12_UBWC},
> +	.fmts[1] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12_UBWC},
> +	.fmts[2] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12},
> +	.fmts[3] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV21},
> +	.num_fmts = 4,
> +}, {
> +	.codec = HFI_VIDEO_CODEC_VP9,
> +	.domain = VIDC_SESSION_TYPE_DEC,
> +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1080, 1},
> +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
> +	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
> +	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
> +	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
> +	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
> +	.num_caps = 7,
> +	.pl[0] = {HFI_VP9_PROFILE_P0, 200},
> +	.pl[1] = {HFI_VP9_PROFILE_P2_10B, 200},
> +	.num_pl = 2,
> +	.fmts[0] = {HFI_BUFFER_OUTPUT, HFI_COLOR_FORMAT_NV12_UBWC},
> +	.fmts[1] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12_UBWC},
> +	.fmts[2] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12},
> +	.fmts[3] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV21},
> +	.num_fmts = 4,
> +} };
> +
> +static const struct hfi_plat_caps *get_capabilities(unsigned int *entries)
> +{
> +	*entries = ARRAY_SIZE(caps);
> +	return caps;
> +}
> +
> +static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count)
> +{
> +	*enc_codecs = 0x0;
> +	*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
> +		      HFI_VIDEO_CODEC_VP9;
> +	*count = 3;
> +}
> +
> +static const struct hfi_platform_codec_freq_data codec_freq_data[] = {
> +	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
> +	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
> +	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
> +};
> +
> +static const struct hfi_platform_codec_freq_data *
> +get_codec_freq_data(u32 session_type, u32 pixfmt)
> +{
> +	const struct hfi_platform_codec_freq_data *data = codec_freq_data;
> +	unsigned int i, data_size = ARRAY_SIZE(codec_freq_data);
> +	const struct hfi_platform_codec_freq_data *found = NULL;
> +
> +	for (i = 0; i < data_size; i++) {
> +		if (data[i].pixfmt == pixfmt &&
> +		    data[i].session_type == session_type) {
> +			found = &data[i];
> +			break;
> +		}
> +	}
> +
> +	return found;
> +}
> +
> +static unsigned long codec_vpp_freq(u32 session_type, u32 codec)
> +{
> +	const struct hfi_platform_codec_freq_data *data;
> +
> +	data = get_codec_freq_data(session_type, codec);
> +	if (data)
> +		return data->vpp_freq;
> +
> +	return 0;
> +}
> +
> +static unsigned long codec_vsp_freq(u32 session_type, u32 codec)
> +{
> +	const struct hfi_platform_codec_freq_data *data;
> +
> +	data = get_codec_freq_data(session_type, codec);
> +	if (data)
> +		return data->vsp_freq;
> +
> +	return 0;
> +}
> +
> +static unsigned long codec_lp_freq(u32 session_type, u32 codec)
> +{
> +	const struct hfi_platform_codec_freq_data *data;
> +
> +	data = get_codec_freq_data(session_type, codec);
> +	if (data)
> +		return data->low_power_freq;
> +
> +	return 0;
> +}
> +
> +const struct hfi_platform hfi_plat_v6_lite = {
> +	.codec_vpp_freq = codec_vpp_freq,
> +	.codec_vsp_freq = codec_vsp_freq,
> +	.codec_lp_freq = codec_lp_freq,
> +	.codecs = get_codecs,
> +	.capabilities = get_capabilities,
> +	.bufreq = hfi_plat_bufreq_v6,
> +};

@Dikshita @Vikash happy enough with this ?

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

