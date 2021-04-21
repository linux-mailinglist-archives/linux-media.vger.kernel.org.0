Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAF253662D2
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 02:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234490AbhDUADs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 20:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234382AbhDUADr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 20:03:47 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B50EBC06174A;
        Tue, 20 Apr 2021 17:03:14 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id v6so12933154oiv.3;
        Tue, 20 Apr 2021 17:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Bzy1XVE3pX0bVpKOU6c03egp1B/YRIMRasUEXcl28pk=;
        b=eNf8Vlth2r1UW49M5oiMWsxxA5rquUjZ4/tvhLU4tG/VqdFuTA23WEYoCYEPiWwojd
         pK7VH0dAxzg8HoUhPEYc34kcMGPoRnjDfxZ10z0Rb7JGr0ADasV9Yv0hzxfu3RgUdOLt
         dA5wZIPtMBkcCGPekzDf7yY6SeG1pOtonesHDK4hS7JENAIBGmMXyg8s0o42+im98IpX
         1eedA3m2ekpWbbeTIYKiMxPzvZmn/fYbl8nJV/4GE1JuIa4o0Iw0QgHCn2hI4/7h7aYY
         EjGBKooscnyqyWu6GBIqfe0EFPBtbOw4ruc0Fpex6ctQ0k5SLiTUURkl+jtzCpeWRwHd
         9JNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Bzy1XVE3pX0bVpKOU6c03egp1B/YRIMRasUEXcl28pk=;
        b=UswiiyU2DR4e1R/xBlBcrJ/wFo0xFaYJDjU76woSMofZBmL2pzkB2q061kHP1OFaT8
         JGk5MdB4M03t7R87tsUoaIPPYMVBYYx62xX33PLW37RljhM6ISiVX06G2T0QdDjBmdOx
         qAsOqPad8xMekQRHnEwl8OdJ2ingxHw1+Vvdr1GDGUoXRkX6fmx5T+m3vVXzveMRXeja
         jaK654UrXvbyXrTuzsZPNysErte3XBzqD7ZA00mUi9aMulblwBVyYQpSG+L4kAl+Km2x
         Jls7lpaZLCqWdVQYHDW9xeJ0VnskNjegTSqbbe2sNE+lWzGqjFSevDKl/YLvTCGQayPb
         7TCw==
X-Gm-Message-State: AOAM533QF49QyrMYbBjX8hioZDM/5kdmFqN04PUwFK792TWSxVyBah21
        wemoKh5yT1yooYENsmn2p0FZYuEBryIGbCrZVRI=
X-Google-Smtp-Source: ABdhPJy+DqK7M4J1LuG62c3cPuiea8egSrJJt94kyNl27+TAnlda55H4l4jGWLJr2QzKApIH+mn+qXtI134+dclonow=
X-Received: by 2002:a05:6808:68a:: with SMTP id k10mr4882531oig.120.1618963394237;
 Tue, 20 Apr 2021 17:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-36-lee.jones@linaro.org> <59a21fb5-224e-882f-5d2f-e337e78eb7db@amd.com>
In-Reply-To: <59a21fb5-224e-882f-5d2f-e337e78eb7db@amd.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 20 Apr 2021 20:03:03 -0400
Message-ID: <CADnq5_MHCpUPR764FNp-A8_9xQhq1tTHAXkRc0foAKqKRFyaAw@mail.gmail.com>
Subject: Re: [PATCH 35/40] drm/amd/amdgpu/amdgpu_cs: Repair some function
 naming disparity
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

On Fri, Apr 16, 2021 at 11:54 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 16.04.21 um 16:37 schrieb Lee Jones:
> > Fixes the following W=3D1 kernel build warning(s):
> >
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:685: warning: expecting protot=
ype for cs_parser_fini(). Prototype was for amdgpu_cs_parser_fini() instead
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:1502: warning: expecting proto=
type for amdgpu_cs_wait_all_fence(). Prototype was for amdgpu_cs_wait_all_f=
ences() instead
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:1656: warning: expecting proto=
type for amdgpu_cs_find_bo_va(). Prototype was for amdgpu_cs_find_mapping()=
 instead
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
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_cs.c
> > index b5c7669980458..90136f9dedd65 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > @@ -672,7 +672,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_pa=
rser *p)
> >   }
> >
> >   /**
> > - * cs_parser_fini() - clean parser states
> > + * amdgpu_cs_parser_fini() - clean parser states
> >    * @parser: parser structure holding parsing context.
> >    * @error:  error number
> >    * @backoff:        indicator to backoff the reservation
> > @@ -1488,7 +1488,7 @@ int amdgpu_cs_fence_to_handle_ioctl(struct drm_de=
vice *dev, void *data,
> >   }
> >
> >   /**
> > - * amdgpu_cs_wait_all_fence - wait on all fences to signal
> > + * amdgpu_cs_wait_all_fences - wait on all fences to signal
> >    *
> >    * @adev: amdgpu device
> >    * @filp: file private
> > @@ -1639,7 +1639,7 @@ int amdgpu_cs_wait_fences_ioctl(struct drm_device=
 *dev, void *data,
> >   }
> >
> >   /**
> > - * amdgpu_cs_find_bo_va - find bo_va for VM address
> > + * amdgpu_cs_find_mapping - find bo_va for VM address
> >    *
> >    * @parser: command submission parser context
> >    * @addr: VM address
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
