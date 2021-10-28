Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A19943D7E7
	for <lists+linux-media@lfdr.de>; Thu, 28 Oct 2021 02:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbhJ1AET (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Oct 2021 20:04:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbhJ1AET (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Oct 2021 20:04:19 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DEF5C061570
        for <linux-media@vger.kernel.org>; Wed, 27 Oct 2021 17:01:53 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id q16so7566514ljg.3
        for <linux-media@vger.kernel.org>; Wed, 27 Oct 2021 17:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uqHiZAh9153nwS+DodprExoTASZ+7YRb3/+XlZxYLIE=;
        b=uDQ9r6kZiDALGD4eETvKi+OF+Z+JRrO7Ta/eyWLuqzAi1N5S57vey4fLz9MQ7srH01
         AwA+AwCHxpONEVd93TX/qLMSZqLjLEw+o9DqzKxlM5S/8A6AIbGoeEiwfj96uIt+TLym
         Y7+IUAhZP4koHDaPoCwyiPWKSLlTGf6ALXjoz4Gif4DhiWVWFBwkY1VXlz9/PohF6yoj
         PmQlvJs0q+xoifPkDqmQwRKZvvE4bmYpw4YaHJVmEzFleF73zcNL/RWmekWsy1OgHv6M
         isOFzGkRO3cbxql94FjuVzkUeBh5KAhq0P7OCqN9vXBpi8ZDv3n20rMnVboST+pWPaUC
         INiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uqHiZAh9153nwS+DodprExoTASZ+7YRb3/+XlZxYLIE=;
        b=qlTNnIktaG0CpTpAXZu/zLopcHFI8SqUKwlIXkGUeSoFR26Z82g/VUULKtDf//b1xB
         mzoa4hiKsFrQY+OASOr8v4NfudFHfV7BWsG4UqjySMy5wb0EPiRMdCyz/Krc6BBP8F/o
         LgfNSfKcGyctNbxoFhxs62/mzSVArX87sRd5Eiq9F08wEf94cJVqJxiR5eyOtwt7dUsO
         +Z8DOHIp8ZXL0nTJX9raoC3Ug7BCf+qXvqfQXTn9GI9TmuBUsGlHL+k+zWjPClq665+V
         P3QjSYwtwzDsh5YsJv6mEIQdAMaR9oQLOVWN647+3cjBd4sUWIBfTt6u+4GeEbQxeOZC
         txtA==
X-Gm-Message-State: AOAM533rMIQ4jesH9f+NhoIkukcVngRYNCoJ9zBnR1yXkiZC/uOFA0jl
        44dr09cO9SSk7k65vH4QzXI335EklHjaP5Xhh1JnEg==
X-Google-Smtp-Source: ABdhPJzUb8Oe3WNE2P7KCn5W7pI7aWmRDIg72+6F/Q8l+7E0d5UFfH0toa7VlbWtqBGVBCspe0x7tehPVJHDYenJX0Q=
X-Received: by 2002:a05:651c:389:: with SMTP id e9mr1101224ljp.61.1635379311380;
 Wed, 27 Oct 2021 17:01:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211025144345.267107-1-tadeusz.struk@linaro.org>
In-Reply-To: <20211025144345.267107-1-tadeusz.struk@linaro.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 27 Oct 2021 17:01:39 -0700
Message-ID: <CALAqxLXjh9o925G9smW+uwWqKDarsvrBuzr+UL1CsQc4m7W+oQ@mail.gmail.com>
Subject: Re: [PATCH] media: venus: Synchronize probe() between venus_core and enc/dec
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

On Mon, Oct 25, 2021 at 7:44 AM Tadeusz Struk <tadeusz.struk@linaro.org> wrote:
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
> Signed-off-by: Tadeusz Struk <tadeusz.struk@linaro.org>


Hey Tadeusz
  Thanks so much for sending this out, I definitely would like to see
these crashes sorted!

Unfortunately this patch causes some odd behavior when I use it with a
modular config.  The display does not start up and trying to reboot
the board ends up with it hanging instead of rebooting.

And booting with this patch in my non-modular config, it just seems to
get stuck during bootup (I suspect waiting on firmware that's not yet
mounted?).

I've got to run right now, but I'll try to help debug this down further.

thanks
-john
