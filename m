Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24E29215AD7
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 17:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729412AbgGFPhf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 11:37:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729397AbgGFPhe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 11:37:34 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B439C08C5DF
        for <linux-media@vger.kernel.org>; Mon,  6 Jul 2020 08:37:34 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id w6so43051437ejq.6
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2020 08:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iGPaa9pvESxSNTD4m6EotN6YAe6P/PHrfZl++fjM4cA=;
        b=AEltp1lt5QPBGU3Z7fzHHXCMmjn/Skn8Qbc6cJiNXZh7jiQqT4TNtQhbcUuiidDD2Q
         Cl4XtwtlRt6DnD34DuiHwNxCtauxnwiMF5+qFElH2ldbjWlXl7KgU2QgI6v382aaEryo
         nxDWVspWVSMVnykkZSkmIq93w8g6nkzaNznm54Aap/gKfM5JB7Y8sxO1QywiBbEH2UGu
         fJ/9sDUCkHGOEKrNfMudYN56+Zbf0RvDVAmJtAUaqJRlutB4BjgA+6quorv9grvUybdW
         xOh4+h6QOY6cRADoMa2MseHIB1tnDfG8K6NFA6scL2XIlb39+G1Od40tM/c+nJ3DjR8c
         ZESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iGPaa9pvESxSNTD4m6EotN6YAe6P/PHrfZl++fjM4cA=;
        b=JuXdI6QesJDeG3O8ciArz+LBwWkgx3CD/TAwL5EjdZOd7Ai7imJUUI+6jSm7O9bjHW
         vaNlK074Wq7rPHVz3WI9QZyDYh4GR/WPQlQTTfCrkXQsTQXo0ludiLpsJG+9zTyMyDNK
         /AacjoSLd0X8te7vy7+Qts+JY70TXh7Iigeuab26LfXFOI9VE8IOI2QvINiCVV1Vbys7
         KbKzOqKpu9GL1SJdPU0/zAoKlAdOIl5q+SWRAmNPKO7V14pERt66vh7COKUqUkuoduOA
         25xXlrUhtqRa5+504K68UWR6wID91w0Gh0PUrBNV4kwUeckVGBi9E7v9yNmrkpoI9DMV
         1AxA==
X-Gm-Message-State: AOAM532lysjkeiJbB3z91eijBvBjxywPg24Vben/T+vPRDbi3/Es0nux
        RsF4LswnFDV54AZemzk9S6l36w==
X-Google-Smtp-Source: ABdhPJyCohxJtVTMAmL01kdNfkLJyidhZ1JR+RfZ0xkH1s+SYipXbPrvz5rz5PZVRQWlQ2OdFkpMcA==
X-Received: by 2002:a17:906:a253:: with SMTP id bi19mr42189861ejb.338.1594049853146;
        Mon, 06 Jul 2020 08:37:33 -0700 (PDT)
Received: from [192.168.1.2] (212-5-158-202.ip.btc-net.bg. [212.5.158.202])
        by smtp.googlemail.com with ESMTPSA id y22sm16420931ejj.67.2020.07.06.08.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2020 08:37:32 -0700 (PDT)
Subject: Re: [PATCH] venus: move platform specific data to platform file
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, majja@codeaurora.org
References: <1590736053-30323-1-git-send-email-dikshita@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <9bb69de6-9dc0-277f-8bd1-039069e04299@linaro.org>
Date:   Mon, 6 Jul 2020 18:37:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1590736053-30323-1-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/29/20 10:07 AM, Dikshita Agarwal wrote:
> Move all data specific to platform into a separate file.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/Makefile         |  3 +-
>  drivers/media/platform/qcom/venus/core.c           | 20 ++-----------
>  drivers/media/platform/qcom/venus/core.h           | 10 +------
>  drivers/media/platform/qcom/venus/helpers.c        |  6 ++--
>  .../media/platform/qcom/venus/hfi_platform_data.c  | 35 ++++++++++++++++++++++
>  .../media/platform/qcom/venus/hfi_platform_data.h  | 27 +++++++++++++++++
>  drivers/media/platform/qcom/venus/pm_helpers.c     |  1 +
>  7 files changed, 73 insertions(+), 29 deletions(-)
>  create mode 100644 drivers/media/platform/qcom/venus/hfi_platform_data.c
>  create mode 100644 drivers/media/platform/qcom/venus/hfi_platform_data.h
> 
> diff --git a/drivers/media/platform/qcom/venus/Makefile b/drivers/media/platform/qcom/venus/Makefile
> index dfc6368..3878bc9 100644
> --- a/drivers/media/platform/qcom/venus/Makefile
> +++ b/drivers/media/platform/qcom/venus/Makefile
> @@ -3,7 +3,8 @@
>  
>  venus-core-objs += core.o helpers.o firmware.o \
>  		   hfi_venus.o hfi_msgs.o hfi_cmds.o hfi.o \
> -		   hfi_parser.o pm_helpers.o dbgfs.o
> +		   hfi_parser.o pm_helpers.o dbgfs.o \
> +		   hfi_platform_data.o

