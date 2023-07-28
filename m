Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6942D767112
	for <lists+linux-media@lfdr.de>; Fri, 28 Jul 2023 17:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234664AbjG1PwK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jul 2023 11:52:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235057AbjG1PwH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jul 2023 11:52:07 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EDBA3AB4
        for <linux-media@vger.kernel.org>; Fri, 28 Jul 2023 08:51:59 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fb960b7c9dso4014678e87.0
        for <linux-media@vger.kernel.org>; Fri, 28 Jul 2023 08:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690559518; x=1691164318;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4XCAN+LIkW+VnqJkhSb2CWVPMCXFRGDrRJr1SX5q7MQ=;
        b=tubAVlpOtIztV2drODQdV0+BcMMwr8sRiRhpQX88br/pqwIp1e1FV2RGwVDViPVu3E
         kxvFKmYkDBrKBxjOLXhjFqRSPr0r16IXBkKiVUtkkpVv/5Wipkg1JGIqMTC7xN6JkCbv
         gAIF3t+CBcga1lJh9ByiEzTOZk+gj5PFm9sYsv0YcC35FpcWKMiUZtw6PqiYb8DWlwS6
         3P0MvNGUW4ZloomcF17kVwtXafH+UaamMj+6qnZ3uZssyKBTo8vcEfivUxr04eYx80vK
         b121vAq+2IhdAbe/2sFrtCz/r1dqz0fLcJ3/5fYRKQ4x4rtwd6Iqrs5WkldKPR9BMt8w
         chPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690559518; x=1691164318;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4XCAN+LIkW+VnqJkhSb2CWVPMCXFRGDrRJr1SX5q7MQ=;
        b=XezquQx0bkPMI0AzSvzNw5jAyIh28GRjSAMhv3AFn9VUccsh7O6z3V2w08YKhxSTg5
         CHBNCaim2LjTZfwYAID7zVrl/odUrWfId0S2bxm2Gh8Kem6svD0QZuweqA9NiNcrh671
         QTvOAmAVo8ING1TM20tPPah4qsS+AMZG3HKNN1kLeF8P0SuFr5LEEzoLkEWZlovelSnk
         mUE3K60pSfSbqrPL3dUjvGLlzaA5g2fIMjR+GD+7mOWXGeKibbMLONvAgwAEeum8zWs0
         BsjXc1Yrb6tPwZgbPHVeufVhADx22lzFh7+ht4iRFTjN+9RFwrMT2D5Wfk7ineHI1SnH
         okXQ==
X-Gm-Message-State: ABy/qLZpsmk30h7pPGT2yndVFUamoHVIyQ/Z0MkyEMqE1TtawbOMkZVS
        c+tITagY6SLHiioaenoTLJzd9A==
X-Google-Smtp-Source: APBJJlFhZSZroexG6Q3XHDIZ66SYC2BREDtDz4hzbQa+ygCJ7CKdpgwFvwG0l1mgMccUIxjl5+Kndw==
X-Received: by 2002:a05:6512:340d:b0:4fd:b223:92c with SMTP id i13-20020a056512340d00b004fdb223092cmr2712985lfr.60.1690559517648;
        Fri, 28 Jul 2023 08:51:57 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a24-20020a19f818000000b004fe20d1b288sm340493lff.159.2023.07.28.08.51.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 08:51:57 -0700 (PDT)
Message-ID: <3a1132ad-23e8-6415-dc8a-417eb64cdee8@linaro.org>
Date:   Fri, 28 Jul 2023 18:51:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 33/33] iris: enable building of iris video driver
Content-Language: en-GB
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        stanimir.k.varbanov@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org,
        hans.verkuil@cisco.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     quic_dikshita@quicinc.com
References: <1690550624-14642-1-git-send-email-quic_vgarodia@quicinc.com>
 <1690550624-14642-34-git-send-email-quic_vgarodia@quicinc.com>
 <bbc22e71-d581-36c0-d5ac-24a2dc8d84fc@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <bbc22e71-d581-36c0-d5ac-24a2dc8d84fc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28/07/2023 18:25, Bryan O'Donoghue wrote:
> On 28/07/2023 14:23, Vikash Garodia wrote:
>> From: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>
>> This adds iris driver Makefile and Kconfig, also changes
>> v4l2 platform/qcom Makefile/Kconfig in order to
>> enable compilation of the driver.
> 
> This is not a meaningfully bisectable patch.
> 
> It should go with the addition of the driver. Its good practice to break 
> up incremental changes to a driver in a series but, I don't see why you 
> really need to do that when adding a whole new driver.
> 
> Just
> 
> - Documentation
> - Bindings
> - Driver code
> 
> On the other hand if you were switching on IRIS in the default defconfig 
> then that should be a separate patch.
> 
> If we were say adding inter-frame power-collapse to the existing venus 
> as part of a series, then that makes sense as a standalone patch but IMO 
> when adding a whole new driver, add it as one.
> 
> Its easier to read that way

It wouldn't pass through mailing list filters.

-- 
With best wishes
Dmitry

