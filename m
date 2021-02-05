Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 332DB310A6F
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 12:40:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231740AbhBELkT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 06:40:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231580AbhBELhu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 06:37:50 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A3F2C061786
        for <linux-media@vger.kernel.org>; Fri,  5 Feb 2021 03:37:10 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id j11so5749044wmi.3
        for <linux-media@vger.kernel.org>; Fri, 05 Feb 2021 03:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xnUE7dyak9Aa910az+K74O/D9GOQ65TrtrHj5Ed+4AQ=;
        b=MgZ19mfyEcFtrpSiPhlA6EhSzjTdA9yzZWxqekmcI2HS/g+ZPITqJmtBPyI6xZ8hvi
         rXiocAyTICWWEhNEPoaMCdixG1xRDHyfwfy1J33rX5YP8BMuh8f/KonsBLI988ams9Gq
         5oQixQCKy0bTRDonA4hQ/XfsJHLfyURt7FI1ZIeRcj6GBo8mGM32xyq+nRSH8ecHlRh/
         9ICaKy9drPI6vhDL5q8W2ZxkGj/KcTrOTUoSYZmgDRwACcGHEG645wnv1OjyS9wv+Qxa
         JGR2/QzWR/ITHAtJYARC3MMMhLNv4WTGQJ7qX2d1caHCVJx+/W/QdH/LlJrdUibKYA60
         0heQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xnUE7dyak9Aa910az+K74O/D9GOQ65TrtrHj5Ed+4AQ=;
        b=i5MfIG+HTvYrEsKwlkAlt5b3D15Y1HVxXp1VRhYiJU05sEU7GH8wWV5L5Y1Hw0joMC
         RJM8n4azF4aFvx6mPjrwMxLghWUmpcg6GFigV15P6iUbYKitprq6vSc+lm4uQW9oOrGX
         mkQvLyCMnKop7cUbCU8J/5tQeNB+eqEDG9yV0cjEDSPevif81If3OzzCJFle00CB44CQ
         Ag187SpiFzB6f7UxPMjGGoaFLzU89Fx2JsbNqn8JFx+cc/W/TtZqRi1ZEbMDG25TGW6C
         tWbizPSzcoiMT10v+eMc5hn07CLfmvY9yXzg3oc+7aQBVRJJ+Dzi2qqfGXqHDkbHE9Kv
         duWw==
X-Gm-Message-State: AOAM532sa5RomiaIeGORWARZjQlChm8reVbMsAKOiocE2ZHFvWp9m76z
        lJbeh1lnMDm3TKMUFl/2tNRdlQ==
X-Google-Smtp-Source: ABdhPJypMQxNGjOa4/ZmJc7jnuHhpH5nvhL7Ob6Ffm3OhBwzHNry7hzpXCQ8tNknl+h4WeExqzp+5A==
X-Received: by 2002:a05:600c:1552:: with SMTP id f18mr3251124wmg.149.1612525029030;
        Fri, 05 Feb 2021 03:37:09 -0800 (PST)
Received: from [192.168.0.4] (hst-221-40.medicom.bg. [84.238.221.40])
        by smtp.googlemail.com with ESMTPSA id u14sm8203523wmq.45.2021.02.05.03.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Feb 2021 03:37:08 -0800 (PST)
Subject: Re: [PATCH] media: venus: core, venc, vdec: Fix probe dependency
 error
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     dmitry.baryshkov@linaro.org
References: <20210204125614.1453916-1-bryan.odonoghue@linaro.org>
 <836fac64-81b3-2048-c440-8c41cd185e94@linaro.org>
 <e2d89409-6691-e98c-1f68-fcdc63d26be4@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <b0adc363-c5b0-e7f0-5e1c-ea4d33f6d0f7@linaro.org>
Date:   Fri, 5 Feb 2021 13:37:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <e2d89409-6691-e98c-1f68-fcdc63d26be4@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2/5/21 1:24 PM, Bryan O'Donoghue wrote:
> On 05/02/2021 08:31, Stanimir Varbanov wrote:
>> Why not just move platform_set_drvdata(pdev, core) at the end of
>> venus_probe() after we registered v4l2_dev? I think this way we will
>> avoid this v4l2_dev gymnastics.
> 
> Because pm_ops->core_functionname() relies on getdrvdata.
> 
> I changed that in a version of this fix which I didn't publish but also
> found that there were other dependencies in core::probe venc::probe and
> vdec::probe on drvdata.
> 
> I can publish a fix for drvdata and you can take your preference

I'd prefer this solution. Do you see a problem if we change
core_get|put|power functional pointers from pm_ops to receive a
venus_core pointer instead of core->dev?


-- 
regards,
Stan
