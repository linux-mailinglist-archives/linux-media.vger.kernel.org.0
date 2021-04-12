Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF05F35BEBA
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 11:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238374AbhDLJBv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 05:01:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238493AbhDLI5F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 04:57:05 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6CB8C06134B
        for <linux-media@vger.kernel.org>; Mon, 12 Apr 2021 01:55:57 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id n138so20175396lfa.3
        for <linux-media@vger.kernel.org>; Mon, 12 Apr 2021 01:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dwECPFdoFIXsGrFcnnl3bcUwjXUSgWopggdDEBe0Zoc=;
        b=X2OABwt1m+G+EryXYFOJGGtMNfHFWBbF63xQMqXFHURh9eQ06uRq0hPj2QjiJT1BCA
         8Ur3uJxHNOSNWSzohPssr6TxMhHb2EHk9P5LMsP8vj63K1LQagwFpskIoqFSJ/3Ne24/
         V7M59JCTtDatjIetNhHc13h5C3VFQzZn3a+nU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dwECPFdoFIXsGrFcnnl3bcUwjXUSgWopggdDEBe0Zoc=;
        b=T4FBwCnsSHcS+kdtUds5ZagOTsCqqc333UdlsXKl46M3EzQGHgwuiN4wcMjj0ymn+S
         +OQZAXadCtt46dIsUEGG8Ar5Tr02G1Qbmu3MYBVUy56T+omBeJ7E/t3zWi2QHXBqbZaN
         G2G+0efaWJ1LbsLTYlc+jJjAZZfftjr4aE0IyFjOHk46RRaJ+WE9DpKgnCe9acpSMXnU
         i+Q6QHcJ7NQLrg+5ihU+b+UJ91QOdTkUwZuhCViGjYYsrQhwyJo+YyGJv2m/EcsbggUo
         PoWSCGlhbM/bPzzeFkNn+3ySAHAq2yOFbJvKQL1/emJw7v8xaJExCD8aFKkjmLlM+0Bq
         2Zjw==
X-Gm-Message-State: AOAM533bj4LWGmMUXnV3yyUCS3swhnDEVlfwug8hbm7FLOEo7cFmVwju
        Gn7hzaLy6fQ9YSJKBSiAWGco8Y7BaqG3nA==
X-Google-Smtp-Source: ABdhPJwYbjXeKMxXNCXWdtKnIShjN1Wm565dXfMRfoF9EMGrskExR5TakMDz9jUjwfeeJBh4FY/vdw==
X-Received: by 2002:a19:e013:: with SMTP id x19mr11129433lfg.277.1618217756103;
        Mon, 12 Apr 2021 01:55:56 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id q16sm2246156lfm.35.2021.04.12.01.55.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Apr 2021 01:55:55 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id r22so3721685ljc.5
        for <linux-media@vger.kernel.org>; Mon, 12 Apr 2021 01:55:55 -0700 (PDT)
X-Received: by 2002:a2e:8881:: with SMTP id k1mr17292409lji.441.1618217755171;
 Mon, 12 Apr 2021 01:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAAEAJfAQkocEX1Z32YwupQT1s+PMGUNQcpgrLhX9+yu+1v9czw@mail.gmail.com>
 <CAAEAJfCM+PAG2DDwTbNHOogf=Fo7qGh6a9eH6fBquE7uCa-wwA@mail.gmail.com>
 <9a751a33-1dbe-65cd-ca20-6c485f6448f2@xs4all.nl> <CAPBb6MU-cv-_AsSbO0jK2r1iKmhcU9ZvkffNa9sTr5BE6NzEGw@mail.gmail.com>
 <6cf22872-e76e-4a83-87dc-fcde1df2c33c@xs4all.nl>
