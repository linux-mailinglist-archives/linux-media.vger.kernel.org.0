Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FCB958AAF1
	for <lists+linux-media@lfdr.de>; Fri,  5 Aug 2022 14:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237496AbiHEMmr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Aug 2022 08:42:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233513AbiHEMmq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Aug 2022 08:42:46 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE95518341
        for <linux-media@vger.kernel.org>; Fri,  5 Aug 2022 05:42:44 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id t1so3250726lft.8
        for <linux-media@vger.kernel.org>; Fri, 05 Aug 2022 05:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=SKkD6tIOBmbRn9GizS5O5wmqMxQ82i9veyKHs+R3CTU=;
        b=nCmLiq+R6GjrtroG45FwsvtZXBJXjvEoa/NvyXdQslrRc8PiFiX0N2s++3iJKM4z/f
         bYF6csJvYYPtOLL+EsEmAvio7dK7aDy35cHMnSxytis8uIV0OJ6I//Dnzfe0WGN8rFCy
         n0G6ckJ4uDShFF7wYBpZp8r4n9NYi4MOKNxdwYBQjKp9ENNmHHr54OnC/0/RDTb1r2vC
         MYvXrCFWk1cUaauqqbg91ewyR+EuTtpl2LnbgW+cLZWHFwioZBQLaYpkSSQpaJqrZzd7
         aLrCYYz30jhYXit2PkqZMI+SwAehxqzHn+XhmnkENpsYuBBRVDyMLUxOHcDBy2EBVwWA
         Zitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=SKkD6tIOBmbRn9GizS5O5wmqMxQ82i9veyKHs+R3CTU=;
        b=4GseF8r/VidilI/ccA23Z3kL/bhwQdtaPsJLYbqvwqDzuaBScqtOkan4VFGsguh/gd
         WyZ5hbugqNKMkKYf8K5JK1Ng0bo4fbHiLw2gw8EgyYVggf6mcRgLtoxiI9jmVKdfUcE6
         3Zi5ou19HQPo4YyCNKeMJqCOHp6GzhfnDLcGMeFhTCX7are2j350boFtaDjFrdKUKdVh
         BqfF4tKU6ZQ4VSHVO0XSB4tqlZWYPca6JfSsJWTDVBArmvIuD8uBQvozL6q6DNfh/Nsl
         goe3nxUKkZoKkMqxCFglaPbQ28BATqJPICud55C9R7jNrDrTDXODboEQlI5VZrvNH4k4
         bkjg==
X-Gm-Message-State: ACgBeo3QKQymiNuO8wagphtuhzbzMCg1Dc3YdJiHADMQ+AHyMRRLi6UH
        ho5+MpGfJqy9xDqi8kGf+bORJw==
X-Google-Smtp-Source: AA6agR4sWmcESCWSkDLtsDYv9OFRNalLj9fOOnvlmEPAKZAjQOcub6e6P02KJP6AG5jUNOGwOfi6OQ==
X-Received: by 2002:a05:6512:1683:b0:47f:78ca:8ac5 with SMTP id bu3-20020a056512168300b0047f78ca8ac5mr2251768lfb.663.1659703363311;
        Fri, 05 Aug 2022 05:42:43 -0700 (PDT)
Received: from [192.168.1.101] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id y1-20020a056512044100b0048a88c07bcdsm462779lfk.20.2022.08.05.05.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 05:42:42 -0700 (PDT)
Message-ID: <79841c03-c0dc-366d-ecf1-3486c77fd882@linaro.org>
Date:   Fri, 5 Aug 2022 15:42:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/2] media: venus: Fix up buffer handling for
 HFI_VERSION_1XX
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20220726021455.1814096-1-bryan.odonoghue@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
In-Reply-To: <20220726021455.1814096-1-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bryan,

Thanks for the patches!

On 7/26/22 05:14, Bryan O'Donoghue wrote:
> This series fixes two buffer handling bugs. The first bug is trivial and
> ~impossible to hit without the second bug but with fixing anyway. Its a
> simple NULL pointer handling issue.
> 
> The second bug relates to HFI_VERSION_1XX output buffers. Unfortunately
> these have been broken since
> 
> Commit: 9593126dae3e ("media: venus: Add a handling of QC08C compressed format")
> 
> A bit of bisecting the commits in venus found it handily enough. Once the
> fix is applied we have I have decode working again on db410c.
> 
> Bryan O'Donoghue (2):
>   media: venus: dec: Handle the case where find_format fails
>   media: venus: Fix NV12 decoder buffer discovery on HFI_VERSION_1XX
> 
>  drivers/media/platform/qcom/venus/helpers.c | 13 +++++++------
>  drivers/media/platform/qcom/venus/vdec.c    |  2 ++
>  2 files changed, 9 insertions(+), 6 deletions(-)
> 

Looks good to me.

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

-- 
regards,
Stan
