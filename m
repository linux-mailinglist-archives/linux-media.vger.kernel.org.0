Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F07024CC70
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2019 12:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726404AbfFTK7P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jun 2019 06:59:15 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37562 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbfFTK7P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jun 2019 06:59:15 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E32426090F; Thu, 20 Jun 2019 10:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561028353;
        bh=h9b8y7LEtP94kFKDblyWQ7wFULoXsXrjqh4KI2jFC7w=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OmyS5kG+lX9yXLMlnGD0ReLzU7yuFB+nlmMivLkjYrYdF2shs0HRSKbwvXSQcJcOu
         jl7ZUEJJhPVDQqf7/YpdQVtL8SmwiPaWPTLu+icOZfeCUalbotNqCo/xPfQiR4ndpO
         0UrplH8l+IRpjL/WYHWRZ7NCIifP0Jg+lXU0yvD0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id EABE1602F4;
        Thu, 20 Jun 2019 10:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561028353;
        bh=h9b8y7LEtP94kFKDblyWQ7wFULoXsXrjqh4KI2jFC7w=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OmyS5kG+lX9yXLMlnGD0ReLzU7yuFB+nlmMivLkjYrYdF2shs0HRSKbwvXSQcJcOu
         jl7ZUEJJhPVDQqf7/YpdQVtL8SmwiPaWPTLu+icOZfeCUalbotNqCo/xPfQiR4ndpO
         0UrplH8l+IRpjL/WYHWRZ7NCIifP0Jg+lXU0yvD0=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 20 Jun 2019 16:29:12 +0530
From:   amasule@codeaurora.org
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org
Subject: Re: [PATCH 5/5] media: venus: Update core selection
In-Reply-To: <8f2e1cf4-9d9c-088b-740f-d8bf1c9028df@linaro.org>
References: <1560233130-27264-1-git-send-email-amasule@codeaurora.org>
 <1560233130-27264-6-git-send-email-amasule@codeaurora.org>
 <8f2e1cf4-9d9c-088b-740f-d8bf1c9028df@linaro.org>
