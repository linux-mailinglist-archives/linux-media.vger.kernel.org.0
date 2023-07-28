Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 034FF766F13
	for <lists+linux-media@lfdr.de>; Fri, 28 Jul 2023 16:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236956AbjG1ONs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jul 2023 10:13:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236534AbjG1ONr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jul 2023 10:13:47 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E4953AA3
        for <linux-media@vger.kernel.org>; Fri, 28 Jul 2023 07:13:42 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so3718220e87.2
        for <linux-media@vger.kernel.org>; Fri, 28 Jul 2023 07:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690553621; x=1691158421;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WVRceJceGDpCO42uthCJ+MjHJykc0jEKajsH/ocLPME=;
        b=mgV0HtCycFVwkWdUktsKFZfL/M7nQLQ+XUfsB2fEwHzVatmQBq9dY60P/JKK8Y7b+h
         8/mhHjcUulMpljH5oorxjX6l1gApyXRaHV8/3qUkWKKSTVzGqGPxdXv9P4FXiMf0pPZe
         gE9UwMUJbmInX52H50ko7kN4hYs/gj043em4W+fdN3WmD68y723R5kj54ovN1ymmDnT2
         xt/F2DwYWy5k3P6lr7uSXr6X5pmWdWbwbuu2gYmx/CRI5+9rsCeWLGzE5CYHAKmC24sc
         SBx+x+StbQUpobzBkjP3acXSMQtDXrvIY19lXJVV2cFlk00jMbuLpO6qvfsbis8QWTmv
         lNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690553621; x=1691158421;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WVRceJceGDpCO42uthCJ+MjHJykc0jEKajsH/ocLPME=;
        b=DA4LesN4dAjvNcJ//1309elRTRD7QodGq1a8SOs4EWQpECyr4fDnl33LWngk54nvrs
         yGRO9e9bxKquHapctzuWpP8r7O2j/AbdolZCSSlx9lgy3sanPaa92LHMJEu1tG4jMp2v
         ket6eb5v726qSGWZw++24Ym937VGV5tf9tFk3CnTUtDRsQ1YXwqiD3pJvYhmawDsPIr1
         Ienxc9YU5UcMYwYNP0vAU2CcIAwGEvk3gWZUqilaNmqIDAZ8MNexGZumzvVSHOKePYBy
         6+iAZ0NZ+s7E4e49Vyqqp3X5ejTaOsp16hkWyHTH2AN1PXHZZpA0usnvSM9sMV6uz2dL
         CLLg==
X-Gm-Message-State: ABy/qLanYP70h3sHYVt6IeyVgSFSZOh6z3LZeHyDPDlLDPdaMwIAKqtx
        kd/MZuB5NnJ6QvPWkp4KSvIsLA==
X-Google-Smtp-Source: APBJJlFxgh8gqbZsB86YOIidkLihSExEmglxIQzEgX9Sut4DzgJ/Nb7Q/0GGbnFc16IHB0uxMrYq7g==
X-Received: by 2002:ac2:5e2e:0:b0:4fb:9446:598b with SMTP id o14-20020ac25e2e000000b004fb9446598bmr1741883lfg.27.1690553620358;
        Fri, 28 Jul 2023 07:13:40 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id n21-20020a195515000000b004fad5602c18sm836201lfe.73.2023.07.28.07.13.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 07:13:39 -0700 (PDT)
Message-ID: <4d6d460f-445e-cb74-5a63-320f39ae6949@linaro.org>
Date:   Fri, 28 Jul 2023 17:13:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 26/33] iris: platform: sm8550: add capability file for
 sm8550
Content-Language: en-GB
To:     Vikash Garodia <quic_vgarodia@quicinc.com>,
        stanimir.k.varbanov@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org,
        hans.verkuil@cisco.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     quic_dikshita@quicinc.com
References: <1690550624-14642-1-git-send-email-quic_vgarodia@quicinc.com>
 <1690550624-14642-27-git-send-email-quic_vgarodia@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1690550624-14642-27-git-send-email-quic_vgarodia@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28/07/2023 16:23, Vikash Garodia wrote:
> From: Dikshita Agarwal <quic_dikshita@quicinc.com>
> 
> This implements all the capabilities supported by sm8550.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>   .../iris/platform/sm8550/inc/msm_vidc_sm8550.h     |   14 +
>   .../iris/platform/sm8550/src/msm_vidc_sm8550.c     | 1727 ++++++++++++++++++++
>   2 files changed, 1741 insertions(+)
>   create mode 100644 drivers/media/platform/qcom/iris/platform/sm8550/inc/msm_vidc_sm8550.h
>   create mode 100644 drivers/media/platform/qcom/iris/platform/sm8550/src/msm_vidc_sm8550.c
> 
> diff --git a/drivers/media/platform/qcom/iris/platform/sm8550/inc/msm_vidc_sm8550.h b/drivers/media/platform/qcom/iris/platform/sm8550/inc/msm_vidc_sm8550.h
> new file mode 100644
> index 0000000..0a2f172
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/platform/sm8550/inc/msm_vidc_sm8550.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _MSM_VIDC_SM8550_H_
> +#define _MSM_VIDC_SM8550_H_
> +
> +#include "msm_vidc_core.h"
> +
> +int msm_vidc_init_platform_sm8550(struct msm_vidc_core *core);
> +
> +#endif // _MSM_VIDC_SM8550_H_
> diff --git a/drivers/media/platform/qcom/iris/platform/sm8550/src/msm_vidc_sm8550.c b/drivers/media/platform/qcom/iris/platform/sm8550/src/msm_vidc_sm8550.c
> new file mode 100644
> index 0000000..2408556
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/platform/sm8550/src/msm_vidc_sm8550.c
> @@ -0,0 +1,1727 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <dt-bindings/clock/qcom,sm8550-gcc.h>
> +#include <dt-bindings/clock/qcom,sm8450-videocc.h>
> +
> +#include "hfi_command.h"
> +#include "hfi_property.h"
> +#include "msm_vidc_control.h"
> +#include "msm_vidc_debug.h"
> +#include "msm_vidc_iris3.h"
> +#include "msm_vidc_sm8550.h"
> +#include "msm_vidc_platform.h"
> +
> +/* version: major[24:31], minor[16:23], revision[0:15] */
> +#define DRIVER_VERSION          0x04000000
> +#define DEFAULT_VIDEO_CONCEAL_COLOR_BLACK 0x8020010
> +#define MAX_BASE_LAYER_PRIORITY_ID 63
> +#define MAX_OP_POINT            31
> +#define MAX_BITRATE             245000000
> +#define DEFAULT_BITRATE         20000000
> +#define MINIMUM_FPS             1
> +#define MAXIMUM_FPS             480
> +#define MAXIMUM_DEC_FPS         960
> +#define MAX_QP                  51
> +#define DEFAULT_QP              20
> +#define MAX_CONSTANT_QUALITY    100
> +#define MIN_SLICE_BYTE_SIZE     512
> +#define MAX_SLICE_BYTE_SIZE       \
> +	((MAX_BITRATE) >> 3)
> +#define MAX_SLICE_MB_SIZE         \
> +	(((4096 + 15) >> 4) * ((2304 + 15) >> 4))
> +
> +#define ENC     MSM_VIDC_ENCODER
> +#define DEC     MSM_VIDC_DECODER
> +#define H264    MSM_VIDC_H264
> +#define HEVC    MSM_VIDC_HEVC
> +#define VP9     MSM_VIDC_VP9

Another redefinition. Inline it.

