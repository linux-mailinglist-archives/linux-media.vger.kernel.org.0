Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 886044405F8
	for <lists+linux-media@lfdr.de>; Sat, 30 Oct 2021 02:00:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231401AbhJ3ACa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Oct 2021 20:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231548AbhJ3AC3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Oct 2021 20:02:29 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AC53C061766
        for <linux-media@vger.kernel.org>; Fri, 29 Oct 2021 17:00:00 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id u21so24042391lff.8
        for <linux-media@vger.kernel.org>; Fri, 29 Oct 2021 17:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5g5uYOpUvbfjxaJiICWjHW49d1Em+rTKi4gF70TOHxg=;
        b=JggKoMhlfFspzcDUsIkc347dS7xht2N8D6Ij6xACaoNBJdGrQOZmVnkuJlGDgtHdlH
         IQEGiAZBzfrpI4fRfyb0N6bCAdm9mMfBNujFv89B5lZMaqOKosmVtAyjzKcOTS6ZddY0
         JrmIYSDglEIKMpO0NF3EX1Pd0uGtkuqHaoc8wOPrNzrnjG+kj3OyiSDqFiLJSxHqymh3
         KSxdlocXpFcaHiIHyonAZ2FhZGCimyRS7VUSO3QTfLlfa2NGTGo0dw/2cakK8VAzwM1j
         G6ndx9q5ajcRNwsGaYxj9h09CYjCOocgAHsGMJwR8Dxv2PjajogZG6q7NrCBv2vZ4GUh
         0jLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5g5uYOpUvbfjxaJiICWjHW49d1Em+rTKi4gF70TOHxg=;
        b=pzZHAi8XQzlIbG25grif2LhmAEkeDfQaYWLgZeS2ltWi4woF6k3NE7d17kwp18ki2o
         aySbKaUP+TRoE53hg0u0UmrJT4lp1MMfBrOoeC/+Zl9FVLsTh+sybvlemSfpc487Zb9G
         /NB/3gce/cCdfBULODzCLlpAfo+CCQyawkg50YPIdSKQOT29eASjpcxhlv6H/dxt/Lpk
         AwcC1dwrWNpfoxE4CD+dbU26KWG6wUJK+WOJeI1Z1qR29SRdWEX0e8UUZMgrDolTI0RH
         pycKRXgfcUfr7Vm5omnt30oP+ZLP/lDqp+h6QdS4XvmTBFDLF6lY4IjeFNXcmbnDw6ck
         C0cg==
X-Gm-Message-State: AOAM531kbusGp1d5ntbTLRFqcQXup8LENP32rY8SHVMoKihiE/K2xeqN
        Wzwr3REgJpDIiiuetfwE/glThVWAiLEuepINtZsCprP4Xoc=
X-Google-Smtp-Source: ABdhPJyk8AjC0EHArvk9GTYuyo2rPBLN0PMmTTayZatTpOwHnZ5+nkxvQHr9DtN0xzXkg5yuUWo07EnzCEyW/nrIIls=
X-Received: by 2002:a05:6512:2022:: with SMTP id s2mr12509876lfs.661.1635551998004;
 Fri, 29 Oct 2021 16:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <20211029214833.2615274-1-tadeusz.struk@linaro.org>
In-Reply-To: <20211029214833.2615274-1-tadeusz.struk@linaro.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 29 Oct 2021 16:59:46 -0700
Message-ID: <CALAqxLVJzCUmcWXZo=nQA2GYR_eCbo7R1JX4KVMDRFhMQua6nA@mail.gmail.com>
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

This works for me, and avoids the deadlock I was hitting with the
earlier version of the patch!

Tested-by: John Stultz <john.stultz@linaro.org>

thanks so much!
-john
