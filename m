Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E8743662C3
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 02:02:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234382AbhDUAC2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 20:02:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233992AbhDUAC1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 20:02:27 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21BEDC06174A;
        Tue, 20 Apr 2021 17:01:55 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id c8-20020a9d78480000b0290289e9d1b7bcso23371811otm.4;
        Tue, 20 Apr 2021 17:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=n1Y9JenQmqq/jFrbUY+vR+8982Oh/0y41VMP20Nx67g=;
        b=bhh6P6p5q0Lyp1rL2pguKRojM04jiK6qIibAFK1ZeHz4Mv7HuiZtaBqALKt8MJzQ+f
         HCwUUiNZ6rzrTxS7Y1GVieHwse9fyWl430AsMCywZNg4VLK4lBSnHDLGwPjNn6GlJ6DJ
         1cj+Y54wCPsxaVxUfJZOIsWw16oWtxQfMuPq8YpXV0foQgkt7EYkCWZeAFt+GZ8DBCMU
         r5kQ2NOgALBONmQxfACjkHer1CAfz4ny0aHyabbGJE4yYY2WHax98H9cNyxzGJsDGoJJ
         4y8eB54/hhFt8UzhZG3mJsPW76CtXowh++/nJf8/P1s57SXMh1lKdki6lfNA67mEx2sg
         7gXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=n1Y9JenQmqq/jFrbUY+vR+8982Oh/0y41VMP20Nx67g=;
        b=MlgDGa7KF8wPrKhZSTJh9mESpRUwEd/t8R3SXDfBKKjCLuUG71ViOO1uAPV5q0itnr
         j06JUEK2wUgtgmkYWv1TRTO6wcp5ChXNZxL2B1jkjUf+Ja2g/7KHK+T3Mg5g8Mymv5Dk
         SRHkxl6ocdQQzRGm/AgvZNAc4756AfPoicD9IGtxCT4qZvPzabZ7VouI+k+/kayd5NbM
         tolql8wTPSObMKjZzwtvB732GZhwghH1WZIs1r958GfxQ4s4Z3Cgv3CUEdiCKCNbTtgM
         e1JkrjSw7oyuCbXic0C+/RvMivOlJ2pbomeXEVJv2eYKltx/Zyk4hktWEF7FXbrAkI3C
         IsVg==
X-Gm-Message-State: AOAM530BLwp/Y6GsmxdRxq3zKKQPNSoBc+Eb/zzVXFDlKnEzqun/RrKK
        pEmVDknsoiies3zdonR61TZCTLXiCDB1kagc+S0=
X-Google-Smtp-Source: ABdhPJxRmv0oaIQ8o8neeJ0EYrxNDJhIjGMeVuNsDPG6BueZp+kvjrvsztKO5sPtvnLnvKUbLNRWoTOmkOrtfFEhMcw=
X-Received: by 2002:a9d:75c4:: with SMTP id c4mr19093574otl.311.1618963314628;
 Tue, 20 Apr 2021 17:01:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-34-lee.jones@linaro.org> <d44d2325-4cba-2927-d5e9-1d8e0ab1649c@amd.com>
In-Reply-To: <d44d2325-4cba-2927-d5e9-1d8e0ab1649c@amd.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 20 Apr 2021 20:01:43 -0400
Message-ID: <CADnq5_MH0FxYrr7FJEN-t_jF0-noRA3M7pRD5SROrpjOOZt8CQ@mail.gmail.com>
Subject: Re: [PATCH 33/40] drm/amd/amdgpu/amdgpu_ring: Provide description for 'sched_score'
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Lee Jones <lee.jones@linaro.org>, David Airlie <airlied@linux.ie>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
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

On Fri, Apr 16, 2021 at 11:54 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 16.04.21 um 16:37 schrieb Lee Jones:
> > Fixes the following W=3D1 kernel build warning(s):
> >
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:169: warning: Function param=
eter or member 'sched_score' not described in 'amdgpu_ring_init'
> >
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: amd-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_ring.c
> > index 688624ebe4211..7b634a1517f9c 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> > @@ -158,6 +158,7 @@ void amdgpu_ring_undo(struct amdgpu_ring *ring)
> >    * @irq_src: interrupt source to use for this ring
> >    * @irq_type: interrupt type to use for this ring
> >    * @hw_prio: ring priority (NORMAL/HIGH)
> > + * @sched_score: optional score atomic shared with other schedulers
> >    *
> >    * Initialize the driver information for the selected ring (all asics=
).
> >    * Returns 0 on success, error on failure.
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