> +#define CODECS_ALL     (H264 | HEVC | VP9)
> +#define MAXIMUM_OVERRIDE_VP9_FPS 200
> +
> +static struct codec_info codec_data_sm8550[] = {
> +	{
> +		.v4l2_codec  = V4L2_PIX_FMT_H264,
> +		.vidc_codec  = MSM_VIDC_H264,
> +		.pixfmt_name = "AVC",

Have you considered using existing code which enumerates formats? For 
example, it is much better to refactor v4l_fill_fmtdesc() to allow 
getting the description instead of adding your own names here.
Not to mention that printk supports %p4cc for printing fourcc values. I 
hope you knew that.

> +	},
> +	{
> +		.v4l2_codec  = V4L2_PIX_FMT_HEVC,
> +		.vidc_codec  = MSM_VIDC_HEVC,
> +		.pixfmt_name = "HEVC",
> +	},
> +	{
> +		.v4l2_codec  = V4L2_PIX_FMT_VP9,
> +		.vidc_codec  = MSM_VIDC_VP9,
> +		.pixfmt_name = "VP9",
> +	},
> +};
> +
> +static struct color_format_info color_format_data_sm8550[] = {
> +	{
> +		.v4l2_color_format = V4L2_PIX_FMT_NV12,
> +		.vidc_color_format = MSM_VIDC_FMT_NV12,
> +		.pixfmt_name       = "NV12",
> +	},
> +	{
> +		.v4l2_color_format = V4L2_PIX_FMT_NV21,
> +		.vidc_color_format = MSM_VIDC_FMT_NV21,
> +		.pixfmt_name       = "NV21",
> +	},
> +	{
> +		.v4l2_color_format = V4L2_PIX_FMT_QC08C,
> +		.vidc_color_format = MSM_VIDC_FMT_NV12C,
> +		.pixfmt_name       = "NV12C",
> +	},
> +	{
> +		.v4l2_color_format = V4L2_PIX_FMT_QC10C,
> +		.vidc_color_format = MSM_VIDC_FMT_TP10C,
> +		.pixfmt_name       = "TP10C",
> +	},
> +	{
> +		.v4l2_color_format = V4L2_PIX_FMT_RGBA32,
> +		.vidc_color_format = MSM_VIDC_FMT_RGBA8888,
> +		.pixfmt_name       = "RGBA",
> +	},
> +};
> +
> +static struct color_primaries_info color_primaries_data_sm8550[] = {
> +	{
> +		.v4l2_color_primaries  = V4L2_COLORSPACE_DEFAULT,
> +		.vidc_color_primaries  = MSM_VIDC_PRIMARIES_RESERVED,
> +	},
> +	{
> +		.v4l2_color_primaries  = V4L2_COLORSPACE_REC709,
> +		.vidc_color_primaries  = MSM_VIDC_PRIMARIES_BT709,
> +	},
> +	{
> +		.v4l2_color_primaries  = V4L2_COLORSPACE_470_SYSTEM_M,
> +		.vidc_color_primaries  = MSM_VIDC_PRIMARIES_BT470_SYSTEM_M,
> +	},
> +	{
> +		.v4l2_color_primaries  = V4L2_COLORSPACE_470_SYSTEM_BG,
> +		.vidc_color_primaries  = MSM_VIDC_PRIMARIES_BT470_SYSTEM_BG,
> +	},
> +	{
> +		.v4l2_color_primaries  = V4L2_COLORSPACE_SMPTE170M,
> +		.vidc_color_primaries  = MSM_VIDC_PRIMARIES_BT601_525,
> +	},
> +	{
> +		.v4l2_color_primaries  = V4L2_COLORSPACE_SMPTE240M,
> +		.vidc_color_primaries  = MSM_VIDC_PRIMARIES_SMPTE_ST240M,
> +	},
> +	{
> +		.v4l2_color_primaries  = V4L2_COLORSPACE_BT2020,
> +		.vidc_color_primaries  = MSM_VIDC_PRIMARIES_BT2020,
> +	},
> +	{
> +		.v4l2_color_primaries  = V4L2_COLORSPACE_DCI_P3,
> +		.vidc_color_primaries  = MSM_VIDC_PRIMARIES_SMPTE_RP431_2,
> +	},
> +};
> +
> +static struct transfer_char_info transfer_char_data_sm8550[] = {
> +	{
> +		.v4l2_transfer_char  = V4L2_XFER_FUNC_DEFAULT,
> +		.vidc_transfer_char  = MSM_VIDC_TRANSFER_RESERVED,
> +	},
> +	{
> +		.v4l2_transfer_char  = V4L2_XFER_FUNC_709,
> +		.vidc_transfer_char  = MSM_VIDC_TRANSFER_BT709,
> +	},
> +	{
> +		.v4l2_transfer_char  = V4L2_XFER_FUNC_SMPTE240M,
> +		.vidc_transfer_char  = MSM_VIDC_TRANSFER_SMPTE_ST240M,
> +	},
> +	{
> +		.v4l2_transfer_char  = V4L2_XFER_FUNC_SRGB,
> +		.vidc_transfer_char  = MSM_VIDC_TRANSFER_SRGB_SYCC,
> +	},
> +	{
> +		.v4l2_transfer_char  = V4L2_XFER_FUNC_SMPTE2084,
> +		.vidc_transfer_char  = MSM_VIDC_TRANSFER_SMPTE_ST2084_PQ,
> +	},
> +};
> +
> +static struct matrix_coeff_info matrix_coeff_data_sm8550[] = {
> +	{
> +		.v4l2_matrix_coeff  = V4L2_YCBCR_ENC_DEFAULT,
> +		.vidc_matrix_coeff  = MSM_VIDC_MATRIX_COEFF_RESERVED,
> +	},
> +	{
> +		.v4l2_matrix_coeff  = V4L2_YCBCR_ENC_709,
> +		.vidc_matrix_coeff  = MSM_VIDC_MATRIX_COEFF_BT709,
> +	},
> +	{
> +		.v4l2_matrix_coeff  = V4L2_YCBCR_ENC_XV709,
> +		.vidc_matrix_coeff  = MSM_VIDC_MATRIX_COEFF_BT709,
> +	},
> +	{
> +		.v4l2_matrix_coeff  = V4L2_YCBCR_ENC_XV601,
> +		.vidc_matrix_coeff  = MSM_VIDC_MATRIX_COEFF_BT470_SYS_BG_OR_BT601_625,
> +	},
> +	{
> +		.v4l2_matrix_coeff  = V4L2_YCBCR_ENC_601,
> +		.vidc_matrix_coeff  = MSM_VIDC_MATRIX_COEFF_BT601_525_BT1358_525_OR_625,
> +	},
> +	{
> +		.v4l2_matrix_coeff  = V4L2_YCBCR_ENC_SMPTE240M,
> +		.vidc_matrix_coeff  = MSM_VIDC_MATRIX_COEFF_SMPTE_ST240,
> +	},
> +	{
> +		.v4l2_matrix_coeff  = V4L2_YCBCR_ENC_BT2020,
> +		.vidc_matrix_coeff  = MSM_VIDC_MATRIX_COEFF_BT2020_NON_CONSTANT,
> +	},
> +	{
> +		.v4l2_matrix_coeff  = V4L2_YCBCR_ENC_BT2020_CONST_LUM,
> +		.vidc_matrix_coeff  = MSM_VIDC_MATRIX_COEFF_BT2020_CONSTANT,
> +	},
> +};

Are you going to say that these tables are platform-specific instead of 
being generic to the driver?

