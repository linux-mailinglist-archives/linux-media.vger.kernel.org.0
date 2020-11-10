Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D160B2AE160
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 22:13:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgKJVM5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 16:12:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbgKJVM5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 16:12:57 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44539C0613D1;
        Tue, 10 Nov 2020 13:12:57 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id 33so14272502wrl.7;
        Tue, 10 Nov 2020 13:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+1qiY4oDPj4QZfL6qghq1haCSVhCeVDAqKZGD+qkbx8=;
        b=f1Wqn9BWhlV9TqBzVqcA8K3vSYZ8z/sDMTRNOMC7AqV4HUbCE2abDcOdUls8wIHqNy
         eQrYCCd2SFjle35FbcRiiYTm0Y1PP2B3U0AlJVSEXUjrhyg+vceiwUomjjZYyUbQM3nw
         7LIppNWnObnIw+GgAZoRFZ6qxX28Xw5dsd12B+qDqsHpebCW0cp9V5JBqmOqD0mBBKb7
         8UD7HXinQ7T+n5ZiH9KoG4qeWUQxH3W+uHefFVhjxqQ0JD6Wj1aBXXk0ZdvRA/uNHfeA
         d76iPm6NrzDUyRavySFTn770WrvScPbvWQhsD+KcCTZX8j0eF/OWeO5drdQMhEnmV4U1
         IMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+1qiY4oDPj4QZfL6qghq1haCSVhCeVDAqKZGD+qkbx8=;
        b=PwB8mFUG2PX4X8sN+S97weKx41SbsanNrFIYchxqSXYWcLVG1gDiOPpKFGjQHoD4IQ
         U/8dHGYPJaMMnnixXRkvMA4xDJ2Efvb0gAe65y/ov1PlbHr+7vNJXvfuR+iGV6vUlM+f
         Bxz9poNKplWrabRE/UcDOIixnOQPrObXnN8v0Pbx6oVN0r2xLq9WWPM2+VpY7GjpGmCR
         g2ISrCOGu91edr3ENFUyEoD4H7evdOdbKpOYZDC234tXy97OICbnJYTQgZ/4rI4GPiPV
         cwS72WhAjtBvGZZxbVkf+Pxac1Vc5TPSTEcZmcsq5iOhfcxhxYtPlbEiw2mfDuX6iA80
         T4EQ==
X-Gm-Message-State: AOAM531EaZISLPuuNo6u1B2JmfpJ/r6KPAPiRMszZVLoMOaVw2Moen9r
        XjAUd5sHOBS+1z+LEXX7ZgrIRBdpvC1ae3YCH9M=
X-Google-Smtp-Source: ABdhPJwSPi/XzPxpWkWfc667bn3+KfiQNfQ/1d5NUGazQbQobwLyMKIUuc+OEeitOW6AtDYIuvFhcWe6S0QSmLXW+0I=
X-Received: by 2002:adf:e9c9:: with SMTP id l9mr27585519wrn.124.1605042776045;
 Tue, 10 Nov 2020 13:12:56 -0800 (PST)
MIME-Version: 1.0
References: <20201105144517.1826692-1-lee.jones@linaro.org> <20201105144517.1826692-7-lee.jones@linaro.org>
In-Reply-To: <20201105144517.1826692-7-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 10 Nov 2020 16:12:44 -0500
Message-ID: <CADnq5_Nv_5dbeeBfWN_Kfzt5ZJUDQR9icH_QL10o5v6AW=9qVw@mail.gmail.com>
Subject: Re: [PATCH 06/19] gpu: drm: scheduler: sched_main: Provide missing
 description for 'sched' paramter
To:     Lee Jones <lee.jones@linaro.org>
Cc:     David Airlie <airlied@linux.ie>,
        LKML <linux-kernel@vger.kernel.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 5, 2020 at 9:52 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/scheduler/sched_main.c:74: warning: Function parameter o=
r member 'sched' not described in 'drm_sched_rq_init'
>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 9a0d77a680180..da24c4e8b9fb3 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -65,6 +65,7 @@ static void drm_sched_process_job(struct dma_fence *f, =
struct dma_fence_cb *cb);
>  /**
>   * drm_sched_rq_init - initialize a given run queue struct
>   *
> + * @sched: scheduler instance to associate with this run queue
>   * @rq: scheduler run queue
>   *
>   * Initializes a scheduler runqueue.
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
