Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF90143CE2
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2020 13:32:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729521AbgAUMcG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jan 2020 07:32:06 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:40539 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729144AbgAUMcG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jan 2020 07:32:06 -0500
Received: by mail-ed1-f65.google.com with SMTP id b8so2775198edx.7
        for <linux-media@vger.kernel.org>; Tue, 21 Jan 2020 04:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=h37iko5DIvMs0xYnBxqks04OIBG81FsI2poREuA7OHM=;
        b=gPjxCUcG8y/LwUpZQOkE0+CHDDhb7y83Wjap6NfNpoGepeAlp6xZM7AYMg53JqMXeS
         0qn1vz8Dt06YFwKk9XmYu+4LuhqjJRnzG/GcxCjGz99RjOmuULy21uo3mmNLedN90rn4
         hHDQuUhWGnfKCbUwlSkDd6z8K7eScr4LnbBE3wQ82U4CCL7bB+XRriiNFRyBtvucIxvJ
         skjbqbeAZnjb7tv/QnNHmBz543s9491RA3T2VqE4mrNjkI0lk9fvfyn/u+D/0AGvDXOX
         gFucaFSIqSAzg1FYSzJUGOfdJzqNq/81scG3svUUsEehyDX84yds5xR4lrId6lYk4CZv
         tnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=h37iko5DIvMs0xYnBxqks04OIBG81FsI2poREuA7OHM=;
        b=WODjD2e0z6DEuZgOUS23YC4JABzOm4pmIsPe70RE42ZHT0ZRNlaNio500aeYHDSEc6
         IPLf6uMkT6SWDFj/rZysprA7oeiQWPOdZrz7tuA4CcaKrPMAKIUxET3HpysPIZBoAzuW
         Tt+O5DfAy0tnuxBgao4othw4e0zv/f5qoGXX/F86s2nRmuIzUCPfQ+EA4JBYsOMlAljg
         o4k0L+tGisos6OSTA1y8VTmaA8yt3Jdzdae75CXpK9vLs4tzRWBRoANOV7jk3F5seSBS
         I/5QTt73uAdOCKljbjBCdvTGtbGcOxbZqBUrCYuvjZHy3X2P91s/G3kHV5rDP4k7AZzq
         K/hg==
X-Gm-Message-State: APjAAAX5cCCp+rv15Ab+HVilqbn50aA/pBnBNy3liRkCHwPczo37V0RV
        3Wm5vP2yPcEi4Xp4FYAcPvk1jA==
X-Google-Smtp-Source: APXvYqwe/4J5WWKBWvO8Pn60zUuQZsQH7KfZU5Ne6omgReHLBiLVtBMRt2O/riyFt6LonLCjidX8kw==
X-Received: by 2002:a17:906:b219:: with SMTP id p25mr4018940ejz.36.1579609924411;
        Tue, 21 Jan 2020 04:32:04 -0800 (PST)
Received: from [192.168.27.209] ([37.157.136.193])
        by smtp.googlemail.com with ESMTPSA id w10sm1407143eds.69.2020.01.21.04.32.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2020 04:32:03 -0800 (PST)
Subject: Re: [PATCH V4 3/4] venus: core: add sc7180 DT compatible and resource
 struct
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, vgarodia@codeaurora.org
References: <1579006416-11599-1-git-send-email-dikshita@codeaurora.org>
 <1579006416-11599-4-git-send-email-dikshita@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <c017502d-c8ec-5b6c-848b-88278a64e041@linaro.org>
Date:   Tue, 21 Jan 2020 14:32:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1579006416-11599-4-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 1/14/20 2:53 PM, Dikshita Agarwal wrote:
> This add DT compatible string and resource structure for sc7180.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/core.c | 45 ++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index c7525d9..194b10b9 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -521,11 +521,56 @@ static __maybe_unused int venus_runtime_resume(struct device *dev)
>  	.fwname = "qcom/venus-5.2/venus.mdt",
>  };
>  
> +static const struct freq_tbl sc7180_freq_table[] = {
> +	{  0, 500000000 },
> +	{  0, 434000000 },
> +	{  0, 340000000 },
> +	{  0, 270000000 },
> +	{  0, 150000000 },
> +};
> +
> +static const struct bw_tbl sc7180_bw_table_enc[] = {
> +	{  972000,  750000, 0, 0, 0 },	/* 3840x2160@30 */
> +	{  489600,  451000, 0, 0, 0 },	/* 1920x1080@60 */
> +	{  244800,  234000, 0, 0, 0 },	/* 1920x1080@30 */
> +};
> +
> +static const struct bw_tbl sc7180_bw_table_dec[] = {
> +	{ 1036800, 1386000, 0, 1875000, 0 },	/* 4096x2160@30 */
> +	{  489600,  865000, 0, 1146000, 0 },	/* 1920x1080@60 */
> +	{  244800,  530000, 0,  583000, 0 },	/* 1920x1080@30 */
> +};
> +
> +static const struct venus_resources sc7180_res = {
> +	.freq_tbl = sc7180_freq_table,
> +	.freq_tbl_size = ARRAY_SIZE(sc7180_freq_table),
> +	.bw_tbl_enc = sc7180_bw_table_enc,
> +	.bw_tbl_enc_size = ARRAY_SIZE(sc7180_bw_table_enc),
> +	.bw_tbl_dec = sc7180_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(sc7180_bw_table_dec),
> +	.codec_freq_data = sdm845_codec_freq_data,
> +	.codec_freq_data_size = ARRAY_SIZE(sdm845_codec_freq_data),
> +	.clks = {"core", "iface", "bus" },
> +	.clks_num = 3,
> +	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
> +	.vcodec_clks_num = 2,
> +	.vcodec_pmdomains = { "venus", "vcodec0" },
> +	.vcodec_pmdomains_num = 2,
> +	.vcodec_num = 1,
> +	.hfi_version = HFI_VERSION_4XX,
> +	.vmem_id = VIDC_RESOURCE_NONE,
> +	.vmem_size = 0,
> +	.vmem_addr = 0,
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/venus-5.4/venus.mdt",
> +};
> +
>  static const struct of_device_id venus_dt_match[] = {
>  	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
>  	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
>  	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
>  	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
> +	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, venus_dt_match);
> 

-- 
regards,
Stan
