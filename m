Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32DDE3106BD
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 09:33:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbhBEIcx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 03:32:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbhBEIcM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 03:32:12 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2E6FC0613D6
        for <linux-media@vger.kernel.org>; Fri,  5 Feb 2021 00:31:25 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id l12so6702949wry.2
        for <linux-media@vger.kernel.org>; Fri, 05 Feb 2021 00:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cnbtlhftON2tr/Yul5ggUwLQUVVG74MtIf1Px5ty5Rk=;
        b=ORtEkYS5dQTLhF9738x/awDg2GI5hmKtIE1WUH8B534q0OjQINgLdIRevHsydNulWE
         1M6K9yLx6n7PyBowwqc0dIAWAaCm27vo3qzIIvvnObG5fl0tzMbQGFzNC4xLcDWbvAwu
         /ymrmBEOdak+37EMqfPjmnL/y2sSzVnExDTxa/RZ1A0qPnJNRLtYRDO33UrB38DzWvRd
         kLlNO73RXo7N31aFvDkv+4PBVekrdOXSQxEmudADLdlbXYSu2jlbhVObcBHc8oMEOAOX
         RSGUVT+CS5TuwYWmaoe2bVEMU0Pnes7tzRBKiLLf/GEJHopVYh2tdohHpujYQdi/aOha
         3nWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cnbtlhftON2tr/Yul5ggUwLQUVVG74MtIf1Px5ty5Rk=;
        b=STu+fpagBe4Mp+TdXsk3OvPGfHBDCs/XzHEuVZP/aP+9+mYGzD5r8UhMdWL1ICouBi
         tIVw+FhhSocVli/7J7OyKneYURVLaqq0skREdzaiq3luahKq2e/leLYR2qsSZcfvr3yM
         UhemvPXa+fVIp3Fbwz7OONnv9X34EAofckuQIkoMPR610nM43+sgn8tJ1mrarjMPKSQh
         XFEA5CdloQCQFG+DSPjyJ8qE6Wdd/405n+JUGTsSRbLqM7uvHlgyG8YYOijuXxJMZFx1
         DTx2udTWEoLlXHM6Gqs6gHNPHKbTu/BQmMZBgF04lus5F/q8QomPtQZGUT0wJNiqW5Ck
         3JYQ==
X-Gm-Message-State: AOAM5333vGWzytR7ygcmOgBb3dxRdVH+wSjQrT63KhXm5KNuGVdc661J
        w5Ar9GXxsZOlcX3PagR90Dq4Zw==
X-Google-Smtp-Source: ABdhPJzJw079SMAPUuPOPB7XYZekEbkVClDRMNWCQsobLfyoVI/MLGw9I3YFCtamU1Bue7m72FRA3Q==
X-Received: by 2002:a05:6000:84:: with SMTP id m4mr3564432wrx.219.1612513884697;
        Fri, 05 Feb 2021 00:31:24 -0800 (PST)
Received: from [192.168.0.4] (hst-221-36.medicom.bg. [84.238.221.36])
        by smtp.googlemail.com with ESMTPSA id g16sm7873402wmi.30.2021.02.05.00.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Feb 2021 00:31:24 -0800 (PST)
Subject: Re: [PATCH] media: venus: core, venc, vdec: Fix probe dependency
 error
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     dmitry.baryshkov@linaro.org
References: <20210204125614.1453916-1-bryan.odonoghue@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <836fac64-81b3-2048-c440-8c41cd185e94@linaro.org>
Date:   Fri, 5 Feb 2021 10:31:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210204125614.1453916-1-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bryan,

Thanks for the fix!

