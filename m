Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2C25C8DD
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 07:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbfGBFhM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 01:37:12 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:44924 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfGBFhM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jul 2019 01:37:12 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 9463D6083E; Tue,  2 Jul 2019 05:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562045830;
        bh=JGrBwxHrXS5r9fQsQ/lPKRWZpykoj43FJ6SK6mgEm68=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OkWZuKu+L6bcd/Wiq+Y5TvDeLdhfIkcq9+EGEdmWunpDTtH3Xs2XSZIuI0RGSHRY0
         QlKAk595VHc+drpbALK1MxduBhtIAtdEWfx0RYDtywbcnPnABAsvTYL3l/gwQxDk2t
         1FbamrHjr0gHeQsAGgi1YIe2shvehm76xWFRAJR0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 6DC1A604D4;
        Tue,  2 Jul 2019 05:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562045829;
        bh=JGrBwxHrXS5r9fQsQ/lPKRWZpykoj43FJ6SK6mgEm68=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Gz45IP/Vd4/uNN/hJOz9ycUGUixp7/HIWjpttlA/WRf+A5DyANOt750q+hYieu5vX
         sP4HHv7yjEPlTe5zPSzk4RPpLBbPQVHpGzwfdrXc3KZ42LGjZelhYmpYPafCIWJNC9
         eDJWo+fYuo4Zq03VCMtRKmbvndKIBOmjbJMh/tvE=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 02 Jul 2019 11:07:09 +0530
From:   amasule@codeaurora.org
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH] media: venus: Update to bitrate based clock scaling
In-Reply-To: <00818fe7-95e6-b43f-fca8-c4669ffad947@linaro.org>
References: <1561537416-2067-1-git-send-email-amasule@codeaurora.org>
 <1561537416-2067-2-git-send-email-amasule@codeaurora.org>
 <00818fe7-95e6-b43f-fca8-c4669ffad947@linaro.org>
Message-ID: <2f26245801973b25d0ad3e62ecd1cea1@codeaurora.org>
X-Sender: amasule@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stan,

