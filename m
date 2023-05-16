Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4316704FA8
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 15:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233729AbjEPNnm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 09:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233657AbjEPNnl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 09:43:41 -0400
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4480B59E6
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 06:43:40 -0700 (PDT)
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-55293697882so896397eaf.0
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 06:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684244619; x=1686836619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MNDS3X2rHZf3sL9RvpDtqqqmEvoK2Fx0XI17YW4oQ6Y=;
        b=iC9Hof1RuzRecyJIDDdI0yOsOfQOhQRq2EBkhJMutXKM7rlWPTStfNC4LHCyafK9q0
         wYeIaINHKL3e3ZuSM2QrpNyRy448cwLou2QWUrZCCzjY7A8FY6TdKTVdnuYWhDjgL57h
         NDgJQyXPhScY7l8/wVM6gE6J9Qu0FUspuH6vm6oD+8tWyUsrDJxTypSRQng0NdL10L/9
         Sccwhf7uqcPiDI0UXYmvNlj50vZ6NRKOFdekSSi1TFwNzkQhDTO2abd4OnI7/qDWYPXF
         IhapqCoZV1J6uWInZH2cIXPuRGAHHnvWo2y54oTG2OVV/XOHLK3mQPcDW1/8fa3sQ8jP
         AYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684244619; x=1686836619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MNDS3X2rHZf3sL9RvpDtqqqmEvoK2Fx0XI17YW4oQ6Y=;
        b=lfXRL7YmQtbl0Os9W3zg9rjZLgaoypTeKyGXNN+zauZtyIrpXbhDIgUaqye7/acUpe
         3oYBYYQnaarUpevsvoTOx4zAGsBbI9cCptszsd0vYeLAWsnC2HRXc6cVcQOVXw7UREvP
         u6IxzHF88iV4LyH/CZz19sf6cioXJLeATKQi7XrSpDd5AiH7pLxitvNKjnE1JzIyGqiR
         v0DaHiQIGOjBZcMkt+cLy0iOjAU5TDLJeAig4P9Vu1DRcIvpQAXaibtIhSpadRJwz5dZ
         c/RumSSKHZ8iuQqGEjTEJ6RF/GIveXDPVZdfxqRlIho4Jq+TDXvciFoISRr4qzWRyrPo
         aNog==
X-Gm-Message-State: AC+VfDwimgWPQ8AISvpj99GSxuAFFopVUIoIDrQ/wS5YnE1CtKXX7GF7
        lPK4bizywyaqyanIyPE9de5hLmXJhLEJa7kgmWb9wlC1
X-Google-Smtp-Source: ACHHUZ6RKrjDlM0Mb/+pcQN0RJSb4OCFLp9HAkUXJmi8j2zCPLht+6LlrLPl7FWnxnxj/+fMIY+zfqxmrIfzS39ZbXY=
X-Received: by 2002:a4a:6c54:0:b0:54f:53f5:b1ea with SMTP id
 u20-20020a4a6c54000000b0054f53f5b1eamr11100353oof.8.1684244619385; Tue, 16
 May 2023 06:43:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230503231507.279172-1-sukrut.bellary@linux.com> <0df418ad-3492-4241-1837-55ed89b77e10@linux.com>
In-Reply-To: <0df418ad-3492-4241-1837-55ed89b77e10@linux.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 16 May 2023 09:43:28 -0400
Message-ID: <CADnq5_NVEZ5cC3JMtJu5MFWSL+3rApgKyC0XJKVEHvKSeDrB0w@mail.gmail.com>
Subject: Re: [PATCH] drm:amd:amdgpu: Fix missing buffer object unlock in
 failure path
To:     Sukrut Bellary <sukrut.bellary@linux.com>
Cc:     alexander.deucher@amd.com, christian.koenig@amd.com,
        airlied@gmail.com, daniel@ffwll.ch, Xinhui.Pan@amd.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, ray.huang@amd.com,
        amd-gfx@lists.freedesktop.org, Jiadong.Zhu@amd.com,
        sumit.semwal@linaro.org, Hawking.Zhang@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Applied.  Thanks!

Alex

On Mon, May 15, 2023 at 6:27=E2=80=AFPM Sukrut Bellary <sukrut.bellary@linu=
x.com> wrote:
>
>
> On 5/3/23 16:15, Sukrut Bellary wrote:
> > smatch warning -
> > 1) drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:3615 gfx_v9_0_kiq_resume()
> > warn: inconsistent returns 'ring->mqd_obj->tbo.base.resv'.
> >
> > 2) drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:6901 gfx_v10_0_kiq_resume()
> > warn: inconsistent returns 'ring->mqd_obj->tbo.base.resv'.
> >
> > Signed-off-by: Sukrut Bellary <sukrut.bellary@linux.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 4 +++-
> >  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c  | 4 +++-
> >  2 files changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/a=
md/amdgpu/gfx_v10_0.c
> > index 8bd07ff59671..66d5c5d68454 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> > @@ -6891,8 +6891,10 @@ static int gfx_v10_0_kiq_resume(struct amdgpu_de=
vice *adev)
> >               return r;
> >
> >       r =3D amdgpu_bo_kmap(ring->mqd_obj, (void **)&ring->mqd_ptr);
> > -     if (unlikely(r !=3D 0))
> > +     if (unlikely(r !=3D 0)) {
> > +             amdgpu_bo_unreserve(ring->mqd_obj);
> >               return r;
> > +     }
> >
> >       gfx_v10_0_kiq_init_queue(ring);
> >       amdgpu_bo_kunmap(ring->mqd_obj);
> > diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/am=
d/amdgpu/gfx_v9_0.c
> > index bce6919d666a..d5715d8a4128 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> > @@ -3617,8 +3617,10 @@ static int gfx_v9_0_kiq_resume(struct amdgpu_dev=
ice *adev)
> >               return r;
> >
> >       r =3D amdgpu_bo_kmap(ring->mqd_obj, (void **)&ring->mqd_ptr);
> > -     if (unlikely(r !=3D 0))
> > +     if (unlikely(r !=3D 0)) {
> > +             amdgpu_bo_unreserve(ring->mqd_obj);
> >               return r;
> > +     }
> >
> >       gfx_v9_0_kiq_init_queue(ring);
> >       amdgpu_bo_kunmap(ring->mqd_obj);
>
> Follow-up.
> Could you please review this patch?
>
>
> --
> Regards,
> Sukrut
