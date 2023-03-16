Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C16D6BC97B
	for <lists+linux-media@lfdr.de>; Thu, 16 Mar 2023 09:42:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbjCPImI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Mar 2023 04:42:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbjCPImF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Mar 2023 04:42:05 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 498427B48B
        for <linux-media@vger.kernel.org>; Thu, 16 Mar 2023 01:41:59 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id g18so835539ljl.3
        for <linux-media@vger.kernel.org>; Thu, 16 Mar 2023 01:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678956118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CvqxWDG/7oYUqZnc4BrFMUBnsmZoft98lZutj4XXS0Q=;
        b=trEEnoYJqaMDyRD7Zwhhis3vi4Jry9EI9Ow7TjvDlvWPXiQkEpsNkAPMdi93rz376K
         dSkCQ+8uW01Bo0Iex+7YcpdmB6N3pOjVSZrhYUjr2w4rS09pAmTD/lAl7uiRR8aDcwAf
         Pz/7W7eSOI+EE6TD//Qn8GjEhTkQrSLh92xMeJfurwL61el5YGXL0cRu+gdyiQqqIHpa
         DOvaK5MVPEv7hB9A+0Az+OHYSFwswck1TGxO0DNJRHshdz+N3csqo17YGFXKKZk2pXdE
         JbJcGqCCxRYPNeVL5wl4XmnuAeFTzI02hu937ehp90XYQkCqAYCQGVzofSGy7ItYKT7D
         08uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678956118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CvqxWDG/7oYUqZnc4BrFMUBnsmZoft98lZutj4XXS0Q=;
        b=OetY9zIUHQGrNH9FoINDGWPsRhNx5JKd882vYtwHBF7fjLAh2jPX8lHATHVYANJjkN
         a0dhKPYNZhmun0iZkxA7CdVJPhtXaFnVHGMDVldX2L8X30XJAXZHUE8ycixZSytiHFzV
         D5xh4hBEiYH2n2c5OJjQqv/Z5z/qRuHBkr0/w5AIBL1LgU9NQUNqeeZBlyawZIF/vXC2
         78EeVBpsSolrs3C6rMLgc78GQbe1zMriE++e0tDpE2gmNYb/iiQ4BBlkwZeaAzA8E72d
         3jXPVUz6q9YVGstztDPTz8MF+KZ8laEFea18agjqIB55K5eLnyky7JPHi8ElUKNxi3r/
         pu6g==
X-Gm-Message-State: AO0yUKV2NgARr3neThmTE8VywTRhsZvzt8MIJ0oKXNFwUC04THmmM5af
        98eUl0thqgsyLM5sv3FS25s/6w==
X-Google-Smtp-Source: AK7set8ibbso0egaUkLYL3mvPXxFmOVW8mALfy3A5I9IbOCGGR61CZdH2DONtdhfk/YFVJV7Vnp9VA==
X-Received: by 2002:a05:651c:211b:b0:28b:6d76:e9ce with SMTP id a27-20020a05651c211b00b0028b6d76e9cemr2271598ljq.23.1678956117715;
        Thu, 16 Mar 2023 01:41:57 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id x1-20020a2e9c81000000b002958937e9cbsm1154544lji.99.2023.03.16.01.41.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 01:41:57 -0700 (PDT)
Message-ID: <5325fab5-7414-61dd-3fb8-a20fde9a1564@linaro.org>
Date:   Thu, 16 Mar 2023 09:41:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH V3 0/1] Fix for VP9 DRC and Decoder STOP issue.
To:     quic_vboma@quicinc.com,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230202064712.5804-2-quic_vboma@quicinc.com>
 <20230316081509.12201-1-quic_vboma@quicinc.com>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230316081509.12201-1-quic_vboma@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 16.03.2023 09:15, quic_vboma@quicinc.com wrote:
> From: Viswanath Boma <quic_vboma@quicinc.com>
Please fix your git send-email config to include your first and last
name in the emails you send.

Please send next versions as a standalone thread, not in reply to the
previous ones.

> 
> Fixed indent comments, ensured rebase and checkpatch with --strict.
> Tested the changes on v5.15 and v5.4 kernels .
You're submitting changes to the mainline kernel, not to v5.15 or v5.4.
Please validate it against linux-next/master.

Konrad
> For testing Chrome Utilities were used .
> 
> Viswanath Boma (1):
>   venus: Enable sufficient sequence change support for sc7180 and fix
>     for Decoder STOP command issue.
> 
>  drivers/media/platform/qcom/venus/core.h       | 18 ++++++++++++++++++
>  drivers/media/platform/qcom/venus/hfi_cmds.c   |  1 +
>  drivers/media/platform/qcom/venus/hfi_helper.h |  2 ++
>  drivers/media/platform/qcom/venus/hfi_msgs.c   | 11 +++++++++--
>  drivers/media/platform/qcom/venus/vdec.c       | 12 +++++++++++-
>  5 files changed, 41 insertions(+), 3 deletions(-)
> 
