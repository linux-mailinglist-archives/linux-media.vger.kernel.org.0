Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80E3B3B1506
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 09:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbhFWHqK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 03:46:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbhFWHqJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 03:46:09 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94A4EC061756
        for <linux-media@vger.kernel.org>; Wed, 23 Jun 2021 00:43:52 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id i12-20020a05683033ecb02903346fa0f74dso1044296otu.10
        for <linux-media@vger.kernel.org>; Wed, 23 Jun 2021 00:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cWzvtRTbDifdl+PxaGCuS2g5VXsz2HZV7fjfjiuvl1s=;
        b=MwPZIV8ivWfiDYeNv72T0B+TQPZZrJ03iZ4rRoU2dOZH5hIhooeh4E9s44iqSXCJga
         rLhAfs3qLh5yoXMJcT0SlHUVp9mhu3ulY2L3UIReEZwzMCwACBeBALYnuoHv4l2iNsTi
         GPNyV/KpMzRb/s3TAd2ysZR4QjPPytSEIPRro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cWzvtRTbDifdl+PxaGCuS2g5VXsz2HZV7fjfjiuvl1s=;
        b=FgPulLroLrXOkNTd+sX7uRUtL1/yrZOHbe53oMXKFcvGh+OmNLbK6TdspVEnNXhrE/
         c432Zc9PhXp6sn8cqei+w4lUQdTawwuRBaRfD066PjhHikVPAcH0/fznWfaNSpkT4nZL
         Y+2x8eHJPVW1ZL+Aa5e2iDQj9wTzMxkAtbQbZFkjdq4pVd9XhjFQD9TqP1NsHrCAiI/s
         YaAm7hi0leq87kMTAPMWSxERUO8A8ztKRbdcE3bneS9Mx3hbTxmU288WI39kOMu1xzCP
         n3EVYIAASqOMMpKVHUORcD1dh2szYg7pFybnPwjcJHMoEcfEDQEyyjAgh9KiIi/hA+YN
         NLJw==
X-Gm-Message-State: AOAM531ev0J1nkCk0ePTROVVZTiYKH/lwFume7TD+D6uZvdZtvJ0qQy3
        xMDfnJ1KY5uykcJgjm3OnZFfnuw3h+qTEGH5C4f0aQ==
X-Google-Smtp-Source: ABdhPJwFpV7dlXUDEnB4E9Qw7A63kO4THfzJY0ME2w2Az3FtLmVWlU6ptDgsAet4iMbRa20uvHGl6WIJBc9CZdE8dbM=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr6705525otb.281.1624434231910;
 Wed, 23 Jun 2021 00:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210620110327.4964-1-desmondcheongzx@gmail.com>
 <20210620110327.4964-2-desmondcheongzx@gmail.com> <YNChRvGjIz6++jnd@phenom.ffwll.local>
In-Reply-To: <YNChRvGjIz6++jnd@phenom.ffwll.local>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 23 Jun 2021 09:43:41 +0200
Message-ID: <CAKMK7uGPo=iFffph=fRYeuE=RoGJ1JahukPAwszY7Rsu5rb=5Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm: add a locked version of drm_is_current_master
To:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dave Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
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
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 21, 2021 at 4:25 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Sun, Jun 20, 2021 at 07:03:26PM +0800, Desmond Cheong Zhi Xi wrote:
> > While checking the master status of the DRM file in
> > drm_is_current_master(), the device's master mutex should be
> > held. Without the mutex, the pointer fpriv->master may be freed
> > concurrently by another process calling drm_setmaster_ioctl(). This
> > could lead to use-after-free errors when the pointer is subsequently
> > dereferenced in drm_lease_owner().
> >
> > The callers of drm_is_current_master() from drm_auth.c hold the
> > device's master mutex, but external callers do not. Hence, we implement
> > drm_is_current_master_locked() to be used within drm_auth.c, and
> > modify drm_is_current_master() to grab the device's master mutex
> > before checking the master status.
> >
> > Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> > Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>
> Merged to drm-misc-fixes, thanks for your patch.

