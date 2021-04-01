Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 829F5350B50
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 02:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233397AbhDAAeg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Mar 2021 20:34:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232892AbhDAAeE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Mar 2021 20:34:04 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 474B8C061574
        for <linux-media@vger.kernel.org>; Wed, 31 Mar 2021 17:34:04 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id y1so308504ljm.10
        for <linux-media@vger.kernel.org>; Wed, 31 Mar 2021 17:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2B3xNHj6OLVjCYUGqfEIOFjQ6oWjdfGxS2EW9Dw4AiU=;
        b=UZ0bAdzUeFBj/jnAkW0yzC10YYeDfKD1P4ThP4kkMpSOdUdI5qJrZHvPJK9SFIBQDH
         fQpFi9BYjnDB8wvXsOlWwIopaEjthq9vOmUDMyFQczs5vWIRZejuwxs7LSlq/mfNXOGT
         I80P615kikxC4BnjwMGj3HqxT+RNJZ5EtZ2M8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2B3xNHj6OLVjCYUGqfEIOFjQ6oWjdfGxS2EW9Dw4AiU=;
        b=MGIQ51Uju/y0itSAfAbxpsM7a6Hb/AjwHS08f7delyWygh31UbNP+cbs9QoQlaSQxz
         Zp0y4mWTgdAmrmUI5Qhn0LMosjOzZsj2oBJhK49ltngvcPUA1qJq8U8S8FNaMBA1NoCn
         meED5EJ6wW1+bgchWlZRGpSFAFh7wJRA7N4BhH1+22DxFBXtuICBf1V6HMU5Yqe6475o
         jrABgA3KRdSdjp+B4JRnDCe3xQGnSgwOf8BIm9pbS66gP7IaS1r/f48RJqywiqyHqkRQ
         zJGyc/eFnW6aG6Z4TXKn9nDQgllUW70g2mCtk2S1PFaGq0osvW2XYr3SLIFMf+/kjcO/
         yGVA==
X-Gm-Message-State: AOAM531xAO02I7ggT7dFl6mJHceYAPjH+kSzp7UXg2pWjctImpDyC/3j
        vSDt7zU/QyyUoynUx4GU7F7cgTr11wAUGg==
X-Google-Smtp-Source: ABdhPJxFNugF10xsGWKupDI+K6Fbr+9Nyfjxxx5ugD7R/EdyETCENG1SG1xmTHa8BWx4wfccqS/tKw==
X-Received: by 2002:a2e:9f09:: with SMTP id u9mr3744261ljk.17.1617237242451;
        Wed, 31 Mar 2021 17:34:02 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id b7sm370275lfa.18.2021.03.31.17.34.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 17:34:02 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id 15so387023ljj.0
        for <linux-media@vger.kernel.org>; Wed, 31 Mar 2021 17:34:01 -0700 (PDT)
X-Received: by 2002:a2e:8881:: with SMTP id k1mr3645066lji.441.1617237241478;
 Wed, 31 Mar 2021 17:34:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAAEAJfAQkocEX1Z32YwupQT1s+PMGUNQcpgrLhX9+yu+1v9czw@mail.gmail.com>
 <CAAEAJfCM+PAG2DDwTbNHOogf=Fo7qGh6a9eH6fBquE7uCa-wwA@mail.gmail.com> <CAPBb6MVxorow0DQzKtM3P+9hPh9A1HrGH26vQk-V_rJLCSsCfw@mail.gmail.com>
