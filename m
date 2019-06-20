Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B85E94C978
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2019 10:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726175AbfFTI2f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jun 2019 04:28:35 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:54770 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbfFTI2f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jun 2019 04:28:35 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 55CEE60867; Thu, 20 Jun 2019 08:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561019313;
        bh=UiZTqO2d/B91wZV2iRJUamihFX7vX8r/m9aAuZdvl0U=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ocALnvCYwC9QRJQUPsRcwvqANyJqa53SfaCIEmT0QswcBf+nmnNr7SnUhXh+X6cCW
         zmhXv405mWBfAyVbjG2dIKqTINyyN0XKOnfsocXETawt03GEEE2lGZecuH8IU5m6pV
         zExV2PTHNMe00CBhcZgFvSXcVqvr3oMcGWt11n8A=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 62894606FC;
        Thu, 20 Jun 2019 08:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561019312;
        bh=UiZTqO2d/B91wZV2iRJUamihFX7vX8r/m9aAuZdvl0U=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hnuGTBxGmMYkKvVgDNbeJaWwM1/2XzNz/fv1YwdrsesW+PX8UvHsu7wuSvco1OyP3
         5fZ2u0qrcDNa1UsCqP72vH4hiURwfsBx0+0sxPvrxTkQvBlK1nwZsrPedS8hForSP+
         xAmi05PCri21LPPcrvDLZY3RRp7dhUoJRVXVefxo=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 20 Jun 2019 13:58:32 +0530
From:   amasule@codeaurora.org
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org
Subject: Re: [PATCH 3/5] media: venus: Update clock scaling
In-Reply-To: <e1903711-b8c1-d528-2da8-ffd511a2da72@linaro.org>
References: <1560233130-27264-1-git-send-email-amasule@codeaurora.org>
 <1560233130-27264-4-git-send-email-amasule@codeaurora.org>
 <e1903711-b8c1-d528-2da8-ffd511a2da72@linaro.org>
Message-ID: <0a0b2dd455f21d3ea7013c4595fb0fc7@codeaurora.org>
X-Sender: amasule@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stan,

