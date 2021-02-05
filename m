Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2727310AB2
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 12:56:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232025AbhBELzQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 06:55:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231923AbhBELw6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 06:52:58 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEACEC06178A
        for <linux-media@vger.kernel.org>; Fri,  5 Feb 2021 03:52:11 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id g10so7405733wrx.1
        for <linux-media@vger.kernel.org>; Fri, 05 Feb 2021 03:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vb44vPm1xU56Sdqtqj9DTcMMfbUsDS3zqJgKcIDWsFI=;
        b=fHK+EYPE1VvS65Saf6F98oDkKoPI4k2Y4hqeiKRBevHjE0NAG8Y5xS+FEt1jb+hrCQ
         We9nsh42Y6LB6ebzRya8RjNokQwWZBLewFugCT/WXaX0htHwTOyHEoCUaxCwxA146spP
         uZIwGQ76EG5jRPMz4NStsn+bIRvFMpEnj/JlTMUJwlw4LweuO2iYACXV/8QDuXNx2xGU
         Mh/OpFnS19oUX2ghdifpay2HFX45HAadGhM6g8T3F69IellsxllLeTc57nlnjUPOZFTg
         oTbvM7tw9u14JehqZXej1RAhUUboZXhaEh5pTQcb9K31VhsfRks/9UuH0JDBQPo1cpkz
         kZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vb44vPm1xU56Sdqtqj9DTcMMfbUsDS3zqJgKcIDWsFI=;
        b=PKN6rA6imj95CZVtXB2ZgJtPbsOr2G57pfkmtPi65a0qgj2eqmgGG6aejYIchGOPI8
         2oJJM7a4D8CO0l5Ht0Gr4SscbFy0ie4P/dqRUQZiycITUrGcsTI8JsTs257DEknO7dlL
         1TqvDAHInEpH1x+zB1s+7tZvFom5ZU77c2RCWKhk/7CaxdwSJA0MOHOIbpr323wB6xiY
         nnvtXxDvO+Dt+lmxY7794/Lw8bDfOaHH75OfsNnBq9mBK/naDpo+krMIE4aWInQ2/wm9
         FbCpxy1URV1dnpdX5CAo6q/g4GKjxOEoGERvXkRUXU8x3UdhUD4rhQqP4ot3P4qwQlPK
         tUYg==
X-Gm-Message-State: AOAM532ukmCSfNYlS2BdoxNcTmsuo0k+7HdLvhhHF6EqnlEAxrIiBt60
        MJOFw55mN2P5xl4bYQvF9xTEeA==
X-Google-Smtp-Source: ABdhPJwRHqWuou6UirI53ljWbvlXM+visXdHWhq2tN0CxaHk6XrG0ymiBWxyy3AEr/QTVRMhZOABHA==
X-Received: by 2002:a5d:4b0b:: with SMTP id v11mr4560700wrq.226.1612525930436;
        Fri, 05 Feb 2021 03:52:10 -0800 (PST)
Received: from [192.168.0.4] (hst-221-40.medicom.bg. [84.238.221.40])
        by smtp.googlemail.com with ESMTPSA id d16sm11793104wrr.59.2021.02.05.03.52.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Feb 2021 03:52:09 -0800 (PST)
Subject: Re: [PATCH] media: venus: core, venc, vdec: Fix probe dependency
 error
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     dmitry.baryshkov@linaro.org
References: <20210204125614.1453916-1-bryan.odonoghue@linaro.org>
 <836fac64-81b3-2048-c440-8c41cd185e94@linaro.org>
 <e2d89409-6691-e98c-1f68-fcdc63d26be4@linaro.org>
 <b0adc363-c5b0-e7f0-5e1c-ea4d33f6d0f7@linaro.org>
Message-ID: <d7d114fe-6255-5672-e91c-2558d56da745@linaro.org>
Date:   Fri, 5 Feb 2021 13:52:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <b0adc363-c5b0-e7f0-5e1c-ea4d33f6d0f7@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2/5/21 1:37 PM, Stanimir Varbanov wrote:
> 
> 
> On 2/5/21 1:24 PM, Bryan O'Donoghue wrote:
>> On 05/02/2021 08:31, Stanimir Varbanov wrote:
>>> Why not just move platform_set_drvdata(pdev, core) at the end of
>>> venus_probe() after we registered v4l2_dev? I think this way we will
>>> avoid this v4l2_dev gymnastics.
>>
>> Because pm_ops->core_functionname() relies on getdrvdata.
>>
>> I changed that in a version of this fix which I didn't publish but also
>> found that there were other dependencies in core::probe venc::probe and
>> vdec::probe on drvdata.
>>
>> I can publish a fix for drvdata and you can take your preference
> 
> I'd prefer this solution. Do you see a problem if we change
> core_get|put|power functional pointers from pm_ops to receive a
> venus_core pointer instead of core->dev?
> 
> 

Wait, venus_runtime_suspend|resume also relies on that
dev_get_drvdata(). Can we call v4l2_device_register() earlier in
venus_probe?

-- 
regards,
Stan