Could you shorten to hfi_platform.o

>  
>  venus-dec-objs += vdec.o vdec_ctrls.o
>  venus-enc-objs += venc.o venc_ctrls.o
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index bbb394c..4fde4aa 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -20,6 +20,7 @@
>  #include "core.h"
>  #include "firmware.h"
>  #include "pm_helpers.h"
> +#include "hfi_platform_data.h"
>  
>  static void venus_event_notify(struct venus_core *core, u32 event)
>  {
> @@ -222,6 +223,8 @@ static int venus_probe(struct platform_device *pdev)
>  			return ret;
>  	}
>  
> +	core->hfi_data = venus_get_hfi_platform(core->res->hfi_version);

please make it:

core->hfi_plat = hfi_platform_get(version)

> +
>  	ret = dma_set_mask_and_coherent(dev, core->res->dma_mask);
>  	if (ret)
>  		return ret;
> @@ -461,17 +464,6 @@ static __maybe_unused int venus_runtime_resume(struct device *dev)
>  	{  244800, 100000000 },	/* 1920x1080@30 */
>  };
>  
> -static const struct codec_freq_data sdm845_codec_freq_data[] =  {
> -	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675, 10 },
> -	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675, 10 },
> -	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_ENC, 675, 10 },
> -	{ V4L2_PIX_FMT_MPEG2, VIDC_SESSION_TYPE_DEC, 200, 10 },
> -	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 200, 10 },
> -	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 200, 10 },
> -	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_DEC, 200, 10 },
> -	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 200, 10 },
> -};
> -
>  static const struct bw_tbl sdm845_bw_table_enc[] = {
>  	{ 1944000, 1612000, 0, 2416000, 0 },	/* 3840x2160@60 */
>  	{  972000,  951000, 0, 1434000, 0 },	/* 3840x2160@30 */
> @@ -493,8 +485,6 @@ static __maybe_unused int venus_runtime_resume(struct device *dev)
>  	.bw_tbl_enc_size = ARRAY_SIZE(sdm845_bw_table_enc),
>  	.bw_tbl_dec = sdm845_bw_table_dec,
>  	.bw_tbl_dec_size = ARRAY_SIZE(sdm845_bw_table_dec),
> -	.codec_freq_data = sdm845_codec_freq_data,
> -	.codec_freq_data_size = ARRAY_SIZE(sdm845_codec_freq_data),
>  	.clks = {"core", "iface", "bus" },
>  	.clks_num = 3,
>  	.vcodec0_clks = { "core", "bus" },
> @@ -516,8 +506,6 @@ static __maybe_unused int venus_runtime_resume(struct device *dev)
>  	.bw_tbl_enc_size = ARRAY_SIZE(sdm845_bw_table_enc),
>  	.bw_tbl_dec = sdm845_bw_table_dec,
>  	.bw_tbl_dec_size = ARRAY_SIZE(sdm845_bw_table_dec),
> -	.codec_freq_data = sdm845_codec_freq_data,
> -	.codec_freq_data_size = ARRAY_SIZE(sdm845_codec_freq_data),
>  	.clks = {"core", "iface", "bus" },
>  	.clks_num = 3,
>  	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
> @@ -562,8 +550,6 @@ static __maybe_unused int venus_runtime_resume(struct device *dev)
>  	.bw_tbl_enc_size = ARRAY_SIZE(sc7180_bw_table_enc),
>  	.bw_tbl_dec = sc7180_bw_table_dec,
>  	.bw_tbl_dec_size = ARRAY_SIZE(sc7180_bw_table_dec),
> -	.codec_freq_data = sdm845_codec_freq_data,
> -	.codec_freq_data_size = ARRAY_SIZE(sdm845_codec_freq_data),
>  	.clks = {"core", "iface", "bus" },
>  	.clks_num = 3,
>  	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 82438f1..86dc443 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -34,13 +34,6 @@ struct reg_val {
>  	u32 value;
>  };
>  
> -struct codec_freq_data {
> -	u32 pixfmt;
> -	u32 session_type;
> -	unsigned long vpp_freq;
> -	unsigned long vsp_freq;
> -};
> -
>  struct bw_tbl {
>  	u32 mbs_per_sec;
>  	u32 avg;
> @@ -59,8 +52,6 @@ struct venus_resources {
>  	unsigned int bw_tbl_dec_size;
>  	const struct reg_val *reg_tbl;
>  	unsigned int reg_tbl_size;
> -	const struct codec_freq_data *codec_freq_data;
> -	unsigned int codec_freq_data_size;
>  	const char * const clks[VIDC_CLKS_NUM_MAX];
>  	unsigned int clks_num;
>  	const char * const vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
> @@ -176,6 +167,7 @@ struct venus_core {
>  	bool sys_error;
>  	const struct hfi_core_ops *core_ops;
>  	const struct venus_pm_ops *pm_ops;
> +	const struct venus_hfi_platform_data *hfi_data;

could you rename this to:

const struct hfi_platform *hfi_plat;

>  	struct mutex pm_lock;
>  	unsigned long enc_codecs;
>  	unsigned long dec_codecs;
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 115a9a2..62d1197 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -14,6 +14,7 @@
>  #include "helpers.h"
>  #include "hfi_helper.h"
>  #include "pm_helpers.h"
> +#include "hfi_platform_data.h"
>  
>  struct intbuf {
>  	struct list_head list;
> @@ -811,8 +812,9 @@ int venus_helper_init_codec_freq_data(struct venus_inst *inst)
>  	if (!IS_V4(inst->core))
>  		return 0;
>  
> -	data = inst->core->res->codec_freq_data;
> -	data_size = inst->core->res->codec_freq_data_size;
> +	data = inst->core->hfi_data->codec_freq_data;
> +	data_size = inst->core->hfi_data->codec_freq_data_size;
> +

This doesn't look right. The venus_helper knows details of how to init
codec data. I think this initialization should be made by hfi_platform.

>  	pixfmt = inst->session_type == VIDC_SESSION_TYPE_DEC ?
>  			inst->fmt_out->pixfmt : inst->fmt_cap->pixfmt;
>  
> diff --git a/drivers/media/platform/qcom/venus/hfi_platform_data.c b/drivers/media/platform/qcom/venus/hfi_platform_data.c
> new file mode 100644
> index 0000000..9d9035f
> --- /dev/null
> +++ b/drivers/media/platform/qcom/venus/hfi_platform_data.c
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + */
> +#include "hfi_platform_data.h"
> +#include "core.h"
> +
> +static struct codec_freq_data hfi4_codec_freq_data[] =  {
> +{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675, 10 },

fix the identation

> +	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675, 10 },
> +	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_ENC, 675, 10 },
> +	{ V4L2_PIX_FMT_MPEG2, VIDC_SESSION_TYPE_DEC, 200, 10 },
> +	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 200, 10 },
> +	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 200, 10 },
> +	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_DEC, 200, 10 },
> +	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 200, 10 },
> +};
> +
> +static const struct venus_hfi_platform_data hfi4_data = {
> +	.codec_freq_data = hfi4_codec_freq_data,
> +	.codec_freq_data_size = ARRAY_SIZE(hfi4_codec_freq_data),
> +};
> +
> +const struct venus_hfi_platform_data *venus_get_hfi_platform
> +	(enum hfi_version version)

