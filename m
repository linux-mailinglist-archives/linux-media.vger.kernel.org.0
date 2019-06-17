Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93A7647DE7
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 11:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727966AbfFQJHn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 05:07:43 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45539 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726793AbfFQJHn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 05:07:43 -0400
Received: by mail-lj1-f194.google.com with SMTP id m23so8487552lje.12
        for <linux-media@vger.kernel.org>; Mon, 17 Jun 2019 02:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/TxligxYY+aC6zWv3opQDSxtXze7SE7PmAaCKTySTbw=;
        b=OneVp8OoS59dMfuq/SVYMseCzQMdKItcQ9lOFapT7muQ91/cHSc9gI+mm1EskhPgWJ
         GxqVIKdh4rtjOt5d7TxbpV0zqSy0zC/I+8yOGIJWzlnzMY/mMRIr/g36Ry9EGvTEiBn8
         Q7JLH2gJMb3Jnmf/kG9LlXnb6KjRMOMwJbc+IAVbRwf600Y9OslI4zNgq1ZBclOalNVy
         W4DPtpI690/UWbXIkguNC6uEyrXLAwEEDkC1aq6cS1Isj5l0PndwjSNeGfpPb8ES9aL2
         Cec4hz3bXFPFVNsp4N0V6fpTHFN9/MeQhcXF5WIq7gdRVfTUsHymJyRUM9f+D8EKIb3Q
         NWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/TxligxYY+aC6zWv3opQDSxtXze7SE7PmAaCKTySTbw=;
        b=hTGj1aWaTvvZKQpSgokc7QuKgoMX9krLj4WMg8N9+EKfQAGXdD/AiwvGGYFf3NObcc
         Uc1Jm3WXTVaq5lu/agKflad4YB4eqUI7beWV6PRDjwEvctX1stmXc8H96sjjrJ11Kmh3
         qgZUW+7lBfOg3j4MgyEVSz6JFnvU2JPRxE1F4KZERMjOGpNCSrF4aBTuDTn/iHox7Stf
         Fe6PVZNoqkAZ6qJIG85yhJhQcg4GJMGqa4iA+MV/n7ItKc2y/4tpyd6Y72cBCSrwnDL5
         8puPlJpIyIlJ39O9G5adkJu4Ac1K+loI0GYL4Iv//UMLNrc5oAL2rDHpq8wRUAeHAgQq
         OfWw==
X-Gm-Message-State: APjAAAWnW0OV2dJl6pIvBSTBIwqV30oPLcVOIhPSjbfzayLrNekTEtAF
        1VBhWangT7Npe51h8vtkU3nNvA==
X-Google-Smtp-Source: APXvYqzT3vJzFja/mIdCxlpicnnkGB232vyK8CsXjU7jJNTIiyqc91dE/5odfcwqIBnVGt0bssu39Q==
X-Received: by 2002:a2e:9610:: with SMTP id v16mr12037660ljh.229.1560762461168;
        Mon, 17 Jun 2019 02:07:41 -0700 (PDT)
Received: from [192.168.27.209] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id v2sm2024909ljb.65.2019.06.17.02.07.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 02:07:40 -0700 (PDT)
Subject: Re: [PATCH 5/5] media: venus: Update core selection
To:     Aniket Masule <amasule@codeaurora.org>, linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1560233130-27264-1-git-send-email-amasule@codeaurora.org>
 <1560233130-27264-6-git-send-email-amasule@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <8f2e1cf4-9d9c-088b-740f-d8bf1c9028df@linaro.org>
Date:   Mon, 17 Jun 2019 12:07:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560233130-27264-6-git-send-email-amasule@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Aniket,

On 6/11/19 9:05 AM, Aniket Masule wrote:
> Present core assignment is static. Introduced load balancing
> across the cores. Load on earch core is calculated and core
> with minimum load is assigned to given instance.
> 
> Signed-off-by: Aniket Masule <amasule@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/helpers.c | 50 +++++++++++++++++++++++++----
>  drivers/media/platform/qcom/venus/helpers.h |  2 +-
>  drivers/media/platform/qcom/venus/vdec.c    |  5 +--
>  drivers/media/platform/qcom/venus/venc.c    |  4 ++-
>  4 files changed, 51 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index edb653e..38d617b 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -497,6 +497,16 @@ static int load_scale_clocks(struct venus_inst *inst)
>  		return scale_clocks_vpu4(inst);
>  }
>  
> +int set_core_usage(struct venus_inst *inst, u32 usage)
> +{
> +	const u32 ptype = HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE;
> +	struct hfi_videocores_usage_type cu;
> +
> +	cu.video_core_enable_mask = usage;
> +
> +	return hfi_session_set_property(inst, ptype, &cu);
> +}
> +
>  static void fill_buffer_desc(const struct venus_buffer *buf,
>  			     struct hfi_buffer_desc *bd, bool response)
>  {
> @@ -800,19 +810,47 @@ int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode)
>  }
>  EXPORT_SYMBOL_GPL(venus_helper_set_work_mode);
>  
> -int venus_helper_set_core_usage(struct venus_inst *inst, u32 usage)
> +int venus_helper_decide_core(struct venus_inst *inst, u32 cores_max)

