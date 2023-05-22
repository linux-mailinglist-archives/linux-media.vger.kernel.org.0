Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAAA670BEA9
	for <lists+linux-media@lfdr.de>; Mon, 22 May 2023 14:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233990AbjEVMro (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 May 2023 08:47:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233216AbjEVMrm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 May 2023 08:47:42 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B6CBAA
        for <linux-media@vger.kernel.org>; Mon, 22 May 2023 05:47:40 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f509ec3196so23214815e9.1
        for <linux-media@vger.kernel.org>; Mon, 22 May 2023 05:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684759659; x=1687351659;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=srOX7E1UJE16u72k28M/ijfY9MLxZEPfPVIH6FGEneI=;
        b=Tc74+LmDAI+/Lt33Nq3GoUl7ysuejsIHCxhTCUE2qdcckDU3of4VUxIEcE2TkavgUv
         aMxq84iCDRYWFrUt+t2MfLvTRWzAh4Hh6f8RqVlAC7z6Y7qAYfxTDNagYK19d/U59gNE
         CiGrLcNMaEd7re2usjRShG2rLl4C0jamSLdbcH1nu6dHBX2K0fc19nFXAECq7UB+hXAW
         mJP1EiFFi6oGkJdE2fA0IXNs4TdgeNHjX74Q+cig+4bIB0joNMJzUB2SnIvUFFaeseDs
         QYehrRuJ2mtkmsItc4n4fA4HwxBZ3Bod5wdBxcniUuTAI0DYikUJRLl6nKtIHQ3wo0fT
         DUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684759659; x=1687351659;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=srOX7E1UJE16u72k28M/ijfY9MLxZEPfPVIH6FGEneI=;
        b=dDzv0etTSGROF9rMGMBG2RqMbEE72uUDJE+Y+gxII1c5Jl74Bt2fzMHlKOgNJrqLun
         jNiYvM4u9WB1ZL1U4Mc5WGdAHBQ+s+4b6f2yfi1+ig5iGAGdx6uC7cxRDgiF1Y+HDv/U
         1PUvRvPFlobOAOyzvL7sb45Fd3piwKfvJ4d20hx4yREhJo+DDo7w0bKjo+U/6T66ZM8l
         WlTA2T7o3ScUcjs8uf+sXoBBVfIOKlLaOtJx1cN2TjQrTZtIc0FcnjqcX/rIcHxyC/NY
         ciba9/V9yHAo+QgZNiMbbEE5xd40vODCiShx35UfOkEijbdAWSiN4D+mj0yhOJSXWtGm
         mc6A==
X-Gm-Message-State: AC+VfDwN6sjGQTC0j7CTkljrnIiPtKGFshW6pH94bNJ5yncA1Gm/xipm
        56aM+IKHiF8ShYJJUKZKjgl87g==
X-Google-Smtp-Source: ACHHUZ6uA1MJ8lW/2En+Zo0tY8hALmOQpGjJ0U38BIGLTvxnoLlLrgN8gi3ErgsGyiNukyRLqfjCcA==
X-Received: by 2002:a05:600c:2256:b0:3f1:7848:6740 with SMTP id a22-20020a05600c225600b003f178486740mr7529342wmm.8.1684759659020;
        Mon, 22 May 2023 05:47:39 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id h1-20020a1ccc01000000b003eddc6aa5fasm11544677wmb.39.2023.05.22.05.47.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 05:47:38 -0700 (PDT)
Message-ID: <42270537-8ed4-636b-3d6a-8dde8b75aae9@linaro.org>
Date:   Mon, 22 May 2023 13:47:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/1] media: camss: set VFE bpl_alignment to 16 for sdm845
 and sm8250
Content-Language: en-US
To:     Andrey Konovalov <andrey.konovalov@linaro.org>, rfoss@kernel.org,
        todor.too@gmail.com
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230518215235.1668871-1-andrey.konovalov@linaro.org>
 <20230518215235.1668871-2-andrey.konovalov@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230518215235.1668871-2-andrey.konovalov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/05/2023 22:52, Andrey Konovalov wrote:
>  From the experiments with camera sensors using SGRBG10_1X10/3280x2464 and
> SRGGB10_1X10/3280x2464 formats, it becomes clear that on sdm845 and sm8250
> VFE outputs the lines padded to a length multiple of 16 bytes. As in the
> current driver the value of the bpl_alignment is set to 8 bytes, the frames
> captured in formats with the bytes-per-line value being not a multiple of
> 16 get corrupted.
> 
> Set the bpl_alignment of the camss video output device to 16 for sdm845 and
> sm8250 to fix that.
> 
> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index e0832f3f4f25..06c95568e5af 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -1541,7 +1541,11 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
>   		}
>   
>   		video_out->ops = &vfe->video_ops;
> -		video_out->bpl_alignment = 8;
> +		if (vfe->camss->version == CAMSS_845 ||
> +		    vfe->camss->version == CAMSS_8250)
> +			video_out->bpl_alignment = 16;
> +		else
> +			video_out->bpl_alignment = 8;
>   		video_out->line_based = 0;
>   		if (i == VFE_LINE_PIX) {
>   			video_out->bpl_alignment = 16;

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
