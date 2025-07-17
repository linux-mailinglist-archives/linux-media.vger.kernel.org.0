Return-Path: <linux-media+bounces-37962-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E22BB08990
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 11:44:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 089691AA597C
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 09:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 016EA28B41E;
	Thu, 17 Jul 2025 09:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uAf0gpVz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AA2289E1F
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 09:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752745434; cv=none; b=g1Q09trZxFbuc9CxJC0m/xwJeMsIY5v9fp6MKZ370B4GqZEVlc7faqE7cyXNfEc4zmz2CeItC/d8CmUdemp8gNiViD4+ropxfzvbJAy/r38wm6GeGRZahzBAq9amv4c2nOrbziiZSobMBMwC5ymGBZ6UBjV0zvd205/tYFGw++k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752745434; c=relaxed/simple;
	bh=eRJZpSbYvKgupe+T1SU+IZZyns2Revzb8XX/zXaFhlM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p560AvoTuyrWo8WzZ1Cp/LfvKk6xzeukwl0Ohpwg9PKy0id/rldYswnhhRu0IeJkS59UgI5s5Lpk+8JItVNcirXB5CrTEkEKZd8bJ/anU6gmcpRinHON1czHyPISdeB6zs1NJJRhz2mzGVkOVGZ/0v+W+H3aNSbMU+9PWiFSH8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uAf0gpVz; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45629703011so5405565e9.0
        for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 02:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752745430; x=1753350230; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5NGgb3DcA15w098paJT2GnEVS25q5aKdVuuE1uihlhU=;
        b=uAf0gpVzBpZap4Y9G+UWnOqDpyzIkHOjJiV1u1rRs39oxi2Mv2CiPqVKFp2quh1Ivy
         DPZsCxUbx6fGTBs8+n0IV5hpXON1LFPSP+9YXsg9qwGvlby5J8QXucIJwp/YiomL5ku+
         0N5hPH1AW+QT1MgREvB5myw36RK2jNoKW80lSO3QHSdUI8XIg85KrayfB+4xGowzPe/o
         8hIxcb7QXCQEUzNcxE92EVS+SjL7pkHi0PYtCcNm39bKEdeno7Prn/SBSmB2yhhZ7T5C
         4/TjAR2pMvvfVqo7CAh9UDS2sMOmdeDNTEfvn5dJFs0XSbEI95xffhUUznV9ZFu5+i/A
         dSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752745430; x=1753350230;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5NGgb3DcA15w098paJT2GnEVS25q5aKdVuuE1uihlhU=;
        b=il2OmVcdVxDTWXE0eEXToKO28OcAK2uFCU8SYcCy27HMAhcEbN56cLbb5JIXeWpPoZ
         +lzmu1jpUBngae54p5AilNy9a4fKf8fMAE+RiDBFt539srhQJwhkVxq6PqXepY0axxYL
         vKvK7u7ZB7wWW10vF0wGRJlqv1iqxddHs/pusxQBf/bLpED+1FGevcMc1rj/2FrB3znl
         gMhe09R4HdGtRO0KaixONHVFfOYowOqDilSIjYSY5DcPiJaoryO3+qOOOz8Gk1yaUMWF
         r8MZGmALrqS9Gpp9+E++fHfW7sar7+chZwkCz+/UU37sKIGIf9pg6/k1eRh8La52y8Dv
         QSXg==
X-Gm-Message-State: AOJu0YyS3iJyXLIbfPjzDrQTxqSe+S1j7Kuhne2hN53G8KrMEvfMRe9H
	pt4yaCNajlWWE2+3Y0+q/YWzTdeh9vFuMLxDgglO0b41JGwL9zn3ve0cOIyNh5w3l/s=
