Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3260E3D0D5E
	for <lists+linux-media@lfdr.de>; Wed, 21 Jul 2021 13:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237527AbhGUKkq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Jul 2021 06:40:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238854AbhGUJus (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Jul 2021 05:50:48 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E2A3C0613E2
        for <linux-media@vger.kernel.org>; Wed, 21 Jul 2021 03:29:16 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id o17-20020a9d76510000b02903eabfc221a9so1666537otl.0
        for <linux-media@vger.kernel.org>; Wed, 21 Jul 2021 03:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=h417+5Nn2Pgd6WA/rkzrOB7f5qZl0K/oFZRySnon6fM=;
        b=dP5y0SRwrB1hjw/MVYi14vnTeaxW3RWgNT4XKLVwLQTSLYGNhUM8B/5tUKn/AjmG/e
         87Dgni6usuZj0Gwd26LtGaiVnfb+Nb3LcfIks58zLNCluPjUgZ07/vDQPpH5UsVcLJnm
         DUBHIuwtqCITyO6+jd9Nl3a1Uz9J2CkocvlKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=h417+5Nn2Pgd6WA/rkzrOB7f5qZl0K/oFZRySnon6fM=;
        b=ec9Dsj0T5MRINQOQwSir2j9XyyoPHUuFxq79zYk5U8Jnfjr+tsdTpuktxhWkLKDMaa
         xAy7xoyJtY/S8+dLx5IcQU37nE9GOgFDp3Uvhp0L/g/7YPTXDTR0wMbhz/fUZ+a4vX01
         1QziL6kelEcDoZPfl21r/qP93qDrd73BrJNbH9WNaiJwv34NbRQEvFhJpLvTlX8aZyfy
         IYjoU8wtSs2RZ/GWtFlnJAG2bSR5lhC8o02MUFYRiRAGrD/sbpoXhiQPRhLWi0Vse8qq
         Q+Hekewlep0o6D215kSnBxzahamd747+4dWBr7ZpSucCXEK48t1LIVQxGDZY5qEeE7l6
         KMXw==
X-Gm-Message-State: AOAM531NwDt1Au7PuKXTKixuG6IEbgke07qWgPw0Of/SeTmndHZs4mg/
        oAfn63nDmMjnbJZr2ByhOnLT1z4gExfA0qhZyoNKaA==
X-Google-Smtp-Source: ABdhPJxnsfA3n87/jWpR0qUhPsWBSfRhmjyGwC0ANDR9tMSbPA64GLPwtsPMaBOTIwvd+I7FHsCQ2NOVZZiPWLN/Uko=
X-Received: by 2002:a05:6830:2802:: with SMTP id w2mr24416395otu.303.1626863355405;
 Wed, 21 Jul 2021 03:29:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210712043508.11584-1-desmondcheongzx@gmail.com>
 <YPcU3wJK7kC5b7kv@phenom.ffwll.local> <50c5582b-c674-4ef8-585f-7a3d78a49f85@gmail.com>
In-Reply-To: <50c5582b-c674-4ef8-585f-7a3d78a49f85@gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 21 Jul 2021 12:29:04 +0200
Message-ID: <CAKMK7uGvb3O9Ypd73xZf6bdMcXJyGJw4C7GXGprkZLpN9Gx7qQ@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] drm: address potential UAF bugs with drm_master ptrs
To:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dave Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Emil Velikov <emil.l.velikov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 21, 2021 at 6:12 AM Desmond Cheong Zhi Xi
<desmondcheongzx@gmail.com> wrote:
> On 21/7/21 2:24 am, Daniel Vetter wrote:
> > On Mon, Jul 12, 2021 at 12:35:03PM +0800, Desmond Cheong Zhi Xi wrote:
> >> Hi,
> >>
> >> In the previous thread on this series we decided to remove a patch tha=
t was violating a lockdep requirement in drm_lease. In addition to this cha=
nge, I took a closer look at the CI logs for the Basic Acceptance Tests and=
 noticed that another regression was introduced. The new patch 2 is a respo=
nse to this.
> >>
> >> Overall, this series addresses potential use-after-free errors when de=
referencing pointers to struct drm_master. These were identified after one =
such bug was caught by Syzbot in drm_getunique():
> >> https://syzkaller.appspot.com/bug?id=3D148d2f1dfac64af52ffd27b661981a5=
40724f803
> >>
> >> The series is broken up into five patches:
> >>
> >> 1. Move a call to drm_is_current_master() out from a section locked by=
 &dev->mode_config.mutex in drm_mode_getconnector(). This patch does not ap=
ply to stable.
> >>
> >> 2. Move a call to drm_is_current_master() out from the RCU read-side c=
ritical section in drm_clients_info().
> >>
> >> 3. Implement a locked version of drm_is_current_master() function that=
's used within drm_auth.c.
> >>
> >> 4. Serialize drm_file.master by introducing a new spinlock that's held=
 whenever the value of drm_file.master changes.
> >>
> >> 5. Identify areas in drm_lease.c where pointers to struct drm_master a=
re dereferenced, and ensure that the master pointers are not freed during u=
se.
> >>
> >> v7 -> v8:
> >> - Remove the patch that moves the call to _drm_lease_held out from the=
 section locked by &dev->mode_config.idr_mutex in __drm_mode_object_find. T=
