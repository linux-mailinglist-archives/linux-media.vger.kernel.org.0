Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BAC2132865
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 15:03:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728192AbgAGODD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jan 2020 09:03:03 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:33643 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728005AbgAGODC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jan 2020 09:03:02 -0500
Received: by mail-ed1-f66.google.com with SMTP id r21so50406019edq.0
        for <linux-media@vger.kernel.org>; Tue, 07 Jan 2020 06:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=45jbDxnDRlrSoUpLAzYybIeaAzogHBOuARwmYD8R+zs=;
        b=tSvGbjokzeeKehbcHN3x06WZ9/hK6cVn9aTP7JiU/nJ31C/garEmJ2diim7kY/NW6q
         BIGmBeTJbi/sFb0yw7NDpkgG8/aB8q5sq/gc252u/A6uLKIvyXJhXwD+xO6oXfzU9CCM
         TL9xwtEGIy5CnK2pSQabkUpr9hwVK6smBrFXE6xIlhaLvQKnAnv7njgd56PolQwSWaiQ
         PhVksRd0NWpXdDEyD5zCX1g102BKlCmjHdGWo4oFBv03TcqfxhgLePW6eG9mMVXfpipF
         oSfwRL6BGoOVocZwc3Ctt0Ien2O7AQ9jarbK3qvgaS6LPHEW0fiBV9i8LBqWJRV+gBqh
         oQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=45jbDxnDRlrSoUpLAzYybIeaAzogHBOuARwmYD8R+zs=;
        b=G9AlsD2JSNMOdHyFxswL7fZ+18r1Swu2qpUf1XXmdRbH2EO09Nx/IQ6PGY9L3+gBBq
         taESmzmSxTMrRcwzMpNyBJ9jBwoUPt1+66+s1ehHXDlyYcZ4D2ODipE8iH/kyr0nVSgx
         HrSNTagh3xCuZ7OVb3H5x6ko9LfbaZvQmDSbJcvZHWVuzw+5Slw9zH5kRPKPGl1MqbNk
         DDj5xFRVHyzggoZGZFlkhQp4cNBENzqXznRoX3T67SeyN5SG1YnWQLW/KZP6JBMeZx6I
         9bNm91ToND3gjb7POZztBgoHol34hdffixnEXF7q0G66WV/DQZJnwtc27XlvroCS15Od
         Dr9Q==
X-Gm-Message-State: APjAAAUvlkIeHBqaqWXfSMQYjRJNwnsHu/eOr3z4pHbMe968aNt9UY6q
        OhSXN0yTJ4ds/MWWt5fNdvgYtb2YxAo=
X-Google-Smtp-Source: APXvYqyCGf3BgZI7MYBMSIm2PVIioretqqJbJD50SKpdkHkarN9Xte/8okiCV7IKeTpzMwgxgyFjyw==
X-Received: by 2002:a05:6402:c82:: with SMTP id cm2mr111400646edb.19.1578405780524;
        Tue, 07 Jan 2020 06:03:00 -0800 (PST)
Received: from [192.168.27.209] ([37.157.136.193])
        by smtp.googlemail.com with ESMTPSA id h16sm8247573ejc.89.2020.01.07.06.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2020 06:02:59 -0800 (PST)
Subject: Re: [PATCH V3 3/4] venus: core: add sc7180 DT compatible and resource
 struct
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, vgarodia@codeaurora.org
References: <1577971501-3732-1-git-send-email-dikshita@codeaurora.org>
 <1577971501-3732-4-git-send-email-dikshita@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <9108a39f-4403-ea19-218b-5e6dd86fde61@linaro.org>
Date:   Tue, 7 Jan 2020 16:02:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1577971501-3732-4-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dikshita,

Thanks for the patch.

On 1/2/20 3:25 PM, Dikshita Agarwal wrote:
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
