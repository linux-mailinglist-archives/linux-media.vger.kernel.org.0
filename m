Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF1B5BAEE
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 13:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728623AbfGALnl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 07:43:41 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38436 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728610AbfGALnl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 07:43:41 -0400
Received: by mail-lf1-f68.google.com with SMTP id b11so8574114lfa.5
        for <linux-media@vger.kernel.org>; Mon, 01 Jul 2019 04:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fgB0TjaeFr88KvhXx4bipObTa6TkqlAFEUSMdvck4Zk=;
        b=SrGiNLfeGiOpYlqK27vCuumQEaX1IERqxpk1bEKh/09cofQu9/CzbAi0cu7Hxhz3wD
         +vs05zNo/YOtfJCS8kR/yk2cab7zNC4hqxZNtN4wp0Co1jFXvDBMA17cgRmbcSbKqkwT
         DP+FitOJ+fP27zcNwyJ/OoVJAa+yHjJsXbUvzU+s0J9JOvwGWqB1zWGT4M58FJbp7tDw
         wGuDaB5nKp4Iz5lSBMVosFTolIfKBG6W6maxBvsjfFMN18lHU/h/GDEZQxvmJpxHNFtV
         l4yjXb09QuloGm9d39O+RYU8bXTdz7wcgB9R1gBS0LUYlDDFkATO2kWGa//v0EBVJRru
         KzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fgB0TjaeFr88KvhXx4bipObTa6TkqlAFEUSMdvck4Zk=;
        b=lZ3TYb9Oi5huSmVjH9R7JCnIFdCSteKzBy31Lj/X/wV2ABQsIFXN35ki9KEwkl8/BI
         ZaAPz9v9vOHNc1VS8TAgKzsHipP1/ILfe3T/g8cj3RXoyAPPyOHjqwpg47z7twELQ4Qa
         k4kJdhzHd9VGyKrt7s1QrUPtEr6cC0m6daPj75UnS3+hk/7hI5IIcUx8nMvNajomgRnd
         PlYXzf5VCA4yuUr1t7EqMQB3UDbq4Nnwf2Y7ZG4una2EcaKkiohWLd/z+X+TCbnD33gI
         9WZR4vO8EdPMxbo1owhoiXa9ss9x5gDSFvZLUv0pFwpYEgpXoOH/Of6oYvsDiYvVRRXF
         C3qA==
X-Gm-Message-State: APjAAAWT6ePMzIpaUiwZHWu2uqJNcvf5VYUoYy+gaRgIgZY1VF0bID5W
        Q01EAyMgrkPv8jkKGn3eururqQ==
X-Google-Smtp-Source: APXvYqx8bgCR50PABNzJVm3hh2lQIogC7fFVHSNV7zetPu1dJp4s+oyxuIZd4KKgf+4VH9+mjObiPg==
X-Received: by 2002:ac2:54ae:: with SMTP id w14mr11361496lfk.124.1561981418228;
        Mon, 01 Jul 2019 04:43:38 -0700 (PDT)
Received: from [192.168.27.209] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id j77sm3185246ljb.55.2019.07.01.04.43.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 04:43:37 -0700 (PDT)
Subject: Re: [PATCH v3 1/4] media: venus: Add codec data table
To:     Aniket Masule <amasule@codeaurora.org>, linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1561480044-11834-1-git-send-email-amasule@codeaurora.org>
 <1561480044-11834-2-git-send-email-amasule@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <d7558a12-8c38-0c91-3cea-cc3b7604b7de@linaro.org>
Date:   Mon, 1 Jul 2019 14:43:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1561480044-11834-2-git-send-email-amasule@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 6/25/19 7:27 PM, Aniket Masule wrote:
> Add vpp cycles for for different types of codec
> It indicates the cycles required by video hardware
> to process each macroblock. Initialize the codec
> data with core resources.
> 
> Signed-off-by: Aniket Masule <amasule@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/core.c    | 13 +++++++++++++
>  drivers/media/platform/qcom/venus/core.h    | 15 +++++++++++++++
>  drivers/media/platform/qcom/venus/helpers.c | 30 +++++++++++++++++++++++++++++
>  drivers/media/platform/qcom/venus/helpers.h |  1 +
>  drivers/media/platform/qcom/venus/vdec.c    |  4 ++++
>  drivers/media/platform/qcom/venus/venc.c    |  4 ++++
>  6 files changed, 67 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 7393667..f1597d6 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -473,9 +473,22 @@ static __maybe_unused int venus_runtime_resume(struct device *dev)
>  	{  244800, 100000000 },	/* 1920x1080@30 */
>  };
>  
> +static struct codec_freq_data sdm845_codec_freq_data[] =  {
> +	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675 },
> +	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675 },
> +	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_ENC, 675 },
> +	{ V4L2_PIX_FMT_MPEG2, VIDC_SESSION_TYPE_DEC, 200 },
> +	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 200 },
> +	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 200 },
> +	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_DEC, 200 },
> +	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 200 },
> +};
> +
>  static const struct venus_resources sdm845_res = {
>  	.freq_tbl = sdm845_freq_table,
>  	.freq_tbl_size = ARRAY_SIZE(sdm845_freq_table),
> +	.codec_freq_data = sdm845_codec_freq_data,
> +	.codec_freq_data_size = ARRAY_SIZE(sdm845_codec_freq_data),
>  	.clks = {"core", "iface", "bus" },
>  	.clks_num = 3,
>  	.max_load = 2563200,
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 7a3feb5..2ed6496 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -35,12 +35,20 @@ struct reg_val {
>  	u32 value;
>  };
>  
> +struct codec_freq_data {
> +	u32 pixfmt;
> +	u32 session_type;
> +	unsigned int vpp_freq;

isn't unsigned long more suitable?

> +};
> +
>  struct venus_resources {
>  	u64 dma_mask;
>  	const struct freq_tbl *freq_tbl;
>  	unsigned int freq_tbl_size;
>  	const struct reg_val *reg_tbl;
>  	unsigned int reg_tbl_size;
> +	const struct codec_freq_data *codec_freq_data;
> +	unsigned int codec_freq_data_size;
>  	const char * const clks[VIDC_CLKS_NUM_MAX];
>  	unsigned int clks_num;
>  	enum hfi_version hfi_version;
> @@ -216,6 +224,12 @@ struct venus_buffer {
>  	struct list_head ref_list;
>  };
>  
> +struct clock_data {
> +	u32 core_id;
> +	unsigned long freq;
> +	struct codec_freq_data *codec_freq_data;
> +};
> +
>  #define to_venus_buffer(ptr)	container_of(ptr, struct venus_buffer, vb)
>  
>  /**
> @@ -275,6 +289,7 @@ struct venus_inst {
>  	struct list_head list;
>  	struct mutex lock;
>  	struct venus_core *core;
> +	struct clock_data clk_data;
>  	struct list_head dpbbufs;
>  	struct list_head internalbufs;
>  	struct list_head registeredbufs;
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

Something is wrong here, there is no prototype of struct codec_data.

-- 
regards,
Stan