In-Reply-To: <6cf22872-e76e-4a83-87dc-fcde1df2c33c@xs4all.nl>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Mon, 12 Apr 2021 17:55:43 +0900
X-Gmail-Original-Message-ID: <CAPBb6MVjmNn4Eu19gSt3dojpETkvLqn4izLg=DmWbR=SCLmRNA@mail.gmail.com>
Message-ID: <CAPBb6MVjmNn4Eu19gSt3dojpETkvLqn4izLg=DmWbR=SCLmRNA@mail.gmail.com>
Subject: Re: NULL pointer dereference at v4l2_ctrl_request_complete
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Apr 12, 2021 at 5:45 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> Hi Alexandre,
>
> On 12/04/2021 10:28, Alexandre Courbot wrote:
> > Hi Hans,
> >
> > I have been able to reproduce the issue with the stateless part of the
> > mtk-vcodec decoder driver (not merged as of today), which shows the
> > exact same crash.
> >
> > With your patch applied I got the following output right before the
> > crash, when decoding H.264 or VP9:
> >
> > H.264:
> > [  549.264784] v4l2-ctrls: v4l2_ctrl_request_complete 990a6b H264 Profile
> > [  976.630017] v4l2-ctrls: v4l2_ctrl_request_complete 980001 User Controls
> > [  125.152149] v4l2-ctrls: v4l2_ctrl_request_complete 980001 User Controls
> > [  330.049192] v4l2-ctrls: v4l2_ctrl_request_complete 990001 Codec Controls
> >
> > VP9:
> > [  215.945812] v4l2-ctrls: v4l2_ctrl_request_complete 990a6b H264 Profile
> > [  428.564501] v4l2-ctrls: v4l2_ctrl_request_complete 990a6b H264 Profile
> > [  830.970340] v4l2-ctrls: v4l2_ctrl_request_complete 990b00 VP9 Profile
> >
> > The other pr_info() in your patch was never seen.
> >
> > Interestingly these controls are not set by requests, and are not even
> > supposed to be set on a decoder. I am not quite sure where this could
> > come from...
>
> I found the issue and Ezequiel successfully tested a patch I mailed him privately.
>
> The patch needs a bit of cleanup, but I plan to post it today.

Oh, that's good news! Will be happy to test it then.

Cheers,
Alex.