It would be better to have:

struct hfi_platform *hfi_platform_get(version)

and all functions in hfi_platform.c should be prefixed with hfi_platform_xxx

> +{
> +	switch (version) {
> +	case HFI_VERSION_4XX:
> +		return &hfi4_data;

s/hfi4_data/hfi_data_v4/

this is the style for the whole driver please follow it (see
pm-helpers.c for example).

> +	default:
> +		return NULL;
> +	}
> +	return NULL;
> +}
> +
> diff --git a/drivers/media/platform/qcom/venus/hfi_platform_data.h b/drivers/media/platform/qcom/venus/hfi_platform_data.h
> new file mode 100644
> index 0000000..1b4bfb6
> --- /dev/null
> +++ b/drivers/media/platform/qcom/venus/hfi_platform_data.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef __HFI_PLATFORM_DATA_H__
> +#define __HFI_PLATFORM_DATA_H__

just __HFI_PLATFORM_H__ please.

we will have hfi_platform function pointers too.

> +
> +#include "core.h"
> +
> +struct codec_freq_data {
> +	u32 pixfmt;
> +	u32 session_type;
> +	unsigned long vpp_freq;
> +	unsigned long vsp_freq;
> +};
> +
> +struct venus_hfi_platform_data {

please rename to hfi_platform

> +	const struct codec_freq_data *codec_freq_data;
> +	unsigned int codec_freq_data_size;
> +};
> +
> +const struct venus_hfi_platform_data *venus_get_hfi_platform
> +	(enum hfi_version version);
> +
> +#endif
> +
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index f33fc70..4ed5689 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -17,6 +17,7 @@
>  #include "hfi_parser.h"
>  #include "hfi_venus_io.h"
>  #include "pm_helpers.h"
> +#include "hfi_platform_data.h"

s/hfi_platform_data.h/hfi_platform.h/


-- 
regards,
Stan