I think venus_helper_set_core is better?

>  {
> -	const u32 ptype = HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE;
> -	struct hfi_videocores_usage_type cu;
> +	struct venus_core *core = inst->core;
> +	u32 min_core_id = 0, core0_load = 0, core1_load = 0;
> +	unsigned long min_load, max_freq, cur_inst_load;
> +	int ret;
>  
>  	if (!IS_V4(inst->core))
>  		return 0;
>  
> -	cu.video_core_enable_mask = usage;
> +	core0_load = load_per_core(core, VIDC_CORE_ID_1);
> +	core1_load = load_per_core(core, VIDC_CORE_ID_2);
>  
> -	return hfi_session_set_property(inst, ptype, &cu);
> +	min_core_id = core0_load < core1_load ? VIDC_CORE_ID_1 : VIDC_CORE_ID_2;
> +	min_load = min(core0_load, core1_load);
> +
> +	if (cores_max < VIDC_CORE_ID_1) {
> +		min_core_id = VIDC_CORE_ID_1;
> +		min_load = core0_load;
> +	}

could you please move that fragment just after IS_V4 check and return an
error if cores_max < VIDC_CORE_ID_1.

> +
> +	cur_inst_load = load_per_instance(inst) *
> +		inst->clk_data.codec_data->vpp_cycles;
> +	max_freq = core->res->freq_tbl[0].freq;
> +
> +	if ((cur_inst_load + min_load)	> max_freq) {
> +		dev_warn(core->dev, "HW is overloaded, needed: %lu max: %lu\n",
> +			 cur_inst_load, max_freq);
> +		return -EINVAL;
> +	}
> +
> +	ret = set_core_usage(inst, min_core_id);
> +
> +	if (ret)
> +		return ret;
> +
> +	inst->clk_data.core_id = min_core_id;
> +
> +	return 0;
>  }
> -EXPORT_SYMBOL_GPL(venus_helper_set_core_usage);
> +EXPORT_SYMBOL_GPL(venus_helper_decide_core);
>  
>  int venus_helper_init_codec_data(struct venus_inst *inst)
>  {
> diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
> index f9360a8..c41ceb3 100644
> --- a/drivers/media/platform/qcom/venus/helpers.h
> +++ b/drivers/media/platform/qcom/venus/helpers.h
> @@ -42,7 +42,7 @@ int venus_helper_set_output_resolution(struct venus_inst *inst,
>  				       u32 buftype);
>  int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode);
>  int venus_helper_init_codec_data(struct venus_inst *inst);
> -int venus_helper_set_core_usage(struct venus_inst *inst, u32 usage);
> +int venus_helper_decide_core(struct venus_inst *inst, u32 cores_max);
>  int venus_helper_set_num_bufs(struct venus_inst *inst, unsigned int input_bufs,
>  			      unsigned int output_bufs,
>  			      unsigned int output2_bufs);
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 51795fd..9f988ba 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -544,14 +544,15 @@ static int vdec_output_conf(struct venus_inst *inst)
>  	u32 height = inst->out_height;
>  	u32 out_fmt, out2_fmt;
>  	bool ubwc = false;
> -	u32 ptype;
> +	u32 ptype, cores_max;
>  	int ret;
>  
>  	ret = venus_helper_set_work_mode(inst, VIDC_WORK_MODE_2);
>  	if (ret)
>  		return ret;
>  
> -	ret = venus_helper_set_core_usage(inst, VIDC_CORE_ID_1);
> +	cores_max = core_num_max(inst);

please move core_max calculation in the venus_helper_decide_core() here
and below.

> +	ret = venus_helper_decide_core(inst, cores_max);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 792cdce..ed39efd 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -654,13 +654,15 @@ static int venc_set_properties(struct venus_inst *inst)
>  	struct hfi_quantization quant;
>  	struct hfi_quantization_range quant_range;
>  	u32 ptype, rate_control, bitrate, profile = 0, level = 0;
> +	u32 cores_max;
>  	int ret;
>  
>  	ret = venus_helper_set_work_mode(inst, VIDC_WORK_MODE_2);
>  	if (ret)
>  		return ret;
>  
> -	ret = venus_helper_set_core_usage(inst, VIDC_CORE_ID_2);
> +	cores_max = core_num_max(inst);
> +	ret = venus_helper_decide_core(inst, cores_max);
>  	if (ret)
>  		return ret;
>  
> 

-- 
regards,
Stan
