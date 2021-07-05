Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 694933BBE44
	for <lists+linux-media@lfdr.de>; Mon,  5 Jul 2021 16:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231467AbhGEOhZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Jul 2021 10:37:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231355AbhGEOhY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Jul 2021 10:37:24 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CF31C061574
        for <linux-media@vger.kernel.org>; Mon,  5 Jul 2021 07:34:47 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id u8so22321534wrq.8
        for <linux-media@vger.kernel.org>; Mon, 05 Jul 2021 07:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=OzJ8i4gPoH0dAmjwwaE547XWzKx5g6WMgCM5rvUbkbI=;
        b=fQUXbXen5qaRrjJ29p/EC2tVoBuzsz8udWRmbLkcDDhigIHcy3dGZU6g9LEuJALUi6
         nw4tTJFOie39V3+vdETTeSYpaDoIVxdnriKRHJm/zwmmtLFHH/aI/ej70YnewdiIlQcx
         uZIoGglFdhpw6L7mwe1p7U8ZHu8TcSnOCEzJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=OzJ8i4gPoH0dAmjwwaE547XWzKx5g6WMgCM5rvUbkbI=;
        b=h5ZOsuNR7bTgJKo7BFFIgQjpD+RWZMQrqwD5ldZhUWZsZ5b4H49uiwbkF+wsErqXLi
         /8J8X54aWDeZbH8F0G2PWBR9hGAJfd1eKQmAMJVQyd0JtEfHjBQVZqTre7CzKwjFj7e4
         nG1QWxSSVwH72TtmeoZaWXQK9PH4YAsmgAc49qqy/EcSGg9gMVikH6U3yWvHsRmLv/1V
         ifj1uECrJearUfS2/Xg1/lvutz1NTQyFgclj38Y/2oXkE+i+uHLPi9e5qSyCsJK+IZ4d
         GT1nZIjYJPMB87p3JeSZgDRp+1oEBlPI21d175jH/ptn/0dvYpQnl2q7CoRRM2RrOsWK
         unqA==
X-Gm-Message-State: AOAM5301E9CFc1ipFd3y80gHyzLjKQMekamNfGI1QSwIwqukD2EUhmAJ
        BJvj9TfciV7xxVY556D03A7ZKQ==
X-Google-Smtp-Source: ABdhPJxHJtbnLxFoghCJmhtQ1zvT9/7dvksFg29oHl1HxU7bk/ZhmxDGmRfZMw4c249sZVU8zWMIzQ==
X-Received: by 2002:a5d:4b88:: with SMTP id b8mr15925477wrt.95.1625495685806;
        Mon, 05 Jul 2021 07:34:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id n23sm12008913wmi.29.2021.07.05.07.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 07:34:45 -0700 (PDT)
Date:   Mon, 5 Jul 2021 16:34:43 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org, emil.l.velikov@gmail.com,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v7 0/5] drm: address potential UAF bugs with drm_master
 ptrs
Message-ID: <YOMYgytOSPM+D6eZ@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, sumit.semwal@linaro.org,
        christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
        emil.l.velikov@gmail.com,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20210701165358.19053-1-desmondcheongzx@gmail.com>
 <YN9kAFcfGoB13x7f@phenom.ffwll.local>
 <ae76290d-26e9-a011-dcdd-b5d48c80912e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae76290d-26e9-a011-dcdd-b5d48c80912e@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 05, 2021 at 10:15:45AM +0800, Desmond Cheong Zhi Xi wrote:
> On 3/7/21 3:07 am, Daniel Vetter wrote:
> > On Fri, Jul 02, 2021 at 12:53:53AM +0800, Desmond Cheong Zhi Xi wrote:
> > > This patch series addresses potential use-after-free errors when dereferencing pointers to struct drm_master. These were identified after one such bug was caught by Syzbot in drm_getunique():
> > > https://syzkaller.appspot.com/bug?id=148d2f1dfac64af52ffd27b661981a540724f803
> > > 
> > > The series is broken up into five patches:
> > > 
> > > 1. Move a call to drm_is_current_master() out from a section locked by &dev->mode_config.mutex in drm_mode_getconnector(). This patch does not apply to stable.
> > > 
> > > 2. Move a call to _drm_lease_held() out from the section locked by &dev->mode_config.idr_mutex in __drm_mode_object_find().
> > > 
> > > 3. Implement a locked version of drm_is_current_master() function that's used within drm_auth.c.
> > > 
> > > 4. Serialize drm_file.master by introducing a new lock that's held whenever the value of drm_file.master changes.
> > > 
> > > 5. Identify areas in drm_lease.c where pointers to struct drm_master are dereferenced, and ensure that the master pointers are not freed during use.
> > > 
> > > Changes in v6 -> v7:
> > > - Patch 2:
> > > Modify code alignment as suggested by the intel-gfx CI.
> > > 
> > > Update commit message based on the changes to patch 5.
> > > 
> > > - Patch 4:
> > > Add patch 4 to the series. This patch adds a new lock to serialize drm_file.master, in response to the lockdep splat by the intel-gfx CI.
> > > 
> > > - Patch 5:
> > > Move kerneldoc comment about protecting drm_file.master with drm_device.master_mutex into patch 4.
> > > 
> > > Update drm_file_get_master to use the new drm_file.master_lock instead of drm_device.master_mutex, in response to the lockdep splat by the intel-gfx CI.
> > 
> > So there's another one now because master->leases is protected by the
> > mode_config.idr_mutex, and that's a bit awkward to untangle.
> > 
> > Also I'm really surprised that there was now lockdep through the atomic
> > code anywhere. The reason seems to be that somehow CI reboot first before
> > it managed to run any of the kms_atomic tests, and we can only hit this
> > when we go through the atomic kms ioctl, the legacy kms ioctl don't have
> > that specific issue.
> > 
> > Anyway I think this approach doesn't look too workable, and we need
> > something new.
> > 
> > But first things first: Are you still on board working on this? You
> > started with a simple patch to fix a UAF bug, now we're deep into
> > reworking tricky locking ... If you feel like you want out I'm totally
> > fine with that.
> > 
> 
> Hi Daniel,
> 
> Thanks for asking, but I'm committed to seeing this through :) In fact, I
> really appreciate all your guidance and patience as the simple patch evolved
> into the current state of things.

