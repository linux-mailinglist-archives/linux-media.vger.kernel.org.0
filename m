Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45F592D3FC2
	for <lists+linux-media@lfdr.de>; Wed,  9 Dec 2020 11:19:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729858AbgLIKRe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 05:17:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729637AbgLIKRe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Dec 2020 05:17:34 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3234CC0613CF
        for <linux-media@vger.kernel.org>; Wed,  9 Dec 2020 02:16:54 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id d27so1198253oic.0
        for <linux-media@vger.kernel.org>; Wed, 09 Dec 2020 02:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5jXo/q6+qwTl1NPuVbve/kl4wpM3ah5dbawXMCz/xag=;
        b=UYnb/u6fvFSuzzBQgD/qkWDiBMTdxYDcGIE6Y0gHVsRslpQ6b7c6EZ94X/rK29U9hh
         wp8CzJJOY7P97r7CVbMSFwY1/A531jaztkuLlzWGk7hpZChLBZg5lve8AeeL9MerwOo2
         Bdc4tWrVB0wmTe8baSpC7Uab8gLZs9a5xfaoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5jXo/q6+qwTl1NPuVbve/kl4wpM3ah5dbawXMCz/xag=;
        b=k3Ij5lzIr/URBOa1XTjDBri5yUtQ0HGH1uE5v1yl8NGexCu6G8ZglQiFgelVMCw+bK
         BAkjb2i8RoBXvLwogNR8iDI2oUA1AQq8C5aYwzTpS+KRlJdZn1UkYVyNZ11D2gVeBqrr
         gF6ibm9qLBT6UScTsVtPugJwA1XFOu4+PtuAOBa6N9Z4L7npkgfwzOBo+QxO4x7K0fNG
         SBNEBd6svrs5/SQI5N5wO8wuDdOCaWAl1WEwaFAWZYKTfciG5BSliXnomumFYptvOGW6
         zUd5G2QlD2emiowfvwItUQ3Jk6j5UsjPE4xSA1m5tzKxuBH3RtGPYC4EuHusVPtS5soM
         szyw==
X-Gm-Message-State: AOAM532a+vxGylAIz52MMDFPEde5B24qLL+dI4Gp3UeSrfzkkzCNMSxM
        b0IX63bKNsZa+fUw7iUBGZ+vQ0BvwAvkwa8AJSD5nQ==
X-Google-Smtp-Source: ABdhPJzquLpBKuJTV79YWIDWh02uTkUHdjYWzRycuWxaVEBmh0Gkdu8MdQJIowQ4vKRgPdn56701QXuXblfUShlj/dg=
X-Received: by 2002:aca:4e11:: with SMTP id c17mr1166636oib.14.1607509013389;
 Wed, 09 Dec 2020 02:16:53 -0800 (PST)
MIME-Version: 1.0
References: <20201203140259.26580-1-tzimmermann@suse.de> <20201203140259.26580-8-tzimmermann@suse.de>
 <20201203152601.GB401619@phenom.ffwll.local> <ee2abd93-0dfe-53a3-0038-5edc58c3ec92@suse.de>
 <20201203204129.GC401619@phenom.ffwll.local> <a253129d-c0e3-c864-fa0c-111338d25e25@suse.de>
 <4fc93de9-cd26-58b0-d398-ac97577ffa92@amd.com> <20201209001321.GF401619@phenom.ffwll.local>
 <8ef5d69a-b5b3-31d0-b011-8860b60f35eb@suse.de>
