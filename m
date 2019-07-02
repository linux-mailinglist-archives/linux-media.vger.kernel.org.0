Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC2605C88E
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 06:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725834AbfGBE7M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 00:59:12 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:60652 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbfGBE7M (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jul 2019 00:59:12 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 13CE1607DF; Tue,  2 Jul 2019 04:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562043551;
        bh=HlBgcWJfLH6tBKexfCh53i9VEnoSJ9mvKfmC1cDITKs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EH5NTaxoWidpgrsa5p2PUhX+1WCW+kPGAKNEoP7PSryrrrpE6PInf02Vcb4Zbuf/U
         zvz3SIMcOy6YVBdSjYLj2j0c4Zpw6fdqV8FIm7UxegeGxLwsC/TSG3TfSBJ8pirxPb
         HWObzGNXlt9YlSSuM+oB/smBCJB1FP2GBkPYP3Vc=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 1C117602BC;
        Tue,  2 Jul 2019 04:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562043550;
        bh=HlBgcWJfLH6tBKexfCh53i9VEnoSJ9mvKfmC1cDITKs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=h3Ta2SLMWeJcOt6kXM0LCkvCwT046gOOmcB8bPxhDb7oHdaGIHLBbaopzG9R5/bN8
         szxUy6shIdZfoqZuHDk8fUZzfZ81zKwVmkoJhDN9jEaN6Dnfz8gsUbIMG8pWKTzOP9
         SPpL9zzykXmi0NUAT0cL01zJc/JHGkpGoatpD9So=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 02 Jul 2019 10:29:10 +0530
From:   amasule@codeaurora.org
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org
Subject: Re: [PATCH v3 2/4] media: venus: Update clock scaling
In-Reply-To: <69610fc3-5333-ccc6-316f-aee96dc11150@linaro.org>
References: <1561480044-11834-1-git-send-email-amasule@codeaurora.org>
 <1561480044-11834-3-git-send-email-amasule@codeaurora.org>
 <69610fc3-5333-ccc6-316f-aee96dc11150@linaro.org>
Message-ID: <84a42501461f4aee29815a0609fdef8d@codeaurora.org>
X-Sender: amasule@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stan,

On 2019-07-01 18:41, Stanimir Varbanov wrote:
> On 6/25/19 7:27 PM, Aniket Masule wrote:
>> Current clock scaling calculations are same for vpu4 and
>> previous versions. For vpu4, Clock scaling calculations
>> are updated with cycles/mb. This helps in getting precise
>> clock required.
>> 
>> Signed-off-by: Aniket Masule <amasule@codeaurora.org>
>> ---
>>  drivers/media/platform/qcom/venus/helpers.c | 111 
>> ++++++++++++++++++++++++----
>>  drivers/media/platform/qcom/venus/helpers.h |   2 +-
>>  drivers/media/platform/qcom/venus/vdec.c    |   2 +-
>>  drivers/media/platform/qcom/venus/venc.c    |   2 +-
>>  4 files changed, 99 insertions(+), 18 deletions(-)
>> 
>> diff --git a/drivers/media/platform/qcom/venus/helpers.c 
>> b/drivers/media/platform/qcom/venus/helpers.c
>> index f7f724b..e1a0247 100644
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
>> +
> 
> please remove this blank line.
> 
>> +	struct clk *clk = core->clks[0];
>> +	struct device *dev = core->dev;
>> +	unsigned int i;
>> +	unsigned long freq = 0, freq_core0 = 0, freq_core1 = 0;
> 
> could you count the cores as it is done for VIDC_CORE_ID_ ?
> i.e. start counting from one.
> 
Sure, I was aligning it with clock handle name in core, but
aligning it with VIDC_CORE_ID_ would give good readability.
>> +	int ret;
>> +
>> +	freq = calculate_vpp_freq(inst);
>> +
>> +	if (freq > table[0].freq)
>> +		goto err;
> 
> if the goto is triggered the error message will be wrong. Infact the
> dev_err message is targeted for clk_set_rate failure.
> 
I will add separate exit for this.
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
>> +	return scale_clocks(inst);
>> +}
>> +
>>  static void fill_buffer_desc(const struct venus_buffer *buf,
>>  			     struct hfi_buffer_desc *bd, bool response)
>>  {
>> @@ -715,35 +796,36 @@ int venus_helper_set_core_usage(struct 
>> venus_inst *inst, u32 usage)
>>  }
>>  EXPORT_SYMBOL_GPL(venus_helper_set_core_usage);
>> 
>> -int venus_helper_init_codec_data(struct venus_inst *inst)
>> +int venus_helper_init_codec_freq_data(struct venus_inst *inst)
>>  {
>> -	const struct codec_data *codec_data;
>> -	unsigned int i, codec_data_size;
> 
> those deletions shouldn't exist once you fix the git rebase issue.
> 
>> +	const struct codec_freq_data *codec_freq_data;
>> +	unsigned int i, codec_freq_data_size;
> 
> could you rename the variables to shorter?
> 
Yes
>>  	u32 pixfmt;
>>  	int ret = 0;
>> 
>>  	if (!IS_V4(inst->core))
>>  		return 0;
>> 
>> -	codec_data = inst->core->res->codec_data;
>> -	codec_data_size = inst->core->res->codec_data_size;
>> +	codec_freq_data = inst->core->res->codec_freq_data;
>> +	codec_freq_data_size = inst->core->res->codec_freq_data_size;
>>  	pixfmt = inst->session_type == VIDC_SESSION_TYPE_DEC ?
>>  			inst->fmt_out->pixfmt : inst->fmt_cap->pixfmt;
>> 
>> -	for (i = 0; i < codec_data_size; i++) {
>> -		if (codec_data[i].pixfmt == pixfmt &&
>> -		    codec_data[i].session_type == inst->session_type) {
>> -			inst->clk_data.codec_data = &codec_data[i];
>> +	for (i = 0; i < codec_freq_data_size; i++) {
>> +		if (codec_freq_data[i].pixfmt == pixfmt &&
>> +		    codec_freq_data[i].session_type == inst->session_type) {
>> +			inst->clk_data.codec_freq_data =
>> +				&codec_freq_data[i];
>>  			break;
>>  		}
>>  	}
>> 
>> -	if (!inst->clk_data.codec_data)
>> +	if (!inst->clk_data.codec_freq_data)
>>  		ret = -EINVAL;
>> 
>>  	return ret;
>>  }
>> -EXPORT_SYMBOL_GPL(venus_helper_init_codec_data);
>> +EXPORT_SYMBOL_GPL(venus_helper_init_codec_freq_data);
>> 

Thanks,
Aniket
