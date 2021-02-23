Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D691322B7E
	for <lists+linux-media@lfdr.de>; Tue, 23 Feb 2021 14:32:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232923AbhBWNb6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Feb 2021 08:31:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232786AbhBWNb6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Feb 2021 08:31:58 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A14B7C061786
        for <linux-media@vger.kernel.org>; Tue, 23 Feb 2021 05:31:12 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id hs11so34623558ejc.1
        for <linux-media@vger.kernel.org>; Tue, 23 Feb 2021 05:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eQqACH5wA5/XNvPJCmk+d9kYpIkYrAJTALp7ggWryWs=;
        b=CVsJKtYKQ1nUiJ4Plgz+P61EEhEmkZOMlMDI2x4WQwANJ+nsgwqp7kWkB4YYgOB7cZ
         Bbcu7sNbls7z7iUIGDaMqXqRKmic27S2ovSeYGmoFNoaE6YC/A3oFRc1sGVXQTkJRvnl
         RvMBhez5EE9W97YnDl1kxNi4QF4vl6TzbGKQAgASn0Q0tf9/9f512Wpc+MYpSanHYoP8
         p2eUTXv1h3/lGcEPqumFShyiNM2xsM+s2RVsJS8ixKOZPwYSu12CvSGbiiJNcFV5OK4t
         0l9od02Yd4Z5tLvaRJW70R5XPyin3cG0nr9u9gjyCGZ+A+B6erph1vc4uL9WyiSLxINX
         8eww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eQqACH5wA5/XNvPJCmk+d9kYpIkYrAJTALp7ggWryWs=;
        b=hhcE6ZOVvfEZ0iN/ZxInaT/CWUzArHaC1j5jVJ2ImN6PeXNMM6xhflN5Xw6t0HxhS7
         cXtM6j1BBy8MxSbd5e1g1ZwBWKyF0r8mMs0r6mRZPd9ZaaewPC39y/TOMu7NvkMez74E
         F4xrFUoRHRYahy5/9kQYe+vL08agereWRSMiL9kWS87LpB58tWa2V2CqADJcy1uooVii
         iWhEYOX1sOf0CrjwOhITkVd/C6HFzpc7dlwOO92fw1qPHg5rLweok+GiObMFcwSSBy4p
         OizlR7wKeMiQI2c21RixVg7t0jOwf4khrhFYVRPN22xVCcddLnVUuOn5EKdrtwHdrXZt
         iycQ==
X-Gm-Message-State: AOAM533VJmaTeWDYJSWkyNjl8ojuI7bdSXWiiZjpz9xF9TpPmAFkcStx
        lQXLTc5TuEr+JOe35UDCdyP0wg==
X-Google-Smtp-Source: ABdhPJwcavR/CJwC/M3I/FmIAbkSiigT0YMtAZFwLo09Gq/EH1O55lTVjPeeR2Sn9R/wygFbuc9MtA==
X-Received: by 2002:a17:907:373:: with SMTP id rs19mr13426391ejb.341.1614087071303;
        Tue, 23 Feb 2021 05:31:11 -0800 (PST)
Received: from [192.168.0.4] ([84.238.208.199])
        by smtp.googlemail.com with ESMTPSA id bz25sm6262243ejc.97.2021.02.23.05.31.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Feb 2021 05:31:11 -0800 (PST)
Subject: Re: [PATCH 06/25] media: venus: hfi,pm,firmware: Convert to block
 relative addressing
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     dikshita@codeaurora.org, jonathan@marek.ca, vgarodia@codeaurora.org
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
 <20210222160300.1811121-7-bryan.odonoghue@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <2654fb29-d904-30da-17fa-8bf63acf9c2e@linaro.org>
Date:   Tue, 23 Feb 2021 15:31:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210222160300.1811121-7-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2/22/21 6:02 PM, Bryan O'Donoghue wrote:
> An upcoming silicon change places a number of existing blocks within the
> Venus at different relative offsets to the base address of IO region.
> 
> In order to handle this difference this patch changes the address offsets
> of the registers to function as offsets relative to the relevant sub-block
> of registers within the IO region not the base address of the IO region.
> 
> As a result of this change venus_readl() and venus_writel() are deleted.
> 
> Co-developed-by: Dikshita Agarwal <dikshita@codeaurora.org>
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/firmware.c  | 28 +++----
>  drivers/media/platform/qcom/venus/hfi_venus.c | 82 ++++++++++---------
>  .../media/platform/qcom/venus/hfi_venus_io.h  | 80 +++++++++---------
>  .../media/platform/qcom/venus/pm_helpers.c    | 12 +--
>  4 files changed, 105 insertions(+), 97 deletions(-)

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

-- 
regards,
Stan
