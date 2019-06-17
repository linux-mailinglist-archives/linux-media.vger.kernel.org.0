Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD0F47DD4
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 11:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727821AbfFQJF2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 05:05:28 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45318 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727806AbfFQJF2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 05:05:28 -0400
Received: by mail-lf1-f68.google.com with SMTP id u10so5898018lfm.12
        for <linux-media@vger.kernel.org>; Mon, 17 Jun 2019 02:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GRLI3Z2O8SkTky112/FI8HFAdykgQAeWvWkCXXseK+Y=;
        b=RdH58kHwYUCFIYpWmi0PSzN/yHMgmUIkovI4RdHzwry6cuWPSahEcsB3lR8JNqPdIA
         UhzSafN7pfojujjEzV5epj9HzM/lGDbJ3URm4Y+cLRihNhJ+Ii5vgF67zeG1jZLnx3AJ
         AHihrBkPU0MZ9846/AdlG3rlQsxUeMVenkNTenJxGMuKaYdKbQq+Tzv4NZrDsG2uojND
         w60td4Zxt/2/rC+L86PZgHg+8qsoZTxYVt4aOSf/gkJvJi4eoWS0nNnOGtn6TXqWk6Hb
         omAiZODeoHBw8rs6vYti/WayTdrZU8whHlvDs72jv0eEIVLRHF5AGEfte5BzBFzXPH9R
         NMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GRLI3Z2O8SkTky112/FI8HFAdykgQAeWvWkCXXseK+Y=;
        b=LdCnLFoxt4WtxHVHB5tmfvhFtSFlfv2NDS8hxMnlW4I37dJuPtylSSrQ3XAWJb/ppI
         ScjVJd6hmkRFiJSLviYw69Kvt99PIDH06HAmLL86eoVPWJy1A/PnmHWn/dAQJlb+Hnow
         4BpcOag6scCuREwV0WHX6uWyRoM+moqMQ4cGwpRW8c/wstohTxoPi8LGTbhzDBBCyM1h
         3AcoMuM6gsOmQlhSluXHe39N79rFNzyRnfGjSgFIvfJn8RfutL+2Ja/0uIEf07kK/T07
         UZ3UqaVBUfrPBF9ANk+9dpW4EnwU7PHQnHVjVJwXTdjWM35WMEVN+FPNGtNlQ6cNee1J
         Hm+A==
X-Gm-Message-State: APjAAAUdUg3ZjRFgoo74G2DCt/MYhyTuD83Q9YzeoFVyl/xWq31hE02r
        1xI5joLh0sKgLcPt3/xhSlaiBA==
X-Google-Smtp-Source: APXvYqzf5ced+QJqjoZWOGh8R0yAqNwDIMornTW7Q+foDset57AyNfggHCWPYfIc+SySSGowX6zRqw==
X-Received: by 2002:a05:6512:dc:: with SMTP id c28mr54082739lfp.105.1560762326347;
        Mon, 17 Jun 2019 02:05:26 -0700 (PDT)
Received: from [192.168.27.209] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id n1sm1653660lfl.77.2019.06.17.02.05.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 02:05:25 -0700 (PDT)
Subject: Re: [PATCH 4/5] media: venus: Add interface for load per core
To:     Aniket Masule <amasule@codeaurora.org>, linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1560233130-27264-1-git-send-email-amasule@codeaurora.org>
 <1560233130-27264-5-git-send-email-amasule@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <e8cbed4c-65f4-adfb-3c58-5c9773a01e0d@linaro.org>
Date:   Mon, 17 Jun 2019 12:05:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560233130-27264-5-git-send-email-amasule@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Aniket,

On 6/11/19 9:05 AM, Aniket Masule wrote:
> Add and interface to calculate load per core. Also,
> add an interface to get maximum cores available with
> video. This interface is preparation for updating core
> selection.
> 
> Signed-off-by: Aniket Masule <amasule@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/helpers.c    | 18 ++++++++++++++++++
>  drivers/media/platform/qcom/venus/hfi_helper.h |  1 +
>  drivers/media/platform/qcom/venus/hfi_parser.h |  5 +++++
>  3 files changed, 24 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 7bcc1e6..edb653e 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -331,6 +331,24 @@ static u32 load_per_instance(struct venus_inst *inst)
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
> +		if (!(inst->clk_data.core_id == core_id))
> +			continue;
> +
> +		mbs_per_sec += load_per_instance(inst);
> +		load += mbs_per_sec * inst->clk_data.codec_data->vpp_cycles;
> +	}
> +	mutex_unlock(&core->lock);
> +
> +	return load;
> +}
> +
>  static u32 load_per_type(struct venus_core *core, u32 session_type)
>  {
>  	struct venus_inst *inst = NULL;
> diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
> index 34ea503..3677e2e 100644
> --- a/drivers/media/platform/qcom/venus/hfi_helper.h
> +++ b/drivers/media/platform/qcom/venus/hfi_helper.h
> @@ -559,6 +559,7 @@ struct hfi_bitrate {
>  #define HFI_CAPABILITY_LCU_SIZE				0x14
>  #define HFI_CAPABILITY_HIER_P_HYBRID_NUM_ENH_LAYERS	0x15
>  #define HFI_CAPABILITY_MBS_PER_SECOND_POWERSAVE		0x16
> +#define HFI_CAPABILITY_MAX_VIDEOCORES          0x2B

please use tabs instead of spaces.

>  
>  struct hfi_capability {
>  	u32 capability_type;
> diff --git a/drivers/media/platform/qcom/venus/hfi_parser.h b/drivers/media/platform/qcom/venus/hfi_parser.h
> index 3e931c7..264e6dd 100644
> --- a/drivers/media/platform/qcom/venus/hfi_parser.h
> +++ b/drivers/media/platform/qcom/venus/hfi_parser.h
> @@ -107,4 +107,9 @@ static inline u32 frate_step(struct venus_inst *inst)
>  	return cap_step(inst, HFI_CAPABILITY_FRAMERATE);
>  }
>  
> +static inline u32 core_num_max(struct venus_inst *inst)
> +{
> +	return cap_max(inst, HFI_CAPABILITY_MAX_VIDEOCORES);
> +}
> +
>  #endif
> 

-- 
regards,
Stan
