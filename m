Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE93B50D7
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2019 16:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728810AbfIQO5H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Sep 2019 10:57:07 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34010 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728802AbfIQO5H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Sep 2019 10:57:07 -0400
Received: by mail-ot1-f68.google.com with SMTP id z26so3346665oto.1
        for <linux-media@vger.kernel.org>; Tue, 17 Sep 2019 07:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yEUqC1BdDRSydjoXzRp5u4T3tTSHAr18JcLTUznmZ8s=;
        b=dQir1pIxwdHZmxwg4g2Tto5JSCek49AePIRQoZcX6x1NOI7TESdy782K9S7FSFKxWY
         w4Fs4IZyaeXN0CRCNxTMfVCWYaya7AVxfXFdyIj8EIEzb1lAbAVQ9lVLTbVDOdZZWDLA
         EBvDFA34/pLKcPkcmu2nbiXnFOW+V4ccIgwU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yEUqC1BdDRSydjoXzRp5u4T3tTSHAr18JcLTUznmZ8s=;
        b=nl5MrFJL9X8hoi6OFowo6bSWtqQlfOfrCh8ImK412QMxLHKW88HQj1bPfC5EPK0mbP
         ZEHvfUUaGAZnj/7iEoLXvs+4HjUqwUAnqkgAUK3LPjdqmRf3DL4gFGs+nWaFDrVYm6vn
         n1LPyjbi435TsrNwIkNVXMRW4wh5RAEcNuDHz1ldYG/dDVBLh80/QLKe5XmwOybjLc0a
         kWijS6d+MwEFsbWz41M6Cw52vdYvuagqUie3tnYfghUKdqVIDsePEBo//79MT1+qEWsU
         MRXZD/4h2Rv7RmvCBss8aOF/5jKlHjCnBjRF02bsbOcFDxH6q4R2KFJPoTiHQgz2hjWq
         f8Yg==
X-Gm-Message-State: APjAAAV21wTLGiNLaEcaZFzvtrW599E8V69HKYRuRw5u0BZn+lJmm8Vr
        nVCifZZRHr/4HTfw4Ji6B+KbBNwGVjPMxWWQ9wTLHg==
X-Google-Smtp-Source: APXvYqyM6u2l0+8QWgXOGCY1CdZqfESgPaQniqZeXRCDLBV9ExavndEhjnhyt1FL2RiccQ1XsI3oC76hLjhiAaBa9W4=
X-Received: by 2002:a9d:404:: with SMTP id 4mr3177485otc.204.1568732225192;
 Tue, 17 Sep 2019 07:57:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190829142917.13058-1-christian.koenig@amd.com>
 <20190829142917.13058-2-christian.koenig@amd.com> <20190903080522.GM2112@phenom.ffwll.local>
 <cd5acbac-73a4-a51a-4383-2c7517e7c180@gmail.com> <88f748d2-43de-ae2a-b895-40d8b3be5c78@gmail.com>
 <20190917123150.GM3958@phenom.ffwll.local> <da55aa8d-f2b8-0428-ed22-23dc17f71d77@amd.com>
 <20190917131320.GU3958@phenom.ffwll.local> <e0e50037-df08-86e3-e8b2-768683e5cce0@amd.com>
 <20190917134524.GY3958@phenom.ffwll.local> <7de46ca8-8cb5-d545-42ad-6a7cb4cf753a@amd.com>
