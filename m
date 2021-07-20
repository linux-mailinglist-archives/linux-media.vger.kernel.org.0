Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C35863D01A2
	for <lists+linux-media@lfdr.de>; Tue, 20 Jul 2021 20:27:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhGTRqG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Jul 2021 13:46:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230497AbhGTRoG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Jul 2021 13:44:06 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E581BC061574
        for <linux-media@vger.kernel.org>; Tue, 20 Jul 2021 11:24:37 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id u8-20020a7bcb080000b02901e44e9caa2aso88367wmj.4
        for <linux-media@vger.kernel.org>; Tue, 20 Jul 2021 11:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=fZortMfUJ6sP9V4mv+JXrwjkFsuKqC8sCrT1IfxE2IQ=;
        b=XUVux13s5c4XE3la6sNsDVnV5wsJPDf/esKROaTiOV8tSVRTmYXOJTY8JKuikYyZZy
         XNq6hOye5f5dgGbDzB+YonO8zlet92Ln7TuqPcypBNArxSXUeL0ON7mgBEcnbSwB8z+o
         Y/YfhB3M9AvmOGssbFid8ROltS8CDgfGo1RHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=fZortMfUJ6sP9V4mv+JXrwjkFsuKqC8sCrT1IfxE2IQ=;
        b=olkg+F2GYzECh4br1WNIdNB4kqMCp8ZIZBCB9Jc6sxGteP8kq+UxMx0QeWYZSGYEhz
         KvjmTWpX0l8aQHNBeg4FCpBHS3yB7UVpUVqWkil/fimmvfKQLgTzRh43dMadpGUUAzKv
         VfNUWm+/q48mKgjoce1HnRr42l/nj2lsHDq717EJcSrJuelcj7RBE+2F1yZARiEkOzqN
         zPhgDdpNyWmN8jMn27jEmqr/TtY/N4TnVlWVBC3pG7QDMvYBmbSun4BciyIXFbuqMauF
         3he3caZ9WmbY2UWGLKFi+f12PFKvCnw6mYK8ku+diX+B1FvxdhLnKg9yvyY5e+wirEZF
         CvQA==
X-Gm-Message-State: AOAM530o1aveDrZgixJSVw6C3vU2neJOT8Kd2QXtS5BBAQOOIf1X3+BX
        KquFxFJdYnRqDoBkxh3bNrV9ag==
X-Google-Smtp-Source: ABdhPJxJxuXAAbG2g8VfRjxtITgkDdi2Iec/QZfgBKKrqV+PIsMHUm2HQjbGOW/zVNRBi991fnD58w==
X-Received: by 2002:a05:600c:2f1a:: with SMTP id r26mr38841077wmn.41.1626805476463;
        Tue, 20 Jul 2021 11:24:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q19sm2943917wmq.38.2021.07.20.11.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 11:24:33 -0700 (PDT)
Date:   Tue, 20 Jul 2021 20:24:31 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        emil.l.velikov@gmail.com
Subject: Re: [PATCH v8 0/5] drm: address potential UAF bugs with drm_master
 ptrs
Message-ID: <YPcU3wJK7kC5b7kv@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, sumit.semwal@linaro.org,
        christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        emil.l.velikov@gmail.com
