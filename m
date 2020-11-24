Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10FA22C2BCF
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 16:51:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389838AbgKXPuJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 10:50:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389441AbgKXPuI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 10:50:08 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 636D5C0613D6;
        Tue, 24 Nov 2020 07:50:08 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id m6so22789318wrg.7;
        Tue, 24 Nov 2020 07:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vEHV5NzbwJ9itZIOZg0YcV4vFlrMnth6sSMm0U/4U18=;
        b=HmasDWuex7mGSrEPKku7nbQd9pKEB0VIF/ooeC/H8gEFqGk0eOPrQOD7ULPnDUW1nF
         SEBqUzIDs3Q/b4NtGdRpz/Rhjt2mKTIMKQ/ifjbi9gBPMU8wshfy2o52ODxvXErCmkHS
         LSs2gJj3neMlfzcdel0xGs2Utc1QXnq9guR+oZcGhRV1t+vq/PhmAWj5+0XzOBXYJLk0
         uv5YY4FHNZrt29KHEjCtTqNnmmYAPLqKDfCqwCUejkQfGt9YcZO948F5E0Yw6DVf30zb
         TxP180NnVt7lApqwkS/V7cOWZq8z9wyZrytoGbrXfWOzu1Nw6Pg+rA2xEfAv8tiyu7Nb
         73tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vEHV5NzbwJ9itZIOZg0YcV4vFlrMnth6sSMm0U/4U18=;
        b=X14eWMVHk8jnAemEhpLcVWqLLddSRjuSTv6hOSNEMZdEicMVRoDXXcvf2FGRqEyUl0
         tAjfgu/4pfxxNTodXWESsMOtp/eMZ/mbWWk5YO6Q097VmpnczkwppgRu5CcE4RyFywtF
         tnRGefzizoft+gaIO/9RRFPiuXkQKr2J1gQ+finYKfZbIPsoEi9nA3evZgoEAhYRQPgN
         agL/p5x9Nxt3LcROZMUGMU81bXJmgc+yUgJqEg+B9TRxOxC+HnTdXvtHUW9GfUOiVkwf
         RzCokUyn7v47fMV7vlvUVyac4bKUoePLYyN5nyVB39xVEpIk9eRWxQUdgtI2M+LzJyLP
         xDvQ==
X-Gm-Message-State: AOAM530UCiL9VMM4jatS7i9wn2MPo9PbpXF9WSW7VU3XHFibkyVfkNN2
        0oruFFtPGmSDABhEgefixrgQgjwvExUcvrpeCT8=
X-Google-Smtp-Source: ABdhPJzerQP49Kf7yuyCXUUv4/+uMPHMJ+Frw4C4JWUo8vpK1xvcKt1uN5gVCEtR/4wUmA2B3xr5/nsHrOl93j4H360=
X-Received: by 2002:a5d:400a:: with SMTP id n10mr5940385wrp.362.1606233007147;
 Tue, 24 Nov 2020 07:50:07 -0800 (PST)
MIME-Version: 1.0
References: <20201123111919.233376-1-lee.jones@linaro.org> <20201123111919.233376-4-lee.jones@linaro.org>
In-Reply-To: <20201123111919.233376-4-lee.jones@linaro.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 24 Nov 2020 10:49:56 -0500
Message-ID: <CADnq5_P=4f5gq+mS358d0zGEB6yr0PGruAKKLoiiEb9hq30thg@mail.gmail.com>
Subject: Re: [PATCH 03/40] drm/amd/amdgpu/amdgpu_ib: Provide docs for
 'amdgpu_ib_schedule()'s 'job' param
To:     Lee Jones <lee.jones@linaro.org>
Cc:     David Airlie <airlied@linux.ie>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 23, 2020 at 6:19 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c:127: warning: Function parameter =
or member 'job' not described in 'amdgpu_ib_schedule'
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied.  Thanks!

Alex


> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_ib.c
> index c69af9b86cc60..024d0a563a652 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
> @@ -106,6 +106,7 @@ void amdgpu_ib_free(struct amdgpu_device *adev, struc=
t amdgpu_ib *ib,
>   * @ring: ring index the IB is associated with
>   * @num_ibs: number of IBs to schedule
>   * @ibs: IB objects to schedule
> + * @job: job to schedule
>   * @f: fence created during this submission
>   *
>   * Schedule an IB on the associated ring (all asics).
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