Cool, it's definitely been fun trying to figure out a good solution for
this tricky problem here :-)

> > Anyway, I think we need to split drm_device->master_mutex up into two
> > parts:
> > 
> > - One part that protects the actual access/changes, which I think for
> >    simplicity we'll just leave as the current lock. That lock is a very
> >    inner lock, since for the drm_lease.c stuff it has to nest within
> >    mode_config.idr_mutex even.
> > 
> > - Now the issue with checking master status/leases/whatever as an
> >    innermost lock is that you can race, it's a classic time of check vs
> >    time of use race: By the time we actually use the thing we validate
> >    we'er allowed to use, we might now have access anymore. There's two
> >    reasons for that:
> > 
> >    * DROPMASTER ioctl could remove the master rights, which removes access
> >      rights also for all leases
> > 
> >    * REVOKE_LEASE ioctl can do the same but only for a specific lease
> > 
> >    This is the thing we're trying to protect against in fbcon code, but
> >    that's very spotty protection because all the ioctls by other users
> >    aren't actually protected against this.
> > 
> >    So I think for this we need some kind of big reader lock.
> > 
> > Now for the implementation, there's a few things:
> > 
> > - I think best option for this big reader lock would be to just use srcu.
> >    We only need to flush out all current readers when we drop master or
> >    revoke a lease, so synchronize_srcu is perfectly good enough for this
> >    purpose.
> > 
> > - The fbdev code would switch over to srcu in
> >    drm_master_internal_acquire() and drm_master_internal_release(). Ofc
> >    within drm_master_internal_acquire we'd still need to check master
> >    status with the normal master_mutex.
> > 
> > - While we revamp all this we should fix the ioctl checks in drm_ioctl.c.
> >    Just noticed that drm_ioctl_permit() could and should be unexported,
> >    last user was removed.
> > 
> >    Within drm_ioctl_kernel we'd then replace the check for
> >    drm_is_current_master with the drm_master_internal_acquire/release.
> > 
> > - This alone does nothing, we still need to make sure that dropmaster and
> >    revoke_lease ioctl flush out all other access before they return to
> >    userspace. We can't just call synchronize_srcu because due to the ioctl
> >    code in drm_ioctl_kernel we're in that sruc section, we'd need to add a
> >    DRM_MASTER_FLUSH ioctl flag which we'd check only when DRM_MASTER is
> >    set, and use to call synchronize_srcu. Maybe wrap that in a
> >    drm_master_flush or so, or perhaps a drm_master_internal_release_flush.
> > 
> > - Also maybe we should drop the _internal_ from that name. Feels a bit
> >    wrong when we're also going to use this in the ioctl handler.
> > 
> > Thoughts? Totally silly and overkill?
> > 
> > Cheers, Daniel
> > 
> > 
> 
> Just some thoughts on the previous approach before we move on to something
> new. Regarding the lockdep warning for mode_config.idr_mutex, I think that's
> resolvable now by simply removing patch 2, which is no longer really
> necessary with the introduction of a new mutex at the bottom of the lock
> hierarchy in patch 4.

Oh I missed that, this is essentially part-way to what I'm describing
above.

> I was hesitant to create a new mutex (especially since this means that
> drm_file.master is now protected by either of two mutexes), but it's
> probably the smallest fix in terms of code churn. Is that approach no good?

That's the other approach I considered. It solves the use-after-free
issue, but while I was musing all the different issues here I realized
that we might as well use the opportunity to plug a few functional races
around drm_device ownership rules.

I do think it works. One thing I'd change is make it a spinlock - that
wayy it's very clear that it's a tiny inner lock that's really only meant
to protect the ->master pointer.