> +
> +static struct msm_platform_core_capability core_data_sm8550[] = {
> +	/* {type, value} */
> +	{ENC_CODECS, H264 | HEVC},
> +	{DEC_CODECS, H264 | HEVC | VP9},
> +	{MAX_SESSION_COUNT, 16},
> +	{MAX_NUM_720P_SESSIONS, 16},
> +	{MAX_NUM_1080P_SESSIONS, 16},
> +	{MAX_NUM_4K_SESSIONS, 8},
> +	{MAX_NUM_8K_SESSIONS, 2},
> +	{MAX_RT_MBPF, 174080},	/* (8192x4352)/256 + (4096x2176)/256*/
> +	{MAX_MBPF, 278528}, /* ((8192x4352)/256) * 2 */
> +	{MAX_MBPS, 7833600},	/* max_load
> +				 * 7680x4320@60fps or 3840x2176@240fps
> +				 * which is greater than 4096x2176@120fps,
> +				 * 8192x4320@48fps
> +				 */
> +	{MAX_MBPF_HQ, 8160}, /* ((1920x1088)/256) */
> +	{MAX_MBPS_HQ, 489600}, /* ((1920x1088)/256)@60fps */
> +	{MAX_MBPF_B_FRAME, 32640}, /* 3840x2176/256 */
> +	{MAX_MBPS_B_FRAME, 1958400}, /* 3840x2176/256 MBs@60fps */
> +	{MAX_MBPS_ALL_INTRA, 1044480}, /* 4096x2176/256 MBs@30fps */
> +	{MAX_ENH_LAYER_COUNT, 5},
> +	{NUM_VPP_PIPE, 4},
> +	{SW_PC, 1},
> +	{FW_UNLOAD, 0},
> +	{HW_RESPONSE_TIMEOUT, HW_RESPONSE_TIMEOUT_VALUE}, /* 1000 ms */
> +	{SW_PC_DELAY,         SW_PC_DELAY_VALUE        }, /* 1500 ms (>HW_RESPONSE_TIMEOUT)*/
> +	{FW_UNLOAD_DELAY,     FW_UNLOAD_DELAY_VALUE    }, /* 3000 ms (>SW_PC_DELAY)*/
> +	{DCVS, 1},
> +	{DECODE_BATCH, 1},
> +	{DECODE_BATCH_TIMEOUT, 200},
> +	{STATS_TIMEOUT_MS, 2000},
> +	{NON_FATAL_FAULTS, 1},
> +	{DEVICE_CAPS, V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING},

Unless there is a good reason, please change this to be a proper data 
structure instead of being a type-value array. With the T-V it is 
impossible to notice if the value is missing or duplicated. This comment 
also applies to the next 'capability' array.

> +};
> +
> +static struct msm_platform_inst_capability instance_cap_data_sm8550[] = {
> +	/* {cap, domain, codec,
> +	 *      min, max, step_or_mask, value,
> +	 *      v4l2_id,
> +	 *      hfi_id,
> +	 *      flags}
> +	 */
> +	{FRAME_WIDTH, DEC, CODECS_ALL, 96, 8192, 1, 1920},
> +
> +	{FRAME_WIDTH, DEC, VP9, 96, 4096, 1, 1920},
> +
> +	{FRAME_WIDTH, ENC, CODECS_ALL, 128, 8192, 1, 1920},
> +
> +	{FRAME_WIDTH, ENC, HEVC, 96, 8192, 1, 1920},
> +
> +	{LOSSLESS_FRAME_WIDTH, ENC, CODECS_ALL, 128, 4096, 1, 1920},
> +
> +	{LOSSLESS_FRAME_WIDTH, ENC, HEVC, 96, 4096, 1, 1920},
> +
> +	{FRAME_HEIGHT, DEC, CODECS_ALL, 96, 8192, 1, 1080},
> +
> +	{FRAME_HEIGHT, DEC, VP9, 96, 4096, 1, 1080},
> +
> +	{FRAME_HEIGHT, ENC, CODECS_ALL, 128, 8192, 1, 1080},
> +
> +	{FRAME_HEIGHT, ENC, HEVC, 96, 8192, 1, 1080},
> +
> +	{LOSSLESS_FRAME_HEIGHT, ENC, CODECS_ALL, 128, 4096, 1, 1080},
> +
> +	{LOSSLESS_FRAME_HEIGHT, ENC, HEVC, 96, 4096, 1, 1080},
> +
> +	{PIX_FMTS, ENC | DEC, H264,
> +		MSM_VIDC_FMT_NV12,
> +		MSM_VIDC_FMT_NV12C,
> +		MSM_VIDC_FMT_NV12 | MSM_VIDC_FMT_NV21 | MSM_VIDC_FMT_NV12C,
> +		MSM_VIDC_FMT_NV12C},
> +
> +	{PIX_FMTS, ENC | DEC, HEVC | VP9,
> +		MSM_VIDC_FMT_NV12,
> +		MSM_VIDC_FMT_TP10C,
> +		MSM_VIDC_FMT_NV12 | MSM_VIDC_FMT_NV21 | MSM_VIDC_FMT_NV12C |
> +		MSM_VIDC_FMT_TP10C,
> +		MSM_VIDC_FMT_NV12C},
> +
> +	{MIN_BUFFERS_INPUT, ENC | DEC, CODECS_ALL, 0, 64, 1, 4,
> +		V4L2_CID_MIN_BUFFERS_FOR_OUTPUT,
> +		0,
> +		CAP_FLAG_VOLATILE},
> +
> +	{MIN_BUFFERS_OUTPUT, ENC | DEC, CODECS_ALL,
> +		0, 64, 1, 4,
> +		V4L2_CID_MIN_BUFFERS_FOR_CAPTURE,
> +		HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_VOLATILE},
> +
> +	/* (8192 * 4320) / 256 */
> +	{MBPF, ENC, CODECS_ALL, 64, 138240, 1, 138240},
> +
> +	{MBPF, ENC, HEVC, 36, 138240, 1, 138240},
> +
> +	{MBPF, DEC, CODECS_ALL, 36, 138240, 1, 138240},
> +
> +	/* (4096 * 2304) / 256 */
> +	{MBPF, DEC, VP9, 36, 36864, 1, 36864},
> +
> +	/* (4096 * 2304) / 256 */
> +	{LOSSLESS_MBPF, ENC, H264 | HEVC, 64, 36864, 1, 36864},
> +
> +	/* Batch Mode Decode */
> +	/* TODO: update with new values based on updated voltage corner */
> +	{BATCH_MBPF, DEC, H264 | HEVC | VP9, 64, 34816, 1, 34816},
> +
> +	/* (4096 * 2304) / 256 */
> +	{BATCH_FPS, DEC, H264 | HEVC | VP9, 1, 120, 1, 120},
> +
> +	{FRAME_RATE, ENC | DEC, CODECS_ALL,
> +		(MINIMUM_FPS << 16), (MAXIMUM_FPS << 16),
> +		1, (DEFAULT_FPS << 16),
> +		0,
> +		HFI_PROP_FRAME_RATE,
> +		CAP_FLAG_OUTPUT_PORT},
> +
> +	{OPERATING_RATE, ENC | DEC, CODECS_ALL,
> +		(MINIMUM_FPS << 16), (MAXIMUM_FPS << 16),
> +		1, (DEFAULT_FPS << 16)},
> +
> +	{INPUT_RATE, ENC | DEC, CODECS_ALL,
> +		(MINIMUM_FPS << 16), INT_MAX,
> +		1, (DEFAULT_FPS << 16)},
> +
> +	{TIMESTAMP_RATE, ENC | DEC, CODECS_ALL,
> +		(MINIMUM_FPS << 16), INT_MAX,
> +		1, (DEFAULT_FPS << 16)},
> +
> +	{SCALE_FACTOR, ENC, H264 | HEVC, 1, 8, 1, 8},
> +
> +	{MB_CYCLES_VSP, ENC, CODECS_ALL, 25, 25, 1, 25},
> +
> +	{MB_CYCLES_VSP, DEC, CODECS_ALL, 25, 25, 1, 25},
> +
> +	{MB_CYCLES_VSP, DEC, VP9, 60, 60, 1, 60},
> +
> +	{MB_CYCLES_VPP, ENC, CODECS_ALL, 675, 675, 1, 675},
> +
> +	{MB_CYCLES_VPP, DEC, CODECS_ALL, 200, 200, 1, 200},
> +
> +	{MB_CYCLES_LP, ENC, CODECS_ALL, 320, 320, 1, 320},
> +
> +	{MB_CYCLES_LP, DEC, CODECS_ALL, 200, 200, 1, 200},
> +
> +	{MB_CYCLES_FW, ENC | DEC, CODECS_ALL, 489583, 489583, 1, 489583},
> +
> +	{MB_CYCLES_FW_VPP, ENC, CODECS_ALL, 48405, 48405, 1, 48405},
> +
> +	{MB_CYCLES_FW_VPP, DEC, CODECS_ALL, 66234, 66234, 1, 66234},
> +
> +	{HFLIP, ENC, CODECS_ALL,
> +		0, 1, 1, 0,
> +		V4L2_CID_HFLIP,
> +		HFI_PROP_FLIP,
> +		CAP_FLAG_OUTPUT_PORT |
> +		CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED},
> +
> +	{VFLIP, ENC, CODECS_ALL,
> +		0, 1, 1, 0,
> +		V4L2_CID_VFLIP,
> +		HFI_PROP_FLIP,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +		CAP_FLAG_DYNAMIC_ALLOWED},
> +
> +	{ROTATION, ENC, CODECS_ALL,
> +		0, 270, 90, 0,
> +		V4L2_CID_ROTATE,
> +		HFI_PROP_ROTATION,
> +		CAP_FLAG_OUTPUT_PORT},
> +
> +	{HEADER_MODE, ENC, CODECS_ALL,
> +		V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,
> +		V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
> +		BIT(V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE) |
> +		BIT(V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME),
> +		V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,
> +		V4L2_CID_MPEG_VIDEO_HEADER_MODE,
> +		HFI_PROP_SEQ_HEADER_MODE,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU},
> +
> +	{PREPEND_SPSPPS_TO_IDR, ENC, CODECS_ALL,
> +		0, 1, 1, 0,
> +		V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR},
> +
> +	{WITHOUT_STARTCODE, ENC, CODECS_ALL,
> +		0, 1, 1, 0,
> +		V4L2_CID_MPEG_VIDEO_HEVC_WITHOUT_STARTCODE,
> +		HFI_PROP_NAL_LENGTH_FIELD,
> +		CAP_FLAG_OUTPUT_PORT},
> +
> +	{NAL_LENGTH_FIELD, ENC, CODECS_ALL,
> +		V4L2_MPEG_VIDEO_HEVC_SIZE_0,
> +		V4L2_MPEG_VIDEO_HEVC_SIZE_4,
> +		BIT(V4L2_MPEG_VIDEO_HEVC_SIZE_0) |
> +		BIT(V4L2_MPEG_VIDEO_HEVC_SIZE_4),
> +		V4L2_MPEG_VIDEO_HEVC_SIZE_0,
> +		V4L2_CID_MPEG_VIDEO_HEVC_SIZE_OF_LENGTH_FIELD,
> +		HFI_PROP_NAL_LENGTH_FIELD,
> +		CAP_FLAG_MENU | CAP_FLAG_OUTPUT_PORT},
> +
> +	/* TODO: Firmware introduced enumeration type for this
> +	 * with and without seq header.
> +	 */
> +	{REQUEST_I_FRAME, ENC, H264 | HEVC,
> +		0, 0, 0, 0,
> +		V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME,
> +		HFI_PROP_REQUEST_SYNC_FRAME,
> +		CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED},
> +
> +	/* Enc: Keeping CABAC and CAVLC as same bitrate.
> +	 * Dec: there's no use of Bitrate cap
> +	 */
> +	{BIT_RATE, ENC, H264 | HEVC,
> +		1, MAX_BITRATE, 1, DEFAULT_BITRATE,
> +		V4L2_CID_MPEG_VIDEO_BITRATE,
> +		HFI_PROP_TOTAL_BITRATE,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +		CAP_FLAG_DYNAMIC_ALLOWED},
> +
> +	{BITRATE_MODE, ENC, H264,
> +		V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
> +		V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
> +		BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_VBR) |
> +		BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_CBR),
> +		V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
> +		V4L2_CID_MPEG_VIDEO_BITRATE_MODE,
> +		HFI_PROP_RATE_CONTROL,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU},
> +
> +	{BITRATE_MODE, ENC, HEVC,
> +		V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
> +		V4L2_MPEG_VIDEO_BITRATE_MODE_CQ,
> +		BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_VBR) |
> +		BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_CBR) |
> +		BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_CQ),
> +		V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
> +		V4L2_CID_MPEG_VIDEO_BITRATE_MODE,
> +		HFI_PROP_RATE_CONTROL,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU},
> +
> +	{CABAC_MAX_BITRATE, ENC, H264 | HEVC, 0,
> +		160000000, 1, 160000000},
> +
> +	{CAVLC_MAX_BITRATE, ENC, H264, 0,
> +		220000000, 1, 220000000},
> +
> +	{ALLINTRA_MAX_BITRATE, ENC, H264 | HEVC, 0,
> +		245000000, 1, 245000000},
> +
> +	{NUM_COMV, DEC, CODECS_ALL,
> +		0, INT_MAX, 1, 0},
> +
> +	{LOSSLESS, ENC, HEVC,
> +		0, 1, 1, 0,
> +		V4L2_CID_MPEG_VIDEO_HEVC_LOSSLESS_CU},
> +
> +	{FRAME_SKIP_MODE, ENC, H264 | HEVC,
> +		V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
> +		V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
> +		BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED) |
> +		BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT) |
> +		BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT),
> +		V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
> +		V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE,
> +		0,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU},
> +
> +	{FRAME_RC_ENABLE, ENC, H264 | HEVC,
> +		0, 1, 1, 1,
> +		V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE},
> +
> +	{CONSTANT_QUALITY, ENC, HEVC,
> +		1, MAX_CONSTANT_QUALITY, 1, 90,
> +		V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY,
> +		HFI_PROP_CONSTANT_QUALITY,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +		CAP_FLAG_DYNAMIC_ALLOWED},
> +
> +	{GOP_SIZE, ENC, CODECS_ALL,
> +		0, INT_MAX, 1, 2 * DEFAULT_FPS - 1,
> +		V4L2_CID_MPEG_VIDEO_GOP_SIZE,
> +		HFI_PROP_MAX_GOP_FRAMES,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +		CAP_FLAG_DYNAMIC_ALLOWED},
> +
> +	{GOP_CLOSURE, ENC, H264 | HEVC,
> +		0, 1, 1, 1,
> +		V4L2_CID_MPEG_VIDEO_GOP_CLOSURE,
> +		0},
> +
> +	{B_FRAME, ENC, H264 | HEVC,
> +		0, 7, 1, 0,
> +		V4L2_CID_MPEG_VIDEO_B_FRAMES,
> +		HFI_PROP_MAX_B_FRAMES,
> +		CAP_FLAG_OUTPUT_PORT},
> +
> +	{LTR_COUNT, ENC, H264 | HEVC,
> +		0, MAX_LTR_FRAME_COUNT_2, 1, 0,
> +		V4L2_CID_MPEG_VIDEO_LTR_COUNT,
> +		HFI_PROP_LTR_COUNT,
> +		CAP_FLAG_OUTPUT_PORT},
> +
> +	{USE_LTR, ENC, H264 | HEVC,
> +		0,
> +		((1 << MAX_LTR_FRAME_COUNT_2) - 1),
> +		0, 0,
> +		V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES,
> +		HFI_PROP_LTR_USE,
> +		CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED},
> +
> +	{MARK_LTR, ENC, H264 | HEVC,
> +		INVALID_DEFAULT_MARK_OR_USE_LTR,
> +		(MAX_LTR_FRAME_COUNT_2 - 1),
> +		1, INVALID_DEFAULT_MARK_OR_USE_LTR,
> +		V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX,
> +		HFI_PROP_LTR_MARK,
> +		CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED},
> +
> +	{BASELAYER_PRIORITY, ENC, H264,
> +		0, MAX_BASE_LAYER_PRIORITY_ID, 1, 0,
> +		V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID,
> +		HFI_PROP_BASELAYER_PRIORITYID,
> +		CAP_FLAG_OUTPUT_PORT},
> +
> +	{IR_TYPE, ENC, H264 | HEVC,
> +		V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
> +		V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC,
> +		BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM) |
> +		BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC),
> +		V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
> +		V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE,
> +		0,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU},
> +
> +	{IR_PERIOD, ENC, H264 | HEVC,
> +		0, INT_MAX, 1, 0,
> +		V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD,
> +		0,
> +		CAP_FLAG_INPUT_PORT | CAP_FLAG_OUTPUT_PORT |
> +		CAP_FLAG_DYNAMIC_ALLOWED},
> +
> +	{AU_DELIMITER, ENC, H264 | HEVC,
> +		0, 1, 1, 0,
> +		V4L2_CID_MPEG_VIDEO_AU_DELIMITER,
> +		HFI_PROP_AUD,
> +		CAP_FLAG_OUTPUT_PORT},
> +
> +	{MIN_QUALITY, ENC, H264 | HEVC,
> +		0, MAX_SUPPORTED_MIN_QUALITY, 70, MAX_SUPPORTED_MIN_QUALITY,
> +		0,
> +		HFI_PROP_MAINTAIN_MIN_QUALITY,
> +		CAP_FLAG_OUTPUT_PORT},
> +
> +	{VBV_DELAY, ENC, H264 | HEVC,
> +		200, 300, 100, 300,
> +		V4L2_CID_MPEG_VIDEO_VBV_DELAY,
> +		HFI_PROP_VBV_DELAY,
> +		CAP_FLAG_OUTPUT_PORT},
> +
> +	{PEAK_BITRATE, ENC, H264 | HEVC,
> +		/* default peak bitrate is 10% larger than avg bitrate */
> +		1, MAX_BITRATE, 1, DEFAULT_BITRATE,
> +		V4L2_CID_MPEG_VIDEO_BITRATE_PEAK,
> +		HFI_PROP_TOTAL_PEAK_BITRATE,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED},
> +
> +	{MIN_FRAME_QP, ENC, H264,
> +		MIN_QP_8BIT, MAX_QP, 1, MIN_QP_8BIT,
> +		V4L2_CID_MPEG_VIDEO_H264_MIN_QP,
> +		HFI_PROP_MIN_QP_PACKED,
> +		CAP_FLAG_OUTPUT_PORT},
> +
> +	{MIN_FRAME_QP, ENC, HEVC,
> +		MIN_QP_10BIT, MAX_QP, 1, MIN_QP_10BIT,
> +		V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP,
> +		HFI_PROP_MIN_QP_PACKED,
> +		CAP_FLAG_OUTPUT_PORT},
> +
> +	{I_FRAME_MIN_QP, ENC, H264,
> +		MIN_QP_8BIT, MAX_QP, 1, MIN_QP_8BIT,
> +		V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MIN_QP},
> +
> +	{I_FRAME_MIN_QP, ENC, HEVC,
> +		MIN_QP_10BIT, MAX_QP, 1, MIN_QP_10BIT,
> +		V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MIN_QP},
> +
> +	{P_FRAME_MIN_QP, ENC, H264,
> +		MIN_QP_8BIT, MAX_QP, 1, MIN_QP_8BIT,
> +		V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP},
> +
> +	{P_FRAME_MIN_QP, ENC, HEVC,
> +		MIN_QP_10BIT, MAX_QP, 1, MIN_QP_10BIT,
> +		V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MIN_QP},
> +
> +	{B_FRAME_MIN_QP, ENC, H264,
> +		MIN_QP_8BIT, MAX_QP, 1, MIN_QP_8BIT,
> +		V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MIN_QP},
> +
> +	{B_FRAME_MIN_QP, ENC, HEVC,
> +		MIN_QP_10BIT, MAX_QP, 1, MIN_QP_10BIT,
> +		V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MIN_QP},
> +
> +	{MAX_FRAME_QP, ENC, H264,
> +		MIN_QP_8BIT, MAX_QP, 1, MAX_QP,
> +		V4L2_CID_MPEG_VIDEO_H264_MAX_QP,
> +		HFI_PROP_MAX_QP_PACKED,
> +		CAP_FLAG_OUTPUT_PORT},
> +
> +	{MAX_FRAME_QP, ENC, HEVC,
> +		MIN_QP_10BIT, MAX_QP, 1, MAX_QP,
> +		V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP,
> +		HFI_PROP_MAX_QP_PACKED,
> +		CAP_FLAG_OUTPUT_PORT},
> +
> +	{I_FRAME_MAX_QP, ENC, H264,
> +		MIN_QP_8BIT, MAX_QP, 1, MAX_QP,
> +		V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MAX_QP},
> +
> +	{I_FRAME_MAX_QP, ENC, HEVC,
> +		MIN_QP_10BIT, MAX_QP, 1, MAX_QP,
> +		V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MAX_QP},
> +
> +	{P_FRAME_MAX_QP, ENC, H264,
> +		MIN_QP_8BIT, MAX_QP, 1, MAX_QP,
> +		V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP},
> +
> +	{P_FRAME_MAX_QP, ENC, HEVC,
> +		MIN_QP_10BIT, MAX_QP, 1, MAX_QP,
> +		V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MAX_QP},
> +
> +	{B_FRAME_MAX_QP, ENC, H264,
> +		MIN_QP_8BIT, MAX_QP, 1, MAX_QP,
> +		V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MAX_QP},
> +
> +	{B_FRAME_MAX_QP, ENC, HEVC,
> +		MIN_QP_10BIT, MAX_QP, 1, MAX_QP,
> +		V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MAX_QP},
> +
> +	{I_FRAME_QP, ENC, HEVC,
> +		MIN_QP_10BIT, MAX_QP, 1, DEFAULT_QP,
> +		V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP,
> +		HFI_PROP_QP_PACKED,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED},
> +
> +	{I_FRAME_QP, ENC, H264,
> +		MIN_QP_8BIT, MAX_QP, 1, DEFAULT_QP,
> +		V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP,
> +		HFI_PROP_QP_PACKED,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED},
> +
> +	{P_FRAME_QP, ENC, HEVC,
> +		MIN_QP_10BIT, MAX_QP, 1, DEFAULT_QP,
> +		V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_QP,
> +		HFI_PROP_QP_PACKED,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED},
> +
> +	{P_FRAME_QP, ENC, H264,
> +		MIN_QP_8BIT, MAX_QP, 1, DEFAULT_QP,
> +		V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP,
> +		HFI_PROP_QP_PACKED,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED},
> +
> +	{B_FRAME_QP, ENC, HEVC,
> +		MIN_QP_10BIT, MAX_QP, 1, DEFAULT_QP,
> +		V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP,
> +		HFI_PROP_QP_PACKED,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED},
> +
> +	{B_FRAME_QP, ENC, H264,
> +		MIN_QP_8BIT, MAX_QP, 1, DEFAULT_QP,
> +		V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP,
> +		HFI_PROP_QP_PACKED,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED},
> +
> +	{LAYER_TYPE, ENC, HEVC,
> +		V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B,
> +		V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P,
> +		BIT(V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B) |
> +		BIT(V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P),
> +		V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P,
> +		V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_TYPE,
> +		HFI_PROP_LAYER_ENCODING_TYPE,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU},
> +
> +	{LAYER_TYPE, ENC, H264,
> +		V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_B,
> +		V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
> +		BIT(V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_B) |
> +		BIT(V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P),
> +		V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
> +		V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE,
> +		HFI_PROP_LAYER_ENCODING_TYPE,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU},
> +
> +	{LAYER_ENABLE, ENC, H264,
> +		0, 1, 1, 0,
> +		V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING,
> +		HFI_PROP_LAYER_ENCODING_TYPE,
> +		CAP_FLAG_OUTPUT_PORT},
> +
> +	{LAYER_ENABLE, ENC, HEVC,
> +		0, 1, 1, 0,
> +		0,
> +		0,
> +		CAP_FLAG_OUTPUT_PORT},
> +
> +	{ENH_LAYER_COUNT, ENC, HEVC,
> +		0, 5, 1, 0,
> +		V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_LAYER,
> +		HFI_PROP_LAYER_COUNT,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED},
> +
> +	{ENH_LAYER_COUNT, ENC, H264,
> +		0, 5, 1, 0,
> +		V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER,
> +		HFI_PROP_LAYER_COUNT,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED},
> +
> +	{L0_BR, ENC, H264,
> +		1, MAX_BITRATE, 1, DEFAULT_BITRATE,
> +		V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR,
> +		HFI_PROP_BITRATE_LAYER1,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED},
> +
> +	{L0_BR, ENC, HEVC,
> +		1, MAX_BITRATE, 1, DEFAULT_BITRATE,
> +		V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L0_BR,
> +		HFI_PROP_BITRATE_LAYER1,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED},
> +
> +	{L1_BR, ENC, H264,
> +		1, MAX_BITRATE, 1, DEFAULT_BITRATE,
> +		V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR,
> +		HFI_PROP_BITRATE_LAYER2,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED},
> +
> +	{L1_BR, ENC, HEVC,
> +		1, MAX_BITRATE, 1, DEFAULT_BITRATE,
> +		V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L1_BR,
> +		HFI_PROP_BITRATE_LAYER2,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED},
> +
> +	{L2_BR, ENC, H264,
> +		1, MAX_BITRATE, 1, DEFAULT_BITRATE,
> +		V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR,
> +		HFI_PROP_BITRATE_LAYER3,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED},
> +
> +	{L2_BR, ENC, HEVC,
> +		1, MAX_BITRATE, 1, DEFAULT_BITRATE,
> +		V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L2_BR,
> +		HFI_PROP_BITRATE_LAYER3,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED},
> +
> +	{L3_BR, ENC, H264,
> +		1, MAX_BITRATE, 1, DEFAULT_BITRATE,
> +		V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR,
> +		HFI_PROP_BITRATE_LAYER4,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED},
> +	{L3_BR, ENC, HEVC,
> +		1, MAX_BITRATE, 1, DEFAULT_BITRATE,
> +		V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L3_BR,
> +		HFI_PROP_BITRATE_LAYER4,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED},
> +
> +	{L4_BR, ENC, H264,
> +		1, MAX_BITRATE, 1, DEFAULT_BITRATE,
> +		V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR,
> +		HFI_PROP_BITRATE_LAYER5,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED},
> +
> +	{L4_BR, ENC, HEVC,
> +		1, MAX_BITRATE, 1, DEFAULT_BITRATE,
> +		V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR,
> +		HFI_PROP_BITRATE_LAYER5,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED},
> +
> +	{L5_BR, ENC, H264,
> +		1, MAX_BITRATE, 1, DEFAULT_BITRATE,
> +		V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR,
> +		HFI_PROP_BITRATE_LAYER6,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED},
> +
> +	{L5_BR, ENC, HEVC,
> +		1, MAX_BITRATE, 1, DEFAULT_BITRATE,
> +		V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR,
> +		HFI_PROP_BITRATE_LAYER6,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
> +			CAP_FLAG_DYNAMIC_ALLOWED},
> +
> +	{ENTROPY_MODE, ENC, H264,
> +		V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
> +		V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
> +		BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC) |
> +		BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC),
> +		V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
> +		V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE,
> +		HFI_PROP_CABAC_SESSION,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU},
> +
> +	{ENTROPY_MODE, DEC, H264 | HEVC | VP9,
> +		V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
> +		V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
> +		BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC) |
> +		BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC),
> +		V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
> +		0,
> +		HFI_PROP_CABAC_SESSION},
> +
> +	{PROFILE, ENC | DEC, H264,
> +		V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> +		V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
> +		BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
> +		BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH) |
> +		BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
> +		BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
> +		BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH),
> +		V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +		V4L2_CID_MPEG_VIDEO_H264_PROFILE,
> +		HFI_PROP_PROFILE,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU},
> +
> +	{PROFILE, ENC | DEC, HEVC,
> +		V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> +		V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> +		BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
> +		BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE) |
> +		BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10),
> +		V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> +		V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
> +		HFI_PROP_PROFILE,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU},
> +
> +	{PROFILE, DEC, VP9,
> +		V4L2_MPEG_VIDEO_VP9_PROFILE_0,
> +		V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +		BIT(V4L2_MPEG_VIDEO_VP9_PROFILE_0) |
> +		BIT(V4L2_MPEG_VIDEO_VP9_PROFILE_2),
> +		V4L2_MPEG_VIDEO_VP9_PROFILE_0,
> +		V4L2_CID_MPEG_VIDEO_VP9_PROFILE,
> +		HFI_PROP_PROFILE,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU},
> +
> +	{LEVEL, ENC, H264,
> +		V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
> +		V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_2) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_0),
> +		V4L2_MPEG_VIDEO_H264_LEVEL_5_0,
> +		V4L2_CID_MPEG_VIDEO_H264_LEVEL,
> +		HFI_PROP_LEVEL,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU},
> +
> +	{LEVEL, ENC, HEVC,
> +		V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
> +		V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2,
> +		BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
> +		BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
> +		BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
> +		BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
> +		BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
> +		BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
> +		BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1) |
> +		BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5) |
> +		BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1) |
> +		BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2) |
> +		BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6) |
> +		BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1) |
> +		BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2),
> +		V4L2_MPEG_VIDEO_HEVC_LEVEL_5,
> +		V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
> +		HFI_PROP_LEVEL,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU},
> +
> +	{LEVEL, DEC, H264,
> +		V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
> +		V4L2_MPEG_VIDEO_H264_LEVEL_6_2,
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_2) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_0) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_1) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_2),
> +		V4L2_MPEG_VIDEO_H264_LEVEL_6_1,
> +		V4L2_CID_MPEG_VIDEO_H264_LEVEL,
> +		HFI_PROP_LEVEL,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU},
> +
> +	{LEVEL, DEC, HEVC,
> +		V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
> +		V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2,
> +		BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
> +		BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
> +		BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
> +		BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
> +		BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
> +		BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
> +		BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1) |
> +		BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5) |
> +		BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1) |
> +		BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2) |
> +		BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6) |
> +		BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1) |
> +		BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2),
> +		V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1,
> +		V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
> +		HFI_PROP_LEVEL,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU},
> +
> +	{LEVEL, DEC, VP9,
> +		V4L2_MPEG_VIDEO_VP9_LEVEL_1_0,
> +		V4L2_MPEG_VIDEO_VP9_LEVEL_6_0,
> +		BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_0) |
> +		BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_1) |
> +		BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_0) |
> +		BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_1) |
> +		BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_0) |
> +		BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_1) |
> +		BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_0) |
> +		BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_1) |
> +		BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_0) |
> +		BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_1) |
> +		BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_2) |
> +		BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_6_0),
> +		V4L2_MPEG_VIDEO_VP9_LEVEL_6_0,
> +		V4L2_CID_MPEG_VIDEO_VP9_LEVEL,
> +		HFI_PROP_LEVEL,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU},
> +
> +	{HEVC_TIER, ENC | DEC, HEVC,
> +		V4L2_MPEG_VIDEO_HEVC_TIER_MAIN,
> +		V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
> +		BIT(V4L2_MPEG_VIDEO_HEVC_TIER_MAIN) |
> +		BIT(V4L2_MPEG_VIDEO_HEVC_TIER_HIGH),
> +		V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
> +		V4L2_CID_MPEG_VIDEO_HEVC_TIER,
> +		HFI_PROP_TIER,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU},
> +
> +	{LF_MODE, ENC, H264,
> +		V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED,
> +		DB_H264_DISABLE_SLICE_BOUNDARY,
> +		BIT(V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED) |
> +		BIT(V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED) |
> +		BIT(DB_H264_DISABLE_SLICE_BOUNDARY),
> +		V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED,
> +		V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE,
> +		HFI_PROP_DEBLOCKING_MODE,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU},
> +
> +	{LF_MODE, ENC, HEVC,
> +		V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED,
> +		DB_HEVC_DISABLE_SLICE_BOUNDARY,
> +		BIT(V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED) |
> +		BIT(V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_ENABLED) |
> +		BIT(DB_HEVC_DISABLE_SLICE_BOUNDARY),
> +		V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_ENABLED,
> +		V4L2_CID_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE,
> +		HFI_PROP_DEBLOCKING_MODE,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU},
> +
> +	{LF_ALPHA, ENC, H264,
> +		-6, 6, 1, 0,
> +		V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA},
> +
> +	{LF_ALPHA, ENC, HEVC,
> +		-6, 6, 1, 0,
> +		V4L2_CID_MPEG_VIDEO_HEVC_LF_TC_OFFSET_DIV2},
> +
> +	{LF_BETA, ENC, H264,
> +		-6, 6, 1, 0,
> +		V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA},
> +
> +	{LF_BETA, ENC, HEVC,
> +		-6, 6, 1, 0,
> +		V4L2_CID_MPEG_VIDEO_HEVC_LF_BETA_OFFSET_DIV2},
> +
> +	{SLICE_MODE, ENC, H264 | HEVC,
> +		V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE,
> +		V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES,
> +		BIT(V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE) |
> +		BIT(V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) |
> +		BIT(V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES),
> +		V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE,
> +		V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE,
> +		0,
> +		CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU},
> +
> +	{SLICE_MAX_BYTES, ENC, H264 | HEVC,
> +		MIN_SLICE_BYTE_SIZE, MAX_SLICE_BYTE_SIZE,
> +		1, MIN_SLICE_BYTE_SIZE,
> +		V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES,
> +		HFI_PROP_MULTI_SLICE_BYTES_COUNT,
> +		CAP_FLAG_OUTPUT_PORT},
> +
> +	{SLICE_MAX_MB, ENC, H264 | HEVC,
> +		1, MAX_SLICE_MB_SIZE, 1, 1,
> +		V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB,
> +		HFI_PROP_MULTI_SLICE_MB_COUNT,
> +		CAP_FLAG_OUTPUT_PORT},
> +
> +	{MB_RC, ENC, H264 | HEVC,
> +		0, 1, 1, 1,
> +		V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE,
> +		0,
> +		CAP_FLAG_OUTPUT_PORT},
> +
> +	{TRANSFORM_8X8, ENC, H264,
> +		0, 1, 1, 1,
> +		V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM,
> +		HFI_PROP_8X8_TRANSFORM,
> +		CAP_FLAG_OUTPUT_PORT},
> +
> +	{CHROMA_QP_INDEX_OFFSET, ENC, HEVC,
> +		MIN_CHROMA_QP_OFFSET, MAX_CHROMA_QP_OFFSET,
> +		1, MAX_CHROMA_QP_OFFSET,
> +		V4L2_CID_MPEG_VIDEO_H264_CHROMA_QP_INDEX_OFFSET,
> +		HFI_PROP_CHROMA_QP_OFFSET,
> +		CAP_FLAG_OUTPUT_PORT},
> +
> +	{DISPLAY_DELAY_ENABLE, DEC, H264 | HEVC | VP9,
> +		0, 1, 1, 0,
> +		V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE,
> +		HFI_PROP_DECODE_ORDER_OUTPUT,
> +		CAP_FLAG_INPUT_PORT},
> +
> +	{DISPLAY_DELAY, DEC, H264 | HEVC | VP9,
> +		0, 1, 1, 0,
> +		V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY,
> +		HFI_PROP_DECODE_ORDER_OUTPUT,
> +		CAP_FLAG_INPUT_PORT},
> +
> +	{OUTPUT_ORDER, DEC, H264 | HEVC | VP9,
> +		0, 1, 1, 0,
> +		0,
> +		HFI_PROP_DECODE_ORDER_OUTPUT,
> +		CAP_FLAG_INPUT_PORT},
> +
> +	{INPUT_BUF_HOST_MAX_COUNT, ENC | DEC, CODECS_ALL,
> +		DEFAULT_MAX_HOST_BUF_COUNT, DEFAULT_MAX_HOST_BURST_BUF_COUNT,
> +		1, DEFAULT_MAX_HOST_BUF_COUNT,
> +		0,
> +		HFI_PROP_BUFFER_HOST_MAX_COUNT,
> +		CAP_FLAG_INPUT_PORT},
> +
> +	{OUTPUT_BUF_HOST_MAX_COUNT, ENC | DEC, CODECS_ALL,
> +		DEFAULT_MAX_HOST_BUF_COUNT, DEFAULT_MAX_HOST_BURST_BUF_COUNT,
> +		1, DEFAULT_MAX_HOST_BUF_COUNT,
> +		0,
> +		HFI_PROP_BUFFER_HOST_MAX_COUNT,
> +		CAP_FLAG_OUTPUT_PORT},
> +
> +	{CONCEAL_COLOR_8BIT, DEC, CODECS_ALL, 0x0, 0xff3fcff, 1,
> +		DEFAULT_VIDEO_CONCEAL_COLOR_BLACK,
> +		V4L2_CID_MPEG_VIDEO_MUTE_YUV,
> +		HFI_PROP_CONCEAL_COLOR_8BIT,
> +		CAP_FLAG_INPUT_PORT},
> +
> +	{CONCEAL_COLOR_10BIT, DEC, CODECS_ALL, 0x0, 0x3fffffff, 1,
> +		DEFAULT_VIDEO_CONCEAL_COLOR_BLACK,
> +		V4L2_CID_MPEG_VIDEO_MUTE_YUV,
> +		HFI_PROP_CONCEAL_COLOR_10BIT,
> +		CAP_FLAG_INPUT_PORT},
> +
> +	{STAGE, DEC | ENC, CODECS_ALL,
> +		MSM_VIDC_STAGE_1,
> +		MSM_VIDC_STAGE_2, 1,
> +		MSM_VIDC_STAGE_2,
> +		0,
> +		HFI_PROP_STAGE},
> +
> +	{PIPE, DEC | ENC, CODECS_ALL,
> +		MSM_VIDC_PIPE_1,
> +		MSM_VIDC_PIPE_4, 1,
> +		MSM_VIDC_PIPE_4,
> +		0,
> +		HFI_PROP_PIPE},
> +
> +	{POC, DEC, H264, 0, 2, 1, 1,
> +		0,
> +		HFI_PROP_PIC_ORDER_CNT_TYPE},
> +
> +	{QUALITY_MODE, ENC, CODECS_ALL,
> +		MSM_VIDC_MAX_QUALITY_MODE,
> +		MSM_VIDC_POWER_SAVE_MODE, 1,
> +		MSM_VIDC_POWER_SAVE_MODE},
> +
> +	{CODED_FRAMES, DEC, H264 | HEVC,
> +		CODED_FRAMES_PROGRESSIVE, CODED_FRAMES_INTERLACE,
> +		1, CODED_FRAMES_PROGRESSIVE,
> +		0,
> +		HFI_PROP_CODED_FRAMES},
> +
> +	{BIT_DEPTH, DEC, CODECS_ALL, BIT_DEPTH_8, BIT_DEPTH_10, 1, BIT_DEPTH_8,
> +		0,
> +		HFI_PROP_LUMA_CHROMA_BIT_DEPTH},
> +
> +	{BITSTREAM_SIZE_OVERWRITE, DEC, CODECS_ALL, 0, INT_MAX, 1, 0,
> +		0},
> +
> +	{DEFAULT_HEADER, DEC, CODECS_ALL,
> +		0, 1, 1, 0,
> +		0,
> +		HFI_PROP_DEC_DEFAULT_HEADER},
> +
> +	{RAP_FRAME, DEC, CODECS_ALL,
> +		0, 1, 1, 1,
> +		0,
> +		HFI_PROP_DEC_START_FROM_RAP_FRAME,
> +		CAP_FLAG_INPUT_PORT},
> +
> +	{SEQ_CHANGE_AT_SYNC_FRAME, DEC, CODECS_ALL,
> +		0, 1, 1, 1,
> +		0,
> +		HFI_PROP_SEQ_CHANGE_AT_SYNC_FRAME,
> +		CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED},
> +
> +	{ALL_INTRA, ENC, H264 | HEVC,
> +		0, 1, 1, 0,
> +		0,
> +		0,
> +		CAP_FLAG_OUTPUT_PORT},
> +};
> +
> +static struct msm_platform_inst_cap_dependency instance_cap_dependency_data_sm8550[] = {
> +	/* {cap, domain, codec,
> +	 *      children,
> +	 *      adjust, set}
> +	 */
> +
> +	{PIX_FMTS, ENC, H264,
> +		{IR_PERIOD}},
> +
> +	{PIX_FMTS, ENC, HEVC,
> +		{PROFILE, MIN_FRAME_QP, MAX_FRAME_QP, I_FRAME_QP, P_FRAME_QP,
> +			B_FRAME_QP, MIN_QUALITY, IR_PERIOD, LTR_COUNT}},
> +
> +	{PIX_FMTS, DEC, HEVC,
> +		{PROFILE}},
> +
> +	{FRAME_RATE, ENC, CODECS_ALL,
> +		{0},
> +		NULL,
> +		msm_vidc_set_q16},
> +
> +	{HFLIP, ENC, CODECS_ALL,
> +		{0},
> +		NULL,
> +		msm_vidc_set_flip},
> +
> +	{VFLIP, ENC, CODECS_ALL,
> +		{0},
> +		NULL,
> +		msm_vidc_set_flip},
> +
> +	{ROTATION, ENC, CODECS_ALL,
> +		{0},
> +		NULL,
> +		msm_vidc_set_rotation},
> +
> +	{HEADER_MODE, ENC, CODECS_ALL,
> +		{0},
> +		NULL,
> +		msm_vidc_set_header_mode},
> +
> +	{WITHOUT_STARTCODE, ENC, CODECS_ALL,
> +		{0},
> +		NULL,
> +		msm_vidc_set_nal_length},
> +
> +	{REQUEST_I_FRAME, ENC, H264 | HEVC,
> +		{0},
> +		NULL,
> +		msm_vidc_set_req_sync_frame},
> +
> +	{BIT_RATE, ENC, H264,
> +		{PEAK_BITRATE, L0_BR},
> +		msm_vidc_adjust_bitrate,
> +		msm_vidc_set_bitrate},
> +
> +	{BIT_RATE, ENC, HEVC,
> +		{PEAK_BITRATE, L0_BR},
> +		msm_vidc_adjust_bitrate,
> +		msm_vidc_set_bitrate},
> +
> +	{BITRATE_MODE, ENC, H264,
> +		{LTR_COUNT, IR_PERIOD, I_FRAME_QP, P_FRAME_QP,
> +			B_FRAME_QP, ENH_LAYER_COUNT, BIT_RATE,
> +			MIN_QUALITY, VBV_DELAY,
> +			PEAK_BITRATE, SLICE_MODE},
> +		msm_vidc_adjust_bitrate_mode,
> +		msm_vidc_set_u32_enum},
> +
> +	{BITRATE_MODE, ENC, HEVC,
> +		{LTR_COUNT, IR_PERIOD, I_FRAME_QP, P_FRAME_QP,
> +			B_FRAME_QP, CONSTANT_QUALITY, ENH_LAYER_COUNT,
> +			BIT_RATE, MIN_QUALITY, VBV_DELAY,
> +			PEAK_BITRATE, SLICE_MODE},
> +		msm_vidc_adjust_bitrate_mode,
> +		msm_vidc_set_u32_enum},
> +
> +	{CONSTANT_QUALITY, ENC, HEVC,
> +		{0},
> +		NULL,
> +		msm_vidc_set_constant_quality},
> +
> +	{GOP_SIZE, ENC, CODECS_ALL,
> +		{ALL_INTRA},
> +		msm_vidc_adjust_gop_size,
> +		msm_vidc_set_gop_size},
> +
> +	{B_FRAME, ENC, H264 | HEVC,
> +		{ALL_INTRA},
> +		msm_vidc_adjust_b_frame,
> +		msm_vidc_set_u32},
> +
> +	{LTR_COUNT, ENC, H264 | HEVC,
> +		{0},
> +		msm_vidc_adjust_ltr_count,
> +		msm_vidc_set_u32},
> +
> +	{USE_LTR, ENC, H264 | HEVC,
> +		{0},
> +		msm_vidc_adjust_use_ltr,
> +		msm_vidc_set_use_and_mark_ltr},
> +
> +	{MARK_LTR, ENC, H264 | HEVC,
> +		{0},
> +		msm_vidc_adjust_mark_ltr,
> +		msm_vidc_set_use_and_mark_ltr},
> +
> +	{IR_PERIOD, ENC, H264 | HEVC,
> +		{0},
> +		msm_vidc_adjust_ir_period,
> +		msm_vidc_set_ir_period},
> +
> +	{AU_DELIMITER, ENC, H264 | HEVC,
> +		{0},
> +		NULL,
> +		msm_vidc_set_u32},
> +
> +	{MIN_QUALITY, ENC, H264,
> +		{0},
> +		msm_vidc_adjust_min_quality,
> +		msm_vidc_set_u32},
> +
> +	{MIN_QUALITY, ENC, HEVC,
> +		{0},
> +		msm_vidc_adjust_min_quality,
> +		msm_vidc_set_u32},
> +
> +	{VBV_DELAY, ENC, H264 | HEVC,
> +		{0},
> +		NULL,
> +		msm_vidc_set_cbr_related_properties},
> +
> +	{PEAK_BITRATE, ENC, H264 | HEVC,
> +		{0},
> +		msm_vidc_adjust_peak_bitrate,
> +		msm_vidc_set_cbr_related_properties},
> +
> +	{MIN_FRAME_QP, ENC, H264,
> +		{0},
> +		NULL,
> +		msm_vidc_set_min_qp},
> +
> +	{MIN_FRAME_QP, ENC, HEVC,
> +		{0},
> +		msm_vidc_adjust_hevc_min_qp,
> +		msm_vidc_set_min_qp},
> +
> +	{MAX_FRAME_QP, ENC, H264,
> +		{0},
> +		NULL,
> +		msm_vidc_set_max_qp},
> +
> +	{MAX_FRAME_QP, ENC, HEVC,
> +		{0},
> +		msm_vidc_adjust_hevc_max_qp,
> +		msm_vidc_set_max_qp},
> +
> +	{I_FRAME_QP, ENC, HEVC,
> +		{0},
> +		msm_vidc_adjust_hevc_i_frame_qp,
> +		msm_vidc_set_frame_qp},
> +
> +	{I_FRAME_QP, ENC, H264,
> +		{0},
> +		NULL,
> +		msm_vidc_set_frame_qp},
> +
> +	{P_FRAME_QP, ENC, HEVC,
> +		{0},
> +		msm_vidc_adjust_hevc_p_frame_qp,
> +		msm_vidc_set_frame_qp},
> +
> +	{P_FRAME_QP, ENC, H264,
> +		{0},
> +		NULL,
> +		msm_vidc_set_frame_qp},
> +
> +	{B_FRAME_QP, ENC, HEVC,
> +		{0},
> +		msm_vidc_adjust_hevc_b_frame_qp,
> +		msm_vidc_set_frame_qp},
> +
> +	{B_FRAME_QP, ENC, H264,
> +		{0},
> +		NULL,
> +		msm_vidc_set_frame_qp},
> +
> +	{LAYER_TYPE, ENC, H264 | HEVC,
> +		{LTR_COUNT}},
> +
> +	{LAYER_ENABLE, ENC, H264 | HEVC,
> +		{0}},
> +
> +	{ENH_LAYER_COUNT, ENC, H264 | HEVC,
> +		{GOP_SIZE, B_FRAME, BIT_RATE, MIN_QUALITY, SLICE_MODE,
> +			LTR_COUNT},
> +		msm_vidc_adjust_layer_count,
> +		msm_vidc_set_layer_count_and_type},
> +
> +	{L0_BR, ENC, H264 | HEVC,
> +		{L1_BR},
> +		msm_vidc_adjust_layer_bitrate,
> +		msm_vidc_set_layer_bitrate},
> +
> +	{L1_BR, ENC, H264 | HEVC,
> +		{L2_BR},
> +		msm_vidc_adjust_layer_bitrate,
> +		msm_vidc_set_layer_bitrate},
> +
> +	{L2_BR, ENC, H264 | HEVC,
> +		{L3_BR},
> +		msm_vidc_adjust_layer_bitrate,
> +		msm_vidc_set_layer_bitrate},
> +
> +	{L3_BR, ENC, H264 | HEVC,
> +		{L4_BR},
> +		msm_vidc_adjust_layer_bitrate,
> +		msm_vidc_set_layer_bitrate},
> +
> +	{L4_BR, ENC, H264 | HEVC,
> +		{L5_BR},
> +		msm_vidc_adjust_layer_bitrate,
> +		msm_vidc_set_layer_bitrate},
> +
> +	{L5_BR, ENC, H264 | HEVC,
> +		{0},
> +		msm_vidc_adjust_layer_bitrate,
> +		msm_vidc_set_layer_bitrate},
> +
> +	{ENTROPY_MODE, ENC, H264,
> +		{BIT_RATE},
> +		msm_vidc_adjust_entropy_mode,
> +		msm_vidc_set_u32},
> +
> +	{PROFILE, ENC, H264,
> +		{ENTROPY_MODE, TRANSFORM_8X8},
> +		NULL,
> +		msm_vidc_set_u32_enum},
> +
> +	{PROFILE, DEC, H264,
> +		{ENTROPY_MODE},
> +		NULL,
> +		msm_vidc_set_u32_enum},
> +
> +	{PROFILE, ENC | DEC, HEVC,
> +		{0},
> +		msm_vidc_adjust_profile,
> +		msm_vidc_set_u32_enum},
> +
> +	{PROFILE, DEC, VP9,
> +		{0},
> +		NULL,
> +		msm_vidc_set_u32_enum},
> +
> +	{LEVEL, DEC, CODECS_ALL,
> +		{0},
> +		NULL,
> +		msm_vidc_set_u32_enum},
> +
> +	{LEVEL, ENC, CODECS_ALL,
> +		{0},
> +		NULL,
> +		msm_vidc_set_level},
> +
> +	{HEVC_TIER, ENC | DEC, HEVC,
> +		{0},
> +		NULL,
> +		msm_vidc_set_u32_enum},
> +
> +	{LF_MODE, ENC, CODECS_ALL,
> +		{0},
> +		NULL,
> +		msm_vidc_set_deblock_mode},
> +
> +	{SLICE_MODE, ENC, H264 | HEVC,
> +		{STAGE},
> +		msm_vidc_adjust_slice_count,
> +		msm_vidc_set_slice_count},
> +
> +	{TRANSFORM_8X8, ENC, H264,
> +		{0},
> +		msm_vidc_adjust_transform_8x8,
> +		msm_vidc_set_u32},
> +
> +	{CHROMA_QP_INDEX_OFFSET, ENC, HEVC,
> +		{0},
> +		msm_vidc_adjust_chroma_qp_index_offset,
> +		msm_vidc_set_chroma_qp_index_offset},
> +
> +	{DISPLAY_DELAY_ENABLE, DEC, H264 | HEVC | VP9,
> +		{OUTPUT_ORDER},
> +		NULL,
> +		NULL},
> +
> +	{DISPLAY_DELAY, DEC, H264 | HEVC | VP9,
> +		{OUTPUT_ORDER},
> +		NULL,
> +		NULL},
> +
> +	{OUTPUT_ORDER, DEC, H264 | HEVC | VP9,
> +		{0},
> +		msm_vidc_adjust_output_order,
> +		msm_vidc_set_u32},
> +
> +	{INPUT_BUF_HOST_MAX_COUNT, ENC | DEC, CODECS_ALL,
> +		{0},
> +		msm_vidc_adjust_input_buf_host_max_count,
> +		msm_vidc_set_u32},
> +
> +	{INPUT_BUF_HOST_MAX_COUNT, ENC, H264 | HEVC,
> +		{0},
> +		msm_vidc_adjust_input_buf_host_max_count,
> +		msm_vidc_set_u32},
> +
> +	{OUTPUT_BUF_HOST_MAX_COUNT, ENC | DEC, CODECS_ALL,
> +		{0},
> +		msm_vidc_adjust_output_buf_host_max_count,
> +		msm_vidc_set_u32},
> +
> +	{OUTPUT_BUF_HOST_MAX_COUNT, ENC, H264 | HEVC,
> +		{0},
> +		msm_vidc_adjust_output_buf_host_max_count,
> +		msm_vidc_set_u32},
> +
> +	{CONCEAL_COLOR_8BIT, DEC, CODECS_ALL,
> +		{0},
> +		NULL,
> +		msm_vidc_set_u32_packed},
> +
> +	{CONCEAL_COLOR_10BIT, DEC, CODECS_ALL,
> +		{0},
> +		NULL,
> +		msm_vidc_set_u32_packed},
> +
> +	{STAGE, ENC | DEC, CODECS_ALL,
> +		{0},
> +		NULL,
> +		msm_vidc_set_stage},
> +
> +	{STAGE, ENC, H264 | HEVC,
> +		{0},
> +		NULL,
> +		msm_vidc_set_stage},
> +
> +	{STAGE, DEC, H264 | HEVC | VP9,
> +		{0},
> +		NULL,
> +		msm_vidc_set_stage},
> +
> +	{PIPE, DEC | ENC, CODECS_ALL,
> +		{0},
> +		NULL,
> +		msm_vidc_set_pipe},
> +
> +	{RAP_FRAME, DEC, CODECS_ALL,
> +		{0},
> +		NULL,
> +		msm_vidc_set_u32},
> +
> +	{ALL_INTRA, ENC, H264 | HEVC,
> +		{LTR_COUNT, IR_PERIOD, SLICE_MODE, BIT_RATE},
> +		msm_vidc_adjust_all_intra,
> +		NULL},
> +};
> +
> +/* Default UBWC config for LPDDR5 */
> +static struct msm_vidc_ubwc_config_data ubwc_config_sm8550[] = {
> +	UBWC_CONFIG(8, 32, 16, 0, 1, 1, 1),
> +};
> +
> +static struct msm_vidc_format_capability format_data_sm8550 = {
> +	.codec_info = codec_data_sm8550,
> +	.codec_info_size = ARRAY_SIZE(codec_data_sm8550),
> +	.color_format_info = color_format_data_sm8550,
> +	.color_format_info_size = ARRAY_SIZE(color_format_data_sm8550),
> +	.color_prim_info = color_primaries_data_sm8550,
> +	.color_prim_info_size = ARRAY_SIZE(color_primaries_data_sm8550),
> +	.transfer_char_info = transfer_char_data_sm8550,
> +	.transfer_char_info_size = ARRAY_SIZE(transfer_char_data_sm8550),
> +	.matrix_coeff_info = matrix_coeff_data_sm8550,
> +	.matrix_coeff_info_size = ARRAY_SIZE(matrix_coeff_data_sm8550),
> +};
> +
> +/* name, min_kbps, max_kbps */
> +static const struct bw_table sm8550_bw_table[] = {
> +	{ "venus-cnoc",  1000, 1000     },
> +	{ "venus-ddr",   1000, 15000000 },

We have OPP tables for that. There is no need to limit the min/max, just 
put it to OPP.

> +};
> +
> +/* name */
> +static const struct pd_table sm8550_pd_table[] = {
> +	{ "iris-ctl" },
> +	{ "vcodec"   },
> +};
> +
> +/* name */
> +static const char * const sm8550_opp_table[] = { "mx", "mmcx", NULL };
> +
> +/* name, clock id, scaling */
> +static const struct clk_table sm8550_clk_table[] = {
> +	{ "gcc_video_axi0",         GCC_VIDEO_AXI0_CLK,     0 },
> +	{ "core_clk",               VIDEO_CC_MVS0C_CLK,     0 },
> +	{ "vcodec_clk",             VIDEO_CC_MVS0_CLK,      1 },
> +};

