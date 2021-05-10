Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9303798B5
	for <lists+linux-media@lfdr.de>; Mon, 10 May 2021 23:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231374AbhEJVDv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 May 2021 17:03:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231193AbhEJVDu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 May 2021 17:03:50 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEE96C061574;
        Mon, 10 May 2021 14:02:44 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id d25-20020a0568300459b02902f886f7dd43so2262801otc.6;
        Mon, 10 May 2021 14:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3cBBZkePd5gfKATN60V4QwGBhUGNtLUNcw+1xoOiiZs=;
        b=S2lsNjatPX3UKOV5pkxnIgd2tRdEDE1F/mJYBW1mBH0XTLW23kTgYMfvEuqFgWgCcG
         GpeN7skQ8HRDLyzonMznUF4k4KFu9cRWv9zQBbCtBdxybb7lS7+cyIM8ceLQvVpqebto
         Ta+XIA3rtvSzNn4QMP/U5sGbl11s41Entls7NMUUyS7wgK8ENv7EKgBBvrS2SLGEeu/q
         d1IQpmZRoZCDXEKRI0odbDo0kwhcdmT8MQOmT+KdCYBwpXFOZgoUV4JgLhmcnri/7V1S
         Spb/pP0HPKxZnPu9b/Ufuha9NG2NpU2UJiquIBsEYYnlWwNWoBWkSs0Wbz2Mx2SUicRq
         3rdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3cBBZkePd5gfKATN60V4QwGBhUGNtLUNcw+1xoOiiZs=;
        b=fi9BjZjl/jtrlaMzz5n9jkJsTfAUfLmbn0nEQ05awh0fwXS/qxudJo8z2jYqs9XZAH
         Jg9aUM+Q/szIJkPAy7Q3rwp8nYBDvXq0PI7EnX8o/iObDZCnJHVnuGVUN28behUE3au8
         a5SBIv2orWxXPokt50Yg/SsLC9LKjubnRZ9QjaYqv3OQL+Cyg/5aR1XG8PGfhUsvGGLD
         f10ggyC99JdcC9KtGX5IcgLqKnyMe6o465GT4rc+rYXWvOGdx5pPT/lSDaJNWRM55k3H
         9BTr0fvHsVnBiS6s7DrwUjLbLbB0MD07UZTqzio3GMu1zCJnBUZmebOZcP+Lq02euB1+
         Yuhg==
X-Gm-Message-State: AOAM531RN8pgElKcC4s7QuTf1TtNZLeAtyt18K0w4oZ/BdUt0zVCI5IY
        8OL+Mszo3Oo+obpqy+2REcw4G9pFnbkLuwCuz2g=
X-Google-Smtp-Source: ABdhPJw7DyKD1Lyyq9S41EMv+Yyu/ErA9AViQoXtkzjglGNF7HKdlfnp86mEla//UDe5eTZlAP0X/kMW5Kco3byONpk=
X-Received: by 2002:a9d:51c6:: with SMTP id d6mr16637610oth.311.1620680564170;
 Mon, 10 May 2021 14:02:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210509144923.6316-1-dwaipayanray1@gmail.com> <2c5387b7-2fa1-9b5a-c671-806429b463aa@amd.com>
In-Reply-To: <2c5387b7-2fa1-9b5a-c671-806429b463aa@amd.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 10 May 2021 17:02:32 -0400
Message-ID: <CADnq5_NXXD1K6kb0Jr8P5DPGcHRMo0jQTC+y2n4-4sfZY12pyA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/amdgpu: Fix errors in function documentation
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Dwaipayan Ray <dwaipayanray1@gmail.com>,
        "Deucher, Alexander" <alexander.deucher@amd.com>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Applied.  Thanks!

Alex

On Sun, May 9, 2021 at 12:30 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 09.05.21 um 16:49 schrieb Dwaipayan Ray:
> > Fix a couple of syntax errors and removed one excess
> > parameter in the function documentations which lead
> > to kernel docs build warning.
> >
> > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 3 +++
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 1 -
> >   2 files changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ras.c
> > index ae9fb2025259..312f24004413 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > @@ -320,11 +320,14 @@ static int amdgpu_ras_debugfs_ctrl_parse_data(str=
uct file *f,
> >    * "disable" requires only the block.
> >    * "enable" requires the block and error type.
> >    * "inject" requires the block, error type, address, and value.
> > + *
> >    * The block is one of: umc, sdma, gfx, etc.
> >    *  see ras_block_string[] for details
> > + *
> >    * The error type is one of: ue, ce, where,
> >    *  ue is multi-uncorrectable
> >    *  ce is single-correctable
> > + *
> >    * The sub-block is a the sub-block index, pass 0 if there is no sub-=
block.
> >    * The address and value are hexadecimal numbers, leading 0x is optio=
nal.
> >    *
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_vm.c
> > index 16252d48e5a4..7e1a67295106 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > @@ -2796,7 +2796,6 @@ long amdgpu_vm_wait_idle(struct amdgpu_vm *vm, lo=
ng timeout)
> >    *
> >    * @adev: amdgpu_device pointer
> >    * @vm: requested vm
> > - * @vm_context: Indicates if it GFX or Compute context
> >    * @pasid: Process address space identifier
> >    *
> >    * Init @vm fields.
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