X-Gm-Gg: ASbGnctJPOs0MXD9uhIUg05aoGmwRVUoK44bDVzU3oogEynnL4DyH9vncKaUloqaEf9
	VS8f2dEaZEq7iuM4hXqrrq5AWp5JAwhes7ZURQABMiWg8Mwg3k0/epoXZsZxgdlxQQwiBI0oZe8
	ls+7sbnG1Kt+Lz+5LOj4Pf+A0Z0iTG7QE534ySmKnBk4DZkHRcD+Jnv0ZTSXVw9N++Bqk/Mo2Qb
	5YECo/UBl7aLMh8mnQRA0LcO7d/qjO6tDDHQfbG16fhwTw0dCKNMq0j1c3P8T9R14GrXpMDI+ER
	hgoI5NzHnh/9DmlAYEP+BXzDqOLq5jlB2qyLqzoWmLdwQ0nlR1ewkaCq8xle3Cpo7RbqhKx7Jiq
	000xxH1wcld0Oj3jrjCXxxH5qS4BAUCDS8YcOBMD69G9M8tJel42yISCJME7/4iU=
X-Google-Smtp-Source: AGHT+IGoO3nrN5aiR8KKGhctKRP1P15C3fJWOm2uSdmC5FXGBrIhMKTBv1htTrvHdpEgWyxlqT2x4A==
X-Received: by 2002:a05:600c:1c82:b0:456:2ac6:ccc3 with SMTP id 5b1f17b1804b1-4562e28367emr47165115e9.25.1752745429897;
        Thu, 17 Jul 2025 02:43:49 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e8860cdsm46325905e9.20.2025.07.17.02.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 02:43:49 -0700 (PDT)
Message-ID: <b8b80bfd-0927-4c4f-96fd-6ad1e94d3666@linaro.org>
Date: Thu, 17 Jul 2025 10:43:48 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/7] media: venus: hfi_plat_v4: Add capabilities for
 the 4XX lite core
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, krzk+dt@kernel.org,
 konradybcio@kernel.org, mchehab@kernel.org, andersson@kernel.org,
 conor+dt@kernel.org, amit.kucheria@oss.qualcomm.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
 <20250715204749.2189875-5-jorge.ramirez@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250715204749.2189875-5-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/07/2025 21:47, Jorge Ramirez-Ortiz wrote:
