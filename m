Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0357E01C4
	for <lists+linux-media@lfdr.de>; Fri,  3 Nov 2023 12:14:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376763AbjKCKoa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Nov 2023 06:44:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377838AbjKCKo1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Nov 2023 06:44:27 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 178C5D59
        for <linux-media@vger.kernel.org>; Fri,  3 Nov 2023 03:44:19 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c518a1d83fso25727341fa.3
        for <linux-media@vger.kernel.org>; Fri, 03 Nov 2023 03:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699008257; x=1699613057; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c5nLolPwuJpq0W0yvjQJguc5sT9X9KBoVJr/KRt6GGU=;
        b=uqChyuT+DOS51LiRh9a/iv3r0te8urzMp7RKtCJhnVyGS5tbXaeisW1dFJss0KqNNj
         gus+iv2Y5VRO36R6caxwLwT+r4xolyunvj298sRcTylpyd9AM8AJ3MZdv6a2O65oee8X
         7ivWEAihTmKkMWiFpkwcwcBJPsQ1/ez01z+USF8PgjLr2mIQeFgmF0RGs+vDhOpD2Y9c
         Dy4oIJpR9UTkt25cyQEpq0jJ2iSe+Q/MV2IGp5D/DRov5Sie2+9GowUMj+VqoQfGnwm+
         6bUpIEPDxX7k0VqUpJrhMkmyZfygjRUwX5sSIMshZx6b6f7oSyCGaRwmO/QiWKH86e+B
         5scw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699008257; x=1699613057;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c5nLolPwuJpq0W0yvjQJguc5sT9X9KBoVJr/KRt6GGU=;
        b=SneXfnshOaSNpamOwJyzpG5yTd9rv5NppuupYk5dBjmKkZX9mnngWkx7O3wtBsOzCZ
         yTvo0IWn4iu2P9JtJv+oz7vbEtcAQrBXjpy+Mv5uMGpJEQPsoMd+I21xoiLCnrsELvD8
         CwOUkK1FgLSm1ARWGVRb4hEQrgQsE8AIR0CY1U5ds01yl4XndftmZawgo4RI+LtbpeBk
         V16FeXCpAae5ohufm/seCcEo7RZhUJO/zqIzfs/c3aglw+Gwetxfa5aE8iREgPSg4YQG
         EwA/ifNdRNN+dTpMhbvBCIgoa2321axUUrtCXP72G/DnccSB+piwM65ND/i/veCXkVlv
         Y8Nw==
X-Gm-Message-State: AOJu0YzpLILWdEzpujO3+bF+V/ssPGiAmseLjarHft7GinSFZzdqM1U5
        ygZYBcI9Cj6SEHlvLmFvLeX0XA==
X-Google-Smtp-Source: AGHT+IGWyRsXFk6LHw2H/ZIpZhZ8RL6RZVkgocUX8w24VSIFhdIXzdR+tNgUainvl9TtQl7/CIm11Q==
X-Received: by 2002:a19:2d0a:0:b0:507:c7cc:12d7 with SMTP id k10-20020a192d0a000000b00507c7cc12d7mr14426147lfj.4.1699008257167;
        Fri, 03 Nov 2023 03:44:17 -0700 (PDT)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id f6-20020a5d5686000000b0032f7eaa6e43sm1526650wrv.79.2023.11.03.03.44.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Nov 2023 03:44:16 -0700 (PDT)
Message-ID: <fe05a0f5-2f57-4f98-afe6-3b0acbaa96fe@linaro.org>
Date:   Fri, 3 Nov 2023 10:44:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 5/5] venus: pm_helpers: Use
 dev_pm_genpd_set_hwmode to switch GDSC mode
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Taniya Das <tdas@qti.qualcomm.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-media@vger.kernel.org,
        Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20231101-gdsc-hwctrl-v3-0-0740ae6b2b04@linaro.org>
 <20231101-gdsc-hwctrl-v3-5-0740ae6b2b04@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20231101-gdsc-hwctrl-v3-5-0740ae6b2b04@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/11/2023 09:04, Abel Vesa wrote:
> From: Jagadeesh Kona <quic_jkona@quicinc.com>
> 
> This change demonstrates the use of dev_pm_genpd_set_hwmode API from
> video driver to switch the video mvs0 gdsc to SW/HW modes at runtime
> based on requirement.
> 
> This change adds a new boolean array member vcodec_pmdomains_hwctrl in
> venus_resources structure to indicate if GDSC's have HW control support
> or not. This data is used in vcodec_control_v4() to check if GDSC has
> support to switch to HW control mode and then call dev_pm_genpd_set_hwmode
> to switch the GDSC mode.
> 
> Before the GDSC HWCTL was available to the consumer, the venus driver
> needed to somehow keep the power from collapsing while under the driver
> control. The only way to do that was to clear the CORE_PWR_DISABLE bit
> (in wrapper POWER_CONTROL register) and, respectively, set it back after
> the driver control was completed.
> 
> Now, that there is a way to switch the GDSC HW/SW control back and
> forth, the CORE_PWR_DISABLE toggling can be dropped.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

So I plan to give this a test on rb5 and db410c

My q here though is - has anybody on the submission list tested this 
through suspend/resume and vdd min ?

---
bod

