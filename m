Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41FD078785
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2019 10:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727653AbfG2Ife (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jul 2019 04:35:34 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:35185 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727517AbfG2Ife (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jul 2019 04:35:34 -0400
Received: by mail-lf1-f65.google.com with SMTP id p197so41414492lfa.2
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2019 01:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FWpcboH2lysDc+UrR6Wnjx8ccwzYsU3RW3Ru+qtWu5A=;
        b=lrXqod/GOpdBTZkWoxXDZ17shQKWM487kOaSK1LgCm2FwBkLcud39wneA5ccGlfs+7
         FKUB228G4iV7Qo0xtwP/flLX5ubrte6v1W3Y/IXs/ZDzBUsU3S0xSe/xKhIz4ytzncA0
         EDAnWHuLFUX6HoUr9CKWLfX7/dQKTpBoiiSd3aqcMir26yhzEa9pWaZXx4Uf9St6w9p9
         ydVB9f4b71I09P9Jwa7jEZiI/BEZ9l3F+srB8uYkOK5tAGnMm9cAvftdULR1YGN/6kzU
         F79jPVldqPgbc9wcqxnq2J0/Qxv4fZi7b7kcvjPXsaKoml2snhkWqZf7+ObuAXZjllGU
         vZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FWpcboH2lysDc+UrR6Wnjx8ccwzYsU3RW3Ru+qtWu5A=;
        b=NDcVdGiRR+W+VBGeaVwEt7xfORQ/FgeRRhIREOSAZr9rY1BMZtWnJxMLZnamuE/K68
         /i2QOvLYZFaeu3pbBK4dL13yMLEGnG4/ojrVgcsLLyqfPgWxv6Zwp1rDRZVfU8pOtQWV
         7aoWyNJLi726GQY/300yK/W6JhO/5a5Pxvk4zZ1A738mTUi6J00QeLK/bMFoIhX1msXA
         DlqY/5zjUw+Uv1BlRa3AEIkwt4cfadfdOQTq0JS494a2mC55INNZTNL9ILXZdHTeVoHK
         earkmXo8FMAKxD2dD8HF1PYWTFXNfthtsVc08xcNxm37aS1O61Ihjj8YdPUiTm6BKBIG
         KXRg==
X-Gm-Message-State: APjAAAW3MZm2G3rrwkKNwRbo+nKfQUyQWmquV38F0CLA2skG2XCcIzG+
        Pa0ubAPwYn85CbJspQRvTw3QzWoqawmtNQ==
X-Google-Smtp-Source: APXvYqwuSBZ0x68X+CtDlZClvW63jEOIokVvwaoOBI28kgPF3P0i2zUz8qwlC7LvLnUv3iPCWnhMxw==
X-Received: by 2002:a19:ca0d:: with SMTP id a13mr49228459lfg.110.1564389331265;
        Mon, 29 Jul 2019 01:35:31 -0700 (PDT)
Received: from [192.168.28.50] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id d10sm12537047ljc.15.2019.07.29.01.35.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 01:35:30 -0700 (PDT)
Subject: Re: [PATCH v6 2/4] media: venus: Update clock scaling
To:     Aniket Masule <amasule@codeaurora.org>, linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1563786452-22188-1-git-send-email-amasule@codeaurora.org>
 <1563786452-22188-2-git-send-email-amasule@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <c02c070d-7f22-88ba-d254-18951c34ce5e@linaro.org>
Date:   Mon, 29 Jul 2019 11:35:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1563786452-22188-2-git-send-email-amasule@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Aniket,

On 7/22/19 12:07 PM, Aniket Masule wrote:
> Current clock scaling calculations are same for vpu4 and
> previous versions. For vpu4, Clock scaling calculations
> are updated with cycles/mb. This helps in getting precise
> clock required.
> 
> Signed-off-by: Aniket Masule <amasule@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/helpers.c | 91 +++++++++++++++++++++++++++--
>  1 file changed, 87 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 7492373..2c976e4 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -348,8 +348,9 @@ static u32 load_per_type(struct venus_core *core, u32 session_type)
>  	return mbs_per_sec;
>  }
>  
> -static int load_scale_clocks(struct venus_core *core)
> +static int scale_clocks(struct venus_inst *inst)
>  {
> +	struct venus_core *core = inst->core;
>  	const struct freq_tbl *table = core->res->freq_tbl;
>  	unsigned int num_rows = core->res->freq_tbl_size;
>  	unsigned long freq = table[0].freq;
> @@ -398,6 +399,89 @@ static int load_scale_clocks(struct venus_core *core)
>  	return ret;
>  }
>  
> +static unsigned long calculate_vpp_freq(struct venus_inst *inst)
> +{
> +	unsigned long vpp_freq = 0;
> +	u32 mbs_per_sec;
> +
> +	mbs_per_sec = load_per_instance(inst);
> +	vpp_freq = mbs_per_sec * inst->clk_data.codec_freq_data->vpp_freq;
> +	/* 21 / 20 is overhead factor */
> +	vpp_freq += vpp_freq / 20;
> +
> +	return vpp_freq;
> +}
> +
> +static int scale_clocks_v4(struct venus_inst *inst)
> +{
> +	struct venus_core *core = inst->core;
> +	const struct freq_tbl *table = core->res->freq_tbl;
> +	unsigned int num_rows = core->res->freq_tbl_size;
> +	struct clk *clk = core->clks[0];
> +	struct device *dev = core->dev;
> +	unsigned int i;
> +	unsigned long freq = 0, freq_core1 = 0, freq_core2 = 0;
> +	int ret;
> +
> +	freq = calculate_vpp_freq(inst);
> +
> +	if (freq > table[0].freq)
> +		dev_warn(dev, "HW is overloaded, needed: %lu max: %lu\n",
> +			 freq, table[0].freq);
> +

...

> +	for (i = 0; i < num_rows; i++) {
> +		if (freq > table[i].freq)
> +			break;
> +		freq = table[i].freq;
> +	}

The above code snippet will select the biggest table[0].freq always.
Infact do we need to "normalize" the calculated freq to the table of
possible clock rates? I think tjat should be made after sum all needed
frequencies for all cores.

> +
> +	inst->clk_data.freq = freq;
> +
> +	mutex_lock(&core->lock);
> +	list_for_each_entry(inst, &core->instances, list) {
> +		if (inst->clk_data.core_id == VIDC_CORE_ID_1) {
> +			freq_core1 += inst->clk_data.freq;
> +		} else if (inst->clk_data.core_id == VIDC_CORE_ID_2) {
> +			freq_core2 += inst->clk_data.freq;
> +		} else if (inst->clk_data.core_id == VIDC_CORE_ID_3) {
> +			freq_core1 += inst->clk_data.freq;
> +			freq_core2 += inst->clk_data.freq;
> +		}
> +	}
> +	mutex_unlock(&core->lock);
> +
> +	freq = max(freq_core1, freq_core2);
> +
> +	ret = clk_set_rate(clk, freq);
> +	if (ret)
> +		goto err;
> +
> +	ret = clk_set_rate(core->core0_clk, freq);
> +	if (ret)
> +		goto err;
> +
> +	ret = clk_set_rate(core->core1_clk, freq);
> +	if (ret)
> +		goto err;

This is duplicated in both scale_clocks and scale_clocks_v4, and could
be a common function.

> +
> +	return 0;
> +
> +err:
> +	dev_err(dev, "failed to set clock rate %lu (%d)\n", freq, ret);
> +	return ret;
> +}
> +
> +static int load_scale_clocks(struct venus_inst *inst)
> +{
> +	if (IS_V4(inst->core))
> +		return scale_clocks_v4(inst);
> +
> +	if (inst->state == INST_START)
> +		return 0;

I'm still not sure about this check of the instance state.

If we look into load_per_instance() it already doing similar check :

!(inst->state >= INST_INIT && inst->state < INST_STOP)


> +
> +	return scale_clocks(inst);
> +}
> +
>  static void fill_buffer_desc(const struct venus_buffer *buf,
>  			     struct hfi_buffer_desc *bd, bool response)
>  {
> @@ -1053,7 +1137,7 @@ void venus_helper_vb2_stop_streaming(struct vb2_queue *q)
>  
>  		venus_helper_free_dpb_bufs(inst);
>  
> -		load_scale_clocks(core);
> +		load_scale_clocks(inst);
>  		INIT_LIST_HEAD(&inst->registeredbufs);
>  	}
>  
> @@ -1070,7 +1154,6 @@ void venus_helper_vb2_stop_streaming(struct vb2_queue *q)
>  
>  int venus_helper_vb2_start_streaming(struct venus_inst *inst)
>  {
> -	struct venus_core *core = inst->core;
>  	int ret;
>  
>  	ret = intbufs_alloc(inst);
> @@ -1081,7 +1164,7 @@ int venus_helper_vb2_start_streaming(struct venus_inst *inst)
>  	if (ret)
>  		goto err_bufs_free;
>  
> -	load_scale_clocks(core);
> +	load_scale_clocks(inst);
>  
>  	ret = hfi_session_load_res(inst);
>  	if (ret)
> 

-- 
regards,
Stan