On 2019-06-17 14:28, Stanimir Varbanov wrote:
> Hi Aniket,
> 
> On 6/11/19 9:05 AM, Aniket Masule wrote:
>> Current clock scaling calculations are same for vpu4 and
>> previous versions. For vpu4, Clock scaling calculations
>> are updated with cycles/mb. This helps in getting precise
>> clock required.
>> 
>> Signed-off-by: Aniket Masule <amasule@codeaurora.org>
>> ---
>>  drivers/media/platform/qcom/venus/helpers.c | 88 
>> +++++++++++++++++++++++++++--
>>  1 file changed, 84 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/media/platform/qcom/venus/helpers.c 
>> b/drivers/media/platform/qcom/venus/helpers.c
>> index f7f724b..7bcc1e6 100644
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
>> @@ -398,6 +399,86 @@ static int load_scale_clocks(struct venus_core 
>> *core)
>>  	return ret;
>>  }
>> 
>> +static unsigned long calculate_inst_freq(struct venus_inst *inst)
>> +{
>> +	unsigned long vpp_cycles = 0;
>> +	u32 mbs_per_sec;
>> +
>> +	mbs_per_sec = load_per_instance(inst);
>> +	vpp_cycles = mbs_per_sec * inst->clk_data.codec_data->vpp_cycles;
>> +	/* 21 / 20 is overhead factor */
>> +	vpp_cycles += vpp_cycles / 20;
> 
> shouldn't you multiply by 21?
> 
Expansion of given expression results to the same.
>> +
>> +	return vpp_cycles;
> 
> It is not clear to me is that vpp_cycles or frequency (rate)? I just
> lost in dimensions used here.
> 
> If you return vpp_cycles could you rename the function name?
> 
Initial calculations included frequency (for bitrate based scaling), 
which I removed.
I will rename it calculate_inst_vpp_cycles for this patch.
>> +}
>> +
>> +static int scale_clocks_vpu4(struct venus_inst *inst)
> 
> does vpu4 equivalent to HFI_VERSION_4XX? If so could you rename 
> function
> to scale_clocks_v4.
> 
Sure Stan, I will rename it to scale_clocks_v4.
>> +{
>> +	struct venus_core *core = inst->core;
>> +	const struct freq_tbl *table = core->res->freq_tbl;
>> +	unsigned int num_rows = core->res->freq_tbl_size;
>> +
>> +	struct clk *clk = core->clks[0];
>> +	struct device *dev = core->dev;
>> +	unsigned int i;
>> +	unsigned long freq = 0, freq_core0 = 0, freq_core1 = 0;
>> +	int ret;
>> +
>> +	freq = calculate_inst_freq(inst);
>> +
>> +	if (freq > table[0].freq)
>> +		goto err;
>> +
>> +	for (i = 0; i < num_rows; i++) {
>> +		if (freq > table[i].freq)
>> +			break;
>> +		freq = table[i].freq;
>> +	}
>> +
>> +	inst->clk_data.freq = freq;
>> +
>> +	mutex_lock(&core->lock);
>> +	list_for_each_entry(inst, &core->instances, list) {
>> +		if (inst->clk_data.core_id == VIDC_CORE_ID_1) {
>> +			freq_core0 += inst->clk_data.freq;
>> +		} else if (inst->clk_data.core_id == VIDC_CORE_ID_2) {
>> +			freq_core1 += inst->clk_data.freq;
>> +		} else if (inst->clk_data.core_id == VIDC_CORE_ID_3) {
>> +			freq_core0 += inst->clk_data.freq;
>> +			freq_core1 += inst->clk_data.freq;
>> +		}
>> +	}
>> +	mutex_unlock(&core->lock);
>> +
>> +	freq = max(freq_core0, freq_core1);
> 
> hmm, this doesn't look right. core0 and core1 frequencies can be
> different why you get the bigger and set it on both?
> 
We can't set separate clocks to core0 and core1.
As per the design, we can set clocks to the branch only not the 
individual cores.
>> +
>> +	ret = clk_set_rate(clk, freq);
>> +	if (ret)
>> +		goto err;
>> +
>> +	ret = clk_set_rate(core->core0_clk, freq);
> 
> IMO this should set freq_core0
We need set max required frequency, due to the reason mentioned above.
> 
>> +	if (ret)
>> +		goto err;
>> +
>> +	ret = clk_set_rate(core->core1_clk, freq);
> 
> set freq_core1
> 
We need set max required frequency, due to the reason mentioned above.
>> +	if (ret)
>> +		goto err;
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
>> +	if (IS_V3(inst->core) || IS_V1(inst->core))
>> +		return scale_clocks(inst);
>> +	else
>> +		return scale_clocks_vpu4(inst);
> 
> could you reorder this to:
> 
> 	if (IS_V4())
> 		return scale_clocks_v4(inst);
> 
> 	return scale_clocks(inst);
> 
Yes Stan.
>> +}
>> +
>>  static void fill_buffer_desc(const struct venus_buffer *buf,
>>  			     struct hfi_buffer_desc *bd, bool response)
>>  {
>> @@ -1053,7 +1134,7 @@ void venus_helper_vb2_stop_streaming(struct 
>> vb2_queue *q)
>> 
>>  		venus_helper_free_dpb_bufs(inst);
>> 
>> -		load_scale_clocks(core);
>> +		load_scale_clocks(inst);
>>  		INIT_LIST_HEAD(&inst->registeredbufs);
>>  	}
>> 
>> @@ -1070,7 +1151,6 @@ void venus_helper_vb2_stop_streaming(struct 
>> vb2_queue *q)
>> 
>>  int venus_helper_vb2_start_streaming(struct venus_inst *inst)
>>  {
>> -	struct venus_core *core = inst->core;
>>  	int ret;
>> 
>>  	ret = intbufs_alloc(inst);
>> @@ -1081,7 +1161,7 @@ int venus_helper_vb2_start_streaming(struct 
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
