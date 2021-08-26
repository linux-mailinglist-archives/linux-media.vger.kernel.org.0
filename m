Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D75C3F87FC
	for <lists+linux-media@lfdr.de>; Thu, 26 Aug 2021 14:51:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242466AbhHZMwF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Aug 2021 08:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237214AbhHZMwE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Aug 2021 08:52:04 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26232C0613C1
        for <linux-media@vger.kernel.org>; Thu, 26 Aug 2021 05:51:17 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id t19so6017097ejr.8
        for <linux-media@vger.kernel.org>; Thu, 26 Aug 2021 05:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=FpiPnansJu8DUu+/nHhIKk3mLIrXLuVC7r4JsYSdoWk=;
        b=ftuxs5ZJnnCztKpDs1pIMs0oUtnLWsyEXzaS2DrIYBCSzQ24ijdkVP5Max2f76G1/Y
         aK5Tpqc8weHkVwlG3lxMhCnRlCLBnvlO3YhanwRSGhdrr7uIabDMFcOi0p17/+CXJSW6
         ej/XHYGU+xOQfkQcnBxPFqwJ1+c3hJneZ6xL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=FpiPnansJu8DUu+/nHhIKk3mLIrXLuVC7r4JsYSdoWk=;
        b=Sf3zIHQSBDDLVvTF4XFmQ4baP6C7BKdeXs9savVaNdxyOgaATs677LO6A6k3ZA1/WA
         uGcamRY1LiQS+3oboXL/NEJgXrL0ZXbVyCWK9eZeMmFVIRxA0oFf6GgjnnVxHqrgVsBX
         wlz4bvOFB/3Va1a/ed1bKBWl75vLjyqI6h+NNs0obUD3tq9Yb4kBT2GgbwrmN+Rv2VGa
         VQUxRFIRakaZEf0umhU29Y1JEq1RYGPDTHxC43C7rgxAJVaCgJHIY5BK20txGZxRABOa
         PCfZSPMMnqhfh5p+WCEPNwt8T5Zc7xdwOri6rPmobFfyXgdr3jfrT67L6fVpGEHSjfI+
         nKKQ==
X-Gm-Message-State: AOAM530ASgWPhx4rN0u4toGF0tVEP+EiztuQa0IddA1qsXTYcbFERXdx
        T6K6G3EUledr1vwiHTA2PuJkGQ==
X-Google-Smtp-Source: ABdhPJwiU1iz9dGMmeH2SkpHjq951CirdwGa0NEoXjpkdbU7c5JjTnCgL90lsIndPAL+xlmyQN94eg==
X-Received: by 2002:a17:907:8693:: with SMTP id qa19mr2224090ejc.95.1629982275725;
        Thu, 26 Aug 2021 05:51:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id gz22sm1462270ejb.15.2021.08.26.05.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 05:51:15 -0700 (PDT)
Date:   Thu, 26 Aug 2021 14:51:12 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, sumit.semwal@linaro.org,
        christian.koenig@amd.com, jani.nikula@linux.intel.com,
        joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
        chris@chris-wilson.co.uk, ville.syrjala@linux.intel.com,
        matthew.auld@intel.com, dan.carpenter@oracle.com,
        tvrtko.ursulin@intel.com, matthew.d.roper@intel.com,
        lucas.demarchi@intel.com, karthik.b.s@intel.com,
        jose.souza@intel.com, manasi.d.navare@intel.com,
        airlied@redhat.com, aditya.swarup@intel.com, andrescj@chromium.org,
        linux-graphics-maintainer@vmware.com, zackr@vmware.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Intel-gfx] [PATCH v8 1/7] drm: fix null ptr dereference in
 drm_master_release
