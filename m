Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3898920992D
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 06:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389700AbgFYEts (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 00:49:48 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:40180 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389467AbgFYEtr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 00:49:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593060586; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=OAekuKPG8AcnOQgpwGj/drOBj/ycITN2NYqHAMTWD0Q=;
 b=e1s5Xtq8jHmaeCZL0wwFVHO96zNL5u6kDSVlrKRR27tBvw59UA8CDUMA0PUF1jDt7aa+cNRu
 n5QKHurq+uxs5KfTfVk+tR/Vf9/JRFRliyueVuTrDGasUmbPvZAgoHmzkfZVWTIzxtF4UNIx
 gRJzaEz1S5TUqejt+7lggrWGHos=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5ef42c906bebe35deb2409c2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Jun 2020 04:48:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CC37EC433C8; Thu, 25 Jun 2020 04:48:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: dikshita)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B69E9C433C6;
        Thu, 25 Jun 2020 04:48:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 25 Jun 2020 10:18:14 +0530
From:   dikshita@codeaurora.org
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, majja@codeaurora.org
Subject: Re: [PATCH] venus: move platform specific data to platform file
In-Reply-To: <1590736053-30323-1-git-send-email-dikshita@codeaurora.org>
References: <1590736053-30323-1-git-send-email-dikshita@codeaurora.org>
Message-ID: <44d4b589bf8f6d9ef25ae50705ead4d2@codeaurora.org>
X-Sender: dikshita@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stanimir,

A gentle reminder for the review.

On 2020-05-29 12:37, Dikshita Agarwal wrote:
> Move all data specific to platform into a separate file.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/Makefile         |  3 +-
>  drivers/media/platform/qcom/venus/core.c           | 20 ++-----------
>  drivers/media/platform/qcom/venus/core.h           | 10 +------
>  drivers/media/platform/qcom/venus/helpers.c        |  6 ++--
>  .../media/platform/qcom/venus/hfi_platform_data.c  | 35 
> ++++++++++++++++++++++
>  .../media/platform/qcom/venus/hfi_platform_data.h  | 27 
> +++++++++++++++++
>  drivers/media/platform/qcom/venus/pm_helpers.c     |  1 +
>  7 files changed, 73 insertions(+), 29 deletions(-)
>  create mode 100644 
> drivers/media/platform/qcom/venus/hfi_platform_data.c
>  create mode 100644 
> drivers/media/platform/qcom/venus/hfi_platform_data.h
> 
> diff --git a/drivers/media/platform/qcom/venus/Makefile
> b/drivers/media/platform/qcom/venus/Makefile
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
> 
>  venus-dec-objs += vdec.o vdec_ctrls.o
>  venus-enc-objs += venc.o venc_ctrls.o
> diff --git a/drivers/media/platform/qcom/venus/core.c
> b/drivers/media/platform/qcom/venus/core.c
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
> @@ -222,6 +223,8 @@ static int venus_probe(struct platform_device 
> *pdev)
>  			return ret;
>  	}
> 
> +	core->hfi_data = venus_get_hfi_platform(core->res->hfi_version);
> +
>  	ret = dma_set_mask_and_coherent(dev, core->res->dma_mask);
>  	if (ret)
>  		return ret;
> @@ -461,17 +464,6 @@ static __maybe_unused int
> venus_runtime_resume(struct device *dev)
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
> @@ -493,8 +485,6 @@ static __maybe_unused int
> venus_runtime_resume(struct device *dev)
>  	.bw_tbl_enc_size = ARRAY_SIZE(sdm845_bw_table_enc),
>  	.bw_tbl_dec = sdm845_bw_table_dec,
>  	.bw_tbl_dec_size = ARRAY_SIZE(sdm845_bw_table_dec),
> -	.codec_freq_data = sdm845_codec_freq_data,
> -	.codec_freq_data_size = ARRAY_SIZE(sdm845_codec_freq_data),
>  	.clks = {"core", "iface", "bus" },
>  	.clks_num = 3,
>  	.vcodec0_clks = { "core", "bus" },
> @@ -516,8 +506,6 @@ static __maybe_unused int
> venus_runtime_resume(struct device *dev)
>  	.bw_tbl_enc_size = ARRAY_SIZE(sdm845_bw_table_enc),
>  	.bw_tbl_dec = sdm845_bw_table_dec,
>  	.bw_tbl_dec_size = ARRAY_SIZE(sdm845_bw_table_dec),
> -	.codec_freq_data = sdm845_codec_freq_data,
> -	.codec_freq_data_size = ARRAY_SIZE(sdm845_codec_freq_data),
>  	.clks = {"core", "iface", "bus" },
>  	.clks_num = 3,
>  	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
> @@ -562,8 +550,6 @@ static __maybe_unused int
> venus_runtime_resume(struct device *dev)
>  	.bw_tbl_enc_size = ARRAY_SIZE(sc7180_bw_table_enc),
>  	.bw_tbl_dec = sc7180_bw_table_dec,
>  	.bw_tbl_dec_size = ARRAY_SIZE(sc7180_bw_table_dec),
> -	.codec_freq_data = sdm845_codec_freq_data,
> -	.codec_freq_data_size = ARRAY_SIZE(sdm845_codec_freq_data),
>  	.clks = {"core", "iface", "bus" },
>  	.clks_num = 3,
>  	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
> diff --git a/drivers/media/platform/qcom/venus/core.h
> b/drivers/media/platform/qcom/venus/core.h
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
>  	struct mutex pm_lock;
>  	unsigned long enc_codecs;
>  	unsigned long dec_codecs;
> diff --git a/drivers/media/platform/qcom/venus/helpers.c
> b/drivers/media/platform/qcom/venus/helpers.c
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
> @@ -811,8 +812,9 @@ int venus_helper_init_codec_freq_data(struct
> venus_inst *inst)
>  	if (!IS_V4(inst->core))
>  		return 0;
> 
> -	data = inst->core->res->codec_freq_data;
> -	data_size = inst->core->res->codec_freq_data_size;
> +	data = inst->core->hfi_data->codec_freq_data;
> +	data_size = inst->core->hfi_data->codec_freq_data_size;
> +
>  	pixfmt = inst->session_type == VIDC_SESSION_TYPE_DEC ?
>  			inst->fmt_out->pixfmt : inst->fmt_cap->pixfmt;
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_platform_data.c
> b/drivers/media/platform/qcom/venus/hfi_platform_data.c
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
> +{
> +	switch (version) {
> +	case HFI_VERSION_4XX:
> +		return &hfi4_data;
> +	default:
> +		return NULL;
> +	}
> +	return NULL;
> +}
> +
> diff --git a/drivers/media/platform/qcom/venus/hfi_platform_data.h
> b/drivers/media/platform/qcom/venus/hfi_platform_data.h
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
> +	const struct codec_freq_data *codec_freq_data;
> +	unsigned int codec_freq_data_size;
> +};
> +
> +const struct venus_hfi_platform_data *venus_get_hfi_platform
> +	(enum hfi_version version);
> +
> +#endif
> +
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c
> b/drivers/media/platform/qcom/venus/pm_helpers.c
> index f33fc70..4ed5689 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -17,6 +17,7 @@
>  #include "hfi_parser.h"
>  #include "hfi_venus_io.h"
>  #include "pm_helpers.h"
> +#include "hfi_platform_data.h"
> 
>  static bool legacy_binding;