On 2/4/21 2:56 PM, Bryan O'Donoghue wrote:
> Commit aaaa93eda64b ("media] media: venus: venc: add video encoder files")
> is the last in a series of three commits to add core.c vdec.c and venc.c
> adding core, encoder and decoder.
> 
> The encoder and decoder check for core drvdata as set and return -EPROBE_DEFER
> if it has not been set, however both the encoder and decoder rely on
> core.v4l2_dev as valid.
> 
> core.v4l2_dev will not be valid until v4l2_device_register() has completed
> in core.c's probe().
> 
> Normally this is never seen however, Dmitry reported the following
> backtrace when compiling drivers and firmware directly into a kernel image.
> 
> [    5.259968] Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
> [    5.269850] sd 0:0:0:3: [sdd] Optimal transfer size 524288 bytes
> [    5.275505] Workqueue: events deferred_probe_work_func
> [    5.275513] pstate: 60400005 (nZCv daif +PAN -UAO -TCO BTYPE=--)
> [    5.441211] usb 2-1: new SuperSpeedPlus Gen 2 USB device number 2 using xhci-hcd
> [    5.442486] pc : refcount_warn_saturate+0x140/0x148
> [    5.493756] hub 2-1:1.0: USB hub found
> [    5.496266] lr : refcount_warn_saturate+0x140/0x148
> [    5.500982] hub 2-1:1.0: 4 ports detected
> [    5.503440] sp : ffff80001067b730
> [    5.503442] x29: ffff80001067b730
> [    5.592660] usb 1-1: new high-speed USB device number 2 using xhci-hcd
> [    5.598478] x28: ffff6c6bc1c379b8
> [    5.598480] x27: ffffa5c673852960 x26: ffffa5c673852000
> [    5.598484] x25: ffff6c6bc1c37800 x24: 0000000000000001
> [    5.810652] x23: 0000000000000000 x22: ffffa5c673bc7118
> [    5.813777] hub 1-1:1.0: USB hub found
> [    5.816108] x21: ffffa5c674440000 x20: 0000000000000001
> [    5.820846] hub 1-1:1.0: 4 ports detected
> [    5.825415] x19: ffffa5c6744f4000 x18: ffffffffffffffff
> [    5.825418] x17: 0000000000000000 x16: 0000000000000000
> [    5.825421] x15: 00000a4810c193ba x14: 0000000000000000
> [    5.825424] x13: 00000000000002b8 x12: 000000000000f20a
> [    5.825427] x11: 000000000000f20a x10: 0000000000000038
> [    5.845447] usb 2-1.1: new SuperSpeed Gen 1 USB device number 3 using xhci-hcd
> [    5.845904]
> [    5.845905] x9 : 0000000000000000 x8 : ffff6c6d36fae780
> [    5.871208] x7 : ffff6c6d36faf240 x6 : 0000000000000000
> [    5.876664] x5 : 0000000000000004 x4 : 0000000000000085
> [    5.882121] x3 : 0000000000000119 x2 : ffffa5c6741ef478
> [    5.887578] x1 : 3acbb3926faf5f00 x0 : 0000000000000000
> [    5.893036] Call trace:
> [    5.895551]  refcount_warn_saturate+0x140/0x148
> [    5.900202]  __video_register_device+0x64c/0xd10
> [    5.904944]  venc_probe+0xc4/0x148
> [    5.908444]  platform_probe+0x68/0xe0
> [    5.912210]  really_probe+0x118/0x3e0
> [    5.915977]  driver_probe_device+0x5c/0xc0
> [    5.920187]  __device_attach_driver+0x98/0xb8
> [    5.924661]  bus_for_each_drv+0x68/0xd0
> [    5.928604]  __device_attach+0xec/0x148
> [    5.932547]  device_initial_probe+0x14/0x20
> [    5.936845]  bus_probe_device+0x9c/0xa8
> [    5.940788]  device_add+0x3e8/0x7c8
> [    5.944376]  of_device_add+0x4c/0x60
> [    5.948056]  of_platform_device_create_pdata+0xbc/0x140
> [    5.953425]  of_platform_bus_create+0x17c/0x3c0
> [    5.958078]  of_platform_populate+0x80/0x110
> [    5.962463]  venus_probe+0x2ec/0x4d8
> [    5.966143]  platform_probe+0x68/0xe0
> [    5.969907]  really_probe+0x118/0x3e0
> [    5.973674]  driver_probe_device+0x5c/0xc0
> [    5.977882]  __device_attach_driver+0x98/0xb8
> [    5.982356]  bus_for_each_drv+0x68/0xd0
> [    5.986298]  __device_attach+0xec/0x148
> [    5.990242]  device_initial_probe+0x14/0x20
> [    5.994539]  bus_probe_device+0x9c/0xa8
> [    5.998481]  deferred_probe_work_func+0x74/0xb0
> [    6.003132]  process_one_work+0x1e8/0x360
> [    6.007254]  worker_thread+0x208/0x478
> [    6.011106]  kthread+0x150/0x158
> [    6.014431]  ret_from_fork+0x10/0x30
> [    6.018111] ---[ end trace f074246b1ecdb466 ]---
> 
> This patch fixes by
> 
> - Making core.v4l2_dev into core->v4l_dev
> - Only setting core->v4l2_dev when v4l2_device_register() completes
> - Deferring encoder/decoder probe until core->v4l2_dev is set

Why not just move platform_set_drvdata(pdev, core) at the end of
venus_probe() after we registered v4l2_dev? I think this way we will
avoid this v4l2_dev gymnastics.

> 
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: aaaa93eda64b ("media] media: venus: venc: add video encoder files")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/core.c | 14 +++++++++++---
>  drivers/media/platform/qcom/venus/core.h |  2 +-
>  drivers/media/platform/qcom/venus/vdec.c |  4 ++--
>  drivers/media/platform/qcom/venus/venc.c |  4 ++--
>  4 files changed, 16 insertions(+), 8 deletions(-)
> 


-- 
regards,
Stan
