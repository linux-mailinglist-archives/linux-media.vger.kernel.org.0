Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6329DCD3
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 06:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729125AbfH0EvK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 00:51:10 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:42574 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729009AbfH0EvK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 00:51:10 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 0F68E60DA8; Tue, 27 Aug 2019 04:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566881469;
        bh=SWGLO+cSduCx9dyc+sE8bjo8XDL/xO+Ce1LLOj8WhR8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=GPOFMgTUzUnAEM9eiwQCiRer/wA+ScAyd4ne1GvBHEAoC6QrKlS/sR1Gwc8Cq3WHe
         CX5w7ZsdvFQ93I6HPq9U7a+ax6YjRZRtdpJyb2Ui5AntfKnelSJEs1f/4AZxtgjQ5b
         wD3neOLPe6x51eRCZddIx+GzsepsPmkoYEAQpsZ0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 1718E60C5F;
        Tue, 27 Aug 2019 04:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566881468;
        bh=SWGLO+cSduCx9dyc+sE8bjo8XDL/xO+Ce1LLOj8WhR8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Li2JbSyMtuBJUuObVttH52eWEyzxR1tyH1EAGLiebcw/nQ2FyU9SoX/USkmLymUXV
         Jje2ITzEzy6F3cHWa1mXUoB9RN3Oyjd1XRKWGKLafNK35uIzgjlE3CuZM4fDBMKaEQ
         twqjj18VIgG5+QWcreNGglYNqCrLJMBAMP6XtrMI=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 27 Aug 2019 10:21:08 +0530
From:   amasule@codeaurora.org
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org
Subject: Re: [PATCH v6 2/4] media: venus: Update clock scaling
In-Reply-To: <c02c070d-7f22-88ba-d254-18951c34ce5e@linaro.org>
References: <1563786452-22188-1-git-send-email-amasule@codeaurora.org>
 <1563786452-22188-2-git-send-email-amasule@codeaurora.org>
 <c02c070d-7f22-88ba-d254-18951c34ce5e@linaro.org>
Message-ID: <d2f19c425ae3cfedfaa9a7c9f5bb9e8f@codeaurora.org>
X-Sender: amasule@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stan,