Message-ID: <YSeOQMxytJ/i3tEe@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, sumit.semwal@linaro.org,
        christian.koenig@amd.com, jani.nikula@linux.intel.com,
        joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
        chris@chris-wilson.co.uk, ville.syrjala@linux.intel.com,
        matthew.auld@intel.com, dan.carpenter@oracle.com,
        tvrtko.ursulin@intel.com, matthew.d.roper@intel.com,
        lucas.demarchi@intel.com, karthik.b.s@intel.com,
        jose.souza@intel.com, manasi.d.navare@intel.com, airlied@redhat.com,
        aditya.swarup@intel.com, andrescj@chromium.org,
        linux-graphics-maintainer@vmware.com, zackr@vmware.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20210826020122.1488002-1-desmondcheongzx@gmail.com>
 <20210826020122.1488002-2-desmondcheongzx@gmail.com>
 <YSdkjvWN9RAijZJy@phenom.ffwll.local>
 <05f4d472-7a76-598a-e792-a847a3e8516a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05f4d472-7a76-598a-e792-a847a3e8516a@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 26, 2021 at 07:53:58PM +0800, Desmond Cheong Zhi Xi wrote:
> On 26/8/21 5:53 pm, Daniel Vetter wrote:
> > On Thu, Aug 26, 2021 at 10:01:16AM +0800, Desmond Cheong Zhi Xi wrote:
> > > drm_master_release can be called on a drm_file without a master, which
> > > results in a null ptr dereference of file_priv->master->magic_map. The
> > > three cases are:
> > > 
> > > 1. Error path in drm_open_helper
> > >    drm_open():
> > >      drm_open_helper():
> > >        drm_master_open():
> > >          drm_new_set_master(); <--- returns -ENOMEM,
> > >                                     drm_file.master not set
> > >        drm_file_free():
> > >          drm_master_release(); <--- NULL ptr dereference
> > >                                     (file_priv->master->magic_map)
> > > 
> > > 2. Error path in mock_drm_getfile
> > >    mock_drm_getfile():
> > >      anon_inode_getfile(); <--- returns error, drm_file.master not set
> > >      drm_file_free():
> > >        drm_master_release(); <--- NULL ptr dereference
> > >                                   (file_priv->master->magic_map)
> > > 
> > > 3. In drm_client_close, as drm_client_open doesn't set up a master
> > > 
> > > drm_file.master is set up in drm_open_helper through the call to
> > > drm_master_open, so we mirror it with a call to drm_master_release in
> > > drm_close_helper, and remove drm_master_release from drm_file_free to
> > > avoid the null ptr dereference.
> > > 
> > > Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> > 
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> > I guess we should also have a cc: stable on this one? I think this bug
> > existed since pretty much forever, but maybe more prominent with the
> > drm_client stuff added a while ago.
> > -Daniel
> > 
> 
> Thanks for the reviews, Daniel.
> 
> Took a closer look. I think if we cc: stable, this fix should accompany
> commit 7eeaeb90a6a5 ("drm/file: Don't set master on in-kernel clients")
> which moves the drm_master_open out from drm_file_alloc into
> drm_open_helper.

Ah right, please reference that commit with a Fixes: line.
-Daniel

> 
> > > ---
> > >   drivers/gpu/drm/drm_file.c | 6 +++---
> > >   1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> > > index ed25168619fc..90b62f360da1 100644
> > > --- a/drivers/gpu/drm/drm_file.c
> > > +++ b/drivers/gpu/drm/drm_file.c
> > > @@ -282,9 +282,6 @@ void drm_file_free(struct drm_file *file)
> > >   	drm_legacy_ctxbitmap_flush(dev, file);
> > > -	if (drm_is_primary_client(file))
> > > -		drm_master_release(file);
> > > -
> > >   	if (dev->driver->postclose)
> > >   		dev->driver->postclose(dev, file);
> > > @@ -305,6 +302,9 @@ static void drm_close_helper(struct file *filp)
> > >   	list_del(&file_priv->lhead);
> > >   	mutex_unlock(&dev->filelist_mutex);
> > > +	if (drm_is_primary_client(file_priv))
> > > +		drm_master_release(file_priv);
> > > +
> > >   	drm_file_free(file_priv);
> > >   }
> > > -- 
> > > 2.25.1
> > > 
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
