Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC089379080
	for <lists+linux-media@lfdr.de>; Mon, 10 May 2021 16:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236504AbhEJOVD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 May 2021 10:21:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242173AbhEJOTN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 May 2021 10:19:13 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 215A1C0612F1
        for <linux-media@vger.kernel.org>; Mon, 10 May 2021 06:55:22 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id gx5so24620664ejb.11
        for <linux-media@vger.kernel.org>; Mon, 10 May 2021 06:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=R3I+cJ/HNa43p7O9IqL92rD0/3nTNS0rycYZ/LuBU0c=;
        b=a5K0KhtKct36+xmqlnSZCPapHdDRa/7O2xijP3DJyGTifut0orPMQplJgVpY8dflRM
         X6curX44OHAJQs0s3JLI1UC6uKsQnPUVcEZPZkzrUQCEHRHEtN6ZCmVXrSFKjUoRPSKa
         7+iVXt8bwOd3UYXjgoidPxkezauz7k0Wh0Q0NTPwGyi/+8zZWEqOUXRlA6ehSnmYieiw
         Nqlw45izMHuDyY312MsU0v/ri+jSfsY4j00gCTb4gYZJW66tK9+SkiXpGVpAFWlN7Aom
         Bu2Mvp26Uewx+HeVfAr5wJy/JCKsSZshHddl+w6zwR01BwtcQotdDNo+cB0VGjPQ6wGs
         Bv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R3I+cJ/HNa43p7O9IqL92rD0/3nTNS0rycYZ/LuBU0c=;
        b=HSjuf3AVtEYNwLYmo7f1opr+JDXJQb3y9VCLOoiek9U2VPdUDtHlFKPUXmGk/RdcoA
         wZtp9Z5Ru/kaHz8hjoiDGkDNv1QjDrBHjNAd5a/1c2c6+Rrl8ZUdwivCLp8KlVoWeQ9W
         KxLVnBQlr43qErB/Jqc0Q9Sa38yswJAxxUGXjp3vR+PAN9mSKv+oqz00/Y10WUuyBNt3
         HKcftTTv4LtmXb9fwr02X3bBFBHdvmgoi08HrMK8HRq+Cb0SZSSNHYL5Qv4JejhUjsQA
         MSXh+1MxNSPbpykARd11Uy1e9A8mUkj3micv/XObQBmyfQhKRfL4hdGgYD9NAuz5yHpx
         WPsA==
X-Gm-Message-State: AOAM531UT9zHxDr/FVnym1cUML2rho+Wm8KMbihxMLagND4ALais8hmL
        OSuPocNYQkDzAWsBqwrWX6bFG70v+VwU7Q==
X-Google-Smtp-Source: ABdhPJxFCtXatqzsLV0AO+XHmKPYNCl9ZBBC1u1OV6OrJIyxJb57jDU/1J8Dicgytd4+prFSbT2dag==
X-Received: by 2002:a17:906:1d0a:: with SMTP id n10mr8841967ejh.341.1620654920502;
        Mon, 10 May 2021 06:55:20 -0700 (PDT)
Received: from [192.168.1.14] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id z9sm2341077edb.51.2021.05.10.06.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 May 2021 06:55:20 -0700 (PDT)
Subject: Re: [PATCH v5 14/25] media: venus: vdec: use
 pm_runtime_resume_and_get()
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <cover.1620314616.git.mchehab+huawei@kernel.org>
 <76b4daa74ae49576d37235916d687c36991351eb.1620314616.git.mchehab+huawei@kernel.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <129734bc-d50c-e149-0e8c-ac84573b151f@linaro.org>
Date:   Mon, 10 May 2021 16:55:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <76b4daa74ae49576d37235916d687c36991351eb.1620314616.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/6/21 6:25 PM, Mauro Carvalho Chehab wrote:
> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
> 
> Use the new API, in order to cleanup the error check logic.
> 
> As a bonus, there's no need to check if ret == 1, as
> pm_runtime_resume_and_get() always return 0 on success.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/platform/qcom/venus/vdec.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Tested-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>


-- 
regards,
Stan
