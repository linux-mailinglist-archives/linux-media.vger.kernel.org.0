Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0381A9DCE8
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 07:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729123AbfH0FAP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 01:00:15 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:46476 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725795AbfH0FAP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 01:00:15 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 5B7DE60C72; Tue, 27 Aug 2019 05:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566882014;
        bh=TcF1g7fa3jSfnZHKz7d+L3HUTvxu5t2aa0eb5++9aUA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=USGD6nB4Mg7yAH+645Ev9UIHaVUoniUewMlO6mKc4Vzcl20knnMf0gjDMr06AkT69
         D29vXRK5qAICTlH0bjWbGX+wDh/oQJO3ydu9OCYNGpQhytZbTEV/WFwfPLZ00zgwol
         +p9LG4McdDIv1+xQCxTAE63lRlbx0aQdQdrgf7NM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id CAC0960C5F;
        Tue, 27 Aug 2019 05:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566882013;
        bh=TcF1g7fa3jSfnZHKz7d+L3HUTvxu5t2aa0eb5++9aUA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QlxvT4+bd3DOVIMpTneGrzdy2Et61p5tudK4Z6CBBh9RrRcTCFkFA2J2egiY4rmGk
         7wEnbsFvx/+4meAatc1lQqqNjVxVBOfC3ZE+13qdbJzGHOiZ4NU4e+JNu0h0knbXSw
         yJdoACr0wniY9SChs/MHJcqeg7+6eUbH8NHbzI1Y=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 27 Aug 2019 10:30:13 +0530
From:   amasule@codeaurora.org
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org
Subject: Re: [PATCH v6 4/4] media: venus: Update core selection
In-Reply-To: <d8fb8806-df3f-dd30-9d40-79667cf5cc37@linaro.org>
References: <1563786452-22188-1-git-send-email-amasule@codeaurora.org>
 <1563786452-22188-4-git-send-email-amasule@codeaurora.org>
 <d8fb8806-df3f-dd30-9d40-79667cf5cc37@linaro.org>
Message-ID: <3037ab0b62a67f7648d3984c3ec9ffd9@codeaurora.org>
X-Sender: amasule@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 2019-07-29 15:16, Stanimir Varbanov wrote:
> Hi,
> 
> On 7/22/19 12:07 PM, Aniket Masule wrote:
>> Present core assignment is static. Introduced load balancing
>> across the cores. Load on earch core is calculated and core
>> with minimum load is assigned to given instance.
>> 
>> Signed-off-by: Aniket Masule <amasule@codeaurora.org>
>> ---
>>  drivers/media/platform/qcom/venus/helpers.c    | 69 
>> +++++++++++++++++++++++---
>>  drivers/media/platform/qcom/venus/helpers.h    |  2 +-
>>  drivers/media/platform/qcom/venus/hfi_helper.h |  1 +
>>  drivers/media/platform/qcom/venus/hfi_parser.h |  5 ++
>>  drivers/media/platform/qcom/venus/vdec.c       |  2 +-
>>  drivers/media/platform/qcom/venus/venc.c       |  2 +-
>>  6 files changed, 72 insertions(+), 9 deletions(-)
>> 
>> diff --git a/drivers/media/platform/qcom/venus/helpers.c 
>> b/drivers/media/platform/qcom/venus/helpers.c
>> index edf403d..3b6cbbf 100644
>> --- a/drivers/media/platform/qcom/venus/helpers.c
>> +++ b/drivers/media/platform/qcom/venus/helpers.c
>> @@ -26,6 +26,7 @@
>>  #include "helpers.h"
>>  #include "hfi_helper.h"
>>  #include "hfi_venus_io.h"
>> +#include "hfi_parser.h"
>> 
>>  struct intbuf {
>>  	struct list_head list;
>> @@ -331,6 +332,24 @@ static u32 load_per_instance(struct venus_inst 
>> *inst)
>>  	return mbs * inst->fps;
>>  }
>> 
>> +static u32 load_per_core(struct venus_core *core, u32 core_id)
>> +{
>> +	struct venus_inst *inst = NULL;
>> +	u32 mbs_per_sec = 0, load = 0;
>> +
>> +	mutex_lock(&core->lock);
>> +	list_for_each_entry(inst, &core->instances, list) {
>> +		if (inst->clk_data.core_id != core_id)
>> +			continue;
>> +
>> +		mbs_per_sec = load_per_instance(inst);
>> +		load += mbs_per_sec * inst->clk_data.codec_freq_data->vpp_freq;
>> +	}
>> +	mutex_unlock(&core->lock);
>> +
>> +	return load;
>> +}
>> +
>>  static u32 load_per_type(struct venus_core *core, u32 session_type)
>>  {
>>  	struct venus_inst *inst = NULL;
>> @@ -505,6 +524,16 @@ static int load_scale_clocks(struct venus_inst 
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
>> @@ -808,19 +837,47 @@ int venus_helper_set_work_mode(struct venus_inst 
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
>> +	u32 min_core_id = 0, core1_load = 0, core2_load = 0;
>> +	unsigned long min_load, max_freq, cur_inst_load;
>> +	u32 cores_max;
>> +	int ret;
>> 
>>  	if (!IS_V4(inst->core))
>>  		return 0;
>> 
>> -	cu.video_core_enable_mask = usage;
>> +	core1_load = load_per_core(core, VIDC_CORE_ID_1);
>> +	core2_load = load_per_core(core, VIDC_CORE_ID_2);
>> +	min_core_id = core1_load < core2_load ? VIDC_CORE_ID_1 : 
>> VIDC_CORE_ID_2;
>> +	min_load = min(core1_load, core2_load);
>> +	cores_max = core_num_max(inst);
>> 
>> -	return hfi_session_set_property(inst, ptype, &cu);
>> +	if (cores_max < VIDC_CORE_ID_2) {
>> +		min_core_id = VIDC_CORE_ID_1;
>> +		min_load = core1_load;
>> +	}
>> +
>> +	cur_inst_load = load_per_instance(inst) *
>> +		inst->clk_data.codec_freq_data->vpp_freq;
>> +	max_freq = core->res->freq_tbl[0].freq;
>> +
>> +	if ((cur_inst_load + min_load) > max_freq) {
>> +		dev_warn(core->dev, "HW is overloaded, needed: %lu max: %lu\n",
>> +			 cur_inst_load, max_freq);
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = set_core_usage(inst, min_core_id);
> 
> We have a problem here. Lets assume that we have only one running
> decoder session and the code above decides that it should be handled by
> core2, but core2 clocks presently are enabled only if there is an
> encoder session (see DT subnodes), thus we select core2 but without
> enabling core2 clocks and power domain.
> 
I will send a separate patch for core selection, once power domain issue
is fixed.

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

Regards,
Aniket
