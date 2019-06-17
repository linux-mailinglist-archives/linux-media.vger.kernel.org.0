Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A97347DB6
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 10:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbfFQI6X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 04:58:23 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34701 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725826AbfFQI6W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 04:58:22 -0400
Received: by mail-lf1-f67.google.com with SMTP id y198so5922110lfa.1
        for <linux-media@vger.kernel.org>; Mon, 17 Jun 2019 01:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/kfB3EQM4cTIQNVbeoHSHizf5Tj4LK22gsgty3+LXc4=;
        b=pP2hnCpmuzmpUuxLP4KXKlNOeVTx1TBwhIPclOpxEGCjl9Sn4/ckg1hPVnKleZ2xox
         F3w4hqV+atBA6b7c0syRJzgWA2wAf+jrfHPro3azRbvZPT9i0onlmBkMqkMfXZH6Ul4A
         gX61NkB3VHxK2rBK7ZAq/0M8bPEUknYdnwZbtnFbQfJ16mVsk+QTEJ0VZBEoZMU+WGH0
         SXzzbfIA2vwxdZQyGMiKFGGwDl+1Q281FEQx8ppVf84X3tDfPYjGw5jYMKmKkmbBW/AL
         4he0CbiRp8s+Vk3F6A5nQ4FeqPJ1SJvhMQPM7BU+BLVpTQv17D4ovGeyMVln5ZzmuZX6
         zTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/kfB3EQM4cTIQNVbeoHSHizf5Tj4LK22gsgty3+LXc4=;
        b=EmPMkWX7VJSpb7qnLmPIhoC7eP1ZkmsbHA64OIn81Tb4IvnvRSaHme/WzAU4j7ybz/
         g9RfdgLIFGxi2v/qsGa78hPGtyA0AbX00rhu49kxbb0NOYwT7v/Om46rOYKzsSzBtbd2
         xlRRr7WRg1dk5wG8vhFEtDnPQjs3WVV1qLFVt8twFsQctudK5OVLZ1FYLGuo6nVDWRdr
         J7yE6ftxYnbQyjqVJF7JqoHay9Tj7PHcqXLBlv4RflRqUtOt/zc5NWV2du+j+10zy+r8
         CfWUPALE6QvepsHZHfE2PMiO0yILZTwK7dVGWx2+RHspboXUuu6L+z2b8llllGnvex0G
         QPlg==
X-Gm-Message-State: APjAAAUNo2pL+JxKLeWfnhySQ797JjUzNDRpW/7qPzb3CE8vJApK8190
        /LeLry2XQIYKpP3v1m+LcrWy/PhWjvA=
X-Google-Smtp-Source: APXvYqwlnDVF7Z/0mknFU8I//ZPr5mqf2hC+deutIqJDZ2d69y+F4BMkBDMwtOzmpEyemzbUsNdBcg==
X-Received: by 2002:ac2:52ac:: with SMTP id r12mr34554695lfm.126.1560761899947;
        Mon, 17 Jun 2019 01:58:19 -0700 (PDT)
Received: from [192.168.27.209] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id y2sm1667139lfc.35.2019.06.17.01.58.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 01:58:18 -0700 (PDT)
Subject: Re: [PATCH 3/5] media: venus: Update clock scaling
To:     Aniket Masule <amasule@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1560233130-27264-1-git-send-email-amasule@codeaurora.org>
 <1560233130-27264-4-git-send-email-amasule@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <e1903711-b8c1-d528-2da8-ffd511a2da72@linaro.org>
Date:   Mon, 17 Jun 2019 11:58:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560233130-27264-4-git-send-email-amasule@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Aniket,

