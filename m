Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27B6F4C924
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2019 10:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbfFTIOC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jun 2019 04:14:02 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:44858 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbfFTIOC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jun 2019 04:14:02 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id DAC1C606FC; Thu, 20 Jun 2019 08:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561018440;
        bh=tuUQSriThZFHcONYU0jv68aqcUoiWpP64QDN/GaLos4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hR5MM7jbhDrOkso/7PeLJVzShlT3EKV6Qv0ULTC7JdR3h+kbV0vwiPmRiP5TTKAs4
         4NC+Jj7v2Eo+yPw022Iur50hjt/U6gIlMmgLrHBsV85EL8RqyjHDOG0gcVfgRe96V7
         B/05cBMYfUlG0+Tx549fIKRHEpm6xT728XTmwmmo=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 54889602F4;
        Thu, 20 Jun 2019 08:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561018440;
        bh=tuUQSriThZFHcONYU0jv68aqcUoiWpP64QDN/GaLos4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hR5MM7jbhDrOkso/7PeLJVzShlT3EKV6Qv0ULTC7JdR3h+kbV0vwiPmRiP5TTKAs4
         4NC+Jj7v2Eo+yPw022Iur50hjt/U6gIlMmgLrHBsV85EL8RqyjHDOG0gcVfgRe96V7
         B/05cBMYfUlG0+Tx549fIKRHEpm6xT728XTmwmmo=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 20 Jun 2019 13:43:45 +0530
From:   amasule@codeaurora.org
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org
Subject: Re: [PATCH 2/5] media: venus: Initialize codec data
In-Reply-To: <43e8022f-d231-8c36-0db8-9710a1adaabc@linaro.org>
References: <1560233130-27264-1-git-send-email-amasule@codeaurora.org>
 <1560233130-27264-3-git-send-email-amasule@codeaurora.org>
 <43e8022f-d231-8c36-0db8-9710a1adaabc@linaro.org>
Message-ID: <e75c267a5fcb1a117ea4548336fad3a4@codeaurora.org>
X-Sender: amasule@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stan,

On 2019-06-17 14:07, Stanimir Varbanov wrote:
> Hi Aniket,
> 
> On 6/11/19 9:05 AM, Aniket Masule wrote:
>> Initialize the codec data with core resources.
> 
> Please squash this patch in 1/5 patch.
Yes Stan.
> 
>> 
>> Signed-off-by: Aniket Masule <amasule@codeaurora.org>
>> ---
>>  drivers/media/platform/qcom/venus/helpers.c | 30 
>> +++++++++++++++++++++++++++++
>>  drivers/media/platform/qcom/venus/helpers.h |  1 +
>>  drivers/media/platform/qcom/venus/vdec.c    |  4 ++++
>>  drivers/media/platform/qcom/venus/venc.c    |  4 ++++
>>  4 files changed, 39 insertions(+)
>> 
>> diff --git a/drivers/media/platform/qcom/venus/helpers.c 
>> b/drivers/media/platform/qcom/venus/helpers.c
>> index 5cad601..f7f724b 100644
>> --- a/drivers/media/platform/qcom/venus/helpers.c
>> +++ b/drivers/media/platform/qcom/venus/helpers.c
>> @@ -715,6 +715,36 @@ int venus_helper_set_core_usage(struct venus_inst 
>> *inst, u32 usage)
>>  }
>>  EXPORT_SYMBOL_GPL(venus_helper_set_core_usage);
>> 
>> +int venus_helper_init_codec_data(struct venus_inst *inst)
>> +{
>> +	const struct codec_data *codec_data;
>> +	unsigned int i, codec_data_size;
>> +	u32 pixfmt;
>> +	int ret = 0;
>> +
>> +	if (!IS_V4(inst->core))
>> +		return 0;
>> +
>> +	codec_data = inst->core->res->codec_data;
>> +	codec_data_size = inst->core->res->codec_data_size;
>> +	pixfmt = inst->session_type == VIDC_SESSION_TYPE_DEC ?
>> +			inst->fmt_out->pixfmt : inst->fmt_cap->pixfmt;
>> +
>> +	for (i = 0; i < codec_data_size; i++) {
>> +		if (codec_data[i].pixfmt == pixfmt &&
>> +		    codec_data[i].session_type == inst->session_type) {
>> +			inst->clk_data.codec_data = &codec_data[i];
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (!inst->clk_data.codec_data)
>> +		ret = -EINVAL;
> 
> just return -EINVAL
> 
>> +
>> +	return ret;
> 
> return 0 is enough, and that will avoid ret variable.
Sure Stan.
> 
>> +}
>> +EXPORT_SYMBOL_GPL(venus_helper_init_codec_data);
>> +
>>  int venus_helper_set_num_bufs(struct venus_inst *inst, unsigned int 
>> input_bufs,
>>  			      unsigned int output_bufs,
>>  			      unsigned int output2_bufs)
>> diff --git a/drivers/media/platform/qcom/venus/helpers.h 
>> b/drivers/media/platform/qcom/venus/helpers.h
>> index 2475f284..f9360a8 100644
>> --- a/drivers/media/platform/qcom/venus/helpers.h
>> +++ b/drivers/media/platform/qcom/venus/helpers.h
>> @@ -41,6 +41,7 @@ int venus_helper_set_output_resolution(struct 
>> venus_inst *inst,
>>  				       unsigned int width, unsigned int height,
>>  				       u32 buftype);
>>  int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode);
>> +int venus_helper_init_codec_data(struct venus_inst *inst);
>>  int venus_helper_set_core_usage(struct venus_inst *inst, u32 usage);
>>  int venus_helper_set_num_bufs(struct venus_inst *inst, unsigned int 
>> input_bufs,
>>  			      unsigned int output_bufs,
>> diff --git a/drivers/media/platform/qcom/venus/vdec.c 
>> b/drivers/media/platform/qcom/venus/vdec.c
>> index 282de21..51795fd 100644
>> --- a/drivers/media/platform/qcom/venus/vdec.c
>> +++ b/drivers/media/platform/qcom/venus/vdec.c
>> @@ -660,6 +660,10 @@ static int vdec_init_session(struct venus_inst 
>> *inst)
>>  	if (ret)
>>  		goto deinit;
>> 
>> +	ret = venus_helper_init_codec_data(inst);
>> +	if (ret)
>> +		goto deinit;
>> +
>>  	return 0;
>>  deinit:
>>  	hfi_session_deinit(inst);
>> diff --git a/drivers/media/platform/qcom/venus/venc.c 
>> b/drivers/media/platform/qcom/venus/venc.c
>> index 32cff29..792cdce 100644
>> --- a/drivers/media/platform/qcom/venus/venc.c
>> +++ b/drivers/media/platform/qcom/venus/venc.c
>> @@ -847,6 +847,10 @@ static int venc_init_session(struct venus_inst 
>> *inst)
>>  	if (ret)
>>  		goto deinit;
>> 
>> +	ret = venus_helper_init_codec_data(inst);
>> +	if (ret)
>> +		goto deinit;
>> +
>>  	ret = venc_set_properties(inst);
>>  	if (ret)
>>  		goto deinit;
>> 
