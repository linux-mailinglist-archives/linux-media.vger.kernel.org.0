Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9E4E344538
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 14:15:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231481AbhCVNOk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 09:14:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233173AbhCVNM1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 09:12:27 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47C04C061765
        for <linux-media@vger.kernel.org>; Mon, 22 Mar 2021 06:12:26 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id r12so21185595ejr.5
        for <linux-media@vger.kernel.org>; Mon, 22 Mar 2021 06:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vS9XPExwcwpS/sfWZcxqbnP/GhS9Af04Lc9nX5pchRc=;
        b=Ah2tSfHEKrv8EcV4EKhjJGPJg5sscsAfMx4eU6EuBVJ1X5Jfer6HQlTr4ijU7FLVa+
         gPMezd2FTStiCUcZ8W7OoaTj/N5qxQ9i7sDaRDfy23T06SHJKsba9IgHodu91uN3tU0z
         1ONZsfenvywItQkohLnepmH1NFCoFd7HesZuELnMF//+ZDvhPNdBKAo2eaNxEhKmGCLz
         sPsa0dL/i8ajlQIkCTm8Qop2BoioIhEmRl5fmj9fsBwT3kORbJ/BCt9MNwQmxErNvJRP
         bzLi7eBx+DA41SdYvSo74CTChicNVIOvFhQ6GCvbgKAD78uPlWFFGeR81sArafVU0sz3
         +6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vS9XPExwcwpS/sfWZcxqbnP/GhS9Af04Lc9nX5pchRc=;
        b=dH97dMmr6SqTsA1U8gxUNsTi2zCOkZ0LCMAdXj9IxuBGelnlDmXlkHqhnLR1pkb1+y
         LLKx9dl9He7mGB9XgKrhcg/S7azlolJJ1JQTh8gpigRhxf3zEy3+50Ai/wXQlNemAoTA
         5d7g6jeFsl2qb+e5reVRCKL0ZwdDghL8Cm3R78pJfpSXViMhvmtmlKZLohPHw9o5zgin
         onwQXED9s8v709jYd+70reoPQJxrEPPP0yhFIGfajQTWb4113fDH03pH0q/XWK4aiXAF
         gO/rnqTT1uRBsz9YQdns/YVE6hoXT4v2E3rim/cPPrmGC3Sj6amfYoBx/fFHUHpmMmPC
         x4qQ==
X-Gm-Message-State: AOAM53188xmTDm60kEIYO6cFct8hS3J07PMjf6/bE5q81hftq/yCCyZB
        jud0iX17vYYWW3r5B2Bic5Vaz3RXeARE9Tp/
X-Google-Smtp-Source: ABdhPJwoFmAEA7HJ76oqHlCXRvV5UiwUkON4dtBzpRuRPRShjj/Kar+DiesTgPfkvHRNLsk/D/Ex2w==
X-Received: by 2002:a17:907:7785:: with SMTP id ky5mr18739997ejc.133.1616418744845;
        Mon, 22 Mar 2021 06:12:24 -0700 (PDT)
Received: from [192.168.1.54] (hst-221-18.medicom.bg. [84.238.221.18])
        by smtp.googlemail.com with ESMTPSA id j7sm11233154edv.40.2021.03.22.06.12.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Mar 2021 06:12:24 -0700 (PDT)
Subject: Re: [PATCH v2 24/25] media: venus: helper: Decide work mode
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     dikshita@codeaurora.org, jonathan@marek.ca, vgarodia@codeaurora.org
References: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
 <20210312173039.1387617-25-bryan.odonoghue@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <c38da904-28da-f713-ba92-f6bc42603a3c@linaro.org>
