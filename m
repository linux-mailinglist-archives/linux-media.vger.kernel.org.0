Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6360321C7F
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 17:12:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231210AbhBVQMB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 11:12:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231698AbhBVQL0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 11:11:26 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91347C061574
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:10:44 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id b16so12482582otq.1
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nA2zu/27Qi+zi0Et6iwYKYiIXci1LR0Ph/voW46JRKs=;
        b=Lvgt3D9Yk8J9R7i0e+I32K+s+wYx6UyRDEDWCE/bMJmCsH16gBXH2f83pXVXwYA96Z
         n3yCZiWMm6g6WFxSl+Q9u8VB6i0eyG9fgRCRzFhb1I/MPcFlYSN+WXZbjQiuRyrm9E3t
         rDsRaFCpFGVSjd3dF7FGcLMV0O+re3+VGBPtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nA2zu/27Qi+zi0Et6iwYKYiIXci1LR0Ph/voW46JRKs=;
        b=mDELfOv/nuDxvijwMXqlKv4CJ9znXwNNQrpbdSagvXSmrGKHQzgeLpMPBa5z2zZraj
         B4HvtofGC1hudrf3tOaj4Uy+qfGTzvFqdk9HJaMHA8u/yGyzp1DyBbQjaR/FCzVnkhPw
         Fc4UVcg8QB23GcrkhitDMGjQPmeaLUVBt+FRqTALXszw9h2lpF7g5A2/oHlfE8lv5Jnm
         0cd5TvR6TBXOk8aYg9U9/PC6tF+R3IbO3JNxKrkft3LS8o0kAAkvRl1w8HUeSDHSdwag
         Adp+7SMZP3EqDW7uahFiN7gfgi+ybrfIxKMfKoPyVwkXnatERoOPF+q5dbaTuFh65jQs
         UJ4g==
X-Gm-Message-State: AOAM531VMDiV3gnPax9Szboy7hbKgUUx+EBKul81KoWHpfnH39sr2+NQ
        sKSeuzSxqMQX+KPUtzJ+AekCxG/YE65g3BIACHgHMw==
X-Google-Smtp-Source: ABdhPJy5VMzYav92la4GbCVrRLqsfbuxuE4lRo22hdHDCFSLUd3Jl9Lu7Ldt3nTSfwxRv+k1huhJ5OLliDo8pDe3AfM=
X-Received: by 2002:a9d:b85:: with SMTP id 5mr17812907oth.281.1614010242515;
 Mon, 22 Feb 2021 08:10:42 -0800 (PST)
MIME-Version: 1.0
References: <20210222124328.27340-1-tzimmermann@suse.de> <b190801b-b8be-c9df-f203-3e42eb97cea4@amd.com>
 <238ce852-730b-e31c-a6fe-a9ecaca497e3@suse.de>
In-Reply-To: <238ce852-730b-e31c-a6fe-a9ecaca497e3@suse.de>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Mon, 22 Feb 2021 17:10:31 +0100
Message-ID: <CAKMK7uE4QxaiGCAX6pYq=dCg5zzs9Jg9iRSjq893OmAZk=OrpA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] drm/prime: Only call dma_map_sgtable() for devices
 with DMA support
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Dave Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Qiang Yu <yuq825@gmail.com>, Rob Herring <robh@kernel.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Steven Price <steven.price@arm.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        "Anholt, Eric" <eric@anholt.net>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        lima@lists.freedesktop.org,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 22, 2021 at 2:24 PM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
>
> Hi
>
> Am 22.02.21 um 14:09 schrieb Christian K=C3=B6nig:
> >
> >
> > Am 22.02.21 um 13:43 schrieb Thomas Zimmermann:
> >> USB-based drivers cannot use DMA, so the importing of dma-buf attachme=
nts
> >> currently fails for udl and gm12u320. This breaks joining/mirroring of
> >> displays.
> >>
> >> The fix is now a little series. To solve the issue on the importer
> >> side (i.e., the affected USB-based driver), patch 1 introduces a new
> >> PRIME callback, struct drm_driver.gem_prime_create_object, which creat=
es
> >> an object and gives more control to the importing driver. Specifically=
,
> >> udl and gm12u320 can now avoid the creation of a scatter/gather table
> >> for the imported pages. Patch 1 is self-contained in the sense that it
> >> can be backported into older kernels.
> >
> > Mhm, that sounds like a little overkill to me.
> >
> > Drivers can already import the DMA-bufs all by them selves without the
> > help of the DRM functions. See amdgpu for an example.
> >
> > Daniel also already noted to me that he sees the DRM helper as a bit
> > questionable middle layer.
>
> And this bug proves that it is. :)