> Populate the HFI v4 lite capability set used by the AR50_LITE video
> core.
> 
> These capabilities define the supported codec formats and operational
> limits specific to this streamlined VPU variant.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>   .../platform/qcom/venus/hfi_platform_v4.c     | 164 +++++++++++++++---
>   1 file changed, 143 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v4.c b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
> index 4ae7ed476c48..23ed5e689f5a 100644
> --- a/drivers/media/platform/qcom/venus/hfi_platform_v4.c
> +++ b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
> @@ -245,25 +245,145 @@ static const struct hfi_plat_caps caps[] = {
>   	.num_fmts = 4,
>   } };
>   
> +static const struct hfi_plat_caps caps_lite[] = {
> +{
> +	.codec = HFI_VIDEO_CODEC_H264,
> +	.domain = VIDC_SESSION_TYPE_DEC,
> +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1920, 1},
> +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
> +	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
> +	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
> +	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
> +	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
> +	.num_caps = 7,
> +	.pl[0] = { HFI_H264_PROFILE_BASELINE, HFI_H264_LEVEL_5},
> +	.pl[1] = {HFI_H264_PROFILE_MAIN, HFI_H264_LEVEL_5},
> +	.pl[2] = {HFI_H264_PROFILE_HIGH, HFI_H264_LEVEL_5},
> +	.pl[3] = {HFI_H264_PROFILE_CONSTRAINED_BASE, HFI_H264_LEVEL_5},
> +	.pl[4] = {HFI_H264_PROFILE_CONSTRAINED_HIGH, HFI_H264_LEVEL_5},
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
> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1920, 1},
> +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
> +	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
> +	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
> +	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
> +	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
> +	.num_caps = 7,
> +	.pl[0] = {HFI_HEVC_PROFILE_MAIN, HFI_HEVC_LEVEL_5 | HFI_HEVC_TIER_HIGH0 << 28 },
> +	.pl[1] = {HFI_HEVC_PROFILE_MAIN10, HFI_HEVC_LEVEL_5 | HFI_HEVC_TIER_HIGH0 << 28 },
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
> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1920, 1},
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
> +}, {
> +	.codec = HFI_VIDEO_CODEC_H264,
> +	.domain = VIDC_SESSION_TYPE_ENC,
> +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1920, 1},
> +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
> +	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
> +	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
> +	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
> +	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
> +	.caps[7] = {HFI_CAPABILITY_HIER_P_NUM_ENH_LAYERS, 0, 6, 1},
> +	.caps[8] = {HFI_CAPABILITY_ENC_LTR_COUNT, 0, 4, 1},
> +	.caps[9] = {HFI_CAPABILITY_MBS_PER_SECOND_POWERSAVE, 0, 244800, 1},
> +	.caps[10] = {HFI_CAPABILITY_I_FRAME_QP, 0, 51, 1},
> +	.caps[11] = {HFI_CAPABILITY_P_FRAME_QP, 0, 51, 1},
> +	.caps[12] = {HFI_CAPABILITY_B_FRAME_QP, 0, 51, 1},
> +	.caps[13] = {HFI_CAPABILITY_SLICE_BYTE, 1, 10, 1},
> +	.caps[14] = {HFI_CAPABILITY_SLICE_MB, 1, 10, 1},
> +	.num_caps = 15,
> +	.pl[0] = {HFI_H264_PROFILE_BASELINE, HFI_H264_LEVEL_5},
> +	.pl[1] = {HFI_H264_PROFILE_MAIN, HFI_H264_LEVEL_5},
> +	.pl[2] = {HFI_H264_PROFILE_HIGH, HFI_H264_LEVEL_5},
> +	.pl[3] = {HFI_H264_PROFILE_CONSTRAINED_BASE, HFI_H264_LEVEL_5},
> +	.pl[4] = {HFI_H264_PROFILE_CONSTRAINED_HIGH, HFI_H264_LEVEL_5},
> +	.num_pl = 5,
> +	.fmts[0] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_NV12},
> +	.fmts[1] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_NV12_UBWC},
> +	.num_fmts = 2,
> +}, {
> +	.codec = HFI_VIDEO_CODEC_HEVC,
> +	.domain = VIDC_SESSION_TYPE_ENC,
> +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1920, 1},
> +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
> +	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
> +	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
> +	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
> +	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
> +	.caps[7] = {HFI_CAPABILITY_HIER_P_NUM_ENH_LAYERS, 0, 6, 1},
> +	.caps[8] = {HFI_CAPABILITY_ENC_LTR_COUNT, 0, 4, 1},
> +	.caps[9] = {HFI_CAPABILITY_MBS_PER_SECOND_POWERSAVE, 0, 244800, 1},
> +	.caps[10] = {HFI_CAPABILITY_I_FRAME_QP, 0, 51, 1},
> +	.caps[11] = {HFI_CAPABILITY_P_FRAME_QP, 0, 51, 1},
> +	.caps[12] = {HFI_CAPABILITY_B_FRAME_QP, 0, 51, 1},
> +	.caps[13] = {HFI_CAPABILITY_SLICE_BYTE, 1, 10, 1},
> +	.caps[14] = {HFI_CAPABILITY_SLICE_MB, 1, 10, 1},
> +	.num_caps = 15,
> +	.pl[0] = {HFI_HEVC_PROFILE_MAIN, HFI_HEVC_LEVEL_5 | HFI_HEVC_TIER_HIGH0},
> +	.pl[1] = {HFI_HEVC_PROFILE_MAIN10, HFI_HEVC_LEVEL_5 | HFI_HEVC_TIER_HIGH0},
> +	.num_pl = 2,
> +	.fmts[0] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_NV12},
> +	.fmts[1] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_NV12_UBWC},
> +	.num_fmts = 2,
> +} };
> +
>   static const struct hfi_plat_caps *get_capabilities(unsigned int *entries,
>   						    bool lite)
>   {
> -	WARN_ON(lite);
> +	*entries = lite ? ARRAY_SIZE(caps_lite) : ARRAY_SIZE(caps);
>   
> -	*entries = ARRAY_SIZE(caps);
> -	return caps;
> +	return lite ? caps_lite : caps;
>   }
>   
>   static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count, bool lite)
>   {
> -	WARN_ON(lite);
> -
> -	*enc_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
> -		      HFI_VIDEO_CODEC_VP8;
> -	*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
> -		      HFI_VIDEO_CODEC_VP8 | HFI_VIDEO_CODEC_VP9 |
> -		      HFI_VIDEO_CODEC_MPEG2;
> -	*count = 8;
> +	if (lite) {

Ok, now the WARN_ON() makes more sense, its a progressive.

> +		*enc_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC;
> +		*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
> +			      HFI_VIDEO_CODEC_VP9;
> +		*count = 5;
> +	} else {
> +		*enc_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
> +			      HFI_VIDEO_CODEC_VP8;
> +		*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
> +			      HFI_VIDEO_CODEC_VP8 | HFI_VIDEO_CODEC_VP9 |
> +			      HFI_VIDEO_CODEC_MPEG2;
> +		*count = 8;
> +	}

I don't much like setting hard-coded values in functions.

It must be possible to pass these as parameters. We have all of these 
enumeration structures - it seems a shame to move some specific 
enumerations to hard-coding.

Please consider if there is a way to bury this into one of the 
enumeration params.

>   }
>   
>   static const struct hfi_platform_codec_freq_data codec_freq_data[] =  {
> @@ -277,15 +397,23 @@ static const struct hfi_platform_codec_freq_data codec_freq_data[] =  {
>   	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 200, 10, 200 },
>   };
>   
> +static const struct hfi_platform_codec_freq_data codec_freq_data_lite[] = {
> +	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
> +	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
> +	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
> +	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675, 0, 675 },
> +	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675, 0, 675 },
> +};
> +
>   static const struct hfi_platform_codec_freq_data *
>   get_codec_freq_data(u32 session_type, u32 pixfmt, bool lite)
>   {
> -	const struct hfi_platform_codec_freq_data *data = codec_freq_data;
> -	unsigned int i, data_size = ARRAY_SIZE(codec_freq_data);
> +	const struct hfi_platform_codec_freq_data *data = lite ?
> +					codec_freq_data_lite : codec_freq_data;
> +	unsigned int i, data_size = lite ? ARRAY_SIZE(codec_freq_data_lite) :
> +				    ARRAY_SIZE(codec_freq_data);

I'm not a big fan anymore of ternary nor of declaring multiple things on 
one line.

And I'll preempt Konrad, reverse Christmas tree in the declaration where 
possible for preference.

>   	const struct hfi_platform_codec_freq_data *found = NULL;
>   
> -	WARN_ON(lite);
> -
>   	for (i = 0; i < data_size; i++) {
>   		if (data[i].pixfmt == pixfmt && data[i].session_type == session_type) {
>   			found = &data[i];
> @@ -300,8 +428,6 @@ static unsigned long codec_vpp_freq(u32 session_type, u32 codec, bool lite)
>   {
>   	const struct hfi_platform_codec_freq_data *data;
>   
> -	WARN_ON(lite);
> -
>   	data = get_codec_freq_data(session_type, codec, lite);
>   	if (data)
>   		return data->vpp_freq;
> @@ -313,8 +439,6 @@ static unsigned long codec_vsp_freq(u32 session_type, u32 codec, bool lite)
>   {
>   	const struct hfi_platform_codec_freq_data *data;
>   
> -	WARN_ON(lite);
> -
>   	data = get_codec_freq_data(session_type, codec, lite);
>   	if (data)
>   		return data->vsp_freq;
> @@ -326,8 +450,6 @@ static unsigned long codec_lp_freq(u32 session_type, u32 codec, bool lite)
>   {
>   	const struct hfi_platform_codec_freq_data *data;
>   
> -	WARN_ON(lite);
> -
>   	data = get_codec_freq_data(session_type, codec, lite);
>   	if (data)
>   		return data->low_power_freq;

I suppose the hard-coded *val = 5 || *val = 8; isn't important but it 
would be _nice_ to not hard-code, up to you how much you want to 
implement for the next version.

This code all looks reasonably correct/consistent with antecedents.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