On 2019-07-01 21:15, Stanimir Varbanov wrote:
> Hi Aniket,
> 
> On 6/26/19 11:23 AM, Aniket Masule wrote:
>> Introduced clock scaling using bitrate, current
>> calculations consider only the cycles per mb.
>> Also, clock scaling is now triggered before every
>> buffer being queued to the device. This helps in
>> deciding precise clock cycles required.
>> 
>> Signed-off-by: Aniket Masule <amasule@codeaurora.org>
>> ---
>>  drivers/media/platform/qcom/venus/core.c    | 16 +++++------
>>  drivers/media/platform/qcom/venus/core.h    |  1 +
>>  drivers/media/platform/qcom/venus/helpers.c | 43 
>> +++++++++++++++++++++++++----
>>  3 files changed, 47 insertions(+), 13 deletions(-)
>> 
>> diff --git a/drivers/media/platform/qcom/venus/core.c 
>> b/drivers/media/platform/qcom/venus/core.c
>> index f1597d6..ad6bb74 100644
>> --- a/drivers/media/platform/qcom/venus/core.c
>> +++ b/drivers/media/platform/qcom/venus/core.c
>> @@ -474,14 +474,14 @@ static __maybe_unused int 
>> venus_runtime_resume(struct device *dev)
>>  };
>> 
>>  static struct codec_freq_data sdm845_codec_freq_data[] =  {
>> -	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675 },
>> -	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675 },
>> -	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_ENC, 675 },
>> -	{ V4L2_PIX_FMT_MPEG2, VIDC_SESSION_TYPE_DEC, 200 },
>> -	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 200 },
>> -	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 200 },
>> -	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_DEC, 200 },
>> -	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 200 },
>> +	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675, 10 },
>> +	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675, 10 },
>> +	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_ENC, 675, 10 },
>> +	{ V4L2_PIX_FMT_MPEG2, VIDC_SESSION_TYPE_DEC, 200, 10 },
>> +	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 200, 10 },
>> +	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 200, 10 },
>> +	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_DEC, 200, 10 },
>> +	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 200, 10 },
>>  };
>> 
>>  static const struct venus_resources sdm845_res = {
>> diff --git a/drivers/media/platform/qcom/venus/core.h 
>> b/drivers/media/platform/qcom/venus/core.h
>> index 2ed6496..b964b7c 100644
>> --- a/drivers/media/platform/qcom/venus/core.h
>> +++ b/drivers/media/platform/qcom/venus/core.h
>> @@ -39,6 +39,7 @@ struct codec_freq_data {
>>  	u32 pixfmt;
>>  	u32 session_type;
>>  	unsigned int vpp_freq;
>> +	unsigned int vsp_freq;
> 
> unsigned long?
> 
The hard-coded values for both vpp and vsp will in few hundreds.
So, unsigned int would work fine.
>>  };
>> 
>>  struct venus_resources {
>> diff --git a/drivers/media/platform/qcom/venus/helpers.c 
>> b/drivers/media/platform/qcom/venus/helpers.c
>> index ef35fd8..634778a 100644
>> --- a/drivers/media/platform/qcom/venus/helpers.c
>> +++ b/drivers/media/platform/qcom/venus/helpers.c
>> @@ -379,6 +379,9 @@ static int scale_clocks(struct venus_inst *inst)
>>  	unsigned int i;
>>  	int ret;
>> 
>> +	if (inst->state == INST_START)
>> +		return 0;
> 
> This condition is related (probably) to the change in
> venus_helper_vb2_buf_queue() but shouldn't it be copied in
> scale_clocks_v4 too?
> 
Yes, this is related to change in venus_helper_vb2_buf_queue.
The intention is trigger clock scaling only in case of v4
whenever instance is in  INST_START state. This would call scale_clocks
only when instance is in INST_INIT state, which alignment to earlier
call flow.
>> +
>>  	mbs_per_sec = load_per_type(core, VIDC_SESSION_TYPE_ENC) +
>>  		      load_per_type(core, VIDC_SESSION_TYPE_DEC);
>> 
>> @@ -418,17 +421,26 @@ static int scale_clocks(struct venus_inst *inst)
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
> 
> this calculation is not used below. Is that intentional?
> 
I will refine this calculations, need to add bitrate with above 
calculated vsp cycles.
>> +
>> +	/* 10 / 7 is overhead factor */
>> +	if (inst->session_type == VIDC_SESSION_TYPE_ENC)
>> +		vsp_freq = (inst->controls.enc.bitrate * 10) / 7;
>> +	else
>> +		vsp_freq = ((fps * filled_len * 8) * 10) / 7;
>> 
>> -	return vpp_freq;
>> +	return max(vpp_freq, vsp_freq);
>>  }
>> 
>>  static int scale_clocks_v4(struct venus_inst *inst)
>> @@ -436,14 +448,30 @@ static int scale_clocks_v4(struct venus_inst 
>> *inst)
>>  	struct venus_core *core = inst->core;
>>  	const struct freq_tbl *table = core->res->freq_tbl;
>>  	unsigned int num_rows = core->res->freq_tbl_size;
>> -
>> +	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
>>  	struct clk *clk = core->clks[0];
>>  	struct device *dev = core->dev;
>> +
> 
> drop this addition of blank line.
> 
>>  	unsigned int i;
>>  	unsigned long freq = 0, freq_core0 = 0, freq_core1 = 0;
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
>> +	if (inst->session_type == VIDC_SESSION_TYPE_DEC && !filled_len) {
>> +		dev_dbg(dev, "%s: No input to the session\n", __func__);
> 
> please drop this debug message, if the user pushes empty buffers
> something will blow up earlier.
> 
Yes.
>> +		return 0;
>> +	}
>> +
>> +	freq = calculate_inst_freq(inst, filled_len);
>> 
>>  	if (freq > table[0].freq)
>>  		goto err;
>> @@ -471,6 +499,9 @@ static int scale_clocks_v4(struct venus_inst 
>> *inst)
>> 
>>  	freq = max(freq_core0, freq_core1);
>> 
>> +	if (clk_get_rate(clk) == freq)
>> +		return 0;
>> +
> 
> above check is included in clk_set_rate(), you don't need it.
> 
Yes.
>>  	ret = clk_set_rate(clk, freq);
>>  	if (ret)
>>  		goto err;
>> @@ -1150,6 +1181,8 @@ void venus_helper_vb2_buf_queue(struct 
>> vb2_buffer *vb)
>>  	if (ret)
>>  		goto unlock;
>> 
>> +	load_scale_clocks(inst);
>> +
>>  	ret = session_process_buf(inst, vbuf);
>>  	if (ret)
>>  		return_buf_error(inst, vbuf);
>> 

Regards,
Aniket
