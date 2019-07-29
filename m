Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDDF3788CE
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2019 11:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727161AbfG2Jqp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jul 2019 05:46:45 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44304 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726457AbfG2Jqp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jul 2019 05:46:45 -0400
Received: by mail-lj1-f194.google.com with SMTP id k18so57910780ljc.11
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2019 02:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tg+McBFqpd0f2zrbI/7wxxs8tzmhTKN9nAWzW3WwxlU=;
        b=SdzpILNFfLN2CAMRhUndFy579p7sz+RKl4jBviLx7P4+/bERXmVC/UiiTSMRWKrMbX
         8bTH6PKDi08vqZQEYB2X5pFK3LNC/A/C4zXxij1ZjTkmeEjPgRNkXTVQF1HFRVP2sAL8
         t+md7uPWRSaUSdU6lzsMWeqrH+mWgjQPXv+8Vr+XUb/7p9YrPgYFQ/nT151DcKviIZWt
         BbJyCvFlyWX0tO0PAg3xyTSpmDtasav0EkA5oUQiMHY2mMR9S3aVsyewqLbcFVIA2Kvo
         NhCQGC3ZcHSCmdkPbFYHqcqF/qbyHC6cBiw5VoZdFqARuIbpdZiicaQcLEI821OoV8Ay
         /5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tg+McBFqpd0f2zrbI/7wxxs8tzmhTKN9nAWzW3WwxlU=;
        b=ILoic73QQbPwPWuPO7YsK4IXBzjQq8ln9s1nGRoN2Dtd15uoiNWvYsYwu0VHscEO5k
         6MUxIW9CCQzrztpgfdIhbxTY+Eospk3j3kIFni4m+Qa8xQXeaPdOL4OemdT+NKbAdxGT
         iXnBP6Lt6xL//d7WIlSiIFnRroqWe2PYkBiOyd+XYFEi/VfTzIMe5GSt0fk04wiEUg6j
         gnfZBD664iR6yjiKPBMgJ12sDTkAux8SqXjCDzAt2b7o3hUSU1M/rT18d07es+23LeB8
         HhDw0ZOMrWK5PXXvx0YwngX00+UcX3DazVGedElZwXsXD4aW56mEc4i+um86HsJ+KBL1
         hyTw==
X-Gm-Message-State: APjAAAXa3mtVeX4CO4u/yNeD1yj9xxrt3d35QdPynNXVhjkDe+5+fwKy
        mYODW1+PMk9mX8tLGPDna95Pw/NldwXzFw==
X-Google-Smtp-Source: APXvYqwJv8qOr+vXkmc+GxaKZiQqHVqnVgciB2XEWBb1mWCh7+Z9mup+2Pp1i+NZLxz9ELM1Pk0/Bg==
X-Received: by 2002:a2e:a0d6:: with SMTP id f22mr32148813ljm.182.1564393602547;
        Mon, 29 Jul 2019 02:46:42 -0700 (PDT)
Received: from [192.168.28.50] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id 27sm7398736ljv.21.2019.07.29.02.46.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 02:46:41 -0700 (PDT)
Subject: Re: [PATCH v6 4/4] media: venus: Update core selection
To:     Aniket Masule <amasule@codeaurora.org>, linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1563786452-22188-1-git-send-email-amasule@codeaurora.org>
 <1563786452-22188-4-git-send-email-amasule@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <d8fb8806-df3f-dd30-9d40-79667cf5cc37@linaro.org>