>
> Regards,
>
>         Hans
>
> >
> > Cheers,
> > Alex.
> >
> > On Thu, Apr 1, 2021 at 6:36 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >>
> >> On 01/04/2021 00:34, Ezequiel Garcia wrote:
> >>> Hi Hans,
> >>>
> >>> On Wed, 31 Mar 2021 at 13:14, Ezequiel Garcia
> >>> <ezequiel@vanguardiasur.com.ar> wrote:
> >>>>
> >>>> Hi Hans,
> >>>>
> >>>> We have found this crash in mainline:
> >>>>
> >>>> [  258.174662] Unable to handle kernel NULL pointer dereference at
> >>>> virtual address 0000000000000000
> >>>> [  258.182967] Mem abort info:
> >>>> [  258.187746]   ESR = 0x96000004
> >>>> [  258.192100]   EC = 0x25: DABT (current EL), IL = 32 bits
> >>>> [  258.199108]   SET = 0, FnV = 0
> >>>> [  258.203732]   EA = 0, S1PTW = 0
> >>>> [  258.208389] Data abort info:
> >>>> [  258.212743]   ISV = 0, ISS = 0x00000004
> >>>> [  258.218322]   CM = 0, WnR = 0
> >>>> [  258.222760] user pgtable: 4k pages, 48-bit VAs, pgdp=00000000444b0000
> >>>> [  258.230822] [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
> >>>> [  258.239097] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> >>>> [  258.246162] Modules linked in: hantro_vpu(C) videobuf2_vmalloc
> >>>> v4l2_h264 videobuf2_dma_contig videobuf2_memops v4l2_mem2mem
> >>>> videobuf2_v4l2 videobuf2_common videodev mc etnaviv fsl_imx8_ddr_perf
> >>>> gpu_sched fuse
> >>>> [  258.263431] CPU: 0 PID: 34 Comm: kworker/0:1 Tainted: G         C
> >>>>      5.12.0-rc2+ #106
> >>>> [  258.270312] Hardware name: NXP i.MX8MQ EVK (DT)
> >>>> [  258.273542] Workqueue: events v4l2_m2m_device_run_work [v4l2_mem2mem]
> >>>> [  258.278716] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO BTYPE=--)
> >>>> [  258.283426] pc : __memcpy+0x7c/0x180
> >>>> [  258.285709] lr : v4l2_ctrl_request_complete+0x7c/0x200 [videodev]
> >>>> [  258.290585] sp : ffff8000116fbc60
> >>>> [  258.292598] x29: ffff8000116fbc60 x28: ffff80001142b780
> >>>> [  258.296617] x27: ffff80001127bc80 x26: 00000000e9b00000
> >>>> [  258.300637] x25: 00000000e9a00000 x24: ffff0000067e2500
> >>>> [  258.304653] x23: ffff0000067e2538 x22: ffff00000387d238
> >>>> [  258.308671] x21: ffff0000067e2598 x20: ffff000004644e00
> >>>> [  258.312688] x19: ffff000006812a00 x18: 0000000000000000
> >>>> [  258.316708] x17: 0000000000000000 x16: 0000000000000000
> >>>> [  258.320724] x15: 0000000000000000 x14: 0000000000000000
> >>>> [  258.324744] x13: 0000000000000000 x12: 0000000000000000
> >>>> [  258.328761] x11: 0000000000000000 x10: 0000000000000000
> >>>> [  258.332776] x9 : 0000000000000000 x8 : 0000000000000000
> >>>> [  258.336793] x7 : 0000000000000000 x6 : ffff000006812a40
> >>>> [  258.340811] x5 : 0000000000000006 x4 : 0000000000000000
> >>>> [  258.344826] x3 : 0000000000000010 x2 : 0000000000000010
> >>>> [  258.348845] x1 : 0000000000000000 x0 : ffff000006812a40
> >>>> [  258.352864] Call trace:
> >>>> [  258.354010]  __memcpy+0x7c/0x180
> >>>> [  258.355941]  hantro_end_prepare_run+0x2c/0x60 [hantro_vpu]
> >>>> [  258.360150]  hantro_g1_mpeg2_dec_run+0x3b0/0x7f0 [hantro_vpu]
> >>>> [  258.364615]  device_run+0xa8/0xbc [hantro_vpu]
> >>>> [  258.367777]  v4l2_m2m_try_run+0x84/0x134 [v4l2_mem2mem]
> >>>> [  258.371723]  v4l2_m2m_device_run_work+0x14/0x20 [v4l2_mem2mem]
> >>>> [  258.376279]  process_one_work+0x1c0/0x484
> >>>> [  258.378995]  worker_thread+0x70/0x434
> >>>> [  258.381364]  kthread+0x158/0x160
> >>>> [  258.383296]  ret_from_fork+0x10/0x34
> >>>> [  258.385582] Code: a8c12027 a88120c7 a8c12027 a88120c7 (a8c12027)
> >>>> [  258.390377] ---[ end trace fea6ecb96dad642d ]---
> >>>>
> >>>> This needs several concurrent streams to run at the same time,
> >>>> it doesn't happen with just one; it was reproduced in rkvdec
> >>>> and hantro drivers. The above stacktrace is on MPEG-2,
> >>>> but we have found it on H.264 as well.
> >>>>
> >>>> I've traced this to:
> >>>>
> >>>>                 v4l2_ctrl_lock(ctrl);
> >>>>                 if (ref->req) {
> >>>>                         ptr_to_ptr(ctrl, ref->req->p_req, ref->p_req);
> >>>>
> >>>> And:
> >>>>
> >>>> static void ptr_to_ptr(struct v4l2_ctrl *ctrl,
> >>>>                        union v4l2_ctrl_ptr from, union v4l2_ctrl_ptr to)
> >>>> {
> >>>>         if (ctrl == NULL)
> >>>>                 return;
> >>>>         memcpy(to.p, from.p_const, ctrl->elems * ctrl->elem_size);
> >>>>                                ^^^^^^^^^^^^
> >>>>                                This is NULL
> >>>>
> >>>> I've been staring at this file and trying to understand how this can happen
> >>>> but haven't been able to make any progress so far...
> >>>>
> >>>> Any ideas ?
> >>
> >> Can you test with this patch:
> >>
> >> ---------------------------------------
> >> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> >> index 757d215c2be4..19c56cb9f86a 100644
> >> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> >> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> >> @@ -2703,8 +2703,11 @@ static int handler_new_ref(struct v4l2_ctrl_handler *hdl,
> >>         if (hdl->error)
> >>                 return hdl->error;
> >>
> >> -       if (allocate_req)
> >> +       if (allocate_req) {
> >>                 size_extra_req = ctrl->elems * ctrl->elem_size;
> >> +               if (!size_extra_req)
> >> +                       pr_info("empty size_extra_req %x %s\n", ctrl->id, ctrl->name);
> >> +       }
> >>         new_ref = kzalloc(sizeof(*new_ref) + size_extra_req, GFP_KERNEL);
> >>         if (!new_ref)
> >>                 return handler_set_err(hdl, -ENOMEM);
> >> @@ -4610,6 +4613,8 @@ void v4l2_ctrl_request_complete(struct media_request *req,
> >>
> >>                 v4l2_ctrl_lock(ctrl);
> >>                 if (ref->req) {
> >> +                       if (!ref->req->p_req.p)
> >> +                               pr_info("v4l2_ctrl_request_complete %x %s\n", ctrl->id, ctrl->name);
> >>                         ptr_to_ptr(ctrl, ref->req->p_req, ref->p_req);
> >>                 } else {
> >>                         ptr_to_ptr(ctrl, ctrl->p_cur, ref->p_req);
> >> ---------------------------------------
> >>
> >> I want to know if there are controls where size_extra_req == 0 (meaning
> >> that p_req.p is also NULL), and which control encounters the NULL p_req.p.
> >>
> >> Regards,
> >>
> >>         Hans
>