> Otherwise, on a high level, I think using an srcu mechanism makes a lot of
> sense to me to address the issue of data items being reclaimed while some
> readers still have references to them.
> 
> The implementation details seem sound to me too, but I'll need to code it up
> a bit before I can comment further.

So maybe this is complete overkill, but what about three locks :-)

- innermost spinlock, just to protect against use-after-free until we
  successfully got a reference. Essentially this is the lookup lock -
  maybe we could call it master_lookup_lock for clarity?

- mutex like we have right now to make sure master state is consistent
  when someone races set/dropmaster in userspace. This would be the only
  write lock we have.

- new srcu to make sure that after a dropmaster/revoke-lease all previous
  users calls are flushed out with synchronize_srcu(). Essentially this
  wouldn't be a lock, but more a barrier. So maybe should call it
  master_barrier_srcu or so? fbdev emulation in drm_client would use this,
  and also drm_ioctl code to plug the race I've spotted.

So maybe refresh your series with just the pieces you think we need for
the master lookup spinlock, and we try to land that first?

I do agree this should work against the use-after-free.

Cheers, Daniel

> 
> Best wishes,
> Desmond
> 
> > > Changes in v5 -> v6:
> > > - Patch 2:
> > > Add patch 2 to the series. This patch moves the call to _drm_lease_held out from the section locked by &dev->mode_config.idr_mutex in __drm_mode_object_find.
> > > 
> > > - Patch 5:
> > > Clarify the kerneldoc for dereferencing drm_file.master, as suggested by Daniel Vetter.
> > > 
> > > Refactor error paths with goto labels so that each function only has a single drm_master_put(), as suggested by Emil Velikov.
> > > 
> > > Modify comparison to NULL into "!master", as suggested by the intel-gfx CI.
> > > 
> > > Changes in v4 -> v5:
> > > - Patch 1:
> > > Add patch 1 to the series. The changes in patch 1 do not apply to stable because they apply to new changes in the drm-misc-next branch. This patch moves the call to drm_is_current_master in drm_mode_getconnector out from the section locked by &dev->mode_config.mutex.
> > > 
> > > Additionally, added a missing semicolon to the patch, caught by the intel-gfx CI.
> > > 
> > > - Patch 3:
> > > Move changes to drm_connector.c into patch 1.
> > > 
> > > Changes in v3 -> v4:
> > > - Patch 3:
> > > Move the call to drm_is_current_master in drm_mode_getconnector out from the section locked by &dev->mode_config.mutex. As suggested by Daniel Vetter. This avoids a circular lock lock dependency as reported here https://patchwork.freedesktop.org/patch/440406/
> > > 
> > > Additionally, inside drm_is_current_master, instead of grabbing &fpriv->master->dev->master_mutex, we grab &fpriv->minor->dev->master_mutex to avoid dereferencing a null ptr if fpriv->master is not set.
> > > 
> > > - Patch 5:
> > > Modify kerneldoc formatting.
> > > 
> > > Additionally, add a file_priv->master NULL check inside drm_file_get_master, and handle the NULL result accordingly in drm_lease.c. As suggested by Daniel Vetter.
> > > 
> > > Changes in v2 -> v3:
> > > - Patch 3:
> > > Move the definition of drm_is_current_master and the _locked version higher up in drm_auth.c to avoid needing a forward declaration of drm_is_current_master_locked. As suggested by Daniel Vetter.
> > > 
> > > - Patch 5:
> > > Instead of leaking drm_device.master_mutex into drm_lease.c to protect drm_master pointers, add a new drm_file_get_master() function that returns drm_file->master while increasing its reference count, to prevent drm_file->master from being freed. As suggested by Daniel Vetter.
> > > 
> > > Changes in v1 -> v2:
> > > - Patch 5:
> > > Move the lock and assignment before the DRM_DEBUG_LEASE in drm_mode_get_lease_ioctl, as suggested by Emil Velikov.
> > > 
> > > Desmond Cheong Zhi Xi (5):
> > >    drm: avoid circular locks in drm_mode_getconnector
> > >    drm: separate locks in __drm_mode_object_find
> > >    drm: add a locked version of drm_is_current_master
> > >    drm: serialize drm_file.master with a master lock
> > >    drm: protect drm_master pointers in drm_lease.c
> > > 
> > >   drivers/gpu/drm/drm_auth.c        | 86 +++++++++++++++++++++++--------
> > >   drivers/gpu/drm/drm_connector.c   |  5 +-
> > >   drivers/gpu/drm/drm_file.c        |  1 +
> > >   drivers/gpu/drm/drm_lease.c       | 81 ++++++++++++++++++++++-------
> > >   drivers/gpu/drm/drm_mode_object.c | 10 ++--
> > >   include/drm/drm_auth.h            |  1 +
> > >   include/drm/drm_file.h            | 18 +++++--
> > >   7 files changed, 153 insertions(+), 49 deletions(-)
> > > 
> > > -- 
> > > 2.25.1
> > > 
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
