Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12DC4322BAE
	for <lists+linux-media@lfdr.de>; Tue, 23 Feb 2021 14:49:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232144AbhBWNsu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Feb 2021 08:48:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbhBWNst (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Feb 2021 08:48:49 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B274C06174A
        for <linux-media@vger.kernel.org>; Tue, 23 Feb 2021 05:48:09 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id s11so25950936edd.5
        for <linux-media@vger.kernel.org>; Tue, 23 Feb 2021 05:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pcdzTD1mQUpMxVbu7Yow7YjbJsL+FPj0nXyj14+JGA4=;
        b=JzspRlBxu5Ejd8AsD23/j+PjMTd/Exz24W+zl1qnmgR97nVKZwfAdppvQhWm9Xt+cD
         dEAdSiMjQE2vXwCwSkEFfGx9b7q3v9vyQKmTUgh36vZ5PtAhvGpTERVp8Tm/AvHZdbaN
         HES5Siqx/VNvD8+g+ZnllJ863XkWORTQXQUiM4kIiFEDTaYi7jWiVJJml9C5yHAJmnYW
         T0sTA4col8KMZWYMLRp7BTfwJAJHBj/prgcp2RPTJtA73c/LV7gv8U8Y9T0NKCFdkjuK
         vB0essXpfmfCL5+DFdalqykTYfbQZf5C/7CT0z0CuNX7/T567yevFK2ZCGowU+++62yM
         SfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pcdzTD1mQUpMxVbu7Yow7YjbJsL+FPj0nXyj14+JGA4=;
        b=ilYNFWpApZY96rZKL7oG2ToQZHyXMGd3T+NfpSNdO8oGkewipSWnddcx43d7ZQ5fOA
         ZdmQMiQ2dnFd9MlUC3hoKUlJmmhcSsOo8J7w8/9UpEdE6dGTGz8X/iKFiqnPjjEZkHjx
         RIzsGFh5oVAM1i0CWUzdy1AwynTVIFWMDc8XxxEXaNxTlHeaShrVtbcyPTNgmsQ15kfO
         i0+AVvSBuhRzavznluAMDCRFGLCJlOOG/qwy0jrdpXu3SR5/xhBwHgi1yMMU+B22f+lC
         NVA2Mri2T6gMPWjV5ilYK6MLOaKl3H/sJK2BnGFGaLBvDIJOxwXi7m5BNLsGK7CGRONm
         4BXA==
X-Gm-Message-State: AOAM533U+tXPYWsuo4ic4mHqYmjLyrcvzTFCcblfjykkVdpGefT6mBxP
        eW5tJi1Onqx+rCS7N8WwAt35LQ==
X-Google-Smtp-Source: ABdhPJydkB2QqinC1dMaDgpVymT2bnxc0nfwaqDMPejrUa1A6QqByOG5kFL86py7Lp5Pvvrzm5JWMQ==
X-Received: by 2002:a50:9d0b:: with SMTP id v11mr28994310ede.308.1614088087831;
        Tue, 23 Feb 2021 05:48:07 -0800 (PST)
Received: from [192.168.0.4] ([84.238.208.199])
        by smtp.googlemail.com with ESMTPSA id gc17sm6929778ejb.89.2021.02.23.05.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Feb 2021 05:48:07 -0800 (PST)
Subject: Re: [PATCH 03/25] media: venus: core: add sm8250 DT compatible and
 resource data
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     dikshita@codeaurora.org, jonathan@marek.ca, vgarodia@codeaurora.org
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
 <20210222160300.1811121-4-bryan.odonoghue@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <99f9acb0-8c54-0f95-9c8c-e3729cdd7d8c@linaro.org>
Date:   Tue, 23 Feb 2021 15:48:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210222160300.1811121-4-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Could you move this patch at the end of the series where the support for
v6xx will be fully functional?

On 2/22/21 6:02 PM, Bryan O'Donoghue wrote:
> Adds an sm8250 compatible binding to the venus core.
> 
> Co-developed-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Co-developed-by: Dikshita Agarwal <dikshita@codeaurora.org>
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/core.c | 54 ++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

-- 
regards,
Stan
