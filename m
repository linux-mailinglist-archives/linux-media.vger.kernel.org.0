Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 413593662A9
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 01:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234452AbhDTX6M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 19:58:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234223AbhDTX6M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 19:58:12 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E379C06174A;
        Tue, 20 Apr 2021 16:57:40 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id 35-20020a9d05260000b029029c82502d7bso6013387otw.2;
        Tue, 20 Apr 2021 16:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=znEmkMwEuNpZTNjrNgX8auZmv/MxbCMnb2W49monkys=;
        b=GVmGslbMavTYJCEB5YDV7vPKVrES6hCjXPElLvaZ8xCTmq/1sq4+i3zMHP4DlW3zVj
         a3Sn9CYwlIJQorMuwBwOAyAXznfF6yGrTstFc9tLTUtCIOB8KGhz5PQRePKr+M6ZOsdv
         cbYnfr9wKZvD/2tOHX+nR5zR+2cSp4WGEybv22kiQFRCPmXIu2v5HIcQ5zlJCq9ES62+
         cg898IMEtcSTu766dCX2jgBRw59371oBnTLS4qf6O+dDEzlzQGAhKJTRq4p1rD9V0LZq
         5SJYnBsEewSArBUNZdqWPKx+b8aw77GsA5pFcyQ7FirUWFWdUn0F3IkrbqKUnA8mBXBs
         Uzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=znEmkMwEuNpZTNjrNgX8auZmv/MxbCMnb2W49monkys=;
        b=AvkDwy38/jqv0CgZtuELtwrmTJVyxTFkIHXkrclEuhDYf/DR+rf9GfzPDZMzdpqCAh
         BqX1ck9pJ6+4CDJrEkMxCNGAu78778Dd0nw/tm6nQhqiNsjs5jOsZCmkZ8USJAXQI+4E
         geI5+E78CKY4WXgAE/lgZuAAsC8c8uUS/44X+MFoxgv//xVF/E5+E4L8X0APpwIbEDMF
         tgA322dBE2QUROT0KnR4KSNXeqUZPQFkRC4M3h5gyeF2TgrTMGbYhX40ILZCtPKRFm4t
         piMz88diQ+SzmzxroNUr/em1nuEJS0cil4b3oraVnYuDGR92zjfE+oNQU/S8gVq+iylH
         2u1g==
X-Gm-Message-State: AOAM532r8MzpIMscuRMD67oyx32VAerjoSILHJM4zHZ5wwQsGB6EOiqt
        7siOG+62hSfvuuLo/5gLwj10Kj+0KjaE30vUNdI=
X-Google-Smtp-Source: ABdhPJy0WX4lLPLxND4/HFVgGNXBRjQ/mNfR3/MJa/8m1ZFFUa3yeWLUsZ7eZkSrg37tWk3VIErSVNQvG4LUauD3Wv4=
X-Received: by 2002:a05:6830:1f12:: with SMTP id u18mr14241509otg.132.1618963059489;
 Tue, 20 Apr 2021 16:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-30-lee.jones@linaro.org> <dfb153eb-53cc-ad27-2114-c0db07610a60@amd.com>
In-Reply-To: <dfb153eb-53cc-ad27-2114-c0db07610a60@amd.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 20 Apr 2021 19:57:28 -0400
Message-ID: <CADnq5_PUK_cGJ+x5rx7bTpWq1iSqYKp5QqiTXRgwoucw1WPQng@mail.gmail.com>
Subject: Re: [PATCH 29/40] drm/amd/amdgpu/amdgpu_fence: Provide description
 for 'sched_score'
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Lee Jones <lee.jones@linaro.org>, David Airlie <airlied@linux.ie>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Jerome Glisse <glisse@freedesktop.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
        Alex Deucher <alexander.deucher@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Applied.  Thanks!

Alex

On Fri, Apr 16, 2021 at 11:52 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 16.04.21 um 16:37 schrieb Lee Jones:
> > Fixes the following W=3D1 kernel build warning(s):
> >
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:444: warning: Function para=
meter or member 'sched_score' not described in 'amdgpu_fence_driver_init_ri=
ng'
> >
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Jerome Glisse <glisse@freedesktop.org>
> > Cc: amd-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_fence.c
> > index 47ea468596184..30772608eac6c 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > @@ -434,6 +434,7 @@ int amdgpu_fence_driver_start_ring(struct amdgpu_ri=
ng *ring,
> >    *
> >    * @ring: ring to init the fence driver on
> >    * @num_hw_submission: number of entries on the hardware queue
> > + * @sched_score: optional score atomic shared with other schedulers
> >    *
> >    * Init the fence driver for the requested ring (all asics).
> >    * Helper function for amdgpu_fence_driver_init().
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