On 2019-07-29 14:05, Stanimir Varbanov wrote:
> Hi Aniket,
> 
> On 7/22/19 12:07 PM, Aniket Masule wrote:
>> Current clock scaling calculations are same for vpu4 and
>> previous versions. For vpu4, Clock scaling calculations
>> are updated with cycles/mb. This helps in getting precise
>> clock required.
>> 
>> Signed-off-by: Aniket Masule <amasule@codeaurora.org>
>> ---
>>  drivers/media/platform/qcom/venus/helpers.c | 91 
>> +++++++++++++++++++++++++++--
>>  1 file changed, 87 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/media/platform/qcom/venus/helpers.c 
>> b/drivers/media/platform/qcom/venus/helpers.c
>> index 7492373..2c976e4 100644
>> --- a/drivers/media/platform/qcom/venus/helpers.c
>> +++ b/drivers/media/platform/qcom/venus/helpers.c
>> @@ -348,8 +348,9 @@ static u32 load_per_type(struct venus_core *core, 
>> u32 session_type)
>>  	return mbs_per_sec;
>>  }
>> 
>> -static int load_scale_clocks(struct venus_core *core)
>> +static int scale_clocks(struct venus_inst *inst)
>>  {
>> +	struct venus_core *core = inst->core;
>>  	const struct freq_tbl *table = core->res->freq_tbl;
>>  	unsigned int num_rows = core->res->freq_tbl_size;
>>  	unsigned long freq = table[0].freq;
>> @@ -398,6 +399,89 @@ static int load_scale_clocks(struct venus_core 
>> *core)
>>  	return ret;
>>  }
>> 
>> +static unsigned long calculate_vpp_freq(struct venus_inst *inst)
>> +{
>> +	unsigned long vpp_freq = 0;
>> +	u32 mbs_per_sec;
>> +
>> +	mbs_per_sec = load_per_instance(inst);
>> +	vpp_freq = mbs_per_sec * inst->clk_data.codec_freq_data->vpp_freq;
>> +	/* 21 / 20 is overhead factor */
>> +	vpp_freq += vpp_freq / 20;
>> +
>> +	return vpp_freq;
>> +}
>> +
>> +static int scale_clocks_v4(struct venus_inst *inst)
>> +{
>> +	struct venus_core *core = inst->core;
>> +	const struct freq_tbl *table = core->res->freq_tbl;
>> +	unsigned int num_rows = core->res->freq_tbl_size;
>> +	struct clk *clk = core->clks[0];
>> +	struct device *dev = core->dev;
>> +	unsigned int i;
>> +	unsigned long freq = 0, freq_core1 = 0, freq_core2 = 0;
>> +	int ret;
>> +
>> +	freq = calculate_vpp_freq(inst);
>> +
>> +	if (freq > table[0].freq)
>> +		dev_warn(dev, "HW is overloaded, needed: %lu max: %lu\n",
>> +			 freq, table[0].freq);
>> +
> 
> ...
> 
>> +	for (i = 0; i < num_rows; i++) {
>> +		if (freq > table[i].freq)
>> +			break;
>> +		freq = table[i].freq;
>> +	}
> 
> The above code snippet will select the biggest table[0].freq always.
> Infact do we need to "normalize" the calculated freq to the table of
> possible clock rates? I think tjat should be made after sum all needed
> frequencies for all cores.
> 
Will correct this. Normalizing after sum of all needed frequencies
would be more precise.
>> +
>> +	inst->clk_data.freq = freq;
>> +
>> +	mutex_lock(&core->lock);
>> +	list_for_each_entry(inst, &core->instances, list) {
>> +		if (inst->clk_data.core_id == VIDC_CORE_ID_1) {
>> +			freq_core1 += inst->clk_data.freq;
>> +		} else if (inst->clk_data.core_id == VIDC_CORE_ID_2) {
>> +			freq_core2 += inst->clk_data.freq;
>> +		} else if (inst->clk_data.core_id == VIDC_CORE_ID_3) {
>> +			freq_core1 += inst->clk_data.freq;
>> +			freq_core2 += inst->clk_data.freq;
>> +		}
>> +	}
>> +	mutex_unlock(&core->lock);
>> +
>> +	freq = max(freq_core1, freq_core2);
>> +
>> +	ret = clk_set_rate(clk, freq);
>> +	if (ret)
>> +		goto err;
>> +
>> +	ret = clk_set_rate(core->core0_clk, freq);
>> +	if (ret)
>> +		goto err;
>> +
>> +	ret = clk_set_rate(core->core1_clk, freq);
>> +	if (ret)
>> +		goto err;
> 
> This is duplicated in both scale_clocks and scale_clocks_v4, and could
> be a common function.
> 
I will move this to common function.
>> +
>> +	return 0;
>> +
>> +err:
>> +	dev_err(dev, "failed to set clock rate %lu (%d)\n", freq, ret);
>> +	return ret;
>> +}
>> +
>> +static int load_scale_clocks(struct venus_inst *inst)
>> +{
>> +	if (IS_V4(inst->core))
>> +		return scale_clocks_v4(inst);
>> +
>> +	if (inst->state == INST_START)
>> +		return 0;
> 
> I'm still not sure about this check of the instance state.
> 
> If we look into load_per_instance() it already doing similar check :
> 
> !(inst->state >= INST_INIT && inst->state < INST_STOP)
> 
> 
This check would just make sure instance state for scaling,
not a mandatory check. I can remove the check.
>> +
>> +	return scale_clocks(inst);
>> +}
>> +
>>  static void fill_buffer_desc(const struct venus_buffer *buf,
>>  			     struct hfi_buffer_desc *bd, bool response)
>>  {
>> @@ -1053,7 +1137,7 @@ void venus_helper_vb2_stop_streaming(struct 
>> vb2_queue *q)
>> 
>>  		venus_helper_free_dpb_bufs(inst);
>> 
>> -		load_scale_clocks(core);
>> +		load_scale_clocks(inst);
>>  		INIT_LIST_HEAD(&inst->registeredbufs);
>>  	}
>> 
>> @@ -1070,7 +1154,6 @@ void venus_helper_vb2_stop_streaming(struct 
>> vb2_queue *q)
>> 
>>  int venus_helper_vb2_start_streaming(struct venus_inst *inst)
>>  {
>> -	struct venus_core *core = inst->core;
>>  	int ret;
>> 
>>  	ret = intbufs_alloc(inst);
>> @@ -1081,7 +1164,7 @@ int venus_helper_vb2_start_streaming(struct 
>> venus_inst *inst)
>>  	if (ret)
>>  		goto err_bufs_free;
>> 
>> -	load_scale_clocks(core);
>> +	load_scale_clocks(inst);
>> 
>>  	ret = hfi_session_load_res(inst);
>>  	if (ret)
>> 

Regards,
Aniket
