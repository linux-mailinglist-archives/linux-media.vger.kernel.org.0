Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF8544CE57
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 01:28:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231612AbhKKAb3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Nov 2021 19:31:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230311AbhKKAb2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Nov 2021 19:31:28 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68F31C061766
        for <linux-media@vger.kernel.org>; Wed, 10 Nov 2021 16:28:40 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id e11so8494785ljo.13
        for <linux-media@vger.kernel.org>; Wed, 10 Nov 2021 16:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GCOj+BlvfKYSuqLtbvE4odReGkR+x7ddg+lGcbsxXNo=;
        b=I4PiIjQQw4yYoL5Zu7lCoXuFFIkSMbgIeUa2km18W/NP5MUDe6/qO4wxfMPlfC6+NR
         WITLXGH4RecuQkk87lm89WlTtkbKkUjhePhwUzFBh7SumXaclw5OXxDrMQDOxM8EGxNf
         J6Gix0eaJwbicM89BLmNhknqhpVtIr8Ube/j9182EZd8t+/8nGWTfdBcD81X6X5iGkD2
         G3u528VqLoivfjd/v41rorFoVdYBDiHiwHeFAsb1B7ZL7dS90WUpmyHlbl3ip/Mk7qYX
         EfXJ6x2PACKrqORBaIVzZHTghmKDAUfYAYwrvsMcVl/Ba41x+2V/+RpDN3cjMfQYkCRq
         18fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GCOj+BlvfKYSuqLtbvE4odReGkR+x7ddg+lGcbsxXNo=;
        b=Lt0CCf3hgiB/KkvkAdtLEyXb56P5wtRmDdy5igUqkGjjgi1rT9IvjSzD8ohvUjXBvT
         YN58gIBdknYgvI0+6d7nn2UAW118vzrUH505rJfal+6StctnBanovJjaA+pmSy2M7VIn
         fx8AdQUV/2RHPyVeY63s1kqK1YEA8RjWlBe18zJeYdbH1DfKUOQymQYqla5MwPzupcH2
         PFvGpbYzPxXIE43B+14GXBiD9o4B2Y73gsyTtj7q/pLbZNvqtlnjVhH/cXFCA4evCuDo
         Lbmke7CwGKD5mufLrH37KsuGylr2VC19b7nJb84eryM9IBts+QLUJk64dG0STWmn7KeP
         1sdw==
X-Gm-Message-State: AOAM532x3bwxkgpKDqPoBH/f9sQtPPV78CtYMh0u2gcvKvY5ppN4VFG+
        /Bn/YIQZr7v7RTGRtsOT8ee33zAYhfPzBZAj3JHWug==
X-Google-Smtp-Source: ABdhPJw2IeInRMNWDtqc21Dd9YVDXzYuOF1rzMxUeYINwuJKSe/nAHpHAyNZ2VJTjAd6BjYlK0kwF4xc5+rBEc50uWQ=
X-Received: by 2002:a2e:95d3:: with SMTP id y19mr3128383ljh.175.1636590518733;
 Wed, 10 Nov 2021 16:28:38 -0800 (PST)
MIME-Version: 1.0
References: <20211029214833.2615274-1-tadeusz.struk@linaro.org>
In-Reply-To: <20211029214833.2615274-1-tadeusz.struk@linaro.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 10 Nov 2021 16:28:26 -0800
Message-ID: <CALAqxLVd6F4RXy-H1y=mPR42RxXYr+0iDGws__k3DZSZD-22qg@mail.gmail.com>
Subject: Re: [PATCH v2] media: venus: Synchronize probe() between venus_core
 and enc/dec
To:     Tadeusz Struk <tadeusz.struk@linaro.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 29, 2021 at 2:48 PM Tadeusz Struk <tadeusz.struk@linaro.org> wrote:
>
> Venus video encode/decode hardware driver consists of three modules.
> The parent module venus-core, and two sub modules venus-enc and venus-dec.
> The venus-core module allocates a common structure that is used by the
> enc/dec modules, loads the firmware, and performs some common hardware
> initialization. Since the three modules are loaded one after the other,
> and their probe functions can run in parallel it is possible that
> the venc_probe and vdec_probe functions can finish before the core
> venus_probe function, which then can fail when, for example it
> fails to load the firmware. In this case the subsequent call to venc_open
> causes an Oops as it tries to dereference already uninitialized structures
> through dev->parent and the system crashes in __pm_runtime_resume() as in
> the trace below:
>
> [   26.064835][  T485] Internal error: Oops: 96000006 [#1] PREEMPT SMP
> [   26.270914][  T485] Hardware name: Thundercomm Dragonboard 845c (DT)
> [   26.285019][  T485] pc : __pm_runtime_resume+0x34/0x178
> [   26.286374][  T213] lt9611 10-003b: hdmi cable connected
> [   26.290285][  T485] lr : venc_open+0xc0/0x278 [venus_enc]
> [   26.290326][  T485] Call trace:
> [   26.290328][  T485]  __pm_runtime_resume+0x34/0x178
> [   26.290330][  T485]  venc_open+0xc0/0x278 [venus_enc]
> [   26.290335][  T485]  v4l2_open+0x184/0x294
> [   26.290340][  T485]  chrdev_open+0x468/0x5c8
> [   26.290344][  T485]  do_dentry_open+0x260/0x54c
> [   26.290349][  T485]  path_openat+0xbe8/0xd5c
> [   26.290352][  T485]  do_filp_open+0xb8/0x168
> [   26.290354][  T485]  do_sys_openat2+0xa4/0x1e8
> [   26.290357][  T485]  __arm64_compat_sys_openat+0x70/0x9c
> [   26.290359][  T485]  invoke_syscall+0x60/0x170
> [   26.290363][  T485]  el0_svc_common+0xb8/0xf8
> [   26.290365][  T485]  do_el0_svc_compat+0x20/0x30
> [   26.290367][  T485]  el0_svc_compat+0x24/0x84
> [   26.290372][  T485]  el0t_32_sync_handler+0x7c/0xbc
> [   26.290374][  T485]  el0t_32_sync+0x1b8/0x1bc
> [   26.290381][  T485] ---[ end trace 04ca7c088b4c1a9c ]---
> [   26.290383][  T485] Kernel panic - not syncing: Oops: Fatal exception
>
> This can be fixed by synchronizing the three probe functions and
> only allowing the venc_probe() and vdec_probe() to pass when venus_probe()
> returns success.
>
> Changes in v2:
> - Change locking from mutex_lock to mutex_trylock
>   in venc_probe and vdec_probe to avoid potential deadlock.
>
> Signed-off-by: Tadeusz Struk <tadeusz.struk@linaro.org>

Just wanted to ping folks on this patch, as it does resolve a frequent
crash that we see on db845c/RB3 and RB5 hardware, so it would be nice
to see it land & backported to -stable.

thanks
-john
