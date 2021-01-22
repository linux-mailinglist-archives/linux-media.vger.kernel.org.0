Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D686930047B
	for <lists+linux-media@lfdr.de>; Fri, 22 Jan 2021 14:47:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727877AbhAVNqG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 08:46:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727764AbhAVNp5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 08:45:57 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0227AC061788
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 05:45:17 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id q205so5944629oig.13
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 05:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uByiq5cbxTpSuvq2dpFMAGIUx/D6lyIcvK4e7oH4Et0=;
        b=Rao+LsSodoixu1h+xH5TQKiHUjloJupKyKmRSVnDWWqHgbaAzIDOMlxrwy8NO0jg/S
         OpKWhxRVo/EYlQPUsSzGXQ3mCS0f4cqqquoTwQX0M5jkqLEIGDJYWZQCkaHw1bZuxiJS
         THW5aGICustUhVdocuMhwIvJE04QhFmnVEM7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uByiq5cbxTpSuvq2dpFMAGIUx/D6lyIcvK4e7oH4Et0=;
        b=FQeBcYN5xCNm3Etgdt9BfMFEoG1IYc0ZS7ob7yJiccywoYmY/bP5rOw2OlcYSWsB/B
         yX+IUoFcfAo22jMii1JR4OpmcxT9N6BCgXXC/fU68n17yPkB4Q2n5BZRBsoUgfXfccfq
         vEE/9v/eX0FR5oLH6/pjDUakCH6NlJLThVWSkVayWQWqUYVTX1G3vsLa4DIHd7Ksb/DI
         Y8/zkPFrAM6yA/FdJAPFTe8wiwgzCsZ79xlJVqXlo1ikBPuvDLKZTtHQb5GPEs9kS77b
         nuevsvApwN6CCBlVNP+yXL6ADatP6kQiCUq6Qio+yOEH4RYWFu6Lwl+CFf4opbv5WhGE
         hggw==
X-Gm-Message-State: AOAM530l5FMvTbAQir4DtEWRb/NXV7fwBq00XXq1l1UPGeaoQ6oDDupr
        zZBbqX2QfY9DTsC6HVZh12uyPEUK89WOBU0JpFOmKQ==
X-Google-Smtp-Source: ABdhPJxz3O350DQ11ZlOU6GmrY3buaxmy6LR/RtW9IFfVrOcib3cNaKEJhK8wAgnqyB7AOn3634+wOz8pj0ozrIb0Ew=
X-Received: by 2002:aca:ad92:: with SMTP id w140mr3289220oie.128.1611323116465;
 Fri, 22 Jan 2021 05:45:16 -0800 (PST)
MIME-Version: 1.0
References: <20210122133624.1751802-1-daniel.vetter@ffwll.ch> <2282a592-8e19-b5ae-68ba-cf1ad6dda768@gmail.com>
In-Reply-To: <2282a592-8e19-b5ae-68ba-cf1ad6dda768@gmail.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Fri, 22 Jan 2021 14:45:05 +0100
Message-ID: <CAKMK7uHAB4eBn486umdyBqMkht172kwOP1fFXhcJQw0LrH5FFw@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH] drm/todo: Add entry for moving to dma_resv_lock
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 22, 2021 at 2:40 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 22.01.21 um 14:36 schrieb Daniel Vetter:
> > Requested by Thomas. I think it justifies a new level, since I tried
> > to make some forward progress on this last summer, and gave up (for
> > now). This is very tricky.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > ---
> >   Documentation/gpu/todo.rst | 19 +++++++++++++++++++
> >   1 file changed, 19 insertions(+)
> >
> > diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> > index dea9082c0e5f..f872d3d33218 100644
> > --- a/Documentation/gpu/todo.rst
> > +++ b/Documentation/gpu/todo.rst
> > @@ -23,6 +23,9 @@ Advanced: Tricky tasks that need fairly good understa=
nding of the DRM subsystem
> >   and graphics topics. Generally need the relevant hardware for develop=
ment and
> >   testing.
> >
> > +Expert: Only attempt these if you've successfully completed some trick=
y
> > +refactorings already and are an expert in the specific area
> > +
> >   Subsystem-wide refactorings
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> >
> > @@ -168,6 +171,22 @@ Contact: Daniel Vetter, respective driver maintain=
ers
> >
> >   Level: Advanced
> >
> > +Move Buffer Object Locking to dma_resv_lock()
> > +---------------------------------------------
> > +
> > +Many drivers have their own per-object locking scheme, usually using
> > +mutex_lock(). This causes all kinds of trouble for buffer sharing, sin=
ce
> > +depending which driver is the exporter and importer, the locking hiera=
rchy is
> > +reversed.
> > +
> > +To solve this we need one standard per-object locking mechanism, which=
 is
> > +dma_resv_lock(). This lock needs to be called as the outermost lock, w=
ith all
> > +other driver specific per-object locks removed. The problem is tha rol=
ling out
> > +the actual change to the locking contract is a flag day, due to struct=
 dma_buf
> > +buffer sharing.
> > +
> > +Level: Expert
> > +
>
> Could you name some examples of driver locks here? I'm not aware in
> anything like this in amdgpu, radeon or neveau.

ttm based drivers are all fine. It's everything else which is a
problem, and it gets worse if you mix helpers (like shmem helpers,
which have their own locks internally) with render drivers (again with
their own mutexes).

> And yes sounds like a job for the appropriate driver maintainer.

The problem is, this one you can't do driver-by-driver because of the
dma-buf contract. I mean we tried for p2p at first, it's just too
much. I tried to do it last summer just for shmem gem helpers, and you
really have to tackle all the drivers in one go (even if you ignore
dma-buf for now, where we side-stepped the problem with pinning). This
is "scares danvet" levels of nasty.
-Daniel

> Thanks,
> Christian.
>
> >   Convert logging to drm_* functions with drm_device paramater
> >   ------------------------------------------------------------
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
