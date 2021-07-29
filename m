Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 333863DA0E8
	for <lists+linux-media@lfdr.de>; Thu, 29 Jul 2021 12:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235675AbhG2KOZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 06:14:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235155AbhG2KOZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 06:14:25 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29195C061757;
        Thu, 29 Jul 2021 03:14:22 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id m19so3372078wms.0;
        Thu, 29 Jul 2021 03:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=CbFHCpPlzhscajakLbbh3EIk/BRFf4SX49QUa0d5Qg8=;
        b=iiRfREWMNqV+qofxci/nzSz0YAr9K6MCEnf8mrHjk5y30QSLdkiVVWBq2cSSMhixN3
         ry579tv1iYeCv29lJtfmG5FwAtxbT5yYu5lAVL8ZpVNvJ53JkuPkc7CG6zDCoWMOyRFX
         GADeLhCmxvmdJVr1mDhX6/g8ZgA2/q4W9C+er3WP4hMov+Tsm9dSAt+WgDJ4hr1RX+rn
         E/qLsNO2AIRIJIm5SV1Y30DYw9Cw08mbLnPBLmj4yUu3UDnnqb6cip/FaecTccXJG/e3
         l5ydK+ERFnB7VVy/Ts8KO7uAifGrAIXPr/o+CFsOc3K3/kwQNLOzOSOnJJR7wDL0EEe/
         Nt+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=CbFHCpPlzhscajakLbbh3EIk/BRFf4SX49QUa0d5Qg8=;
        b=gEg1wdVqeBoCZjMlzr17P84VLb7zQnnYJbm+fZosDQQP81hDfcvPquJulveK6Ry5xh
         a6sbueEfCgwmx8DpVloZhhbX0l/gEVsipPQk8LvjsYfh3H8ii6D0oMu/LKhPDptBvTdu
         gIzdts7mFBv4+2J++Rf00QT0T1lRPGl2BfTsgiBS5nm1TPlynWNRVQ0CkHfYSsNQ5Ljc
         2/oblMjchVpkg4dpRuNyzYmlhYiTDnatY/Iy94DxTYD3Bgp+HtpwMQe0+vg7p72hGqKr
         kLBVXdG1zPi4Euz68pkadnYIMj5knhheKjgjxEpNpCWD8qNSvGkdtIyo2EI1NQNta/CK
         Rlyg==
X-Gm-Message-State: AOAM530bSL0u0oJ3l8CODi0OJA0So1WLvEBf2rjn+OR/Boi/A54UZTNz
        QMYuT/kZCqysKA1pxM5FpCWQuzYL5RH3wA==
X-Google-Smtp-Source: ABdhPJz5727odHJWfYQdPwGMdYsRDkR36uAkRZDsHt9CJwGj6udF1FY1AywRQgAgB56AGxuvCy2G9A==
X-Received: by 2002:a1c:a7d2:: with SMTP id q201mr13967106wme.61.1627553660808;
        Thu, 29 Jul 2021 03:14:20 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:4b10:6e80:f619:9837? ([2a02:908:1252:fb60:4b10:6e80:f619:9837])
        by smtp.gmail.com with ESMTPSA id d14sm2751552wrs.49.2021.07.29.03.14.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jul 2021 03:14:20 -0700 (PDT)
Subject: Re: [RFC 0/4] dma-fence: Deadline awareness
To:     Pekka Paalanen <ppaalanen@gmail.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc:     =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
        Rob Clark <robdclark@chromium.org>,
        Matthew Brost <matthew.brost@intel.com>,
        Jack Zhang <Jack.Zhang1@amd.com>,
        Gustavo Padovan <gustavo@padovan.org>,
        open list <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Luben Tuikov <luben.tuikov@amd.com>, Roy Sun <Roy.Sun@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Lee Jones <lee.jones@linaro.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
References: <20210726233854.2453899-1-robdclark@gmail.com>
 <28ca4167-4a65-0ccc-36be-5fb017f6f49d@daenzer.net>
 <CAF6AEGuhQ2=DSDaGGVwBz5O+FoZEjpgoVJOcFecpd--a9yDY1w@mail.gmail.com>
 <99984703-c3ca-6aae-5888-5997d7046112@daenzer.net>
 <CAJs_Fx4O4w5djx3-q5zja51-ko_nQ0X2nEk3qoZB_axpBVSrKA@mail.gmail.com>
 <f6d73ec5-85f9-1b18-f2d2-a5f3b7333efa@gmail.com>
 <c9ee242e-542e-e189-a1ec-c1be34d66c93@daenzer.net>
 <04d44873-d8e6-6ae7-f0f9-17bcb484d697@amd.com>
 <9d5f4415-d470-3bc1-7d52-61ba739706ae@daenzer.net>
 <eedfdc75-72f8-9150-584b-c5e9d16db180@amd.com>
 <20210728165700.38c39cf8@eldfell>
 <74e310fa-e544-889f-2389-5abe06f80eb8@amd.com>
 <20210729112358.237651ff@eldfell>
 <3675d530-c9fc-7ec9-e157-b6abeeec7c2a@amd.com>
 <20210729121542.27d9b1cc@eldfell>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <15cf73a8-eda4-3559-561a-a05a14f445d0@gmail.com>
Date:   Thu, 29 Jul 2021 12:14:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729121542.27d9b1cc@eldfell>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 29.07.21 um 11:15 schrieb Pekka Paalanen:
> [SNIP]
>> But how does it then help to wait on the CPU instead?
> A compositor does not "wait" literally. It would only check which state
> set is ready to be used, and uses the most recent set that is ready. Any
> state sets that are not ready are ignored and reconsidered the next
> time the compositor updates the screen.

Mhm, then I'm not understanding what Michel's changes are actually doing.

> Depending on which state sets are selected for a screen update, the
> global window manager state may be updated accordingly, before the
> drawing commands for the composition can be created.
>
>> See what I'm proposing is to either render the next state of the window
>> or compose from the old state (including all atomic properties).
> Yes, that's exactly how it would work. It's just that state for a
> window is not an independent thing, it can affect how unrelated windows
> are managed.
>
> A simplified example would be two windows side by side where the
> resizing of one causes the other to move. You can't resize the window
> or move the other until the buffer with the new size is ready. Until
> then the compositor uses the old state.
>
>> E.g. what do you do if you timeout and can't have the new window content
>> on time? What's the fallback here?
> As there is no wait, there is no timeout either.
>
> If the app happens to be frozen (e.g. some weird bug in fence handling
> to make it never ready, or maybe it's just bugged itself and never
> drawing again), then the app is frozen, and all the rest of the desktop
> continues running normally without a glitch.

But that is in contradict to what you told me before.

See when the window should move but fails to draw it's new content what 
happens?

Are the other windows which would be affected by the move not drawn as well?

Regards,
Christian.

>
>
> Thanks,
> pq