On 6/11/19 9:05 AM, Aniket Masule wrote:
> Current clock scaling calculations are same for vpu4 and
> previous versions. For vpu4, Clock scaling calculations
> are updated with cycles/mb. This helps in getting precise
> clock required.
> 
> Signed-off-by: Aniket Masule <amasule@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/helpers.c | 88 +++++++++++++++++++++++++++--
>  1 file changed, 84 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index f7f724b..7bcc1e6 100644
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
> @@ -398,6 +399,86 @@ static int load_scale_clocks(struct venus_core *core)
>  	return ret;
>  }
>  
> +static unsigned long calculate_inst_freq(struct venus_inst *inst)
> +{
> +	unsigned long vpp_cycles = 0;
> +	u32 mbs_per_sec;
> +
> +	mbs_per_sec = load_per_instance(inst);
> +	vpp_cycles = mbs_per_sec * inst->clk_data.codec_data->vpp_cycles;
> +	/* 21 / 20 is overhead factor */
> +	vpp_cycles += vpp_cycles / 20;

shouldn't you multiply by 21?

> +
> +	return vpp_cycles;

It is not clear to me is that vpp_cycles or frequency (rate)? I just
lost in dimensions used here.

If you return vpp_cycles could you rename the function name?

> +}
> +
> +static int scale_clocks_vpu4(struct venus_inst *inst)

does vpu4 equivalent to HFI_VERSION_4XX? If so could you rename function
to scale_clocks_v4.

> +{
> +	struct venus_core *core = inst->core;
> +	const struct freq_tbl *table = core->res->freq_tbl;
> +	unsigned int num_rows = core->res->freq_tbl_size;
> +
> +	struct clk *clk = core->clks[0];
> +	struct device *dev = core->dev;
> +	unsigned int i;
> +	unsigned long freq = 0, freq_core0 = 0, freq_core1 = 0;
> +	int ret;
> +
> +	freq = calculate_inst_freq(inst);
> +
> +	if (freq > table[0].freq)
> +		goto err;
> +
> +	for (i = 0; i < num_rows; i++) {
> +		if (freq > table[i].freq)
> +			break;
> +		freq = table[i].freq;
> +	}
> +
> +	inst->clk_data.freq = freq;
> +
> +	mutex_lock(&core->lock);
> +	list_for_each_entry(inst, &core->instances, list) {
> +		if (inst->clk_data.core_id == VIDC_CORE_ID_1) {
> +			freq_core0 += inst->clk_data.freq;
> +		} else if (inst->clk_data.core_id == VIDC_CORE_ID_2) {
> +			freq_core1 += inst->clk_data.freq;
> +		} else if (inst->clk_data.core_id == VIDC_CORE_ID_3) {
> +			freq_core0 += inst->clk_data.freq;
> +			freq_core1 += inst->clk_data.freq;
> +		}
> +	}
> +	mutex_unlock(&core->lock);
> +
> +	freq = max(freq_core0, freq_core1);

hmm, this doesn't look right. core0 and core1 frequencies can be
different why you get the bigger and set it on both?

> +
> +	ret = clk_set_rate(clk, freq);
> +	if (ret)
> +		goto err;
> +
> +	ret = clk_set_rate(core->core0_clk, freq);

IMO this should set freq_core0

> +	if (ret)
> +		goto err;
> +
> +	ret = clk_set_rate(core->core1_clk, freq);

set freq_core1

> +	if (ret)
> +		goto err;
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
> +	if (IS_V3(inst->core) || IS_V1(inst->core))
> +		return scale_clocks(inst);
> +	else
> +		return scale_clocks_vpu4(inst);

could you reorder this to:

	if (IS_V4())
		return scale_clocks_v4(inst);

	return scale_clocks(inst);

> +}
> +
>  static void fill_buffer_desc(const struct venus_buffer *buf,
>  			     struct hfi_buffer_desc *bd, bool response)
>  {
> @@ -1053,7 +1134,7 @@ void venus_helper_vb2_stop_streaming(struct vb2_queue *q)
>  
>  		venus_helper_free_dpb_bufs(inst);
>  
> -		load_scale_clocks(core);
> +		load_scale_clocks(inst);
>  		INIT_LIST_HEAD(&inst->registeredbufs);
>  	}
>  
> @@ -1070,7 +1151,6 @@ void venus_helper_vb2_stop_streaming(struct vb2_queue *q)
>  
>  int venus_helper_vb2_start_streaming(struct venus_inst *inst)
>  {
> -	struct venus_core *core = inst->core;
>  	int ret;
>  
>  	ret = intbufs_alloc(inst);
> @@ -1081,7 +1161,7 @@ int venus_helper_vb2_start_streaming(struct venus_inst *inst)
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