References: <20210712043508.11584-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210712043508.11584-1-desmondcheongzx@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 12, 2021 at 12:35:03PM +0800, Desmond Cheong Zhi Xi wrote:
> Hi,
> 
> In the previous thread on this series we decided to remove a patch that was violating a lockdep requirement in drm_lease. In addition to this change, I took a closer look at the CI logs for the Basic Acceptance Tests and noticed that another regression was introduced. The new patch 2 is a response to this.
> 
> Overall, this series addresses potential use-after-free errors when dereferencing pointers to struct drm_master. These were identified after one such bug was caught by Syzbot in drm_getunique():
> https://syzkaller.appspot.com/bug?id=148d2f1dfac64af52ffd27b661981a540724f803
> 
> The series is broken up into five patches:
> 
> 1. Move a call to drm_is_current_master() out from a section locked by &dev->mode_config.mutex in drm_mode_getconnector(). This patch does not apply to stable.
> 
> 2. Move a call to drm_is_current_master() out from the RCU read-side critical section in drm_clients_info().
> 
> 3. Implement a locked version of drm_is_current_master() function that's used within drm_auth.c.
> 
> 4. Serialize drm_file.master by introducing a new spinlock that's held whenever the value of drm_file.master changes.
> 
> 5. Identify areas in drm_lease.c where pointers to struct drm_master are dereferenced, and ensure that the master pointers are not freed during use.
> 
> v7 -> v8:
> - Remove the patch that moves the call to _drm_lease_held out from the section locked by &dev->mode_config.idr_mutex in __drm_mode_object_find. This patch violated an existing lockdep requirement as reported by the intel-gfx CI.
> - Added a new patch that moves a call to drm_is_current_master out from the RCU critical section in drm_clients_info. This was reported by the intel-gfx CI.
> 
> v6 -> v7:
> - Modify code alignment as suggested by the intel-gfx CI.
> - Add a new patch to the series that adds a new lock to serialize drm_file.master, in response to the lockdep splat by the intel-gfx CI.
> - Update drm_file_get_master to use the new drm_file.master_lock instead of drm_device.master_mutex, in response to the lockdep splat by the intel-gfx CI.
> 
> v5 -> v6:
> - Add a new patch to the series that moves the call to _drm_lease_held out from the section locked by &dev->mode_config.idr_mutex in __drm_mode_object_find.
> - Clarify the kerneldoc for dereferencing drm_file.master, as suggested by Daniel Vetter.
> - Refactor error paths with goto labels so that each function only has a single drm_master_put(), as suggested by Emil Velikov.
> - Modify comparisons to NULL into "!master", as suggested by the intel-gfx CI.
> 
> v4 -> v5:
> - Add a new patch to the series that moves the call to drm_is_current_master in drm_mode_getconnector out from the section locked by &dev->mode_config.mutex.
> - Additionally, added a missing semicolon to the patch, caught by the intel-gfx CI.
> 
> v3 -> v4:
> - Move the call to drm_is_current_master in drm_mode_getconnector out from the section locked by &dev->mode_config.mutex. As suggested by Daniel Vetter. This avoids a circular lock lock dependency as reported here https://patchwork.freedesktop.org/patch/440406/
> - Inside drm_is_current_master, instead of grabbing &fpriv->master->dev->master_mutex, we grab &fpriv->minor->dev->master_mutex to avoid dereferencing a null ptr if fpriv->master is not set.
> - Modify kerneldoc formatting for drm_file.master, as suggested by Daniel Vetter.
> - Additionally, add a file_priv->master NULL check inside drm_file_get_master, and handle the NULL result accordingly in drm_lease.c. As suggested by Daniel Vetter.
> 
> v2 -> v3:
> - Move the definition of drm_is_current_master and the _locked version higher up in drm_auth.c to avoid needing a forward declaration of drm_is_current_master_locked. As suggested by Daniel Vetter.
> - Instead of leaking drm_device.master_mutex into drm_lease.c to protect drm_master pointers, add a new drm_file_get_master() function that returns drm_file->master while increasing its reference count, to prevent drm_file->master from being freed. As suggested by Daniel Vetter.
> 
> v1 -> v2:
> - Move the lock and assignment before the DRM_DEBUG_LEASE in drm_mode_get_lease_ioctl, as suggested by Emil Velikov.

Apologies for the delay, I missed your series. Maybe just ping next time
around there's silence.

Looks all great, merged to drm-misc-next. Given how complex this was I'm
vary of just pushing this to -fixes without some solid testing.

One thing I noticed is that drm_is_current_master could just use the
spinlock, since it's only doing a read access. Care to type up that patch?

Also, do you plan to look into that idea we've discussed to flush pending
access when we revoke a master or a lease? I think that would be really
nice improvement here.
-Daniel

> 
> Desmond Cheong Zhi Xi (5):
>   drm: avoid circular locks in drm_mode_getconnector
>   drm: avoid blocking in drm_clients_info's rcu section
>   drm: add a locked version of drm_is_current_master
>   drm: serialize drm_file.master with a new spinlock
>   drm: protect drm_master pointers in drm_lease.c
> 
>  drivers/gpu/drm/drm_auth.c      | 93 ++++++++++++++++++++++++---------
>  drivers/gpu/drm/drm_connector.c |  5 +-
>  drivers/gpu/drm/drm_debugfs.c   |  3 +-
>  drivers/gpu/drm/drm_file.c      |  1 +
>  drivers/gpu/drm/drm_lease.c     | 81 +++++++++++++++++++++-------
>  include/drm/drm_auth.h          |  1 +
>  include/drm/drm_file.h          | 18 +++++--
>  7 files changed, 152 insertions(+), 50 deletions(-)
> 
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