In-Reply-To: <CAPBb6MVxorow0DQzKtM3P+9hPh9A1HrGH26vQk-V_rJLCSsCfw@mail.gmail.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Thu, 1 Apr 2021 09:33:51 +0900
X-Gmail-Original-Message-ID: <CAPBb6MVpw7Hi6ciY-VZmG-rqX4gDHOycG8L9ebXy40j5k4dM=Q@mail.gmail.com>
Message-ID: <CAPBb6MVpw7Hi6ciY-VZmG-rqX4gDHOycG8L9ebXy40j5k4dM=Q@mail.gmail.com>
Subject: Re: NULL pointer dereference at v4l2_ctrl_request_complete
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 1, 2021 at 9:23 AM Alexandre Courbot <acourbot@chromium.org> wrote:
>
> Hi Ezequiel,
>
> On Thu, Apr 1, 2021 at 7:35 AM Ezequiel Garcia
> <ezequiel@vanguardiasur.com.ar> wrote:
> >
> > Hi Hans,
> >
> > On Wed, 31 Mar 2021 at 13:14, Ezequiel Garcia
> > <ezequiel@vanguardiasur.com.ar> wrote:
> > >
> > > Hi Hans,
> > >
> > > We have found this crash in mainline:
> > >
> > > [  258.174662] Unable to handle kernel NULL pointer dereference at
> > > virtual address 0000000000000000
> > > [  258.182967] Mem abort info:
> > > [  258.187746]   ESR = 0x96000004
> > > [  258.192100]   EC = 0x25: DABT (current EL), IL = 32 bits
> > > [  258.199108]   SET = 0, FnV = 0
> > > [  258.203732]   EA = 0, S1PTW = 0
> > > [  258.208389] Data abort info:
> > > [  258.212743]   ISV = 0, ISS = 0x00000004
> > > [  258.218322]   CM = 0, WnR = 0
> > > [  258.222760] user pgtable: 4k pages, 48-bit VAs, pgdp=00000000444b0000
> > > [  258.230822] [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
> > > [  258.239097] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> > > [  258.246162] Modules linked in: hantro_vpu(C) videobuf2_vmalloc
> > > v4l2_h264 videobuf2_dma_contig videobuf2_memops v4l2_mem2mem
> > > videobuf2_v4l2 videobuf2_common videodev mc etnaviv fsl_imx8_ddr_perf
> > > gpu_sched fuse
> > > [  258.263431] CPU: 0 PID: 34 Comm: kworker/0:1 Tainted: G         C
> > >      5.12.0-rc2+ #106
> > > [  258.270312] Hardware name: NXP i.MX8MQ EVK (DT)
> > > [  258.273542] Workqueue: events v4l2_m2m_device_run_work [v4l2_mem2mem]
> > > [  258.278716] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO BTYPE=--)
> > > [  258.283426] pc : __memcpy+0x7c/0x180
> > > [  258.285709] lr : v4l2_ctrl_request_complete+0x7c/0x200 [videodev]
> > > [  258.290585] sp : ffff8000116fbc60
> > > [  258.292598] x29: ffff8000116fbc60 x28: ffff80001142b780
> > > [  258.296617] x27: ffff80001127bc80 x26: 00000000e9b00000
> > > [  258.300637] x25: 00000000e9a00000 x24: ffff0000067e2500
> > > [  258.304653] x23: ffff0000067e2538 x22: ffff00000387d238
> > > [  258.308671] x21: ffff0000067e2598 x20: ffff000004644e00
> > > [  258.312688] x19: ffff000006812a00 x18: 0000000000000000
> > > [  258.316708] x17: 0000000000000000 x16: 0000000000000000
> > > [  258.320724] x15: 0000000000000000 x14: 0000000000000000
> > > [  258.324744] x13: 0000000000000000 x12: 0000000000000000
> > > [  258.328761] x11: 0000000000000000 x10: 0000000000000000
> > > [  258.332776] x9 : 0000000000000000 x8 : 0000000000000000
> > > [  258.336793] x7 : 0000000000000000 x6 : ffff000006812a40
> > > [  258.340811] x5 : 0000000000000006 x4 : 0000000000000000
> > > [  258.344826] x3 : 0000000000000010 x2 : 0000000000000010
> > > [  258.348845] x1 : 0000000000000000 x0 : ffff000006812a40
> > > [  258.352864] Call trace:
> > > [  258.354010]  __memcpy+0x7c/0x180
> > > [  258.355941]  hantro_end_prepare_run+0x2c/0x60 [hantro_vpu]
> > > [  258.360150]  hantro_g1_mpeg2_dec_run+0x3b0/0x7f0 [hantro_vpu]
> > > [  258.364615]  device_run+0xa8/0xbc [hantro_vpu]
> > > [  258.367777]  v4l2_m2m_try_run+0x84/0x134 [v4l2_mem2mem]
> > > [  258.371723]  v4l2_m2m_device_run_work+0x14/0x20 [v4l2_mem2mem]
> > > [  258.376279]  process_one_work+0x1c0/0x484
> > > [  258.378995]  worker_thread+0x70/0x434
> > > [  258.381364]  kthread+0x158/0x160
> > > [  258.383296]  ret_from_fork+0x10/0x34
> > > [  258.385582] Code: a8c12027 a88120c7 a8c12027 a88120c7 (a8c12027)
> > > [  258.390377] ---[ end trace fea6ecb96dad642d ]---
> > >
> > > This needs several concurrent streams to run at the same time,
> > > it doesn't happen with just one; it was reproduced in rkvdec
> > > and hantro drivers. The above stacktrace is on MPEG-2,
> > > but we have found it on H.264 as well.
> > >
> > > I've traced this to:
> > >
> > >                 v4l2_ctrl_lock(ctrl);
> > >                 if (ref->req) {
> > >                         ptr_to_ptr(ctrl, ref->req->p_req, ref->p_req);
> > >
> > > And:
> > >
> > > static void ptr_to_ptr(struct v4l2_ctrl *ctrl,
> > >                        union v4l2_ctrl_ptr from, union v4l2_ctrl_ptr to)
> > > {
> > >         if (ctrl == NULL)
> > >                 return;
> > >         memcpy(to.p, from.p_const, ctrl->elems * ctrl->elem_size);
> > >                                ^^^^^^^^^^^^
> > >                                This is NULL
> > >
> > > I've been staring at this file and trying to understand how this can happen
> > > but haven't been able to make any progress so far...
> > >
> > > Any ideas ?
> > >
> >
> > This issue may be somehow linked to controls that haven't been set,
> > and thus have their initialization value.
> >
> > My traces indicate that the controls with NULL values are those
> > that GStreamer is not setting. I can confirm that by re-testing
> > with GStreamer setting all the controls always.
>
> If I am not mixing up issues then the following patch should fix this:
>
> https://patchwork.linuxtv.org/project/linux-media/patch/ce92a438-4708-74a0-8fb4-c8fb6495e6b8@xs4all.nl/

... or maybe not. I just ran into the same crash after applying it
locally, so guess I was just lucky for a short while. :/