Cc'ed you on the revert, but this blew up in intel-gfx CI. Please cc:
intel-gfx@lists.freedesktop.org for the next round so CI can pick it
up (it doesn't read dri-devel here).

I'm not exactly sure how we can best fix that issue in general, maybe
there's more. But for the specific lockdep splat around getconnector I
think just pulling the call to drm_is_current_master out from the
connector mutex should avoid the issue (just store it locally and then
still have the if() condition under the connector mutex ofc).
-Daniel

> -Daniel
>
> > ---
> >  drivers/gpu/drm/drm_auth.c | 51 ++++++++++++++++++++++++--------------
> >  1 file changed, 32 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> > index 232abbba3686..86d4b72e95cb 100644
> > --- a/drivers/gpu/drm/drm_auth.c
> > +++ b/drivers/gpu/drm/drm_auth.c
> > @@ -61,6 +61,35 @@
> >   * trusted clients.
> >   */
> >
> > +static bool drm_is_current_master_locked(struct drm_file *fpriv)
> > +{
> > +     lockdep_assert_held_once(&fpriv->master->dev->master_mutex);
> > +
> > +     return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
> > +}
> > +
> > +/**
> > + * drm_is_current_master - checks whether @priv is the current master
> > + * @fpriv: DRM file private
> > + *
> > + * Checks whether @fpriv is current master on its device. This decides whether a
> > + * client is allowed to run DRM_MASTER IOCTLs.
> > + *
> > + * Most of the modern IOCTL which require DRM_MASTER are for kernel modesetting
> > + * - the current master is assumed to own the non-shareable display hardware.
> > + */
> > +bool drm_is_current_master(struct drm_file *fpriv)
> > +{
> > +     bool ret;
> > +
> > +     mutex_lock(&fpriv->master->dev->master_mutex);
> > +     ret = drm_is_current_master_locked(fpriv);
> > +     mutex_unlock(&fpriv->master->dev->master_mutex);
> > +
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL(drm_is_current_master);
> > +
> >  int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
> >  {
> >       struct drm_auth *auth = data;
> > @@ -223,7 +252,7 @@ int drm_setmaster_ioctl(struct drm_device *dev, void *data,
> >       if (ret)
> >               goto out_unlock;
> >
> > -     if (drm_is_current_master(file_priv))
> > +     if (drm_is_current_master_locked(file_priv))
> >               goto out_unlock;
> >
> >       if (dev->master) {
> > @@ -272,7 +301,7 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
> >       if (ret)
> >               goto out_unlock;
> >
> > -     if (!drm_is_current_master(file_priv)) {
> > +     if (!drm_is_current_master_locked(file_priv)) {
> >               ret = -EINVAL;
> >               goto out_unlock;
> >       }
> > @@ -321,7 +350,7 @@ void drm_master_release(struct drm_file *file_priv)
> >       if (file_priv->magic)
> >               idr_remove(&file_priv->master->magic_map, file_priv->magic);
> >
> > -     if (!drm_is_current_master(file_priv))
> > +     if (!drm_is_current_master_locked(file_priv))
> >               goto out;
> >
> >       drm_legacy_lock_master_cleanup(dev, master);
> > @@ -342,22 +371,6 @@ void drm_master_release(struct drm_file *file_priv)
> >       mutex_unlock(&dev->master_mutex);
> >  }
> >
> > -/**
> > - * drm_is_current_master - checks whether @priv is the current master
> > - * @fpriv: DRM file private
> > - *
> > - * Checks whether @fpriv is current master on its device. This decides whether a
> > - * client is allowed to run DRM_MASTER IOCTLs.
> > - *
> > - * Most of the modern IOCTL which require DRM_MASTER are for kernel modesetting
> > - * - the current master is assumed to own the non-shareable display hardware.
> > - */
> > -bool drm_is_current_master(struct drm_file *fpriv)
> > -{
> > -     return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
> > -}
> > -EXPORT_SYMBOL(drm_is_current_master);
> > -
> >  /**
> >   * drm_master_get - reference a master pointer
> >   * @master: &struct drm_master
> > --
> > 2.25.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