The trouble here is actually gem_bo->import_attach, which isn't really
part of the questionable midlayer, but fairly mandatory (only
exception is vmwgfx because not using gem) caching to make sure we
don't end up with duped imports and fun stuff like that.

And dma_buf_attach now implicitly creates the sg table already, so
we're already in game over land. I think we'd need to make
import_attach a union with import_buf or something like that, so that
you can do attachment-less importing.

> > Have you thought about doing that instead?
>
> There appears to be some useful code in drm_gem_prime_import_dev(). But
> if the general sentiment goes towards removing
> gem_prime_import_sg_table, we can work towards that as well.

I still think this part is a bit a silly midlayer for no good reason,
but I think that's orthogonal to the issue at hand here.

I'd suggest we first try to paper over the issue by using
prime_import_dev with the host controller (which hopefully is
dma-capable for most systems). And then, at leisure, try to untangle
the obj->import_attach issue.
-Daniel

>
> Best regards
> Thomas
>
> >
> > Christian.
> >
> >>
> >> Patches 2 and 3 update SHMEM and CMA helpers to use the new callback.
> >> Effectively this moves the sg table setup from the PRIME helpers into
> >> the memory managers. SHMEM now supports devices without DMA support,
> >> so custom code can be removed from udl and g12u320.
> >>
> >> Tested by joining/mirroring displays of udl and radeon under Gnome/X11=
.
> >>
> >> v2:
> >>     * move fix to importer side (Christian, Daniel)
> >>     * update SHMEM and CMA helpers for new PRIME callbacks
> >>
> >> Thomas Zimmermann (3):
> >>    drm: Support importing dmabufs into drivers without DMA
> >>    drm/shmem-helper: Implement struct drm_driver.gem_prime_create_obje=
ct
> >>    drm/cma-helper: Implement struct drm_driver.gem_prime_create_object
> >>
> >>   drivers/gpu/drm/drm_gem_cma_helper.c    | 62 ++++++++++++++---------=
--
> >>   drivers/gpu/drm/drm_gem_shmem_helper.c  | 38 ++++++++++-----
> >>   drivers/gpu/drm/drm_prime.c             | 43 +++++++++++------
> >>   drivers/gpu/drm/lima/lima_drv.c         |  2 +-
> >>   drivers/gpu/drm/panfrost/panfrost_drv.c |  2 +-
> >>   drivers/gpu/drm/panfrost/panfrost_gem.c |  6 +--
> >>   drivers/gpu/drm/panfrost/panfrost_gem.h |  4 +-
> >>   drivers/gpu/drm/pl111/pl111_drv.c       |  8 ++--
> >>   drivers/gpu/drm/v3d/v3d_bo.c            |  6 +--
> >>   drivers/gpu/drm/v3d/v3d_drv.c           |  2 +-
> >>   drivers/gpu/drm/v3d/v3d_drv.h           |  5 +-
> >>   include/drm/drm_drv.h                   | 12 +++++
> >>   include/drm/drm_gem_cma_helper.h        | 12 ++---
> >>   include/drm/drm_gem_shmem_helper.h      |  6 +--
> >>   14 files changed, 120 insertions(+), 88 deletions(-)
> >>
> >> --
> >> 2.30.1
> >>
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
