Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04FFD5C891
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 07:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725858AbfGBFBb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 01:01:31 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:33060 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfGBFBb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jul 2019 01:01:31 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 2987360770; Tue,  2 Jul 2019 05:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562043690;
        bh=MOZmCvb+bcIg5XJ8fWmeo5gbTeE4X7ygn6TBMbE8pUo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kBSW2QiF6SlRIsPqJzwjzEcLTAaIViny/ZgBa18b56VEDzjCmzXJgMS0yrvQuPhSF
         TaIxCiV1+N4dpyuZ460ocXcYWoqa2ro0qM8iWKkdOXG5QuXsknAPPrdoc+oH2sOg5r
         Xr/hx8TKjkjoOGuMdTbJWqSzw7DAZyXz8S+lC+yk=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 92193602BC;
        Tue,  2 Jul 2019 05:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562043689;
        bh=MOZmCvb+bcIg5XJ8fWmeo5gbTeE4X7ygn6TBMbE8pUo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QHAdkRUjJNugmQ0ymxI0LeB3hAEv6dYqcabTxl2TLlu3jw7N2Diw4PoDiNA8WHJcx
         YtlqMWmjfaeWzoWO10HnMZ03VELQOqG7F2Hrn/8FidQLDTVGfdxRglSiTUhCEvNA0L
         JRgYRRoNbVwvvN/Y1DAFZaQZaRfDAGs1Xk8hTWkc=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 02 Jul 2019 10:31:29 +0530
From:   amasule@codeaurora.org
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org
Subject: Re: [PATCH v3 4/4] media: venus: Update core selection
In-Reply-To: <ac2170e6-6925-bfaf-523d-9e412d9ac1a7@linaro.org>
References: <1561480044-11834-1-git-send-email-amasule@codeaurora.org>
 <1561480044-11834-5-git-send-email-amasule@codeaurora.org>
 <ac2170e6-6925-bfaf-523d-9e412d9ac1a7@linaro.org>
Message-ID: <7627ed02d907b6e03de895b38f82f1f3@codeaurora.org>
X-Sender: amasule@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stan,

On 2019-07-01 19:28, Stanimir Varbanov wrote:
> Hi,
> 
> On 6/25/19 7:27 PM, Aniket Masule wrote:
>> Present core assignment is static. Introduced load balancing
>> across the cores. Load on earch core is calculated and core
>> with minimum load is assigned to given instance.
>> 
>> Signed-off-by: Aniket Masule <amasule@codeaurora.org>
>> ---
>>  drivers/media/platform/qcom/venus/helpers.c | 52 
>> +++++++++++++++++++++++++----
>>  drivers/media/platform/qcom/venus/helpers.h |  2 +-
>>  drivers/media/platform/qcom/venus/vdec.c    |  2 +-
>>  drivers/media/platform/qcom/venus/venc.c    |  2 +-
>>  4 files changed, 49 insertions(+), 9 deletions(-)
>> 
>> diff --git a/drivers/media/platform/qcom/venus/helpers.c 
>> b/drivers/media/platform/qcom/venus/helpers.c
>> index b79e83a..ef35fd8 100644
>> --- a/drivers/media/platform/qcom/venus/helpers.c
>> +++ b/drivers/media/platform/qcom/venus/helpers.c
>> @@ -498,6 +498,16 @@ static int load_scale_clocks(struct venus_inst 
>> *inst)
>>  	return scale_clocks(inst);
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
>> @@ -801,19 +811,49 @@ int venus_helper_set_work_mode(struct venus_inst 
>> *inst, u32 mode)
>>  }
>>  EXPORT_SYMBOL_GPL(venus_helper_set_work_mode);
>> 
>> -int venus_helper_set_core_usage(struct venus_inst *inst, u32 usage)
>> +int venus_helper_set_core(struct venus_inst *inst)
>>  {
>> -	const u32 ptype = HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE;
>> -	struct hfi_videocores_usage_type cu;
>> +	struct venus_core *core = inst->core;
>> +	u32 min_core_id = 0, core0_load = 0, core1_load = 0;
> 
> the same comment, please use the same counting scheme as for 
> VIDC_CORE_ID_
> 
Yes, I will align this with VIDC_CORE_ID_.
>> +	unsigned long min_load, max_freq, cur_inst_load;
>> +	u32 cores_max;
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
>> +	cores_max = core_num_max(inst);
>> +
>> +	if (cores_max < VIDC_CORE_ID_2) {
>> +		min_core_id = VIDC_CORE_ID_1;
>> +		min_load = core0_load;
>> +	}
>> +
>> +	cur_inst_load = load_per_instance(inst) *
>> +		inst->clk_data.codec_freq_data->vpp_freq;
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
> 
> please, delete this blank line
> 
>> +	if (ret)
>> +		return ret;
>> +
>> +	inst->clk_data.core_id = min_core_id;
>> +
>> +	return 0;
>>  }
>> -EXPORT_SYMBOL_GPL(venus_helper_set_core_usage);
>> +EXPORT_SYMBOL_GPL(venus_helper_set_core);
>> 
>>  int venus_helper_init_codec_freq_data(struct venus_inst *inst)
>>  {
>> diff --git a/drivers/media/platform/qcom/venus/helpers.h 
>> b/drivers/media/platform/qcom/venus/helpers.h
>> index 2c13245..1034111 100644
>> --- a/drivers/media/platform/qcom/venus/helpers.h
>> +++ b/drivers/media/platform/qcom/venus/helpers.h
>> @@ -42,7 +42,7 @@ int venus_helper_set_output_resolution(struct 
>> venus_inst *inst,
>>  				       u32 buftype);
>>  int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode);
>>  int venus_helper_init_codec_freq_data(struct venus_inst *inst);
>> -int venus_helper_set_core_usage(struct venus_inst *inst, u32 usage);
>> +int venus_helper_set_core(struct venus_inst *inst);
>>  int venus_helper_set_num_bufs(struct venus_inst *inst, unsigned int 
>> input_bufs,
>>  			      unsigned int output_bufs,
>>  			      unsigned int output2_bufs);
>> diff --git a/drivers/media/platform/qcom/venus/vdec.c 
>> b/drivers/media/platform/qcom/venus/vdec.c
>> index d037f80..620e060 100644
>> --- a/drivers/media/platform/qcom/venus/vdec.c
>> +++ b/drivers/media/platform/qcom/venus/vdec.c
>> @@ -551,7 +551,7 @@ static int vdec_output_conf(struct venus_inst 
>> *inst)
>>  	if (ret)
>>  		return ret;
>> 
>> -	ret = venus_helper_set_core_usage(inst, VIDC_CORE_ID_1);
>> +	ret = venus_helper_set_core(inst);
>>  	if (ret)
>>  		return ret;
>> 
>> diff --git a/drivers/media/platform/qcom/venus/venc.c 
>> b/drivers/media/platform/qcom/venus/venc.c
>> index cdddc82..28e76cc 100644
>> --- a/drivers/media/platform/qcom/venus/venc.c
>> +++ b/drivers/media/platform/qcom/venus/venc.c
>> @@ -660,7 +660,7 @@ static int venc_set_properties(struct venus_inst 
>> *inst)
>>  	if (ret)
>>  		return ret;
>> 
>> -	ret = venus_helper_set_core_usage(inst, VIDC_CORE_ID_2);
>> +	ret = venus_helper_set_core(inst);
>>  	if (ret)
>>  		return ret;
>> 
>> 

Regards,
Aniket