In-Reply-To: <8ef5d69a-b5b3-31d0-b011-8860b60f35eb@suse.de>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 9 Dec 2020 11:16:42 +0100
Message-ID: <CAKMK7uE-GwdR-=7aDbf3nsrENd167ucgZ+eaeaq+WMcNAiH0YA@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] dma-buf: Write down some rules for vmap usage
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Dave Airlie <airlied@redhat.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 9, 2020 at 10:32 AM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
>
> Hi
>
> Am 09.12.20 um 01:13 schrieb Daniel Vetter:
> > On Fri, Dec 04, 2020 at 09:47:08AM +0100, Christian K=C3=B6nig wrote:
> >> Am 04.12.20 um 09:32 schrieb Thomas Zimmermann:
> >>> Hi
> >>>
> >>> Am 03.12.20 um 21:41 schrieb Daniel Vetter:
> >>>> On Thu, Dec 03, 2020 at 07:59:04PM +0100, Thomas Zimmermann wrote:
> >>>>> Hi
> >>>>>
> >>>>> Am 03.12.20 um 16:26 schrieb Daniel Vetter:
> >>>>>> On Thu, Dec 03, 2020 at 03:02:59PM +0100, Thomas Zimmermann wrote:
> >>>>>>> Dma-buf's vmap and vunmap callbacks are undocumented and various
> >>>>>>> exporters currently have slightly different semantics for them. A=
dd
> >>>>>>> documentation on how to implement and use these interfaces correc=
tly.
> >>>>>>>
> >>>>>>> v2:
> >>>>>>>      * document vmap semantics in struct dma_buf_ops
> >>>>>>>      * add TODO item for reviewing and maybe fixing dma-buf expor=
ters
> >>>>>>>
> >>>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>>>>>
> >>>>>> I still don't think this works, we're breaking dma_buf_vmap
> >>>>>> for everyone
> >>>>>> else here.
> >>>>>
> >>>>> I removed the text on the importer. These notes for callers in
> >>>>> the docs are
> >>>>> more or less a consequence of the exporter semantics.
> >>>>
> >>>> Callers are importers, so I'm not seeing how that fixes anything.
> >>>>
> >>>>> I thought we at least agreed on the exporter semantics in the
> >>>>> other thread,
> >>>>> didn't we?
> >>>>>
> >>>>> What I'm trying to do is to write dome some rules for exporters,
> >>>>> even if not
> >>>>> all exporters follow them.
> >>>>
> >>>> This is a standard interface, everyone needs to follow the same
> >>>> rules. And
> >>>> if they change, we need to make sure nothing breaks and we're not
> >>>> creating
> >>>> issues.
> >>>>
> >>>> In the past the rule was the dma_buf_vmap was allowed to take the
> >>>> dma_resv_lock, and that the buffer should be pinned. Now some ttm
> >>>> drivers
> >>>> didn't ever bother with the pinning, and mostly got away with that
> >>>> because
> >>>> drm_prime helpers do the pinning by default at attach time, and most
> >>>> users
> >>>> do call dma_buf_attach.
> >>>>
> >>>> But if you look through dma-buf docs nothing ever said you have to d=
o a
> >>>> dummy attachment before you call dma_buf_vmap, that's just slightly
> >>>> crappy
> >>>> implementations that didn't blow up yet.
> >>>
> >>> I had a patch for adding pin to radeon's implementation of vmap. [1]
> >>> Christian told me to not do this; instead just get the lock in the fb=
dev
> >>> code. His advise almost seems the opposite of what you're telling me
> >>> here.
> >>
> >> I think what Daniel suggests here is that we need to smoothly transiti=
on the
> >> code from making assumptions to having a straight interface where impo=
rters
> >> explicitly say when stuff is locked and when stuff is pinned.
> >>
> >> I've started this with the attach interface by adding a new dynamic ap=
proach
> >> to that, but you probably need to carry on here with that for vmap as =
well.
> >>
> >> When that is done we can migrate every exporter over to the new dynami=
c
> >> approach.
> >>
> >>>
> >>> For the GEM VRAM helpers, that implicit pin in vmap gave me headaches=
.
> >>> Because scanouts can only be done from VRAM, which is badly suited fo=
r
> >>> exporting. So I ended up with an implicit pin that pins the buffer to
> >>> whatever domain it currently is. I got away with it because GEM VRAM =
BOs
> >>> are not sharable among devices; fbdev is the only user of that
> >>> functionality and only pins for short periods of time.
> >>>
> >>> I suspect that fixing TTM-based drivers by adding an implicit pin wou=
ld
> >>> result in a similar situation. Whatever domain it ends up pinning, so=
me
> >>> functionality might not be compatible with that.
> >>
> >> Correct, exactly that's the problem.
> >>
> >>>
> >>>>
> >>>>> Given the circumstances, we should leave out this patch from the
> >>>>> patchset.
> >>>>
> >>>> So the defacto rules are already a big mess, but that's not a good
> >>>> excuse
> >>>> to make it worse.
> >>>>
> >>>> What I had in mind is that we split dma_buf_vmap up into two variant=
s:
> >>>>
> >>>> - The current one, which should guarantee that the buffer is pinned.
> >>>>     Because that's what all current callers wanted, before the fbdev=
 code