Message-ID: <5bbd61de30e4fe687773f04dd0816751@codeaurora.org>
X-Sender: amasule@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2019-06-17 14:37, Stanimir Varbanov wrote:
> Hi Aniket,
> 
> On 6/11/19 9:05 AM, Aniket Masule wrote:
>> Present core assignment is static. Introduced load balancing
>> across the cores. Load on earch core is calculated and core
>> with minimum load is assigned to given instance.
>> 
>> Signed-off-by: Aniket Masule <amasule@codeaurora.org>
>> ---
>>  drivers/media/platform/qcom/venus/helpers.c | 50 
>> +++++++++++++++++++++++++----
>>  drivers/media/platform/qcom/venus/helpers.h |  2 +-
>>  drivers/media/platform/qcom/venus/vdec.c    |  5 +--
>>  drivers/media/platform/qcom/venus/venc.c    |  4 ++-
>>  4 files changed, 51 insertions(+), 10 deletions(-)
>> 
>> diff --git a/drivers/media/platform/qcom/venus/helpers.c 
>> b/drivers/media/platform/qcom/venus/helpers.c
>> index edb653e..38d617b 100644
>> --- a/drivers/media/platform/qcom/venus/helpers.c
>> +++ b/drivers/media/platform/qcom/venus/helpers.c
>> @@ -497,6 +497,16 @@ static int load_scale_clocks(struct venus_inst 
>> *inst)
>>  		return scale_clocks_vpu4(inst);
>>  }
>> 
>> +int set_core_usage(struct venus_inst *inst, u32 usage)
>> +{
>> +	const u32 ptype = HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE;
>> +	struct hfi_videocores_usage_type cu;
>> +
>> +	cu.video_core_enable_mask = usage;
>> +
>> +	return hfi_session_set_property(inst, ptype, &cu);
>> +}
>> +
>>  static void fill_buffer_desc(const struct venus_buffer *buf,
>>  			     struct hfi_buffer_desc *bd, bool response)
>>  {
>> @@ -800,19 +810,47 @@ int venus_helper_set_work_mode(struct venus_inst 
>> *inst, u32 mode)
>>  }
>>  EXPORT_SYMBOL_GPL(venus_helper_set_work_mode);
>> 
>> -int venus_helper_set_core_usage(struct venus_inst *inst, u32 usage)
>> +int venus_helper_decide_core(struct venus_inst *inst, u32 cores_max)
> 
> I think venus_helper_set_core is better?
> 
Sure Stan.
>>  {
>> -	const u32 ptype = HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE;
>> -	struct hfi_videocores_usage_type cu;
>> +	struct venus_core *core = inst->core;
>> +	u32 min_core_id = 0, core0_load = 0, core1_load = 0;
>> +	unsigned long min_load, max_freq, cur_inst_load;
>> +	int ret;
>> 
>>  	if (!IS_V4(inst->core))
>>  		return 0;
>> 
>> -	cu.video_core_enable_mask = usage;
>> +	core0_load = load_per_core(core, VIDC_CORE_ID_1);
>> +	core1_load = load_per_core(core, VIDC_CORE_ID_2);
>> 
>> -	return hfi_session_set_property(inst, ptype, &cu);
>> +	min_core_id = core0_load < core1_load ? VIDC_CORE_ID_1 : 
>> VIDC_CORE_ID_2;
>> +	min_load = min(core0_load, core1_load);
>> +
>> +	if (cores_max < VIDC_CORE_ID_1) {
>> +		min_core_id = VIDC_CORE_ID_1;
>> +		min_load = core0_load;
>> +	}
> 
> could you please move that fragment just after IS_V4 check and return 
> an
> error if cores_max < VIDC_CORE_ID_1.
> 
Instead of "if cores_max < VIDC_CORE_ID_1", we need to check if 
cores_max < VIDC_CORE_ID_2
and set core the single core as minimum load core. I can't return after 
this check immidiately
as it needs to be checked whether load can be accommodated or not.
>> +
>> +	cur_inst_load = load_per_instance(inst) *
>> +		inst->clk_data.codec_data->vpp_cycles;
>> +	max_freq = core->res->freq_tbl[0].freq;
>> +
>> +	if ((cur_inst_load + min_load)	> max_freq) {
>> +		dev_warn(core->dev, "HW is overloaded, needed: %lu max: %lu\n",
>> +			 cur_inst_load, max_freq);
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = set_core_usage(inst, min_core_id);
>> +
>> +	if (ret)
>> +		return ret;
>> +
>> +	inst->clk_data.core_id = min_core_id;
>> +
>> +	return 0;
>>  }
>> -EXPORT_SYMBOL_GPL(venus_helper_set_core_usage);
>> +EXPORT_SYMBOL_GPL(venus_helper_decide_core);
>> 
>>  int venus_helper_init_codec_data(struct venus_inst *inst)
>>  {
>> diff --git a/drivers/media/platform/qcom/venus/helpers.h 
>> b/drivers/media/platform/qcom/venus/helpers.h
>> index f9360a8..c41ceb3 100644
>> --- a/drivers/media/platform/qcom/venus/helpers.h
>> +++ b/drivers/media/platform/qcom/venus/helpers.h
>> @@ -42,7 +42,7 @@ int venus_helper_set_output_resolution(struct 
>> venus_inst *inst,
>>  				       u32 buftype);
>>  int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode);
>>  int venus_helper_init_codec_data(struct venus_inst *inst);
>> -int venus_helper_set_core_usage(struct venus_inst *inst, u32 usage);
>> +int venus_helper_decide_core(struct venus_inst *inst, u32 cores_max);
>>  int venus_helper_set_num_bufs(struct venus_inst *inst, unsigned int 
>> input_bufs,
>>  			      unsigned int output_bufs,
>>  			      unsigned int output2_bufs);
>> diff --git a/drivers/media/platform/qcom/venus/vdec.c 
>> b/drivers/media/platform/qcom/venus/vdec.c
>> index 51795fd..9f988ba 100644
>> --- a/drivers/media/platform/qcom/venus/vdec.c
>> +++ b/drivers/media/platform/qcom/venus/vdec.c
>> @@ -544,14 +544,15 @@ static int vdec_output_conf(struct venus_inst 
>> *inst)
>>  	u32 height = inst->out_height;
>>  	u32 out_fmt, out2_fmt;
>>  	bool ubwc = false;
>> -	u32 ptype;
>> +	u32 ptype, cores_max;
>>  	int ret;
>> 
>>  	ret = venus_helper_set_work_mode(inst, VIDC_WORK_MODE_2);
>>  	if (ret)
>>  		return ret;
>> 
>> -	ret = venus_helper_set_core_usage(inst, VIDC_CORE_ID_1);
>> +	cores_max = core_num_max(inst);
> 
> please move core_max calculation in the venus_helper_decide_core() here
> and below.
> 
Yes Stan.
>> +	ret = venus_helper_decide_core(inst, cores_max);
>>  	if (ret)
>>  		return ret;
>> 
>> diff --git a/drivers/media/platform/qcom/venus/venc.c 
>> b/drivers/media/platform/qcom/venus/venc.c
>> index 792cdce..ed39efd 100644
>> --- a/drivers/media/platform/qcom/venus/venc.c
>> +++ b/drivers/media/platform/qcom/venus/venc.c
>> @@ -654,13 +654,15 @@ static int venc_set_properties(struct venus_inst 
>> *inst)
>>  	struct hfi_quantization quant;
>>  	struct hfi_quantization_range quant_range;
>>  	u32 ptype, rate_control, bitrate, profile = 0, level = 0;
>> +	u32 cores_max;
>>  	int ret;
>> 
>>  	ret = venus_helper_set_work_mode(inst, VIDC_WORK_MODE_2);
>>  	if (ret)
>>  		return ret;
>> 
>> -	ret = venus_helper_set_core_usage(inst, VIDC_CORE_ID_2);
>> +	cores_max = core_num_max(inst);
>> +	ret = venus_helper_decide_core(inst, cores_max);
>>  	if (ret)
>>  		return ret;
>> 
>> 
