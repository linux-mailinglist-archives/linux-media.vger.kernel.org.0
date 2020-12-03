Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 965222CDFD3
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 21:42:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbgLCUmP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 15:42:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgLCUmO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 15:42:14 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72547C061A4F
        for <linux-media@vger.kernel.org>; Thu,  3 Dec 2020 12:41:34 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id u12so3265515wrt.0
        for <linux-media@vger.kernel.org>; Thu, 03 Dec 2020 12:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=8xuVGGZrocKmn1NzYVFOOMcwKXkwJJQhKjG1WIOnqqA=;
        b=f+0gCfzsVkjARlMnHyFlbgY5ZHv6Flq12r3qoAWvGEZEc3dxBc+5rDnkX0G2EjpTB0
         qoavRbf3zO9etbX1tcYeut4SwZTCLj14ALRqjXhiCDxXSLE49aPPHG4K0cGPomP5dFBT
         f3XIsE3GQJxyte6JzpUwYougo6Sw8lzD6xoDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=8xuVGGZrocKmn1NzYVFOOMcwKXkwJJQhKjG1WIOnqqA=;
        b=lmDlliHc50JqssxQZmP+ubfEqOWkwhfv7YiPsq9qOFcHNvXpPTLgo1jv0Yh8zhrQUh
         UH+y3+tNK6IHG4/TwsW5CG0Y+hJ1UBKgC359xC7aua1QyouJj14ywvN7u6YZc5m67RDf
         ypuNmVdn8ZFFJTuL7Lg0mWJPt1MecYlL1S2s8WEwop73I+x2QKTaeEFS3QghCjde1JW8
         fBUvp47UkGnJgKlG9HyObDszycvVlg5FHbjPA1LCyv3JkszKdG1Yu+vmvJKunw98O7Em
         eDJN+NMNfwgJywhgg+NoxfxvP4zuGDqm5uATPj/oGKE+ZEMAtHcH5dE/RaQAqaLox9N/
         lqzA==
X-Gm-Message-State: AOAM530lZW695+ujROw5NAYJCQ++GaAtpvAnSq8NYLZNfpFyPU8vCwkr
        wIGcH03CLXUnXmMLWNRAw+SnCA==
X-Google-Smtp-Source: ABdhPJwRLgazfz4CEU8CC3xbQNVPPKZh1CXJJ/b4ZsvDU9H4NUwJ5th+kUnwytwRrLomfsKbpz0Snw==
X-Received: by 2002:a05:6000:1006:: with SMTP id a6mr1049635wrx.367.1607028093162;
        Thu, 03 Dec 2020 12:41:33 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id h20sm522458wmb.29.2020.12.03.12.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 12:41:31 -0800 (PST)
Date:   Thu, 3 Dec 2020 21:41:29 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Daniel Vetter <daniel@ffwll.ch>, linaro-mm-sig@lists.linaro.org,
        hdegoede@redhat.com, dri-devel@lists.freedesktop.org,
        airlied@redhat.com, christian.koenig@amd.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 7/7] dma-buf: Write down some rules for vmap usage
Message-ID: <20201203204129.GC401619@phenom.ffwll.local>
References: <20201203140259.26580-1-tzimmermann@suse.de>
 <20201203140259.26580-8-tzimmermann@suse.de>
 <20201203152601.GB401619@phenom.ffwll.local>
 <ee2abd93-0dfe-53a3-0038-5edc58c3ec92@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ee2abd93-0dfe-53a3-0038-5edc58c3ec92@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 03, 2020 at 07:59:04PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 03.12.20 um 16:26 schrieb Daniel Vetter:
> > On Thu, Dec 03, 2020 at 03:02:59PM +0100, Thomas Zimmermann wrote:
> > > Dma-buf's vmap and vunmap callbacks are undocumented and various
> > > exporters currently have slightly different semantics for them. Add
> > > documentation on how to implement and use these interfaces correctly.
> > > 
> > > v2:
> > > 	* document vmap semantics in struct dma_buf_ops
> > > 	* add TODO item for reviewing and maybe fixing dma-buf exporters
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > 
> > I still don't think this works, we're breaking dma_buf_vmap for everyone
> > else here.
> 
> I removed the text on the importer. These notes for callers in the docs are
> more or less a consequence of the exporter semantics.

Callers are importers, so I'm not seeing how that fixes anything.

> I thought we at least agreed on the exporter semantics in the other thread,
> didn't we?
> 
> What I'm trying to do is to write dome some rules for exporters, even if not
> all exporters follow them.

This is a standard interface, everyone needs to follow the same rules. And
if they change, we need to make sure nothing breaks and we're not creating
issues.

In the past the rule was the dma_buf_vmap was allowed to take the
dma_resv_lock, and that the buffer should be pinned. Now some ttm drivers
didn't ever bother with the pinning, and mostly got away with that because
drm_prime helpers do the pinning by default at attach time, and most users
do call dma_buf_attach.

But if you look through dma-buf docs nothing ever said you have to do a
dummy attachment before you call dma_buf_vmap, that's just slightly crappy
implementations that didn't blow up yet.

> Given the circumstances, we should leave out this patch from the patchset.

So the defacto rules are already a big mess, but that's not a good excuse
to make it worse.

