Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF266A19C
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2019 06:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730336AbfGPEqP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jul 2019 00:46:15 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:52606 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbfGPEqO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jul 2019 00:46:14 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 5C3F961893; Tue, 16 Jul 2019 04:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563252373;
        bh=rWILGPhkxP68rBkXY6/g2qTIfMGkcu1kl9obpE4M3BQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=LZCpUYH9PXzZoq9ehEH37beEl9T1lquDtHTOSU+RoRjdk60/hKXQbg0gIhdhexWcR
         S6d1I3SRayT0TMAMlWohpdOwHfcuVGrGiOvWQ5l8vkwLexeIXTwImy2rYMNtn4ucmX
         hLYpWR/2ktZWqHjKxxZVrWeC35Ilz2P3iFBo6JgA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id D124A6188E;
        Tue, 16 Jul 2019 04:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563252372;
        bh=rWILGPhkxP68rBkXY6/g2qTIfMGkcu1kl9obpE4M3BQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Dvph4JMPtJ+mJxekev+VyYy/1x8B7tu6wqS3aORiYWsgiLJxrkKz4pz7ul/kod0Bl
         j8b2wyqJl2t55Q4YgnPlVLjMoByXpnxbTqmGLQk10x5ZQ220Ugf1BFAkEsLlWcITQh
         blHB13tmdjKTx82/l7k3GEvEzVKcHGI6TbA0FXxo=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 16 Jul 2019 10:16:12 +0530
From:   amasule@codeaurora.org
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH v4 3/4] media: venus: Update to bitrate based clock
 scaling
In-Reply-To: <06248dce-2c01-279b-20be-4dfcafbd792f@linaro.org>
References: <1562078787-516-1-git-send-email-amasule@codeaurora.org>
 <1562078787-516-4-git-send-email-amasule@codeaurora.org>
 <06248dce-2c01-279b-20be-4dfcafbd792f@linaro.org>
Message-ID: <81db5b6d41fb49dba60eab973ce20fbb@codeaurora.org>
X-Sender: amasule@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 2019-07-15 21:28, Stanimir Varbanov wrote:
> Hi,
> 
> On 7/2/19 5:46 PM, Aniket Masule wrote:
>> Introduced clock scaling using bitrate, preavious
>> calculations consider only the cycles per mb.
>> Also, clock scaling is now triggered before every
>> buffer being queued to the device. This helps in
>> deciding precise clock cycles required.
>> 
>> Signed-off-by: Aniket Masule <amasule@codeaurora.org>
>> ---
>>  drivers/media/platform/qcom/venus/helpers.c | 31 
>> +++++++++++++++++++++++++----
>>  1 file changed, 27 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/media/platform/qcom/venus/helpers.c 
>> b/drivers/media/platform/qcom/venus/helpers.c
>> index 2c976e4..5726d86 100644
>> --- a/drivers/media/platform/qcom/venus/helpers.c
>> +++ b/drivers/media/platform/qcom/venus/helpers.c
>> @@ -399,17 +399,26 @@ static int scale_clocks(struct venus_inst *inst)
>>  	return ret;
>>  }
>> 
>> -static unsigned long calculate_vpp_freq(struct venus_inst *inst)
>> +static unsigned long calculate_inst_freq(struct venus_inst *inst,
>> +					 unsigned long filled_len)
>>  {
>> -	unsigned long vpp_freq = 0;
>> +	unsigned long vpp_freq = 0, vsp_freq = 0;
>> +	u64 fps = inst->fps;
>>  	u32 mbs_per_sec;
>> 
>>  	mbs_per_sec = load_per_instance(inst);
>>  	vpp_freq = mbs_per_sec * inst->clk_data.codec_freq_data->vpp_freq;
>>  	/* 21 / 20 is overhead factor */
>>  	vpp_freq += vpp_freq / 20;
>> +	vsp_freq = mbs_per_sec * inst->clk_data.codec_freq_data->vsp_freq;
>> 
>> -	return vpp_freq;
>> +	/* 10 / 7 is overhead factor */
>> +	if (inst->session_type == VIDC_SESSION_TYPE_ENC)
>> +		vsp_freq += (inst->controls.enc.bitrate * 10) / 7;
>> +	else
>> +		vsp_freq += ((fps * filled_len * 8) * 10) / 7;
>> +
>> +	return max(vpp_freq, vsp_freq);
>>  }
>> 
>>  static int scale_clocks_v4(struct venus_inst *inst)
>> @@ -417,13 +426,27 @@ static int scale_clocks_v4(struct venus_inst 
>> *inst)
>>  	struct venus_core *core = inst->core;
>>  	const struct freq_tbl *table = core->res->freq_tbl;
>>  	unsigned int num_rows = core->res->freq_tbl_size;
>> +	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
>>  	struct clk *clk = core->clks[0];
>>  	struct device *dev = core->dev;
>>  	unsigned int i;
>>  	unsigned long freq = 0, freq_core1 = 0, freq_core2 = 0;
>> +	unsigned long filled_len = 0;
>> +	struct venus_buffer *buf, *n;
>> +	struct vb2_buffer *vb;
>>  	int ret;
>> 
>> -	freq = calculate_vpp_freq(inst);
>> +	mutex_lock(&inst->lock);
>> +	v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buf, n) {
>> +		vb = &buf->vb.vb2_buf;
>> +		filled_len = max(filled_len, vb2_get_plane_payload(vb, 0));
>> +	}
>> +	mutex_unlock(&inst->lock);
>> +
>> +	if (inst->session_type == VIDC_SESSION_TYPE_DEC && !filled_len)
>> +		return 0;
>> +
>> +	freq = calculate_inst_freq(inst, filled_len);
>> 
>>  	if (freq > table[0].freq)
>>  		dev_warn(dev, "HW is overloaded, needed: %lu max: %lu\n",
>> 
> 
> The original patch has a call to load_scale_clocks from
> venus_helper_vb2_buf_queue, why it is not included here?

Yes, I need to include it for before every buffer being queued to the 
device
to have accurate precise clock.

Regards,
Aniket