> >>>>     started allowing non-pinned buffers.
> >>>
> >>> Can we add an explicit pin operation to dma_buf_vmap() to enforce the
> >>> semantics?
> >>
> >> At least I would be fine with that. For now amdgpu is the only exporte=
r who
> >> implements the explicit pin/unpin semantics anyway.
> >
> > Yup, I think that makes sense (if it works). Maybe we could use somethi=
ng
> > like:
> >
> > a) dma_buf pin exists, driver is dynamic. This means dma_buf_vmap needs=
 to
> > first pin, then call ->vmap. dma_buf_vmap_local otoh can directly call
> > ->vmap since the exporter relies on either a pin or dma_resv_lock.
> >
> > b) dma_buf pin not implement, driver is a legacy pile. dma_buf_vmap wil=
l
> > pin (somewhere at least, or rely on some implicit pin), dma_buf_vmap_lo=
cal
> > doesn't work and should fail.
>
> I think I read in the dma-buf documentation that pin is supposed to put
> the BO in a domain that is suitable for scanout. Now I don't really
> trust this to work. Amdgpu, radeon and nouveau put it into the GTT
> region. Qxl appears to put it wherever it is.

Uh that sounds wrong, or at least not the full complexity. ->pin's
main use right now is to freeze the dma-buf into system memory when
there's a non-dynamic attachement for a dynamic exporter. There's also
a dma_buf_pin call in amdgpu, and I think that only works for scanout
on integrated gpu. Pinning to vram would break sharing for all
existing dma-buf users.

Christian can you perhaps explain when amdgpu uses dma_buf_pin()?

My take is the ->pin callback should clarify that it should pin into
system memory, for legacy (non-dynamic) dma-buf users. And
dma_buf_pin() should gain some kerneldoc which then states that "This
should only be used in limited use cases like scanout and not for
temporary pin operations." I think the problem with this kerneldoc is
simply that it tries to document the exporter and importer side of the
contract in one place and makes a mess of it, plus leaves the actual
importer side function undocumented. I think the kerneldoc also
predates the final patch version, and we didn't update it fully.

> > I think for less transition work fbdev helpers could first try
> > dma_resv_lock + dma_buf_vmap_local, if that fails, drop the dma_resv_lo=
ck
> > and do the pinning dma_buf_vmap. That way we don't have to convert shme=
m
> > helpers over to dma_resv locking, which should help.
>
> I have meanwhile made a patchset that updates helpers for cma, shmem and
> vram with vmap_local; and converts fbdev emulation as well. It needs a
> bit more testing before being posted.

Nice, even better!
-Daniel