What I had in mind is that we split dma_buf_vmap up into two variants:

- The current one, which should guarantee that the buffer is pinned.
  Because that's what all current callers wanted, before the fbdev code
  started allowing non-pinned buffers.

- The new one, which allows vmapping with just dma_resv locked, and should
  have some caching in exporters.

Breaking code and then adding todos about that is kinda not so cool
approach here imo.

Also I guess ttm_bo_vmap should have a check that either the buffer is
pinned, or dma_resv_lock is held.

Cheers, Daniel



> 
> Best regards
> Thomas
> 
> > 
> > > ---
> > >   Documentation/gpu/todo.rst | 15 +++++++++++++
> > >   include/drm/drm_gem.h      |  4 ++++
> > >   include/linux/dma-buf.h    | 45 ++++++++++++++++++++++++++++++++++++++
> > >   3 files changed, 64 insertions(+)
> > > 
> > > diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> > > index 009d8e6c7e3c..32bb797a84fc 100644
> > > --- a/Documentation/gpu/todo.rst
> > > +++ b/Documentation/gpu/todo.rst
> > > @@ -505,6 +505,21 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>, Christian König, Daniel Vette
> > >   Level: Intermediate
> > > +Enforce rules for dma-buf vmap and pin ops
> > > +------------------------------------------
> > > +
> > > +Exporter implementations of vmap and pin in struct dma_buf_ops (and consequently
> > > +struct drm_gem_object_funcs) use a variety of locking semantics. Some rely on
> > > +the caller holding the dma-buf's reservation lock, some do their own locking,
> > > +some don't require any locking. VRAM helpers even used to pin as part of vmap.
> > > +
> > > +We need to review each exporter and enforce the documented rules.
> > > +
> > > +Contact: Christian König, Daniel Vetter, Thomas Zimmermann <tzimmermann@suse.de>
> > > +
> > > +Level: Advanced
> > > +
> > > +
> > >   Core refactorings
> > >   =================
> > > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > > index 5e6daa1c982f..1864c6a721b1 100644
> > > --- a/include/drm/drm_gem.h
> > > +++ b/include/drm/drm_gem.h
> > > @@ -138,6 +138,8 @@ struct drm_gem_object_funcs {
> > >   	 * drm_gem_dmabuf_vmap() helper.
> > >   	 *
> > >   	 * This callback is optional.
> > > +	 *
> > > +	 * See also struct dma_buf_ops.vmap
> > >   	 */
> > >   	int (*vmap)(struct drm_gem_object *obj, struct dma_buf_map *map);
> > > @@ -148,6 +150,8 @@ struct drm_gem_object_funcs {
> > >   	 * drm_gem_dmabuf_vunmap() helper.
> > >   	 *
> > >   	 * This callback is optional.
> > > +	 *
> > > +	 * See also struct dma_buf_ops.vunmap
> > >   	 */
> > >   	void (*vunmap)(struct drm_gem_object *obj, struct dma_buf_map *map);
> > > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > > index cf72699cb2bc..dc81fdc01dda 100644
> > > --- a/include/linux/dma-buf.h
> > > +++ b/include/linux/dma-buf.h
> > > @@ -267,7 +267,52 @@ struct dma_buf_ops {
> > >   	 */
> > >   	int (*mmap)(struct dma_buf *, struct vm_area_struct *vma);
> > > +	/**
> > > +	 * @vmap:
> > 
> > There's already a @vmap and @vunamp kerneldoc at the top comment, that
> > needs to be removed.
> > -Daniel
> > 
> > > +	 *
> > > +	 * Returns a virtual address for the buffer.
> > > +	 *
> > > +	 * Notes to callers:
> > > +	 *
> > > +	 * - Callers must hold the struct dma_buf.resv lock before calling
> > > +	 *   this interface.
> > > +	 *
> > > +	 * - Callers must provide means to prevent the mappings from going
> > > +	 *   stale, such as holding the reservation lock or providing a
> > > +	 *   move-notify callback to the exporter.
> > > +	 *
> > > +	 * Notes to implementors:
> > > +	 *
> > > +	 * - Implementations must expect pairs of @vmap and @vunmap to be
> > > +	 *   called frequently and should optimize for this case.
> > > +	 *
> > > +	 * - Implementations should avoid additional operations, such as
> > > +	 *   pinning.
> > > +	 *
> > > +	 * - Implementations may expect the caller to hold the dma-buf's
> > > +	 *   reservation lock to protect against concurrent calls and
> > > +	 *   relocation.
> > > +	 *
> > > +	 * - Implementations may provide additional guarantees, such as working
> > > +	 *   without holding the reservation lock.
> > > +	 *
> > > +	 * This callback is optional.
> > > +	 *
> > > +	 * Returns:
> > > +	 *
> > > +	 * 0 on success or a negative error code on failure.
> > > +	 */
> > >   	int (*vmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
> > > +
> > > +	/**
> > > +	 * @vunmap:
> > > +	 *
> > > +	 * Releases the address previously returned by @vmap.
> > > +	 *
> > > +	 * This callback is optional.
> > > +	 *
> > > +	 * See also @vmap()
> > > +	 */
> > >   	void (*vunmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
> > >   };
> > > -- 
> > > 2.29.2
> > > 
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Felix Imendörffer
> 




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