In-Reply-To: <7de46ca8-8cb5-d545-42ad-6a7cb4cf753a@amd.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 17 Sep 2019 16:56:53 +0200
Message-ID: <CAKMK7uFc6CKyF-dW6FE7Hzdz5La7N265DZu_PR7=rKXFjg4QBw@mail.gmail.com>
Subject: Re: [PATCH 1/4] dma-buf: change DMA-buf locking convention
To:     "Koenig, Christian" <Christian.Koenig@amd.com>
Cc:     "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 17, 2019 at 4:47 PM Koenig, Christian
<Christian.Koenig@amd.com> wrote:
>
> Am 17.09.19 um 15:45 schrieb Daniel Vetter:
> > On Tue, Sep 17, 2019 at 01:24:10PM +0000, Koenig, Christian wrote:
> >> Am 17.09.19 um 15:13 schrieb Daniel Vetter:
> >>> On Tue, Sep 17, 2019 at 12:40:51PM +0000, Koenig, Christian wrote:
> >>>> Am 17.09.19 um 14:31 schrieb Daniel Vetter:
> >>>>> On Mon, Sep 16, 2019 at 02:23:13PM +0200, Christian K=C3=B6nig wrot=
e:
> >>>>>> Ping? Any further comment on this or can't we merge at least the l=
ocking
> >>>>>> change?
> >>>>> I was at plumbers ...
> >>>>>> Christian.
> >>>>>>
> >>>>>> Am 11.09.19 um 12:53 schrieb Christian K=C3=B6nig:
> >>>>>>> Am 03.09.19 um 10:05 schrieb Daniel Vetter:
> >>>>>>>> On Thu, Aug 29, 2019 at 04:29:14PM +0200, Christian K=C3=B6nig w=
rote:
> >>>>>>>>> This patch is a stripped down version of the locking changes
> >>>>>>>>> necessary to support dynamic DMA-buf handling.
> >>>>>>>>>
> >>>>>>>>> For compatibility we cache the DMA-buf mapping as soon as
> >>>>>>>>> exporter/importer disagree on the dynamic handling.
> >>>>>>>>>
> >>>>>>>>> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>>>>>>>> ---
> >>>>>>>>>      drivers/dma-buf/dma-buf.c | 90
> >>>>>>>>> ++++++++++++++++++++++++++++++++++++---
> >>>>>>>>>      include/linux/dma-buf.h   | 51 +++++++++++++++++++++-
> >>>>>>>>>      2 files changed, 133 insertions(+), 8 deletions(-)
> >>>>>>>>>
> >>>>>>>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-bu=
f.c
> >>>>>>>>> index 433d91d710e4..65052d52602b 100644
> >>>>>>>>> --- a/drivers/dma-buf/dma-buf.c
> >>>>>>>>> +++ b/drivers/dma-buf/dma-buf.c
> >>>>>>>>> @@ -525,6 +525,10 @@ struct dma_buf *dma_buf_export(const struc=
t
> >>>>>>>>> dma_buf_export_info *exp_info)
> >>>>>>>>>              return ERR_PTR(-EINVAL);
> >>>>>>>>>          }
> >>>>>>>>>      +    if (WARN_ON(exp_info->ops->cache_sgt_mapping &&
> >>>>>>>>> +            exp_info->ops->dynamic_mapping))
> >>>>>>>>> +        return ERR_PTR(-EINVAL);
> >>>>>>>>> +
> >>>>>>>>>          if (!try_module_get(exp_info->owner))
> >>>>>>>>>              return ERR_PTR(-ENOENT);
> >>>>>>>>>      @@ -645,10 +649,11 @@ void dma_buf_put(struct dma_buf *dma=
buf)
> >>>>>>>>>      EXPORT_SYMBOL_GPL(dma_buf_put);
> >>>>>>>>>        /**
> >>>>>>>>> - * dma_buf_attach - Add the device to dma_buf's attachments
> >>>>>>>>> list; optionally,
> >>>>>>>>> + * dma_buf_dynamic_attach - Add the device to dma_buf's
> >>>>>>>>> attachments list; optionally,
> >>>>>>>>>       * calls attach() of dma_buf_ops to allow device-specific
> >>>>>>>>> attach functionality
> >>>>>>>>> - * @dmabuf:    [in]    buffer to attach device to.
> >>>>>>>>> - * @dev:    [in]    device to be attached.
> >>>>>>>>> + * @dmabuf:        [in]    buffer to attach device to.
> >>>>>>>>> + * @dev:        [in]    device to be attached.
> >>>>>>>>> + * @dynamic_mapping:    [in]    calling convention for map/unm=
ap
> >>>>>>>>>       *
> >>>>>>>>>       * Returns struct dma_buf_attachment pointer for this
> >>>>>>>>> attachment. Attachments
> >>>>>>>>>       * must be cleaned up by calling dma_buf_detach().
> >>>>>>>>> @@ -662,8 +667,9 @@ EXPORT_SYMBOL_GPL(dma_buf_put);
> >>>>>>>>>       * accessible to @dev, and cannot be moved to a more suita=
ble
> >>>>>>>>> place. This is
> >>>>>>>>>       * indicated with the error code -EBUSY.
> >>>>>>>>>       */
> >>>>>>>>> -struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmab=
uf,
> >>>>>>>>> -                      struct device *dev)
> >>>>>>>>> +struct dma_buf_attachment *
> >>>>>>>>> +dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *=
dev,
> >>>>>>>>> +               bool dynamic_mapping)
> >>>>>>>>>      {
> >>>>>>>>>          struct dma_buf_attachment *attach;
> >>>>>>>>>          int ret;
> >>>>>>>>> @@ -677,6 +683,7 @@ struct dma_buf_attachment
> >>>>>>>>> *dma_buf_attach(struct dma_buf *dmabuf,
> >>>>>>>>>            attach->dev =3D dev;
> >>>>>>>>>          attach->dmabuf =3D dmabuf;
> >>>>>>>>> +    attach->dynamic_mapping =3D dynamic_mapping;
> >>>>>>>>>            mutex_lock(&dmabuf->lock);
> >>>>>>>>>      @@ -685,16 +692,64 @@ struct dma_buf_attachment
> >>>>>>>>> *dma_buf_attach(struct dma_buf *dmabuf,
> >>>>>>>>>              if (ret)
> >>>>>>>>>                  goto err_attach;
> >>>>>>>>>          }
> >>>>>>>>> +    dma_resv_lock(dmabuf->resv, NULL);
> >>>>>>>>>          list_add(&attach->node, &dmabuf->attachments);
> >>>>>>>>> +    dma_resv_unlock(dmabuf->resv);
> >>>>>>>>>            mutex_unlock(&dmabuf->lock);
> >>>>>>>>>      +    /* When either the importer or the exporter can't han=
dle dynamic
> >>>>>>>>> +     * mappings we cache the mapping here to avoid issues with=
 the
> >>>>>>>>> +     * reservation object lock.
> >>>>>>>>> +     */
> >>>>>>>>> +    if (dma_buf_attachment_is_dynamic(attach) !=3D
> >>>>>>>>> +        dma_buf_is_dynamic(dmabuf)) {
> >>>>>>>>> +        struct sg_table *sgt;
> >>>>>>>>> +
> >>>>>>>>> +        if (dma_buf_is_dynamic(attach->dmabuf))
> >>>>>>>>> +            dma_resv_lock(attach->dmabuf->resv, NULL);
> >>>>>>>>> +
> >>>>>>>>> +        sgt =3D dmabuf->ops->map_dma_buf(attach, DMA_BIDIRECTI=
ONAL);
> >>>>>>>> Now we're back to enforcing DMA_BIDI, which works nicely around =
the
> >>>>>>>> locking pain, but apparently upsets the arm-soc folks who want t=
o
> >>>>>>>> control
> >>>>>>>> this better.
> >>>>>>> Take another look at dma_buf_map_attachment(), we still try to ge=
t the
> >>>>>>> caching there for ARM.
> >>>>>>>
> >>>>>>> What we do here is to bidirectionally map the buffer to avoid the
> >>>>>>> locking hydra when importer and exporter disagree on locking.
> >>>>>>>
> >>>>>>> So the ARM folks can easily avoid that by switching to dynamic lo=
cking
> >>>>>>> for both.
> >>>>> So you still break the contract between importer and exporter, exce=
pt not
> >>>>> for anything that's run in intel-gfx-ci so all is good?
> >>>> No, the contract between importer and exporter stays exactly the sam=
e it
> >>>> is currently as long as you don't switch to dynamic dma-buf handling=
.
> >>>>
> >>>> There is no functional change for the ARM folks here. The only chang=
e
> >>>> which takes effect is between i915 and amdgpu and that is perfectly
> >>>> covered by intel-gfx-ci.
> >>> There's people who want to run amdgpu on ARM?
> >> Sure there are, we even recently fixed some bugs for this.
> >>
> >> But as far as I know there is no one currently which is affect by this
> >> change on ARM with amdgpu.
> > But don't you break them with this now?
>
> No, we see the bidirectional attachment as compatible with the other ones=
.
>
> > amdgpu will soon set the dynamic flag on exports, which forces the cach=
ing
> > at create time (to avoid the locking fun), which will then result in a
> > EBUSY at map_attachment time because we have a cached mapping, but it's
> > the wrong type.
>
> See the check in dma_buf_map_attachment():
>
>      if (attach->dir !=3D direction && attach->dir !=3D DMA_BIDIRECTIONAL=
)
>          return ERR_PTR(-EBUSY);

Hm, I misread this. So yeah should work, +/- the issue that we might
not flush enough. But I guess that can be fixed whenever, it's not
like dma-api semantics are a great fit for us. Maybe a fixme comment
would be useful here ... I'll look at this tomorrow or so because atm
brain is slow, I'm down with the usual post-conference cold it seems
:-/
-Daniel

>
> Regards,
> Christian.
>
> >
> >>> Also, x86 doesn't have cache
> >>> flushing in the dma-api, so naturally this isn't any issue for us (we
> >>> still have cache flushing in actual hw, but that's a different topic)=
. So
> >>> "works on x86" isn't really a great way to justify what we do here I
> >>> think.
> >> Well it is the exact same caching we previously had as well, so there =
is
> >> absolutely no functional change here except that we now explicitly not=
e
> >> that amdgpu always needs bidirectional mappings.
> >>
> >> I agree that we should get rid of this caching as soon as possible, bu=
t
> >> we should not fix things which where broken before.
> >>
> >> On the other hand adding dma_sg_sync_for_cpu/device sounds like
> >> something we could easily add separately to the caching if you think
> >> that this will help.
> > The current code maybe lacks some cache flushes, but we already require=
 a
> > fixed direction per attachment. So I guess not a real problem, probably=
.
> >
> > But with your patches I think we now fail with EBUSY. Not exactly nice =
...
> > -Daniel
> >
> >> Christian.
> >>
> >>> -Daniel
> >>>
> >>>> Regards,
> >>>> Christian.
> >>>>
> >>>>> The other issue with "we solve this with caching the mapping": Curr=
ently
> >>>>> map/unmap flush (at least on arm, at least on cases where it matter=
s). If
> >>>>> you just return the cached sg, then we don't do the flushing anymor=
e,
> >>>>> which might break importers/exporters in exactly the same way as ju=
st
> >>>>> giving them the wrong mapping. There's zero differences between a B=
IDI,
> >>>>> TO_CPU, or TO_DEVICE mapping, the only places where this matters is=
 for
> >>>>> cache flushing.
> >>>>>
> >>>>> So here's something that could actually work:
> >>>>> - We cache the mapping.
> >>>>> - We cache a bidirectional mapping.
> >>>>> - We put the right dma_sg_sync_for_cpu/device calls in place for ma=
p/unmap
> >>>>>      to give current importers/exporters the same behaviour they're=
 used to
> >>>>>      now.
> >>>>>
> >>>>> And yes the caching we've lifted might have broken something somewh=
ere
> >>>>> already. But generally you only hear about that long time after bec=
ause
> >>>>> arm vendors roll forward once every few years. Or something like th=
at.
> >>>>> -Daniel
> >>>>>
> >>>>>>> Regards,
> >>>>>>> Christian.
> >>>>>>>
> >>>>>>>> That's why your previous version moved the caching into
> >>>>>>>> map/unmap_sg, which resurrected the locking hydra.
> >>>>>>>>
> >>>>>>>> I think we're going a bit in circles here, and I don't have a go=
od idea
> >>>>>>>> either :-/
> >>>>>>>> -Daniel
> >>>>>>>>
> >>>>>>>>
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