Date:   Mon, 29 Jul 2019 12:46:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1563786452-22188-4-git-send-email-amasule@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 7/22/19 12:07 PM, Aniket Masule wrote:
> Present core assignment is static. Introduced load balancing
> across the cores. Load on earch core is calculated and core
> with minimum load is assigned to given instance.
> 
> Signed-off-by: Aniket Masule <amasule@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/helpers.c    | 69 +++++++++++++++++++++++---
>  drivers/media/platform/qcom/venus/helpers.h    |  2 +-
>  drivers/media/platform/qcom/venus/hfi_helper.h |  1 +
>  drivers/media/platform/qcom/venus/hfi_parser.h |  5 ++
>  drivers/media/platform/qcom/venus/vdec.c       |  2 +-
>  drivers/media/platform/qcom/venus/venc.c       |  2 +-
>  6 files changed, 72 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index edf403d..3b6cbbf 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -26,6 +26,7 @@
>  #include "helpers.h"
>  #include "hfi_helper.h"
>  #include "hfi_venus_io.h"
> +#include "hfi_parser.h"
>  
>  struct intbuf {
>  	struct list_head list;
> @@ -331,6 +332,24 @@ static u32 load_per_instance(struct venus_inst *inst)
>  	return mbs * inst->fps;
>  }
>  
> +static u32 load_per_core(struct venus_core *core, u32 core_id)
> +{
> +	struct venus_inst *inst = NULL;
> +	u32 mbs_per_sec = 0, load = 0;
> +
> +	mutex_lock(&core->lock);
> +	list_for_each_entry(inst, &core->instances, list) {
> +		if (inst->clk_data.core_id != core_id)
> +			continue;
> +
> +		mbs_per_sec = load_per_instance(inst);
> +		load += mbs_per_sec * inst->clk_data.codec_freq_data->vpp_freq;
> +	}
> +	mutex_unlock(&core->lock);
> +
> +	return load;
> +}
> +
>  static u32 load_per_type(struct venus_core *core, u32 session_type)
>  {
>  	struct venus_inst *inst = NULL;
> @@ -505,6 +524,16 @@ static int load_scale_clocks(struct venus_inst *inst)
>  	return scale_clocks(inst);
>  }
>  
> +int set_core_usage(struct venus_inst *inst, u32 usage)
> +{
> +	const u32 ptype = HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE;
> +	struct hfi_videocores_usage_type cu;
> +
> +	cu.video_core_enable_mask = usage;
> +
> +	return hfi_session_set_property(inst, ptype, &cu);
> +}
> +
>  static void fill_buffer_desc(const struct venus_buffer *buf,
>  			     struct hfi_buffer_desc *bd, bool response)
>  {
> @@ -808,19 +837,47 @@ int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode)
>  }
>  EXPORT_SYMBOL_GPL(venus_helper_set_work_mode);
>  
> -int venus_helper_set_core_usage(struct venus_inst *inst, u32 usage)
> +int venus_helper_set_core(struct venus_inst *inst)
>  {
> -	const u32 ptype = HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE;
> -	struct hfi_videocores_usage_type cu;
> +	struct venus_core *core = inst->core;
> +	u32 min_core_id = 0, core1_load = 0, core2_load = 0;
> +	unsigned long min_load, max_freq, cur_inst_load;
> +	u32 cores_max;
> +	int ret;
>  
>  	if (!IS_V4(inst->core))
>  		return 0;
>  
> -	cu.video_core_enable_mask = usage;
> +	core1_load = load_per_core(core, VIDC_CORE_ID_1);
> +	core2_load = load_per_core(core, VIDC_CORE_ID_2);
> +	min_core_id = core1_load < core2_load ? VIDC_CORE_ID_1 : VIDC_CORE_ID_2;
> +	min_load = min(core1_load, core2_load);
> +	cores_max = core_num_max(inst);
>  
> -	return hfi_session_set_property(inst, ptype, &cu);
> +	if (cores_max < VIDC_CORE_ID_2) {
> +		min_core_id = VIDC_CORE_ID_1;
> +		min_load = core1_load;
> +	}
> +
> +	cur_inst_load = load_per_instance(inst) *
> +		inst->clk_data.codec_freq_data->vpp_freq;
> +	max_freq = core->res->freq_tbl[0].freq;
> +
> +	if ((cur_inst_load + min_load) > max_freq) {
> +		dev_warn(core->dev, "HW is overloaded, needed: %lu max: %lu\n",
> +			 cur_inst_load, max_freq);
> +		return -EINVAL;
> +	}
> +
> +	ret = set_core_usage(inst, min_core_id);

We have a problem here. Lets assume that we have only one running
decoder session and the code above decides that it should be handled by
core2, but core2 clocks presently are enabled only if there is an
encoder session (see DT subnodes), thus we select core2 but without
enabling core2 clocks and power domain.

> +	if (ret)
> +		return ret;
> +
> +	inst->clk_data.core_id = min_core_id;
> +
> +	return 0;
>  }
> -EXPORT_SYMBOL_GPL(venus_helper_set_core_usage);
> +EXPORT_SYMBOL_GPL(venus_helper_set_core);
>  


-- 
regards,
Stan