This strucuture looks like a perfect candidate to be replaced by 
devm_clk_bulk_get_all().

> +
> +/* name, exclusive_release */
> +static const struct clk_rst_table sm8550_clk_reset_table[] = {
> +	{ "video_axi_reset",        0  },

Can we assume that resets are generic at least?

> +};
> +
> +/* name, start, size, secure, dma_coherant, region, dma_mask */
> +const struct context_bank_table sm8550_context_bank_table[] = {
> +	{"qcom,vidc,cb-ns", 0x25800000, 0xba800000, 0, 1, MSM_VIDC_NON_SECURE, 0xe0000000 - 1},
> +	{"qcom,vidc,cb-sec-non-pxl",   0x01000000, 0x24800000, 1, 0, MSM_VIDC_SECURE_NONPIXEL,  0 },

Aren't these a properties of subdevices? If so, why are you putting them 
here?

> +};
> +
> +/* freq */
> +static struct freq_table sm8550_freq_table[] = {
> +	{533333333}, {444000000}, {366000000}, {338000000}, {240000000}

OPP table contents.

> +};
> +
> +/* register, value, mask */
> +static const struct reg_preset_table sm8550_reg_preset_table[] = {
> +	{ 0xB0088, 0x0, 0x11 },
> +};
> +
> +/* decoder properties */
> +static const u32 sm8550_vdec_psc_avc[] = {
> +	HFI_PROP_BITSTREAM_RESOLUTION,
> +	HFI_PROP_CROP_OFFSETS,
> +	HFI_PROP_CODED_FRAMES,
> +	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
> +	HFI_PROP_PIC_ORDER_CNT_TYPE,
> +	HFI_PROP_PROFILE,
> +	HFI_PROP_LEVEL,
> +	HFI_PROP_SIGNAL_COLOR_INFO,
> +};
> +
> +static const u32 sm8550_vdec_psc_hevc[] = {
> +	HFI_PROP_BITSTREAM_RESOLUTION,
> +	HFI_PROP_CROP_OFFSETS,
> +	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
> +	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
> +	HFI_PROP_PROFILE,
> +	HFI_PROP_LEVEL,
> +	HFI_PROP_TIER,
> +	HFI_PROP_SIGNAL_COLOR_INFO,
> +};
> +
> +static const u32 sm8550_vdec_psc_vp9[] = {
> +	HFI_PROP_BITSTREAM_RESOLUTION,
> +	HFI_PROP_CROP_OFFSETS,
> +	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
> +	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
> +	HFI_PROP_PROFILE,
> +	HFI_PROP_LEVEL,
> +};
> +
> +static const u32 sm8550_vdec_input_properties_avc[] = {
> +	HFI_PROP_NO_OUTPUT,
> +	HFI_PROP_SUBFRAME_INPUT,
> +};
> +
> +static const u32 sm8550_vdec_input_properties_hevc[] = {
> +	HFI_PROP_NO_OUTPUT,
> +	HFI_PROP_SUBFRAME_INPUT,
> +};
> +
> +static const u32 sm8550_vdec_input_properties_vp9[] = {
> +	HFI_PROP_NO_OUTPUT,
> +	HFI_PROP_SUBFRAME_INPUT,
> +};
> +
> +static const u32 sm8550_vdec_output_properties_avc[] = {
> +	HFI_PROP_WORST_COMPRESSION_RATIO,
> +	HFI_PROP_WORST_COMPLEXITY_FACTOR,
> +	HFI_PROP_PICTURE_TYPE,
> +	HFI_PROP_DPB_LIST,
> +	HFI_PROP_CABAC_SESSION,
> +};
> +
> +static const u32 sm8550_vdec_output_properties_hevc[] = {
> +	HFI_PROP_WORST_COMPRESSION_RATIO,
> +	HFI_PROP_WORST_COMPLEXITY_FACTOR,
> +	HFI_PROP_PICTURE_TYPE,
> +	HFI_PROP_DPB_LIST,
> +};
> +
> +static const u32 sm8550_vdec_output_properties_vp9[] = {
> +	HFI_PROP_WORST_COMPRESSION_RATIO,
> +	HFI_PROP_WORST_COMPLEXITY_FACTOR,
> +	HFI_PROP_PICTURE_TYPE,
> +	HFI_PROP_DPB_LIST,
> +};
> +
> +static const struct msm_vidc_platform_data sm8550_data = {
> +	/* resources dependent on other module */
> +	.bw_tbl = sm8550_bw_table,
> +	.bw_tbl_size = ARRAY_SIZE(sm8550_bw_table),
> +	.clk_tbl = sm8550_clk_table,
> +	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
> +	.clk_rst_tbl = sm8550_clk_reset_table,
> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
> +	.subcache_tbl = NULL,
> +	.subcache_tbl_size = 0,
> +
> +	/* populate context bank */
> +	.context_bank_tbl = sm8550_context_bank_table,
> +	.context_bank_tbl_size = ARRAY_SIZE(sm8550_context_bank_table),
> +
> +	/* populate power domain and opp table */
> +	.pd_tbl = sm8550_pd_table,
> +	.pd_tbl_size = ARRAY_SIZE(sm8550_pd_table),
> +	.opp_tbl = sm8550_opp_table,
> +	.opp_tbl_size = ARRAY_SIZE(sm8550_opp_table),
> +
> +	/* platform specific resources */
> +	.freq_tbl = sm8550_freq_table,
> +	.freq_tbl_size = ARRAY_SIZE(sm8550_freq_table),
> +	.reg_prst_tbl = sm8550_reg_preset_table,
> +	.reg_prst_tbl_size = ARRAY_SIZE(sm8550_reg_preset_table),
> +	.fwname = "vpu30_4v",
> +	.pas_id = 9,
> +
> +	/* caps related resorces */
> +	.core_data = core_data_sm8550,
> +	.core_data_size = ARRAY_SIZE(core_data_sm8550),
> +	.inst_cap_data = instance_cap_data_sm8550,
> +	.inst_cap_data_size = ARRAY_SIZE(instance_cap_data_sm8550),
> +	.inst_cap_dependency_data = instance_cap_dependency_data_sm8550,
> +	.inst_cap_dependency_data_size = ARRAY_SIZE(instance_cap_dependency_data_sm8550),
> +	.ubwc_config = ubwc_config_sm8550,
> +	.format_data = &format_data_sm8550,
> +
> +	/* decoder properties related*/
> +	.psc_avc_tbl = sm8550_vdec_psc_avc,
> +	.psc_avc_tbl_size = ARRAY_SIZE(sm8550_vdec_psc_avc),
> +	.psc_hevc_tbl = sm8550_vdec_psc_hevc,
> +	.psc_hevc_tbl_size = ARRAY_SIZE(sm8550_vdec_psc_hevc),
> +	.psc_vp9_tbl = sm8550_vdec_psc_vp9,
> +	.psc_vp9_tbl_size = ARRAY_SIZE(sm8550_vdec_psc_vp9),
> +	.dec_input_prop_avc = sm8550_vdec_input_properties_avc,
> +	.dec_input_prop_hevc = sm8550_vdec_input_properties_hevc,
> +	.dec_input_prop_vp9 = sm8550_vdec_input_properties_vp9,
> +	.dec_input_prop_size_avc = ARRAY_SIZE(sm8550_vdec_input_properties_avc),
> +	.dec_input_prop_size_hevc = ARRAY_SIZE(sm8550_vdec_input_properties_hevc),
> +	.dec_input_prop_size_vp9 = ARRAY_SIZE(sm8550_vdec_input_properties_vp9),
> +	.dec_output_prop_avc = sm8550_vdec_output_properties_avc,
> +	.dec_output_prop_hevc = sm8550_vdec_output_properties_hevc,
> +	.dec_output_prop_vp9 = sm8550_vdec_output_properties_vp9,
> +	.dec_output_prop_size_avc = ARRAY_SIZE(sm8550_vdec_output_properties_avc),
> +	.dec_output_prop_size_hevc = ARRAY_SIZE(sm8550_vdec_output_properties_hevc),
> +	.dec_output_prop_size_vp9 = ARRAY_SIZE(sm8550_vdec_output_properties_vp9),

Size should come next to the array reference.

> +};
> +
> +static int msm_vidc_init_data(struct msm_vidc_core *core)
> +{
> +	d_vpr_h("%s: initialize sm8550 data\n", __func__);
> +
> +	core->platform->data = sm8550_data;
> +

Please use of_device_match_data() instead.

> +	return 0;
> +}
> +
> +int msm_vidc_init_platform_sm8550(struct msm_vidc_core *core)
> +{
> +	return msm_vidc_init_data(core);
> +}

-- 
With best wishes
Dmitry