> Best regards
> Thomas
>
> >
> > And ttm drivers would do the new clean interface, so at least everyone
> > using dma_resv today is all fine. Intel's conversion to dma_resv lock i=
s
> > in-flight, but that needs a conversion to the dynamic interface anyway,
> > the current code splats. And dynamic brings means explicit pin/unpin
> > callbacks, so should be good too.
> > -Daniel
> >
> >>
> >> Regards,
> >> Christian.
> >>
> >>>
> >>> Best regards
> >>> Thomas
> >>>
> >>> [1] https://patchwork.freedesktop.org/patch/400054/?series=3D83765&re=
v=3D1
> >>>
> >>>>
> >>>> - The new one, which allows vmapping with just dma_resv locked, and
> >>>> should
> >>>>     have some caching in exporters.
> >>>>
> >>>> Breaking code and then adding todos about that is kinda not so cool
> >>>> approach here imo.
> >>>>
> >>>> Also I guess ttm_bo_vmap should have a check that either the buffer =
is
> >>>> pinned, or dma_resv_lock is held.
> >>>>
> >>>> Cheers, Daniel
> >>>>
> >>>>
> >>>>
> >>>>>
> >>>>> Best regards
> >>>>> Thomas
> >>>>>
> >>>>>>
> >>>>>>> ---
> >>>>>>>     Documentation/gpu/todo.rst | 15 +++++++++++++
> >>>>>>>     include/drm/drm_gem.h      |  4 ++++
> >>>>>>>     include/linux/dma-buf.h    | 45
> >>>>>>> ++++++++++++++++++++++++++++++++++++++
> >>>>>>>     3 files changed, 64 insertions(+)
> >>>>>>>
> >>>>>>> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.=
rst
> >>>>>>> index 009d8e6c7e3c..32bb797a84fc 100644
> >>>>>>> --- a/Documentation/gpu/todo.rst
> >>>>>>> +++ b/Documentation/gpu/todo.rst
> >>>>>>> @@ -505,6 +505,21 @@ Contact: Thomas Zimmermann
> >>>>>>> <tzimmermann@suse.de>, Christian K=C3=B6nig, Daniel Vette
> >>>>>>>     Level: Intermediate
> >>>>>>> +Enforce rules for dma-buf vmap and pin ops
> >>>>>>> +------------------------------------------
> >>>>>>> +
> >>>>>>> +Exporter implementations of vmap and pin in struct
> >>>>>>> dma_buf_ops (and consequently
> >>>>>>> +struct drm_gem_object_funcs) use a variety of locking
> >>>>>>> semantics. Some rely on
> >>>>>>> +the caller holding the dma-buf's reservation lock, some
> >>>>>>> do their own locking,
> >>>>>>> +some don't require any locking. VRAM helpers even used
> >>>>>>> to pin as part of vmap.
> >>>>>>> +
> >>>>>>> +We need to review each exporter and enforce the documented rules=
.
> >>>>>>> +
> >>>>>>> +Contact: Christian K=C3=B6nig, Daniel Vetter, Thomas
> >>>>>>> Zimmermann <tzimmermann@suse.de>
> >>>>>>> +
> >>>>>>> +Level: Advanced
> >>>>>>> +
> >>>>>>> +
> >>>>>>>     Core refactorings
> >>>>>>>     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>>>>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> >>>>>>> index 5e6daa1c982f..1864c6a721b1 100644
> >>>>>>> --- a/include/drm/drm_gem.h
> >>>>>>> +++ b/include/drm/drm_gem.h
> >>>>>>> @@ -138,6 +138,8 @@ struct drm_gem_object_funcs {
> >>>>>>>          * drm_gem_dmabuf_vmap() helper.
> >>>>>>>          *
> >>>>>>>          * This callback is optional.
> >>>>>>> +     *
> >>>>>>> +     * See also struct dma_buf_ops.vmap
> >>>>>>>          */
> >>>>>>>         int (*vmap)(struct drm_gem_object *obj, struct
> >>>>>>> dma_buf_map *map);
> >>>>>>> @@ -148,6 +150,8 @@ struct drm_gem_object_funcs {
> >>>>>>>          * drm_gem_dmabuf_vunmap() helper.
> >>>>>>>          *
> >>>>>>>          * This callback is optional.
> >>>>>>> +     *
> >>>>>>> +     * See also struct dma_buf_ops.vunmap
> >>>>>>>          */
> >>>>>>>         void (*vunmap)(struct drm_gem_object *obj, struct
> >>>>>>> dma_buf_map *map);
> >>>>>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> >>>>>>> index cf72699cb2bc..dc81fdc01dda 100644
> >>>>>>> --- a/include/linux/dma-buf.h
> >>>>>>> +++ b/include/linux/dma-buf.h
> >>>>>>> @@ -267,7 +267,52 @@ struct dma_buf_ops {
> >>>>>>>          */
> >>>>>>>         int (*mmap)(struct dma_buf *, struct vm_area_struct *vma)=
;
> >>>>>>> +    /**
> >>>>>>> +     * @vmap:
> >>>>>>
> >>>>>> There's already a @vmap and @vunamp kerneldoc at the top comment, =
that
> >>>>>> needs to be removed.
> >>>>>> -Daniel
> >>>>>>
> >>>>>>> +     *
> >>>>>>> +     * Returns a virtual address for the buffer.
> >>>>>>> +     *
> >>>>>>> +     * Notes to callers:
> >>>>>>> +     *
> >>>>>>> +     * - Callers must hold the struct dma_buf.resv lock
> >>>>>>> before calling
> >>>>>>> +     *   this interface.
> >>>>>>> +     *
> >>>>>>> +     * - Callers must provide means to prevent the
> >>>>>>> mappings from going
> >>>>>>> +     *   stale, such as holding the reservation lock or providin=
g a
> >>>>>>> +     *   move-notify callback to the exporter.
> >>>>>>> +     *
> >>>>>>> +     * Notes to implementors:
> >>>>>>> +     *
> >>>>>>> +     * - Implementations must expect pairs of @vmap and
> >>>>>>> @vunmap to be
> >>>>>>> +     *   called frequently and should optimize for this case.
> >>>>>>> +     *
> >>>>>>> +     * - Implementations should avoid additional operations, suc=
h as
> >>>>>>> +     *   pinning.
> >>>>>>> +     *
> >>>>>>> +     * - Implementations may expect the caller to hold the dma-b=
uf's
> >>>>>>> +     *   reservation lock to protect against concurrent calls an=
d
> >>>>>>> +     *   relocation.
> >>>>>>> +     *
> >>>>>>> +     * - Implementations may provide additional
> >>>>>>> guarantees, such as working
> >>>>>>> +     *   without holding the reservation lock.
> >>>>>>> +     *
> >>>>>>> +     * This callback is optional.
> >>>>>>> +     *
> >>>>>>> +     * Returns:
> >>>>>>> +     *
> >>>>>>> +     * 0 on success or a negative error code on failure.
> >>>>>>> +     */
> >>>>>>>         int (*vmap)(struct dma_buf *dmabuf, struct dma_buf_map *m=
ap);
> >>>>>>> +
> >>>>>>> +    /**
> >>>>>>> +     * @vunmap:
> >>>>>>> +     *
> >>>>>>> +     * Releases the address previously returned by @vmap.
> >>>>>>> +     *
> >>>>>>> +     * This callback is optional.
> >>>>>>> +     *
> >>>>>>> +     * See also @vmap()
> >>>>>>> +     */
> >>>>>>>         void (*vunmap)(struct dma_buf *dmabuf, struct
> >>>>>>> dma_buf_map *map);
> >>>>>>>     };
> >>>>>>> --
> >>>>>>> 2.29.2
> >>>>>>>
> >>>>>>
> >>>>>
> >>>>> --
> >>>>> Thomas Zimmermann
> >>>>> Graphics Driver Developer
> >>>>> SUSE Software Solutions Germany GmbH
> >>>>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> >>>>> (HRB 36809, AG N=C3=BCrnberg)
> >>>>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
> >>>>>
> >>>>
> >>>>
> >>>>
> >>>>
> >>>
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
