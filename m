Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BC301C54A1
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 13:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728756AbgEELnO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 07:43:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728609AbgEELnM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 07:43:12 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2695C061A41
        for <linux-media@vger.kernel.org>; Tue,  5 May 2020 04:43:10 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id y3so2380680wrt.1
        for <linux-media@vger.kernel.org>; Tue, 05 May 2020 04:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gDB1FCBSDIhMI2SkP7ybBjhgdCbeU4g8LzJ2MyAVDVI=;
        b=jAnxp34b09R1rsu1DzG6vMZeQfCFJ6nGgRbqd/BOjBxDY71lKg63Ii/YZBrxlAaBmA
         1dX2hG1SYQIRQBz6YQcZlYip8m4wrDYyuJZke7gWZlveW1GK9CHg80uWAp9QHCXBbQT1
         4pwX2Y2EV/8gQ68n7TXzYOJY+ADLuNcmSAORGDvikZmVcyqIVHu0P/wSvnR0LZHjITOw
         WvpRLcjEU8HLlZTtAFbbczRgLgY99Lgoi2QQUbty1ixSWUzkRCn6onk1FQbyDnXkKnKL
         12KCq0IHS0gSs4jYn+PZjKdowfHKk0S3c+BNZZvJ+BUdeCGEn1ee4SukX7+RzNwK+FUF
         lTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gDB1FCBSDIhMI2SkP7ybBjhgdCbeU4g8LzJ2MyAVDVI=;
        b=IhmJJoKa4XdZIzMC+aBCJLeE7cnYlhlY5e5Dt3vQu5Xzy9lv7zvwQHfK9Wu7wxfHli
         tnL2DrlXYcFP/9hOG2MPZMnOgN2TfONyOfAUkqSF58EU6G0I1ZSIuYoj75wh5wXD5Rsv
         aSVf0aQyjrBh2xDXltkfaJLBcewpHT7kDvN/yJFHi3nAeKN/QpSuBN6Icaqe6QsoFPrT
         5fn+8T5zBlyVMxD+6f0OiT1RYsZy0CCeF9EYr+QPRKVEab9sUISxvM+bGbObQdazNenJ
         YqxHiI5B5KrIWFTPvLbLLpRKyXkV4tYesNYlErB5VF4uMVtt4Wp6FEZUQI+iYX2lrsAr
         NtQw==
X-Gm-Message-State: AGi0PubSRTWvIF2d5m6tLNQLwyiJrHEAtfYRsWgKN9sd6O+3lyZZrazx
        bJjuxS/0BL5dXbfLUeBsuYKT8w==
X-Google-Smtp-Source: APiQypKYt4k2zLyEKjEmDZoWFH2R6yF3xzciPzbuqpHfzhnSROhUn+XtDiNf/2hbUuVH5kQc5qMNwA==
X-Received: by 2002:adf:d089:: with SMTP id y9mr3219455wrh.26.1588678989543;
        Tue, 05 May 2020 04:43:09 -0700 (PDT)
Received: from [192.168.1.3] (212-5-158-166.ip.btc-net.bg. [212.5.158.166])
        by smtp.googlemail.com with ESMTPSA id 92sm2912351wrm.71.2020.05.05.04.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2020 04:43:08 -0700 (PDT)
Subject: Re: [PATCH 1/2] media: venus: Add support for MSM8939
To:     Konrad Dybcio <konradybcio@gmail.com>, skrzynka@konradybcio.pl
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200501203505.144362-1-konradybcio@gmail.com>
 <20200501203505.144362-2-konradybcio@gmail.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <3d73eb09-ba4e-5706-042c-0d1894928a35@linaro.org>
Date:   Tue, 5 May 2020 14:43:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200501203505.144362-2-konradybcio@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Konrad,

On 5/1/20 11:35 PM, Konrad Dybcio wrote:
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> ---
>  drivers/media/platform/qcom/venus/core.c | 33 ++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 194b10b987672..f3a15991ac763 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -405,6 +405,38 @@ static const struct venus_resources msm8916_res = {
>  	.fwname = "qcom/venus-1.8/venus.mdt",
>  };
>  
> +static const struct freq_tbl msm8939_freq_table[] = {
> +	{ 489600, 266670000 },	/* 1080p @ 60 */
> +	{ 244800, 200000000 },	/* 1080p @ 30 */
> +	{ 244800, 133330000 },	/* 1080p @ 30 (decode only) */
> +	{ 220800, 133330000 },  /* 720p @ 60 (decode only?) */
> +	{ 108000, 133330000 },  /* 720p @ 30*/
> +	{ 72000, 133330000 },  /* VGA @ 60 */
> +	{ 36000, 133330000 },  /* VGA @ 30 */

133MHz is the minimum clock frequency in the GCC driver? Do you think
that will change?

> +};
> +
> +static const struct reg_val msm8939_reg_preset[] = {
> +	{ 0xe0020, 0x0aaaaaaa },
> +	{ 0xe0024, 0x0aaaaaaa },
> +	{ 0x80124, 0x00000003 },
> +};
> +
> +static const struct venus_resources msm8939_res = {
> +	.freq_tbl = msm8939_freq_table,
> +	.freq_tbl_size = ARRAY_SIZE(msm8939_freq_table),
> +	.reg_tbl = msm8939_reg_preset,
> +	.reg_tbl_size = ARRAY_SIZE(msm8939_reg_preset),
> +	.clks = { "core", "iface", "bus", },
> +	.clks_num = 3,
> +	.max_load = 489600, /* 1080p @ 60 */
> +	.hfi_version = HFI_VERSION_1XX,
> +	.vmem_id = VIDC_RESOURCE_NONE,
> +	.vmem_size = 0,
> +	.vmem_addr = 0,
> +	.dma_mask = 0xddc00000 - 1,
> +	.fwname = "qcom/venus-1.8/venus.mdt",
> +};
> +
>  static const struct freq_tbl msm8996_freq_table[] = {
>  	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
>  	{  972000, 520000000 },	/* 4k UHD @ 30 */
> @@ -567,6 +599,7 @@ static const struct venus_resources sc7180_res = {
>  
>  static const struct of_device_id venus_dt_match[] = {
>  	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
> +	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
>  	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
>  	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
>  	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
> 

-- 
regards,
Stan
