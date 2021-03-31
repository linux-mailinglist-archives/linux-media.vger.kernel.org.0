Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EB9D350A49
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 00:35:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232419AbhCaWep (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Mar 2021 18:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232367AbhCaWeX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Mar 2021 18:34:23 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64E60C061574
        for <linux-media@vger.kernel.org>; Wed, 31 Mar 2021 15:34:23 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id b7so1382ejv.1
        for <linux-media@vger.kernel.org>; Wed, 31 Mar 2021 15:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=Q9WCwfGmM4iYWdFEHQyE+zVfmu09yXQX9OuQ+F2p0s4=;
        b=kpLGZuLm5Mc+yIypP88clx64NfvnJxTUMKDqT3fHvhsgbxw9nj1gzDxHXHiD3eJY+2
         lSvMsbysIEznjQmWcb1MqjskyI9QX1ms0hEvtMbkSCtsORXFTDLl9AHNwLgdYsx1RZ7C
         vy4dO3iRnJrr0EAcO/9RXUmF9AwIRVBVzPf0O3SWXf3j2tlDN/x9yg6lebS7+xQtPHhR
         PeFYJg+mcv8L35z5hhFp82c+uHV2uLwk7cJsjdQr+zI/oLHZ5e2IAjiyj5KmJoJBel6U
         eKl0vCqWGP6aOqedB1M4K3g+qGQYgdjz3SbE7XXwWwyqUGYv42Qtha/cPW5L0xUAYt4t
         rFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=Q9WCwfGmM4iYWdFEHQyE+zVfmu09yXQX9OuQ+F2p0s4=;
        b=jMF6W9DUX5rvNEc/K3pkphvHQub/9hSzxRdMYCj/Gi3dTw9OJqzSGX63t1Sv8rKzvh
         AvgRYGxai3Z9ckDLTiyhZ0JHWoOtAp6LxF1tk930ieuFOQPRyMxiR9OgNguHc4k6CC6k
         zhQmq65v9CmbxrEM3nWLTthNy/eJve0FpN2viA/r2bUScX2EimrS40yx951+vZ2FgEGH
         ryphPpjE1llQGzdUnfFS8EIsW0nu4nn1DZb28/I45dJssnCNsno1/ZX3dFFgCa5oEacm
         zdEdo933rxEt0/BAgLTTOyx/s/CfEKewirNy7lI0VNKLLCveLUht44m8h9iHXeqhCwWv
         o2ZA==
X-Gm-Message-State: AOAM532W0TyhImG6OOAHFMs9/j3UJ7VlDWeDa6ubMiGU86wLLvtKn0Qj
        bZl691OWM54FTWOsFPJ9OjKnxFQaGJWrFpGOwIsaUA==
X-Google-Smtp-Source: ABdhPJx1SQk1Gx1PbdeDawx9LJ+2Yfl7u41MlxF9n6f2LKoDVRAS9ZCLRH/eJFSYQXfg35mtixF97SSOivhrqQ5glJ4=
X-Received: by 2002:a17:906:33d9:: with SMTP id w25mr6270805eja.413.1617230062101;
 Wed, 31 Mar 2021 15:34:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAAEAJfAQkocEX1Z32YwupQT1s+PMGUNQcpgrLhX9+yu+1v9czw@mail.gmail.com>
In-Reply-To: <CAAEAJfAQkocEX1Z32YwupQT1s+PMGUNQcpgrLhX9+yu+1v9czw@mail.gmail.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Wed, 31 Mar 2021 19:34:10 -0300
Message-ID: <CAAEAJfCM+PAG2DDwTbNHOogf=Fo7qGh6a9eH6fBquE7uCa-wwA@mail.gmail.com>
Subject: Re: NULL pointer dereference at v4l2_ctrl_request_complete
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, 31 Mar 2021 at 13:14, Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> Hi Hans,
>
> We have found this crash in mainline:
>
> [  258.174662] Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000000
> [  258.182967] Mem abort info:
> [  258.187746]   ESR = 0x96000004
> [  258.192100]   EC = 0x25: DABT (current EL), IL = 32 bits
> [  258.199108]   SET = 0, FnV = 0
> [  258.203732]   EA = 0, S1PTW = 0
> [  258.208389] Data abort info:
> [  258.212743]   ISV = 0, ISS = 0x00000004
> [  258.218322]   CM = 0, WnR = 0
> [  258.222760] user pgtable: 4k pages, 48-bit VAs, pgdp=00000000444b0000
> [  258.230822] [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
> [  258.239097] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> [  258.246162] Modules linked in: hantro_vpu(C) videobuf2_vmalloc
> v4l2_h264 videobuf2_dma_contig videobuf2_memops v4l2_mem2mem
> videobuf2_v4l2 videobuf2_common videodev mc etnaviv fsl_imx8_ddr_perf
> gpu_sched fuse
> [  258.263431] CPU: 0 PID: 34 Comm: kworker/0:1 Tainted: G         C
>      5.12.0-rc2+ #106
> [  258.270312] Hardware name: NXP i.MX8MQ EVK (DT)
> [  258.273542] Workqueue: events v4l2_m2m_device_run_work [v4l2_mem2mem]
> [  258.278716] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO BTYPE=--)
> [  258.283426] pc : __memcpy+0x7c/0x180
> [  258.285709] lr : v4l2_ctrl_request_complete+0x7c/0x200 [videodev]
> [  258.290585] sp : ffff8000116fbc60
> [  258.292598] x29: ffff8000116fbc60 x28: ffff80001142b780
> [  258.296617] x27: ffff80001127bc80 x26: 00000000e9b00000
> [  258.300637] x25: 00000000e9a00000 x24: ffff0000067e2500
> [  258.304653] x23: ffff0000067e2538 x22: ffff00000387d238
> [  258.308671] x21: ffff0000067e2598 x20: ffff000004644e00
> [  258.312688] x19: ffff000006812a00 x18: 0000000000000000
> [  258.316708] x17: 0000000000000000 x16: 0000000000000000
> [  258.320724] x15: 0000000000000000 x14: 0000000000000000
> [  258.324744] x13: 0000000000000000 x12: 0000000000000000
> [  258.328761] x11: 0000000000000000 x10: 0000000000000000
> [  258.332776] x9 : 0000000000000000 x8 : 0000000000000000
> [  258.336793] x7 : 0000000000000000 x6 : ffff000006812a40
> [  258.340811] x5 : 0000000000000006 x4 : 0000000000000000
> [  258.344826] x3 : 0000000000000010 x2 : 0000000000000010
> [  258.348845] x1 : 0000000000000000 x0 : ffff000006812a40
> [  258.352864] Call trace:
> [  258.354010]  __memcpy+0x7c/0x180
> [  258.355941]  hantro_end_prepare_run+0x2c/0x60 [hantro_vpu]
> [  258.360150]  hantro_g1_mpeg2_dec_run+0x3b0/0x7f0 [hantro_vpu]
> [  258.364615]  device_run+0xa8/0xbc [hantro_vpu]
> [  258.367777]  v4l2_m2m_try_run+0x84/0x134 [v4l2_mem2mem]
> [  258.371723]  v4l2_m2m_device_run_work+0x14/0x20 [v4l2_mem2mem]
> [  258.376279]  process_one_work+0x1c0/0x484
> [  258.378995]  worker_thread+0x70/0x434
> [  258.381364]  kthread+0x158/0x160
> [  258.383296]  ret_from_fork+0x10/0x34
> [  258.385582] Code: a8c12027 a88120c7 a8c12027 a88120c7 (a8c12027)
> [  258.390377] ---[ end trace fea6ecb96dad642d ]---
>
> This needs several concurrent streams to run at the same time,
> it doesn't happen with just one; it was reproduced in rkvdec
> and hantro drivers. The above stacktrace is on MPEG-2,
> but we have found it on H.264 as well.
>
> I've traced this to:
>
>                 v4l2_ctrl_lock(ctrl);
>                 if (ref->req) {
>                         ptr_to_ptr(ctrl, ref->req->p_req, ref->p_req);
>
> And:
>
> static void ptr_to_ptr(struct v4l2_ctrl *ctrl,
>                        union v4l2_ctrl_ptr from, union v4l2_ctrl_ptr to)
> {
>         if (ctrl == NULL)
>                 return;
>         memcpy(to.p, from.p_const, ctrl->elems * ctrl->elem_size);
>                                ^^^^^^^^^^^^
>                                This is NULL
>
> I've been staring at this file and trying to understand how this can happen
> but haven't been able to make any progress so far...
>
> Any ideas ?
>

This issue may be somehow linked to controls that haven't been set,
and thus have their initialization value.

My traces indicate that the controls with NULL values are those
that GStreamer is not setting. I can confirm that by re-testing
with GStreamer setting all the controls always.

Thanks,
Ezequiel
