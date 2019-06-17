Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D63847D42
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 10:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727688AbfFQIh1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 04:37:27 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46548 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727507AbfFQIh0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 04:37:26 -0400
Received: by mail-lj1-f196.google.com with SMTP id v24so8408373ljg.13
        for <linux-media@vger.kernel.org>; Mon, 17 Jun 2019 01:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9UinEXsIbpK3wx3OqojQUNmGsRhZ0KY9zjpPR/n5vUE=;
        b=PoscBMO/huTZRNmeybr5BrP6Sl6o4yayI1rLz/3zDwaVSZTdBTIQDug4SJZMvRo0XH
         S3ywmEfy9OzDC5eqlkMAIL2tR4eEcWd4ckIJI7inPb3usK6zh5KLkCAtkJGfTGXaoDSe
         1wzV4ltbrcqStTExOWDVnytCE03TaKn7ad0nhj6aaLY/ubltUbq3uyt4eJ3TnolPa3Jy
         2kgtpwIMb4TfE8WrJt8Hpou8XU4VYBd/7UrffdDAsyFPxICYEVMeMeYh5RUNeOqpNHPv
         N4tvPTPWGeVol8cFK+dyZKxmwL8qtMr+JUZ6iGmKQF9vwiJDE+zTzIcHea3dBeL+gtpW
         +Lew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9UinEXsIbpK3wx3OqojQUNmGsRhZ0KY9zjpPR/n5vUE=;
        b=umNhQ284VKCtwt9OfomhQKPrsXsuJwlF8wc1sDMyEUlxhM49ASyGg03kU2ImOmzv+b
         zmP9aF+o6ZKLSV2zbQnYC+aXaAaKTYlJexWwNA5zKFzZ0MAzNyI1/TzuRWZtZ5rq6PCA
         nNf8CeudaC0XPU8ppeA4ETBg/yeLCXLHSUYKBPaFWp5x1kyB7aQ79bEk8fDyS/yAyZ0D
         Re1NGA7TcatVSd8WIvLRL2Ef1NpfyJdLY4AslVL82vyGU8rv/bxGK4Jf9MKg0k+H0kEt
         3nR3XbfJML/w7Jdlewzulq6ee7c1AQhf/8tZVmjWKdsjJiG6XnTAZKqTXUgVv+lvazFk
         awjg==
X-Gm-Message-State: APjAAAXs3OJnvZk8Wz3yElndqPrR6pwir3BRRAFc6U1Was0CkBFTIzx4
        PNYuLTlxaD/r3+xUaD1unWwBKw==
X-Google-Smtp-Source: APXvYqybk7Qtggv79wuZMqJx1e8wEyml7YAoNf9TF3Kg+1embvOJhQhXRmXdeEU0bfSWwxXElOVTrQ==
X-Received: by 2002:a2e:9a19:: with SMTP id o25mr47105958lji.63.1560760643818;
        Mon, 17 Jun 2019 01:37:23 -0700 (PDT)
Received: from [192.168.27.209] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id b9sm2009833ljj.92.2019.06.17.01.37.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 01:37:23 -0700 (PDT)
Subject: Re: [PATCH 2/5] media: venus: Initialize codec data
To:     Aniket Masule <amasule@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1560233130-27264-1-git-send-email-amasule@codeaurora.org>
 <1560233130-27264-3-git-send-email-amasule@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <43e8022f-d231-8c36-0db8-9710a1adaabc@linaro.org>
Date:   Mon, 17 Jun 2019 11:37:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560233130-27264-3-git-send-email-amasule@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Aniket,

On 6/11/19 9:05 AM, Aniket Masule wrote:
> Initialize the codec data with core resources.

Please squash this patch in 1/5 patch.

> 
> Signed-off-by: Aniket Masule <amasule@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/helpers.c | 30 +++++++++++++++++++++++++++++
>  drivers/media/platform/qcom/venus/helpers.h |  1 +
>  drivers/media/platform/qcom/venus/vdec.c    |  4 ++++
>  drivers/media/platform/qcom/venus/venc.c    |  4 ++++
>  4 files changed, 39 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 5cad601..f7f724b 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -715,6 +715,36 @@ int venus_helper_set_core_usage(struct venus_inst *inst, u32 usage)
>  }
>  EXPORT_SYMBOL_GPL(venus_helper_set_core_usage);
>  
> +int venus_helper_init_codec_data(struct venus_inst *inst)
> +{
> +	const struct codec_data *codec_data;
> +	unsigned int i, codec_data_size;
> +	u32 pixfmt;
> +	int ret = 0;
> +
> +	if (!IS_V4(inst->core))
> +		return 0;
> +
> +	codec_data = inst->core->res->codec_data;
> +	codec_data_size = inst->core->res->codec_data_size;
> +	pixfmt = inst->session_type == VIDC_SESSION_TYPE_DEC ?
> +			inst->fmt_out->pixfmt : inst->fmt_cap->pixfmt;
> +
> +	for (i = 0; i < codec_data_size; i++) {
> +		if (codec_data[i].pixfmt == pixfmt &&
> +		    codec_data[i].session_type == inst->session_type) {
> +			inst->clk_data.codec_data = &codec_data[i];
> +			break;
> +		}
> +	}
> +
> +	if (!inst->clk_data.codec_data)
> +		ret = -EINVAL;

just return -EINVAL

> +
> +	return ret;

return 0 is enough, and that will avoid ret variable.

> +}
> +EXPORT_SYMBOL_GPL(venus_helper_init_codec_data);
> +
>  int venus_helper_set_num_bufs(struct venus_inst *inst, unsigned int input_bufs,
>  			      unsigned int output_bufs,
>  			      unsigned int output2_bufs)
> diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
> index 2475f284..f9360a8 100644
> --- a/drivers/media/platform/qcom/venus/helpers.h
> +++ b/drivers/media/platform/qcom/venus/helpers.h
> @@ -41,6 +41,7 @@ int venus_helper_set_output_resolution(struct venus_inst *inst,
>  				       unsigned int width, unsigned int height,
>  				       u32 buftype);
>  int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode);
> +int venus_helper_init_codec_data(struct venus_inst *inst);
>  int venus_helper_set_core_usage(struct venus_inst *inst, u32 usage);
>  int venus_helper_set_num_bufs(struct venus_inst *inst, unsigned int input_bufs,
>  			      unsigned int output_bufs,
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 282de21..51795fd 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -660,6 +660,10 @@ static int vdec_init_session(struct venus_inst *inst)
>  	if (ret)
>  		goto deinit;
>  
> +	ret = venus_helper_init_codec_data(inst);
> +	if (ret)
> +		goto deinit;
> +
>  	return 0;
>  deinit:
>  	hfi_session_deinit(inst);
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 32cff29..792cdce 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -847,6 +847,10 @@ static int venc_init_session(struct venus_inst *inst)
>  	if (ret)
>  		goto deinit;
>  
> +	ret = venus_helper_init_codec_data(inst);
> +	if (ret)
> +		goto deinit;
> +
>  	ret = venc_set_properties(inst);
>  	if (ret)
>  		goto deinit;
> 

-- 
regards,
Stan