his patch violated an existing lockdep requirement as reported by the intel=
-gfx CI.
> >> - Added a new patch that moves a call to drm_is_current_master out fro=
m the RCU critical section in drm_clients_info. This was reported by the in=
tel-gfx CI.
> >>
> >> v6 -> v7:
> >> - Modify code alignment as suggested by the intel-gfx CI.
> >> - Add a new patch to the series that adds a new lock to serialize drm_=
file.master, in response to the lockdep splat by the intel-gfx CI.
> >> - Update drm_file_get_master to use the new drm_file.master_lock inste=
ad of drm_device.master_mutex, in response to the lockdep splat by the inte=
l-gfx CI.
> >>
> >> v5 -> v6:
> >> - Add a new patch to the series that moves the call to _drm_lease_held=
 out from the section locked by &dev->mode_config.idr_mutex in __drm_mode_o=
bject_find.
> >> - Clarify the kerneldoc for dereferencing drm_file.master, as suggeste=
d by Daniel Vetter.
> >> - Refactor error paths with goto labels so that each function only has=
 a single drm_master_put(), as suggested by Emil Velikov.
> >> - Modify comparisons to NULL into "!master", as suggested by the intel=
-gfx CI.
> >>
> >> v4 -> v5:
> >> - Add a new patch to the series that moves the call to drm_is_current_=
master in drm_mode_getconnector out from the section locked by &dev->mode_c=
onfig.mutex.
> >> - Additionally, added a missing semicolon to the patch, caught by the =
intel-gfx CI.
> >>
> >> v3 -> v4:
> >> - Move the call to drm_is_current_master in drm_mode_getconnector out =
from the section locked by &dev->mode_config.mutex. As suggested by Daniel =
Vetter. This avoids a circular lock lock dependency as reported here https:=
//patchwork.freedesktop.org/patch/440406/
> >> - Inside drm_is_current_master, instead of grabbing &fpriv->master->de=
v->master_mutex, we grab &fpriv->minor->dev->master_mutex to avoid derefere=
ncing a null ptr if fpriv->master is not set.
> >> - Modify kerneldoc formatting for drm_file.master, as suggested by Dan=
iel Vetter.
> >> - Additionally, add a file_priv->master NULL check inside drm_file_get=
_master, and handle the NULL result accordingly in drm_lease.c. As suggeste=
d by Daniel Vetter.
> >>
> >> v2 -> v3:
> >> - Move the definition of drm_is_current_master and the _locked version=
 higher up in drm_auth.c to avoid needing a forward declaration of drm_is_c=
urrent_master_locked. As suggested by Daniel Vetter.
> >> - Instead of leaking drm_device.master_mutex into drm_lease.c to prote=
ct drm_master pointers, add a new drm_file_get_master() function that retur=
ns drm_file->master while increasing its reference count, to prevent drm_fi=
le->master from being freed. As suggested by Daniel Vetter.
> >>
> >> v1 -> v2:
> >> - Move the lock and assignment before the DRM_DEBUG_LEASE in drm_mode_=
get_lease_ioctl, as suggested by Emil Velikov.
> >
> > Apologies for the delay, I missed your series. Maybe just ping next tim=
e
> > around there's silence.
> >
> > Looks all great, merged to drm-misc-next. Given how complex this was I'=
m
> > vary of just pushing this to -fixes without some solid testing.
> >
>
> Hi Daniel,
>
> Thanks for merging, more testing definitely sounds good to me.
>
> > One thing I noticed is that drm_is_current_master could just use the
> > spinlock, since it's only doing a read access. Care to type up that pat=
ch?
> >
>
> I thought about this too, but I'm not sure if that's the best solution.
>
> drm_is_current_master calls drm_lease_owner which then walks up the tree
> of master lessors. The spinlock protects the master of the current drm
> file, but subsequent lessors aren't protected without holding the
> device's master mutex.

But this isn't a fpriv->master pointer, but a master->lessor pointer.
Which should never ever be able to change (we'd have tons of uaf bugs
around drm_lease_owner otherwise). So I don't think there's anything
that dev->master_lock protects here that fpriv->master_lookup_lock
doesn't protect already?

Or am I missing something?

The comment in the struct drm_master says it's protected by
mode_config.idr_mutex, but that only applies to the idrs and lists I
think.

> > Also, do you plan to look into that idea we've discussed to flush pendi=
ng
> > access when we revoke a master or a lease? I think that would be really
> > nice improvement here.
> > -Daniel
> >
>
> Yup, now that the potential UAFs are addressed (hopefully), I'll take a
> closer look and propose a patch for this.

Thanks a lot.
-Daniel

>
> Best wishes,
> Desmond
>
> >>
> >> Desmond Cheong Zhi Xi (5):
> >>    drm: avoid circular locks in drm_mode_getconnector
> >>    drm: avoid blocking in drm_clients_info's rcu section
> >>    drm: add a locked version of drm_is_current_master
> >>    drm: serialize drm_file.master with a new spinlock
> >>    drm: protect drm_master pointers in drm_lease.c
> >>
> >>   drivers/gpu/drm/drm_auth.c      | 93 ++++++++++++++++++++++++-------=
--
> >>   drivers/gpu/drm/drm_connector.c |  5 +-
> >>   drivers/gpu/drm/drm_debugfs.c   |  3 +-
> >>   drivers/gpu/drm/drm_file.c      |  1 +
> >>   drivers/gpu/drm/drm_lease.c     | 81 +++++++++++++++++++++-------
> >>   include/drm/drm_auth.h          |  1 +
> >>   include/drm/drm_file.h          | 18 +++++--
> >>   7 files changed, 152 insertions(+), 50 deletions(-)
> >>
> >> --
> >> 2.25.1
> >>
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
