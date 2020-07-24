Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B360E22CB79
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 18:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbgGXQxD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 12:53:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726704AbgGXQxC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 12:53:02 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 568A1C0619E4
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2020 09:53:02 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id p14so8163530wmg.1
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2020 09:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=as4fmSRb387YS8gfp6BovwXw3R68Emkk0kN+WY1ZJ10=;
        b=SmCLRJ44dBBQotYlC662u00MDZ5k4Teg/q73JDHfyu2mT2tUikZZqtRgsqZZQPyNan
         VppmGwKiMK3RvpLWpYUTI2sLrjBHbvI5+0/gtuTztc4plpqp5Z93XASHFJTd+XENm8m5
         nibPgSJJwCaEXF5VNcX9o0a8XW67UuYXdFhnChbgX/gwRnOJpLNc25izUdZyKiEjOnFN
         KZgmGB+zNkgaPcHl7DFcS3Z0MYB65kA03Fx8uJXrTxloFlE+vunIeY+vpjUhgeFLUT8e
         7OcYiepqJJROILp1YgSjybupPwwdnhZS0bsYsqDSxbHhWtBw5CK+DrYXC+dv9vKd7DFO
         ok3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=as4fmSRb387YS8gfp6BovwXw3R68Emkk0kN+WY1ZJ10=;
        b=tDTfSq0gJozRnCdL5nKUeu0E/e9GGPGaEQBvd5mgFrrg4JT+r188odqNKSbvUt0e7F
         J4k/CC3UAmU2Fvvp1M4wPWCjYTAg7dGvy/ezXwYmW0lBggUvtSd00xxfuo4MKwIp0n2A
         xI9gX4yZxh5QCyE0ziuJA36bJdHS+iJ7cndSAVnQC+Oz1pNfPAc2d/fxzs9/UM0VhOoX
         0mXcPGjKovfxeyolJniIgxxGVO4/rAifODLAtifJxQEumK4O0CvFDFrpZ7INl1OHhEr1
         0WSOBy8RUr1YaQhEHf/usmWQ9BBBlPiQ3s8AZimkOvc0B0/6G/pd2eVyfCRValZb/j5X
         P9ig==
X-Gm-Message-State: AOAM531ZSmrJM9hNH0niXXnPYPH++TE70kTs6heS8+5yNfbhpHJe5JKt
        s9sl5B2x+k+VI1YkAy4Lvyn4ew==
X-Google-Smtp-Source: ABdhPJzvcZscyx0ElMoCx6+ZPgt1DJp28aDHhZQ0OpmWwtl54FOTGkKDr5QqjN4KJyP0BhjX2+r1nw==
X-Received: by 2002:a1c:59c2:: with SMTP id n185mr9920796wmb.104.1595609580911;
        Fri, 24 Jul 2020 09:53:00 -0700 (PDT)
Received: from [192.168.1.4] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id l15sm1838328wro.33.2020.07.24.09.52.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2020 09:53:00 -0700 (PDT)
Subject: Re: [PATCH v4 4/5] arm64: dts: sdm845: Add OPP tables and
 power-domains for venus
To:     Lina Iyer <ilina@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Cc:     robh+dt@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, Maulik Shah <mkshah@codeaurora.org>
References: <1595503612-2901-1-git-send-email-rnayak@codeaurora.org>
 <1595503612-2901-5-git-send-email-rnayak@codeaurora.org>
 <e68ff810-362a-5b99-206b-f676b204101d@linaro.org>
 <654e0fcb-ae4d-c151-fa8a-4d029fc823fb@codeaurora.org>
 <20200724162825.GH9185@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <d3fe38de-2f79-713f-eb9e-f72f4b9f6dc0@linaro.org>
Date:   Fri, 24 Jul 2020 19:52:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724162825.GH9185@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lina,

On 7/24/20 7:28 PM, Lina Iyer wrote:
> On Fri, Jul 24 2020 at 03:03 -0600, Rajendra Nayak wrote:
>> Hi Maulik/Lina,
>>
>> On 7/23/2020 11:36 PM, Stanimir Varbanov wrote:
>>> Hi Rajendra,
>>>
>>> After applying 2,3 and 4/5 patches on linaro-integration v5.8-rc2 I see
>>> below messages on db845:
>>>
>>> qcom-venus aa00000.video-codec: dev_pm_opp_set_rate: failed to find
>>> current OPP for freq 533000097 (-34)
>>>
>>> ^^^ This one is new.
>>>
>>> qcom_rpmh TCS Busy, retrying RPMH message send: addr=0x30000
>>>
>>> ^^^ and this message is annoying, can we make it pr_debug in rpmh?
>>
> How annoyingly often do you see this message?

I haven't gig deeply but on every driver pm_runtime_suspend (after
applying Rajendra's patches). And I guess it comes after a call to
dev_pm_opp_set_rate(dev, 0).

IMO this is too often.

> Usually, this is an indication of bad system state either on remote
> processors in the SoC or in Linux itself. On a smooth sailing build you
> should not see this 'warning'.
> 
>> Would you be fine with moving this message to a pr_debug? Its currently
>> a pr_info_ratelimited()
> I would rather not, moving this out of sight will mask a lot serious
> issues that otherwise bring attention to the developers.
> 
> --Lina

-- 
regards,
Stan