Date:   Mon, 22 Mar 2021 15:12:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210312173039.1387617-25-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 3/12/21 7:30 PM, Bryan O'Donoghue wrote:
> From: Dikshita Agarwal <dikshita@codeaurora.org>
> 
> Decide work mode for encoder and decoder based on different
> use-cases.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/helpers.c | 31 ++++++++++++++++++++-
>  drivers/media/platform/qcom/venus/helpers.h |  2 +-
>  drivers/media/platform/qcom/venus/vdec.c    |  2 +-
>  drivers/media/platform/qcom/venus/venc.c    |  2 +-
>  4 files changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 77ffb8fbb47f..dc8ef13d0c95 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -18,6 +18,9 @@
>  #include "hfi_platform.h"
>  #include "hfi_parser.h"
>  
> +#define NUM_MBS_720P	(((1280 + 15) >> 4) * ((720 + 15) >> 4))
> +#define NUM_MBS_4K	(((4096 + 15) >> 4) * ((2304 + 15) >> 4))
> +
>  struct intbuf {
>  	struct list_head list;
>  	u32 type;
> @@ -1090,14 +1093,40 @@ int venus_helper_set_output_resolution(struct venus_inst *inst,
>  }
>  EXPORT_SYMBOL_GPL(venus_helper_set_output_resolution);
>  
> -int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode)
> +static u32 venus_helper_get_work_mode(struct venus_inst *inst)
> +{
> +	u32 mode;
> +	u32 num_mbs;
> +
> +	mode = VIDC_WORK_MODE_2;
> +	if (IS_V6(inst->core)) {

Dikshita, I think the decisions made here are valid for v4 too? If so
this IS_V6 check is not needed.

> +		if (inst->session_type == VIDC_SESSION_TYPE_DEC) {
> +			num_mbs = (ALIGN(inst->height, 16) * ALIGN(inst->width, 16)) / 256;
> +			if (inst->hfi_codec == HFI_VIDEO_CODEC_MPEG2 ||
> +			    inst->pic_struct != HFI_INTERLACE_FRAME_PROGRESSIVE ||
> +			    num_mbs <= NUM_MBS_720P)
> +				mode = VIDC_WORK_MODE_1;
> +		} else {
> +			num_mbs = (ALIGN(inst->out_height, 16) * ALIGN(inst->out_width, 16)) / 256;
> +			if (inst->hfi_codec == HFI_VIDEO_CODEC_VP8 &&
> +			    num_mbs <= NUM_MBS_4K)
> +				mode = VIDC_WORK_MODE_1;
> +		}
> +	}
> +
> +	return mode;
> +}
> +
> +int venus_helper_set_work_mode(struct venus_inst *inst)
>  {
>  	const u32 ptype = HFI_PROPERTY_PARAM_WORK_MODE;
>  	struct hfi_video_work_mode wm;
> +	u32 mode;
>  
>  	if (!IS_V4(inst->core) && !IS_V6(inst->core))
>  		return 0;
>  
> +	mode = venus_helper_get_work_mode(inst);
>  	wm.video_work_mode = mode;
>  	return hfi_session_set_property(inst, ptype, &wm);
>  }
> diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
> index 98106e6eee85..e6269b4be3af 100644
> --- a/drivers/media/platform/qcom/venus/helpers.h
> +++ b/drivers/media/platform/qcom/venus/helpers.h
> @@ -32,7 +32,7 @@ int venus_helper_set_input_resolution(struct venus_inst *inst,
>  int venus_helper_set_output_resolution(struct venus_inst *inst,
>  				       unsigned int width, unsigned int height,
>  				       u32 buftype);
> -int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode);
> +int venus_helper_set_work_mode(struct venus_inst *inst);
>  int venus_helper_set_format_constraints(struct venus_inst *inst);
>  int venus_helper_set_num_bufs(struct venus_inst *inst, unsigned int input_bufs,
>  			      unsigned int output_bufs,
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index fdc9984acb70..0fe4863371e2 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -655,7 +655,7 @@ static int vdec_output_conf(struct venus_inst *inst)
>  	u32 ptype;
>  	int ret;
>  
> -	ret = venus_helper_set_work_mode(inst, VIDC_WORK_MODE_2);
> +	ret = venus_helper_set_work_mode(inst);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 505d092dc433..83425fa8df2d 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -550,7 +550,7 @@ static int venc_set_properties(struct venus_inst *inst)
>  	u32 profile, level;
>  	int ret;
>  
> -	ret = venus_helper_set_work_mode(inst, VIDC_WORK_MODE_2);
> +	ret = venus_helper_set_work_mode(inst);
>  	if (ret)
>  		return ret;
>  
> 

-- 
regards,
Stan
