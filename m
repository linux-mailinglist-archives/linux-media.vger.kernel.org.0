Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D8302B3AC1
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 01:26:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728232AbgKPAY6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Nov 2020 19:24:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727618AbgKPAY6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Nov 2020 19:24:58 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D546BC0613CF;
        Sun, 15 Nov 2020 16:24:57 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id k2so16944844wrx.2;
        Sun, 15 Nov 2020 16:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cNyJaglsofCPPDAMR4S0Dh1T3D7plfuh++VKVtz7Hpo=;
        b=ev8LtwyFSaNKRrRx7pPu2AaTYr+GoEQDc5ypjIypn8d3URLYWYepCKUD4jQ2HAfQyt
         zUJDOZDSr3wPgmUnLQYtMOcAdNkHBFsDtdwmzl2dY5nblyMysxXdjqJRTA3kDiqmpr3N
         R4UcZbeE+SAyVi55CQ8A1HHazqxrHohh1+lEiAOzshqR61OaDMJI3a1kpK4w4pB9k0hF
         GM0J4g5PZfBJWAvBI/p99fhjXNY3NtC8xZqv1zdK+UhFZQD/OzBgUkRUt7qN4SU1KvJn
         1Y79YPdGORcXaOhAbVNSUnAi6MU1pUmaJ3pcYrb7h7jEg9IZ9HphjDCRN1YaoSKgHOOJ
         kTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cNyJaglsofCPPDAMR4S0Dh1T3D7plfuh++VKVtz7Hpo=;
        b=jMNELDTXPToGDb678rCDQrrdFaEj82fTTVzifrqU0rM28gf2vZ03ri/sQcSE4mj5Zh
         R0pILXYXFLWJH3InTBBLq0rb4giMh2er9BerHiEe/sIcPsr6+9Q9OQefPBxop3JjDJRU
         AL/ZBWIybc0gKNVYumtD6kvwsFR/x9mK0T4Bqr/y/xIvwyCcwdlMk7e/yvsVh3P9L2Ir
         FvQl6uDSbk5DDqUDyReFAKh7QmmepHZFfk9gbvutWAVYElCf5foL3OzveZE+l9FAKFRG
         YntVaqCBs+/yj6wCob9gVeWixWypmhMQUY4krrYc126ZMn9hmKs43u7+srKLEFZQzIU8
         XIfg==
X-Gm-Message-State: AOAM532XDfMfk1tG/YVKnuC4FYfCThxJZ0O3AM9fnoF6InqsnZxvzG4o
        JEAGrJXOpzX2x7il/3o3Ajc0p7wa253ZnuKcW5I=
X-Google-Smtp-Source: ABdhPJzuP/OHR/ocOpMW01DpmGfyfswGucCY7SFqSWa8kgTGj1RtRDpRNA8MsNFvnXArM0aS8ovHypBm4nz5jxkK+L4=
X-Received: by 2002:adf:fd0d:: with SMTP id e13mr15592102wrr.85.1605486296694;
 Sun, 15 Nov 2020 16:24:56 -0800 (PST)
MIME-Version: 1.0
References: <20201113134938.4004947-1-lee.jones@linaro.org> <20201113134938.4004947-24-lee.jones@linaro.org>
In-Reply-To: <20201113134938.4004947-24-lee.jones@linaro.org>
From:   Qiang Yu <yuq825@gmail.com>
Date:   Mon, 16 Nov 2020 08:24:45 +0800
Message-ID: <CAKGbVbuy2eeQF_AuuoAVDtjPOD1pNsqdegva_hb9U1N2BqNoUw@mail.gmail.com>
Subject: Re: [PATCH 23/40] drm/lima/lima_sched: Remove unused and unnecessary
 variable 'ret'
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        lima@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Applied to drm-misc-next.

On Fri, Nov 13, 2020 at 9:50 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/lima/lima_sched.c: In function =E2=80=98lima_sched_run_j=
ob=E2=80=99:
>  drivers/gpu/drm/lima/lima_sched.c:227:20: warning: variable =E2=80=98ret=
=E2=80=99 set but not used [-Wunused-but-set-variable]
>
> Cc: Qiang Yu <yuq825@gmail.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: lima@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/lima/lima_sched.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lim=
a_sched.c
> index a070a85f8f368..63b4c5643f9cd 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -224,7 +224,6 @@ static struct dma_fence *lima_sched_run_job(struct dr=
m_sched_job *job)
>         struct lima_sched_pipe *pipe =3D to_lima_pipe(job->sched);
>         struct lima_device *ldev =3D pipe->ldev;
>         struct lima_fence *fence;
> -       struct dma_fence *ret;
>         int i, err;
>
>         /* after GPU reset */
> @@ -246,7 +245,7 @@ static struct dma_fence *lima_sched_run_job(struct dr=
m_sched_job *job)
>         /* for caller usage of the fence, otherwise irq handler
>          * may consume the fence before caller use it
>          */
> -       ret =3D dma_fence_get(task->fence);
> +       dma_fence_get(task->fence);
>
>         pipe->current_task =3D task;
>
> --
> 2.25.1
>
